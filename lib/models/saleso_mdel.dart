
// Create a new model for the sales data
class SalesModel {
  String? salesId;
  int? salesStatus;
  String? customerAccount;
  String? customer;
  String? deliveryDate;

  SalesModel({
    this.salesId,
    this.salesStatus,
    this.customerAccount,
    this.customer,
    this.deliveryDate,
  });

  factory SalesModel.fromJson(Map<String, dynamic> json) {
    return SalesModel(
      salesId: json['SalesId'],
      salesStatus: json['SalesStatus'],
      customerAccount: json['CUSTACCOUNT'],
      customer: json['Customer'],
      deliveryDate: json['DELIVERYDATE']['date'],
    );
  }
}