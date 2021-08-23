import 'package:ch4_starter_exercise/models/order.dart';
import 'package:flutter/material.dart';

class FormValidator extends StatefulWidget {
  @override
  _FormValidatorState createState() => _FormValidatorState();
}

class _FormValidatorState extends State<FormValidator> {
  final GlobalKey<FormState> _formStateKey = GlobalKey<FormState>();
  Order _order = Order('', 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form validator'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Form(
              key: _formStateKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Item',
                        hintText: 'Espresso',
                      ),
                      validator: (value) => _validateItemRequired(value),
                      onSaved: (value) => _order.item = value!,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Quantity',
                        hintText: '10',
                      ),
                      validator: (value) => _validateItemCount(value),
                      onSaved: (value) => _order.quantity = int.parse(value!),
                    ),
                    Divider(height: 32),
                    ElevatedButton(
                      onPressed: () => _submitOrder(),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Save', style: TextStyle(color: Colors.white)),
                          SizedBox(width: 16),
                          Icon(Icons.save, color: Colors.white)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  String? _validateItemRequired(String? value) {
    return value != null && value.isEmpty ? 'Item required' : null;
  }

  String? _validateItemCount(String? count) {
    int countAsInteger = count != null ? (int.tryParse(count) ?? 0) : 0;
    return countAsInteger == 0 ? 'At least one Item is Required' : null;
  }

  void _submitOrder() {
    final formState = _formStateKey.currentState;

    if (formState == null) return;

    if (formState.validate()) {
      formState.save();
      print('Order item: ${_order.item}');
      print('Order Quantity: ${_order.quantity}');
    }
  }
}
