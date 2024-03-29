import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:delivery/core/class/statuscode.dart';

import 'package:http/http.dart' as http;

import '../functions/checkinternet.dart';

String _basicAuth = 'Basic ' + base64Encode(utf8.encode('ahmad:ahmad12345'));

Map<String, String> myheaders = {'authorization': _basicAuth};

class Crud {
  Future<Either<StatusRequest, Map>> postData(String linkurl, Map data) async {
    try {
      if (await checkInternet()) {
        var response =
            await http.post(Uri.parse(linkurl), headers: myheaders, body: data);
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responsebody = jsonDecode(response.body);
          print(responsebody);
          return Right(responsebody);
        } else {
          return const Left(StatusRequest.serverfailure);
        }
      } else {
        return const Left(StatusRequest.offlinefailure);
      }
    } catch (_) {
      return const Left(StatusRequest.serverException);
    }
  }
}
