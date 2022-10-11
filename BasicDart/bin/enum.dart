enum CarType { hatchback, sedan, suv, sport, coupe }

void main() {
  print(CarType.values);
  print(CarType.sedan.index);

  
  CarType? carType;

  switch (carType) {
    case CarType.hatchback:
      print('Hatchback');
      break;
    case CarType.suv:
      print('suv');
      break;
    case CarType.coupe:
      print('Coupe');
      break;
    default:
      print("none");
  }
}
