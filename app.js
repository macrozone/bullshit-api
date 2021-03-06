// Generated by CoffeeScript 1.7.1
(function() {
  var app, express, getBullshit, jquery, jsdom;

  jquery = require('jquery');

  jsdom = require('jsdom');

  express = require('express');

  app = express();

  app.get('/', function(req, res) {
    var number, _ref;
    number = ((_ref = req.query) != null ? _ref.number : void 0) || 1;
    return getBullshit(number, function(errors, result) {
      if (errors == null) {
        return res.status(200).send(result);
      } else {
        return res.status(500).send("error");
      }
    });
  });

  app.listen(process.env.PORT || 3000);

  getBullshit = function(number, done) {
    return jsdom.env('http://cbsg.sourceforge.net/cgi-bin/live', function(errors, window) {
      var $, line, result;
      if (errors == null) {
        $ = jquery(window);
        result = ((function() {
          var _i, _len, _ref, _results;
          _ref = $("li").slice(0, number);
          _results = [];
          for (_i = 0, _len = _ref.length; _i < _len; _i++) {
            line = _ref[_i];
            _results.push($(line).text());
          }
          return _results;
        })()).join("\n\n");
        return done(null, result);
      } else {
        return done(errors, null);
      }
    });
  };

}).call(this);
