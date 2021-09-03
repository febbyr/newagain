class RequestModel {
  int idUserClaim;
  int totalAmount;
  // DateTime totalAmount;
  // String name;
  // int id;
  // int userid;

  RequestModel({
    this.idUserClaim,
    this.totalAmount,
  });

  factory RequestModel.fromJson(Map<String, dynamic> json) {
    return RequestModel(
      idUserClaim:
          int.parse(json['idUserClaim'] != null ? json['idUserClaim'] : '0'),
      totalAmount: int.parse(json['totalAmount']),
    );
  }
}
