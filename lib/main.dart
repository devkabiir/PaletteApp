import 'package:flutter/material.dart';

class BasicAppBarSample extends StatefulWidget {
  @override
  _BasicAppBarSampleState createState() => new _BasicAppBarSampleState();
}

class _BasicAppBarSampleState extends State<BasicAppBarSample> with TickerProviderStateMixin{
  int _currentPageIndex = 0;


  void _select(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        bottomNavigationBar: new BottomNavigationBar(
          items: [
            new BottomNavigationBarItem(
              title: new Text('Editor'),
              icon: new Icon(Icons.create)
            ),
            new BottomNavigationBarItem(
              title: new Text('Favorites'),
              icon: new Icon(Icons.favorite)
            ),
            new BottomNavigationBarItem(
              title: new Text('Recents'),
              icon: new Icon(Icons.history)
            )
          ],
          onTap: _select,
          currentIndex: _currentPageIndex,
        ),
        body: new Padding(
          padding: const EdgeInsets.all(16.0),
          child: cards[_currentPageIndex],
        ),
      ),
    );
  }
}

class Choice {
  const Choice({ this.title, this.icon });
  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Car', icon: Icons.directions_car),
  const Choice(title: 'Bicycle', icon: Icons.directions_bike),
  const Choice(title: 'Boat', icon: Icons.directions_boat),
];

Palette testPalette1 = new Palette([
  Colors.red,
  Colors.purple,
  Colors.blue
]);

Palette testPalette2 = new Palette([
  Colors.blue,
  Colors.black,
  Colors.white,
  Colors.green
]);

Palette testPalette3 = new Palette([
  Colors.orange,
  Colors.brown
]);

List<Palette> recents = [testPalette2, testPalette1, testPalette3];
List<Palette> favorites = [testPalette3, testPalette2, testPalette1];

List<Widget> cards = <Widget>[
  new EditorPage(),
  new PaletteListPage(favorites),
  new PaletteListPage(recents)
];

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({ Key key, this.choice }) : super(key: key);

  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return new Card(
      color: Colors.white,
      child: new Center(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Icon(choice.icon, size: 128.0, color: textStyle.color),
            new Text(choice.title, style: textStyle),
          ],
        ),
      ),
    );
  }
}

class EditorPage extends StatefulWidget {
  @override
  _EditorPageState createState() => new _EditorPageState();
}

class _EditorPageState extends State<EditorPage> with TickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Text("Editor Page Here")
    );
  }
}


class FavoritesPage extends StatefulWidget {
  @override
  _FavoritesPageState createState() => new _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> with TickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      padding: new EdgeInsets.all(8.0),
      itemExtent: 20.0,
      itemBuilder: (BuildContext context, int index) {
        return new Text('Favorite $index');
      },
    );
  }
}

class Palette {
  List<Color> _colorList;
  
  Palette(this._colorList);

  List<Color> getColors(){
    return this._colorList;
  }

  void addColor(Color newColor){
    _colorList.add(newColor);
  }

  void removeColor(int index){
    _colorList.removeAt(index);
  }
  
  Card toCard() {
        return new Card(
          child: new Row(
                children: _createColorWidgets()
              )
        );
  }

  List<Expanded> _createColorWidgets() {
    List<Expanded> _colorWidgets = new List<Expanded>();
    _colorList.forEach((i) {
      _colorWidgets.add(
        new Expanded(
          child: new Container(
            color: i,
            width: 64.0,
            height: 64.0
          )
        )
      );
    });
    return _colorWidgets;
  }
}

// class PaletteWidget extends StatelessWidget {
//   final Palette _palette;

//   @override
//   Widget build(BuildContext context) {
//     return new Card(
//       child: new Row(
//             children:<Widget>[
//               new Expanded(
//                 child: new Container(
//                   color: Colors.red,
//                   width: 64.0,
//                   height: 64.0
//                 )
//               ),
//               new Expanded(
//                 child: new Container(
//                   color: Colors.blue,
//                   width: 64.0,
//                   height: 64.0
//                 )
//               ),
//               new Expanded(
//                 child: new Container(
//                   color: Colors.green,
//                   width: 64.0,
//                   height: 64.0
//                 )
//               ),
//             ]
//           )
//     );
//   }
// }


class PaletteListPage extends StatelessWidget {
  final List<Palette> _palettesList;

  PaletteListPage(this._palettesList);

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemExtent: 64.0,
      itemBuilder: (BuildContext context, int index) {
        return _palettesList[index].toCard();
      },
      itemCount: _palettesList.length
    );
    // new CustomScrollView(
    //   shrinkWrap: true,
    //   slivers: <Widget>[
    //     new SliverPadding(
    //       padding: const EdgeInsets.all(20.0),
    //       sliver: new SliverList(
    //         delegate: new SliverChildListDelegate(
    //           <Widget>[
    //             new Card(
    //               child: new Row(
    //                     children:<Widget>[
    //                       new Expanded(
    //                         child: new Container(
    //                           color: Colors.red,
    //                           width: 64.0,
    //                           height: 64.0
    //                         )
    //                       ),
    //                       new Expanded(
    //                         child: new Container(
    //                           color: Colors.blue,
    //                           width: 64.0,
    //                           height: 64.0
    //                         )
    //                       ),
    //                       new Expanded(
    //                         child: new Container(
    //                           color: Colors.green,
    //                           width: 64.0,
    //                           height: 64.0
    //                         )
    //                       ),
    //                     ]
    //                   )
    //             ),
    //             new ListTile(
    //               leading: const Icon(Icons.event_seat),
    //               title: const Text('The seat for the narrator'),
    //             ),
    //             new ListTile(
    //               leading: const Icon(Icons.event_seat),
    //               title: const Text('The seat for the narrator'),
    //             ),
    //             new ListTile(
    //               leading: const Icon(Icons.event_seat),
    //               title: const Text('The seat for the narrator'),
    //             ),
    //           ],
    //         ),
    //       ),
    //     ),
    //   ],
    // );
  }
}

void main() {
  runApp(new BasicAppBarSample());
}
