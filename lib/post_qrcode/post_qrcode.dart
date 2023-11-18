class post_qrcode {
  String? qrcode;

  post_qrcode({this.qrcode});

  post_qrcode.fromJson(Map<String, dynamic> json) {
    qrcode = json['qrcode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['qrcode'] = this.qrcode;
    return data;
  }
}