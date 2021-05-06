part of 'models.dart';

class Theater extends Equatable {
  final String name;

  Theater(this.name);

  @override
  List<Object> get props => [name];
}

List<Theater> dummyTheaters = [
  Theater("CGV 666 Paskal Square"),
  Theater("CGV Paris Van Java"),
  Theater("XXI TangCity"),
  Theater("XXI Rita Mall")
];
