import 'package:flutterExpenses/src/domain/abstract/repository/Irepository.dart';
import 'package:flutterExpenses/src/domain/abstract/repository/ItransactionRepository.dart';
import 'package:flutterExpenses/src/domain/providers/infra/repository/providerRepository.dart';
import 'package:flutterExpenses/src/domain/useCase/UCTransaction.dart';

class ModTransaction {
  Irepository _irepository;
  ItransactionRepository _itransactionRepository;

  ModTransaction() {
    this._irepository = ProviderRepository();
    this._itransactionRepository = _irepository.transactionDAO();
  }

  UcTransaction modTransaction() {
    return UcTransaction(this._itransactionRepository);
  }
}
