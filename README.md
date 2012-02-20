echonest.js
=============

A node.js client for the [Echonest API](http://developer.echonest.com/docs/v4/)

Installation
------------

To use it with node:

    npm install echonest

### example usage in javascript

    echonest = require('echonest');
    var myNest = new echonest.Echonest();

    myNest.song.search({
        title: 'biscuit',
        artist: 'portishead'
    }, function (error, response) {
        if (error) console.log(error);
        console.log(response);
    });

output:

    { status: { version: '4.2', code: 0, message: 'Success' },
      songs: 
       [ { artist_id: 'ARJVTD81187FB51621',
           id: 'SOSYJJL12B0B80B28D',
           artist_name: 'Portishead',
           title: 'Biscuit' } ] }

### example usage in coffeescript

    echonest = require 'echonest'
    myNest = new echonest.Echonest

    myNest.song.search {
        title: 'biscuit',
        artist: 'portishead'
    }, (error, response) ->
        if error
          console.log error
        console.log response

The tests touch every API endpoint (not true yet!), so [see them](https://github.com/badamson/node-echonest/tree/master/test/v4) for more.

Contributing
------------

* clone
* install dev dependencies -- `npm install`
* install [rake](http://rubygems.org/gems/rake)
* run the tests -- `rake test`
