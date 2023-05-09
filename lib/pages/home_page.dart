import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:stripe_app/data/tarjetas.dart';
import 'package:stripe_app/pages/tarjeta_page.dart';
import 'package:stripe_app/widgets/total_pay_butoon.dart';

import '../helpers/helpers.dart';


class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final size =MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagar'),
        actions: [
          IconButton(
           icon: Icon(Icons.add),
           onPressed: () async{
            //  mostrarloading(context);
            //  await Future.delayed(Duration(seconds: 1));
            //  Navigator.pop(context);
           },)
        ],
      ),
      body: Stack(
        children: [
          Positioned(
            width: size.width,
            height: size.height,
            top: 200,
            child: PageView.builder(
              controller: PageController(
                viewportFraction: 0.9
              ),
              physics: BouncingScrollPhysics(),
              itemCount: tarjetas.length,
              itemBuilder: (_,i){
                final tarjeta = tarjetas[i];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context,navegarFadeIn(context,TarjetaPage()));
                  },
                  child: Hero(
                    tag: tarjeta.cardNumber,
                    child: CreditCardWidget(
                       cardHolderName: tarjeta.cardHolderNameUser,
                      cardNumber: tarjeta.cardNumberHidden,
                      expiryDate: tarjeta.expiracyDate, 
                     
                      cvvCode: tarjeta.cvv,
                      showBackView: false, 
                      onCreditCardWidgetChange: (CreditCardBrand ) {  }, 
                      
                          ),
                  ),
                );
              },
            ),
          ),
          Positioned(
            bottom: 0,
            child: TotalPayButton()
            ),
        ],
      )
   );
  }
}