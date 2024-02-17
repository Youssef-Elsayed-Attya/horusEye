import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;


class OCR_Model{

  var url='http://10.0.2.2:5000/predictApi';
  OCR_Model({required this.img});
  File img;
  postImg()async{
    final req=http.MultipartRequest("POST",Uri.parse(url));
    final header={"Content_type": "multipart/form-data"};
    req.files.add(http.MultipartFile('fileup',img!.readAsBytes().asStream(),img!.lengthSync(),
        filename: img!.path.split('/').last));
    req.headers.addAll(header);
    final myReq=await req.send();
    http.Response response=await http.Response.fromStream(myReq);
    if(myReq.statusCode==200){
      final resJson=jsonDecode(response.body);
      final res=resJson['prediction'];
      print(res);
      return res;
    }
    else {
      return 'error';
    }


  }
}