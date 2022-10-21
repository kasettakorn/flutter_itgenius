import 'dart:convert';

class Media {
  String? artistName;
  String? collectionName;
  String? trackName;
  String? artworkUrl100;
  String? previewUrl;
  Media({
    this.artistName,
    this.collectionName,
    this.trackName,
    this.artworkUrl100,
    this.previewUrl,
  });

  Media copyWith({
    String? artistName,
    String? collectionName,
    String? trackName,
    String? artworkUrl100,
    String? previewUrl,
  }) {
    return Media(
      artistName: artistName ?? this.artistName,
      collectionName: collectionName ?? this.collectionName,
      trackName: trackName ?? this.trackName,
      artworkUrl100: artworkUrl100 ?? this.artworkUrl100,
      previewUrl: previewUrl ?? this.previewUrl,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (artistName != null) {
      result.addAll({'artistName': artistName});
    }
    if (collectionName != null) {
      result.addAll({'collectionName': collectionName});
    }
    if (trackName != null) {
      result.addAll({'trackName': trackName});
    }
    if (artworkUrl100 != null) {
      result.addAll({'artworkUrl100': artworkUrl100});
    }
    if (previewUrl != null) {
      result.addAll({'previewUrl': previewUrl});
    }

    return result;
  }

  factory Media.fromMap(Map<String, dynamic> map) {
    return Media(
      artistName: map['artistName'],
      collectionName: map['collectionName'],
      trackName: map['trackName'],
      artworkUrl100: map['artworkUrl100'],
      previewUrl: map['previewUrl'],
    );
  }

  String toJson() => json.encode(toMap());

  // factory Media.fromJson(String source) => Media.fromMap(json.decode(source));

  factory Media.fromJson(Map<String, dynamic> json) {
    return Media(
      artistName: json['artistName'] as String?,
      collectionName: json['collectionName'] as String?,
      trackName: json['trackName'] as String?,
      artworkUrl100: json['artworkUrl100'] as String?,
      previewUrl: json['previewUrl'] as String?,
    );
  }

  @override
  String toString() {
    return 'Media(artistName: $artistName, collectionName: $collectionName, trackName: $trackName, artworkUrl100: $artworkUrl100, previewUrl: $previewUrl)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Media &&
        other.artistName == artistName &&
        other.collectionName == collectionName &&
        other.trackName == trackName &&
        other.artworkUrl100 == artworkUrl100 &&
        other.previewUrl == previewUrl;
  }

  @override
  int get hashCode {
    return artistName.hashCode ^
        collectionName.hashCode ^
        trackName.hashCode ^
        artworkUrl100.hashCode ^
        previewUrl.hashCode;
  }
}
