import 'package:digital_partnership_group/app/utils/image_assets.dart';

class CarModel {
  final String model;
  final String gearType;
  final String fuelType;
  final String distance;
  final String carImage;

  CarModel({
    required this.model,
    required this.distance,
    required this.fuelType,
    required this.gearType,
    required this.carImage,
  });
}

CarModel carModel = CarModel(
  model: 'BMW Cabrio',
  gearType: "Automatic",
  fuelType: 'Octane',
  distance: '800m (5mins away)',
  carImage: ImageAssets.carImage,
);
