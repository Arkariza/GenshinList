import 'package:flutter/material.dart';
import 'package:genshinlist_r/service/CharModel.dart';
import 'package:genshinlist_r/service/Service.dart';

class DetailScreen extends StatelessWidget {
  final String characterId;

  const DetailScreen({super.key, required this.characterId, required Character character});

  @override
  Widget build(BuildContext context) {
    final ApiService apiService = ApiService();

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: Text('Character Details'),
        backgroundColor: Colors.transparent,
      ),
      body: FutureBuilder<Character>(
        future: apiService.fetchCharacterDetail(characterId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Failed to load character details'));
          } else if (snapshot.hasData) {
            final character = snapshot.data!;
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            'assets/char/${characterId}.jpeg',
                            width: 200,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: Text(
                        character.name,
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Center(
                      child: Text(
                        character.title,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey[700],
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Description',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              character.description,
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey[800],
                                height: 1.5,
                              ),
                            ),
                            SizedBox(height: 20),
                            Row(
                              children: [
                                Icon(Icons.whatshot,),
                                SizedBox(width: 10),
                                Text(
                                  'Element: ${character.vision}',
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              children: [
                                Icon(
                                  character.gender == 'Male' 
                                      ? Icons.male_outlined 
                                      : Icons.female_outlined,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  'Gender: ${character.gender}',
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: 10),
                            Row(
                              children: [
                                Icon(Icons.security),
                                SizedBox(width: 10),
                                Text(
                                  'Weapon: ${character.weapon}',
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Icon(Icons.location_city_rounded),
                                SizedBox(width: 10),
                                Text(
                                  'Region: ${character.nation}',
                                  style: TextStyle( 
                                    fontSize: 18,
                                  ),
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
            );
          } else {
            return Center(child: Text('No details found'));
          }
        },
      ),
    );
  }
}
