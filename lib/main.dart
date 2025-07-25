import 'package:drawer_advanced_implementation2/colorComponents.dart';
import 'package:flutter/material.dart';
import 'ui/washington/drawer_helper.dart';
import 'ui/washington/forms/item_form.dart';


void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(title: "Drawer Demo", home: MyScreen(), debugShowCheckedModeBanner: false,);
  }
}

class MyScreen extends StatefulWidget{
  State<MyScreen> createState() => MyScreenState();
}


class MyScreenState extends State<MyScreen> {
  static const double x = 18.0;
  final controller1 = TextEditingController();
  static const double y = 14.0;
  static BorderRadius standardBR = BorderRadius.circular(30);
  static final xBlue = Colorcomponents.getBlue;
  String? draftText = null;
  String label = "Open Drawer";
  bool draft = false;

  void pressed(String text) {
    setState(() {
      label = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            shadowColor: Colors.transparent,
            backgroundColor: Colorcomponents.xBlue,
            foregroundColor: const Color.fromARGB(255, 255, 255, 255),
            side: BorderSide.none,
            overlayColor: Colors.transparent,
            splashFactory: NoSplash.splashFactory),
          onPressed: () async {
            final result = await showDrawer<String>(
              context,
              header: Column(children: [
//-----------------------------------------------------------back button and X start here
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,                    // Remove shadow
                        shadowColor: Colors.transparent, // Remove shadow color
                        backgroundColor: const Color.fromARGB(0, 255, 255, 255),   // Match your background color
                        foregroundColor: Colors.black,   // Text color
                        side: BorderSide.none,     
                        overlayColor: Colors.transparent,  // Removes hover/splash color
                        splashFactory: NoSplash.splashFactory     // Remove any border
                      ),
                      onPressed: () {
                        Navigator.pop(context);},//implement close drawer
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),//height of the back and back arrow
                        child: SizedBox(
                          width: 47,
                          child:Row(
                            children: [
                              Icon(size: 15,Icons.arrow_back, color: Colors.black54),
                              const SizedBox(width: 5),//gap between arrow and back
                              const Text(
                                'Back',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ), 
                    IconButton(  //FINISHING TOUCHES: MAKE THIS ELEMENT SLIGHTLY HIGHER LATER
                      onPressed: () {
                        Navigator.pop(context);},
                      icon: Icon(
                        Icons.close,
                        color: Colors.black54,
                        size: 15, // Smaller size
                      ),
                    ),
                  ],
                ),// Header with back button
//-----------------------------------------------------------title starts here
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(16, 0, 0, 16), // Same padding on all sides
                      child:Text("Drawer",style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.36,
                        fontFamily: 'Stolzl Regular', // Custom font family
                        color: const Color.fromARGB(200, 0, 0, 0),
                      ),
                    ),
                  ),
                )
                 // Total height including spacing
                ],),
              body: ItemForm(

                onSubmit: (value) {
                  draft = false;
                  Navigator.pop(context, value);
                  },
                onCancel: () {
                  draft = false;
                  draftText = null;
                  Navigator.pop(context);
                },
                onSave:(value) {
                  draft = true;
                  Navigator.pop(context, value);
                },
                initialText: draftText,

              ),
            );
              if (result != null && draft == false) {
                pressed(result);
                draftText = null;
              }
              if(result != null && draft ==true){
                 draftText = result;
              }
            },
            child: Text(label),
        ),
      ),
    );
  }
}