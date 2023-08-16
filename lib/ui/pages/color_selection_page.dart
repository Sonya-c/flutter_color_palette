import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';

import '../../utils/color_utils.dart';
import '../widgets/color_palette.dart';

class ColorSelectionPage extends StatelessWidget {
  const ColorSelectionPage({Key? key}) : super(key: key);

  void showDialog() {
    Get.dialog(const AlertDialog(
      title: Text('Flutter'),
      content: Text('Dialog'),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Color palette app'),
          actions: [
            IconButton(onPressed: showDialog, icon: Icon(Icons.info_outline))
          ],
        ),
        // https://colorhunt.co
        body: SingleChildScrollView(
          child: Column(
            children: [
              ColorPalette(
                  pallete: const ["79155B", "C23373", "F6635C", "FFBA86"],
                  callback: showColor),
              ColorPalette(
                  pallete: const ["0C356A", "279EFF", "40F8FF", "D5FFD0"],
                  callback: showColor),
              ColorPalette(
                  pallete: const ["EBE76C", "F0B86E", "ED7B7B", "836096"],
                  callback: showColor),
              ColorPalette(
                  pallete: const ["E19898", "A2678A", "4D3C77", "3F1D38"],
                  callback: showColor),
              ColorPalette(
                  pallete: const ["313866", "504099", "974EC3", "FE7BE5"],
                  callback: showColor),
              ColorPalette(
                  pallete: const ["614BC3", "33BBC5", "85E6C5", "C8FFE0"],
                  callback: showColor),
              ColorPalette(
                  pallete: const ["FFF3DA", "DFCCFB", "D0BFFF", "BEADFA"],
                  callback: showColor)
            ],
          ),
        ));
  }

  void showColor(String value) {
    Clipboard.setData(ClipboardData(text: value));
    Get.snackbar(
      'Color palette',
      'Valor copiado',
      backgroundColor: ColorUtils.FromHex(value),
      snackPosition: SnackPosition.TOP,
    );
  }
}
