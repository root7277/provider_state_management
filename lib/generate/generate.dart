void main() {
  List<Fruits> fruit = [];

  data.forEach((element) {
    fruit.add(Fruits(name: element['name'], price: element['price'], isActive: element['isActive']));
  });

  data.map((e) {
    fruit.add(Fruits(name: e['name'], price: e['price'], isActive: e['isActive']));
  });

  List b = List.generate(fruit.length, (index) {
    print('nomi: ${fruit[index].name}, price: ${fruit[index].price}');
  });

  print(fruit[0].name);
  print(b);
}

List data = [
  {
    "name": "apple",
    "price": 20,
    "isActive": false,
  },
  {
    "name": "orange",
    "price": 15,
    "isActive": true,
  },
  {
    "name": "kiwi",
    "price": 30,
    "isActive": false,
  }
];

class Fruits {
  String name;
  int price;
  bool isActive;

  Fruits({required this.name, required this.price, required this.isActive});
}
