import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class VeritabaniYardimcisi {
  static final String veritabaniAdi = "todo1.sqlite";

  static Future<Database> veritabaniErisim() async{
    String veriTabaniYolu = join(await getDatabasesPath(),veritabaniAdi);

    if(await databaseExists(veriTabaniYolu)){
      print("Veritabanı zaten var. Kopyalamaya gerek yok.");
    }else{
      ByteData data = await rootBundle.load("veritabani/$veritabaniAdi");
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes,data.lengthInBytes);
      await File(veriTabaniYolu).writeAsBytes(bytes,flush: true);
      print("Veritabanı Kopyalandı");
    }
    return openDatabase(veriTabaniYolu);
  }
}