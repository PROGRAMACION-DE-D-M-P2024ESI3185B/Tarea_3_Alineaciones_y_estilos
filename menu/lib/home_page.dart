import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isBurgerSelected = false;
  bool _isHotDogSelected = false;
  bool _isFriesSelected = false;
  bool _isSodaSelected = false;
  bool _isIceCreamSelected = false;
  String mensajeDefault = "Seleccione un platillo";
  String _ChosenFood = "Seleccione un platillo";

  void clickComida(String comida, bool validar) {
    switch (comida) {
      case ('ham'):
        if (validar) {
          _isBurgerSelected = false;
        } else {
          _isBurgerSelected = true;
          _isHotDogSelected = false;
          _isFriesSelected = false;
          _isSodaSelected = false;
          _isIceCreamSelected = false;
        }
        break;
      case ('hot'):
        if (validar) {
          _isHotDogSelected = false;
        } else {
          _isBurgerSelected = false;
          _isHotDogSelected = true;
          _isFriesSelected = false;
          _isSodaSelected = false;
          _isIceCreamSelected = false;
        }
        break;
      case ('fries'):
        if (validar) {
          _isFriesSelected = false;
        } else {
          _isBurgerSelected = false;
          _isHotDogSelected = false;
          _isFriesSelected = true;
          _isSodaSelected = false;
          _isIceCreamSelected = false;
        }
        break;
      case ('soda'):
        if (validar) {
          _isSodaSelected = false;
        } else {
          _isBurgerSelected = false;
          _isHotDogSelected = false;
          _isFriesSelected = false;
          _isSodaSelected = true;
          _isIceCreamSelected = false;
        }
        break;
      case ('ice'):
        if (validar) {
          _isIceCreamSelected = false;
        } else {
          _isBurgerSelected = false;
          _isHotDogSelected = false;
          _isFriesSelected = false;
          _isSodaSelected = false;
          _isIceCreamSelected = true;
        }
        break;
    }
    setState(() {});
  }

  void textDialog(String comida) {
    switch (comida) {
      case ("ham"):
        _ChosenFood == "Burger"
            ? _ChosenFood = mensajeDefault
            : _ChosenFood = "Burger";
        break;
      case ("ice"):
        _ChosenFood == "Ice Cream"
            ? _ChosenFood = mensajeDefault
            : _ChosenFood = "Ice Cream";
        break;
      case ("hot"):
        _ChosenFood == "Hot Dog"
            ? _ChosenFood = mensajeDefault
            : _ChosenFood = "Hot Dog";
        break;
      case ("soda"):
        _ChosenFood == "Soda"
            ? _ChosenFood = mensajeDefault
            : _ChosenFood = "Soda";
        break;
      case ("fries"):
        _ChosenFood == "Fries"
            ? _ChosenFood = mensajeDefault
            : _ChosenFood = "Fries";
        break;
      default:
        _ChosenFood = mensajeDefault;
        break;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Menu Demo',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Explore the restaurant delicious menu items below!",
                  style: TextStyle(fontSize: 20),
                ),
                ListTile(
                  title: Text('Burger'),
                  tileColor: _isBurgerSelected ? Colors.amber : Colors.white,
                  leading: Image(
                    image: AssetImage("assets\\hamburger.png"),
                    height: 30,
                  ),
                  onTap: () {
                    clickComida('ham', _isBurgerSelected);
                    textDialog("ham");
                    setState(() {});
                  },
                ),
                ListTile(
                  title: Text('Hot Dog'),
                  tileColor: _isHotDogSelected ? Colors.amber : Colors.white,
                  leading: Image(
                    image: AssetImage(
                      "assets\\hot.png",
                    ),
                    height: 30,
                  ),
                  onTap: () {
                    clickComida('hot', _isHotDogSelected);
                    textDialog("hot");
                    setState(() {});
                  },
                ),
                ListTile(
                  title: Text('Fries'),
                  tileColor: _isFriesSelected ? Colors.amber : Colors.white,
                  leading: Image(
                    image: AssetImage(
                      "assets\\french.png",
                    ),
                    height: 30,
                  ),
                  onTap: () {
                    clickComida('fries', _isFriesSelected);
                    textDialog("fries");
                    setState(() {});
                  },
                ),
                ListTile(
                  title: Text('Soda'),
                  tileColor: _isSodaSelected ? Colors.amber : Colors.white,
                  leading: Image(
                    image: AssetImage(
                      "assets\\soft.png",
                    ),
                    height: 30,
                  ),
                  onTap: () {
                    clickComida('soda', _isSodaSelected);
                    textDialog("soda");
                    setState(() {});
                  },
                ),
                ListTile(
                  title: Text('Ice Cream'),
                  tileColor: _isIceCreamSelected ? Colors.amber : Colors.white,
                  leading: Image(
                    image: AssetImage(
                      "assets\\ice.png",
                    ),
                    height: 30,
                  ),
                  onTap: () {
                    clickComida("ice", _isIceCreamSelected);
                    textDialog("ice");
                    setState(() {});
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
              child: ListView(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment
                        .center, // Centra los botones en la fila
                    children: [
                      ElevatedButton(
                          onPressed: () => showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  title: Text('Pickup'),
                                  content: Text(_ChosenFood),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, 'OK'),
                                      child: Text('OK'),
                                    ),
                                  ],
                                ),
                              ),
                          child: Text('Pickup')),
                      SizedBox(
                        width: 50,
                      ),
                      ElevatedButton(
                        onPressed: () => showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: Text('Delivery'),
                            content: Text(_ChosenFood),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'OK'),
                                child: Text('OK'),
                              ),
                            ],
                          ),
                        ),
                        child: Text('Delivery'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}
