define [], ->
  'use strict'

  PrettyPrinter = {}

  print = (spec) ->
    [
      printParams spec.params
      printColors spec.colors
      printPlayer spec.player
      printObjects spec.objects
      printSets spec.sets
      printSounds spec.sounds
      printNearRules spec.nearRules
      printLeaveRules spec.leaveRules
      printEnterRules spec.enterRules
      printUseRules spec.useRules
      printLegend spec.legend
      printLevels spec.levels
    ].join '\n'

  PrettyPrinter.print = print


  printParams = (spec) ->
    'PARAM\n\n' + spec.map(({ name, parts }) ->
      name + ' ' + parts.join ' '
    ).join '\n'

  PrettyPrinter.printParams = printParams


  printColors = (spec) ->
    'COLORS\n\n' + spec.map(({ name, red, green, blue }) ->
      "#{name} rgb #{red} #{green} #{blue}"
    ).join '\n'

  PrettyPrinter.printColors = printColors


  printPlayer = (spec) ->
    'PLAYER\n\n' + spec.map(({ name, data }) ->
      name + '\n' + data.join '\n'
    ).join '\n'

  PrettyPrinter.printPlayer = printPlayer


  printObjects = (spec) ->
    'OBJECTS\n\n' + spec.map(({ name, blocking, data }) ->
      name + (if blocking then ' blocking' else '') + '\n' + data.join '\n'
    ).join '\n'

  PrettyPrinter.printObjects = printObjects


  printSets = (spec) ->
    'SETS\n\n' + spec.map(({ name, elements, operator, operand1, operand2 }) ->
      name + ' = ' +
        if elements? then elements.join ' '
        else "#{operand1} #{operator} #{operand2}"
    ).join '\n'

  PrettyPrinter.printSets = printSets


  printSounds = (spec) ->
    'SOUNDS\n\n' + spec.map(({ id, soundString }) ->
      "#{soundString} #{id}"
    ).join '\n'

  PrettyPrinter.printSounds = printSounds


  printNearRules = (spec) ->
    'NEARRULES\n\n' + spec.map(({ inTerrainItemName, outTerrainItemName, heal, hurt }) ->
      str = "#{inTerrainItemName} -> #{outTerrainItemName}"
      str += " ; heal #{heal}" if heal?
      str += " ; hurt #{hurt}" if hurt?
      str
    ).join '\n'

  PrettyPrinter.printNearRules = printNearRules


  printLeaveRules = (spec) ->
    'LEAVERULES\n\n' + spec.map(({ inTerrainItemName, outTerrainItemName }) ->
      "#{inTerrainItemName} -> #{outTerrainItemName}"
    ).join '\n'

  PrettyPrinter.printLeaveRules = printLeaveRules


  printEnterRules = (spec) ->
    'ENTERRULES\n\n' +
      spec.map(({ inTerrainItemName, outTerrainItemName, give, heal, hurt, message, teleport, checkpoint }) ->
        str = "#{inTerrainItemName} -> #{outTerrainItemName}"
        if give?
          giveStr = give.map(({ quantity, itemName }) ->
            "#{quantity} #{itemName}"
          ).join ' , '
          str += " ; give #{giveStr}"
        str += " ; heal #{heal}" if heal?
        str += " ; hurt #{hurt}" if hurt?
        str += " ; teleport #{teleport.levelName} #{teleport.x} #{teleport.y}" if teleport?
        str += " ; message '#{message}'" if message?
        str += " ; checkpoint" if checkpoint
        str
      ).join '\n'

  PrettyPrinter.printEnterRules = printEnterRules


  printUseRules = (spec) ->
    'USERULES\n\n' +
      spec.map(({ inTerrainItemName, inInventoryItemName, outTerrainItemName, give, heal, hurt, message, teleport, sound, consume }) ->
        str = "#{inTerrainItemName} #{inInventoryItemName} -> #{outTerrainItemName}"
        if give?
          giveStr = give.map(({ quantity, itemName }) ->
            "#{quantity} #{itemName}"
          ).join ' , '
          str += " ; give #{giveStr}"
        str += " ; heal #{heal}" if heal?
        str += " ; hurt #{hurt}" if hurt?
        str += " ; teleport #{teleport.levelName} #{teleport.x} #{teleport.y}" if teleport?
        str += " ; message '#{message}'" if message?
        str += " ; sound #{sound}" if sound?
        str += " ; consume" if consume
        str
      ).join '\n'

  PrettyPrinter.printUseRules = printUseRules


  printLegend = (spec) ->
    'LEGEND\n\n' + spec.map(({ name, objectName }) ->
      "#{name} #{objectName}"
    ).join '\n'

  PrettyPrinter.printLegend = printLegend


  printLevels = (spec) ->
    str = 'LEVELS\n\n'
    for key of spec
      data = spec[key].map((identifier) ->
        identifier.s
      ).join('\n')
      str += key + '\n' + data + '\n\n'
    str


  PrettyPrinter
