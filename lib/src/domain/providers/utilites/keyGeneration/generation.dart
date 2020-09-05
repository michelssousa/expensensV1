import 'dart:convert';

import 'dart:math';

class Generation {
  dynamic value;

  dynamic keyId() {
    var _random = Random.secure();
    var random = List<int>.generate(32, (i) => _random.nextInt(256));
    var verificador = base64Url.encode(random);
    verificador = verificador
        .replaceAll('+', '-')
        .replaceAll('/', '_')
        .replaceAll('=', '');
    var base64ToSha256 = utf8.encode(verificador);
    var result = base64Url.encode(base64ToSha256);
    result =
        result.replaceAll('+', '-').replaceAll('/', '_').replaceAll('=', '');
    this.value = result;
    return value;
  }
}
