import 'package:flutter/material.dart';
import 'package:ibilling/core/constants/my_colors.dart';
import 'package:intl/intl.dart' as intl;

class ContractItem extends StatelessWidget {
  const ContractItem({
    Key? key,
    required this.paddingVertical,
    required this.paddingHorizontal,
    this.radius = 10,
    required this.id,
    required this.name,
    required this.amount,
    required this.lastInvoice,
    required this.numOfInvoices,
    required this.date,
  }) : super(key: key);
  final double paddingVertical;
  final double paddingHorizontal;
  final double radius;
  final int id;
  final String name;
  final int amount;
  final int lastInvoice;
  final int numOfInvoices;
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: paddingVertical,
        left: paddingHorizontal,
        right: paddingHorizontal,
      ),
      padding: EdgeInsets.all(paddingHorizontal),
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.25,
      decoration: BoxDecoration(
        color: MyColors.grey,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildIdStatus(),
          _buildName(name),
          _buildAmount(),
          _buildLastInvoice(),
          _buildNumInvoicesDate(),
        ],
      ),
    );
  }

  Widget _buildIdStatus() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "№ $id",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Text("Paid"),
      ],
    );
  }

  Widget _buildPairInfo(String key, String value) {
    return RichText(
      text: TextSpan(
        text: key,
        style: const TextStyle(fontWeight: FontWeight.bold),
        children: <TextSpan>[
          TextSpan(
            text: value,
            style: const TextStyle(color: MyColors.lightGrey),
          ),
        ],
      ),
    );
  }

  Widget _buildName(String name) {
    return _buildPairInfo("Fish: ", name);
  }

  Widget _buildAmount() {
    return _buildPairInfo(
      "Amount: ",
      intl.NumberFormat.decimalPattern().format(amount),
    );
  }

  Widget _buildLastInvoice() {
    return _buildPairInfo("Last invoice: ", lastInvoice.toString());
  }

  Widget _buildNumInvoicesDate() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildPairInfo("Number of invoices: ", numOfInvoices.toString()),
        Text(
          intl.DateFormat("dd.MM.yyyy").format(date),
          style: const TextStyle(
            color: MyColors.lightGrey,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
