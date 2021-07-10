import 'package:http/http.dart' as http;
class Service {
  final Map<String,String> contentType = {"Content-Type":"application/json"};

  Future postPatientData(url,body) {
     return http.post(url, headers: contentType, body: body);
  }
  Future getPatientData(url,phrId){
    var finalUrl = Uri.parse(url + phrId);
    return http.get(finalUrl);
  }
  Future getPatientDataByPhone(url,phone){
    var finalUrl = Uri.parse(url + phone);
    return http.get(finalUrl);
  }
  Future getAllPatientData(url){
    var finalUrl = Uri.parse(url);
    return http.get(finalUrl);
  }
  Future getAllNotifData(url,phrId){
    var finalUrl = Uri.parse(url + phrId);
    return http.get(finalUrl);
  }
  Future postNotifToPHR(url,phrId) {
    var finalUrl = Uri.parse(url + phrId);
    return http.post(finalUrl, headers: contentType);
  }
  Future getAllConditionData(url,phrId){
    var finalUrl = Uri.parse(url + phrId);
    return http.get(finalUrl);
  }
  Future postConditionData(url, body, phrId) {
    var finalUrl = Uri.parse(url + phrId);
    return http.post(finalUrl, headers: contentType, body: body);
  }
  Future updatePHRNotifStatus(url, status, notifId){
    var finalUrl = Uri.parse(url + status + '/' + notifId);
    print(finalUrl);
    return http.put(finalUrl, headers:contentType);
  }
}