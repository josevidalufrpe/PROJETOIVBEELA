import 'package:myapp/screens/places_screen.dart';
import 'package:flutter/material.dart';

import 'models/item.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
   
        primarySwatch: Colors.green,
      ),
      home: PlacesScreen(),
      
    );
  }
}


class HomePage extends StatefulWidget {

  var items = new List<Item>();
  
  HomePage(){

    items = [];
    items.add(Item(title:"Item 1",done:false));
    items.add(Item(title:"Item 2",done:true));
    items.add(Item(title:"Item 3",done:false));


  }


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("BeeLa App"),

      ),
      body: ListView.builder(
        itemCount: widget.items.length,
        itemBuilder: (BuildContext context, int index){
            
            final item = widget.items[index];
            
            return CheckboxListTile(
              
              title: Text(item.title),
              key: Key(item.title),
              value: item.done,

              onChanged: (value){

                setState(() {
                 
                 item.done = value;
   
                });
                
               
              },
            
            
            );

        },


      
      )


    );
  }
}

