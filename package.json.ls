name: 'json-ls'
version: '0.0.2'
description: 'LiveScript Flavoured JSON'
homepage: 'https://github.com/blvz/json-ls'
author: 'Rafael Belvederese'
license: 'MIT'

keywords: <[ livescript json ls lson cson stringify ]>
repository:
  type: 'git'
  url: 'https://github.com/blvz/json-ls.git'
bugs:
  url: 'https://github.com/blvz/json-ls/issues'

main: 'lib'

scripts:
  test: 'make test'

dependencies:
  'prelude-ls': '^1.1.1'

dev-dependencies:
  LiveScript: '^1.3.1'
  mocha: '^2.2.4'
  chai: '^2.2.0'
