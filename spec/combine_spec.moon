import combine from require "combine"

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
  
  it 'fails for non-table arguments', ->
    t1 = {name: "Joe", age: 43}
    t2 = "Hello"
    assert.has_error(-> combine t1, t2)