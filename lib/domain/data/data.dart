import 'package:university_chat_app/domain/models/post.dart';

class FakeUser {
  const FakeUser({required this.name, required this.imageUrl});

  final String name;
  final String imageUrl;
}

const FakeUser currentUser = FakeUser(
  name: 'Trafalgar Law',
  imageUrl: 'https://mocah.org/thumbs/198722-trafalgar-law-2291x1654.jpg',
);

const List<FakeUser> onlineUsers = [
  FakeUser(
    name: 'Roronoa Zoro',
    imageUrl:
        'https://mocah.org/thumbs/990071-One-Piece-Roronoa-Zoro-green-eyes-green-hair-scars.png',
  ),
  FakeUser(
    name: 'Luffy',
    imageUrl:
        'https://static.wikia.nocookie.net/onepiece/images/6/6d/Monkey_D._Luffy_Anime_Post_Timeskip_Infobox.png/revision/latest/scale-to-width-down/239?cb=20200429191518',
  ),
  FakeUser(
    name: 'Brook',
    imageUrl: 'https://mocah.org/thumbs/199992-brook-one-piece-1920x1200.jpg',
  ),
  FakeUser(
    name: 'Sanji',
    imageUrl:
        'https://mocah.org/thumbnail/435099-anime-boys-anime-men-anime-girls-Sanji-Vinsmoke.jpg',
  ),
  FakeUser(
    name: 'Nami',
    imageUrl: 'https://mocah.org/thumbs/195289-nami-one-piece-2400x1800.png',
  ),
  FakeUser(
    name: 'Katakuri',
    imageUrl: 'https://mocah.org/thumbs/552451-Charlotte-Katakuri.png',
  ),
  FakeUser(
    name: 'Big Mom',
    imageUrl:
        'https://images.unsplash.com/photo-1519631128182-433895475ffe?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80',
  ),
  FakeUser(
    name: 'Kaido',
    imageUrl: 'https://mocah.org/thumbs/241261-kaido-one-piece-1920x1080.jpg',
  ),
  FakeUser(
    name: 'Eusless Kid',
    imageUrl:
        'https://images.unsplash.com/photo-1528892952291-009c663ce843?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=592&q=80',
  ),
  FakeUser(
    name: 'Gol D. Roger',
    imageUrl:
        'https://mocah.org/thumbnail/24811-Gol-D.-RogerGol-D.-Roger-HD-Wallpaper.jpg',
  ),
  FakeUser(
    name: 'Ace',
    imageUrl:
        'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
  ),
  FakeUser(
    name: 'Franky',
    imageUrl:
        'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
  ),
  FakeUser(
    name: 'Robin',
    imageUrl:
        'https://images.unsplash.com/photo-1492562080023-ab3db95bfbce?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1331&q=80',
  ),
  FakeUser(
    name: 'Shanks',
    imageUrl:
        'https://images.unsplash.com/photo-1534528741775-53994a69daeb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=80',
  ),
  FakeUser(
    name: 'Usopp',
    imageUrl:
        'https://images.unsplash.com/photo-1521119989659-a83eee488004?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=664&q=80',
  ),
  FakeUser(
    name: 'Sabo',
    imageUrl:
        'https://images.unsplash.com/photo-1544005313-94ddf0286df2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
  ),
  FakeUser(
    name: 'Donquixote Doflamingo',
    imageUrl:
        'https://images.unsplash.com/photo-1519631128182-433895475ffe?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80',
  ),
  FakeUser(
    name: 'Akainu',
    imageUrl:
        'https://images.unsplash.com/photo-1515077678510-ce3bdf418862?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjF9&auto=format&fit=crop&w=675&q=80',
  ),
  FakeUser(
    name: 'Aokiji',
    imageUrl:
        'https://images.unsplash.com/photo-1528892952291-009c663ce843?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=592&q=80',
  ),
  FakeUser(
    name: 'Dracule Mihawk',
    imageUrl:
        'https://images.unsplash.com/photo-1517841905240-472988babdf9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
  ),
];

List<Post> posts = [
  const Post(
    user: currentUser,
    caption: 'Bahala kayo sa buhay niyo',
    timeAgo: '8m',
    // imageUrl: 'https://images.unsplash.com/photo-1525253086316-d0c936c814f8',
    likes: 99,
    comments: 120,
    shares: 96,
  ),
  Post(
    user: onlineUsers[5],
    caption:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
    timeAgo: '1hr',
    imageUrl: null,
    likes: 421,
    comments: 32,
    shares: 18,
  ),
  Post(
    user: onlineUsers[4],
    caption: 'Good job BSCS!',
    timeAgo: '3hr',
    imageUrl:
        'https://images.unsplash.com/photo-1519389950473-47ba0277781c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',
    likes: 32,
    comments: 11,
    shares: 27,
  ),
  Post(
    user: onlineUsers[3],
    caption: 'Game! 🏔',
    timeAgo: '15hr',
    imageUrl:
        'https://images.unsplash.com/photo-1627856013091-fed6e4e30025?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',
    likes: 1000,
    comments: 522,
    shares: 42,
  ),
  Post(
    user: onlineUsers[0],
    caption:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
    timeAgo: '1d',
    imageUrl: null,
    likes: 257,
    comments: 120,
    shares: 9,
  ),
  Post(
    user: onlineUsers[9],
    caption: 'G',
    timeAgo: '1d',
    imageUrl:
        'https://images.unsplash.com/photo-1528819622765-d6bcf132f793?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
    likes: 300,
    shares: 129,
    comments: 30,
  )
];
