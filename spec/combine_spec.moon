import combine, cmb, cmbi from require "src/combine"
require "moon.all"

describe 'combine', ->
  it 'is nil for 0 args', ->
    assert.falsy combine!
  
  it 'returns identity for 1 arg', ->
    t = {name: "Joe", age: 43}
    assert.equal t, combine t
  
  it 'mutates the first table', ->
    t1 = {name: "Joe", age: 43}
    t2 = {name: "Bob"}
    combine t1, t2
    assert.same {name: "Bob", age: 43}, t1

  it 'deep copies to an empty table', ->
    t1 = {name: "Joe", age: 43}
    t2 = {name: "Bob"}
    result = combine {}, t1, t2
    assert.same {name: "Bob", age: 43}, result
    assert.same {name: "Joe", age: 43}, t1
  
  it 'adds non-table arguments', ->
    t1 = {name: "Joe", 43}
    t2 = "Hello"
    t3 = "World"
    assert.same {name: "Joe", 43, "Hello", "World"}, combine(t1, t2, t3)

describe 'cmb', ->
  it 'combines and mutates', ->
    t1 = {name: "Joe", age: 43}
    t2 = {name: "Bob"}
    cmb t1, t2
    assert.same {name: "Bob", age: 43}, t1

describe 'cmbi', ->
  it 'combines and does not mutate', ->
    t1 = {name: "Joe", age: 43}
    t2 = {name: "Bob"}
    result = cmbi {}, t1, t2
    assert.same {name: "Bob", age: 43}, result
    assert.same {name: "Joe", age: 43}, t1