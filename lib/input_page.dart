import 'package:flutter/material.dart';
import 'input_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'constants.dart';



enum Gender{
  male,
  female,
}

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender? selectedGender;
  int height = 170;
  int weight =  70;
  int age = 25;
 // Color maleCardColour = inactiveCardColour;
 // Color femaleCardColour = inactiveCardColour;
// 1 = male , 2 = female
 // void updateColour (Gender selectedGender) {
    // malecard pressed
    //if (selectedGender == Gender.male){
     // if(maleCardColour == inactiveCardColour){
    //    maleCardColour = activeCardColour;
     //   femaleCardColour = inactiveCardColour;
     // }
     // else {
   //     maleCardColour = inactiveCardColour;
   //   }
   // }
    // female card pressed
    //if (selectedGender == Gender.female) {
    //  if(femaleCardColour == inactiveCardColour){
     //   femaleCardColour = activeCardColour;
     //   maleCardColour = inactiveCardColour;
     // }
     // else {
      //  maleCardColour = inactiveCardColour;
      //}
   // }
  //}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0E21),
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget> [
          Expanded(child: Row(
            children: <Widget> [
              Expanded(child: GestureDetector(onTap: (){
                setState(() {
                  selectedGender = Gender.male;
                });
              },
                child: ReusableCard(
                  colour:selectedGender == Gender.male ? KActiveCardColour : KInactiveCardColour,
                cardChild: IconContent(
                  icon: FontAwesomeIcons.mars,
                  lable: 'MALE',
                ),),
              ),),
              Expanded(child: GestureDetector(
                onTap: (){
                  setState((){
                    selectedGender = Gender.female;
                  });
                },
                child: ReusableCard(
                  colour:selectedGender == Gender.female ? KActiveCardColour : KInactiveCardColour,
                cardChild: IconContent(
                  icon: FontAwesomeIcons.venus,
                  lable: 'FEMALE',
                ),),
              ),),
            ],
          )),
          Expanded(child: ReusableCard(
            colour: KActiveCardColour,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                Text('HEIGHT',
                style: KLabelTextStyle,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(height.toString(),
                    style:KNumberTextStyle, ),
                    Text('cm',
                    style: KLabelTextStyle,),

                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Colors.white,
                    thumbColor: Color(0xFFEB1555),
                    overlayColor: Color(0x29EB1555),
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0)
                  ),
                  child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      activeColor: Color(0xFFEB1555),
                      inactiveColor: Color(0xFF8D8E98),
                      onChanged: (double newValue){
                        setState((){
                          height = newValue.round();
                          }
                      );
                     }
                     ),
                )

              ],
            ),
          ),),

          Expanded(child: Row(
            children: <Widget> [
              Expanded(child: ReusableCard(colour:KActiveCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget> [
                    Text('WEIGHT',style: KLabelTextStyle,),
                    Text(
                      weight.toString(),
                      style: KNumberTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                       RoundIconButton(
                           icon: FontAwesomeIcons.minus,
                       onPressed: (){
                             setState((){
                               weight--;
                             });
                       },),
                        SizedBox(
                          width: 10.0,
                        ),
                      RoundIconButton(
                          icon: FontAwesomeIcons.plus,
                          onPressed: (){
                            setState((){
                                 weight++;
                                    });
                               },),

                      ],

                    )
                  ],
                ), ),),
              Expanded(child: ReusableCard(colour: KActiveCardColour ,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget> [
                  Text('AGE', style: KLabelTextStyle,),
                   Text(
                     age.toString(),
                     style: KNumberTextStyle,
                   ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RoundIconButton(
                        icon: FontAwesomeIcons.minus,
                        onPressed: (){
                          setState((){
                            age--;
                          });
                        },),
                      SizedBox(
                        width: 10.0,
                      ),
                      RoundIconButton(
                        icon: FontAwesomeIcons.plus,
                        onPressed: (){
                          setState((){
                            age++;
                          });
                        },),
                    ],
                  )
                ],
              ),),),
            ],
          )),
          Container(
            color: Color(0xFFEB1555),
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: KBottomContainerHeight,
          )
        ],

      ),
      floatingActionButton: FloatingActionButton(onPressed: (){},
        child: Icon(Icons.add),
      ),
    );
  }
}


class RoundIconButton extends StatelessWidget {
  RoundIconButton({required this.icon, required this .onPressed});

final IconData icon;
final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(onPressed: onPressed,
      child: Icon(icon),
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
    fillColor: Color(0xFF4C4F5E),);
  }
}

