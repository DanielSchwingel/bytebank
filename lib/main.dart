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
               body: TransfersList(),
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

class TransferForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
	  return TransferFormState();
  }
}

class TransferFormState extends State<TransferForm> {
	final TextEditingController _accountController = TextEditingController();
   final TextEditingController _valueController = TextEditingController();

   @override 
   Widget build(BuildContext context) {
      return
         Scaffold(
            appBar: AppBar(
					title: Text('Criando uma transferência')
            ),
            body: SingleChildScrollView(
					child: Column(
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
							ElevatedButton(
								child: Text('Confirmar'),
								onPressed: () => _createTransfer(context),
							)
						],
					),
				)
				
         );
   }

	void _createTransfer(BuildContext context) {
		final int _account = int.tryParse(_accountController.text);
		final double _value = double.tryParse(_valueController.text);
		if (_account != null && _value != null) {
			final _transferCreated = Transfer(_value, _account);
			Navigator.pop(context, _transferCreated);
		}
	}
}

class TransfersList extends StatefulWidget {
	final List<Transfer> _transfers = [];

	@override
	State<StatefulWidget> createState() {
		return TransfersListState();
	}
}

class TransfersListState extends State<TransfersList> {

   @override
   Widget build(BuildContext context) {
      return 
         Scaffold(
            appBar: AppBar(
					title: Text('Transferência'),
				),
            body: ListView.builder(
					itemCount: widget._transfers.length,
					itemBuilder: (context, index) {
						return TransferItem(widget._transfers[index]);
					},
				),
            floatingActionButton: FloatingActionButton(
					child: Icon(Icons.add),
					onPressed: () {
						final Future<Transfer> _transfer = Navigator.push(context, MaterialPageRoute(builder: (context) {
							return TransferForm();
						}));
						_transfer.then((transfer) {
							Future.delayed(Duration(seconds: 1), () {
								setState(() {
									if (transfer != null) {
										widget._transfers.add(transfer);
									}
								});
							});
						});
					},
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