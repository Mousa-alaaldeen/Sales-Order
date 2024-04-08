// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:login/models/saleso_mdel.dart';
import 'package:login/screens/login/login_screen.dart';

class HomeScreen extends StatefulWidget {
  final List<SalesModel> salesList;

  const HomeScreen({
    Key? key,
    required this.salesList,
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<SalesModel> displayedSalesList;

  @override
  void initState() {
    super.initState();
    displayedSalesList = widget.salesList;
  }

  void searchSales(String searchTerm) {
    setState(() {
      if (searchTerm.isEmpty) {
        displayedSalesList = widget.salesList;
      } else {
        displayedSalesList = widget.salesList.where((sale) =>
            sale.salesId!.toLowerCase().contains(searchTerm.toLowerCase())).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Invoices',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.teal,
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Confirm Logout'),
                    content: Text('Are you sure you want to log out?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('No'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                          );
                        },
                        child: Text('Yes'),
                      ),
                    ],
                  );
                },
              );
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
           
            TextField(
              onChanged: (value) => searchSales(value),
              decoration: InputDecoration(
                labelText: 'Search by Sales ID',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: displayedSalesList.length,
                itemBuilder: (context, index) {
                  return _buildSalesItem(context, displayedSalesList[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSalesItem(BuildContext context, SalesModel sales) {
    String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.parse(sales.deliveryDate!));

    return GestureDetector(
      onTap: () {
        // Add functionality to navigate to invoice details screen here
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sales ID: ${sales.salesId}',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Customer: ${sales.customer}',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[800],
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Delivery Date: $formattedDate',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[800],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
