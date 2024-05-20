class ProductModel {
 late String sId;
 late String productName;
 late String productCode;
 late String img;
 late String unitPrice;
 late String qty;
 late String totalPrice;

  ProductModel(
      {required this.sId,
        required this.productName,
        required this.productCode,
        required this.img,
        required this.unitPrice,
        required this.qty,
        required this.totalPrice,
        });

  ProductModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    productName = json['ProductName'] ?? "Unknown";
    productCode = json['ProductCode']?? "Unknown";
    img = json['Img']?? "Unknown";
    unitPrice = json['UnitPrice']?? "0";
    qty = json['Qty']?? "0";
    totalPrice = json['TotalPrice']?? "0";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ProductName'] = productName;
    data['ProductCode'] = productCode;
    data['Img'] = img;
    data['UnitPrice'] = unitPrice;
    data['Qty'] = qty;
    data['TotalPrice'] = totalPrice;
    return data;
  }
}