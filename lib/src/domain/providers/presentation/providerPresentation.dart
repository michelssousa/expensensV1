import 'package:flutterExpenses/src/domain/providers/presentation/modConfig/config.dart';
import 'package:flutterExpenses/src/domain/providers/presentation/modTransaction/modTransaction.dart';

class ProviderPresentation {
  Config getModConfig() {
    return Config();
  }

  ModTransaction getModTransaction() {
    return ModTransaction();
  }
}
