import 'package:flutter/material.dart';
import '../shared/components/constants.dart';
import 'assistants_list.dart';
import 'doctors_list.dart';

class AllOfAssist extends StatefulWidget {
  @override
  _AllOfAssistState createState() => _AllOfAssistState();
}

class _AllOfAssistState extends State<AllOfAssist> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Listing All Assistant",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold , fontStyle: FontStyle.italic),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Transform.translate(
                offset: Offset(0, -20),
                child: Container(
                  width: width,
                  padding: EdgeInsets.only(top: 25),
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50))),
                  child: DefaultTabController(
                      length: 2,
                      child: Column(
                        children: <Widget>[
                          TabBar(
                            labelColor: Colors.black,
                            labelStyle: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                            unselectedLabelColor: Color(0xff150e56),
                            unselectedLabelStyle: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontStyle: FontStyle.italic,
                                fontSize: 13),
                            indicatorSize: TabBarIndicatorSize.label,
                            indicatorColor: Colors.transparent,
                            tabs: <Widget>[
                              Tab(
                                child: Text("Assistant" , style :TextStyle( color: Color(0xFF4a1c40))),
                              ),
                              Tab(
                                child: Text("Doctors" , style :TextStyle( color: Color(0xFF4a1c40))),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 1,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                          ),
                          Container(
                            height: height * 1,
                            child: TabBarView(
                              children: <Widget>[
                                MyAssistants(),
                                MyDoctors(),
                              ],
                            ),
                          ),
                        ],
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
