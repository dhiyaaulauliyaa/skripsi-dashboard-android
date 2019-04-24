import 'package:flutter/material.dart';
import 'dashboard_controller.dart';
import 'main_gauge.dart';

class Dashboard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DashboardState();
  }
}

class _DashboardState extends State<Dashboard> {
  double _rpmNow = 0.0;
  double _speedNow = 0.0;
  double _tempNow = 0.0;
  double _fuelNow = 0.0;
  double _gearNow = 0.0;
  double _tripTotal = 0.0;
  int _passengerNow = 0;

  bool _brake = false;
  bool _defogger = false;
  bool _highBeam = false;
  bool _lowBeam = false;
  bool _oil = false;
  bool _wiper = false;

  void rpmUbah(double rpm) {
    setState(() {
      _rpmNow = rpm;
      debugPrint('RPM Slider: $_rpmNow');
    });
  }

  void speedUbah(double speed) {
    setState(() {
      _speedNow = speed;
      debugPrint('Speed Slider: $_speedNow');
    });
  }

  void tempUbah(double temp) {
    setState(() {
      _tempNow = temp;
      debugPrint('Temp Slider: $_tempNow');
    });
  }

  void fuelUbah(double fuel) {
    setState(() {
      _fuelNow = fuel;
      debugPrint('Fuel Slider: $_fuelNow');
    });
  }

  void gearUbah(double gear) {
    setState(() {
      _gearNow = gear;
      debugPrint('Gear Slider: $_gearNow');
    });
  }

  void tripUbah(double trip) {
    setState(() {
      _tripTotal = trip;
      debugPrint('Trip Slider: $_tripTotal');
    });
  }

  void passengerIncrease() {
    setState(() {
      _passengerNow++;
    });
  }

  void passengerDecrease() {
    setState(() {
      _passengerNow < 1 ? _passengerNow = 0 : _passengerNow--;
    });
  }

  void brakeUbah(bool value) => setState(() => _brake = value);
  void defoggerUbah(bool value) => setState(() => _defogger = value);
  void wiperUbah(bool value) => setState(() => _wiper = value);
  void oilUbah(bool value) => setState(() => _oil = value);
  void highBeamUbah(bool value) => setState(() => _highBeam = value);
  void lowBeamUbah(bool value) => setState(() => _lowBeam = value);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) => Stack(
              fit: StackFit.expand,
              children: <Widget>[
                
                ListView(
                  children: <Widget>[
                    DashboardController(
                      screenHeight: constraints.maxHeight,
                      screenWidth: constraints.maxWidth,
                      rpmNow: _rpmNow,
                      rpmUbah: rpmUbah,
                      speedNow: _speedNow,
                      speedUbah: speedUbah,
                      tempNow: _tempNow,
                      tempUbah: tempUbah,
                      fuelNow: _fuelNow,
                      fuelUbah: fuelUbah,
                      gearNow: _gearNow,
                      gearUbah: gearUbah,
                      passengerNow: _passengerNow,
                      passengerIncrease: passengerIncrease,
                      passengerDecrease: passengerDecrease,
                      tripTotal: _tripTotal,
                      tripUbah: tripUbah,
                      brake: _brake,
                      defogger: _defogger,
                      highBeam: _highBeam,
                      lowBeam: _lowBeam,
                      oil: _oil,
                      wiper: _wiper,
                      brakeUbah: brakeUbah,
                      defoggerUbah: defoggerUbah,
                      wiperUbah: wiperUbah,
                      oilUbah: oilUbah,
                      highBeamUbah: highBeamUbah,
                      lowBeamUbah: lowBeamUbah,
                    ),
                  ],
                ),
                Positioned(
                  top: 0,
                  child: SizedBox.fromSize(
                    size: Size(
                      constraints.maxWidth,
                      constraints.maxHeight * 0.618,
                    ),
                    child: Container(
                      color: Colors.black,
                    ),
                  ),
                ),
                MainGauge(
                  screenHeight: constraints.maxHeight,
                  screenWidth: constraints.maxWidth,
                  rpmNow: _rpmNow,
                  speedNow: _speedNow,
                  tempNow: _tempNow,
                  fuelNow: _fuelNow,
                  passengerNow: _passengerNow,
                  gearNow: _gearNow,
                  tripTotal: _tripTotal,
                  brake: _brake,
                  defogger: _defogger,
                  highBeam: _highBeam,
                  lowBeam: _lowBeam,
                  oil: _oil,
                  wiper: _wiper,
                ),
                Positioned(
                    top: 0,
                    child: Opacity(
                      opacity: 0,
                      child: Image.asset(
                        "assets/guide.png",
                        width: constraints.maxWidth,
                      ),
                    ))
              ],
            ),
      ),
    );
  }
}
