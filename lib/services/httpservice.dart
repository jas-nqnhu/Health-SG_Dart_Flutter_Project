import 'package:http/http.dart' as http;
import '/models/healthArticles.dart';
class HttpService {
static const String url = 
'https://newsapi.org/v2/everything?q=covid-19&sortBy=popularity';

static Future<List<Article>> getHealthArticles() async {
 try {
  final response = await http.get(Uri.parse(url), headers: {
   'x-api-key': '4bf97956ba344f62b27c04b93108130e',
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