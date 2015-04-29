require! {
  fs
  '../lib': { stringify }
  chai: { assert: { equal } }
}

describe 'stringify' ->
  test 'string' ->
    equal '\'a \\\'string\\\' you say\'' stringify 'a \'string\' you say'

  test 'number' ->
    equal '3.69' stringify 3.69

  test 'numeric array' ->
    equal '[ 0 1 2 3 ]' stringify [ 0 1 2 3 ]

  test 'string array' ->
    equal '<[ array of strings ]>' stringify <[ array of strings ]>

  test 'object array' ->
    equal '''
      object-array:
        * id: 0
          name: 'zero'
        * id: 1
          name: 'one'
        * id: 2
          name: 'two'
    ''' stringify do
      object-array:
        * id: 0
          name: 'zero'
        * id: 1
          name: 'one'
        * id: 2
          name: 'two'

  test 'object' ->
    equal '''
      id: 0
      name: 'zero'
    ''' stringify do
      id: 0
      name: 'zero'

  test 'nested objects' ->
    equal '''
      id: 0
      name: 'zero'
      nested:
        id: 1
        name: 'one'
        nested:
          id: 2
          name: 'three'
    ''' stringify do
      id: 0
      name: 'zero'
      nested:
        id: 1
        name: 'one'
        nested:
          id: 2
          name: 'three'

  test 'complex' ->
    equal '''
      string: 'value'
      boolean: true
      object-array:
        * id: 0
          name: 'zero'
        * id: 1
          name: 'one'
        * id: 2
          name: 'two'
        * id: 3
          nested:
            'object 1': 1
            object2: 2
            object3: 3
            arrays: [
              [ false true ]
              [ true false ]
              <[ one two three ]>
              [
                * id: 0
                * id: 1
              ]
            ]
      string-array: <[ like a boss ]>
      numeric-array: [ 1 2 3 4 ]
    ''' stringify do
      string: 'value'
      boolean: true
      object-array:
        * id: 0
          name: 'zero'
        * id: 1
          name: 'one'
        * id: 2
          name: 'two'
        * id: 3
          nested:
            'object 1': 1
            object2: 2
            object3: 3
            arrays: [
              [ off on ]
              [ on off ]
              <[ one two three ]>
              [
                * id: 0
                * id: 1
              ]
            ]
      string-array: <[ like a boss ]>
      numeric-array: [ 1 2 3 4 ]

  test 'special keys' ->
    equal '''
      'str-id': '0'
      'its name': 'zero'
    ''' stringify do
      'str-id': '0'
      'its name': 'zero'
