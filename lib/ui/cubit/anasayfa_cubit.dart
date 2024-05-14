import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_odev/data/entity/todo.dart';
import 'package:todo_app_odev/data/repo/tododao_repo.dart';

class AnasayfaCubit extends Cubit<List<Todo>>{
  AnasayfaCubit():super(<Todo>[]);

  var trepo = TodoDaoRepo();

  Future<void> todoYukle() async{
    var liste = await trepo.todoYukle();
    emit(liste);
  }

  Future<void> ara(String aramaKelimesi) async{
    var liste = await trepo.ara(aramaKelimesi);
    emit(liste);
  }

  Future<void> sil(int todo_id) async{
    await trepo.sil(todo_id);
    await todoYukle();
  }

}