import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 290,
                  child: Stack(
                    children: [
                      Container(
                        height: 250,
                        color: Colors.yellow.shade600,
                      ),
                      Positioned(
                        left: -50,
                        top: -30,
                        child: ClipOval(
                          child: Container(
                            height: 300,
                            width: 300,
                            color: Colors.yellow.shade500.withOpacity(0.2),
                          ),
                        ),
                      ),
                      const Positioned(
                        left: 10,
                        bottom: 8,
                        child: SizedBox(
                          height: 55,
                          width: 350,
                          child: Card(
                            elevation: 6,
                            color: Colors.white,
                            child: TextField(
                              //controller: _inpute,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.search,
                                    size: 30,
                                    color: Colors.yellow,
                                  ),
                                  hintText: 'Search'),

                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.done,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: -60,
                        top: -120,
                        child: ClipOval(
                          child: Container(
                            height: 300,
                            width: 300,
                            color: Colors.yellow.shade500.withOpacity(0.3),
                          ),
                        ),
                      ),
                      Positioned(
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: CircleAvatar(
                            radius: 29,
                            child: ClipOval(
                                child: Image.asset(
                              'assets/zoey.jpg',
                              fit: BoxFit.cover,
                              width: 50,
                              height: 50,
                            )),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 20),
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.menu,
                              size: 35,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const Positioned(
                          top: 120,
                          left: 20,
                          child: Text(
                            'Hello , Zoey',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          )),
                      const Positioned(
                          top: 170,
                          left: 20,
                          child: Text(
                            'What do you want to buy?',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ))
                    ],
                  ),
                ),
                Card(
                  color: Colors.white,
                  elevation: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                            Icon(
                              Icons.chair_outlined,
                              size: 50,
                            ),
                            Text('Sofas')
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                            Icon(
                              Icons.warehouse_outlined,
                              size: 50,
                            ),
                            Text('Wardrobe')
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                            Icon(
                              Icons.desk,
                              size: 50,
                            ),
                            Text('Desk')
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                            Icon(
                              Icons.table_restaurant_outlined,
                              size: 50,
                            ),
                            Text('Dresser')
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 160,
                  child: Card(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    elevation: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(
                          width: 150,
                          child: Image(
                            image: AssetImage(
                              'assets/pair1.jpg',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  'FinnNavian',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  width: 40,
                                ),
                                Card(
                                  shape: CircleBorder(),
                                  child: Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 200,
                              child: Padding(
                                padding: EdgeInsets.only(right: 30),
                                child: Text(
                                  'Scandinavian small sized double sofa imported full leather / Dale Italia oil wax leather black',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(left: 40),
                                  width: 50,
                                  height: 35,
                                  color: Colors.yellow.shade800,
                                  child: const Center(
                                      child: Text(
                                    "£12",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )),
                                ),
                                Container(
                                  width: 110,
                                  height: 35,
                                  color: Colors.yellow,
                                  child: const Center(
                                      child: Text(
                                    "ADD TO CART",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  )),
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 160,
                  child: Card(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    elevation: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(
                          width: 150,
                          child: Image(
                            image: AssetImage(
                              'assets/pair2.jpg',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  'FinnNavian',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  width: 40,
                                ),
                                Card(
                                  color: Colors.white60,
                                  shape: CircleBorder(),
                                  child: Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Icon(
                                      Icons.favorite_border,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 200,
                              child: Padding(
                                padding: EdgeInsets.only(right: 30),
                                child: Text(
                                  'Scandinavian small sized double sofa imported full leather / Dale Italia oil wax leather black',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(left: 40),
                                  width: 50,
                                  height: 35,
                                  color: Colors.yellow.shade800,
                                  child: const Center(
                                      child: Text(
                                    "£12",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )),
                                ),
                                Container(
                                  width: 110,
                                  height: 35,
                                  color: Colors.yellow,
                                  child: const Center(
                                    child: Text(
                                      "ADD TO CART",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 160,
                  child: Card(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    elevation: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(
                          width: 150,
                          child: Image(
                            image: AssetImage(
                              'assets/pair2.jpg',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  'FinnNavian',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  width: 40,
                                ),
                                Card(
                                  color: Colors.white60,
                                  shape: CircleBorder(),
                                  child: Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Icon(
                                      Icons.favorite_border,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 200,
                              child: Padding(
                                padding: EdgeInsets.only(right: 30),
                                child: Text(
                                  'Scandinavian small sized double sofa imported full leather / Dale Italia oil wax leather black',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(left: 40),
                                  width: 50,
                                  height: 35,
                                  color: Colors.yellow.shade800,
                                  child: const Center(
                                      child: Text(
                                    "£12",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )),
                                ),
                                Container(
                                  width: 110,
                                  height: 35,
                                  color: Colors.yellow,
                                  child: const Center(
                                    child: Text(
                                      "ADD TO CART",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
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
