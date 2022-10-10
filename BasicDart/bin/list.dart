void main() {
  List arr = [1.25, 2, 3, 4];
  print(arr);
  // List<int> arr2 = [1, 2, 3, 'hello', 4, 4.25];
  // print(arr2);
  var list = <int>[1, 2, 3, 4];
  print(list);

  List<int> g = <int>[];
  g.add(2);
  g.add(4);
  g.add(6);

  List<int> h = <int>[];
  h.add(100);
  h.add(200);
  h.add(300);

  //spread operator
  var a = [1, 2, 3, 4];
  var b = [-1, 0, 7, ...a];
  // b.remove(0);
  print(b);

  Map data = {'id': 1, 'name': 'Ann'};

  print(data['name']);

  Map<String, int> score = {'yong': 1, 'korn': 4};
  print(score['korn']);

  Map<String, int> product = {};
  product['A'] = 1000;
  product['B'] = 2000;

  for (var el in product.entries) {
    print('${el.key} ${el.value}');
  }



  
}
