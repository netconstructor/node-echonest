assert   = require 'assert'
vows     = require 'vows'
async = require 'async'
echonest = require '../../lib/echonest'
util = require '../util'

checkErrors = util.checkErrors

vows.describe('artist methods').addBatch({
  'when using echonest':
    topic: new echonest.Echonest
    "to search for spin doctors biographies":
      topic: (nest) ->
        nest.artist.biographies {
          name: 'spin doctors'
        }, @callback
      'the first result mentions New York': (err, data) ->
        bioText = data.biographies[0].text
        assert.include bioText, 'New York'
      'we see no errors': checkErrors
    "to search for blog posts about behold the arctopus":
      topic: (nest) ->
        nest.artist.blogs {
          name: 'behold... the arctopus'
        }, @callback
      'the first result has a url': (err, data) ->
        firstURL = data.blogs[0].url
        assert.include firstURL, 'http'
      'we see no errors': checkErrors
    "to search for familiarity of behold the arctopus and paula abdul":
      topic: (nest) ->
        async.parallel({
          behold: (callback) -> nest.artist.familiarity {
            name: 'behold... the arctopus'
          }, callback
          paula: (callback) -> nest.artist.familiarity {
            name: 'paula abdul'
          }, callback
        }, @callback)
      'behold is less familiar than paula': (err, results) ->
        beholdFamiliarity = results.behold.artist.familiarity
        paulaFamiliarity = results.paula.artist.familiarity
        assert beholdFamiliarity < paulaFamiliarity
      'we see no errors': (err, results) ->
        checkErrors(err, results['paula'])
        checkErrors(err, results['behold'])
}).export(module)
