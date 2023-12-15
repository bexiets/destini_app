import 'package:destini_app/story_brain.dart';
import 'package:flutter/material.dart';

StoryBrain _storyBrain = StoryBrain();

void main() {
  runApp(const DesintyPage());
}

class DesintyPage extends StatelessWidget {
  const DesintyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: const StoryPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class StoryPage extends StatefulWidget {
  const StoryPage({super.key});

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          )
        ),
        padding: EdgeInsets.symmetric(vertical: 40, horizontal: 15),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              
              Expanded(
                child: Center(
                  child: Text(
                    '${_storyBrain.getStory()}',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                    
                  ),
                ),
              ),
              Expanded(
                flex: 0,
                child: Visibility(
                  
                  child: FloatingActionButton(
                    onPressed: (){
                      setState(() {
                        _storyBrain.nextStory(2);
                      });
                    }, 
                    backgroundColor: Colors.red,
                    
                    child: Text(
                      '${_storyBrain.getChoice1()}',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                )
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                flex: 0,
                child: Visibility(
                  visible: _storyBrain.buttonShouldBeVisible(),
                  child: FloatingActionButton(
                    onPressed: (){
                      
                      setState(() {
                        _storyBrain.nextStory(1);
                      });
                    }, 
                    backgroundColor: Colors.blue,
                    child: Text(
                      '${_storyBrain.getChoice2()}',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
