// ignore_for_file: prefer_interpolation_to_compose_strings

import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:medicte/snapi_data/doctor.dart';
import 'package:percent_indicator/percent_indicator.dart';

class DoctorCard extends StatefulWidget {
  const DoctorCard({Key? key}) : super(key: key);

  @override
  State<DoctorCard> createState() => _DoctorCardState();
}

class _DoctorCardState extends State<DoctorCard> {
  List<Doctor> doctors = [];
  /*Future getDoctors() async {
    var data = await http.get(Uri.parse("https://admin.medicte.ca/doctors/"));
    var jsonData = json.decode(data.body);
    for (var d in jsonData) {
      doctors.add(Doctor(
          id: d["id"],
          doctorName: d["doctorName"],
          doctorEducationAndCareer: d["doctorEducationAndCareer"],
          doctorDescription: d["doctorDescription"],
          mest_healt_hospital: d["mest_healt_hospital"],
          doctorCustom: d["doctorCustom"],
          doctorHighlights: d["doctorHighlights"],
          doctorImageUrl: "https://admin.medicte.ca" + d["doctorImage"]["url"],
          speciality: d["doctor_specialities"][0]["Speciality"],
          mest_health_treatment_categories:
              d["mest_health_treatment_categories"]));
    }
    return doctors;
  }*/
  Future getDoctors() async {
    var data = await http.get(Uri.parse("https://admin.medicte.ca/doctors/"));
    var jsonData = json.decode(data.body);
    for (var d in jsonData) {
      doctors.add(Doctor(
          id: d["id"],
          doctorName: d["doctorName"],
          doctorEducationAndCareer: d["doctorEducationAndCareer"],
          doctorDescription: d["doctorDescription"],
          mest_healt_hospital: d["mest_healt_hospital"],
          doctorCustom: d["doctorCustom"],
          doctorHighlights: d["doctorHighlights"],
          doctorImageUrl: "https://admin.medicte.ca" + d["doctorImage"]["url"],
          speciality: d["doctor_specialities"][0]["Speciality"],
          mest_health_treatment_categories:
              d["mest_health_treatment_categories"]));
    }
    return doctors;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getDoctors(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return CircularPercentIndicator(
              lineWidth: 12,
              progressColor: Colors.cyan.shade400,
              backgroundColor: Colors.cyan.shade200,
              radius: 50,
              percent: 1,
              curve: Curves.decelerate,
              circularStrokeCap: CircularStrokeCap.round,
              animation: true,
              center: Image.asset(
                "lib/images/Medicte_cropped.png",
                height: 60,
                width: 60,
              ),
              animationDuration: 2500,
            );
          } else {
            return ListView.builder(
                itemCount: 9,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Container(
                      width: 200,
                      decoration: BoxDecoration(
                          color: Colors.cyan.shade200,
                          borderRadius: BorderRadius.circular(12)),
                      padding: const EdgeInsets.all(12),
                      child: Column(children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.network(
                            snapshot.data[index].doctorImageUrl,
                            height: 120,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Center(
                          child: Expanded(
                            child: Text(
                              snapshot.data[index].doctorName,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Center(
                          child: Expanded(
                            child: Text(
                              snapshot.data[index].speciality,
                            ),
                          ),
                        ),
                      ]),
                    ),
                  );
                });
          }
        });
  }
}
