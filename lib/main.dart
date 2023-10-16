import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  double heightFinal = 700;
  double widthFinal = 100;
  CrossFadeState crossFadeState=CrossFadeState.showFirst;
  Alignment alignment=Alignment.bottomCenter;
  bool isSlelected = false;
  final tweenOpacity = Tween<double>(begin: 0, end: 1);
  final tweenSlide = Tween<double>(begin: 5, end: 10);
  void _incrementContainer() {
    setState(() {
      heightFinal=heightFinal==700?350:700;
      // alignment=alignment==Alignment.bottomCenter? Alignment.topCenter:Alignment.bottomCenter;
    });
  }
  void _checkStateForCross(){
    setState(() {
      crossFadeState=crossFadeState==CrossFadeState.showFirst?CrossFadeState.showSecond:CrossFadeState.showFirst;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent.shade100,
        title: const Text(
          'Login Secreen',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
        ),
      ),
      body: AnimatedCrossFade(crossFadeState:crossFadeState ,duration:const Duration(milliseconds: 2000) ,firstChild:Container(child:Center(
          child: Row(
            children: <Widget>[
              Row(
                children: [
                  Container(
                    height: height,
                    width: width * 0.3,
                    child: TweenAnimationBuilder(
                      duration: const Duration(seconds: 3),
                      tween: tweenOpacity,
                      curve: Curves.linear,
                      builder: (context, value, child) {
                        return Opacity(
                          opacity: value,
                          child: child,
                        );
                      },
                      child: Image.asset(
                        'assets/images/person.jpg',
                        fit: BoxFit.fill,
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  AnimatedContainer(duration:const Duration(seconds: 3),height: heightFinal,
                    child: TweenAnimationBuilder(duration: const Duration(seconds: 5),tween: tweenOpacity,curve: Curves.linear,builder: (context, value, child) {
                      return Opacity(opacity: value,child: child,);
                    },
                      child: Container(
                        height: height,
                        width: width * 0.7,
                        color: Colors.white70,
                        child: Column(
                          children: [
                            SizedBox(
                              height: height * 0.05,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: width * 0.3,
                                ),
                                SizedBox(
                                  width: width * 0.2,
                                  height: height * 0.04,
                                  child: const Text(
                                    'Welcom!',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.blueAccent,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: width * 0.27,
                                ),
                                SizedBox(
                                  width: width * 0.2,
                                  height: height * 0.07,
                                  child: const Text(
                                    'Sign In to your account',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.blueAccent,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: height * 0.03,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: width * 0.2,
                                ),
                                SizedBox(
                                    width: width * 0.3,
                                    height: height * 0.07,
                                    child: TextField(
                                      autofocus: true,
                                      cursorColor: Colors.black,
                                      style: const TextStyle(
                                        color: Colors.blueAccent,
                                        fontSize: 14,
                                      ),
                                      decoration: InputDecoration(
                                          iconColor: Colors.blueAccent,
                                          filled: true,
                                          fillColor: Colors.white,
                                          focusColor: Colors.blueAccent,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(width * 0.1),
                                          ),
                                          labelText: 'User Name',
                                          icon: const Icon(Icons.person)),
                                    )),
                              ],
                            ),
                            SizedBox(
                              height: height * 0.03,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: width * 0.2,
                                ),
                                SizedBox(
                                    width: width * 0.3,
                                    height: height * 0.07,
                                    child: TextField(
                                      obscureText: true,
                                      autofocus: true,
                                      cursorColor: Colors.black,
                                      style: const TextStyle(
                                        color: Colors.blueAccent,
                                        fontSize: 14,
                                      ),
                                      decoration: InputDecoration(
                                          iconColor: Colors.blueAccent,
                                          filled: true,
                                          fillColor: Colors.white,
                                          focusColor: Colors.blueAccent,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(width * 0.1),
                                          ),
                                          labelText: 'password',
                                          icon: const Icon(Icons.lock_outline)),
                                    )),
                              ],
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: width * 0.3,
                                ),
                                const Text(
                                  'Forget Password ?',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.blueAccent),
                                )
                              ],
                            ),
                            SizedBox(
                              height: height * 0.02,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: width * 0.2,height: height*0.05,
                                ),
                                ElevatedButton(
                                    onPressed: () {},
                                    child: const Text(
                                      'SignUp',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.blueAccent,
                                      ),
                                    )),
                                SizedBox(
                                  width: width * 0.15,
                                ),
                                ElevatedButton(
                                    onPressed: _checkStateForCross,
                                    child: const Text(
                                      'Create Account',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.blueAccent,
                                      ),
                                    ))
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ), ) ,secondChild:Container(child: Form(
              child: Stack(
                children: [
                  Positioned(
                      child: Container(
                    width: width * 1,
                    height: height * 1,
                    // color: Colors.white,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage('https://media.istockphoto.com/id/1365132896/vector/subtle-smooth-gradient-sunset-background.jpg?s=612x612&w=0&k=20&c=rNJ0PmwxjiDjFsQMOf3XpseZS8rjusdtVgdajdtZtu4='),
                            fit: BoxFit.cover)),
                  )),
                  Positioned(
                      top: height * 0.1,
                      left: width * 0.09,
                      child: Container(
                        height: height * 0.82,
                        width: width * 0.8,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: width * 0.03,
                                ),
                                SizedBox(
                                  height: height * 0.1,
                                  width: width * 0.4,
                                  child: const Text(
                                    'Create Account :)',
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: height * 0.1,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: width * 0.1,
                                ),
                                SizedBox(
                                  width: width * 0.6,
                                  height: height * 0.07,
                                  child: TextFormField(
                                    autofocus: true,
                                    decoration: const InputDecoration(
                                        fillColor: Colors.white,
                                        label: Row(
                                          children: [
                                            Icon(Icons.person),
                                            Text(
                                              'Enter Email Id',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.white),
                                            )
                                          ],
                                        ),
                                        border: OutlineInputBorder()),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: height * 0.06,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: width * 0.1,
                                ),
                                SizedBox(
                                  width: width * 0.6,
                                  height: height * 0.07,
                                  child: TextFormField(
                                    validator: (value) {
                                      // String? firstLetter = value?.substring(0);
                                      // String? nextString = value?.substring(1,value.length);
                                      // if ( value!.isNotEmpty && value.contains(lowerCase)) {
                                      //   return null;
                                      // } else {
                                      //   return 'rewrite User name';

                                      // }
                                    },
                                    decoration: const InputDecoration(
                                        label: Row(
                                          children: [
                                            Icon(Icons.email_outlined),
                                            Text(
                                              'User name',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.white),
                                            )
                                          ],
                                        ),
                                        border: OutlineInputBorder()),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: height * 0.06,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: width * 0.1,
                                ),
                                SizedBox(
                                  width: width * 0.6,
                                  height: height * 0.07,
                                  child: TextFormField(
                                    obscureText: true,
                                    validator: (value) {
                                      // if (value.isDigitString() && value!.isNotEmpty && value.length>8 ) {
                                      //   return null;
                                      // } else {
                                      //   return 'invalide password ';

                                      // }
                                    },
                                    autofocus: false,
                                    decoration: const InputDecoration(
                                        label: Row(
                                          children: [
                                            Icon(Icons.lock_clock_outlined),
                                            Text(
                                              'Enter Password',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.white),
                                            )
                                          ],
                                        ),
                                        border: OutlineInputBorder()),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: height * 0.06,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: width * 0.1,
                                ),
                                SizedBox(
                                  width: width * 0.6,
                                  height: height * 0.07,
                                  child: TextFormField(
                                    validator: (value) {
                                      // if (value.isDigitString() && value!.contains(number) && value!.isNotEmpty && value.length ==11) {
                                      //   return null;

                                      // } else {
                                      //   return 'enter the number';
                                      // }
                                    },
                                    autofocus: false,
                                    decoration: const InputDecoration(
                                        label: Row(
                                          children: [
                                            Icon(Icons.call_outlined),
                                            Text(
                                              'Verify Number',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.white),
                                            )
                                          ],
                                        ),
                                        border: OutlineInputBorder()),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: height * 0.08,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: width * 0.2,
                                ),
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        shadowColor: Colors.black12,
                                        textStyle: const TextStyle(
                                            fontStyle: FontStyle.italic),
                                        backgroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(width * 0.2)))),
                                    onPressed: (){},
                                    child: const Text('Create Account',
                                        style: TextStyle(
                                            color: Colors.blueAccent,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold)))
                              ],
                            ),
                          ],
                        ),
                      ))
                ],
              ),
            )) ,firstCurve: Curves.easeInBack,secondCurve: Curves.linear,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementContainer,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
