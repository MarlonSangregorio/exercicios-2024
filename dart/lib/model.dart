class Actvities {
  final String title;
  final List people;
  final String typeTitle;
  final String location;
  final dynamic description;
  final String authors;

  Actvities(
      {required this.title,
      required this.people,
      required this.typeTitle,
      required this.location,
      required this.description,
      required this.authors});

  static Actvities fromJson(item) {
    dynamic people = item['people'];

    dynamic location = item['locations'];

    String localCerto =
        location.map((local) => local['title']['pt-br'] as String).join(', ');

    String nomesConcatenados =
        people.map((pessoa) => pessoa['name'] as String).join(', ');

    List infoPeople = people.map((person) {
      return {
        'name': person['name'],
        'picture': person['picture'],
        'institution': person['institution'],
        'bio': person['bio']['pt-br']
      };
    }).toList();

    return (Actvities(
        title: item['title']['pt-br'],
        description: item['description']['pt-br'],
        people: infoPeople,
        authors: nomesConcatenados,
        location: localCerto,
        typeTitle: item['type']['title']['pt-br'] +
            " de " +
            item['start'].substring(11, 16) +
            " Até " +
            item['end'].substring(11, 16)));
  }
}
