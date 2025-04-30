import 'package:flutter/material.dart';
import 'package:widget_act6/every_widgets/animated_list.dart';

import 'package:widget_act6/every_widgets/animated_opacity.dart';
import 'package:widget_act6/every_widgets/animated_padding.dart';
import 'package:widget_act6/every_widgets/animated_physical_model.dart';
import 'package:widget_act6/every_widgets/animated_positioned.dart';
import 'package:widget_act6/every_widgets/animated_switcher.dart';
import 'package:widget_act6/pantalla_inicial.dart';
import 'package:widget_act6/every_widgets/animated_rotation.dart';
import 'package:widget_act6/every_widgets/animated_size.dart';
import 'package:widget_act6/every_widgets/animated_widget.dart';
import 'package:widget_act6/every_widgets/modal_barrier.dart';

void main() => runApp(MiRutas());

class MiRutas extends StatelessWidget {
  const MiRutas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rutas entre paginas',
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const PantallaUno(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/pantalla2': (context) => const Widget012(),
        '/pantalla3': (context) => const Widget013(),
        '/pantalla4': (context) => const Widget014(),
        '/pantalla5': (context) => const Widget015(),
        '/pantalla6': (context) => const Widget016(),
        '/pantalla7': (context) => const Widget017(),
        '/pantalla8': (context) => const Widget018(),
        '/pantalla9': (context) => const Widget019(),
        '/pantalla10': (context) => const Widget020(),
        '/pantalla11': (context) => const MyStatefulWidget(),
      },
    );
  }
}
