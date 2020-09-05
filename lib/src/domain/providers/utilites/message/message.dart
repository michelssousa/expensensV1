class Message {
  _Success good() {
    return _Success();
  }

  _Erro error() {
    return _Erro();
  }
}

class _Success {
  final String successfully = 'Salvo com sucesso!';
}

class _Erro {
  final String failureBDsave = 'Falha em salvar os dados!';
  final String failureBDdownload = 'Falha em recuperar os dados!';
  final String failureBDmutationDelete = 'Falha em deletar os dados!';
  final String failureBDmutationUpdate = 'Falha em modificar os dados!';
}
