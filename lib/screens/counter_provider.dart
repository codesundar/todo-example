import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/providers/counter.dart';
import 'package:todoapp/screens/counter_2.dart';

class CounterProviderExample extends StatelessWidget {
  const CounterProviderExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer<CounterProvider>(
          builder: (context, counter, child) {
            return Text("${counter.count}");
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const CounterProvider2Example()),
              );
            },
            icon: Icon(Icons.forward),
          )
        ],
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
