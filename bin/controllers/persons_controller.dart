part of drails_example;

@injectable
class PersonsController {
  Person get(int id) => g_persons[id];
  
  List<Person> getAll() => g_persons.values.toList();
  
  Person save(int id, @RequestBody Person person) => g_persons[id] = person;
  
  Iterable<Person> saveAll(@RequestBody List<Person> persons) => 
    persons..forEach((person) {
      if(person.id == null) {
        person.id = ++lastId;
      }
      g_persons[person.id] = person;
    });
  
  void delete(int id) { g_persons.remove(id); }
  
  void deleteAll(@RequestBody List<int> ids) { ids.forEach((id) => g_persons.remove(id)); }
}