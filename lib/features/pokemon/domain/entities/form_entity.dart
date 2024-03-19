import 'package:equatable/equatable.dart';
import 'package:maquisistema_app/features/pokemon/domain/entities/type_entity.dart';

class FormEntity extends Equatable {
  final int id;
  final String name;
  final int order;
  final List<TypesEntity> types;

  const FormEntity({
    required this.id,
    required this.name,
    required this.order,
    required this.types,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        order,
        types,
      ];
}
