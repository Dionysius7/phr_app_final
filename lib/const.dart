class Const {
  //System Variable
  final String genderSystem = "http://hl7.org/fhir/administrative-gender";
  final String nikSystem = "https://us-central1-phr-api.cloudfunctions.net/nik";
  final String bpjsSystem =
      "https://us-central1-phr-api.cloudfunctions.net/bpjs";

  //Condition Const
  final String phrConditionGet =
      "https://us-central1-phr-api.cloudfunctions.net/condition/";

  //Notification Const
  final String phrNotifGet =
      "https://us-central1-phr-api.cloudfunctions.net/notification/";
  final String phrNotifUpdate =
      "https://us-central1-phr-api.cloudfunctions.net/notification/";

  //Patient Const
  final String phrPatientPost =
      "https://us-central1-phr-api.cloudfunctions.net/patient/";

  //Login Const
  final String phrLoginPatient =
      "https://us-central1-phr-api.cloudfunctions.net/login/";
}
