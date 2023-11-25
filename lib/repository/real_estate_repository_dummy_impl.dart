import 'package:realestate/data/property.dart';
import 'package:realestate/repository/real_estate_repository.dart';
import 'package:realestate/repository/real_estate_repository_dummy_impl.dart';

class RealEstateRepositoryDummyImpl implements RealEstateRepository{
  @override
  get properties {
    return[
      Property(12345, "Apartment", 4, 100000,"assets/appartement1.jpg"),
      Property(456, "House", 4, 120000,"assets/maison1.jpg"),
      Property(7890, "House", 7, 300000,"assets/maison2.jpg"),
      Property(543, "Apartment", 5, 110000,"assets/appartement2.jpg"),
      Property(876, "House", 5, 140000,"assets/maison3.jpg")
    ];
  }

}