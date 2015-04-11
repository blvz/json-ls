# json-ls

LiveScript Flavoured JSON

Status: Early proof of concept.

```LiveScript
  require! <[ fs json-ls ]>

  err, buf <- fs.read-file
  console.error that if err
  console.log json-ls.stringify JSON.parse buf.to-string!
```

# License

MIT
