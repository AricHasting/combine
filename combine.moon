-- "moon.all".fold()
--Copyright (C) 2017 by Leaf Corcoran
--Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
--The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
--THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

fold = (items, fn)->
  len = #items
  if len > 1
    accum = fn items[1], items[2]
    for i=3,len
      accum = fn accum, items[i]
    accum
  else
    items[1]

-- END LICENSE --

-- combine(...)
--Copyright 2018 Aric Hasting
--Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
--The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
--THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

combine = (...) ->
  args = {...}
  -- Nil if there are no arguments
  if #args == 0
    return

  -- Return first value if only one argument
  if #args == 1
    return args[1]

  -- Fold all table key/values into the previous
  return fold args, (a, b) ->
    for key, val in pairs b
      a[key] = val
    return a

cmb = (...) ->
  combine ...

cmbi = (...) ->
  combine {}, ...

{:combine, :cmb, :cmbi}
