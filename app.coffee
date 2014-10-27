jquery = require 'jquery'
jsdom = require 'jsdom'

express = require 'express'
app = express()
number = 1


app.get '/', (req, res) ->
	getBullshit 1, (errors, result) ->

		unless errors?
			res.status(200).send result
		else
			res.status(500).send "error"
app.listen process.env.PORT || 3000

getBullshit = (number, done) ->

	jsdom.env 'http://cbsg.sourceforge.net/cgi-bin/live', (errors, window) ->
		
		unless errors?
			$ = jquery window
			done null, $("li").slice(0,number).text()
		else 
			done errors, null
