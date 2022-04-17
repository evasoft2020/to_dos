import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do/models/cat_fact_model.dart';

final HttpClientProvider = Provider<Dio>((ref) {
  return Dio(BaseOptions(
    baseUrl: 'https://catfact.ninja/',
  ));
});

final catFactsProvider = FutureProvider<List<CatFactModel>>((ref) async {
  final _dio = ref.watch(HttpClientProvider);
  final _result = await _dio.get('facts');
  List<Map<String, dynamic>> _mapData = List.from(_result.data['data']);
  List<CatFactModel> _catFactList =
      _mapData.map((e) => CatFactModel.fromMap(e)).toList();
  return _catFactList;
});

class FutureProviderExample extends ConsumerWidget {
  const FutureProviderExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var _liste = ref.watch(catFactsProvider);
    return Scaffold(
      body: SafeArea(
        child: _liste.when(
          data: ((data) {
            return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(data[index].fact),
                  );
                });
          }),
          error: (error, stack) {
            return Text(error.toString());
          },
          loading: () {
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
