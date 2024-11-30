## Отчет дз3
### №1
``` bash
Ran 4 tests for test/01. ArithmeticOperators.t.sol:ArithmeticOperatorsOptimizedTest
[PASS] test_Addition() (gas: 10378)
[PASS] test_DivisionBy128() (gas: 5451)
[PASS] test_DivisionBy2() (gas: 5483)
[PASS] test_Subtraction() (gas: 10361)
Suite result: ok. 4 passed; 0 failed; 0 skipped; finished in 15.99ms (302.01µs CPU time)

Ran 4 tests for test/01. ArithmeticOperators.t.sol:ArithmeticOperatorsTest
[PASS] test_Addition() (gas: 10474)
[PASS] test_DivisionBy128() (gas: 5527)
[PASS] test_DivisionBy2() (gas: 5559)
[PASS] test_Subtraction() (gas: 10454)
Suite result: ok. 4 passed; 0 failed; 0 skipped; finished in 16.46ms (429.31µs CPU time)

Ran 2 test suites in 32.20ms (32.46ms CPU time): 8 tests passed, 0 failed, 0 skipped (8 total tests)
```
В сложении и разности экономия была достикнута применением директивы uchecking и отстутствием проверки на переполнение.
В делении экономия была достигнута заменой обычного деления на битовый сдвиг

---
### №2
``` bash
Ran 1 test for test/02. ArrayLength.t.sol:ArrayLengthOptimizedTest
[PASS] test_Call() (gas: 8481)
Suite result: ok. 1 passed; 0 failed; 0 skipped; finished in 459.11µs (68.00µs CPU time)

Ran 1 test for test/02. ArrayLength.t.sol:ArrayLengthsTest
[PASS] test_Call() (gas: 8973)
Suite result: ok. 1 passed; 0 failed; 0 skipped; finished in 495.11µs (108.00µs CPU time)
| src/02. ArrayLength.sol:ArrayLength contract |                 |      |        |      |         |
|----------------------------------------------|-----------------|------|--------|------|---------|
| Deployment Cost                              | Deployment Size |      |        |      |         |
| 362090                                       | 487             |      |        |      |         |
| Function Name                                | min             | avg  | median | max  | # calls |
| callFor                                      | 3694            | 3694 | 3694   | 3694 | 1       |


| src/02. ArrayLength.sol:ArrayLengthOptimized contract |                 |      |        |      |         |
|-------------------------------------------------------|-----------------|------|--------|------|---------|
| Deployment Cost                                       | Deployment Size |      |        |      |         |
| 362534                                                | 489             |      |        |      |         |
| Function Name                                         | min             | avg  | median | max  | # calls |
| callFor                                               | 3202            | 3202 | 3202   | 3202 | 1       |
```
Экономия была достигнута путем сокращения числа обращений к хранилищу,для получения числа элементов
Таким образом, экономия на каждый вызов составила 492 газа, однако, из-за введения новой переменной цена развертывания поднялась на 444
таким образом мы сэкономили газ на вызов, на немного стали дороже в развертывании, но это подорожание в развертывании окупиться первым же вызовом.

---
### №3
``` bash
Ran 1 test for test/03. CalldataMemory.t.sol:CalldataMemoryOptimizedTest
[PASS] test_Call() (gas: 30923)
Suite result: ok. 1 passed; 0 failed; 0 skipped; finished in 530.91µs (87.40µs CPU time)

Ran 1 test for test/03. CalldataMemory.t.sol:CalldataMemoryTest
[PASS] test_Call() (gas: 32497)
Suite result: ok. 1 passed; 0 failed; 0 skipped; finished in 662.92µs (109.90µs CPU time)
```
Оптимизация была достигнула следующими дейсвтиями:
1. Использование unchecking во время сложения, для оптимизации переполнений
2. Хранение размера массива как переменной, для экономии в обращении к хранилищу
3. Использование неизменяемой области памяти calldata вместо memory

---

### №4
``` bash
Ran 3 tests for test/04. Loops.t.sol:LoopsOptimizedTest
[PASS] test_doWhile() (gas: 5843)
[PASS] test_for() (gas: 6561)
[PASS] test_while() (gas: 5966)
Suite result: ok. 3 passed; 0 failed; 0 skipped; finished in 1.56ms (454.11µs CPU time)

Ran 3 tests for test/04. Loops.t.sol:LoopsTest
[PASS] test_doWhile() (gas: 7203)
[PASS] test_for() (gas: 7921)
[PASS] test_while() (gas: 7326)
Suite result: ok. 3 passed; 0 failed; 0 skipped; finished in 2.32ms (1.00ms CPU time)
```
Оптимизация была достигнута оборачиванием всех циклов в unchecking

---

