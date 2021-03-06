// Generated by LiveScript 1.3.1
var ref$, all, isType, unwords, dasherize, level, objarr, parent, out$ = typeof exports != 'undefined' && exports || this, toString$ = {}.toString;
ref$ = require('prelude-ls'), all = ref$.all, isType = ref$.isType, unwords = ref$.unwords, dasherize = ref$.dasherize;
level = -1;
objarr = false;
parent = null;
out$.stringify = stringify;
function stringify(obj){
  level = -1;
  objarr = false;
  parent = null;
  return stringifyIt.apply(this, arguments);
}
function stringifyIt(obj){
  switch (toString$.call(obj).slice(8, -1)) {
  case 'Boolean':
    return stringifyVal.apply(this, arguments);
  case 'Number':
    return stringifyVal.apply(this, arguments);
  case 'Array':
    return stringifyLs.apply(this, arguments);
  case 'Object':
    return stringifyObj.apply(this, arguments);
  case 'String':
    return stringifyStr.apply(this, arguments);
  }
}
function spc(){
  if (~level) {
    return ' ';
  } else {
    return '';
  }
}
function brk(){
  if (~level) {
    return '\n';
  } else {
    return '';
  }
}
function idt(){
  if (objarr) {
    objarr = false;
    return repeatString$('  ', level - 1) + '* ';
  } else {
    return repeatString$('  ', level);
  }
}
function str(it){
  return "'" + it.replace(/'/g, '\\\'') + "'";
}
function stringifyStr(){
  return spc() + str.apply(this, arguments);
}
function stringifyVal(it){
  return spc() + (it + "");
}
function stringifyObj(it){
  var s, key, value;
  s = brk();
  ++level;
  parent = 'Object';
  s += (function(){
    var ref$, results$ = [];
    for (key in ref$ = it) {
      value = ref$[key];
      results$.push(idt() + "" + stringifyKey(key) + ":" + stringifyIt(value));
    }
    return results$;
  }()).join('\n');
  --level;
  return s;
}
function stringifyLs(it){
  switch (false) {
  case !all(isType('String'))(it):
    return stringifyLsStr.apply(this, arguments);
  case !all(isType('Array'))(it):
    return stringifyLsLs.apply(this, arguments);
  case !all(isType('Object'))(it):
    return stringifyLsObj.apply(this, arguments);
  case !all(isType('Number'))(it):
    return stringifyLsVal.apply(this, arguments);
  case !all(isType('Boolean'))(it):
    return stringifyLsVal.apply(this, arguments);
  }
}
function stringifyLsVal(it){
  return spc() + ("[ " + unwords(it) + " ]");
}
function stringifyLsStr(it){
  return spc() + ("<[ " + unwords(it) + " ]>");
}
function stringifyLsObj(it){
  var pa, s, i, x;
  pa = parent === 'Array';
  ++level;
  parent = 'Array';
  s = (function(){
    var i$, ref$, len$, results$ = [];
    for (i$ = 0, len$ = (ref$ = it).length; i$ < len$; ++i$) {
      i = i$;
      x = ref$[i$];
      if (objarr = true) {
        results$.push(stringifyIt(x));
      }
    }
    return results$;
  }()).join('');
  --level;
  if (pa) {
    return " [" + s + "\n" + idt() + "]";
  } else {
    return s;
  }
}
function stringifyLsLs(it){
  var s, p, i, x;
  s = ' [';
  ++level;
  parent = 'Array';
  p = (p = brk() + idt()).substr(0, p.length - 1);
  s += (function(){
    var i$, ref$, len$, results$ = [];
    for (i$ = 0, len$ = (ref$ = it).length; i$ < len$; ++i$) {
      i = i$;
      x = ref$[i$];
      results$.push(p + stringifyIt(x));
    }
    return results$;
  }()).join('');
  --level;
  s += '\n' + idt() + ']';
  return s;
}
function stringifyKey(it){
  switch (false) {
  case !/^\d|[\s\.\-]+/.test(it):
    return str(it);
  case !/^[a-z]+/.test(it):
    return dasherize(it);
  default:
    return it;
  }
}
function repeatString$(str, n){
  for (var r = ''; n > 0; (n >>= 1) && (str += str)) if (n & 1) r += str;
  return r;
}