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
        var card = new Card(suit, rank);
        cards.add(card);
      }
    }
  }
  
  toString() {
    return 'This is a deck!';
  }
}

class Card {
  String suit;
  String rank;
  
  Card(this.suit, this.rank);
}

void main() {
  var deck = new Deck();
  print(deck); 
}