### №5
``` bash
Ran 1 test for test/05. PackVariables.t.sol:PackVariablesOptimizedTest
[PASS] test_set() (gas: 148438)
Suite result: ok. 1 passed; 0 failed; 0 skipped; finished in 3.58ms (2.25ms CPU time)

Ran 1 test for test/05. PackVariables.t.sol:PackVariablesTest
[PASS] test_set() (gas: 170535)
Suite result: ok. 1 passed; 0 failed; 0 skipped; finished in 3.61ms (2.77ms CPU time)
```
Оптимизация была достигнута путем изменения порядка объявления полей, для уменьшения числа занимаемых слотов, тк поля контракта хранятся в слотах

---

### №6
``` bash
Ran 1 test for test/05. PackVariables.t.sol:PackVariablesOptimizedTest
[PASS] test_set() (gas: 137295)
Suite result: ok. 1 passed; 0 failed; 0 skipped; finished in 681.51µs (180.20µs CPU time)

Ran 1 test for test/05. PackVariables.t.sol:PackVariablesTest
[PASS] test_set() (gas: 159392)
Suite result: ok. 1 passed; 0 failed; 0 skipped; finished in 465.21µs (159.50µs CPU time)
```
Оптимизция зключалась в использовании revert вместо require, тк revert более экономичен

---

### №7
``` bash

Ran 1 test for test/07. Swap.t.sol:SwapOptimizedTest
[PASS] test_swap() (gas: 8798)
Suite result: ok. 1 passed; 0 failed; 0 skipped; finished in 410.41µs (62.30µs CPU time)

Ran 1 test for test/07. Swap.t.sol:SwapTest
[PASS] test_swap() (gas: 9063)
Suite result: ok. 1 passed; 0 failed; 0 skipped; finished in 276.31µs (42.60µs CPU time)
```
Оптимизация заключается в замене разницы на более оптимальный ксор.

---

### №8
``` bash
Ran 1 test for test/08. ArrayType.t.sol:ArrayTypeOptimizedTest
[PASS] test_init() (gas: 4442156)
Suite result: ok. 1 passed; 0 failed; 0 skipped; finished in 669.01µs (264.91µs CPU time)

Ran 1 test for test/08. ArrayType.t.sol:ArrayTypeTest
[PASS] test_init() (gas: 4504856)
Suite result: ok. 1 passed; 0 failed; 0 skipped; finished in 779.82µs (402.51µs CPU time)
```
Оптимизация заключается в использовании заранее выделенной памяти под все элементы массива и директивны анчекинг

---

### №9
``` bash
Compiler run successful!

Ran 1 test for test/09. NestedIf.t.sol:NestedIfTest
[PASS] test_call() (gas: 8158)
Suite result: ok. 1 passed; 0 failed; 0 skipped; finished in 476.31µs (62.20µs CPU time)

Ran 1 test for test/09. NestedIf.t.sol:NestedIfOptimizedTest
[PASS] test_call() (gas: 8077)
Suite result: ok. 1 passed; 0 failed; 0 skipped; finished in 274.21µs (49.90µs CPU time)
```

Оптимизация заключается в сокращении логики c if, до обычного вывода флага независимо от его результата

---

### №10
``` bash
[PASS] testConfirmTransaction() (gas: 207550)
[PASS] testExecuteTransaction() (gas: 320901)
[PASS] testExecutionFailure() (gas: 281582)
[PASS] testInitialization() (gas: 31897)
[PASS] testOnlyOwnerCanConfirm() (gas: 145725)
[PASS] testOnlyOwnerCanExecute() (gas: 350962)
[PASS] testOnlyOwnerCanSubmit() (gas: 40022)
[PASS] testSubmitTransaction() (gas: 119645)
Suite result: ok. 8 passed; 0 failed; 0 skipped; finished in 1.76ms (1.14ms CPU time)

Ran 8 tests for test/10. MultiSigWallet.t.sol:MultiSigWalletOptimizedTest
[PASS] testConfirmTransaction() (gas: 206137)
[PASS] testExecuteTransaction() (gas: 309628)
[PASS] testExecutionFailure() (gas: 270088)
[PASS] testInitialization() (gas: 31897)
[PASS] testOnlyOwnerCanConfirm() (gas: 135924)
[PASS] testOnlyOwnerCanExecute() (gas: 332228)
[PASS] testOnlyOwnerCanSubmit() (gas: 32561)
[PASS] testSubmitTransaction() (gas: 117305)
```

1. Обрезание размера массива вместо его полного перекопирования в меньший 
2. Оптимизация числа обращений к хранилищу где возможно
3. Оптимизация числа обращений по индексу где возможно 
4. Использование дополнительного поля словаря с адресами овнеров, для быстрой проверки овнера, вместо метода с перебором массива в цикле

(В этом задании, я написал свои оптимизации еще дополнительно комментариями в коде)
