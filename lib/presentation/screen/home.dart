import 'package:flutter/material.dart';
import 'package:parcial3/handler/database.dart';
import 'package:parcial3/models/gastosModel.dart';
import 'package:parcial3/presentation/screen/editarGastos.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  DatabaseHandler dbHandler = DatabaseHandler();
  List<Gastosmodel> dataGastos = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    conectDatabase();
  }

  void conectDatabase() async{
    await dbHandler.getDataBase();
  }  

  void cargarGastos() async{
    Gastosmodel gastos = Gastosmodel.init();
    List<Map<String, dynamic>> gastosData = await gastos.getAllGastos();

    setState(() {
      dataGastos = gastosData.map((e) => Gastosmodel.getAll(
        id: e['id'], 
        monto: e['monto'], 
        categoria: e['categoria'], 
        descripcion: e['descripcion'], 
        fecha: e['fecha'])).toList();
    });
  }

  Drawer menu(BuildContext context){
    return Drawer(
     child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Gestion de Gatos'),
        Expanded(
          child: ListView(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context, '/');
                },
                child: ListTile(
                  leading: Icon(Icons.home),
                  title: Text('Home'),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/crearGastos');
                  cargarGastos();
                },
                child: ListTile(
                  leading: Icon(Icons.add),
                  title: Text('Crear Gastos'),
                ),
              ),
            ],
          ),
        ),
      ],
     ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Gastos Personales'),
      ),
      drawer: menu(context),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Lista de Gastos'),
            Expanded(
              child: ListView.builder(
                itemCount: dataGastos.length,
                itemBuilder: (context, index) {
                  Gastosmodel gastos = dataGastos[index];
                  return ListTile(
                    onTap: () async {
                      //var res = await Navigator.push(context, MaterialPageRoute
                        //(builder: (context) => ))
                      cargarGastos();
                    },
                    title: Text(gastos.monto.toString()),
                    subtitle: Text('${gastos.categoria}: ${gastos.descripcion}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: () async{
                            var res = await Navigator.push(context, MaterialPageRoute(
                              builder: (context)=> Editargastos(gastos: gastos)));

                            if(res == null){
                              cargarGastos();
                            }
                          },
                          child: Icon(Icons.edit),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}