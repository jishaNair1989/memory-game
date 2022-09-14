import 'package:flutter/material.dart';

Widget scoreBoard(String title, String info) {
  return Container(
    margin: const EdgeInsets.all(26),
    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 26),
    decoration: const BoxDecoration(color: Colors.white),
    child: Column(
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 6.0,
        ),
        Text(
          info,
          style: const TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
        )
      ],
    ),
  );
}
