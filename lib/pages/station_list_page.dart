import 'package:flutter/material.dart';

class StationListPage extends StatelessWidget {
  final String type; // '출발역' 또는 '도착역'
  final String? excludeStation; // 제외할 역 (도착역이면 출발역, 그 반대)

  const StationListPage({super.key, required this.type, this.excludeStation});

  @override
  Widget build(BuildContext context) {
    final List<String> stations = [
      "수서",
      "동탄",
      "평택지제",
      "천안아산",
      "오송",
      "대전",
      "김천구미",
      "동대구",
      "경주",
      "울산",
      "부산",
    ];

    // 선택된 역은 제외
    final filteredStations =
        stations.where((s) => s != excludeStation).toList();

    return Scaffold(
      appBar: AppBar(title: Text(type), centerTitle: true),
      body: ListView.builder(
        itemCount: filteredStations.length,
        itemBuilder: (context, index) {
          String station = filteredStations[index];
          return Container(
            height: 50,
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey)),
            ),
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: GestureDetector(
              onTap: () => Navigator.pop(context, station),
              child: Text(
                station,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
