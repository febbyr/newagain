class RequestModel {
  String username;
  DateTime claimDate;
  int amount;
  String typeClaim;
  String description;

  RequestModel({
    this.username,
    this.claimDate,
    this.amount,
    this.typeClaim,
    this.description,
  });

  factory RequestModel.fromJson(Map<String, dynamic> json) {
    return RequestModel(
      username: json['username'],
      claimDate: DateTime.parse(json['claimDate']),
      amount: int.parse(json['amount']),
      typeClaim: json['typeClaim'],
      description: json['description'],
    );
  }
}
