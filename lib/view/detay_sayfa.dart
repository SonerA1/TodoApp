
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_odev/ui/cubit/detay_sayfa_cubit.dart';

import '../data/entity/todo.dart';

class DetaySayfa extends StatefulWidget {
  Todo todo;
  DetaySayfa({super.key, required this.todo});

  @override
  State<DetaySayfa> createState() => _DetaySayfaState();
}

class _DetaySayfaState extends State<DetaySayfa> {

  var tdTodoAdi = TextEditingController();



  @override
  void initState() {
    super.initState();
    var todo = widget.todo;
    tdTodoAdi.text = todo.todo_name;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Detay Sayfa"),),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50, right: 50),
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(controller: tdTodoAdi,decoration: const InputDecoration(hintText: "Todo Ad"),),
              ElevatedButton(onPressed: (){
                context.read<DetaySayfaCubit>().guncelle(widget.todo.todo_id, tdTodoAdi.text);


              }, child: const Text("Güncelle"))

            ],
          ),
        ),
      ),
    );
  }
}
