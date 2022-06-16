import 'package:http/http.dart';
import 'model.dart';
import 'package:cricscore/api_key.dart' as key;

class HttpServices {

  Stream<Model> getVenues({required String seriesId}) {
    return Stream.fromFuture(getData(seriesId: seriesId));
  }

  Future<Model> getData({required String seriesId}) async {
    var res = await get(
      Uri.parse(
          'https://unofficial-cricbuzz.p.rapidapi.com/series/get-venues?seriesId=$seriesId'),
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