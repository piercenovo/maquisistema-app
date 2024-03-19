import 'package:equatable/equatable.dart';

class TypesEntity extends Equatable {
  final int slot;
  final TypeEntity type;

  const TypesEntity({
    required this.slot,
    required this.type,
  });

  @override
  List<Object?> get props => [
        slot,
        type,
      ];
}

class TypeEntity extends Equatable {
  final String name;
  final String url;

  const TypeEntity({
    required this.name,
    required this.url,
  });

  @override
  List<Object?> get props => [
        name,
        url,
      ];
}
