assert   = require 'assert'
vows     = require 'vows'
echonest = require '../../lib/echonest'
util = require '../util'

checkErrors = util.checkErrors

vows.describe('song methods').addBatch({
  'when using echonest':
    topic: new echonest.Echonest
    "to search for soul to squeeze":
      topic: (nest) ->
        nest.song.search {
          title: 'soul to squeeze'
        }, @callback
      'we get a rhcp song': (err, data) ->
        rhcp_songs = (song.artist_name for song in data.songs)
        assert.include rhcp_songs, 'Red Hot Chili Peppers'
      'we see no errors': checkErrors
    "to get profile for paula abdul's straight up":
      topic: (nest) ->
        nest.song.profile {
          id: 'SOTIWAP12A8C13BA56'
          bucket: 'artist_familiarity'
        }, @callback
      'she is familiar': (err, data) ->
        familiarity = data.songs[0].artist_familiarity
        assert familiarity > 0.5
      'we see no errors': checkErrors
}).export module
