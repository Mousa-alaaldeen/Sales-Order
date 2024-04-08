class LoginModel {
  int? status;
  String? message;
  String? bRANCH;
  int? lEVELID;
  String? pERSONNELNUMBER;
  String? userName;

  LoginModel(
      {this.status,
      this.message,
      this.bRANCH,
      this.lEVELID,
      this.pERSONNELNUMBER,
      this.userName});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    bRANCH = json['BRANCH'];
    lEVELID = json['LEVELID'];
    pERSONNELNUMBER = json['PERSONNELNUMBER'];
    userName = json['UserName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['BRANCH'] = this.bRANCH;
    data['LEVELID'] = this.lEVELID;
    data['PERSONNELNUMBER'] = this.pERSONNELNUMBER;
    data['UserName'] = this.userName;
    return data;
  }
}
