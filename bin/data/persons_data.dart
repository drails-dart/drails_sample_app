part of drails_example;

int lastId = 3;
Map<int, Person> g_persons = {
  1: new Person()
    ..id = 1
    ..firstName = 'Jhon'
    ..lastName = 'Doe'
    ..dob = new DateTime.utc(1988, 4, 1),
  2: new Person()
    ..id = 2
    ..firstName = 'Jimmy'
    ..lastName = 'Who'
    ..dob = new DateTime.utc(1988, 4, 1),
  3: new Person()
    ..id = 3
    ..firstName = 'Jake'
    ..lastName = 'Britman'
    ..dob = new DateTime.utc(1988, 8, 28)
};
  

Map<int, User> g_users = {
  1: new User()
    ..id = 1
    ..name = 'jhon'
    ..password = 'jhon'
    ..roles = ['ADMIN'],
  2: new User()
    ..id = 2
    ..name = 'jake'
    ..password = 'jake'
    ..roles = ['PUBLIC']
};

int lastEmployeeId = 3;
Map<int, Employee> g_employees = {
    1: new Employee()
      ..id = 1
      ..firstName = 'Jade'
      ..lastName = 'wan'
      ..dob = new DateTime(1988, 4, 1)
      ..salary = 1000,
    2: new Employee()
      ..id = 2
      ..firstName = 'David'
      ..lastName = 'Dolittle'
      ..dob = new DateTime(1988, 4, 1)
      ..salary = 1000,
    3: new Employee()
      ..id = 3
      ..firstName = 'Mark'
      ..lastName = 'Brito'
      ..dob = new DateTime(1989, 8, 28)
      ..salary = 3000
};

