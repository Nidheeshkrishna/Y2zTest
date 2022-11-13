import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_swipe_action_cell/flutter_swipe_action_cell.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:y2ztest/Blocks/WeatherBloc/bloc/weather_bloc_bloc.dart';
import 'package:y2ztest/Models/UserData.dart';
import 'package:y2ztest/UTILITY/Sizeconfig.dart';

const String dataBoxName = "user data";

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class Model {
  String id = UniqueKey().toString();
  int index = 0;

  @override
  String toString() {
    return index.toString();
  }
}

class SwipeActionPage extends StatefulWidget {
  const SwipeActionPage({Key? key}) : super(key: key);

  @override
  _SwipeActionPageState createState() => _SwipeActionPageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CupertinoButton.filled(
            child: const Text('Enter new page'),
            onPressed: () {
              Navigator.push(context,
                  CupertinoPageRoute(builder: (c) => const SwipeActionPage()));
            }),
      ),
    );
  }
}

class _SwipeActionPageState extends State<SwipeActionPage> {
  List<Model> list = List.generate(30, (index) {
    return Model()..index = index;
  });

  late SwipeActionController controller;

  Box<UserData>? dataBox;
  String boxname = "userdata";

  adddata(int id, int index) {
    UserData datanew;
    datanew = UserData(
      firstname: "",
      lastaname: "",
      emailId: "",
    );
    dataBox!.add(datanew);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.screenwidth,
      height: SizeConfig.screenheight - kToolbarHeight,
      child: SafeArea(
        top: true,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            actions: const [
              Icon(
                Icons.logout,
                size: 30,
                color: Colors.redAccent,
              ),
            ],
            title: const Text("User List"),
            automaticallyImplyLeading: true,
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.purple,
            onPressed: (() {
              Navigator.of(context).pushNamed("/adduser");
            }),
            child: const Icon(
              Icons.add,
              size: 30,
              color: Colors.white,
            ),
          ),
          body: SizedBox(
            width: SizeConfig.screenwidth,
            height: SizeConfig.screenheight - kToolbarHeight,
            child: Stack(
              children: [
                ValueListenableBuilder(
                    valueListenable: dataBox!.listenable(),
                    builder: (context, Box<UserData> items, _) {
                      List<int> keys;

                      keys = items.keys.cast<int>().toList();
                      return ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: keys.length,
                        itemBuilder: (context, index) {
                          final int key = keys[index];
                          final UserData? data = items.get(key);
                          return _item(context, index, data);
                        },
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    dataBox = Hive.box<UserData>(dataBoxName);
    controller = SwipeActionController(selectedIndexPathsChangeCallback:
        (changedIndexPaths, selected, currentCount) {
      print(
          'cell at ${changedIndexPaths.toString()} is/are ${selected ? 'selected' : 'unselected'} ,current selected count is $currentCount');

      ///I just call setState() to update simply in this example.
      ///But the whole page will be rebuilt.
      ///So when you are developing,you'd better update a little piece
      ///of UI sub tree for best performance....

      setState(() {});
    });
  }

  removefromList(String emailid) {
    UserData? data;
    final Map<dynamic, UserData> deliveriesMap = dataBox!.toMap();
    dynamic desiredKey;
    deliveriesMap.forEach((key, value) {
      if (value.emailId == emailid) {
        desiredKey = key;

        dataBox!.deleteAt(desiredKey);
      }
    });
  }

  Widget _item(BuildContext ctx, int index, UserData? data) {
    return SwipeActionCell(
      controller: controller,
      index: index,

      // Required!
      key: ValueKey(list[index]),

      /// Animation default value below
      // normalAnimationDuration: 400,
      // deleteAnimationDuration: 400,
      selectedForegroundColor: Colors.black.withAlpha(30),
      trailingActions: [
        SwipeAction(
            title: "delete",
            performsFirstActionWithFullSwipe: true,
            nestedAction: SwipeNestedAction(title: "confirm"),
            onTap: (handler) async {
              await handler(true);
              removefromList(data!.emailId.toString());
              list.removeAt(index);

              setState(() {});
            }),
      ],
      // leadingActions: [
      //   SwipeAction(
      //       title: "delete",
      //       onTap: (handler) async {
      //         await handler(true);
      //         list.removeAt(index);
      //         setState(() {});
      //       }),
      // ],
      child: GestureDetector(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 2),
          child: ListTile(
            isThreeLine: false,
            selectedColor: Colors.green[200],
            title: Text("First Name:  ${data!.firstname}",
                style: const TextStyle(fontSize: 15)),
            subtitle: Text("Email Id:  ${data.emailId}",
                style: const TextStyle(fontSize: 15)),
            trailing: InkWell(
                onTap: () {
                  final fetchlocation =
                      BlocProvider.of<WeatherBlocBloc>(context);

                  fetchlocation.add(WeatherFetchEvent());

                  Navigator.of(context).pushNamed("/weather");
                },
                child: const Icon(Icons.arrow_circle_right)),
          ),
        ),
      ),
    );
  }
}
