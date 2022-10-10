void main() {
  // String str;
  String? favorite;

  var color;
  print(color);
  // print(getArea(8, 5));
  // print(getArea(8, null));
  var dog = Dog();
  dog.name = 'pepsi';
  print(dog.name);

  dog.dogInfo(dog.name!);
  var cat = Cat(name: "Coke");
  print(cat.id);
}

getArea(int width, int? height) {
  if (width == null || height == null) return 0;
  return width * height;
}

class Dog {
  String? name;

  //constructor
  Dog({this.name});

  dogInfo(String str) {
    print('Dog name is ${this.name}');
  }
}

class Cat {
  late int id;
  String? name;

  Cat({required this.name}) {
    id = DateTime.now().microsecondsSinceEpoch;
  }
}
