import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'myFeedback.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class FeedbackView extends StatefulWidget {
  @override
  FeedbackViewState createState() => FeedbackViewState();
}

// the random state should extends xx
class FeedbackViewState extends State<FeedbackView> {
  // list of feedbacks
  final List<MyFeedback> feedbacks = [
    MyFeedback("extremely long uername username", "test content test co!ntent test long! long long long content t conte!nt test content test long long! long long content t co!ntent test content test lon!g long long long content test conten!t test content test content test content test !content test content test content test content test content test content", "assets/default.png", 1),
    MyFeedback("test headline2", "test content", "assets/default.png", 5),
    MyFeedback("test headline3", "test content", "assets/default.png", 3),
    MyFeedback("test headline4", "test content", "assets/default.png", 4),
    MyFeedback("test headline5", "test content", "assets/default.png", 4),
    MyFeedback("test headline6", "test content", "assets/default.png", 3),
    MyFeedback("test headline7", "test content", "assets/default.png", 5),
    MyFeedback("test headline8", "test content", "assets/default.png", 4),
    MyFeedback("test headline9", "test content", "assets/default.png", 3),
    MyFeedback("test headline10", "test content", "assets/default.png", 2),
    MyFeedback("test headline11", "test content", "assets/default.png", 4),
  ];
  // help!
//  List<int> _countRating() {
//
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        title: Text('Feedbacks'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
                Icons.favorite,
                color: Colors.white
            ),
            onPressed: () {},
          )
        ],
      ),
      body: _buildWholeView(),
    );
  }

  Widget _buildWholeView() {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: <Widget>[
            // child 1
            DecoratedBox(
              decoration: BoxDecoration(color: Colors.grey[200]),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [BoxShadow(
                      color: Colors.grey[400],
                      blurRadius: 10.0, // has the effect of softening the shadow
                      spreadRadius: 5.0, // has the effect of extending the shadow
                      offset: Offset(
                        5.0, // horizontal, move right 10
                        2.0, // vertical, move down 10
                      ),
                    )],
                  image: DecorationImage(
                    image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                    fit: BoxFit.cover
                  ),
                  ),
                  height: 200,
                ),
              ),
            ),

            // child 2 ---------------------------------------------
            Padding(
              padding: const EdgeInsets.only(bottom: 0, left: 12, top: 12),
              child: Container(
                child: Text(
                  "My Awsome & Beautiful Event Name",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),

            // child 3 ---the card------------------------------------------
            SizedBox(height: 12,),
            Container(
              width: 375,
              child: Card(
                  child: Row(
                    children: [
                      Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              /*2*/
                              Container(
                                padding: const EdgeInsets.only(bottom: 0, left: 12, top: 12),
                                child: Text(
                                  'Overall Rating',
                                  style: TextStyle(
                                    color: Colors.grey[500],
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(bottom: 8, left: 14),
                                child: Text(
                                  '6.0',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 44,
                                  ),
                                ),
                              ),
                            ],
                          )
                      ),
//                      Container( //
//                        child: Row(
//                          mainAxisSize: MainAxisSize.min,
//                          children: List.generate(5, (index) {
//                            return Icon(
//                              index < feedbacks[index].rating ? Icons.star : Icons.star_border,
//                              size: 14,
//                              color: Colors.amber,
//                            ); // todo add the histogram
//                          }),
//                        ),
//                      )

                    ],
                  )
              ),
            ),

            // child 4 -------------------------------
            Container(
              child: _buildFeedbacks(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeedbacks() {
    return ListView.separated(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.all(8),
        itemCount: feedbacks.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            //height: _dynamicHeight(feedbacks[index]),
            height: 120,
            color: Colors.white,
            child: Center(child: _buildRow(feedbacks[index])),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }

//  double _dynamicHeight(MyFeedback feedback) {
//    String text = feedback.content;
//    int length = text.length;
//    return (80 + length / 20 * 40);
//  }

  Widget _buildRow(MyFeedback feedback) {
    int _act = 1;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // ----------------- upper part --------------------------------------
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 0.0),
              // ---------------- avatar ----------------------------------
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            width: 40.0,
                            height: 40.0,
                            decoration: new BoxDecoration(
                              shape: BoxShape.circle,
                              image: new DecorationImage(
                                  fit: BoxFit.fill,
                                  image: new NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg')
                              ),
                            ),
                          ),
                        ],
                      )
                    )
                  ),
                  Expanded(
                    flex: 8,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new Flexible(
                              child: new Container(
                                padding: new EdgeInsets.only(right: 13.0),
                                child: new Text(
                                  feedback.username,
                                  overflow: TextOverflow.ellipsis,
                                  style: new TextStyle(
                                    fontSize: 20.0,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.bold,
                                    color: new Color(0xFF212121),
                                  ),
                                ),
                              )
                          ),
                          Container(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children:
                              List.generate(5, (index) {
                                return Icon(
                                  index < feedback.rating ? Icons.star : Icons.star_border,
                                  size: 14,
                                  color: Colors.amber,
                                );
                              }),
                            ),
                          )
                        ],
                      )
                    )
                  )
                ],
              )
            ),
          ),
          // ----------------- lower part --------------------------------------
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(5.0, 5.0, 0.0, 0.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Flexible(
                    child: new Container(
                      padding: new EdgeInsets.only(left: 13.0, bottom: 13.0),
                      child: new Text(
                        feedback.content,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: new TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'Roboto',
                          color: new Color(0xFF212121),
                        ),
                      ),
                    )
                  ),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 4.0)),
                ],
              ),
            )
          ),
        ],
      ),
    );
  }
}



class Sky extends CustomPainter {
  final double _width;
  final double _rectHeight;
  Sky(this._width, this._rectHeight);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRect(
      new Rect.fromLTRB(
          0.0, 0.0, this._width, _rectHeight
      ),
      new Paint()..color = new Color(0xFF0099FF),
    );
  }

  @override
  bool shouldRepaint(Sky oldDelegate) {
    return false;
  }
}