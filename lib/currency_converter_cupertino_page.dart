import 'package:flutter/cupertino.dart';

class CurrencyConverterCupertinoPage extends StatefulWidget {
  const CurrencyConverterCupertinoPage({super.key});

  @override
  State<CurrencyConverterCupertinoPage> createState() => _CurrencyConverterCupertinoPageState();
}

class _CurrencyConverterCupertinoPageState extends State<CurrencyConverterCupertinoPage> {
  
  double result=0;
  final TextEditingController textEditingController=TextEditingController();
  void convert(){
    result=double.parse(textEditingController.text)*85.86;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.darkBackgroundGray,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: CupertinoColors.darkBackgroundGray, 
        middle: const Text('Currency Converter',style: TextStyle (
          color: CupertinoColors.inactiveGray,
          fontWeight: FontWeight.bold,
        ),
        ),  
      ),

      child:Center(
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
                  color: CupertinoColors.systemTeal, 
                ),
                ),
              const SizedBox(height: 70,),

              CupertinoTextField(
                controller: textEditingController,
                style: const TextStyle(
                  color: CupertinoColors.white,
                ),

                decoration:BoxDecoration(
                  color: CupertinoColors.black,
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(5),
                ),
                placeholder: 'Please Enter the amount in USD',
                placeholderStyle: const TextStyle(
                  color: CupertinoColors.systemGrey, // This makes the placeholder white too
                ),
                prefix: const Icon(CupertinoIcons.money_dollar),
                keyboardType: const TextInputType.numberWithOptions(decimal: true,),
                ),
                const SizedBox(height: 10,),
                CupertinoButton(
                  onPressed: convert,
                  color: CupertinoColors.systemTeal,
                  child:const Text('Convert'),
              ),
            ],
          ),
        ), 
      ), 
    );
  }
}