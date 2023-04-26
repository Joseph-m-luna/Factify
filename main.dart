import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class Palette {
  static const MaterialColor cinnamon = const MaterialColor(
    0xff52322e, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    const <int, Color>{
      50: const Color(0xff59352e),//10%
      100: const Color(0xff653f38),//20%
      200: const Color(0xff462525),//30%
      300: const Color(0xff4f2926),//40%
      400: const Color(0xff52322e),//50%
      500: const Color(0xff5c261d),//60%
      600: const Color(0xff451c16),//70%
      700: const Color(0xff2e130e),//80%
      800: const Color(0xff170907),//90%
      900: const Color(0xff000000),//100%
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Naviation Demo',
      theme: ThemeData(
        primarySwatch: Palette.cinnamon,
      ),
      home: const FirstPage(title: 'FirstPage'),
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const SearchList(title: 'Search Results');
            }));
          },
          child: const Text('Next'),
        ),
      ),
    );
  }
}

class SearchList extends StatelessWidget {
  const SearchList({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    List listOfItems=List.generate(20, (index) => 'Sample Item - $index');
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.separated(
        itemCount: listOfItems.length,
        itemBuilder: (BuildContext context,int index){
          return ListTile(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const InfoView(title: 'Title');
              }));
            },
            title: Text(listOfItems[index]),
            subtitle: Text('Sample subtitle for item #$index'),
            leading: Container(
              height: 50,
              width: 50,
              color: Colors.amber,
            ),
            trailing: Icon(Icons.edit),
          );
        }, separatorBuilder: (BuildContext context, int index) {
        return const Divider();
      }, ),


      /*body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go Back'),
        ),
      ),*/
    );
  }
}

class InfoView extends StatelessWidget {
  const InfoView({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    List listOfItems=List.generate(20, (index) => 'Sample Item - $index');
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.separated(
        itemCount: listOfItems.length,
        itemBuilder: (BuildContext context,int index){
          return ListTile(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const InfoView(title: 'Search Results');
              }));
            },
            title: Text(listOfItems[index]),
            subtitle: Text('Sample subtitle for item #$index'),
            leading: Container(
              height: 50,
              width: 50,
              color: Colors.amber,
            ),
            trailing: Icon(Icons.edit),
          );
        }, separatorBuilder: (BuildContext context, int index) {
        return const Divider();
      }, ),


      /*body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go Back'),
        ),
      ),*/
    );
  }
}

class EditView extends StatelessWidget {
  const EditView({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const SearchList(title: 'Search Results');
            }));
          },
          child: const Text('Next'),
        ),
      ),
    );
  }
}
