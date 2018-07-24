# combine.moon

## About
Combine is a Moonscript / Lua module that performs a similar function to Javascript's [Object.assign()](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/assign).

Combine iteratively merges tables by key-value pairs, copying the values of each table to the previous.

## Setup
### Using Moonscript
Include combine.moon in your project.

Import using
```moonscript
import combine from require "combine"
```

### Using Lua
Include combine.lua in your project.

Import using
```lua
local combine = ("combine").combine
```


## Usage
```moonscript
-- Import the function
import combine from require "combine"

-- Data tables
first = {
  name: "Iko"
  age: 21
}

second = {
  name: "Clover"
  height: 185.4
}

-- Combine with deep copy
-- Does not mutate "first"
result = combine {}, first, second 

--result = {name: "Clover", age: 21, height: 185.4}
p result

-- Combine without copy
-- Mutates "first"
combine first, second

--first = {name: "Clover", age: 21, height: 185.4}
p first
```

## Resources
Javascript equivalent: [Object.assign()](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/assign)

[Moonscript](https://moonscript.org/)

Unit tests with [busted](http://olivinelabs.com/busted/)