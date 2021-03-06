import 'package:check_data/models/check_electric_model.dart';
import 'package:check_data/models/check_machine_model.dart';
import 'package:check_data/models/check_mechanic_model.dart';
import 'package:check_data/models/check_physical_model.dart';
import 'package:check_data/models/check_engine_part_model.dart';
import 'package:check_data/models/check_pump_part_model.dart';
import 'package:check_data/models/check_dry_chemical_powder_part_model.dart';
import 'package:check_data/models/check_equipment_part_model.dart';
import 'package:check_data/ui/custom_widgets/custom_widgets.dart';

import 'package:check_data/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:logger/logger.dart';

class HiveNotifier extends ChangeNotifier {
  Logger logger = Logger();

  void initHive() {
    logger.i('Start Init Hive @${Config.pathDir}');
    Hive.init(Config.pathDir);
    logger.i('Start Register Adapter');
    Hive
      ..registerAdapter(CheckElectricAdapter())
      ..registerAdapter(CheckMachineAdapter())
      ..registerAdapter(CheckMechanicAdapter())
      ..registerAdapter(CheckPhysicalAdapter())
      ..registerAdapter(CheckEnginePartModelAdapter())
      ..registerAdapter(CheckPumpPartModelAdapter())
      ..registerAdapter(CheckDryChemicalPowderPartModelAdapter())
      ..registerAdapter(CheckEquipmentPartModelAdapter());
  }

  Future<void> openBox(BuildContext context) async {
    logger
      ..i('Opening Box Hive \n ${Config.electricBox} \n ${Config.machineBox} \n ${Config.mechanicBox} \n ${Config.physicalBox} \n ${Config.engineBox} \n ${Config.pumpBox} \n ${Config.dryChemicalPowderBox} \n ${Config.equipmentBox}');
    await Hive.openBox<CheckElectric>(Config.electricBox);
    await Hive.openBox<CheckMachine>(Config.machineBox);
    await Hive.openBox<CheckMechanic>(Config.mechanicBox);
    await Hive.openBox<CheckPhysical>(Config.physicalBox);
    await Hive.openBox<CheckEnginePart>(Config.engineBox);
    await Hive.openBox<CheckPumpPartModel>(Config.pumpBox);
    await Hive.openBox<CheckDryChemicalPowderPartModel>(
        Config.dryChemicalPowderBox);
    await Hive.openBox<CheckEquipmentPartModel>(Config.equipmentBox);
  }

  void closeBox(BuildContext context) {
    logger.i('Closing Box Hive');
    Hive.deleteFromDisk();
    Hive.close();
  }

  ///For Testing Purpose , Check Data on Box
  void readDataFromHiveBox(BuildContext context, String boxName) {
    logger.i('Trying Read Data from $boxName');
    var hiveBox = Hive.box<dynamic>('$boxName');
    logger.i('Value For $boxName From Hive Is ${hiveBox.values}');
  }
}
