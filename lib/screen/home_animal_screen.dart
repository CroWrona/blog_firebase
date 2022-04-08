import 'package:blog/screen/animal_screen.dart.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'add_animal_screen.dart';
import '../terrariumspiders/model.dart';
import 'login_screen.dart';

class HomeSpidersScreen extends StatefulWidget {
  const HomeSpidersScreen({Key? key}) : super(key: key);

  @override
  _HomeSpidersScreenState createState() => _HomeSpidersScreenState();
}

class _HomeSpidersScreenState extends State<HomeSpidersScreen> {

  final dbRef=FirebaseDatabase.instance.reference().child('Spiders');
  FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController _searchController = TextEditingController();
  String search='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff9fafc),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Home'),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Add_Spider()));
            },
            child: Icon(Icons.add),),
          SizedBox(width: 10,),
          InkWell(
            onTap: (){
              _auth.signOut().then((value){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SignInScreen()));
              });
              },
            child: Icon(Icons.logout),),
          SizedBox(width: 10,),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller :_searchController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  hintText: 'search',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder()
              ),
              onChanged: (String value){
                setState(() {
                  search=value;
                });
              },
            ),
            Expanded(
                child: FirebaseAnimatedList(
                  query: dbRef.child('Spiders List'),
                  itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index) {
                    Map m = Map.from((snapshot.value ?? {}) as Map);
                    String tempTitle=m['Spider_Name'];
                    final User? user = _auth.currentUser;

                    if(_searchController.text.isEmpty){
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: user?.email==m['Email']? Colors.blue.shade300:Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top:8.0,left: 8,right: 8),
                                child: Center(
                                  child: Text(m['Spider_Name'],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 20),),
                                ),
                              ),
                              InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => SpiderScreen(m: m,)));
                                },
                                child:Center(
                                  child:Animal(
                                    animal_Size: MediaQuery.of(context).size.width/3,
                                    animal_head_Color: m['Spider_head_Color'],
                                    animal_body_Color: m['Spider_body_Color'],
                                    animal_legs_Color: m['Spider_legs_Color'],
                                    animal_chelicer_Color: m['Spider_chelicer_Color'],
                                    animal_head_2: m['Spider_head_2'],animal_head_2_Color: m['Spider_head_2_Color'],
                                    animal_head_3: m['Spider_head_3'],animal_head_3_Color: m['Spider_head_3_Color'],
                                    animal_body_2: m['Spider_body_2'],animal_body_2_Color: m['Spider_body_2_Color'],
                                    animal_body_3: m['Spider_body_3'],animal_body_3_Color: m['Spider_body_3_Color'],
                                    animal_legs_2: m['Spider_legs_2'],animal_legs_2_Color: m['Spider_legs_2_Color'],
                                    animal_legs_3: m['Spider_legs_3'],animal_legs_3_Color: m['Spider_legs_3_Color'],
                                    animal_chelicer_2: m['Spider_chelicer_2'],animal_chelicer_2_Color: m['Spider_chelicer_2_Color'],
                                    animal_chelicer_3: m['Spider_chelicer_3'],animal_chelicer_3_Color: m['Spider_chelicer_3_Color'],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                    else if(tempTitle.toLowerCase().contains(_searchController.text.toString())){
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: user?.email==m['Email']? Colors.blue.shade300:Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top:8.0),
                                child: Center(
                                  child: Text(m['Spider_Name'],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 20),),
                                ),
                              ),
                              InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => SpiderScreen(m: m,)));
                                },
                                child:Center(
                                  child:Animal(
                                    animal_Size: MediaQuery.of(context).size.width/1.7,
                                    animal_head_Color: m['Spider_head_Color'],
                                    animal_body_Color: m['Spider_body_Color'],
                                    animal_legs_Color: m['Spider_legs_Color'],
                                    animal_chelicer_Color: m['Spider_chelicer_Color'],
                                    animal_head_2: m['Spider_head_2'],animal_head_2_Color: m['Spider_head_2_Color'],
                                    animal_head_3: m['Spider_head_3'],animal_head_3_Color: m['Spider_head_3_Color'],
                                    animal_body_2: m['Spider_body_2'],animal_body_2_Color: m['Spider_body_2_Color'],
                                    animal_body_3: m['Spider_body_3'],animal_body_3_Color: m['Spider_body_3_Color'],
                                    animal_legs_2: m['Spider_legs_2'],animal_legs_2_Color: m['Spider_legs_2_Color'],
                                    animal_legs_3: m['Spider_legs_3'],animal_legs_3_Color: m['Spider_legs_3_Color'],
                                    animal_chelicer_2: m['Spider_chelicer_2'],animal_chelicer_2_Color: m['Spider_chelicer_2_Color'],
                                    animal_chelicer_3: m['Spider_chelicer_3'],animal_chelicer_3_Color: m['Spider_chelicer_3_Color'],
                                  ),
                                ),

                              ),
                            ],
                          ),
                        ),
                      );
                    }
                    else{
                      return Container();
                    }


                  },
                ),
            ),

          ],
        ),
      ),
    );
  }
}