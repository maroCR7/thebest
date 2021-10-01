import 'package:thebest/models/home_model.dart';
import 'package:dio/dio.dart';

class GetData {
  static Dio? dio;
  static String apiKey = '3mh2JkNo6RqrYZxAnNmdyvLdFnKBMfh9';
  static String mainUrl = "https://api.nytimes.com/svc/topstories/v2/home.json";

  static init() {
    dio = Dio();
  }

  static Future<Home> getHomeData() async {
    var params = {"api-key": apiKey};
///request to get the data
    Response response = await dio!.get(
      mainUrl,
      queryParameters: params,
    );
///transform the data to the model
    return Home.fromJson(response.data);
  }
}