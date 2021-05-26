import 'package:flutter/material.dart';

void main() {
	runApp(ByteBankApp());
}

class ByteBankApp extends StatelessWidget {
  
  @override 
  Widget build(BuildContext context) {
      return
         MaterialApp(
            home: Scaffold(
               body: TransferForm(),
            )
         );
  }
}

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

class TransferForm extends StatelessWidget {

   final TextEditingController _accountController = TextEditingController();
   final TextEditingController _valueController = TextEditingController();

   @override 
   Widget build(BuildContext context) {
      return
         Scaffold(
            appBar: AppBar(
					title: Text('Criando uma transferência')
            ),
            body: Column(
            	children: [
						Field(
							controller: _accountController,
							label: 'Número da conta',
							hint: '0000'
						),
                  Field(
							controller: _valueController,
							label: 'Valor',
							hint: '0.00',
							icon: Icons.monetization_on,
						),
                  RaisedButton(
                        child: Text('Confirmar'),
                        onPressed: () => _createTransfer(),
                     )
               ],
            )
         );
   }

	void _createTransfer() {
		final int _account = int.tryParse(_accountController.text);
		final double _value = double.tryParse(_valueController.text);
		if (_account != null && _value != null) {
			final _transferCreated = Transfer(_value, _account);
		}
		print(_valueController.text);
	}
}

class TransferList extends StatelessWidget {
  
   @override
   Widget build(BuildContext context) {
      return 
         Scaffold(
            appBar: AppBar(
					title: Text('Transferência'),
				),
            body: Column(
					children: <Widget>[
						TransferItem(Transfer(100.0, 1001)),
						TransferItem(Transfer(150.0, 1002)),
						TransferItem(Transfer(120.0, 1003)),
					],
				),
            floatingActionButton: FloatingActionButton(
					child: Icon(Icons.add),
				),
         );
   }
}

class TransferItem extends StatelessWidget {

   final Transfer _transfer;

   TransferItem(this._transfer);

   @override
   Widget build(BuildContext context) {
      return 
         Card(
            child: ListTile(
					leading: Icon(Icons.monetization_on),
					title: Text(this._transfer._value.toString()),
					subtitle: Text(this._transfer._account.toString())
				)
         );
   }
}

class Transfer {
   final double _value;
   final int _account;

   Transfer(this._value, this._account);
}