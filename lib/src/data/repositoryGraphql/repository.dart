import 'package:flutterExpenses/src/data/repositoryGraphql/setup/setupRepo.dart';
import 'package:flutterExpenses/src/domain/abstract/repository/Irepository.dart';
import 'package:flutterExpenses/src/domain/abstract/repository/IsetupRepository.dart';
import 'package:flutterExpenses/src/domain/abstract/repository/ItransactionRepository.dart';

import 'trasaction/transactionRepo.dart';

class Repository implements Irepository {
  @override
  IsetupRespository setupDAO() {
    return SetupRespository();
  }

  @override
  ItransactionRepository transactionDAO() {
    return TransactionRespository();
  }
}
