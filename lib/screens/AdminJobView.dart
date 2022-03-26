// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_crud_new/models/applyJob.dart';
import 'package:firebase_crud_new/models/job.dart';

import 'package:firebase_crud_new/provider/CommonProvider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdminJobView extends StatefulWidget {
  final Applicant appli;
  AdminJobView(this.appli);
  @override
  State<AdminJobView> createState() => _AdminJobView();
}

class _AdminJobView extends State<AdminJobView> {
  int _selectedIndex = 0;
  PageController pageController = PageController();
  void onTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    pageController.animateToPage(index,
        duration: Duration(milliseconds: 1000),
        curve: Curves.easeInOutCubicEmphasized);
  }

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    productProvider.ChangeApplicantID(widget.appli.ApplicantID);

    productProvider.ChangeStatus(widget.appli.Status);

    productProvider.ChangeApplicantAboutYou(widget.appli.AboutYou);
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: <Widget>[
                Text(
                  'Application ID : ',
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),

                TextField(
                  decoration: InputDecoration(
                    hintText: widget.appli.ApplicantID,
                    enabled: false,
                  ),
                ),
                Text(
                  'Full Name : ',
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: widget.appli.FullName,
                    enabled: false,
                  ),
                  onChanged: (value) {
                    productProvider.ChangeApplicantFullName(value);
                  },
                ),
                Text(
                  'Age : ',
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: widget.appli.Age,
                    enabled: false,
                  ),
                  onChanged: (value) {
                    productProvider.changeAplicantAge(value);
                  },
                ),

                Text(
                  'Expected Salary : ',
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: widget.appli.ExpectedSalary,
                    enabled: false,
                  ),
                  onChanged: (value) {
                    productProvider.ChangeApplicantexpectedSalary(value);
                  },
                ),
                Text(
                  'Highest Qualifiacion : ',
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: widget.appli.HighestQualifiaction,
                    enabled: false,
                  ),
                  onChanged: (value) {
                    productProvider.ChangeApplocantHughQalu(value);
                  },
                ),
                Text(
                  'CV Link : ',
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.bold,),
                ),
                TextField(
                  decoration:
                      InputDecoration(hintText: widget.appli.CVUploadedLink,enabled: false,),
                  onChanged: (value) {
                    productProvider.changeCV(value);
                  },
                ),

                SizedBox(
                  height: 20.0,
                ),
                // ignore: deprecated_member_use
                RaisedButton(
                    child: Text("Approve Job "),
                    onPressed: () {
                      productProvider.ApproveApplication();
                      Navigator.of(context).pop();
                    }),
                RaisedButton(
                    color: Colors.red,
                    child: Text("Decline Application"),
                    onPressed: () {
                      productProvider.DeclineApplication();
                      Navigator.of(context).pop();
                    }),
              ],
            ),
          ),
          Container(color: Colors.black),
          Container(color: Colors.brown),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        onTap: onTapped,
      ),
    );
  }
}
