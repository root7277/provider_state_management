void main() {
  List<Fruits> fruit = [];

  data.forEach((element) {
    fruit.add(Fruits(name: element['name'], price: element['price'], isActive: element['isActive']));
  });

  print(fruit[0].name);
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

  Fruits({
    required this.name,
    required this.price,
    required this.isActive
  })
}
