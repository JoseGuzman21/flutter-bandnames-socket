class Band {
  String id;
  String name;
  int votes;

  // Constructor
  Band({this.id, this.name, this.votes});

  // el backend response un Map
  // factory constuctor = es un constuctor que recibe un cierto tipo argumento
  // y devuelve una nueva instancia de mi clase
  factory Band.fromMap(Map<String, dynamic> obj) => Band(
        id: obj['id'],
        name: obj['name'],
        votes: obj['votes'],
      );
}
