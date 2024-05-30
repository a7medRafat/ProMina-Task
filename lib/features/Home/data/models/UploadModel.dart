class UploadModel {
  UploadModel({
      this.status,
      this.data,
      this.message,});

  UploadModel.fromJson(dynamic json) {
    status = json['status'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(v.fromJson(v));
      });
    }
    message = json['message'];
  }
  String? status;
  List<dynamic>? data;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    map['message'] = message;
    return map;
  }

}