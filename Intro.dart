void main() {
  var name = myName();
  
  print('my name is $name'); // or ${name}
  print('Name count is ${name.length}');
}

String myName() {
  return 'William';
} 
