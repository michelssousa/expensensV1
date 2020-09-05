import 'package:flutterExpenses/src/data/repositoryGraphql/repository.dart';
import 'package:flutterExpenses/src/domain/abstract/repository/Irepository.dart';
import 'package:flutterExpenses/src/domain/abstract/repository/IsetupRepository.dart';
import 'package:flutterExpenses/src/domain/abstract/repository/ItransactionRepository.dart';

class ProviderRepository implements Irepository {
  @override
  IsetupRespository setupDAO() {
    return Repository().setupDAO();
  }

  @override
  ItransactionRepository transactionDAO() {
    return Repository().transactionDAO();
  }
}
