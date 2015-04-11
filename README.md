# json-ls

[![Build Status](https://travis-ci.org/blvz/json-ls.svg?branch=master)](https://travis-ci.org/blvz/json-ls)

LiveScript Flavoured JSON

Status: Early proof of concept.

```LiveScript
  require! <[ fs json-ls ]>

  err, buf <- fs.read-file 'package.json'
  return console.error that if err
  console.log json-ls.stringify JSON.parse buf.to-string!
```

# License

MIT
