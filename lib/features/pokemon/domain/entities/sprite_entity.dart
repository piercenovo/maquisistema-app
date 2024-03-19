import 'package:equatable/equatable.dart';

class SpritesEntity extends Equatable {
  final String frontDefault;
  final String backDefault;
  final OtherEntity other;

  const SpritesEntity({
    required this.frontDefault,
    required this.backDefault,
    required this.other,
  });

  @override
  List<Object?> get props => [
        frontDefault,
        backDefault,
        other,
      ];
}

class OtherEntity extends Equatable {
  final OfficialArtworkEntity officialArtwork;

  const OtherEntity({
    required this.officialArtwork,
  });

  @override
  List<Object?> get props => [
        officialArtwork,
      ];
}

class OfficialArtworkEntity extends Equatable {
  final String frontDefault;
  final String backDefault;

  const OfficialArtworkEntity({
    required this.frontDefault,
    required this.backDefault,
  });

  @override
  List<Object?> get props => [
        frontDefault,
        backDefault,
      ];
}
