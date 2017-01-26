class Logotype
  constructor: (@html) ->
  @texts: []
  @probs: []
  @add: (x, y) -> @probs.push y; @texts.push x
  @write_random = () ->
    rand = Math.random()
    @texts.find( (k, i) -> rand < Logotype.probs[i] )

# fill Logotypes array
arr = [
  #["01111001 01100101 01100010 " +
  #  "<span id='logo-colored'>01101111 01101111</span>" +
  #  " 01100100", 0.2],
  ["yeb<div id='oo_dropping'><span id='oo_infinity'>o</span>o</div>d", 0.3],
  ["γeb<div id='oo_dropping'><span id='oo_infinity'>o</span>o</div>d", 0.4],
  ["yeb<span id='logo-colored'><span id='oo_infinity'>o</span>o</span>d", 0.5],
  ["γeb<span id='logo-colored'><span id='oo_infinity'>o</span>o</span>d", 0.6],
  ["γeβ<span id='logo-colored'><span id='oo_infinity'>o</span>o</span>d", 0.7],
  ["yeb<span id='logo-colored'>oo</span>d", 1]
]
for x in arr
  Logotype.add x[0], x[1]

$(document).ready ->
  $('#logo').html Logotype.write_random()