echonest.js
=============

A node.js client for the [Echonest API](http://developer.echonest.com/docs/v4/).

Installation
------------

To use it with node:

    npm install echonest

### example usage in javascript

    echonest = require('echonest');
    var myNest = new echonest.Echonest();

    myNest.artist.familiarity({
        name: 'portishead'
    }, function (error, response) {
        if (error) {
            console.log(error, response);
        } else {
            console.log('familiarity:', response.artist.familiarity);
            // see the whole response
            console.log('response:', response);
        }
    });

output:

    familiarity: 0.8310873556337086
    response: { status: { version: '4.2', code: 0, message: 'Success' },
        artist: 
    { familiarity: 0.8310873556337086,
            id: 'ARJVTD81187FB51621',
            name: 'Portishead' } }

The tests touch every API endpoint--including [/track/upload](http://developer.echonest.com/docs/v4/track.html#upload)--so [see them](https://github.com/badamson/node-echonest/tree/master/test/v4) for real examples. They're in [coffeescript](http://coffeescript.org/). You'll also need to visit the [Echonest API Documentation](http://developer.echonest.com/docs/v4) to see what parameters each method accepts and what to expect in the response.

There's some pretty neat stuff in [playlist generation](http://developer.echonest.com/docs/v4/playlist.html#static) (echonest is used by Spotify radio) and [song search](http://developer.echonest.com/docs/v4/song.html#search).

Contributing
------------

* clone
* install dev dependencies -- `npm install`
* install [rake](http://rubygems.org/gems/rake)
* run the tests -- `rake test`

The echonest.js file distributed by npm is generated, and not checked into the repository. To see it, run `rake build`.
