fs = require("promised-io/fs")
assert   = require 'assert'
async   = require 'async'
vows     = require 'vows'
echonest = require '../../lib/echonest'
util = require '../util'

checkErrors = util.checkErrors

koenjiFilename = 'test/data/koenjihyakkei-mederro-passquirr-sample-supercompressed.mp3'

vows.describe('POST methods').addBatch({
  'when using echonest':
    topic: new echonest.Echonest
    "to post a koenjihyakkei tune to /track/upload":
      topic: (nest) ->
        fs.readFile(koenjiFilename).then (filebuffer) =>
          nest.track.upload {
            track: {data: filebuffer}, filetype: 'mp3'
          }, @callback
        undefined # async topics must return undefined
      'it is correctly identified': (err, data) ->
        assert.include data.track.artist, 'Koenji'
        assert.include data.track.title, 'Mederro'
      'we see no errors': checkErrors
}).export module
