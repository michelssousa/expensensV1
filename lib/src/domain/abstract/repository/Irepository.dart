import 'IsetupRepository.dart';
import 'ItransactionRepository.dart';

mixin Irepository {
  IsetupRespository setupDAO();
  ItransactionRepository transactionDAO();
}
