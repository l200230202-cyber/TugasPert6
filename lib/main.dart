import 'package:flutter/material.dart';
import 'reading_book_file.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Book Library',
      theme: ThemeData(
        colorSchemeSeed: Colors.blue,
        useMaterial3: true,
      ),
      home: const BookListScreen(),
    );
  }
}

class BookListScreen extends StatelessWidget {
  const BookListScreen({super.key});

  final List<Map<String, String>> books = const [
    {
      'title': 'Algorithms to Live By',
      'author': 'Brian Christian',
      'description': 'In a dazzlingly interdisciplinary work...',
      'file': 'Algorithms_to_Live_By.pdf'
    },
    {
      'title': 'Beginning Programming For Dummies',
      'author': 'Wallace Wang',
      'description': 'Beginning Programming All In One Desk Reference...',
      'file': 'Beginning_Programming_For_Dummies.pdf'
    },
    {
      'title': 'Streamlit for Data Science',
      'author': 'Tyler Richards',
      'description': 'If you work with data in Python...',
      'file': 'Streamlit_for_Data_Science.pdf'
    },
    {
      'title': 'Clean Code Basics',
      'author': 'Robert C. Martin',
      'description': 'Introduction to clean code...',
      'file': 'Clean_Code_Basics.pdf'
    },
    {
      'title': 'Cyber Security Fundamentals',
      'author': 'William Stallings',
      'description': 'Security concepts...',
      'file': 'Cyber_Security_Fundamentals.pdf'
    },
    {
      'title': 'Data Structures Essentials',
      'author': 'Mark Allen Weiss',
      'description': 'Core data structures...',
      'file': 'Data_Structures_Essentials.pdf'
    },
    {
      'title': 'Database System Concepts',
      'author': 'Abraham Silberschatz',
      'description': 'Database theory...',
      'file': 'Database_System_Concepts.pdf'
    },
    {
      'title': 'Introduction to Artificial Intelligence',
      'author': 'Stuart Russell',
      'description': 'AI basics...',
      'file': 'Introduction_to_Artificial_Intelligence.pdf'
    },
    {
      'title': 'Mobile App Development Guide',
      'author': 'John Smith',
      'description': 'Mobile development concepts...',
      'file': 'Mobile_App_Development_Guide.pdf'
    },
    {
      'title': 'Software Engineering Principles',
      'author': 'Ian Sommerville',
      'description': 'Software engineering fundamentals...',
      'file': 'Software_Engineering_Principles.pdf'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Book Library',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.builder(
          itemCount: books.length,
          itemBuilder: (context, index) {
            final book = books[index];

            return Card(
              elevation: 3,
              margin: const EdgeInsets.symmetric(vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(15),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BookDetailScreen(
                        title: book['title']!,
                        author: book['author']!,
                        description: book['description']!,
                        fileName: book['file']!,
                      ),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Container(
                        width: 60,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.blue[300],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(
                          Icons.menu_book_rounded,
                          size: 32,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              book['title']!,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              book['author']!,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[700],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Icon(Icons.arrow_forward_ios_rounded, size: 20)
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class BookDetailScreen extends StatelessWidget {
  final String title;
  final String author;
  final String description;
  final String fileName;

  const BookDetailScreen({
    super.key,
    required this.title,
    required this.author,
    required this.description,
    required this.fileName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // HEADER
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue, Colors.blue.shade300],
                ),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
              child: Column(
                children: [
                  const Icon(Icons.menu_book, size: 60, color: Colors.white),
                  const SizedBox(height: 10),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // AUTHOR CARD
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ListTile(
                  leading: const Icon(Icons.person, color: Colors.blue),
                  title: const Text(
                    "Author",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(author),
                ),
              ),
            ),

            const SizedBox(height: 15),

            // DESCRIPTION CARD
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          Icon(Icons.description, color: Colors.blue),
                          SizedBox(width: 8),
                          Text(
                            "Description",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        description,
                        style: const TextStyle(height: 1.5),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            // BUTTON
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                padding:
                const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ReadingBookFile(fileName: fileName),
                  ),
                );
              },
              icon: const Icon(Icons.picture_as_pdf),
              label: const Text(
                "Read the Book",
                style: TextStyle(fontSize: 16),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}