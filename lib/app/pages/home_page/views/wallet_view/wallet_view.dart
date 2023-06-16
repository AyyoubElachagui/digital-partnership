import 'package:digital_partnership_group/app/pages/home_page/views/wallet_view/widgets/balance_card.dart';
import 'package:digital_partnership_group/app/pages/home_page/views/wallet_view/widgets/transaction_card.dart';
import 'package:digital_partnership_group/app/utils/color_palette.dart';
import 'package:digital_partnership_group/app/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class WalletView extends StatelessWidget {
  const WalletView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.fromLTRB(20, 80, 20, 0),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          width: 200,
                          child: CustomButton(
                            hasBorder: true,
                            onPressed: () {},
                            text: 'Add Money',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BalanceCard(
                          money: '\$500',
                          label: 'Available Balance',
                        ),
                        BalanceCard(
                          money: '\$200',
                          label: 'Total Expend',
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Transections',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: ColorPalette.textPrimaryColor),
                        ),
                        Text(
                          'See All',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: ColorPalette.btnPrimaryColor),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ...List.generate(
                          8,
                          (index) => TransactionCard(
                                isNegative: (index % 2) == 0,
                              )).toList(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
