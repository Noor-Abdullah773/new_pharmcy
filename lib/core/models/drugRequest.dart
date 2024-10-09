class DrugRequest {
  int? userId;
  int? drugId;
  int? quantity;
  String? status;
  String? updatedAt;
  String? createdAt;
  int? id;

  DrugRequest(
      {this.userId,
      this.drugId,
      this.quantity,
      this.status,
      this.updatedAt,
      this.createdAt,
      this.id});

  DrugRequest.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    drugId = json['drug_id'];
    quantity = json['quantity'];
    status = json['status'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['drug_id'] = this.drugId;
    data['quantity'] = this.quantity;
    data['status'] = this.status;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}