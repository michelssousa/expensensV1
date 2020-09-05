class TransactionQueryString {
  String betweenMonth = r"""
      {
       query ($dateStart: Int! = 1, $dateEnd: Int! = 8) {
         transactions(where: {_and: [{month: {_gte: $dateStart}}, {month: {_lte: $dateEnd}}]}) {
           id
           date
           descriptionInfo
           genericInfo
           month
           value
           userName
           tr_year
         }
       }
    """;
}
