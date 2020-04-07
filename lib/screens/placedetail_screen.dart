import 'package:beela/models/place_model.dart';
import 'package:beela/services/place_service.dart';
import 'package:flutter/material.dart';




class PlaceDetailsScreen extends StatefulWidget {
  Place _place;
  PlaceDetailsScreen(this._place);

  @override
  State<StatefulWidget> createState(){
    return new _PlaceDetailsScreenState();



  }
}


class _PlaceDetailsScreenState extends State<PlaceDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text(widget._place.name),
      ),
      body: new Center(
        child: _createContent(),

      ),

    );
  }
  Widget _createContent(){

    if(_isLoading){

      return new Center(
        child: CircularProgressIndicator(),
      );
    }
    else{


      return new Column(
        children: <Widget>[

          new Padding(
            padding: const EdgeInsets.all(5.0),
            child: new Text(widget._place.name, style:  new TextStyle(
                color: Colors.green
            ),
            ),

          ),

          new Divider(color:Colors.green,),

          getCard("Endereço", widget._place.formatted_address, Icons.location_on),
          getCard("Contato", widget._place.international_phone_number.toString() , Icons.phone)

        ],

      );


    }



  }

  Widget getCard(String header, String data, IconData iconData){

    return new Card(
      color: Colors.white,
      child: new Padding(
        padding: const EdgeInsets.all(10.0),
        child: new Column(

          children: <Widget>[

            new Row(
              children: <Widget>[
                new Text(header,style: new TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 18.0

                )),

                new Icon(iconData, color: Colors.green,)

              ],

            ),

            new Padding(
              padding: const EdgeInsets.only(bottom:10.0,top:10.0),
              child: new Text(data,textAlign: TextAlign.start,),

            ),


          ],
        ),

      ) ,
    );

  }



  bool _isLoading = true;
  @override void initState(){

    super.initState();
    PlaceService.get().getPlace(widget._place).then((data){

      this.setState((){

        widget._place = data;
        _isLoading = false;
      });

    });

  }


}