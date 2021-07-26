import 'package:http/http.dart' as http;

class Service {
  final Map<String, String> contentType = {"Content-Type": "application/json"};

  //Condition Related API Service
  Future getAllConditionData(url, phrId) {
    var finalUrl = Uri.parse(url + phrId);
    return http.get(finalUrl);
  }

  //Notification Related API Service
  Future getAllNotifData(url, phrId) {
    var finalUrl = Uri.parse(url + phrId);
    return http.get(finalUrl);
  }

  Future updatePHRNotifStatus(url, status, notifId) {
    var finalUrl = Uri.parse(url + status + '/' + notifId);
    print(finalUrl);
    return http.put(finalUrl, headers: contentType);
  }

  //Patient Related API Service
  Future postPatientData(url, body) {
    return http.post(url, headers: contentType, body: body);
  }

  Future getPatientDataByPhone(url, phone) {
    var finalUrl = Uri.parse(url + phone);
    return http.get(finalUrl);
  }
}
