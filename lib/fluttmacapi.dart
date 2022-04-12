import 'dart:convert';

import 'package:apicar/model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:http/http.dart' as http;

class Macapi extends StatefulWidget {
  const Macapi({Key? key}) : super(key: key);

  @override
  State<Macapi> createState() => _MacapiState();
}

class _MacapiState extends State<Macapi> {
  Users users = Users();
  @override
  void initState() {
    gdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          elevation: 0,
          backgroundColor: Colors.grey[800],
        ),
        body: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(color: Colors.grey[800]),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Container(
                    decoration: BoxDecoration(color: Colors.white),
                  ),
                ),
              ],
            ),
            users.data == null
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: users.data!.length,
                    itemBuilder: (ctx, index) {
                      return Padding(
                        padding: const EdgeInsets.all(18),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (ctx) {
                              return Scaffold(
                                appBar: AppBar(
                                  backgroundColor: Colors.black,
                                  centerTitle: true,
                                  title: Text(users.data![index].car_name,
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600)),
                                ),
                                body: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                        flex: 1,
                                        child: Image.asset('Aassets/car.png')),
                                    Card(
                                      color: Colors.red[900],
                                      child: Padding(
                                        padding: const EdgeInsets.all(12),
                                        child: Text(
                                          'Category  ' + checkcategory(index),
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            right: 22, left: 22, bottom: 22),
                                        child: Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                  'car hp : ' +
                                                      users.data![index].car_hp
                                                          .toString(),
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w600)),
                                              Text(
                                                  'Suspension : ' +
                                                      users.data![index]
                                                          .car_suspension,
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w600)),
                                              Text(
                                                  'Transmission : ' +
                                                      users.data![index]
                                                          .car_transmission,
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w600)),
                                              Text(
                                                  'WheelType : ' +
                                                      users.data![index]
                                                          .car_wheelType,
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w600)),
                                            ],
                                          ),
                                          decoration: BoxDecoration(
                                              color:
                                                  Colors.black.withOpacity(.5),
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            }));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(30)),
                            height: 170,
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20),
                                            child: Icon(
                                              FontAwesomeIcons.carSide,
                                              color: Colors.grey,
                                              size: 50,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          users.data![index].car_name,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                VerticalDivider(),
                                Expanded(
                                  flex: 4,
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 5),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              Icon(
                                                FontAwesomeIcons.car,
                                                color: Colors.red[900],
                                              ),
                                              Text('Transmission : ',
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600)),
                                              Text(
                                                  users.data![index]
                                                      .car_transmission,
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600)),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.car_rental,
                                                color: Colors.red[900],
                                              ),
                                              Text('Suspension  : ',
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600)),
                                              Text(
                                                  users.data![index]
                                                      .car_suspension,
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600)),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.circle_outlined,
                                                color: Colors.red[900],
                                              ),
                                              Text('Wheel Type  : ',
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600)),
                                              Text(
                                                  users.data![index]
                                                      .car_wheelType,
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600)),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              Icon(
                                                FontAwesomeIcons.lightbulb,
                                                color: Colors.red[900],
                                              ),
                                              Text('HeadlightType : ',
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600)),
                                              Text(
                                                  users.data![index]
                                                      .car_headlightType,
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600)),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
          ],
        ));
  }

  var json;

  gdata() async {
    var url = Uri.parse('https://mobiledev.refogen.com/api/v1/cars/getAllCars');
    var response = await http.get(url);

    json = jsonDecode(response.body);
    setState(() {
      users = Users.fromJson(json);
    });
  }

  checkcategory(index) {
    String a = '';
    if (users.data![index].category_id == 1) {
      a = 'SUV';
    }
    if (users.data![index].category_id == 2) {
      a = 'SEDAN';
    }
    if (users.data![index].category_id == 3) {
      a = 'HACTHBACK';
    }
    if (users.data![index].category_id == 4) {
      a = 'MPV';
    }
    return a;
  }
}
