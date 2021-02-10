import 'package:flutter_practice_03/model/book.dart';

final books = [
    Book(
      title: 'Less Than Zero',
      author: 'Bret Easton Ellis',
      month: 'This month',
      coverArt: 'https://i0.wp.com/chrisgillbooks.com/wp-content/uploads/2018/03/less-than-zaro.jpg?fit=880%2C1333&quality=95',
      rating: 5,
      category: ['Transgressive', 'Fiction'],
      books: relatedBooks.where((b) => b.author == 'Bret Easton Ellis').toList(),
    ),
    Book(
      title: "Trainspotting",
      author: 'Irvine Welsh',
      month: 'October',
      coverArt: 'https://cdn2.penguin.com.au/covers/original/9780099465898.jpg',
      rating: 4,
      category: ['Psyco', 'Fiction'],
      books: [],
    ),
    Book(
      title: "A Clockwork Orange",
      author: 'Anthony Burgess',
      month: 'September',
      coverArt: 'https://thebobsphere.files.wordpress.com/2018/09/cover-clockwork.png',
      rating: 2,
      category: ['Triller', 'Fiction'],
      books: [],
    ),
    Book(
      title: "1984",
      author: 'George Orwell',
      month: 'August',
      coverArt: 'https://images-na.ssl-images-amazon.com/images/I/91SZSW8qSsL.jpg',
      rating: 4,
      category: ['History', 'Fiction', 'Triller'],
      books: [],
    ),
    Book(
      title: "Ready Player One",
      author: 'Ernest Cline',
      month: 'July',
      coverArt: 'https://i.insider.com/5c0ac613f87e1e202b509fc7?width=700&format=jpeg&auto=webp',
      rating: 1,
      category: ['Sci-Fi', 'Fiction', 'Action'],
      books: [],
    ),
    Book(
      title: "Crazy Rich Asians",
      author: 'Kevin Kwan',
      month: 'June',
      coverArt: 'https://i.insider.com/5c0ac8c899bcd5200807d0db?width=700&format=jpeg&auto=webp',
      rating: 0,
      category: ['Story', 'Fiction'],
      books: [],
    ),
    Book(
      title: "The Woman in the Window",
      author: 'A.J. Finn',
      month: 'May',
      coverArt: 'https://i.insider.com/5c0ac6be293b7121b343b303?width=700&format=jpeg&auto=webp',
      rating: 3,
      category: ['Triller', 'Action', 'Novel'],
      books: [],
    ),
    Book(
      title: "The Outsider",
      author: 'Stephen King',
      month: 'April',
      coverArt: 'https://i.insider.com/5c0ac7bfd5000c21024506a0?width=700&format=jpeg&auto=webp',
      rating: 4,
      category: ['Horror', 'Fiction', 'Triller'],
      books: [],
    ),
  ];

  final relatedBooks = [
    Book(
      title: 'Imperial Bedrooms',
      author: 'Bret Easton Ellis',
      month: 'This month',
      coverArt: 'https://ameliaflorencesimmons.files.wordpress.com/2012/01/imperial_bedrooms2.jpg',
      rating: 5,
      category: ['Transgressive', 'Fiction'],
      books: [
        
      ],
    ),
    Book(
      title: 'Glamorama',
      author: 'Bret Easton Ellis',
      month: 'This month',
      coverArt: 'https://images.thenile.io/r1000/9780330536318.jpg',
      rating: 5,
      category: ['Satire', 'Triller', 'Psyco'],
      books: [
        
      ],
    ),
    Book(
      title: 'Lunar Park',
      author: 'Bret Easton Ellis',
      month: 'This month',
      coverArt: 'https://images.thenile.io/r1000/9780330536332.jpg',
      rating: 4,
      category: ['Horror', 'Fiction', 'Psyco'],
      books: [
        
      ],
    ),
];