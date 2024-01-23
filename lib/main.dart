import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    ));

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _controller1 = new TextEditingController();
  TextEditingController _controller2 = new TextEditingController();
  TextEditingController _controller3 = new TextEditingController();
  TextEditingController _controller4 = new TextEditingController();
  double carprice = 0;
  double down = 0;
  double year = 0;
  double interst = 0;
  double finace = 0;
  double interestperyear = 0;
  double totalinterest = 0;
  double totalierandfinance = 0;
  double paypermonth = 0;
  void calculation() {
    finace = (double.parse(_controller1.text)-double.parse(_controller2.text));
    interestperyear = finace * (double.parse(_controller4.text)/100);
    totalierandfinance = finace + totalinterest;
    setState(() {
      paypermonth = totalierandfinance / ((double.parse(_controller3.text))* 12);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.notes,
          size: 25,
          color: Colors.white,
        ),
        toolbarHeight: 30,
        backgroundColor: Colors.blue,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Icon(
              Icons.info,
              size: 25,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: body(),
    );
  }

  Widget body() {
    return Container(
      color: Colors.grey[100],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 120,
            decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(100))),
            child: Align(
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Car Loan',
                    style: GoogleFonts.robotoMono(
                        fontSize: 30, color: Colors.white),
                  ),
                  Text(
                    'Veerawat Inplot',
                    style: GoogleFonts.robotoMono(
                        fontSize: 15, color: Colors.white),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          // Text('test position'),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 40, 0),
            child: Column(
              children: [
                inputForm("ราคารถ", _controller1, "เช่น 800000"),
                inputForm("เงินดาวน์", _controller2,"เช่น 100000"),
                inputForm("จำนวนปีที่ผอน", _controller3, "เช่น 4"),
                inputForm("ดอกเบี้ย % ต่อปี", _controller4,"เช่น 5"),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          GestureDetector(
            onTap: () {
              calculation();
            },
            child: Container(
              height: 55,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Center(
                child: Text(
                  'คำนวน',
                  style: GoogleFonts.robotoMono(fontSize: 25,color: Colors.white),
                ),
              ),
            ),
          ),
          // SizedBox(
          //   height: 5,
          // ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'ดอกเบี้ยต่อปี: '+ interestperyear.toStringAsFixed(2),
                  style: GoogleFonts.robotoMono(fontSize: 18),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'รวมดอกเบี้ยทั้งหมด: '+ interestperyear.toStringAsFixed(2),
                  style: GoogleFonts.robotoMono(fontSize: 18),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'ผ่อนเดือนละ: '+ interestperyear.toStringAsFixed(2),
                  style: GoogleFonts.robotoMono(fontSize: 18),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget inputForm(
    String title, TextEditingController controller,
    String hinttext
  ) { 
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.robotoMono(fontSize: 20),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          height: 55,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
                border: OutlineInputBorder(borderSide: BorderSide.none),
                hintText: hinttext,
                ),
          ),
        ),
        SizedBox(
          height: 5,
        )
      ],
    );
  }
}
