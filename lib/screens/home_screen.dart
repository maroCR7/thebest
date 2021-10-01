import 'package:provider/src/provider.dart';
import 'package:thebest/provider/home_provider.dart';
import 'package:thebest/screens/article_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thebest/widgets/article_item.dart';
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
    return Scaffold(
      body: Provider.of<HomeProvider>(context).loading
          ? Loading()
      ///to check the type of the device
          : CheckDeviceType(),
    );
  }
}

class CheckDeviceType extends StatelessWidget {
  const CheckDeviceType({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth >= 900) {
      ///desktop
      return Row(
        children: [
          Expanded(flex: 1, child: Container()),
          Expanded(flex: 3, child: ArticlesList()),
          Expanded(flex: 1, child: Container()),
        ],
      );
    } else {
      ///mobile
      return ArticlesList();
    }
  }
}
///list of articles
class ArticlesList extends StatelessWidget {
  const ArticlesList({
    Key? key,

  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: Provider.of<HomeProvider>(context).homeModel!.results!.length,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ArticleDetailsScreen(
                        article: Provider.of<HomeProvider>(context)
                            .homeModel!
                            .results![index],
                      )));
        },
        child: ArticleItem(
            article:
                Provider.of<HomeProvider>(context).homeModel!.results![index]),
      ),
    );
  }
}
