import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MainGauge extends StatelessWidget {
  final double screenWidth;
  final double screenHeight;
  //NEXUS 5X screenwidth: 731.4285714285714
  //NEXUS 5X screenheight: 411.42857142857144

  final double rpmNow;
  final double speedNow;
  final double tempNow;
  final double fuelNow;
  final double gearNow;
  final double tripTotal;
  final int passengerNow;

  final bool brake;
  final bool defogger;
  final bool highBeam;
  final bool lowBeam;
  final bool oil;
  final bool wiper;

  MainGauge({
    this.screenWidth,
    this.screenHeight,
    this.rpmNow,
    this.speedNow,
    this.tempNow,
    this.fuelNow,
    this.passengerNow,
    this.gearNow,
    this.tripTotal,
    this.brake,
    this.defogger,
    this.highBeam,
    this.lowBeam,
    this.oil,
    this.wiper,
  });

  double _rpmGauge() {
    const int rpmMax = 9000;
    const double rpmWidthRatio = 0.5284375;
    double rpmFullWidth = screenWidth * rpmWidthRatio;
    double rpm = rpmNow * rpmMax;
    double gaugeWidth;

    if (rpm > 9000) {
      gaugeWidth = rpmFullWidth;
    } else if (rpm > 5000) {
      gaugeWidth = ((rpmFullWidth * 0.52) * ((rpm - 5000) / (rpmMax - 5000))) +
        (rpmFullWidth * 0.48);
    } else
      gaugeWidth = (rpmFullWidth * 0.48) * (rpm / (rpmMax - 4000));
    return gaugeWidth;
  }

  double _torqueGauge() {
    const int rpmMax = 9000;
    const double torqueWidthRatio = 0.2106;
    double torqueFullWidth = screenWidth * torqueWidthRatio;
    double rpm = rpmNow * rpmMax;
    double torqueLeft = 1 - (rpm / rpmMax);
    return torqueFullWidth * torqueLeft;
  }

  double _tempGauge() {
    const double tempLowestRatio = 0.24706614583;
    const double tempHighestRatio = 0.385474479167;

    double tempLowestWidth = tempLowestRatio * screenWidth;
    double tempHighestWidth = tempHighestRatio * screenWidth;
    double tempWidth = tempHighestWidth - tempLowestWidth;

    return tempLowestWidth + (tempNow * tempWidth);
  }

  double _fuelGauge() {
    const double fuelLowestRatio = 0.2424494791666667;
    const double fuelHighestRatio = 0.3808567708333333;

    double fuelLowestWidth = fuelLowestRatio * screenWidth;
    double fuelHighestWidth = fuelHighestRatio * screenWidth;
    double fuelWidth = fuelHighestWidth - fuelLowestWidth;

    return fuelLowestWidth + (fuelNow * fuelWidth);
  }

  String _rpmNum() {
    const int rpmMax = 9000;
    String x = (rpmNow * rpmMax).toStringAsFixed(0);
    debugPrint('RPM: $x');
    debugPrint("SCREENHEIGHT: $screenHeight");
    debugPrint("SCREENWIDTH: $screenWidth");
    return x;
  }

  String _torqueNum() {
    double rpm = rpmNow * 100;
    String x = (100 - rpm).toStringAsFixed(0);
    debugPrint('Torque Left: $x%');
    return x;
  }

  String _speedGauge() {
    const int maxSpeed = 199;
    String x = (speedNow * maxSpeed).toStringAsFixed(0);
    debugPrint('Speed: $x');
    return x;
  }

  String _fuelNum() {
    String x = (fuelNow * 100).toStringAsFixed(0);
    debugPrint('Battery: $x%');
    return x;
  }

  String _kmRemaining() {
    const int maxKM = 250;
    String x = (fuelNow * maxKM).toStringAsFixed(0);
    debugPrint('Battery: $x%');
    return x;
  }

  String _tripNum() {
    double maxTrip = 200000.00;
    final formatter = NumberFormat("#,###.##");
    String trip = formatter.format(tripTotal * maxTrip);
    return trip;
  }

  String _numOfPassenger() {
    return passengerNow > 1 ? 'PASSENGERS' : 'PASSENGER';
  }

  double _gearOpacity(String gear) {
    double opacity;
    if (gearNow <= 0.2) {
      gear == 'p' ? opacity = 1.0 : opacity = 0.0;
    } else if (gearNow <= 0.4) {
      gear == 'r' ? opacity = 1.0 : opacity = 0.0;
    } else if (gearNow <= 0.6) {
      gear == 'n' ? opacity = 1.0 : opacity = 0.0;
    } else if (gearNow <= 0.8) {
      gear == 'd' ? opacity = 1.0 : opacity = 0.0;
    } else {
      gear == 'l' ? opacity = 1.0 : opacity = 0.0;
    }
    return opacity;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: < Widget > [
        //=============== METER OFF ===============//
        Positioned(
          top: 0,
          child: Image.asset(
            'assets/meter/meterOff.png',
            width: screenWidth,
          ),
        ),

        //=============== RPM ON ===============//
        Positioned(
          top: 0,
          left: 0,
          child: SizedBox.fromSize(
            size: Size(_rpmGauge(), screenHeight * 0.618),
            child: Container(
              child: Image.asset(
                'assets/meter/meterOn.png',
                fit: BoxFit.fitHeight,
                alignment: Alignment.centerLeft,
              ),
            ),
          ),
        ),

        //=============== TORQUE ON ===============//
        Positioned(
          top: 0,
          right: 0,
          child: SizedBox.fromSize(
            size: Size(_torqueGauge(), screenHeight * 0.618),
            child: Container(
              child: Image.asset(
                'assets/meter/meterOn.png',
                fit: BoxFit.fitHeight,
                alignment: Alignment.centerRight,
              ),
            ),
          ),
        ),

        //=============== TEMP ===============//
        Positioned(
          top: 0,
          left: 0,
          child: SizedBox.fromSize(
            size: Size(_tempGauge(), screenHeight * 0.618),
            child: Container(
              child: Image.asset(
                'assets/meter/indicatorOn.png',
                fit: BoxFit.fitHeight,
                alignment: Alignment.centerLeft,
              ),
            ),
          ),
        ),

        //=============== FUEL ===============//
        Positioned(
          top: 0,
          right: 0,
          child: SizedBox.fromSize(
            size: Size(_fuelGauge(), screenHeight * 0.618),
            child: Container(
              child: Image.asset(
                'assets/meter/indicatorOn.png',
                fit: BoxFit.fitHeight,
                alignment: Alignment.centerRight,
              ),
            ),
          ),
        ),

        //=============== GEAR ===============//
        Positioned(
          top: screenHeight * 0.4410703703703704,
          child: Container(
            height: screenHeight * 0.0480203703703704,
            width: screenWidth,
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: < Widget > [
                Opacity(
                  opacity: _gearOpacity('p'),
                  child: Image.asset(
                    "assets/indicator/gearOn.png",
                    height: screenHeight * 0.0480203703703704,
                    width: screenWidth * 0.031728125,
                  ),
                ),
                Opacity(
                  opacity: _gearOpacity('r'),
                  child: Image.asset(
                    "assets/indicator/gearOn.png",
                    height: screenHeight * 0.0480203703703704,
                    width: screenWidth * 0.031728125,
                  ),
                ),
                Opacity(
                  opacity: _gearOpacity('n'),
                  child: Image.asset(
                    "assets/indicator/gearOn.png",
                    height: screenHeight * 0.0480203703703704,
                    width: screenWidth * 0.031728125,
                  ),
                ),
                Opacity(
                  opacity: _gearOpacity('d'),
                  child: Image.asset(
                    "assets/indicator/gearOn.png",
                    height: screenHeight * 0.0480203703703704,
                    width: screenWidth * 0.031728125,
                  ),
                ),
                Opacity(
                  opacity: _gearOpacity('l'),
                  child: Image.asset(
                    "assets/indicator/gearOn.png",
                    height: screenHeight * 0.0480203703703704,
                    width: screenWidth * 0.031728125,
                  ),
                ),
              ],
            ),
          ),
        ),

        //=============== UPPER ===============//
        Positioned(
          top: 0,
          child: Image.asset(
            'assets/meter/upperMeter.png',
            width: screenWidth,
          ),
        ),

        //=============== SPEED ===============//
        Positioned(
          top: screenHeight * 0.231,
          child: Container(
            height: screenHeight * 0.165,
            width: screenWidth,
            child: FittedBox(
              fit: BoxFit.fitHeight,
              alignment: Alignment.center,
              child: Text(
                _speedGauge(),
                style: TextStyle(
                  fontFamily: "Krunch",
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),

        //=============== RPM NUM ===============//
        Positioned(
          top: screenHeight * 0.094,
          left: screenWidth * 0.537,
          child: Container(
            height: screenHeight * 0.057,
            width: screenWidth * 0.112,
            child: FittedBox(
              fit: BoxFit.fitHeight,
              alignment: Alignment.centerLeft,
              child: Text(
                _rpmNum(),
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: "Krunch",
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),

        //=============== TORQUE NUM ===============//
        Positioned(
          top: screenHeight * 0.094,
          left: screenWidth * 0.675,
          child: Container(
            height: screenHeight * 0.057,
            width: screenWidth * 0.112,
            child: FittedBox(
              fit: BoxFit.fitHeight,
              alignment: Alignment.centerLeft,
              child: Text(
                _torqueNum() + '%',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: "Krunch",
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),

        //=============== BATTERY NUM ===============//
        Positioned(
          top: screenHeight * 0.268,
          right: screenWidth * 0.215,
          child: Container(
            height: screenHeight * 0.12,
            width: screenWidth * 0.11,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: < Widget > [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: < Widget > [
                    SizedBox(
                      width: screenWidth * 0.015,
                    ),
                    Container(
                      height: screenHeight * 0.065,
                      child: FittedBox(
                        fit: BoxFit.fitHeight,
                        alignment: Alignment.center,
                        child: Text(
                          _fuelNum(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: "Krunch",
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: screenHeight * 0.035,
                      child: FittedBox(
                        fit: BoxFit.fitHeight,
                        child: Text(
                          "%",
                          style: TextStyle(
                            fontFamily: "Krunch",
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: screenHeight * 0.025,
                ),
                Container(
                  height: screenHeight * 0.029,
                  child: FittedBox(
                    fit: BoxFit.fitHeight,
                    alignment: Alignment.center,
                    child: Text(
                      _kmRemaining() + " KM remaining",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "MuseoSans",
                        fontWeight: FontWeight.w100,
                        fontStyle: FontStyle.italic,
                        letterSpacing: -0.3,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        //=============== PASSANGER ON BOARD ===============//
        Positioned(
          top: screenHeight * 0.268,
          left: screenWidth * 0.227121875,
          child: Container(
            height: screenHeight * 0.095,
            width: screenWidth * 0.0894921875,
            alignment: Alignment.center,
            child: Column(
              children: < Widget > [
                Container(
                  height: screenHeight * 0.065,
                  child: FittedBox(
                    fit: BoxFit.fitHeight,
                    alignment: Alignment.center,
                    child: Text(
                      "$passengerNow",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "Krunch",
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: screenHeight * 0.03,
                  child: FittedBox(
                    fit: BoxFit.fitHeight,
                    alignment: Alignment.center,
                    child: Text(
                      _numOfPassenger(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "MuseoSans",
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.italic,
                        letterSpacing: -0.4,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),

        //=============== TRIP METER ===============//
        Positioned(
          top: screenHeight * 0.54,
          child: Container(
            height: screenHeight * 0.035,
            width: screenWidth,
            alignment: Alignment.center,
            child: FittedBox(
              fit: BoxFit.fitHeight,
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: < Widget > [
                  Text(
                    "TRIP: ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "MuseoSans",
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.4,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    _tripNum() + " KM",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "MuseoSans",
                      fontWeight: FontWeight.w300,
                      letterSpacing: -0.4,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            )),
        ),

        //=============== INDICATORS ===============//
        Positioned(
          top: screenHeight * 0.5214138888888889,
          child: Container(
            height: screenHeight * 0.0705231481481481,
            width: screenWidth,
            alignment: Alignment.center,
            // color: Colors.blue,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: < Widget > [
                //=============== HIGH BEAM ===============//
                Image.asset(
                  "assets/indicator/high_beam.png",
                  height: screenHeight * 0.0224805555555556,
                  color: highBeam ?
                  Color.fromRGBO(242, 184, 68, 1.0) :
                  Color.fromRGBO(6, 1, 94, 1.0),
                ),
                SizedBox(
                  width: screenWidth * 0.0074255208333333,
                ),

                //=============== LOW BEAM ===============//
                Image.asset(
                  "assets/indicator/low_beam.png",
                  height: screenHeight * 0.0224805555555556,
                  color: lowBeam ?
                  Color.fromRGBO(242, 184, 68, 1.0) :
                  Color.fromRGBO(6, 1, 94, 1.0),
                ),
                SizedBox(
                  width: screenWidth * 0.0074255208333333,
                ),

                //=============== BRAKE ===============//
                Image.asset(
                  "assets/indicator/brake.png",
                  height: screenHeight * 0.0224805555555556,
                  color: brake ?
                  Color.fromRGBO(242, 184, 68, 1.0) :
                  Color.fromRGBO(6, 1, 94, 1.0),
                ),
                SizedBox(
                  width: screenWidth * 0.0074255208333333,
                ),

                //=============== SPACER ===============//
                Container(
                  width: screenWidth * 0.16,
                  // color: Colors.black,
                ),

                //=============== DEFOGGER ===============//
                SizedBox(
                  width: screenWidth * 0.0074255208333333,
                ),
                Image.asset(
                  "assets/indicator/defogger.png",
                  height: screenHeight * 0.0224805555555556,
                  color: defogger ?
                  Color.fromRGBO(242, 184, 68, 1.0) :
                  Color.fromRGBO(6, 1, 94, 1.0),
                ),

                //=============== WIPER ===============//
                SizedBox(
                  width: screenWidth * 0.0074255208333333,
                ),
                Image.asset(
                  "assets/indicator/wiper.png",
                  height: screenHeight * 0.0224805555555556,
                  color: wiper ?
                  Color.fromRGBO(242, 184, 68, 1.0) :
                  Color.fromRGBO(6, 1, 94, 1.0),
                ),

                //=============== OIL ===============//
                SizedBox(
                  width: screenWidth * 0.0074255208333333,
                ),
                Image.asset(
                  "assets/indicator/oil.png",
                  height: screenHeight * 0.018,
                  color: oil ?
                  Color.fromRGBO(255, 45, 85, 1.0) :
                  Color.fromRGBO(6, 1, 94, 1.0),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}