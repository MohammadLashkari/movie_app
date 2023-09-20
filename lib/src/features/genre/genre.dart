import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class Genre extends Equatable {
  const Genre({
    this.id = 0,
    required this.name,
    this.isSelected = false,
  });

  final int id;
  final String name;
  final bool isSelected;

  Genre toggleSelected() {
    return Genre(
      id: id,
      name: name,
      isSelected: !isSelected,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, name, isSelected];
}
