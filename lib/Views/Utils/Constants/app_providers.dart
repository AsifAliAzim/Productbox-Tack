import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:productbox_flutter_exercise/Controllers/Cubits/UploadDocumentsCubits/document_file_cubit.dart';
import 'package:productbox_flutter_exercise/Controllers/Cubits/UploadDocumentsCubits/top_bars_cubit.dart';
import 'package:productbox_flutter_exercise/Controllers/Cubits/users_cubit.dart';

final List<BlocProvider> mainCubitProvidersList = [
  //authentication providers
  BlocProvider<UsersCubit>(
    create: (BuildContext context) => UsersCubit(),
  ),

  //upload documents providers
  BlocProvider<TopBarsCubit>(
    create: (BuildContext context) => TopBarsCubit(count: 0),
  ),
  BlocProvider<DocumentFileCubit>(
    create: (BuildContext context) => DocumentFileCubit(''),
  ),
];
