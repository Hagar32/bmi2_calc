import 'package:flutter/material.dart';

class GenderWidget extends StatelessWidget {
  final bool isMale;
  final Function(bool) onGenderChanged;

  const GenderWidget({
    required this.isMale,
    required this.onGenderChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () => onGenderChanged(true),
                child: Container(
                  decoration: BoxDecoration(
                    color: isMale ? Colors.blue : Colors.blueGrey.shade900,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  width: double.infinity,
                  height: 240,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 16,),
                      Icon(Icons.male, color: Colors.white, size: 50),
                      Text('Male', style: TextStyle(fontSize: 22, color: Colors.grey)),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(width: 16,),
            Expanded(
              child: GestureDetector(
                onTap: () => onGenderChanged(false),
                child: Container(
                  decoration: BoxDecoration(
                    color: !isMale ? Colors.blue : Colors.blueGrey.shade900,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  width: double.infinity,
                  height: 240,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 16,),
                      Icon(Icons.female, color: Colors.white, size: 50),
                      Text('Female', style: TextStyle(fontSize: 22, color: Colors.grey)),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  final String label;
  final Function onPressed;

  const ActionButton({
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      color: Colors.pinkAccent,
      child: MaterialButton(
        child: Text(
          label,
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
        onPressed: onPressed as void Function()?,
      ),
    );
  }
}


class IncrementDecrementButton extends StatelessWidget {
  final String label;
  final int value;
  final void Function() onIncrement;
  final void Function() onDecrement;

  const IncrementDecrementButton({
    required this.label,
    required this.value,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey,
          ),
        ),
        SizedBox(height: 8),
        Text(
          value.toString(),
          style: TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
              backgroundColor: Colors.grey.shade600,
              child: Icon(Icons.remove,color:Colors.white),
              onPressed: onDecrement,
              mini: true,
            ),
            SizedBox(width: 8),
            FloatingActionButton(
              backgroundColor: Colors.grey.shade600,
              child: Icon(Icons.add,color: Colors.white,),
              onPressed: onIncrement,
              mini: true,
            ),
          ],
        ),
      ],
    );
  }
}
