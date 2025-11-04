import 'package:flutter/material.dart';
import 'package:parcial3/models/gastosModel.dart';

class crearGasto extends StatefulWidget {
  const crearGasto({super.key});

  @override
  State<crearGasto> createState() => _crearGastoState();
}

class _crearGastoState extends State<crearGasto> {

  final _formKey = GlobalKey<FormState>();
  TextEditingController? controllerMonto;
  TextEditingController? controllerCategoria;
  TextEditingController? controllerDescripcion;
  TextEditingController? controllerfecha;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controllerMonto = TextEditingController();
    controllerCategoria = TextEditingController();
    controllerDescripcion = TextEditingController();
    controllerfecha = TextEditingController();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Registrar Gatos'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Ingrese Monto del Gastos',
                      icon: Icon(Icons.payment)
                    ),
                    controller: controllerMonto,
                    validator: (value) {
                      if(value == null || value.isEmpty){
                        return 'Debe ingrese el monto';
                      } else{
                        return null;
                      }
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Ingrese la categoria del Gastos',
                      icon: Icon(Icons.category)
                    ),
                    controller: controllerCategoria,
                    validator: (value) {
                      if(value == null || value.isEmpty){
                        return 'Debe ingrese la categoria';
                      } else{
                        return null;
                      }
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Ingrese la descripcion del Gastos',
                      icon: Icon(Icons.description)
                    ),
                    controller: controllerDescripcion,
                    validator: (value) {
                      if(value == null || value.isEmpty){
                        return 'Debe ingrese la descripcion del gasto';
                      } else{
                        return null;
                      }
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Ingrese la fecha del Gastos',
                      icon: Icon(Icons.date_range)
                    ),
                    controller: controllerfecha,
                    validator: (value) {
                      if(value == null || value.isEmpty){
                        return 'Debe ingrese la fecha del gasto';
                      } else{
                        return null;
                      }
                    },
                  ),
                ],
              )
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: (){  
                var validate = _formKey.currentState!.validate();
                Gastosmodel gastos = Gastosmodel(
                  monto: double.parse(controllerMonto!.text), 
                  categoria: controllerCategoria!.text, 
                  descripcion: controllerDescripcion!.text, 
                  fecha: controllerfecha!.text);

                  gastos.InsertarGastos(gastos.toMap());
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Insertado')));
                  Navigator.pop(context);
              }, 
              child: ListTile(
                leading: Icon(Icons.save),
                title: Text('Guardar'),
              )
            ),
          ),
        ],
      ),
    );
  }
}