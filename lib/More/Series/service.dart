import 'package:cricscore/More/Series/model.dart';
import 'package:http/http.dart';
import 'package:cricscore/api_key.dart' as key;

class HttpServices {
  Stream<Model> getSeries({required String type}) {
    return Stream.fromFuture(getData(type: type));
  }

  Future<Model> getData({required String type}) async {
    var res = await get(
      Uri.parse(
          'https://unofficial-cricbuzz.p.rapidapi.com/series/list?matchType=$type'),
      headers: {
        'X-RapidAPI-Host': 'unofficial-cricbuzz.p.rapidapi.com',
        'X-RapidAPI-Key': key.api_key,
      },
    );

    if(res.statusCode == 200) {
      return modelFromJson(res.body);
    }
    else{
      throw 'Can\'t Get Data...';
    }
  }
}
