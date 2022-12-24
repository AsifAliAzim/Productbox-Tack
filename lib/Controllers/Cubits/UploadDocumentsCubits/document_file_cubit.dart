import 'package:bloc/bloc.dart';

class DocumentFileCubit extends Cubit<dynamic> {
  DocumentFileCubit(dynamic initialValue) : super('');

  void cameraImageFile(dynamic cameraImageFile) {
    emit(cameraImageFile);
  }
}
