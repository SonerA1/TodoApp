import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_odev/ui/cubit/kayit_sayfa_cubit.dart';

class KayitSayfa extends StatefulWidget {
  const KayitSayfa({super.key});

  @override
  State<KayitSayfa> createState() => _KayitSayfaState();
}

class _KayitSayfaState extends State<KayitSayfa> {
  var tdTodoAdi = TextEditingController();


  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Kayıt Sayfa"),),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50, right: 50),
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(controller: tdTodoAdi,decoration: const InputDecoration(hintText: "Todo Ad"),),
              ElevatedButton(onPressed: (){
               context.read<KayitSayfaCubit>().kaydet(tdTodoAdi.text);

              }, child: const Text("Kaydet"))

            ],
          ),
        ),
      ),
    );
  }
}
