import 'package:todo_app_odev/sqlite/veritabani_yardimcisi.dart';

import '../entity/todo.dart';

class TodoDaoRepo{
  Future<void> kaydet(String todo_name)async{
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    var yeniKisi = Map<String,dynamic>();
    yeniKisi["todo_name"] = todo_name;
    await db.insert("toDos", yeniKisi);
  }

  Future<void> guncelle(int todo_id, String todo_ad)async{
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    var guncellenenKisi = Map<String,dynamic>();
    guncellenenKisi["todo_name"] = todo_ad;
    guncellenenKisi["todo_id"] = todo_id;
    await db.update("toDos", guncellenenKisi, where: "todo_id = ?", whereArgs: [todo_id]);
  }

  Future<List<Todo>> todoYukle() async{
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM toDos");

    return List.generate(maps.length, (i) {
      var satir = maps[i];
      return Todo(todo_id: satir["todo_id"], todo_name: satir["todo_name"]);
    });
  }

  Future<List<Todo>> ara(String aramaKelimesi) async{
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM toDos lije WHERE todo_name like '%$aramaKelimesi'");

    return List.generate(maps.length, (i) {
      var satir = maps[i];
      return Todo(todo_id: satir["todo_id"], todo_name: satir["todo_name"]);
  });
}


  Future<void> sil(int todo_id) async{
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    await db.delete("toDos", where: "todo_id = ?", whereArgs: [todo_id]);
  }


}