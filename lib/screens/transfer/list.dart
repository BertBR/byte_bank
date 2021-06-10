import 'package:byte_bank/models/transfer.dart';
import 'package:byte_bank/screens/transfer/form.dart';
import 'package:flutter/material.dart';

const _appBarTitle = 'Transferências';

class TransferList extends StatefulWidget {
  final List<Transfer?> _transfers = [];

  @override
  State<StatefulWidget> createState() {
    return TransferListState();
  }
}

class TransferListState extends State<TransferList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_appBarTitle)),
      body: ListView.builder(
        itemCount: widget._transfers.length,
        itemBuilder: (context, index) {
          final transfer = widget._transfers[index];
          return TransferItem(transfer);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          final receivedTransfer = await Navigator.push(context,
              MaterialPageRoute(builder: (context) {
            return TransferForm();
          }));
          _updateTransferList(receivedTransfer);
        },
      ),
    );
  }

  void _updateTransferList(receivedTransfer) {
    if (receivedTransfer != null) {
      setState(() {
        widget._transfers.add(receivedTransfer);
      });
    }
  }
}

class TransferItem extends StatelessWidget {
  final Transfer? _transfer;
  TransferItem(this._transfer);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      leading: Icon(Icons.monetization_on),
      title: Text(_transfer!.value.toString()),
      subtitle: Text(_transfer!.accountNumber.toString()),
    ));
  }
}
