import 'package:flutter/material.dart';
import 'screens/transfer/list.dart';

void main() {
	runApp(ByteBankApp());
}

class ByteBankApp extends StatelessWidget {
  
  @override 
	Widget build(BuildContext context) {
		return
			MaterialApp( 
				theme: ThemeData(
					accentColor: Colors.blueAccent[700],
					primaryColor: Colors.green[900],
					buttonTheme: ButtonThemeData(
						buttonColor: Colors.blueAccent[700],
						textTheme: ButtonTextTheme.primary
					),
				),
				home: TransfersList(),
			);
	}
}