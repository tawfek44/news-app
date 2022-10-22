import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/layout/cubit/cubit.dart';
import 'package:news_app/modules/web_view_screen.dart';

Widget newsItem (list,index,context) => InkWell(
  onTap: (){
    Navigator.push(context, MaterialPageRoute(builder: (context) =>
        WebViewScreen(list[index]['url'])));
  },
  child:   Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        Container(
          width: 120.0,
          height: 120.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              image: DecorationImage(
                  image: NetworkImage('${list[index]['urlToImage']}'),
                  fit: BoxFit.cover
              )
          ),
        ),
        const SizedBox(width: 20.0,),
        Expanded(
          child: Container(
            height: 120.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    '${list[index]['title']}',
                    style: Theme.of(context).textTheme.bodyText1,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                ),
                Text(
                  '${list[index]['publishedAt']}',
                  style: const TextStyle(
                      color: Colors.grey
                  ),
                )
              ],
            ),
          ),
        )
      ],
    ),
  ),
);