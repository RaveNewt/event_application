class XenditForm {
  String? external_id;
  String? amount;
  String? payer_email;
  String? description;

  XenditForm.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    external_id = json['external_id'];
    payer_email = json['payer_email'];
    description = json['description'];
  }
  XenditForm({
    this.external_id,
    this.amount,
    this.payer_email,
    this.description,
  });
  XenditForm copyWith({
    String? external_id,
    String? amount,
    String? payer_email,
    String? description,
  }) =>
      XenditForm(
        external_id: external_id ?? this.external_id,
        amount: amount ?? this.amount,
        payer_email: this.payer_email,
        description: description ?? this.description,
      );

  Map<String, dynamic> toJson() {
    return {
      'external_id': external_id,
      'amount': amount,
      'payer_email': payer_email,
      'description': description,
    };
  }
}
