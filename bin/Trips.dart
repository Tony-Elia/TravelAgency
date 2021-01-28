import 'dart:io';

class Trips {
  int id;
  String location;
  int passLimit;
  int date;
  double price;
  double discPrice;

  Trips({this.id, this.location, this.passLimit, this.date, this.price}) {
    if (price > 10000) {
      discPrice = price - price * 0.2;
    } else {
      discPrice = 0;
    }
  }

  void details() {
    if (discPrice != 0) {
      print(
          '\nID: $id \n Location: $location \n Passengers Limit: $passLimit \n Date: $date \n Price: $price \n Price after discount: $discPrice');
    } else {
      print(
          '\nID: $id \n Location: $location \n Passengers Limit: $passLimit \n Date: $date \n Price: $price \n');
    }
  }

  void edit() {
    try {
      print('the ID..');
      id = int.parse(stdin.readLineSync());
      print('the Location..');
      location = stdin.readLineSync();
      print('the Passengers Limit..');
      passLimit = int.parse(stdin.readLineSync());
      print('the Date..');
      date = int.parse(stdin.readLineSync());
      print('the Price..');
      price = double.parse(stdin.readLineSync());
    } catch (e) {
      print('enter proper data type');
    }
    print('\nThe new details:\n');
    details();
  }

  void reserve() {
    passLimit -= 1;
    details();
  }
}
