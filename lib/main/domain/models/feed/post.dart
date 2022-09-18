import 'dart:convert';

import 'package:code_union_test/main/domain/models/feed/coordinates.dart';
import 'package:code_union_test/main/domain/models/feed/schedule.dart';
import 'package:flutter/foundation.dart';

class Post {
  final int? id;
  final String? title;
  final String? description;
  final Schedule? schedule;
  final Coordinates? coordinates;
  final List<String>? images;
  final bool isFavourite;

  const Post({
    this.id,
    this.title,
    this.description,
    this.schedule,
    this.coordinates,
    this.images,
    this.isFavourite = false,
  });

  Post copyWith({
    int? id,
    String? title,
    String? description,
    Schedule? schedule,
    Coordinates? coordinates,
    List<String>? images,
    bool? isFavourite,
  }) {
    return Post(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      schedule: schedule ?? this.schedule,
      coordinates: coordinates ?? this.coordinates,
      images: images ?? this.images,
      isFavourite: isFavourite ?? this.isFavourite,
    );
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      id: map['id']?.toInt(),
      title: map['title'],
      description: map['description'],
      schedule: map['schedule'] != null ? Schedule.fromMap(map['schedule']) : null,
      coordinates: map['coords'] != null ? Coordinates.fromMap(map['coords']) : null,
      images: List<String>.from(map['images']),
      isFavourite: map['is_favourite'] ?? false,
    );
  }

  factory Post.fromJson(String source) => Post.fromMap(json.decode(source));

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    if (title != null) {
      result.addAll({'title': title});
    }
    if (description != null) {
      result.addAll({'description': description});
    }
    if (schedule != null) {
      result.addAll({'schedule': schedule!.toMap()});
    }
    if (coordinates != null) {
      result.addAll({'coords': coordinates!.toMap()});
    }
    if (images != null) {
      result.addAll({'images': images});
    }
    result.addAll({'is_favourite': isFavourite});

    return result;
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'Post(id: $id, title: $title, description: $description, schedule: $schedule, coordinates: $coordinates, images: $images, isFavourite: $isFavourite)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Post &&
        other.id == id &&
        other.title == title &&
        other.description == description &&
        other.schedule == schedule &&
        other.coordinates == coordinates &&
        listEquals(other.images, images) &&
        other.isFavourite == isFavourite;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        description.hashCode ^
        schedule.hashCode ^
        coordinates.hashCode ^
        images.hashCode ^
        isFavourite.hashCode;
  }
}
