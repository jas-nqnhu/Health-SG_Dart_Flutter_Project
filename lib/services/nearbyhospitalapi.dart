import 'package:http/http.dart' as http;
import '/models/healthArticles.dart';
class HttpService {
static const String url = 
'https://developers.onemap.sg/commonapi/search?searchVal=hospital&returnGeom=Y&getAddrDetails=N&pageNum=1';

static Future<List<Article>> getHealthArticles() async {
 try {
  final response = await http.get(Uri.parse(url), headers: {
   'accept': 'application/json'
  });
  if (response.statusCode == 200){
   final HealthArticles healthArticles = healthArticlesFromJson(response.body);
   return healthArticles.articles;
    } else {
   // ignore: deprecated_member_use
   return List<Article>();
  }
  } catch (e) {
  print('Error ${e.toString()}');
  // ignore: deprecated_member_use
  return List<Article>();
 }
}//getCarparks
}//HttpService