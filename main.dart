import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '一週間のルーチン',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: '一週間のルーチン'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(children: <Widget>[
          Expanded(
            child: ListView(children: <Widget>[
              Expanded(
                child: Container(
                  height: 170,
                  color: Colors.red[600],
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NextPage('日曜日'),
                        ),
                      );
                    },
                    child: Text("日曜日",
                        style: TextStyle(
                          fontSize: 70,
                          color: Colors.white,
                        )),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 170,
                  color: Colors.orange[600],
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NextPage('月曜日'),
                        ),
                      );
                    },
                    child: Text("月曜日",
                        style: TextStyle(
                          fontSize: 70,
                          color: Colors.white,
                        )),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 170,
                  color: Colors.yellow[600],
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NextPage('火曜日'),
                        ),
                      );
                    },
                    child: Text("火曜日",
                        style: TextStyle(
                          fontSize: 70,
                          color: Colors.white,
                        )),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 170,
                  color: Colors.green[600],
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NextPage('水曜日'),
                        ),
                      );
                    },
                    child: Text("水曜日",
                        style: TextStyle(
                          fontSize: 70,
                          color: Colors.white,
                        )),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 170,
                  color: Colors.teal[600],
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NextPage('木曜日'),
                        ),
                      );
                    },
                    child: Text("木曜日",
                        style: TextStyle(
                          fontSize: 70,
                          color: Colors.white,
                        )),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 170,
                  color: Colors.blue[600],
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NextPage('金曜日'),
                        ),
                      );
                    },
                    child: Text("金曜日",
                        style: TextStyle(
                          fontSize: 70,
                          color: Colors.white,
                        )),
                  ),
                ),
              ),
              Expanded(
                  child: Container(
                height: 150,
                color: Colors.purple[600],
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NextPage('土曜日'),
                      ),
                    );
                  },
                  child: Text("土曜日",
                      style: TextStyle(
                        fontSize: 70,
                        color: Colors.white,
                      )),
                ),
              )),
            ]),
          ),
        ]),
      ),
    );
  }
}

class NextPage extends StatefulWidget {
  String title;
  NextPage(this.title);

  @override
  _NextPage createState() => _NextPage();
}

class _NextPage extends State<NextPage> {
  List<String> listItems = [];

  late SharedPreferences prefs;
  void _init() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> listItems = prefs.getStringList(title) ?? [];
    setState(() {
      this.listItems = listItems;
      this.prefs = prefs;
    });
  }

  @override
  void initState() {
    if (widget.title != null) {
      this.title = widget.title;
    }
    _init();
    super.initState();
  }

  late final String title;
  final todoTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(this.title),
        ),
        body: Column(children: <Widget>[
          Container(
            height: 70,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.7), color: Colors.white),
            margin: EdgeInsets.all(5.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: todoTextController,
                    decoration: InputDecoration(
                      hintText: 'ルーチンを入力してください',
                    ),
                  ),
                ),
                Container(
                  child: TextButton(
                    onPressed: () async {
                      SharedPreferences.getInstance().then((prefs) {
                        List<String> listItems =
                            prefs.getStringList(title) ?? [];
                        listItems.add(todoTextController.text);
                        prefs.setStringList(title, listItems);
                        setState(() {
                          this.listItems = listItems;
                          this.prefs = prefs;
                        });
                      });
                    },
                    child: Text("追加"),
                  ),
                )
              ],
            ),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: listItems.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(child: Text(listItems[index])),
                            SizedBox(
                              width: 40,
                              child: InkWell(
                                  child: Icon(
                                    Icons.remove_circle,
                                    color: Colors.redAccent,
                                  ),
                                  onTap: () async {
                                    listItems.removeAt(index);
                                    prefs.setStringList(title, listItems);
                                    setState(() {
                                      this.listItems = listItems;
                                    });
                                  }),
                            ),
                          ],
                        ),
                      ),
                    );
                  })),
        ]));
  }
}
