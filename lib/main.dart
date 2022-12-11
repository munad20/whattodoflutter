import 'package:flutter/material.dart';

import 'WhatToDoList.dart';

void main() => runApp(new WhatToDoApp());




class WhatToDoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'WhatToDo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        accentColor: Colors.white,
      ),
      home: WhatToDoList(),

    );
  }
}

