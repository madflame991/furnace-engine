define [], ->
  colorBindings =
    '1': 'rgb(255, 255, 255)'
    '2': 'rgb(0, 0, 0)'
    '.': 'rgba(0, 0, 0, 0)'

  spritesByName =
    '0': '''
....11111112....
..112......112..
..112......112..
..112......112..
..112......112..
..112......112..
..112....11112..
..112.1112.112..
..11112....112..
..112......112..
..112......112..
..112......112..
..112......112..
..112......112..
..112......112..
....11111112....
	'''
    'A': '''
....11111112....
..112......112..
..112......112..
..112......112..
..112......112..
..112......112..
..112......112..
..111111111112..
..112......112..
..112......112..
..112......112..
..112......112..
..112......112..
..112......112..
..112......112..
..112......112..
	'''
    'N': '''
.112.........112
.112.........112
.11112.......112
.112.112.....112
.112...112...112
.112.....112.112
.112.......11112
.112.........112
.112.........112
.112.........112
.112.........112
.112.........112
.112.........112
.112.........112
.112.........112
.112.........112
	'''
    '1': '''
.......112......
.......112......
.......112......
.......112......
.......112......
.......112......
.......112......
.......112......
.......112......
.......112......
.......112......
.......112......
.......112......
.......112......
.......112......
.......112......
	'''
    'B': '''
..1111111112....
..112......112..
..112......112..
..112......112..
..112......112..
..112......112..
..112......112..
..1111111112....
..112......112..
..112......112..
..112......112..
..112......112..
..112......112..
..112......112..
..112......112..
..1111111112....
	'''
    'O': '''
....11111112....
..112......112..
..112......112..
..112......112..
..112......112..
..112......112..
..112......112..
..112......112..
..112......112..
..112......112..
..112......112..
..112......112..
..112......112..
..112......112..
..112......112..
....11111112....
	'''
    '2': '''
....11111112....
..112......112..
..112......112..
...........112..
...........112..
...........112..
...........112..
....11111112....
..112...........
..112...........
..112...........
..112...........
..112...........
..112...........
..112...........
..111111111112..
	'''
    'C': '''
....11111112....
..112......112..
..112......112..
..112...........
..112...........
..112...........
..112...........
..112...........
..112...........
..112...........
..112...........
..112...........
..112...........
..112......112..
..112......112..
....11111112....
	'''
    'P': '''
..1111111112....
..112......112..
..112......112..
..112......112..
..112......112..
..112......112..
..112......112..
..1111111112....
..112...........
..112...........
..112...........
..112...........
..112...........
..112...........
..112...........
..112...........
	'''
    '3': '''
....11111112....
..112......112..
..112......112..
...........112..
...........112..
...........112..
...........112..
.......11112....
...........112..
...........112..
...........112..
...........112..
...........112..
..112......112..
..112......112..
....11111112....
	'''
    'D': '''
..1111111112....
..112......112..
..112......112..
..112......112..
..112......112..
..112......112..
..112......112..
..112......112..
..112......112..
..112......112..
..112......112..
..112......112..
..112......112..
..112......112..
..112......112..
..1111111112....
	'''
    'Q': '''
....11111112....
..112......112..
..112......112..
..112......112..
..112......112..
..112......112..
..112......112..
..112......112..
..112......112..
..112......112..
..112......112..
..112..112.112..
..112....11112..
..112......112..
..112......112..
....11111112....
	'''
    '4': '''
..112......112..
..112......112..
..112......112..
..112......112..
..112......112..
..112......112..
..112......112..
..111111111112..
...........112..
...........112..
...........112..
...........112..
...........112..
...........112..
...........112..
...........112..
	'''
    'E': '''
..111111111112..
..112...........
..112...........
..112...........
..112...........
..112...........
..112...........
..1111111112....
..112...........
..112...........
..112...........
..112...........
..112...........
..112...........
..112...........
..111111111112..
	'''
    'R': '''
..1111111112....
..112......112..
..112......112..
..112......112..
..112......112..
..112......112..
..112......112..
..1111111112....
..112......112..
..112......112..
..112......112..
..112......112..
..112......112..
..112......112..
..112......112..
..112......112..
	'''
    '5': '''
..111111111112..
..112...........
..112...........
..112...........
..112...........
..112...........
..112...........
..1111111112....
...........112..
...........112..
...........112..
...........112..
...........112..
..112......112..
..112......112..
....11111112....
	'''
    'F': '''
..111111111112..
..112...........
..112...........
..112...........
..112...........
..112...........
..112...........
..1111111112....
..112...........
..112...........
..112...........
..112...........
..112...........
..112...........
..112...........
..112...........
	'''
    'S': '''
....11111112....
..112......112..
..112......112..
..112...........
..112...........
..112...........
..112...........
....11111112....
...........112..
...........112..
...........112..
...........112..
...........112..
..112......112..
..112......112..
....11111112....
	'''
    '6': '''
....11111112....
..112......112..
..112......112..
..112...........
..112...........
..112...........
..112...........
..111111111.....
..112......112..
..112......112..
..112......112..
..112......112..
..112......112..
..112......112..
..112......112..
....11111112....
	'''
    'G': '''
....11111112....
..112......112..
..112......112..
..112...........
..112...........
..112...........
..112...........
..112...........
..112...........
..112...........
..112...111112..
..112......112..
..112......112..
..112......112..
..112......112..
....11111112....
	'''
    'T': '''
..1111111111112.
.......112......
.......112......
.......112......
.......112......
.......112......
.......112......
.......112......
.......112......
.......112......
.......112......
.......112......
.......112......
.......112......
.......112......
.......112......
	'''
    '7': '''
..111111111112..
...........112..
...........112..
...........112..
...........112..
...........112..
...........112..
...........112..
...........112..
...........112..
...........112..
...........112..
...........112..
...........112..
...........112..
...........112..
	'''
    'H': '''
..112......112..
..112......112..
..112......112..
..112......112..
..112......112..
..112......112..
..112......112..
..111111111112..
..112......112..
..112......112..
..112......112..
..112......112..
..112......112..
..112......112..
..112......112..
..112......112..
	'''
    'U': '''
..112......112..
..112......112..
..112......112..
..112......112..
..112......112..
..112......112..
..112......112..
..112......112..
..112......112..
..112......112..
..112......112..
..112......112..
..112......112..
..112......112..
..112......112..
....11111112....
	'''
    '8': '''
....11111112....
..112......112..
..112......112..
..112......112..
..112......112..
..112......112..
..112......112..
....11111112....
..112......112..
..112......112..
..112......112..
..112......112..
..112......112..
..112......112..
..112......112..
....11111112....
	'''
    'I': '''
.....1111112....
.......112......
.......112......
.......112......
.......112......
.......112......
.......112......
.......112......
.......112......
.......112......
.......112......
.......112......
.......112......
.......112......
.......112......
.....1111112....
	'''
    'V': '''
.112.........112
.112.........112
.112.........112
.112.........112
.112.........112
.112.........112
.112.........112
...112.....112..
...112.....112..
...112.....112..
.....112.112....
.....112.112....
.....112.112....
.......112......
.......112......
.......112......
	'''
    '9': '''
....11111112....
..112......112..
..112......112..
..112......112..
..112......112..
..112......112..
..112......112..
....1111111112..
...........112..
...........112..
...........112..
...........112..
...........112..
..112......112..
..112......112..
....11111112....
	'''
    'J': '''
..........112...
..........112...
..........112...
..........112...
..........112...
..........112...
..........112...
..........112...
..........112...
..........112...
..........112...
..........112...
..........112...
....112...112...
....112...112...
......11112.....
	'''
    'W': '''
.112.........112
.112.........112
.112.........112
.112.........112
.112.........112
.112.........112
.112.........112
.112.........112
.112.........112
.112.........112
.112.........112
.112...112...112
.112.112.112.112
.11112.....11112
.112.........112
.112.........112
	'''
    '.': '''
................
................
................
................
................
................
................
................
................
................
................
................
................
................
.......112......
.......112......
	'''
    'K': '''
..112......112..
..112......112..
..112......112..
..112......112..
..112......112..
..112......112..
..112....112....
..11111112......
..112....112....
..112......112..
..112......112..
..112......112..
..112......112..
..112......112..
..112......112..
..112......112..
	'''
    'X': '''
.112.........112
.112.........112
.112.........112
...112.....112..
...112.....112..
.....112.112....
.....112.112....
.......112......
.......112......
.....112.112....
.....112.112....
...112.....112..
...112.....112..
.112.........112
.112.........112
.112.........112
	'''
    '!': '''
.......112......
.......112......
.......112......
.......112......
.......112......
.......112......
.......112......
.......112......
.......112......
.......112......
.......112......
.......112......
................
................
.......112......
.......112......
	'''
    'L': '''
..112...........
..112...........
..112...........
..112...........
..112...........
..112...........
..112...........
..112...........
..112...........
..112...........
..112...........
..112...........
..112...........
..112...........
..112...........
..111111111112..
	'''
    'Y': '''
.112.........112
.112.........112
.112.........112
...112.....112..
...112.....112..
...112.....112..
.....112.112....
.....112.112....
.....112.112....
.......112......
.......112......
.......112......
.......112......
.......112......
.......112......
.......112......
	'''
    '?': '''
....11111112....
..112......112..
..112......112..
..112......112..
...........112..
...........112..
...........112..
.........112....
.......112......
.......112......
.......112......
.......112......
................
................
.......112......
.......112......
	'''
    'M': '''
.112.........112
.112.........112
.11112.....11112
.112.112.112.112
.112...112...112
.112.........112
.112.........112
.112.........112
.112.........112
.112.........112
.112.........112
.112.........112
.112.........112
.112.........112
.112.........112
.112.........112
	'''
    'Z': '''
...11111111112..
...........112..
...........112..
...........112..
.........112....
.........112....
.........112....
.......112......
.......112......
.......112......
.....112........
.....112........
.....112........
...112..........
...112..........
...11111111112..
  '''

  convert = (stringedSprites) ->
    ret = {}
    for key, sprite of stringedSprites
      ret[key] = sprite.split('\n').map (line) -> { s: line }

    ret

  {
    colorBindings: colorBindings
    spritesByName: convert spritesByName
  }