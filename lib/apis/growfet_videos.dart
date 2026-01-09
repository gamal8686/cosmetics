import 'package:cosmetics/core/logic/dio_helper.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GrowfetVideosView extends StatefulWidget {
  const GrowfetVideosView({super.key});

  @override
  State<GrowfetVideosView> createState() => _GrowfetVideosViewState();
}

class _GrowfetVideosViewState extends State<GrowfetVideosView> {
  List<VideoModel>? list;

  Future<void> getData() async {
    final resp = await Dio().get(
      'https://www.googleapis.com/drive/v3/files?q=%271m-LEUh_kP-ykn1vHNsGGjkcPOH-aPmae%27+in+parents+and+mimeType+contains+%27video%27&key=AIzaSyCK64Ze7awjzb22n7CJDIbsS6nYpLR_R0s',
    );
    print(resp.data);
    list = VideosList.fromJson(resp.data).list;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[300],
      appBar: AppBar(
        backgroundColor: Colors.lightGreen[300],
        title: Text(
          'Grow Fet Video',
          style: TextStyle(
            fontFamily: 'MysteryQuest',
            color: Colors.green[600],
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: list == null
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              padding: EdgeInsets.all(15),
              scrollDirection: Axis.vertical,
              itemCount: list!.length,
              itemBuilder: (context, index) => _item(videoFile: list![index]),
            ),
    );
  }
}

class _item extends StatelessWidget {
  final VideoModel videoFile;

  const _item({super.key, required this.videoFile});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            videoFile.name,
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 15,
              fontWeight: FontWeight.w900,
            ),
          ),
          Spacer(),

          CircleAvatar(
            backgroundColor: Colors.green,
            minRadius: 30,
            child: Column(
              children: [
                Text(
                  'Grow',
                  style: TextStyle(fontSize: 15, fontFamily: 'MysteryQuest'),
                ),
                Text(
                  'fet',
                  style: TextStyle(fontSize: 12, fontFamily: 'MysteryQuest'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class VideosList {
  late final List<VideoModel> list;
  late final String kind;
  late final bool incompleteSearch;

  VideosList.fromJson(Map<String, dynamic> json) {
    list = List.from(
      json['files'] ?? [],
    ).map((e) => VideoModel.fromJson(e)).toList();
    kind = json['kind'] ?? '';
    incompleteSearch = json['incompleteSearch'] ?? false;
  }
}

class VideoModel {
  late final String kind;
  late final String id;
  late String name;
  late final String mimeType;

  VideoModel.fromJson(Map<String, dynamic> json) {
    kind = json['kind'] ?? '';
    id = json['id'] ?? '';
    name = json['name'] ?? '';
    final splat = name.split('.');
    splat.removeLast();
    name = splat.join();
    name = name.replaceAll('_', ' ');
    name = name
        .split('')
        .map((e) => e.replaceAll(e[0], e[0].toUpperCase()))
        .toList()
        .join();
    mimeType = json['mimeType'] ?? '';
  }
}
