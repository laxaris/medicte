import 'package:flutter/material.dart';

class GetContact extends StatefulWidget {
  const GetContact({Key? key}) : super(key: key);

  @override
  State<GetContact> createState() => _GetContact();
}

class _GetContact extends State<GetContact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[50],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text("First & Last Name",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.deepOrange[100],
                    borderRadius: BorderRadius.circular(15)),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: "i.e. John Doe")),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text("Email",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.deepOrange[100],
                    borderRadius: BorderRadius.circular(15)),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "i.e. john@mail.com")),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text("Email",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.deepOrange[100],
                    borderRadius: BorderRadius.circular(15)),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "i.e. +1-234-567-7890")),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text("Email",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.deepOrange[100],
                    borderRadius: BorderRadius.circular(15)),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "i.e. I need a help")),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text("Message",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ],
              ),
              Container(
                height: 200,
                decoration: BoxDecoration(
                    color: Colors.deepOrange[100],
                    borderRadius: BorderRadius.circular(15)),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      )),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      buttonTest(context);
                    },
                    style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(
                            const Size.fromHeight(70)),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.all(
                            Colors.deepOrange.shade100)),
                    child: const Text(
                      "Send Message",
                      style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void buttonTest(BuildContext context) {
    var alertDialog = AlertDialog(
      title: const Text("Simple Alert"),
      content: const Text("This is an alert message"),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
              Future.delayed(const Duration(milliseconds: 500), () {
                Navigator.pop(context);
              });
            },
            child: const Text("OK"))
      ],
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }
}
