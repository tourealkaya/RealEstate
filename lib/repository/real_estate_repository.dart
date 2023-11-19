import 'package:realestate/data/property.dart';

abstract class RealEstateRepository{
  List<Property> get properties;
}