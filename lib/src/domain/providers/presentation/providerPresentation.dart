import 'package:flutterExpenses/src/domain/providers/presentation/modConfig/config.dart';
import 'package:flutterExpenses/src/domain/providers/presentation/modTransaction/modTransaction.dart';

class ProviderPresentation {
  Config getModConfig() {
    var _config = Config();
    return _config;
  }

  ModTransaction getModTransaction() {
    var _modTransaction = ModTransaction();
    return _modTransaction;
  }
}
