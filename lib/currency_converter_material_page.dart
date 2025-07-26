import 'package:flutter/material.dart';

class CurrencyConverterMaterialPage extends StatefulWidget{
  const CurrencyConverterMaterialPage({super.key});
  @override
  State<CurrencyConverterMaterialPage> createState() {
    return _CurrencyConverterMaterialPageState();
  }
}

// because stateful widget is an immutable class so we can't add any variable in it, hence we decided to make a private class which extends a abstract class.

class _CurrencyConverterMaterialPageState extends State<CurrencyConverterMaterialPage>{
  double result=0;
  final TextEditingController            textEditingController=TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final border=OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.cyanAccent,
        width: 1.0,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
    );
     
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 14, 9, 43),
        elevation: 0,
        title: const Text('Currency Converter',style: TextStyle (
          color: Colors.white60,
          fontWeight: FontWeight.bold,
        ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Color.fromARGB(255, 14, 9, 43),
      body:Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.end,
            children: [
                Text(
                  'INR ${result!=0 ? result.toStringAsFixed(3):result.toStringAsFixed(0)}',
                style: const TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                  color: Colors.greenAccent, 
                ),
                ),
              const SizedBox(height: 70,),
              TextField(
                controller: textEditingController,
                style: const TextStyle(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  hintText: 'Please Enter the amount in USD',
                  hintStyle: const TextStyle(
                    color: Colors.white60,
                  ),
                  prefixIcon: Icon(Icons.monetization_on_outlined), 
                  prefixIconColor: Colors.green,
                  filled: true,
                  fillColor: Colors.black,
                  focusedBorder: border,
                  enabledBorder: border,
                ),
                keyboardType:const TextInputType.numberWithOptions(
                  decimal: true,
                ),
              ),
              const SizedBox(height: 10,),
              TextButton(
                onPressed: () {
                  setState(() {
                    result=double.parse(textEditingController.text)*85.86;
                  });
                },
                style: TextButton.styleFrom(
                  backgroundColor: (Colors.greenAccent),
                  foregroundColor: (Colors.black),
                  fixedSize: (Size(100, 50)),
                  minimumSize: (Size(double.infinity, 50)),
                ),
                child:const Text('Convert'),
              ),
            ],
          ),
        ), 
      ), 
    );
  }
}


 
