import 'package:flutter/material.dart';
import '../../utils/color_utils.dart';

class ColorPalette extends StatelessWidget {
  const ColorPalette({
    Key? key,
    required this.pallete,
    required this.callback,
  }) : super(key: key);

  // atributos de la clase, por ejemplo
  final List<String> pallete;

  // también se puede tener como un atributo un callback, necesiario ya que es un
  // widget sin estado, por ejemplo
  final Function(String) callback;

  // el callback se puede llamar así en el GestureDetector
  //  onTap: () => callback(baseColor.toString())

  @override
  Widget build(BuildContext context) {
    // padding para crear espacio alrededor del widget
    List<Widget> colors = [];
    for (int i = 0; i < pallete.length; i++) {
      colors.add(Expanded(
          flex: pallete.length - i,
          child: GestureDetector(
            onTap: () => callback(pallete[i]),
            child: Container(
              height: 100,
              color: ColorUtils.FromHex(pallete[i]),
            ),
          )));
    }
    return Padding(
        padding: const EdgeInsets.all(8.0),
        // vamos a mostrar los elementos en un row
        child: Row(
          children: colors,
        ));
  }
}
