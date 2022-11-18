import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  const SliderPage({super.key});

  @override
  State<SliderPage> createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _sliderValue = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sliders")),
      body: Container(
        padding: EdgeInsets.only(top: 20),
        child: Column(children: <Widget>[
          _createSlider(),
          Text("current value: $_sliderValue"),
          Divider(height: 30.0,),
          Expanded(child:_createImage())
        ]),
      ),
    );
  }

  Widget _createSlider() {
    return Slider(
        label: 'Image size',
        activeColor: Colors.indigoAccent,
        value: _sliderValue,
        min: 10.0,
        max: 800.0,
        onChanged: (double currentSliderValue) {
          print(currentSliderValue);
          setState(() {
            _sliderValue = currentSliderValue;
          });
        });
  }

  _createImage() {
    return Image(
      image: NetworkImage("http://cdn.shopify.com/s/files/1/0535/2738/0144/articles/shutterstock_1290320698.jpg?v=1651099282"),
      width: _sliderValue,
      fit: BoxFit.contain
    );
  }
}
