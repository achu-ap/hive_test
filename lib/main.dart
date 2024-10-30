// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
// import 'package:hive_flutter/adapters.dart';
// void main()async{
//   await Hive.initFlutter();
//   await Hive.openBox("counter");
//   runApp(MyApp());
// }
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     final box=Hive.box("counter");
//     return MaterialApp(
//       home:ValueListenableBuilder(valueListenable: box.listenable(),builder: (context,box,widget)=>Scaffold(
//         body:Container(
//           alignment: Alignment.center,
//           child:Text(box.get("count").toString()),
//         ),
//         floatingActionButton: FloatingActionButton(onPressed: (){
//           int? count=box.get("count");
//           box.put("count",(count??0)+1);
//         }),
//       ),)
//     );
//   }
// }

// ----------------------------------------------------------------------

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox("counter");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final box = Hive.box("counter");
    return MaterialApp(
        home: ValueListenableBuilder(
      valueListenable: box.listenable(),
      builder: (context, box, widget) => Scaffold(
        body: ListView(
          children: box.keys.map(
            (e) => ListTile(
              title: Text(
                box.get(e).toString(),
              ),
              trailing: IconButton(onPressed: (){
                box.delete(e);
              },
              icon:Icon(Icons.delete),),),
          ).toList(),
          ),
        floatingActionButton: FloatingActionButton(onPressed: () {
          int? length=box.length;
          box.add("item -${length+1}");
        }),
      ),
    ));
  }
}
