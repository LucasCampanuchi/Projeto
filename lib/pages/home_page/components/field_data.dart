import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:projeto_teste/pages/home_page/store/home_page.store.dart';

class FieldDate extends StatelessWidget {
  final String label;
  final String date;
  final Function(DateTime?) onChanged;

  const FieldDate({
    super.key,
    required this.label,
    required this.date,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Expanded(
        child: InkWell(
          onTap: () {
            showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2005),
              lastDate: DateTime(2030),
            ).then(
              (value) => onChanged(value),
            );
          },
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: const Color(0xFFD5D5D5),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    label,
                    style: TextStyle(
                      color: Colors.grey[500],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            date,
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        /* close button */
                        if (date.isNotEmpty && date != '-')
                          InkWell(
                            onTap: () => onChanged(null),
                            child: const Icon(
                              Icons.close,
                              color: Colors.grey,
                            ),
                          )
                        else
                          const Icon(
                            Icons.calendar_today,
                            color: Colors.grey,
                            size: 15,
                          )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
