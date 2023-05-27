class XenditModel {
  String? invoice_url;
  String? merchant_name;

  XenditModel({
    this.invoice_url,
    this.merchant_name,
  });

  XenditModel.fromJson(Map<String, dynamic> json) {
    invoice_url = json['invoice_url'];
    merchant_name = json['merchant_name'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['invoice_url'] = invoice_url;
    data['merchant_name'] = merchant_name;
    return data;
  }

  XenditModel.copyWith({
    String? merchant_name,
    String? invoice_url,
  }) {
    invoice_url = invoice_url;
    merchant_name = merchant_name ?? this.merchant_name;
  }
}
