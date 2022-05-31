import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/providers/counter.dart';

class CounterProvider2Example extends StatelessWidget {
  const CounterProvider2Example({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer<CounterProvider>(
          builder: (context, counter, child) {
            return Text("${counter.count}");
          },
        ),
      ),
      body: Column(
        children: [
          Consumer<CounterProvider>(
            builder: (context, counter, child) {
              return Text("${counter.count}");
            },
          ),
          Text(Provider.of<CounterProvider>(
            context,
            listen: false,
          ).count.toString()),
          TextButton(
            onPressed: () {
              Provider.of<CounterProvider>(
                context,
                listen: false,
              ).increaseCount();
            },
            child: Text("Add"),
          )
        ],
      ),
    );
  }
}
