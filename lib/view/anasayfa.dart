import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_odev/data/entity/todo.dart';
import 'package:todo_app_odev/ui/cubit/anasayfa_cubit.dart';
import 'package:todo_app_odev/view/detay_sayfa.dart';
import 'package:todo_app_odev/view/kayit_sayfa.dart';

class Anasayfa extends StatefulWidget{
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  bool aramaYapiliyorMu = false;


  @override
  void initState() {
    super.initState();
    context.read<AnasayfaCubit>().todoYukle();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: aramaYapiliyorMu ?
      TextField(decoration: const InputDecoration(hintText: "Ara"),
      onChanged: (aramaSonucu){
        context.read<AnasayfaCubit>().ara(aramaSonucu);

      },
      ) :
      const Text("Todo Listesi"),
      actions: [
        aramaYapiliyorMu ?
        IconButton(onPressed: (){
          setState(() {
            aramaYapiliyorMu = false;
          });
          context.read<AnasayfaCubit>().todoYukle();
        },icon: const Icon(Icons.clear)) :
        IconButton(onPressed: (){
          setState(() {
            aramaYapiliyorMu = true;
          });

        },icon: const Icon(Icons.search))
      ],),
      body: BlocBuilder<AnasayfaCubit,List<Todo>>(

        builder: (context,todoListesi){
          if(todoListesi.isNotEmpty){
              return ListView.builder(
                itemCount: todoListesi.length,
                itemBuilder: (context, index){
                  var todo = todoListesi[index];
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>  DetaySayfa(todo: todo)))
                          .then((value){
                        context.read<AnasayfaCubit>().todoYukle();
                      });

                    },
                    child: Card(
                      child: SizedBox(height: 100,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(todo.todo_name, style: const TextStyle(fontSize: 20),)
                                ],
                              ),
                            ),
                            const Spacer(),
                            IconButton(onPressed: (){
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar
                                    (content: Text("${todo.todo_name} silinsin mi ?"),
                                    action: SnackBarAction(
                                      label : "Evet",
                                      onPressed: (){
                                        context.read<AnasayfaCubit>().sil(todo.todo_id);
                                      },
                                    ),
                                  )
                              );

                            }, icon: Icon(Icons.clear,color: Colors.black54,))
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
          }else{
            return const Center();
          }
      }
      ),

      //---------Fab Button
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => const KayitSayfa()))
              .then((value){
            context.read<AnasayfaCubit>().todoYukle();
          });
        },
        child: const Icon(Icons.add),
      ),

    );
  }
}
