import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final Widget prefixWidget;
  const CustomTextField(
      {Key? key, required this.label, required this.prefixWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(color: Colors.grey[900]),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey.shade50,
              border: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.grey.shade50, width: 0.0),
                  borderRadius: const BorderRadius.all(Radius.circular(8))),
              enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.grey.shade50, width: 0.0),
                  borderRadius: const BorderRadius.all(Radius.circular(8))),
              hintText: 'Input number',
              hintStyle: const TextStyle(color: Colors.grey),
              prefixIcon: prefixWidget),
          onSaved: (String? value) {},
        ),
        const SizedBox(
          height: 16,
        )
      ],
    );
  }
}
