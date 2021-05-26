import 'package:flutter/material.dart';

class Field extends StatelessWidget {

	final TextEditingController controller;
	final String label;
	final String hint;
	final IconData icon;

	Field({this.controller, this.label, this.hint, this.icon});

	@override
	Widget build(BuildContext context) {
		return 
			Padding(
				padding: EdgeInsets.all(16.0),
				child:TextField(
					controller: controller,
					style: TextStyle(
						fontSize: 24.0
					),
					decoration: InputDecoration(
						icon: icon != null ? Icon(icon) : null,
						labelText: label,
						hintText: hint
					),
					keyboardType: TextInputType.number,
					),
			);
	}
}

