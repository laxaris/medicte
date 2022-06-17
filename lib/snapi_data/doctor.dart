// ignore_for_file: prefer_typing_uninitialized_variables, non_constant_identifier_names
class Doctor {
  int id;
  String doctorName;
  var doctorEducationAndCareer;
  var doctorDescription;
  var mest_healt_hospital;
  var doctorCustom;
  bool doctorHighlights;
  String doctorImageUrl;
  String speciality;
  List<dynamic> mest_health_treatment_categories;

  Doctor({
    required this.id,
    required this.doctorName,
    required this.doctorEducationAndCareer,
    required this.doctorDescription,
    required this.mest_healt_hospital,
    required this.doctorCustom,
    required this.doctorHighlights,
    required this.doctorImageUrl,
    required this.speciality,
    required this.mest_health_treatment_categories,
  });
}
