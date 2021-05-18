import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.blue,
      accentColor: Colors.cyan,
    ),
    home:MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override

  String studentName, studentID, studyProgramID, studentGPA;

  getStudentName(name){
    this.studentName = name;
  }

  getStudentID(id){
    this.studentID = id;
  }
  getStudyProgrameID(studyID){
    this.studyProgramID = studyID;
  }
  getStudentGPA(gpa){
    this.studentGPA = gpa;
  }

  creatData(){
    DocumentReference documentReference = FirebaseFirestore.instance.collection('crud').doc(studentName);

    Map<String, dynamic> student = {
      'studentName':studentName,
      'studentID':studentID,
      'studyProgrameID':studyProgramID,
      'studentGPA':studentGPA,
    };
    documentReference.set(student).whenComplete(() {print('created');});
  }

  readData(){
    DocumentReference documentReference = FirebaseFirestore.instance.collection('crud').doc(studentName);

    documentReference.get().then((datasnapshot) {
      print(datasnapshot.data());
    });
  }

  updateData(){
    DocumentReference documentReference = FirebaseFirestore.instance.collection('crud').doc(studentName);

    Map<String, dynamic> student = {
      'studentName':studentName,
      'studentID':studentID,
      'studyProgrameID':studyProgramID,
      'studentGPA':studentGPA,
    };
    documentReference.set(student).whenComplete(() {print('updated');});
  }

  deletData(){
    DocumentReference documentReference = FirebaseFirestore.instance.collection('crud').doc(studentName);
    documentReference.delete().whenComplete(() {
      print('deleted');
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text('CRUD Operation'),
      ),
      body:Column(
        children: [
          Padding(
            padding:EdgeInsets.all(8.0),
            child:TextFormField(
              decoration: InputDecoration(
                labelText: 'Name',
                fillColor: Colors.white,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color:Colors.blue,width: 2.0),
                ),
              ),
              onChanged: (studentName){
                getStudentName(studentName);
              },
            ),
          ),
          Padding(
            padding:EdgeInsets.all(8.0),
            child:TextFormField(
              decoration: InputDecoration(
                labelText: 'Student ID',
                fillColor: Colors.white,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color:Colors.blue,width: 2.0),
                ),
              ),
              onChanged: (String id){
                getStudentID(id);
              },
            ),
          ),
          Padding(
            padding:EdgeInsets.all(8.0),
            child:TextFormField(
              decoration: InputDecoration(
                labelText: 'Study Program ID',
                fillColor: Colors.white,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color:Colors.blue,width: 2.0),
                ),
              ),
              onChanged: (String studyProgramID){
                getStudyProgrameID(studyProgramID);
              },
            ),
          ),
          Padding(
            padding:EdgeInsets.all(8.0),
            child:TextFormField(
              decoration: InputDecoration(
                labelText: 'Student GPA',
                fillColor: Colors.white,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color:Colors.blue,width: 2.0),
                ),
              ),
              onChanged: (String GPA){
                getStudentGPA(GPA);
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RaisedButton(
                color:Colors.green,
                shape:RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child:Text('create'),
                textColor: Colors.white,
                onPressed: (){
                  creatData();
                },
              ),
              RaisedButton(
                color:Colors.blue,
                shape:RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child:Text('read'),
                textColor: Colors.white,
                onPressed: (){
                 readData();
                },
              ),
              RaisedButton(
                color:Colors.orange,
                shape:RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child:Text('update'),
                textColor: Colors.white,
                onPressed: (){
                  updateData();
                },
              ),
              RaisedButton(
                color:Colors.red,
                shape:RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child:Text('delete'),
                textColor: Colors.white,
                onPressed: (){
                  deletData();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

































// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// void main() async{
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MaterialApp(
//     debugShowCheckedModeBanner: false,
//     theme:ThemeData(
//       brightness: Brightness.light,
//       primaryColor: Colors.blue,
//       accentColor: Colors.cyan,
//     ),
//     home:MyApp(),
//   ));
// }
//
// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//
//   String studentName, studentID, studyProgramID, studentGPA;
//
//   getStudentName(name){
//     this.studentName = name;
//   }
//   getStudentID(id){
//     this.studentID = id;
//   }
//   getStudentStudyID(studyID){
//     this.studyProgramID = studyID;
//   }
//   getStudentGPA(gpa){
//     this.studentGPA = gpa;
//   }
//
//   createData(){
//    DocumentReference documentReference = FirebaseFirestore.instance.collection("crud").doc(studentName);
//
//    Map<String,dynamic> student = {
//      "studentName":studentName,
//      "studentID":studentID,
//      "studyProgrameID":studyProgramID,
//      "studentGPA":studentGPA
//    };
//    documentReference.set(student).whenComplete(() {print('created');});
//   }
//   readData(){
//
//   }
//   updateData(){
//     DocumentReference documentReference = FirebaseFirestore.instance.collection("crud").doc(studentName);
//
//     Map<String,dynamic> student = {
//       "studentName":studentName,
//       "studentID":studentID,
//       "studyProgrameID":studyProgramID,
//       "studentGPA":studentGPA
//     };
//     documentReference.set(student).whenComplete(() {print('updated');});
//   }
//   deleteData(){
//     DocumentReference documentReference = FirebaseFirestore.instance.collection('crud').doc(studentName);
//     documentReference.delete().whenComplete(() {
//       print('deleted!');
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar:AppBar(
//         title:Text('CRUD Operation'),
//       ),
//       body:Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextFormField(
//               decoration:InputDecoration(
//                 labelText: 'Name',
//                 fillColor:Colors.white,
//                 focusedBorder: OutlineInputBorder(
//                   borderSide: BorderSide(color:Colors.blue,width:2.0),
//                 ),
//               ),
//               onChanged: (String name){
//                 getStudentName(name);
//               },
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextFormField(
//               decoration:InputDecoration(
//                 labelText: 'Student ID',
//                 fillColor:Colors.white,
//                 focusedBorder: OutlineInputBorder(
//                   borderSide: BorderSide(color:Colors.blue,width:2.0),
//                 ),
//               ),
//               onChanged: (String id){
//                 getStudentID(id);
//               },
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextFormField(
//               decoration:InputDecoration(
//                 labelText: 'Study Program ID',
//                 fillColor:Colors.white,
//                 focusedBorder: OutlineInputBorder(
//                   borderSide: BorderSide(color:Colors.blue,width:2.0),
//                 ),
//               ),
//               onChanged: (String studyID){
//                 getStudentStudyID(studyID);
//               },
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextFormField(
//               decoration:InputDecoration(
//                 labelText: 'GPA',
//                 fillColor:Colors.white,
//                 focusedBorder: OutlineInputBorder(
//                   borderSide: BorderSide(color:Colors.blue,width:2.0),
//                 ),
//               ),
//               onChanged: (String gpa){
//                 getStudentGPA(gpa);
//               },
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               RaisedButton(
//                 color:Colors.green,
//                 shape:RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(16),
//                 ),
//                 child: Text('Create'),
//                 textColor: Colors.white,
//                 onPressed: (){
//                   createData();
//                 },
//               ),
//               RaisedButton(
//                 color:Colors.blue,
//                 shape:RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(16),
//                 ),
//                 child: Text('Read'),
//                 textColor: Colors.white,
//                 onPressed: (){
//                   readData();
//                 },
//               ),
//               RaisedButton(
//                 color:Colors.orange,
//                 shape:RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(16),
//                 ),
//                 child: Text('Update'),
//                 textColor: Colors.white,
//                 onPressed: (){
//                   updateData();
//                 },
//               ),
//               RaisedButton(
//                 color:Colors.red,
//                 shape:RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(16),
//                 ),
//                 child: Text('Delete'),
//                 textColor: Colors.white,
//                 onPressed: (){
//                   deleteData();
//                 },
//               ),
//             ],
//           ),
//           // StreamBuilder(
//           //   stream: FirebaseFirestore.instance.collection('crud').snapshots(),
//           //   builder: (context, snapshot){
//           //     if(snapshot.hasData){
//           //       return ListView.builder(
//           //         shrinkWrap: true,
//           //         itemCount: snapshot.data.documents.length,
//           //         itemBuilder: (context,index){
//           //           DocumentSnapshot documentSnapshot = snapshot.data.documents[index];
//           //           return Row(
//           //             children: [
//           //               Expanded(
//           //                 child:Text(documentSnapshot["studentName"]),
//           //               ),
//           //               Expanded(
//           //                 child:Text(documentSnapshot["studentID"]),
//           //               ),
//           //               Expanded(
//           //                 child:Text(documentSnapshot["studyProgrameID"]),
//           //               ),
//           //               Expanded(
//           //                 child:Text(documentSnapshot["studentGPA"]),
//           //               ),
//           //             ],
//           //           );
//           //         }
//           //       );
//           //     }
//           //   },
//           // ),
//         ],
//       ),
//     );
//   }
// }