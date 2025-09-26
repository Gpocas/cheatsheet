
# `collections` Cheat Sheet

A biblioteca `collections` oferece classes especializadas para armazenar dados de maneiras eficientes.

## 1. **`namedtuple()`**
Cria tuplas nomeadas, permitindo acessar elementos por nome e não apenas por índice.

### Sintaxe:
```python
from collections import namedtuple

# Definição da tupla
Pessoa = namedtuple('Pessoa', ['nome', 'idade', 'profissao'])

# Criação de uma instância
pessoa1 = Pessoa(nome="Alice", idade=30, profissao="Engenheira")

# Acessando os valores
print(pessoa1.nome)  # Alice
print(pessoa1[1])    # 30
```

## 2. **`deque()`**
Lista otimizada para inserções e remoções rápidas em ambas as extremidades (frente e trás).

### Sintaxe:
```python
from collections import deque

# Criando uma deque
d = deque([1, 2, 3])

# Adicionando à direita
d.append(4)

# Adicionando à esquerda
d.appendleft(0)

# Removendo da direita
d.pop()

# Removendo da esquerda
d.popleft()

# Rotacionar o deque (positivo para direita, negativo para esquerda)
d.rotate(1)
```

## 3. **`Counter()`**
Um dicionário especializado para contar objetos hashable. É útil para contagem de elementos.

### Sintaxe:
```python
from collections import Counter

# Contando elementos em uma lista
contagem = Counter([1, 2, 2, 3, 3, 3])

# Acessando a contagem de um elemento específico
print(contagem[2])  # 2

# Mostra os elementos únicos
print(list(contagem))  # [1, 2, 3]

# Converte para um dicionário
print(dict(contagem))  # {1: 1, 2: 2, 3: 3}

# Métodos úteis
print(contagem.most_common(1))  # [(3, 3)] (elemento mais comum)
```

## 4. **`defaultdict()`**
Similar ao dicionário padrão, mas com um valor padrão para chaves inexistentes, evitando erros ao tentar acessar uma chave não existente.

### Sintaxe:
```python
from collections import defaultdict

# Criando um defaultdict com valor padrão de lista
d = defaultdict(list)

# Adicionando valores
d['a'].append(1)

# Não resulta em erro ao acessar chave inexistente
print(d['b'])  # Retorna []

# Outro exemplo com valor padrão de int
d_int = defaultdict(int)
d_int['x'] += 1
print(d_int['x'])  # 1
```

## 5. **`OrderedDict()`**
Um dicionário que mantém a ordem de inserção dos elementos.

### Sintaxe:
```python
from collections import OrderedDict

# Criando um OrderedDict
ord_dict = OrderedDict()
ord_dict['um'] = 1
ord_dict['dois'] = 2
ord_dict['tres'] = 3

# Acessando os itens na ordem de inserção
for chave, valor in ord_dict.items():
    print(chave, valor)

# Comparação de OrderedDicts considera a ordem
od1 = OrderedDict([('a', 1), ('b', 2)])
od2 = OrderedDict([('b', 2), ('a', 1)])
print(od1 == od2)  # False, ordens diferentes
```

## 6. **`ChainMap()`**
Combina múltiplos dicionários em um só. Útil para buscas em cascata (como em contextos de variáveis locais e globais).

### Sintaxe:
```python
from collections import ChainMap

# Criando dois dicionários
dict1 = {'a': 1, 'b': 2}
dict2 = {'b': 3, 'c': 4}

# Criando um ChainMap
chain = ChainMap(dict1, dict2)

# Acessando os valores
print(chain['a'])  # 1 (do dict1)
print(chain['b'])  # 2 (do dict1, prioriza o primeiro dicionário)
print(chain['c'])  # 4 (do dict2)

# Adicionando um novo dicionário ao ChainMap
dict3 = {'d': 5}
chain = chain.new_child(dict3)
print(chain['d'])  # 5
```

## 7. **`UserDict`, `UserList`, `UserString`**
Classes wrapper que permitem criar suas próprias implementações de dicionários, listas e strings, respeitando a interface padrão dessas classes.

### Exemplo de `UserDict`:
```python
from collections import UserDict

# Criando uma subclasse de UserDict
class MeuDicionario(UserDict):
    def __setitem__(self, key, value):
        if isinstance(key, str):
            super().__setitem__(key, value)
        else:
            raise KeyError("Somente chaves do tipo string são permitidas.")

# Utilizando o MeuDicionario
meu_dict = MeuDicionario()
meu_dict['nome'] = 'Alice'  # Funciona
# meu_dict[123] = 'Teste'  # Levanta KeyError
```

---

Essa cheat sheet cobre os principais componentes da biblioteca `collections`, que são bastante úteis para manipulação avançada de dados no Python.
