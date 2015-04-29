require! {
  'prelude-ls': { all, is-type, unwords, dasherize }
}

level  = -1
objarr = no
parent = null

export
  function stringify obj
    level  := -1
    objarr := no
    parent := null

    stringify-it ...

function stringify-it obj
  switch typeof! obj
  | \Boolean => stringify-val ...
  | \Number  => stringify-val ...
  | \Array   => stringify-ls ...
  | \Object  => stringify-obj ...
  | \String  => stringify-str ...

function spc => if ~level then ' ' else ''
function brk => if ~level then '\n' else ''
function idt
  if objarr
    objarr := no
    ('  ' * (level - 1)) + '* '
  else
    '  ' * level

function str => "'#{it.replace /'/g '\\\''}'"
function stringify-str => spc! + str ...
function stringify-val => spc! + "#it"

function stringify-obj
  s = brk!
  ++level
  parent := \Object
  s += [ "#{idt!}#{stringify-key key}:#{stringify-it value}" \
          for key, value of it ] * '\n'
  --level
  s

function stringify-ls
  switch
  | all (is-type \String)  <| it => stringify-ls-str ...
  | all (is-type \Array)   <| it => stringify-ls-ls ...
  | all (is-type \Object)  <| it => stringify-ls-obj ...
  | all (is-type \Number)  <| it => stringify-ls-val ...
  | all (is-type \Boolean) <| it => stringify-ls-val ...

function stringify-ls-val => spc! + "[ #{unwords it} ]"
function stringify-ls-str => spc! + "<[ #{unwords it} ]>"

function stringify-ls-obj
  pa = parent is \Array
  ++level
  parent := \Array
  s = [ stringify-it x for x, i in it when objarr := yes ] * ''
  --level
  if pa then " [#s\n#{idt!}]" else s

function stringify-ls-ls
  s = ' ['
  ++level
  parent := \Array
  p = (p = (brk! + idt!)).substr 0 p.length - 1
  s += [ p + stringify-it x for x, i in it ] * ''
  --level
  s += '\n' + idt! + ']'
  s

function stringify-key
  switch
  | it is /^\d|[\s\.\-]+/ => str it
  | it is /^[a-z]+/       => dasherize it
  | otherwise             => it
