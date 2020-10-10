# progress-unit-testing-interactive

## To test if ABLUnit framework is working on your environment you can use our sample repository which already have everything configured. To try it out perform following steps:

1. Clone the repository:
```bash
git clone https://github.com/justas-eko/progress-unit-testing-interactive.git
```
2. You might need to change **DLC** variable value:  
  Change **DLC** variable value to your Progress home directory in **progress-unit-testing-interactive/config/propath.ini**  
  Depending on your environment setup, you might need to change prowin path in **progress-unit-testing-interactive/launch_unit.bat**  
3. Change the connection values to your sports2000 database of choice in **progress-unit-testing-interactive/config/propath.ini**  
   **Sugested database is described in the letter sent before**
4. To run script **progress-unit-testing-interactive/launch_unit.bat** you can simply double clikc on it
5. If everything went well you will see:
```bash
$ ./launch_unit.shStarting tests...
   Seems there are failing tests...
Finished! Check 'results.xml'
```
---
Also, **progress-unit-testing/results.xml** will be generated that will show the outcome of each test.  
There's one drawback with this approach: XML isn't formatted right.  
To resolve any problems that might rise you can read **progress-unit-testing-interactive/ablunit.log** to debug possible problems.
