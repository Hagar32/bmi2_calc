
import 'package:bmi_calc/persentation/pages/bmi_home_page.dart';
import 'package:flutter/material.dart';

@override
class FormPage extends StatelessWidget {
  FormPage({super.key});
  GlobalKey<FormState>state=GlobalKey();
  TextEditingController name =TextEditingController();
  TextEditingController password =TextEditingController();
  TextEditingController email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign in Page'),
backgroundColor: Colors.black38,
        centerTitle: true,
      ),
      body: Form(
        key: state,
        child: Column(
          children: [
            SizedBox(width: 16,height: 16,),
            TextFormField(
              validator: (value){
                if(value!.isEmpty){
                  return 'this field can not be empty';
                }
                return null;
              },
              controller: name,
              decoration: InputDecoration(
                hintText: 'Please Enter your name ',

              ),
            ),
            SizedBox(width: 16,height: 16,),
            TextFormField(
              validator: ( value){
                if(value!.isEmpty || !value.contains('@') || !value.endsWith('.com') || value.length<5){
                  return ' invalid Email';

                }
                return null;
              },
              controller: email,
              decoration: InputDecoration(
                hintText: '   Ente Email',
              ),
            ),
            SizedBox(width: 16,height: 16,),
            TextFormField(
              validator: (value){
                if(value!.isEmpty && value.length<6){
                  return '    invalid Password length';

                }
                return null;
              },
              controller: password,
              decoration: InputDecoration(
                hintText: '    Enter  your Password',
              ),
            ),
            SizedBox(height:100,),
            MaterialButton(
              onPressed: (){
                if(state.currentState!.validate()){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>BmiPage()));
                }

                state.currentState!.validate();

            },
              textColor: Colors.white,
              color: Colors.black,

              child: Text('Sign in'),
           ),
          ],
        ),
      ),
    );
  }
}
