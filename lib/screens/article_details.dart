import 'package:thebest/models/home_model.dart';
import 'package:flutter/material.dart';

class ArticleDetailsScreen extends StatelessWidget {
  final Result article;
  const ArticleDetailsScreen({Key? key,  required this.article}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( backgroundColor: Colors.blueGrey,title: Text("Article"),),
      body: SingleChildScrollView(
        child: Column(

          children: [
           ///article image
            Image.network(
              article.multimedia!
                  .firstWhere((element) => element.format == Format.SUPER_JUMBO)
                  .url!,
              width: double.infinity,
            ),
            ///article title
            Container(
              padding: const EdgeInsets.all(15),
              child: Text(
                article.title!,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
            ///article description
            Container(
              padding: const EdgeInsets.all(15),
              child: Text(
                article.resultAbstract!,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
