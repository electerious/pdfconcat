fs		= require 'fs'
process	= require 'child_process'

escapeshell = (cmd) ->

	return '"' + cmd.replace(/(["\s'$`\\])/g,'\\$1') + '"';

module.exports = (input, output, callback) ->

	inputStr = ''

	# Catch missing parameter
	if	not input? or
		not output? or
		not callback? or
		input.length is 0 or
		output.length is 0

			err = new Error 'Missing parameter'
			callback err
			return false


	# Catch wrong type for input
	if not Array.isArray(input)

		err = new Error 'Parameter `input` must be an Array'
		callback err
		return false

	# Array to String
	input.forEach (item) ->

		# Escape for shell
		inputStr += escapeshell(item) + ' '

	# Run pdfunite
	pdfunite = process.exec "pdfunite #{ inputStr } #{ output }", (err, stdout, stderr) ->

		if err?

			callback err
			return false

	# Catch exit
	pdfunite.on 'exit', (code) ->

		# Only when successfull
		# Callback already called on error in process.exec
		if code is 0

			callback null
			return true