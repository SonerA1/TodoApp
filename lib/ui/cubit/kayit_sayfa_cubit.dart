import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_odev/data/repo/tododao_repo.dart';

class KayitSayfaCubit extends Cubit<void>{
  KayitSayfaCubit():super(0);

    var trepo = TodoDaoRepo();


  Future<void> kaydet(String todo_ad)async{
    await trepo.kaydet(todo_ad);
  }

}