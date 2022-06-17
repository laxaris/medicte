// ignore_for_file: prefer_interpolation_to_compose_strings

import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../snapi_data/treatment_categories.dart';
import 'package:http/http.dart' as http;

class CategoryCard extends StatefulWidget {
  const CategoryCard({Key? key}) : super(key: key);

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  List<TreatmentCategories> categories = [];
  Future getCategories() async {
    var data = await http
        .get(Uri.parse("https://admin.medicte.ca/treatment-categories/"));
    var jsonData = json.decode(data.body);
    for (var c in jsonData) {
      categories.add(TreatmentCategories(
        id: c["id"],
        treatmentCategoryTitle: c['treatmentCategoryTitle'],
        treatmentCategoryDescription: c['treatmentCategoryDescription'],
        imageUrl:
            "https://admin.medicte.ca" + c['treatmentCategoryImage']['url'],
        iconUrl:
            "https://admin.medicte.ca" + c['treatmentCategoryImage']['url'],
      ));
    }
    return categories;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getCategories(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return CircularPercentIndicator(
              curve: Curves.decelerate,
              lineWidth: 12,
              progressColor: Colors.green.shade400,
              backgroundColor: Colors.green.shade200,
              radius: 50,
              percent: 1,
              circularStrokeCap: CircularStrokeCap.round,
              animation: true,
              center: Image.asset(
                "lib/images/Medicte_cropped.png",
                height: 60,
              ),
              animationDuration: 1000,
            );
          } else {
            return ListView.builder(
                itemCount: snapshot.data.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Container(
                      width: 300,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.greenAccent.shade100,
                      ),
                      child: Row(
                        children: [
                          Image.network(
                            snapshot.data[index].imageUrl,
                            fit: BoxFit.fill,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Center(
                              child: Text(
                                snapshot.data[index].treatmentCategoryTitle,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                });
          }
        });
  }
}
