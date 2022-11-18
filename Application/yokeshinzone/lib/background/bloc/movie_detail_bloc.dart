import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:yokeshinzone/background/models/detail/movie_detail_model.dart';
import 'package:yokeshinzone/background/repository/repository.dart';

class MovieDetailBloc {
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<MovieDetailModel> _mdSubject = BehaviorSubject<MovieDetailModel>();

  getMovieDetail(int id) async {
    MovieDetailModel response = await _repository.getMovieDetail(id);
    _mdSubject.sink.add(response);
  }

  void drainStream() async {
    await _mdSubject.drain();
  }

  @mustCallSuper
  void dispose() async {
    await _mdSubject.drain();
    _mdSubject.close();
  }

  BehaviorSubject<MovieDetailModel> get subject => _mdSubject;
}

final movieDetailBloc = MovieDetailBloc();