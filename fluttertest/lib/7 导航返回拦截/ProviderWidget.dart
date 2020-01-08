import 'dart:collection';

import 'package:flutter/material.dart';

class InheritedProvider<T> extends InheritedWidget {
  InheritedProvider({@required this.data, Widget child}) : super(child: child);

  final T data;

  @override
  bool updateShouldNotify(InheritedProvider<T> old) {
    return true;
  }
}

class ChangeNotifierProvider<T extends ChangeNotifier> extends StatefulWidget {
  ChangeNotifierProvider({Key key, this.data, this.child});
  final Widget child;
  final T data;
  static Type _typeOf<T>() => T;
  static T of<T>(BuildContext context, {bool listen = true}) {
    final type = _typeOf<InheritedProvider<T>>();
    print(" aaaaaaaaaa $type");
    final provider = listen
        ? context.inheritFromWidgetOfExactType(type) as InheritedProvider<T>
        : context.ancestorInheritedElementForWidgetOfExactType(type)?.widget
            as InheritedProvider<T>;

    print(" bbbbbbbbb $provider");
    return provider.data;
  }

  @override
  _ChangeNotifierProviderState createState() =>
      _ChangeNotifierProviderState<T>();
}

class _ChangeNotifierProviderState<T extends ChangeNotifier>
    extends State<ChangeNotifierProvider> {
  void update() {
    setState(() => {});
  }

  @override
  void didUpdateWidget(ChangeNotifierProvider<T> oldWidget) {
    if (widget.data != oldWidget.data) {
      oldWidget.data.removeListener(update);
      widget.data.addListener(update);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    widget.data.removeListener(update);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InheritedProvider<T>(
      data: widget.data,
      child: widget.child,
    );
  }
}

class Item {
  Item(this.price, this.count);
  double price;
  int count;
}

class CarModel extends ChangeNotifier {
  final List<Item> _items = [];
  UnmodifiableListView<Item> get items => UnmodifiableListView(_items);
  double get totalPrice =>
      _items.fold(0, (value, item) => value + item.count * item.price);
  void add(Item item) {
    _items.add(item);
    notifyListeners();
  }
}

class Consumer<T> extends StatelessWidget {
  Consumer({
    Key key,
    @required this.builder,
    this.child,
  })  : assert(builder != null),
        super(key: key);
  final Widget child;
  final Widget Function(BuildContext context, T value) builder;
  @override
  Widget build(BuildContext context) {
    return builder(
      context,
      ChangeNotifierProvider.of<T>(context),
    );
  }
}

class ProviderRoute extends StatefulWidget {
  @override
  _ProviderRouteState createState() => _ProviderRouteState();
}

class _ProviderRouteState extends State<ProviderRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("跨组件状态管理"),
      ),
      body: Center(
        child: ChangeNotifierProvider<CarModel>(
          data: CarModel(),
          child: Builder(builder: (context) {
            return Column(
              children: <Widget>[
                Consumer<CarModel>(
                  builder: (BuildContext context, cart) =>
                      Text("总价：${cart.totalPrice}"),
                ),
                Builder(builder: (context) {
                  print("RaisedButton build");
                  return RaisedButton(
                    child: Text("添加商品"),
                    onPressed: () {
                      ChangeNotifierProvider.of<CarModel>(context,
                              listen: false)
                          .add(Item(20.0, 2));
                    },
                  );
                }),
              ],
            );
          }),
        ),
      ),
    );
  }
}
