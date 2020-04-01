import 'package:flutter/material.dart';
import 'package:beela/models/place_model.dart';
import 'package:beela/services/place_service.dart';
import 'placedetail_screen.dart';


class PlacesScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState(){
  return new _PlacesScreenState();


}
}

class _PlacesScreenState extends State<PlacesScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Locais Indicados"),
      ),
      body: _createContent()
      
    );
  }

  Widget _createContent(){


    if(_places == null){
      return new Center(
        child: new CircularProgressIndicator(),
        );
    }else{

      return new ListView(
        children: _places.map((f){
          return new Card( child:
           new ListTile(
            title: new Text(f.name),
            leading: new Image.network(f.icon),
            subtitle: new Text(f.vicinity),
            trailing: new Column(
              children: <Widget>[
                new Icon(Icons.star_border, color: Colors.yellow,),
                Text(f.rating)
              ],
            ),
            onTap: () {detalhes(f);},

          ));
        }).toList()
      );

    }


  }

  detalhes(Place local){


    Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context)=> new PlaceDetailsScreen(local)));




  }


  List<Place> _places;
  @override void initState(){

    super.initState();

    PlaceService.get().getNearbyPlaces().then((data){

      this.setState((){
      _places = data;
      });


    });


  }



}