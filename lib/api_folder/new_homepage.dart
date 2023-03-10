import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import 'carddetails.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // return Container();
    return MaterialApp(
      title: 'CardDetails',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NewHomePage(),
    );
  }
}

class NewHomePage extends StatefulWidget {
  @override
  State<NewHomePage> createState() => _NewHomePageState();
}

class _NewHomePageState extends State<NewHomePage> {
  Map<String, dynamic> data = {
    "status": "success",
    "data": {
      "card": {
        "name": "Khaleefa sk",
        "cardnumber": "2312 7645 3745 6432",
        "avl_balance": "7566",
        "card_type": "VISA",
      },
      "statment": [
        {
          "name": "Venkatesh",
          "txn_date": "2-Mar-2023",
          "amount": "200",
          "type": "debit"
        },
        {
          "name": "teju",
          "txn_date": "28-Feb-2023",
          "amount": "150",
          "type": "credit"
        },
        {
          "name": "Venu",
          "txn_date": "28-Feb-2023",
          "amount": "300",
          "type": "credit"
        },
        {
          "name": "Rahul",
          "txn_date": "26-Feb-2023",
          "amount": "350",
          "type": "debit"
        },
        {
          "name": "nagendra",
          "txn_date": "24-Feb-2023",
          "amount": "250",
          "type": "debit"
        }
      ]
    }
  };
  @override
  Widget build(BuildContext context) {
    //  return Container();
    Map<String, dynamic> cardInfo = data['data']['card'];
    List<dynamic> transactions = data['data']['statment'];
    return Scaffold(
      body: SingleChildScrollView(
          child: SafeArea(
              child: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Home',
                  style: TextStyle(fontSize: 27, color: Colors.white),
                ),
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://images.unsplash.com/photo-1623230590824-f39e31a0a608?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8Ym95JTIwcG9zZXxlbnwwfHwwfHw%3D&w=1000&q=80'),
                ),
              ]),
        ),
        SizedBox(
          height: 20,
        ),
        //  FirstPage(),

        SafeArea(
            child: Column(children: [
          Container(
            width: 350,
            height: 200,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Colors.pinkAccent[200],
                borderRadius: BorderRadius.circular(24)),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 200),
                  child: Text(
                    cardInfo['name'],
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ),

                SizedBox(
                  height: 20,
                ),
                Text(cardInfo['cardnumber'], style: TextStyle(fontSize: 25)),

                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Row(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(cardInfo['avl_balance'],
                          style: TextStyle(fontSize: 20)),
                    ],
                  ),
                ),
                // SizedBox(
                //   width: 30,
                // ),
                Padding(
                  padding: const EdgeInsets.only(left: 120),
                  child: Text(
                    cardInfo['card_type'],
                    style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 32),
                child: Stack(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.lightBlueAccent[200],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 50, top: 50),
                      child: Text('Send'),
                    ),
                    Positioned(
                      top: 10,
                      left: 10,
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Icon(
                          Icons.arrow_forward,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      right: 10,
                      child: Container(
                        width: 80,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Center(
                          child: Text(
                            "send",
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Stack(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue,
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 10,
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      // child: Icon(Icons.arrow_forward_ios),
                      child: Icon(
                        Icons.arrow_upward,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: Container(
                      width: 80,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Center(
                        child: Text("Add"),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 20,
              ),
              Stack(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue,
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 10,
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Icon(
                        Icons.dashboard_outlined,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: Container(
                      width: 80,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Center(
                        child: Text("Add"),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 27),
            child: Column(
              children: [
                Stack(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 350,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.blueGrey[600],
                          ),
                          child: Container(
                            padding: EdgeInsets.all(15.0),
                            child: Row(
                              children: [
                                new CircularPercentIndicator(
                                  radius: 25.0,
                                  lineWidth: 4.0,
                                  animation: true,
                                  percent: 0.60,
                                  center: new Text(
                                    "70%",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  progressColor: Colors.pinkAccent[100],
                                  // child: Text('data')
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 170, top: 20),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('\$8,00',
                                style: TextStyle(
                                    fontSize: 25, color: Colors.white)),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 35,
                              ),
                              child: Text('Savings Account',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: 10,
                ),

                Padding(
                  padding: const EdgeInsets.only(right: 60),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Text('Transactions',
                            style:
                                TextStyle(fontSize: 30, color: Colors.white)),
                      ),
                      Text('     See All',
                          style: TextStyle(fontSize: 20, color: Colors.white))
                    ],
                  ),
                ),
                // ),
                // )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: transactions.length,
                itemBuilder: (BuildContext context, int index) {
                  final transaction = transactions[index];
                  return Container(
                    width: 300,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[200],
                    ),
                    child: ListTile(
                        leading: Text(
                          transaction['name'],
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                        title: Text(
                          transaction['txn_date'],
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                        trailing: Text(
                          transaction['amount'],
                          style: TextStyle(
                              fontWeight: transaction['type'] == 'debit'
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              color: transaction['type'] == 'debit'
                                  ? Colors.red
                                  : Colors.green),
                        )),
                  );
                }),
          ),
          SizedBox(
            height: 10,
          )
        ]))
      ]))),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.pink,
        onTap: (int index) {
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_chart_outlined), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.ios_share), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: ''),
        ],
      ),
    );
  }
}
