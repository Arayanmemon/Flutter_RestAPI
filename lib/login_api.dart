import 'package:flutter/material.dart';
import 'package:http/http.dart';

class LoginApi extends StatefulWidget {
  const LoginApi({Key? key}) : super(key: key);

  @override
  State<LoginApi> createState() => _LoginApiState();
}

class _LoginApiState extends State<LoginApi> {

  void login(String email, pass) async {
      try{
        Response response = await post(
            Uri.parse('https://reqres.in/api/register'),
            body: {
              'email': email,
              'password': pass
            }
        );

        if(response.statusCode == 200){
          print('Registered Successfully');
          print(response.body);
        }
        else{
          print('An error occurred');
        }

      }catch(e){
        print(e.toString());
      }
  }

  TextEditingController EmailController = TextEditingController();
  TextEditingController PassController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Api'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            TextFormField(
              controller: EmailController,
              decoration: const InputDecoration(
                hintText: 'Enter email'
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: PassController,
              decoration: const InputDecoration(
                  hintText: 'Enter Password'
              ),
            ),
            SizedBox(height: 30,),
            InkWell(
              onTap: (){
                login(EmailController.text, PassController.text);
              },
              child: Container(
                height: 30,
                width: double.infinity,
                child: Center(child: Text('Login')),
                decoration:  BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.teal
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
