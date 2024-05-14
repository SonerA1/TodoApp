import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repo/tododao_repo.dart';

class DetaySayfaCubit extends Cubit<void>{
  DetaySayfaCubit():super(0);

  var trepo = TodoDaoRepo();

  Future<void> guncelle(int todo_id, String todo_ad)async{
    await trepo.guncelle(todo_id, todo_ad);

  }


}