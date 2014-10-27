jquery = require 'jquery'
jsdom = require 'jsdom'


number = 1
jsdom.env 'http://cbsg.sourceforge.net/cgi-bin/live', (errors, window) ->
		
		unless errors?
			$ = jquery window
			console.log $("li").slice(0,number).text()

