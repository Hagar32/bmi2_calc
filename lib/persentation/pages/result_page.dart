import 'package:bmi_calc/persentation/pages/bmi_home_page.dart';
import 'package:flutter/material.dart';
class BmiResult extends StatelessWidget {
  const BmiResult(
      {super.key, required this.result, required this.isMale, required this.age});

  final int result;
  final bool isMale;
  final int age;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.black45,
        centerTitle: true,
      ),
      backgroundColor: Colors.black45,
      body: Padding(
        padding: EdgeInsets.all(20),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 16, height: 16,),
            Text('  Your Result', style: TextStyle(fontSize: 45,
                color: Colors.white,
                fontWeight: FontWeight.bold),),
            SizedBox(width: 16, height: 16,),
            Expanded(child:
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.blueGrey.shade900,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  SizedBox(width: 16, height: 16,),
                  Text(
                    '${result >= 18.5 && result <= 24.9 ? 'Normal' : result < 18.5 ? 'Underweight' : 'Overweight' }',
                    style: TextStyle(
                      fontSize: 25,
                      color: result < 18.5 ? Colors.deepOrange : result > 25 ? Colors.deepOrange : Colors.green,
                    ),
                  ),
                  SizedBox(width: 16, height: 16,),
                  Text('$result', style: TextStyle(color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold),),
                  Text('Normal BMI range :',
                    style: TextStyle(color: Colors.grey, fontSize: 15),),
                  SizedBox(width: 16, height: 16,),
                  Text('18.5-25kg/m2',
                    style: TextStyle(color: Colors.white, fontSize: 20),),
                  SizedBox(width: 16, height: 16,),
                  Text(
                    '${result < 18.5 ? "   You have a lower than normal body.\n  "
                        "     Try to eat more." : result > 24.9 ?
                    "   You have a higher than normal \n    weight.\n   Try to exercise more." : "  You have a normal weight. Good job!"}',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  SizedBox(width: 150, height: 150,),
                  MaterialButton(color: Colors.grey,
                    onPressed: () => {},
                    child: Text(
                      'SAVE RESULT', style: TextStyle(color: Colors.white),),

                  ),
                ],
              ),
            ),
            ),
            SizedBox(width: 50, height: 50,),
            Container(
              height: 50,
              width: double.infinity,
              color: Colors.pinkAccent,
              child: MaterialButton(
                  child: Text('Re-calculate',
                    style: TextStyle(color: Colors.white, fontSize: 22),),
                  onPressed: () {
                    Navigator.pop(context,
                        MaterialPageRoute(builder: (context) => BmiPage(),

                        ));
                  }
              ),
            ),

          ],
        ),
      ),
    );
  }
}
