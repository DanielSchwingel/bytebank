import 'package:bytebank/components/field.dart';
import 'package:bytebank/models/transfer.dart';
import 'package:flutter/material.dart';

const _title = 'Nova transferência';
const _labelAccount = 'Número da conta';
const _hintAccount = '0000';
const _labelValue = 'Valor';
const _hintValue = '0.00';
const _button = 'Confirmar';

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
					title: Text(_title)
            ),
            body: SingleChildScrollView(
					child: Column(
						children: [
							Field(
								controller: _accountController,
								label: _labelAccount,
								hint: _hintAccount
							),
							Field(
								controller: _valueController,
								label: _labelValue,
								hint: _hintValue,
								icon: Icons.monetization_on,
							),
							ElevatedButton(
								child: Text(_button),
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