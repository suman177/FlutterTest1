class GifApiResponseModel {
  List<Results>? results;
  String? next;

  GifApiResponseModel({this.results, this.next});

  GifApiResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
    next = json['next'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    data['next'] = next;
    return data;
  }
}

class Results {
  List<Media>? media;

  Results({
    this.media,
  });

  Results.fromJson(Map<String, dynamic> json) {
    // id = json['id'];
    // title = json['title'];
    // contentDescription = json['content_description'];
    // contentRating = json['content_rating'];
    // h1Title = json['h1_title'];
    if (json['media'] != null) {
      media = <Media>[];
      json['media'].forEach((v) {
        media!.add(Media.fromJson(v));
      });
    }
    // bgColor = json['bg_color'];
    // created = json['created'];
    // itemurl = json['itemurl'];
    // url = json['url'];
    // shares = json['shares'];
    // hasaudio = json['hasaudio'];
    // hascaption = json['hascaption'];
    // sourceId = json['source_id'];
    // composite = json['composite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    // data['id'] = id;
    // data['title'] = title;
    // data['content_description'] = contentDescription;
    // data['content_rating'] = contentRating;
    // data['h1_title'] = h1Title;
    if (media != null) {
      data['media'] = media!.map((v) => v.toJson()).toList();
    }
    // data['bg_color'] = bgColor;
    // data['created'] = created;
    // data['itemurl'] = itemurl;
    // data['url'] = url;
    // if (tags != null) {
    //   data['tags'] = tags!.map((v) => v.toJson()).toList();
    // }
    // if (flags != null) {
    //   data['flags'] = flags!.map((v) => v.toJson()).toList();
    // }
    // data['shares'] = shares;
    // data['hasaudio'] = hasaudio;
    // data['hascaption'] = hascaption;
    // data['source_id'] = sourceId;
    // data['composite'] = composite;
    return data;
  }
}

class Media {
  Gif? gif;
  Gif? nanowebm;
  Gif? mediumgif;
  Gif? tinywebm;

  Gif? tinygif;

  Gif? webm;
  Gif? nanogif;

  Media(
      {this.gif,
      this.nanowebm,
      this.mediumgif,
      this.tinywebm,
      this.tinygif,
      this.webm,
      this.nanogif});

  Media.fromJson(Map<String, dynamic> json) {
    gif = json['gif'] != null ? Gif.fromJson(json['gif']) : null;
    nanowebm = json['nanowebm'] != null ? Gif.fromJson(json['nanowebm']) : null;
    mediumgif =
        json['mediumgif'] != null ? Gif.fromJson(json['mediumgif']) : null;
    tinywebm = json['tinywebm'] != null ? Gif.fromJson(json['tinywebm']) : null;
    tinygif = json['tinygif'] != null ? Gif.fromJson(json['tinygif']) : null;

    webm = json['webm'] != null ? Gif.fromJson(json['webm']) : null;
    nanogif = json['nanogif'] != null ? Gif.fromJson(json['nanogif']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (gif != null) {
      data['gif'] = gif!.toJson();
    }
    if (nanowebm != null) {
      data['nanowebm'] = nanowebm!.toJson();
    }
    if (mediumgif != null) {
      data['mediumgif'] = mediumgif!.toJson();
    }
    if (tinywebm != null) {
      data['tinywebm'] = tinywebm!.toJson();
    }

    if (tinygif != null) {
      data['tinygif'] = tinygif!.toJson();
    }

    if (nanogif != null) {
      data['nanogif'] = nanogif!.toJson();
    }
    return data;
  }
}

class Gif {
  String? url;
  String? preview;
  List<int>? dims;
  int? size;

  Gif({this.url, this.preview, this.dims, this.size});

  Gif.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    preview = json['preview'];
    dims = json['dims'].cast<int>();
    size = json['size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['preview'] = preview;
    data['dims'] = dims;
    data['size'] = size;
    return data;
  }
}
