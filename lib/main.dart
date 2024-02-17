import 'package:flutter/material.dart';
import 'storybrain.dart';

StoryBrain storyBrain = StoryBrain();

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/background.png'), fit: BoxFit.fill),
          ),
          child: const StoryPage(),
        ),
      ),
    ),
  );
}

class StoryPage extends StatefulWidget {
  const StoryPage({super.key});

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    storyBrain.shouldBeVisible();
    return SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      storyBrain.getStory(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        storyBrain.nextStory(1);
                        storyBrain.nextPage();
                      });
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.red[700]),
                      elevation: const MaterialStatePropertyAll(100.0),
                      shape: const MaterialStatePropertyAll(
                        ContinuousRectangleBorder(),
                      ),
                    ),
                    child: Text(
                      storyBrain.getChoice1(),
                      style: const TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AnimatedOpacity(
                    opacity: storyBrain.isVisible() ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 500),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          storyBrain.nextStory(2);
                          storyBrain.nextPage();
                        });
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.green[700]),
                        elevation: const MaterialStatePropertyAll(100.0),
                        shape: const MaterialStatePropertyAll(
                          ContinuousRectangleBorder(),
                        ),
                      ),
                      child: Text(
                        storyBrain.getChoice2(),
                        style:
                            const TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
