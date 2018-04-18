
"use strict";

let MoveRobot = require('./MoveRobot.js')
let AddCO2Source = require('./AddCO2Source.js')
let RegisterGui = require('./RegisterGui.js')
let LoadMap = require('./LoadMap.js')
let AddSoundSource = require('./AddSoundSource.js')
let LoadExternalMap = require('./LoadExternalMap.js')
let DeleteRfidTag = require('./DeleteRfidTag.js')
let DeleteThermalSource = require('./DeleteThermalSource.js')
let AddRfidTag = require('./AddRfidTag.js')
let DeleteSoundSource = require('./DeleteSoundSource.js')
let AddThermalSource = require('./AddThermalSource.js')
let DeleteCO2Source = require('./DeleteCO2Source.js')

module.exports = {
  MoveRobot: MoveRobot,
  AddCO2Source: AddCO2Source,
  RegisterGui: RegisterGui,
  LoadMap: LoadMap,
  AddSoundSource: AddSoundSource,
  LoadExternalMap: LoadExternalMap,
  DeleteRfidTag: DeleteRfidTag,
  DeleteThermalSource: DeleteThermalSource,
  AddRfidTag: AddRfidTag,
  DeleteSoundSource: DeleteSoundSource,
  AddThermalSource: AddThermalSource,
  DeleteCO2Source: DeleteCO2Source,
};
