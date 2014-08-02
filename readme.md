# pdfconcat

Concat multiple pdfs using `pdfunite` in node.js. This module is a wrapper around the `pdfunite` command from [Poppler](http://poppler.freedesktop.org).

## Installation

	npm install pdfconcat
	
## Requirements

[Poppler](http://poppler.freedesktop.org) must be installed on your system. Make sure the command `pdfunite` is working.
	
## Usage

```coffee
pdfconcat = require 'pdfconcat'

pdfconcat ['input_1.pdf', 'input_2.pdf'], 'output.pdf', (err) ->

	# Your Code
```

