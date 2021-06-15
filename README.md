# kumparan
Simple Web Testing On Kumparan Website. Built with `Robot Framework`.


## Structure
### page-objects
File devided by pages as object on the website. Each file consist applicable keyword on the page. Element locator is listed in `element.yaml` file.
### suites
Contain 2 main folder, `testcases` and `bugs`. Testcases folder contains test script based on created testcases. Bugs folder contains test script to reproduce bugs found.
### helper
Contain common function to run web testing.


## How To Run
Simply use robot command on terminal.
```sh
robot suites/[path to file]
```
Example
```sh
robot suites/testcases/login.robot
```
Or simply run this command to run all test on the suites.
```sh
robot suites/
```
