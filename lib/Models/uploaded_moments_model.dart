class UploadedMomentsResponse {
  bool? error;
  List<Items>? items;

  UploadedMomentsResponse({this.error, this.items});

  UploadedMomentsResponse.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['error'] = error;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  String? url;

  Items({this.url});

  Items.fromJson(Map<String, dynamic> json) {
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['url'] = url;
    return data;
  }
}
