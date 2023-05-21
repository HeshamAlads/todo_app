import 'package:flutter/material.dart';

class ToDoCard extends StatelessWidget {
  final String varTitle;
  final bool doneOrNot;
  final Function changeStatus;
  final int index;
  final Function delete;

  const ToDoCard({
    super.key,
    required this.varTitle,
    required this.changeStatus,
    required this.doneOrNot,
    required this.index,
    required this.delete,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        changeStatus(index);
      },
      child: FractionallySizedBox(
        widthFactor: .99,
        child: Container(
          margin: const EdgeInsets.only(
            top: 8,
            left: 8,
            right: 8,
          ),
          padding: const EdgeInsets.all(7),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white38),
            borderRadius: BorderRadius.circular(13),
            color: const Color.fromRGBO(209, 224, 224, 0.2),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  varTitle,
                  style: TextStyle(
                    //  condition ? true : false ,
                    color: doneOrNot ? Colors.black54 : Colors.white,
                    fontSize: 22,
                    decoration: doneOrNot
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
              ),
              Row(
                children: [
                  Icon(
                    //  condition ? true : false ,
                    doneOrNot ? Icons.check : Icons.close,
                    size: 30,
                    color: doneOrNot ? Colors.green[500] : Colors.red[500],
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  IconButton(
                    onPressed: () {
                      delete(index);
                    },
                    //  condition ? true : false ,
                    color: doneOrNot ? Colors.green[500] : Colors.red[500],
                    icon: const Icon(Icons.delete, size: 30),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
