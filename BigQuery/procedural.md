- Declare
  - syntax: `DECLARE <name> <type> DEFAULT <expression>`
  - e.g.:
  ```
  DECLARE reality BOOL DEFAULT true;
  select reality;
  ```
  You can just declare a variable without values
  ```
  declare name STRING;
  ```
  To fill our variable, we need use DEFAULT before
  ```
  declare name STRING default "Ramon";
  ```
