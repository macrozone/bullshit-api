jquery = require 'jquery'
jsdom = require 'jsdom'

express = require 'express'
app = express()



app.get '/', (req, res) ->
	number =  req.query?.number || 1

	getBullshit number, (errors, result) ->

		unless errors?
			res.status(200).send result
		else
			res.status(500).send "error"
app.listen process.env.PORT || 3000

getBullshit = (number, done) ->

	jsdom.env 'http://cbsg.sourceforge.net/cgi-bin/live', (errors, window) ->
		
		unless errors?
			$ = jquery window
			
			result = ($(line).text() for line in $("li").slice(0,number)).join "\n\n"
			
			done null, result
		else 
			done errors, null
