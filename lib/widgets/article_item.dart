import 'package:flutter/material.dart';
import 'package:thebest/models/home_model.dart';


class ArticleItem extends StatelessWidget {
  const ArticleItem({Key? key, required this.article}) : super(key: key);
  final Result article;


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(

      height: 300,
      clipBehavior: Clip.hardEdge,
      margin: EdgeInsets.only(top: size.height * 0.03,left:size.width * 0.05,right: size.width * 0.05 ),
      decoration: BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Image.network(
              article
                  .multimedia!
                  .firstWhere((element) => element.format == Format.SUPER_JUMBO)
                  .url!,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                            child: SizedBox(
                                child: Text(
                                  article.title!,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ))),
                        Flexible(
                            child: SizedBox(
                                child: Text(
                                  article.resultAbstract!,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                ))),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Flexible(
                            child: SizedBox(
                                child: (
                                     Icon(Icons.calendar_today_outlined)
                                ))),
                        Text(
                          article
                              .publishedDate
                              .toString()
                              .substring(0, 10),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

