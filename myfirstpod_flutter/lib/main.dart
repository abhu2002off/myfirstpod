import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:myfirstpod_client/myfirstpod_client.dart';
import 'package:flutter/material.dart';
import 'package:myfirstpod_flutter/app_color.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

// Sets up a singleton client object that can be used to talk to the server from
// anywhere in our app. The client is generated from your server code.
// The client is set up to connect to a Serverpod running on a local server on
// the default port. You will need to modify this to connect to staging or
// production servers.
var client = Client('http://localhost:8080/')
  ..connectivityMonitor = FlutterConnectivityMonitor();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Serverpod Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Serverpod Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  List<Article> _articles = [];
  @override
  void initState() {
    super.initState();
    fetchArticles();
  }

  // These fields hold the last result or error message that we've received from
  // the server or null if no result exists yet.
  String? _resultMessage;
  String? _errorMessage;

  final _textEditingController = TextEditingController();

  // Calls the `hello` method of the `example` endpoint. Will set either the
  // `_resultMessage` or `_errorMessage` field, depending on if the call
  // is successful.

  void addArticle(Article article) async {
    try {
      var result = await client.article.addArticle(article);
      debugPrint('Add article status : $result');
      print(result);
      Navigator.of(context).pop();
      fetchArticles();
      if (result) {
        setState(() {
          _resultMessage = 'Article Inserted:)';
        });
      }
    } on Exception catch (e) {
      debugPrint(e.toString());
      setState() {
        _errorMessage = "$e";
      }
    }
  }

  deleteArticle(int id) async {
    try {
      var result = await client.article.deleteArticle(id);
      debugPrint('Delete article status : $result');

      fetchArticles();
    } on Exception catch (e) {
      debugPrint('$e');
    }
  }

  fetchArticles() async {
    try {
      _articles = await client.article.getArticle();
      setState(() {});
    } on Exception catch (e) {
      debugPrint('$e');
    }
  }

  updateArticle(Article article) async {
    try {
      var result = await client.article.updateArticle(article);
      debugPrint('Update article status : $result');

      Navigator.of(context).pop();
      fetchArticles();
    } on Exception catch (e) {
      debugPrint('$e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: _articles.length,
                  itemBuilder: ((context, index) {
                    return Slidable(
                      endActionPane: ActionPane(
                        motion: const ScrollMotion(),
                        children: [
                          SlidableAction(
                            onPressed: (context) {
                              deleteArticle(_articles[index].id!);
                            },
                            backgroundColor: AppColors.deleteColor,
                            foregroundColor: Colors.white,
                            icon: Icons.delete,
                            label: 'Delete',
                          ),
                          SlidableAction(
                            onPressed: (context) {
                              _showArticleDialog(article: _articles[index]);
                            },
                            backgroundColor: AppColors.editColor,
                            foregroundColor: Colors.white,
                            icon: Icons.edit,
                            label: 'Edit',
                          ),
                        ],
                      ),
                      child: ListTile(
                        title: Text(_articles[index].title),
                        subtitle: Text(_articles[index].content),
                      ),
                    );
                  })))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showArticleDialog,
        child: const Icon(Icons.add_comment),
      ),
    );
  }

  _showArticleDialog({Article? article}) {
    var titleController = TextEditingController();
    var contentController = TextEditingController();

    if (article != null) {
      titleController.text = article.title;
      contentController.text = article.content;
    }
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: titleController,
                  decoration: const InputDecoration(
                    hintText: 'Enter title',
                  ),
                ),
                TextField(
                  controller: contentController,
                  decoration: const InputDecoration(
                    hintText: 'Enter description',
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    if (article != null) {
                      article.title = titleController.text;
                      article.content = contentController.text;
                      updateArticle(article);
                    } else {
                      var newArticle = Article(
                        title: titleController.text,
                        content: contentController.text,
                        publishedOn: DateTime.now(),
                        isPrime: true,
                      );
                      addArticle(newArticle);
                    }
                  },
                  child: const Text('Add Article'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}


// _ResultDisplays shows the result of the call. Either the returned result from
// the `example.hello` endpoint method or an error message.
