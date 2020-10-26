import 'package:flutterExpenses/src/domain/Entity/transaction/Transaction.dart';
import 'package:flutterExpenses/src/domain/abstract/repository/ItransactionRepository.dart';

class UcTransaction with ItransactionRepository {
  ItransactionRepository repository;

  UcTransaction(this.repository);

  @override
  Map<String, Transaction> betweenMonth(int start, int end) {
    return repository.betweenMonth(start, end);
  }

  @override
  int count() {
    return repository.count();
  }

  @override
  Transaction create(String date, GenericInfo genericInfo,
      String descriptionInfo, double value, String userName) {
    return repository.create(
        date, genericInfo, descriptionInfo, value, userName);
  }

  @override
  bool delete(id) {
    return repository.delete(id);
  }

  @override
  Transaction findById(String id) {
    return repository.findById(id);
  }

  @override
  Transaction update(Transaction item) {
    return repository.update(item);
  }

  @override
  List betweenMonthListJson(int start, int end) {
    return repository.betweenMonthListJson(start, end);
  }
}
