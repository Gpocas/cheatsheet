
# `itertools` Cheat Sheet

O módulo `itertools` fornece várias funções úteis que permitem trabalhar com iteradores de maneira eficiente.

## 1. **`itertools.count(start=0, step=1)`**
Cria um iterador que retorna valores sequenciais começando de `start`, incrementando por `step`.

### Sintaxe:
```python
import itertools

contador = itertools.count(start=10, step=2)
print(next(contador))  # 10
print(next(contador))  # 12
```

## 2. **`itertools.cycle(iterable)`**
Cria um iterador que retorna os elementos do `iterable` repetidamente, em um ciclo infinito.

### Sintaxe:
```python
import itertools

ciclo = itertools.cycle(['A', 'B', 'C'])
print(next(ciclo))  # 'A'
print(next(ciclo))  # 'B'
```

## 3. **`itertools.repeat(object, times=None)`**
Retorna o mesmo objeto várias vezes. Se `times` for especificado, o objeto é retornado o número especificado de vezes, caso contrário, será retornado indefinidamente.

### Sintaxe:
```python
import itertools

repetidor = itertools.repeat(10, times=3)
print(list(repetidor))  # [10, 10, 10]
```

## 4. **`itertools.permutations(iterable, r=None)`**
Retorna todas as permutações possíveis dos elementos no `iterable` de comprimento `r`. Se `r` não for especificado, utiliza o comprimento total do `iterable`.

### Sintaxe:
```python
import itertools

perm = itertools.permutations([1, 2, 3], 2)
print(list(perm))  # [(1, 2), (1, 3), (2, 1), (2, 3), (3, 1), (3, 2)]
```

## 5. **`itertools.combinations(iterable, r)`**
Retorna todas as combinações possíveis dos elementos no `iterable` de comprimento `r`.

### Sintaxe:
```python
import itertools

comb = itertools.combinations([1, 2, 3], 2)
print(list(comb))  # [(1, 2), (1, 3), (2, 3)]
```

## 6. **`itertools.combinations_with_replacement(iterable, r)`**
Retorna todas as combinações possíveis dos elementos no `iterable` de comprimento `r`, permitindo repetição de elementos.

### Sintaxe:
```python
import itertools

comb_wr = itertools.combinations_with_replacement([1, 2, 3], 2)
print(list(comb_wr))  # [(1, 1), (1, 2), (1, 3), (2, 2), (2, 3), (3, 3)]
```

## 7. **`itertools.product(*iterables, repeat=1)`**
Retorna o produto cartesiano dos iteráveis. Equivalente a `nested for-loops`.

### Sintaxe:
```python
import itertools

prod = itertools.product([1, 2], ['A', 'B'])
print(list(prod))  # [(1, 'A'), (1, 'B'), (2, 'A'), (2, 'B')]
```

## 8. **`itertools.chain(*iterables)`**
Une vários iteráveis em um único iterador.

### Sintaxe:
```python
import itertools

chain = itertools.chain([1, 2], [3, 4])
print(list(chain))  # [1, 2, 3, 4]
```

## 9. **`itertools.islice(iterable, start, stop, step)`**
Fatia um iterador da mesma forma que a função `slice`, mas funciona em qualquer iterador, não apenas listas.

### Sintaxe:
```python
import itertools

iterador = range(10)
slice_iter = itertools.islice(iterador, 2, 8, 2)
print(list(slice_iter))  # [2, 4, 6]
```

## 10. **`itertools.groupby(iterable, key=None)`**
Agrupa itens consecutivos de um `iterable` que tenham o mesmo valor de chave.

### Sintaxe:
```python
import itertools

data = [(1, 'A'), (1, 'B'), (2, 'A'), (2, 'B')]
grouped = itertools.groupby(data, key=lambda x: x[0])

for key, group in grouped:
    print(key, list(group))
# 1 [(1, 'A'), (1, 'B')]
# 2 [(2, 'A'), (2, 'B')]
```

## 11. **`itertools.accumulate(iterable, func=operator.add)`**
Retorna acumulados de elementos em um iterável, aplicando uma função binária opcional (como soma, multiplicação).

### Sintaxe:
```python
import itertools
import operator

acc = itertools.accumulate([1, 2, 3, 4], operator.mul)
print(list(acc))  # [1, 2, 6, 24]
```

---

Essa cheat sheet cobre as funções mais comuns do módulo `itertools`, que são altamente úteis para manipulação eficiente de iteradores no Python.

