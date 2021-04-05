// void main() {
//   var name = myName();

//   print('my name is $name'); // or ${name}
//   print('Name count is ${name.length}');
// }

// String myName() {
//   return 'William';
// }

// class Person {
//   String firstName;
//   String lastName;

//   // Constructor Functions, automatically instance and set property
//   Person(this.firstName, this.lastName);

//   showName() {
//     print(firstName + ' ' + lastName);
//   }
// }

// void main() {
//   // Instance
//   var person = new Person('William', 'Gho');
//   person.showName();
// }

class Deck {
  // Default value
  List<Card> cards = [];

  Deck() {
    var ranks = ['Ace', 'Two', 'Three', 'Four', 'Five'];
    var suits = ['Diamonds', 'Hearts', 'Clubs', 'Spades'];

    for (var suit in suits) {
      for (var rank in ranks) {
        var card = new Card(suit: suit, rank: rank);
        cards.add(card);
      }
    }
  }

  String toString() {
    return cards.toString();
  }

  shuffle() {
    cards.shuffle();
  }

  cardWithSuit(String suit) {
    // Implicit return
    return cards.where((card) => card.suit == suit);
  }

  List<Card> deal(int handSize) {
    // sublist: Pull out and return some
    var hand = cards.sublist(0, handSize);
    cards = cards.sublist(handSize);

    return hand;
  }

  removeCard(String suit, String rank) {
    return cards
        .removeWhere((card) => (card.suit == suit) && (card.rank == rank));
  }
}

class Card {
  String suit;
  String rank;

  Card({this.suit, this.rank});

  String toString() {
    return '$rank of $suit';
  }
}

void main() {
  var deck = new Deck();
//   deck.shuffle();
//   print(deck.cardWithSuit('Diamonds'));

//   print(deck);
//   print(deck.deal(5));
//   print(deck);
  deck.removeCard('Diamonds', 'Ace');
  print(deck);
}
