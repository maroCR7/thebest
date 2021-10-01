import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thebest/provider/home_provider.dart';
import 'package:thebest/screens/article_details.dart';

import 'article_item.dart';

///list of articles
class ArticlesList extends StatelessWidget {
  const ArticlesList({
    Key? key, required this.type
  } ) : super(key: key);
  final String type;


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
                        .results![index],type: type,
                  )));
        },
        child: ArticleItem(
            article:
            Provider.of<HomeProvider>(context).homeModel!.results![index]),
      ),
    );
  }
}