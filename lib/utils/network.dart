import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:vvims/utils/session.dart';
import 'package:vvims/utils/utils.dart';
import 'network_errors.dart';
import 'network_utils.dart';

const String baseUrl = "http://10.0.2.2:8000/api/";

class Network {


  static Future<dynamic> get(endpoint) async {
    if(await NetworkUtils.hasNetwork()){
      var url = Uri.parse(baseUrl + endpoint);
      try {
        var response = await http.get(url, headers: await NetworkUtils.headers());

        if(response.statusCode == 200){
          return json.decode(response.body);
        } else{
          NetworkErrors.handleNetworkErrors(response);
        }
      } catch (e, stackTrace) {
        print(stackTrace);
      }
    } else{
      Utils.showToast(Colors.black, "No Internet Connection");
    }
  }


  static Future<dynamic> post({required String endpoint, dynamic data}) async {
    if(await NetworkUtils.hasNetwork()){
      var url = Uri.parse(baseUrl + endpoint);
      try {
        var response = await http.post(url, headers: await NetworkUtils.headers(), body: data);
        // log(response.statusCode.toString(), name: 'RESPONSE BODY FROM BK');
        // log(response.body.toString(), name: 'RESPONSE BODY FROM BK');
        if(response.statusCode == 200){
          return json.decode(response.body);
        } else{
          NetworkErrors.handleNetworkErrors(response);
        }
      } catch (e, stackTrace) {
        print(stackTrace);
        // Utils.showToast(Colors.red, "Request failed");
      }
    }else{
      Utils.showToast(Colors.black, "No Internet Connection");
    }

  }

  static Future<dynamic> multipart({required String endpoint, dynamic data}) async{
    var token = await SessionManager().getToken();
    if(await NetworkUtils.hasNetwork()){
      var url = Uri.parse(baseUrl + endpoint);
      try {
        var request = http.MultipartRequest('POST', url);
        request.headers.addAll({
          'Content-Type': 'multipart/form-data',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });

        // request.fields['departure'] = data['departure'] ?? '';
        // for(var i = 0; i < data['carImages'].length; i++){
        //   request.files.add(await http.MultipartFile.fromPath('carImages[]', data['carImages'][i]));
        // }

        var result = await request.send();
        var response = await http.Response.fromStream(result);
        if(response.statusCode == 200){
          return json.decode(response.body);
        } else{
          NetworkErrors.handleNetworkErrors(response);
        }

      } catch (e, stackTrace) {
        print(stackTrace);
        Utils.showToast(Colors.red, 'Request failed');
      }
    }else{
      Utils.showToast(Colors.black, "No Internet Connection");
    }
  }
}