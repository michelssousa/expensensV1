import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class ConnetionGraphql {
  HttpLink _httpLink;
  ValueNotifier<GraphQLClient> _client;

  ConnetionGraphql() {
    _httpLink = HttpLink(
      uri: 'https://api.github.com/graphql',
    );

    _client = new ValueNotifier(
      GraphQLClient(
        cache: InMemoryCache(),
        link: _httpLink,
      ),
    );
  }

  getConnetion() => _client;
}
