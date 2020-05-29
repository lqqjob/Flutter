//Dart中没有析构函数的.垃圾回收机制.

class Car {
  final String name;
  final String imageUrl;

  const Car({this.name, this.imageUrl});

//  Car.fromList(List<dynamic> list) {
//    name = list[0];
//    imageUrl = list[1];
//  }
//
//  Car.defaults(String name, String url) : this(name: name, imageUrl: url);
}
