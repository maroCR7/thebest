import 'package:provider/src/provider.dart';
import 'package:thebest/provider/home_provider.dart';
import 'package:thebest/screens/article_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thebest/widgets/article_item.dart';
import 'package:thebest/widgets/list_articles.dart';
import 'package:thebest/widgets/loading.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Provider.of<HomeProvider>(context, listen: false).getHomeData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth >= 900){
      return Scaffold(
        body: Provider.of<HomeProvider>(context).loading
            ? Loading()
        ///to check the type of the device
            : HomeWidget(type: "desk",),
      );
    }else{
      return Scaffold(
        appBar:AppBar( backgroundColor: Colors.blueGrey,title: Text("Best"),),
        body: Provider.of<HomeProvider>(context).loading
            ? Loading()
        ///to check the type of the device
            : HomeWidget(type: "mobile"),
      );
    }

  }
}

class HomeWidget extends StatelessWidget {
  const HomeWidget({
    Key? key ,required this.type
  } ) : super(key: key);
  final String type;
  @override
  Widget build(BuildContext context) {
    return CheckDeviceType(type: type,);
  }
}

class CheckDeviceType extends StatelessWidget {
  const CheckDeviceType({
    Key? key, required this.type
  } ) : super(key: key);
 final String type;
  @override
  Widget build(BuildContext context) {

    if (type=="desk") {
      ///desktop
      return Row(
        children: [
          Expanded(flex: 1, child: Container()),
          Expanded(flex: 3, child: ArticlesList(type:type)),
          Expanded(flex: 1, child: Container()),
        ],
      );
    } else {
      ///mobile
      return ArticlesList(type: type,);
    }
  }
}

