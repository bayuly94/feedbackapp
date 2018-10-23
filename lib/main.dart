import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_rating/flutter_rating.dart';


void main() => runApp(MyApp());

String fullname     = '';
String email    = '';
String answer1 = '';
String answer2 = '';
String answer3 = '';
double rating  = 0.0;
String smiley = '';

class MyApp extends StatelessWidget {

  void postFeedback() {
    var url = "http://client.gardana.id/feedback/add.php";
    var body = {
      "fullname" : fullname,
      "email"     : email,
      "answer1": answer1,
      "answer2": answer2,
      "answer3": answer3,
      "answer4": rating.toString(),
      "answer5": smiley,
    };
    print(body);
    http.post(url, body: body)
        .then((response) {
          print(response);

    });
  }

  

  void angrySmiley() {
    smiley = 'angry';
    print(smiley);
  }

  void sadSmiley() {
    smiley = 'sad';
    print(smiley);
  }
  
  void happySmiley() {
    smiley = 'happy';
    print(smiley);
  }
  
  void setRating(double rat) {
    rating = rat;
    print(rating);
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fetch Data Example'),
        ),
        body: Column(
          
          children: <Widget>[
            TextField(
              onChanged: (text) => fullname = text,
              decoration: InputDecoration(
                hintText: 'Please enter your name'
              ),
            ),
            TextField(
              onChanged: (text) => email = text,
              decoration: InputDecoration(
                hintText: 'Please enter your email'
              ),
            ),
            
            TextField(
              onChanged: (text) => answer1= text,
              decoration: InputDecoration(
                hintText: 'Answer 1'
              ),
            ),

            TextField(
              onChanged: (text) => answer2 = text,
              decoration: InputDecoration(
                hintText: 'Answer 2'
              ),
            ),

            TextField(
              onChanged: (text) => answer3 = text,
              decoration: InputDecoration(
                hintText: 'Answer 3'
              ),
            ),
            
            RatingState(),

            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FlatButton(
                  onPressed: angrySmiley,
                  child: Image(
                    image: AssetImage('angry.jpg'),
                    width: 50.0,
                    height: 50.0,
                  ),
                ),
                FlatButton(
                  onPressed: sadSmiley,
                  child: Image(
                    image: AssetImage('sad.jpg'),
                    width: 50.0,
                    height: 50.0,
                  ),
                ),
                FlatButton(
                  onPressed: happySmiley,
                  child: Image(
                    image: AssetImage('happy.jpg'),
                    width: 50.0,
                    height: 50.0,
                  ),
                ),
                
                
              ],
            ),
            
            new RaisedButton(
              padding: const EdgeInsets.all(8.0),
              textColor: Colors.white,
              color: Colors.blue,
              onPressed: postFeedback,
              child: new Text("Send"),
            ),
          ],
        ),
      ),
    );
  }


  
}

class RatingState extends StatefulWidget {
  @override
  _RatingState createState() => new _RatingState();

}

class _RatingState extends State<RatingState> {
  int starCount = 5;
  double rat = 3.0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return new Column(
      children: <Widget>[
        new StarRating(
          size: 50.0,
          rating: rat,
          color: Colors.orange,
          borderColor: Colors.grey,
          starCount: starCount,
          onRatingChanged: (rating) => setState(
                () {
                  rat = rating;
                  MyApp().setRating(rating);
                },
              ),
        ),
      ],
    );
  }

}