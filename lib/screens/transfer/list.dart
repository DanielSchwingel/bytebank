import 'package:bytebank/models/transfer.dart';
import 'package:bytebank/screens/transfer/form.dart';
import 'package:flutter/material.dart';

const _title = 'Transferências';

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
					title: Text(_title),
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
						Navigator.push(context, MaterialPageRoute(builder: (context) {
							return TransferForm();
						})).then((transfer) => _updateList(transfer));
					},
				),
         );
   }

	void _updateList(transfer) {
		setState(() {
			if (transfer != null) {
				widget._transfers.add(transfer);
			}
		});
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
              title: Text(this._transfer.value.toString()),
              subtitle: Text(this._transfer.account.toString())
				)
         );
   }
}