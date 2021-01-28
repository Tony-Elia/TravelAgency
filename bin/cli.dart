import 'dart:io';
import 'Trips.dart';

void main() {
  // assignment variables
  var tripList = [];
  var id;
  String location;
  var passLimit;
  var date;
  var price;

  // default trips
  var t1 = Trips(
      id: 1, location: 'Hurghada', passLimit: 50, date: 2021, price: 5000);
  var t2 =
      Trips(id: 2, location: 'Paris', passLimit: 2, date: 2030, price: 15000);
  var t3 = Trips(
      id: 3, location: 'Maldives', passLimit: 105, date: 2025, price: 2542);
  var t4 = Trips(
      id: 4, location: 'Moscow', passLimit: 255, date: 2022, price: 45656);
  var t5 =
      Trips(id: 5, location: 'Rio', passLimit: 0, date: 2023, price: 29874);

  // putting the default trips in the list
  tripList += [t1, t2, t3, t4, t5];

  void start() {
    void newTrip() {
      // assigmimg the trip details
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

        // creating the trip object from the Trips Class
        var addedTrip = Trips(
            id: id,
            location: location,
            passLimit: passLimit,
            date: date,
            price: price);

        tripList.add(addedTrip);

        print('\nYour new trip details:');
        addedTrip.details();
      } catch (e) {
        print('plaese insert proper data type!!\n');
      }

      start();
    }

    void showTrips() {
      print('-----------------------------');
      tripList.forEach((element) => element.details());
      print('-----------------------------');
      start();
    }

    void edit() {
      if (tripList.isNotEmpty) {
        print('-----------------------------');
        tripList.forEach((element) => element.details());
        print('-----------------------------');

        print('Enter trip ID you want to edit...');

        var result;
        try {
          result = int.parse(stdin.readLineSync());
        } catch (e) {
          print('please insert NUMBERS only!!');
          edit();
        }
        try {
          for (var i = 0; tripList.length > i; i++) {
            if (tripList[i].id == result) {
              tripList[i].edit();
            }
          }
        } catch (e) {
          print('Insert a valid ID!!');
          edit();
        }
      } else {
        print('There is no trips to edit');
      }

      start();
    }

    void delTrip() {
      if (tripList.isNotEmpty) {
        print('-----------------------------');
        tripList.forEach((element) => element.details());
        print('-----------------------------');

        print('Enter trip ID you want to delete...');

        var result;
        try {
          result = int.parse(stdin.readLineSync());
        } catch (e) {
          print('please insert NUMBERS only!!');
          edit();
        }
        try {
          for (var i = 0; tripList.length > i; i++) {
            if (tripList[i].id == result) {
              var deleted = tripList.removeAt(i);
              print('\nThe deleted trip: ');
              deleted.details();
            }
          }
        } catch (e) {
          print('Insert a valid ID!!');
          delTrip();
        }
      } else {
        print('There is no trips to delete');
      }

      start();
    }

    void search() {
      print('Enter the desired price');
      var result;
      try {
        result = double.parse(stdin.readLineSync());
      } catch (e) {
        print('please insert NUMBERS only!!');
        search();
      }

      var foundTrip = false;
      print('\nThe matched results:');
      for (var i = 0; tripList.length > i; i++) {
        if (tripList[i].price == result) {
          tripList[i].details();
          foundTrip = true;
        }
      }
      if (foundTrip == false) {
        print('There is no matching results\n');
      }
      start();
    }

    void reserve() {
      if (tripList.isNotEmpty) {
        print('-----------------------------');
        tripList.forEach((element) => element.details());
        print('-----------------------------');

        print('Enter trip ID you want to reserve...');

        var result;
        try {
          result = int.parse(stdin.readLineSync());
        } catch (e) {
          print('please insert NUMBERS only!!');
          edit();
        }
        try {
          var foundTrip = false;
          for (var i = 0; tripList.length > i; i++) {
            if (tripList[i].id == result && tripList[i].passLimit > 0) {
              print('\nThe reserved trip:');
              tripList[i].reserve();
              foundTrip = true;
            }
          }
          if (foundTrip == false) {
            print('The trip is full of passengers');
          }
        } catch (e) {
          print('Insert a valid ID!!');
          delTrip();
        }
      } else {
        print('There is no trips to reserve');
      }

      start();
    }

    void showLast() {
      if (tripList.length <= 10) {
        print('-----------------------------');
        tripList.forEach((element) => element.details());
        print('-----------------------------');
      } else {
        print('-----------------------------');
        for (var i = 0; i < 10; i++) {
          tripList[i].details();
        }
        print('-----------------------------');
      }

      start();
    }

    // start function
    print(
        '\n\n1.Add New Trip  2.Show all trips  3.Edit trip\n4.Delete a trip  5.Search by price  6.Reserve a trip  7.Show last 10 trips  8.View trips Passengers\n0.Exit');

    var ans;
    try {
      ans = int.parse(stdin.readLineSync());
    } catch (e) {
      print('please insert NUMBERS only!!');
      start();
    }
    ans == 1
        ? newTrip()
        : ans == 2
            ? showTrips()
            : ans == 3
                ? edit()
                : ans == 4
                    ? delTrip()
                    : ans == 5
                        ? search()
                        : ans == 6
                            ? reserve()
                            : ans == 7
                                ? showLast()
                                : ans == 0
                                    ? exit(0)
                                    : () {
                                        print('Enter valid number');
                                        start();
                                      };
  }

  start();
}
