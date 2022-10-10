enum CarType { hatchback, sedan, suv, sport, coupe }

void main() {
  print(CarType.values);
  print(CarType.sedan.index);

  
  CarType carType = CarType.suv;

  for (var v in CarType.values) {
    print('value: $v');
  }

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
