import 'package:flutter/material.dart';

class BasicAppBarSample extends StatefulWidget {
  @override
  _BasicAppBarSampleState createState() => new _BasicAppBarSampleState();
}

class _BasicAppBarSampleState extends State<BasicAppBarSample> with TickerProviderStateMixin{
  Choice _selectedChoice = choices[0];
  int _currentPageIndex = 0;

  TabController tabController;

  void _select(int index) {
    setState(() {
      _currentPageIndex = index;
      tabController.animateTo(index);
    });
  }


  @override
  Widget build(BuildContext context) {
    tabController = new TabController(vsync: this, length: 2, initialIndex: 0);
    return new MaterialApp(
      home: new Scaffold(
        bottomNavigationBar: new BottomNavigationBar(
          items: [
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
        body: new TabBarView (
          controller: tabController,
          children: cards,
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
];

List<ChoiceCard> cards = <ChoiceCard>[
  new ChoiceCard(choice: choices[0]),
  new ChoiceCard(choice: choices[1])
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

void main() {
  runApp(new BasicAppBarSample());
}
