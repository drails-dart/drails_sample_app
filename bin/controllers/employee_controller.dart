part of drails_example;

@injectable
@AuthorizeRoles(const ['ADMIN'])
class EmployeesController {

  @AuthorizeRoles(const ['PUBLIC'])
  Employee get(int id) => g_employees[id];

  @AuthorizeRoles(const ['PUBLIC'])
  List<Employee> getAll() => g_employees.values.toList();

  Employee save(int id, @RequestBody Employee employee) => g_employees[id] = employee;

  Iterable<Employee> saveAll(@RequestBody List<Employee> employees) =>
    employees..forEach((employee) {
      if(employee.id == null) {
        employee.id = ++lastEmployeeId;
      }
      g_employees[employee.id] = employee;
    });

  void delete(int id) { g_employees.remove(id); }

  void deleteAll(@RequestBody List<int> ids) { ids.forEach((id) => g_employees.remove(id)); }
}