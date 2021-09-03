class ClaimModel {
  int idclaim;
  int amount;
  String description;
  String username;

  ClaimModel({
    this.idclaim,
    this.amount,
    this.description,
    this.username,
  });

  factory ClaimModel.fromJson(Map<String, dynamic> json) {
    return ClaimModel(
      username: json['username'],
      idclaim: json['idclaim'],
      amount: json['amount'],
      description: json['description'],
    );
  }
  Map<String, dynamic> toJsonAdd() {
    return {
      "username": username,
      "idclaim": idclaim.toString(),
      "amount": amount.toString(),
      "description": description,
    };
  }
}
