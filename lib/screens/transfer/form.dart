import 'package:byte_bank/components/editor.dart';
import 'package:byte_bank/models/transfer.dart';
import 'package:flutter/material.dart';

const _appBarTitle = 'Criando Transferência';

const _accountNumberLabel = 'Número da conta';
const _accountNumberHint = '0000';

const _valueLabel = 'Valor';
const _valueHint = '0.00';

const _confirmButtonText = 'Confirmar';

class TransferForm extends StatelessWidget {
  final TextEditingController _accountNumberController =
      TextEditingController();
  final TextEditingController _valueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarTitle),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Editor(
                controller: _accountNumberController,
                label: _accountNumberLabel,
                hint: _accountNumberHint),
            Editor(
                controller: _valueController,
                label: _valueLabel,
                hint: _valueHint,
                icon: Icons.monetization_on),
            ElevatedButton(
              child: Text(_confirmButtonText),
              onPressed: () => _createTransfer(context),
            ),
          ],
        ),
      ),
    );
  }

  void _createTransfer(BuildContext context) {
    final int? accountNumber = int.tryParse(_accountNumberController.text);
    final double? value = double.tryParse(_valueController.text);

    if (accountNumber != null && value != null) {
      final createdTransfer = Transfer(
        value,
        accountNumber,
      );
      Navigator.pop(
        context,
        createdTransfer,
      );
    }
  }
}
