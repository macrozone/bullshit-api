jquery = require 'jquery'
jsdom = require 'jsdom'

http = require 'http'

number = 1


http.createServer (req, res) ->
	getBullshit 1, (errors, result) ->

		unless errors?
			res.writeHead 200, 'Content-Type': 'text/plain'
			res.end result
		else
			res.writeHead 500
.listen process.env.PORT || 3000

getBullshit = (number, done) ->

	jsdom.env 'http://cbsg.sourceforge.net/cgi-bin/live', (errors, window) ->
		
		unless errors?
			$ = jquery window
			done null, $("li").slice(0,number).text()
		else 
			done errors, null
