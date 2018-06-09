define [
	'Util'
], (
	Util
) ->
	'use strict'

	compileColor = (color) ->
		data = switch color.format
			when 'rgb'
				"[#{color.red}, #{color.green}, #{color.blue}, 1]"
			when 'rgba'
				"[#{color.red}, #{color.green}, #{color.blue}, #{color.alpha}]"

		"'#{color.name}': #{data}"


	compileColors = (colors) ->
		lines = []
		push = lines.push.bind lines

		push "var colors = {"

		colors.forEach (color) ->
			push "#{compileColor color},"
			return

		push "}"

		lines.join '\n'


	compilePlayerSprite = ({ name, data }) ->
		colorData = for line in data
			for color in line
				"colors['#{color}']"

		"""
			'#{name}': {
				data: [#{colorData}],
			}
		"""


	compilePlayerSprites = (playerSprites) ->
		lines = []
		push = lines.push.bind lines

		push "var player = {"

		playerSprites.forEach (playerSprite) ->
			push "#{compilePlayerSprite playerSprite},"
			return

		push "}"

		lines.join '\n'


	compileObject = ({ name, data, blocking }) ->
		colorData = for line in data
			for color in line
				"colors['#{color}']"

		"""
			'#{name}': {
				data: [#{colorData}],
				blocking: #{blocking},
			}
		"""


	compileObjects = (objects) ->
		lines = []
		push = lines.push.bind lines

		push "var objects = {"

		objects.forEach (object) ->
			push "#{compileObject object},"
			return

		push "}"

		lines.join '\n'


	compileLevelSize = (levels) ->
		"""
			{#{
				(
					levels.map ({ name, data }) ->
						"""
							'#{name}' : {
								x: #{data[0].length},
								y: #{data.length},
							}
						"""
				).join ',\n'
			}}
		"""


	compileLevel = (legend, { name, data }) ->
		lines = data.map (line) ->
			Array::map.call line, (item) ->
				legend[item]

		"'#{name}': #{JSON.stringify lines}"


	compileLevels = (legend, levels) ->
		legendIndexed = Util.arrayToObject legend, 'name', 'objectName'

		lines = []
		push = lines.push.bind lines

		push "{"

		levels.forEach (level) ->
			push "#{compileLevel legendIndexed, level},"
			return

		push "}"

		lines.join '\n'


	compileSet = (setSpec, setDefinitions) ->
		if setSpec.elements?
			set = new Set setSpec.elements
		else
			operand1 = setDefinitions[setSpec.operand1]
			operand2 = setDefinitions[setSpec.operand2]

			set = new Set

			switch setSpec.operator
				when 'or'
					operand1.forEach (element) ->
						set.add element
						return

					operand2.forEach (element) ->
						set.add element
						return

				when 'and'
					operand1.forEach (element) ->
						if operand2.has element
							set.add element
						return

				when 'minus'
					operand1.forEach (element) ->
						if not operand2.has element
							set.add element
						return

		setDefinitions[setSpec.name] = set

		elements = (Array.from set).map (element) -> "'#{element}'"

		"'#{setSpec.name}': new Set([#{elements.join ', '}])"


	compileSets = (sets) ->
		lines = []
		push = lines.push.bind lines

		push "var sets = {"

		setDefinitions = {}
		sets.forEach (set) ->
			push "#{compileSet set, setDefinitions},"
			return

		push "}"

		lines.join '\n'


	isSetReference = Util.isCapitalized


	resolveItem = (reference) ->
		switch reference
			when '_terrain'
				'terrainItem'
			when '_inventory'
				'inventoryItem'
			else
				reference


	makeList = ->
		elements = []

		{
			push: elements.push.bind elements
			join: elements.join.bind elements
		}


	compileLeaveRule = (rule) ->
		{ push, join } = makeList()

		terrainItemCondition = if isSetReference rule.inTerrainItemName
			"sets['#{rule.inTerrainItemName}'].has(terrainItem)"
		else
			"terrainItem === #{rule.inTerrainItemName}"

		push "if (#{terrainItemCondition}) {"

		push "setTerrainItem(prevPosition, '#{resolveItem rule.outTerrainItemName}')"

		push "}"

		join '\n'


	compileLeaveRules = (rules) ->
		{ push, join } = makeList()

		push 'function applyLeaveRules (prevPosition) {'

		push 'var terrainItem = getTerrainItem(prevPosition)'

		push 'var inventoryItem = getInventoryItem()'

		ruleLines = makeList()
		rules.forEach (rule) ->
			ruleLines.push compileLeaveRule rule
			return
		push ruleLines.join ' else '

		push '}'

		join '\n'


	compile = (spec) ->
		params = Util.arrayToObject spec.params, 'name', 'parts'

		"""
			#{compileColors spec.colors}
			#{compilePlayerSprites spec.player}
			#{compileObjects spec.objects}

			var objectSprites = {}
			var playerSprites = {}

			var params = {
				scale: #{params['scale'][0]},
				tileSize: {
					x: #{spec.objects[0].data[0].length},
					y: #{spec.objects[0].data.length},
				},
				cameraSize: {
					x: #{params['camera'][0]},
					y: #{params['camera'][1]},
				},
				levelSize: #{compileLevelSize spec.levels},
			}

			// state
			var state = {
				player: {
					position: {
						x: #{params['start_location'][0]},
						y: #{params['start_location'][1]},
						level: "#{params['start_location'][2]}",
					},
					inventory: {
						index: -1,
						items: [],
					},
				},
				levels: #{compileLevels spec.legend, spec.levels},
			}

			function isWithin (position, level) {
				const levelSize = params.levelSize[level]

				return position.x >= 0 && position.x < levelSize.x &&
					position.y >= 0 && position.y < levelSize.y
			}

			function getTerrainItem (position) {
				const { player, levels } = state
				const level = state.levels[player.position.level]

				return isWithin(position, player.position.level)
					? level[position.y][position.x]
					: null
			}

			function setTerrainItem (position, item) {
				const { player, levels } = state
				const level = state.levels[player.position.level]

				if (isWithin(position, player.position.level)) {
					level[position.y][position.x] = item
				}
			}

			function getInventoryItem () {
				const { items, index } = state.player.inventory

				return items.length <= 0
					? null
					: items[index]
			}

			#{compileSets spec.sets}

			#{compileLeaveRules spec.leaveRules}
		"""

	{
		compile
	}