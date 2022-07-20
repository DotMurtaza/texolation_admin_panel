import 'package:admin_taxolution/Constant/Text_Styles.dart';
import 'package:admin_taxolution/Controller/payment_controller.dart';
import 'package:admin_taxolution/Widget/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Payments extends StatelessWidget {
  const Payments({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<PaymentController>(
        init: Get.put<PaymentController>(PaymentController()),
        builder: (PaymentController paymentController) {
          if (paymentController != null && paymentController.payment != null) {
            return SizedBox(
              height: SizeConfig.heightMultiplier * 90,
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: paymentController.payment.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Stack(
                        children: [
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text('Amount :'),
                                      Text(
                                          '${paymentController.payment[index].amount}')
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text('Date :'),
                                      Text(DateFormat.yMMMd().format(
                                          paymentController.payment[index].date
                                              .toDate()))
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Center(
                            child: Container(
                              width: SizeConfig.widthMultiplier * 25,
                              height: SizeConfig.heightMultiplier * 3.5,
                              decoration: BoxDecoration(
                                  color: Colors.blueAccent,
                                  borderRadius: BorderRadius.circular(14)),
                              child: Center(
                                  child: Text(
                                "${paymentController.payment[index].year}",
                                style: TEXT_STYLE_WHITE_COLOR_NORMAL,
                              )),
                            ),
                          )
                        ],
                      ),
                    );
                  }),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
