part of 'models.dart';

class Promo extends Equatable {
  final String title;
  final String subtitle;
  final int discount;

  Promo(
      {@required this.discount, @required this.subtitle, @required this.title});

  @override
  List<Object> get props => [title, subtitle, discount];
}

List<Promo> dummyPromos = [
  Promo(title: "Student Holiday", discount: 50, subtitle: "only for student"),
  Promo(title: "wkwkland Holiday", discount: 75, subtitle: "only for man"),
  Promo(title: "Mantul Holiday", discount: 60, subtitle: "only for mom")
];
