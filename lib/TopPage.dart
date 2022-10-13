import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_counter_app/FloatingActionButton.dart';


class TopPage extends StatefulWidget {
  const TopPage({Key? key, required this.title}) : super(key: key);
  
  final String title;

  @override
  State<TopPage> createState() => _TopPageState();
}

class _TopPageState extends State<TopPage> {
  var _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decresementCounter() {
    setState(() {
      _counter--;
    });
  }

  void setIncrement( int intData ){
    setState(() {
     _counter = intData;
    });
  }

  
  @override
  Widget build(BuildContext context) {
    

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.book),
          
          title: Text(widget.title,style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,), ),
          centerTitle: true,
          shape: const StadiumBorder() ,
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        '$_counter',
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.w500, 
                        )
                      ),
                    ], 
                  ),
                ),
              ),
              SizedBox(
                width: 200.0,
                height: 50.0,
              ),

              AnimatedTextKit(
                  animatedTexts: [
                    TyperAnimatedText(_counter % 10 == 0 ?  '$_counter カウント到達！':''),
                  ],
                ),

              SizedBox(
                width: 200.0,
                height: 200.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        setIncrement(0);
                      },
                      icon: Icon(Icons.reset_tv, size: 40,),
                      label: Text('RESET'),
                    ),
                    FloatingActionButton(
                      onPressed: _decresementCounter,
                      tooltip: 'マイナス',
                      child: const Icon(Icons.exposure_minus_1 ,size: 40,),
                    ),
                    FloatingActionButton(
                      onPressed: _incrementCounter,
                      tooltip: 'プラス',
                      child: const Icon(Icons.plus_one, size: 40,),
                    ),
                  ],
                ), 
                
            ],
          ),
        ),
        
        
      ),
    );
  }
}

