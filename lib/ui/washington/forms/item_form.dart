
import 'package:drawer_advanced_implementation2/colorComponents.dart';
import 'package:flutter/material.dart';

class ItemForm extends StatelessWidget {
  final void Function(String) onSubmit;
  final void Function(String) onSave;
  final VoidCallback onCancel;
  final String? initialText;

  final Color xBlack = Colorcomponents.borderBlack;
  final Color xBlue = Colorcomponents.xBlue;

  static const double x = 18.0;
  static const double y = 14.0;
  static BorderRadius standardBR = BorderRadius.circular(30);

  const ItemForm({
    Key? key,
    required this.onSubmit,
    required this.onCancel,
    required this.onSave,
    required this.initialText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController(text: initialText);
    return Column(children: [
        // Main content area
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height:200),//where you want the content (height of textbox+label)
            // Input field label
            const Text(
              'Input word',
              style: TextStyle(
                fontSize: 12,
                color: Colors.black,
                fontWeight: FontWeight.w600,//boldness of the label
              ),
            ),
            const SizedBox(height: 1),//gap between label and textfield
            // Text input field
            Container(
              width: 350,//h&w changes size of box
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: xBlue,
                  width: 1,
                ),
              ),
              child: TextField(
                controller: controller,
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Poppins-Medium',
                  color: xBlue,
                  fontWeight: FontWeight.w500
                ),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 20,//height of the text in textbox
                    horizontal: 10,//horizontal padding same as above
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 250,),


//----------------------------------------------------------------------------------- footer starts here
        Divider(
          color: xBlack,
          thickness: 0.4,
          height: 1.0, // Total height including spacing
        ),
        Container(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Discard button
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,                    // Remove shadow
                  shadowColor: Colors.transparent, // Remove shadow color
                  backgroundColor: const Color.fromARGB(0, 255, 255, 255),   // Match your background color
                  foregroundColor: Colors.black,   // Text color
                  side: BorderSide.none,     
                  overlayColor: xBlue,  // Removes hover/splash color
                  padding: const EdgeInsets.fromLTRB(x, y, x, y),
                ),
                child: const Text(
                  'Discard',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              
              const SizedBox(width: 12),
              Row(
                children: [
                  // Save Draft button
                  OutlinedButton(
                    onPressed: () => onSave(controller.text),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: xBlue,
                      side: BorderSide(color: xBlue),
                      shape: RoundedRectangleBorder(borderRadius: standardBR),
                      padding: const EdgeInsets.fromLTRB(x, y, x, y),
                    ),
                    child: const Text(
                      'Save Draft',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),

                  
                  const SizedBox(width: 12),
                  
                  // Save button
                  ElevatedButton(
                    onPressed: () => onSubmit(controller.text),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: xBlue,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: standardBR),
                      padding: const EdgeInsets.fromLTRB(x, y, x, y),
                      elevation: 0,
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 9, 0),
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                          ),
                        ),
                        
                        Text(
                          'Save',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        )
        
        
      ],
    );
  }
}