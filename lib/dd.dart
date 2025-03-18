import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:country_picker/country_picker.dart';

class cc extends StatefulWidget {
  const cc({super.key});

  @override
  State<cc> createState() => _ccState();
}

class _ccState extends State<cc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(children: [
        ElevatedButton(onPressed: (){
          showCountryPicker(
            countryFilter: <String>['KN', 'POL'],
            context: context,
            countryListTheme: CountryListThemeData(
              flagSize: 25,
              backgroundColor: Colors.white,
              textStyle: TextStyle(fontSize: 16, color: Colors.blueGrey),
              bottomSheetHeight: 500, // Optional. Country list modal height
              //Optional. Sets the border radius for the bottomsheet.
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
              //Optional. Styles the search field.
              inputDecoration: InputDecoration(
                labelText: 'Search',
                hintText: 'Start typing to search',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: const Color(0xFF8C98A8).withOpacity(0.2),
                  ),
                ),
              ),
            ),
            onSelect: (Country country) => print('Select country: ${country.countryCode}'),
          );
        }, child: Text("Country"))
      ],)
    );
  }
}
