import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:stripe_app/widgets/total_pay_butoon.dart';

import '../models/tarjeta_credito.dart';


class TarjetaPage extends StatelessWidget {
   final tarjeta = TarjetaCredito(
      cardNumberHidden: '4242',
      cardNumber: '4242424242424242',
      brand: 'visa',
      cvv: '213',
      expiracyDate: '01/25',
      cardHolderNameUser: 'Fernando Herrera'
    );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagar'),
      ),
      body: Stack(
        children: [
          Container(),
          Hero(
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
          Positioned(
            bottom: 0,
            child: TotalPayButton()
            )
        ],
        )
     );
  }
}