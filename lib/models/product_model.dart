class ProductModel {
 late String sId;
 late String productName;
 late String productCode;
 late String img;
 late String unitPrice;
 late String qty;
 late String totalPrice;
 late String createdDate;

  ProductModel(
      {required this.sId,
        required this.productName,
        required this.productCode,
        required this.img,
        required this.unitPrice,
        required this.qty,
        required this.totalPrice,
        required this.createdDate});

  ProductModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    productName = json['ProductName'];
    productCode = json['ProductCode'];
    img = json['Img'];
    unitPrice = json['UnitPrice'];
    qty = json['Qty'];
    totalPrice = json['TotalPrice'];
    createdDate = json['CreatedDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['ProductName'] = productName;
    data['ProductCode'] = productCode;
    data['Img'] = img;
    data['UnitPrice'] = unitPrice;
    data['Qty'] = qty;
    data['TotalPrice'] = totalPrice;
    data['CreatedDate'] = createdDate;
    return data;
  }
}