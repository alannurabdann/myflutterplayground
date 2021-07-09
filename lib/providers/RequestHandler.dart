import 'package:dio/dio.dart';
import 'package:flutter_app/models/Cake.dart';
import 'package:get/get.dart' as Getx;
import 'package:logger/logger.dart';

class RequestHandler extends Getx.GetxController {
  late Dio dio;
  Response? response;
  var logger = new Logger();

  RequestHandler() {
    dio = new Dio();
    dio.options.baseUrl =
        "https://75a418ea-a346-4386-831e-c71106ceccc7.mock.pstmn.io";
    dio.options.connectTimeout = 30000;
    dio.options.receiveTimeout = 30000;
  }

  Options getHeaderOptions() {
    return Options(headers: {
      'accept': 'application/json',
      'authorization': 'Bearer blablabla'
    });
  }

  Future getCake(int page) async {
    try {
      response = await dio.get(
        "/cakes",
        queryParameters: {
          "page": page,
        },
        options: getHeaderOptions(),
      );

      List<Cake> listCake;

      int currentPage = response!.data['data']['current_page'];
      int totalPage = response!.data['data']['total_page'];
      var temp = response!.data['data']['items'] as List;

      //logger.e(currentPage.toString() + "/" + totalPage.toString());

      listCake = temp.map((item) => Cake.fromJson(item)).toList();

      if (currentPage <= totalPage) {
        return listCake;
      } else {
        return null;
      }
    } on DioError catch (ex) {
      logger.e(ex.message.toString());
      return null;
    } on Exception catch (e) {
      logger.e(e.toString());
      return null;
    }
  }
}
