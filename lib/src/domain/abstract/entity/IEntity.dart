import 'package:flutterExpenses/src/domain/providers/utilites/keyGeneration/generation.dart';

abstract class IEntity {
  dynamic id;

  IEntity() {
    this.id = Generation().keyId();
  }

  Map<dynamic, dynamic> toJson();

  bool isValid();
}
