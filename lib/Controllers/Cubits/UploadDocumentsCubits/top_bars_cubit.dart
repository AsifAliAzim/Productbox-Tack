import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

class TopBarsCubit extends Cubit<int> {
  TopBarsCubit({required int count}) : super(0);

  barCount({
     required dynamic barCount,
  }) {
   // int result = profile + license + certificate + passport;
   // debugPrint('result = $result');
    emit(barCount);
  }
}
