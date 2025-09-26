
# Python functools Cheat Sheet

O módulo `functools` fornece funções de ordem superior que atuam em outras funções ou retornam funções.

## 1. `functools.partial`
Cria uma nova função com argumentos pré-preenchidos.

```python
from functools import partial

def power(base, exponent):
    return base ** exponent

square = partial(power, exponent=2)
print(square(5))  # Output: 25
```

## 2. `functools.lru_cache`
Cacheia os resultados de funções para evitar chamadas repetidas.

```python
from functools import lru_cache

@lru_cache(maxsize=128)
def fibonacci(n):
    if n < 2:
        return n
    return fibonacci(n-1) + fibonacci(n-2)

print(fibonacci(10))  # Output: 55
```

## 3. `functools.reduce`
Aplica uma função cumulativamente a itens de um iterável, da esquerda para a direita.

```python
from functools import reduce

numbers = [1, 2, 3, 4]
result = reduce(lambda x, y: x * y, numbers)
print(result)  # Output: 24
```

## 4. `functools.singledispatch`
Implementa uma função genérica de despacho único, permitindo sobrecarregar funções com base no tipo de argumento.

```python
from functools import singledispatch

@singledispatch
def func(val):
    print(f"Valor genérico: {val}")

@func.register(int)
def _(val: int):
    print(f"Número inteiro: {val}")

@func.register(str)
def _(val: str):
    print(f"String: {val}")

func(10)    # Output: Número inteiro: 10
func("10")  # Output: String: 10
```

## 5. `functools.update_wrapper`
Atualiza um wrapper com informações de uma função original.

```python
from functools import update_wrapper

def decorator(func):
    def wrapper(*args, **kwargs):
        print("Chamando função decorada")
        return func(*args, **kwargs)
    return update_wrapper(wrapper, func)

@decorator
def hello():
    print("Olá!")

hello()  # Output: Chamando função decorada 
 Olá!
```

## 6. `functools.total_ordering`
Garante a implementação de todos os métodos de comparação com base em apenas um ou dois métodos.

```python
from functools import total_ordering

@total_ordering
class Person:
    def __init__(self, name, age):
        self.name = name
        self.age = age

    def __eq__(self, other):
        return self.age == other.age

    def __lt__(self, other):
        return self.age < other.age

p1 = Person("Alice", 30)
p2 = Person("Bob", 25)

print(p1 > p2)  # Output: True
```

## 7. `functools.wraps`
Facilita a criação de decoradores, copiando o nome e a docstring da função original para o wrapper.

```python
from functools import wraps

def decorator(func):
    @wraps(func)
    def wrapper(*args, **kwargs):
        print("Chamando função decorada")
        return func(*args, **kwargs)
    return wrapper

@decorator
def hello():
    '''Diz olá.'''
    print("Olá!")

print(hello.__name__)  # Output: hello
print(hello.__doc__)   # Output: Diz olá.
```

## 8. `functools.cmp_to_key`
Converte uma função de comparação antiga em uma chave utilizável para ordenação.

```python
from functools import cmp_to_key

def compare(a, b):
    return (a > b) - (a < b)

sorted_list = sorted([5, 2, 9, 1], key=cmp_to_key(compare))
print(sorted_list)  # Output: [1, 2, 5, 9]
```

## 9. `functools.cached_property`
Cacheia o valor retornado por uma propriedade e evita que seja recalculado.

```python
class Circle:
    def __init__(self, radius):
        self.radius = radius

    @functools.cached_property
    def area(self):
        print("Calculando área...")
        return 3.1415 * self.radius ** 2

c = Circle(10)
print(c.area)  # Calculando área... 314.15
print(c.area)  # 314.15 (sem recalcular)
```
