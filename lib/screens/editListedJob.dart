// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_crud_new/models/job.dart';

import 'package:firebase_crud_new/provider/CommonProvider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditJob extends StatefulWidget {
  final Job job;
  EditJob(this.job);
  @override
  State<EditJob> createState() => _EditJob();
}

class _EditJob extends State<EditJob> {
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
    productProvider.ChangeJobID(widget.job.Job_ID);
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: <Widget>[
                Text(
                  'Job Title : ',
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                TextField(
                  decoration: InputDecoration(hintText: widget.job.Designation),
                  onChanged: (value) {
                    productProvider.ChangeDesignation(value);
                  },
                ),
                Text(
                  'Employeer Name : ',
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                TextField(
                  decoration: InputDecoration(hintText: widget.job.Employeer),
                  onChanged: (value) {
                    productProvider.ChangeEmployeer(value);
                  },
                ),
                Text(
                  'Company Website : ',
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                TextField(
                  decoration:
                      InputDecoration(hintText: widget.job.Employeer_Website),
                  onChanged: (value) {
                    productProvider.ChangeEmployeerWebsite(value);
                  },
                ),
                Text(
                  'Estimated Salary : ',
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                TextField(
                  decoration:
                      InputDecoration(hintText: widget.job.Estimated_Salary),
                  onChanged: (value) {
                    productProvider.ChangeEsitmatedSalry(value);
                  },
                ),
                Text(
                  'Job Description : ',
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                TextField(
                  decoration: InputDecoration(hintText: widget.job.Designation),
                  onChanged: (value) {
                    productProvider.ChangeJobDescription(value);
                  },
                ),
                Text(
                  'Job Qualifications : ',
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                TextField(
                  decoration:
                      InputDecoration(hintText: widget.job.Job_Qualifications),
                  onChanged: (value) {
                    productProvider.ChangeJobQulaifation(value);
                  },
                ),
                Text(
                  'Contact Email : ',
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                TextField(
                  decoration: InputDecoration(hintText: widget.job.Email),
                  onChanged: (value) {
                    productProvider.ChangeEmail(value);
                  },
                ),
                Text(
                  'Contact Number : ',
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                TextField(
                  decoration:
                      InputDecoration(hintText: widget.job.Contact_Number),
                  onChanged: (value) {
                    productProvider.ChangeContactNumber(value);
                  },
                ),
                Text(
                  'Job Location : ',
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                TextField(
                  decoration: InputDecoration(hintText: widget.job.JobLocation),
                  onChanged: (value) {
                    productProvider.ChangeJobLocation(value);
                  },
                ),
                Text(
                  'Job Catergory : ',
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                TextField(
                  decoration: InputDecoration(hintText: widget.job.JobCat),
                  onChanged: (value) {
                    productProvider.ChangeJobCateogry(value);
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                // ignore: deprecated_member_use
                RaisedButton(
                    child: Text("Update Job"),
                    onPressed: () {
                      productProvider.UpdateJobListing();
                      Navigator.of(context).pop();
                    }),
                RaisedButton(
                    color: Colors.red,
                    child: Text("Remove Job"),
                    onPressed: () {
                      final docUser = FirebaseFirestore.instance
                          .collection('job')
                          .doc(widget.job.Job_ID);
                      docUser.delete();
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
