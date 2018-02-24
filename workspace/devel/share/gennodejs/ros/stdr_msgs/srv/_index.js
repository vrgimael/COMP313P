
"use strict";

let AddSoundSource = require('./AddSoundSource.js')
let MoveRobot = require('./MoveRobot.js')
let DeleteThermalSource = require('./DeleteThermalSource.js')
let AddThermalSource = require('./AddThermalSource.js')
let AddRfidTag = require('./AddRfidTag.js')
let DeleteRfidTag = require('./DeleteRfidTag.js')
let DeleteCO2Source = require('./DeleteCO2Source.js')
let LoadMap = require('./LoadMap.js')
let RegisterGui = require('./RegisterGui.js')
let LoadExternalMap = require('./LoadExternalMap.js')
let DeleteSoundSource = require('./DeleteSoundSource.js')
let AddCO2Source = require('./AddCO2Source.js')

module.exports = {
  AddSoundSource: AddSoundSource,
  MoveRobot: MoveRobot,
  DeleteThermalSource: DeleteThermalSource,
  AddThermalSource: AddThermalSource,
  AddRfidTag: AddRfidTag,
  DeleteRfidTag: DeleteRfidTag,
  DeleteCO2Source: DeleteCO2Source,
  LoadMap: LoadMap,
  RegisterGui: RegisterGui,
  LoadExternalMap: LoadExternalMap,
  DeleteSoundSource: DeleteSoundSource,
  AddCO2Source: AddCO2Source,
};
