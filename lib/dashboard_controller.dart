import 'package:flutter/material.dart';

class DashboardController extends StatelessWidget {
  final double screenHeight;
  final double screenWidth;

  final double rpmNow;
  final double speedNow;
  final double tempNow;
  final double fuelNow;
  final double gearNow;
  final double tripTotal;
  final int passengerNow;

  final Function rpmUbah;
  final Function speedUbah;
  final Function tempUbah;
  final Function fuelUbah;
  final Function gearUbah;
  final Function tripUbah;
  final Function passengerIncrease;
  final Function passengerDecrease;

  final bool brake;
  final bool defogger;
  final bool highBeam;
  final bool lowBeam;
  final bool oil;
  final bool wiper;

  final Function brakeUbah;
  final Function defoggerUbah;
  final Function wiperUbah;
  final Function oilUbah;
  final Function highBeamUbah;
  final Function lowBeamUbah;

  DashboardController({
    this.screenHeight,
    this.screenWidth,
    this.rpmNow,
    this.rpmUbah,
    this.speedNow,
    this.speedUbah,
    this.tempNow,
    this.tempUbah,
    this.fuelNow,
    this.fuelUbah,
    this.passengerNow,
    this.passengerIncrease,
    this.passengerDecrease,
    this.gearNow,
    this.gearUbah,
    this.tripTotal,
    this.tripUbah,
    this.brake,
    this.defogger,
    this.highBeam,
    this.lowBeam,
    this.oil,
    this.wiper,
    this.brakeUbah,
    this.defoggerUbah,
    this.wiperUbah,
    this.oilUbah,
    this.highBeamUbah,
    this.lowBeamUbah,
  });

  @override
  Widget build(BuildContext context) {
    //=============== CONTROLLER ===============//
    return Column(
      children: <Widget>[
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.619,
          width: double.infinity,
        ),
        SizedBox(
          height: screenHeight * 0.0121527777777778 * 2,
        ),

        //=============== SLIDER RPM & SPEED ===============//
        Row(
          children: <Widget>[
            SizedBox(
              height: screenHeight * 0.0121527777777778 * 3,
            ),
            Expanded(child: SizedBox(), flex: 1),
            Expanded(child: Text("RPM"), flex: 3),
            Expanded(
                child: Slider(
                  value: rpmNow,
                  onChanged: rpmUbah,
                ),
                flex: 23),
            Expanded(child: SizedBox(), flex: 1),
            Expanded(child: Text("Speed"), flex: 3),
            Expanded(
                child: Container(
                  child: Slider(
                    value: speedNow,
                    onChanged: speedUbah,
                  ),
                ),
                flex: 23),
            Expanded(child: SizedBox(), flex: 1),
          ],
        ),

        //=============== SLIDER TEMP & FUEL ===============//
        Row(
          children: <Widget>[
            SizedBox(
              height: screenHeight * 0.0121527777777778 * 2,
            ),
            Expanded(child: SizedBox(), flex: 1),
            Expanded(child: Text("Temp"), flex: 3),
            Expanded(
                child: Slider(
                  value: tempNow,
                  onChanged: tempUbah,
                ),
                flex: 23),
            Expanded(child: SizedBox(), flex: 1),
            Expanded(child: Text("Fuel"), flex: 3),
            Expanded(
                child: Container(
                  child: Slider(
                    value: fuelNow,
                    onChanged: fuelUbah,
                  ),
                ),
                flex: 23),
            Expanded(child: SizedBox(), flex: 1),
          ],
        ),

        //=============== SLIDER GEAR & PASSANGER ===============//
        Row(
          children: <Widget>[
            SizedBox(
              height: screenHeight * 0.0121527777777778 * 2,
            ),
            Expanded(child: SizedBox(), flex: 1),
            Expanded(child: Text("Gear"), flex: 3),
            Expanded(
                child: Slider(
                  value: gearNow,
                  onChanged: gearUbah,
                ),
                flex: 23),
            Expanded(child: SizedBox(), flex: 1),
            Expanded(child: Text("Trip"), flex: 3),
            Expanded(
                child: Container(
                  child: Slider(
                    value: tripTotal,
                    onChanged: tripUbah,
                  ),
                ),
                flex: 23),
            Expanded(child: SizedBox(), flex: 1),
          ],
        ),

        //=============== SWITCH ===============//
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            //=============== HIGHBEAM ===============//
            Column(
              children: <Widget>[
                Container(
                  child: Text("Highbeam"),
                ),
                Container(
                  height: screenHeight * 0.0607638888888891,
                  child: Switch(
                    value: highBeam,
                    onChanged: highBeamUbah,
                  ),
                )
              ],
            ),

            //=============== LOWBEAM ===============//
            Column(
              children: <Widget>[
                Container(
                  child: Text("Lowbeam"),
                ),
                Container(
                  height: screenHeight * 0.0607638888888891,
                  child: Switch(
                    value: lowBeam,
                    onChanged: lowBeamUbah,
                  ),
                )
              ],
            ),

            //=============== BRAKE ===============//
            Column(
              children: <Widget>[
                Container(
                  child: Text("Brake"),
                ),
                Container(
                  height: screenHeight * 0.0607638888888891,
                  child: Switch(
                    value: brake,
                    onChanged: brakeUbah,
                  ),
                )
              ],
            ),

            //=============== PASSENGER ===============//
            Column(
              children: <Widget>[
                Text("Passenger"),
                SizedBox(
                  height: screenHeight * 0.0121527777777778,
                ),
                Row(
                  children: <Widget>[
                    SizedBox.fromSize(
                      size: Size.square(screenHeight * 0.0121527777777778 * 5),
                      child: FloatingActionButton(
                        onPressed: passengerIncrease,
                        tooltip: 'Increment',
                        child: Icon(
                          Icons.add,
                          size: screenHeight * 0.0121527777777778 * 3,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: screenHeight * 0.0121527777777778,
                    ),
                    SizedBox.fromSize(
                      size: Size.square(screenHeight * 0.0121527777777778 * 5),
                      child: FloatingActionButton(
                        onPressed: passengerDecrease,
                        tooltip: 'Increment',
                        child: Icon(
                          Icons.remove,
                          size: screenHeight * 0.0121527777777778 * 3,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            //=============== DEFOGGER ===============//
            Column(
              children: <Widget>[
                Container(
                  child: Text("Defogger"),
                ),
                Container(
                  height: screenHeight * 0.0607638888888891,
                  child: Switch(
                    value: defogger,
                    onChanged: defoggerUbah,
                  ),
                )
              ],
            ),

            //=============== WIPER ===============//
            Column(
              children: <Widget>[
                Container(
                  child: Text("Wiper"),
                ),
                Container(
                  height: screenHeight * 0.0607638888888891,
                  child: Switch(
                    value: wiper,
                    onChanged: wiperUbah,
                  ),
                )
              ],
            ),

            //=============== OIL ===============//
            Column(
              children: <Widget>[
                Container(
                  child: Text("Oil"),
                ),
                Container(
                  height: screenHeight * 0.0607638888888891,
                  child: Switch(
                    value: oil,
                    onChanged: oilUbah,
                  ),
                )
              ],
            ),
          ],
        ),

        //=============== SIGNATURE ===============//
        SizedBox(
          height: 20,
        ),
        Container(
          height: 30,
          color: Colors.black12,
          alignment: Alignment.center,
          child: Text(
            "Copyright 2019 - Ahmad Dhiyaaul Auliyaa",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "MuseoSans",
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.italic,
              letterSpacing: -0.3,
            ),
          ),
        ),
      ],
    );
  }
}
