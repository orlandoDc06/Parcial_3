import 'package:parcial3/handler/database.dart';

class Gastosmodel {
  
  DatabaseHandler dbHandler = DatabaseHandler();

  int? id;
  late double monto;
  late String categoria;
  late String descripcion;
  late String fecha;

  Gastosmodel({required this.monto, required this.categoria, required this.descripcion, required this.fecha});
  Gastosmodel.getAll({required this.id, required this.monto, required this.categoria, required this.descripcion, required this.fecha});
  Gastosmodel.init();

  Map<String, dynamic> toMap(){
    return({'id':id, 'monto':monto, 'categoria':categoria, 'descripcion':descripcion, 'fecha':fecha});
  }

  Future<List<Map<String, dynamic>>> getAllGastos() async{
    var db = await dbHandler.getDataBase();
    return await db.query('gastos');
  }

  Future<void> InsertarGastos(Map<String, dynamic> gastos) async{
    var db = await dbHandler.getDataBase();
    await db.insert('gastos', gastos);
  }

  Future<void> EliminarGastos(int id) async{
    var db = await dbHandler.getDataBase();
    await db.delete('gastos', where: 'id=?', whereArgs: [id]);
  }
  
  Future<void> Editargastos(int id, Map<String, dynamic> gastos) async{
    var db = await dbHandler.getDataBase();
    await db.update('gastos', gastos, where: 'id=?', whereArgs: [id]);
  }

  Future<List<Map<String, dynamic>>> BuscarGastos(String categoria) async{
    var db = await dbHandler.getDataBase();
    return await db.query('empleado', where: 'categoria LIKE ?', whereArgs: ['%$categoria%']);
  }

}