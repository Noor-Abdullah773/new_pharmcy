class Donation {
  String? name;
  int? quantity;
  int? category_id;
  String? shape;
  String? type;
  String? expireDate;
  int? userId;
  String? updatedAt;
  String? createdAt;
  int? id;

  Donation(
      {this.name,
      this.quantity,
      this.shape,
      this.type,
      this.expireDate,
      this.userId,
      this.updatedAt,
      this.createdAt,
      this.id,
      this.category_id});

  Donation.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    quantity = json['quantity'];
    shape = json['shape'];
    type = json['type'];
    expireDate = json['expire_date'];
    userId = json['user_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
    category_id = json['category_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['quantity'] = this.quantity;
    data['shape'] = this.shape;
    data['type'] = this.type;
    data['expire_date'] = this.expireDate;
    data['user_id'] = this.userId;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    data['category_id'] = this.category_id;
    return data;
  }
}
