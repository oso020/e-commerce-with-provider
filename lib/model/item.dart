class Item {
  String imgPath;
  double price;
  String location;
  String name;

  Item({required this.imgPath, required this.name, required this.price, this.location = "Main branch"});
}

final List<Item> items = [
  Item(name: "product1", price: 12.99, imgPath: "assets/img/1.jpeg", location: "Ali shop"),
  Item(name: "product2", price: 12.99, imgPath: "assets/img/2.jpeg"),
  Item(name: "product3", price: 12.99, imgPath: "assets/img/3.jpeg"),
  Item(name: "product4", price: 12.99, imgPath: "assets/img/4.jpeg"),
  Item(name: "product5", price: 12.99, imgPath: "assets/img/5.jpeg"),
  Item(name: "product6", price: 12.99, imgPath: "assets/img/6.jpeg"),
  Item(name: "product7", price: 12.99, imgPath: "assets/img/7.jpeg"),
  Item(name: "product8", price: 12.99, imgPath: "assets/img/8.jpeg"),
  Item(name: "product8", price: 12.99, imgPath: "assets/img/9.jpeg"),
];
