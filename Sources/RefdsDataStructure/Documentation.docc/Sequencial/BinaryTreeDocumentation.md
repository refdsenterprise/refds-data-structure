# BinaryTree

Uma implementação de uma árvore binária em Swift.

## Descrição

A classe `BinaryTree` é uma estrutura de dados que representa uma árvore binária, onde cada nó na árvore contém um valor do tipo genérico `T` que deve ser comparável. A árvore binária consiste em nós conectados por referências, onde cada nó pode ter até dois filhos, um nó à esquerda e um nó à direita.

## Propósito

O propósito da `BinaryTree` é fornecer uma estrutura de dados flexível para armazenar elementos em uma árvore binária. A árvore binária permite a inserção, busca e travessia dos elementos, e pode ser aplicada em várias situações, como algoritmos de busca, criação de estruturas de dados hierárquicas e representação de expressões matemáticas.

## Funcionamento

A `BinaryTree` é implementada usando uma classe `Node` para representar cada nó na árvore. Cada nó contém um valor, além de referências para o nó filho esquerdo e o nó filho direito.

Ao inserir um valor na árvore usando o método `insert(_:)`, um novo nó é criado com o valor fornecido. Se a árvore estiver vazia, o novo nó se torna a raiz. Caso contrário, o método `insertNode(_:at:)` é chamado recursivamente para encontrar a posição correta para inserir o novo nó na árvore. O valor é comparado com o valor do nó atual e, com base nessa comparação, o novo nó é inserido à esquerda se for menor ou à direita se for maior.

O método `contains(_:)` verifica se a árvore contém um determinado valor. Ele chama o método `containsValue(_:at:)` recursivamente para percorrer a árvore em busca do valor desejado. O valor é comparado com o valor do nó atual e, com base nessa comparação, a busca continua no nó filho esquerdo se o valor for menor ou no nó filho direito se for maior.

A `BinaryTree` também oferece métodos para realizar travessias (traversal) na árvore. Os métodos `preOrderTraversal()`, `inOrderTraversal()`, e `postOrderTraversal()` retornam um array de elementos na ordem correspondente de travessia.

## Complexidade

- Inserir um elemento usando `insert(_:)`: O(log n) em média, onde n é o número de elementos na árvore. No pior caso, quando a árvore está desbalanceada, a complexidade pode ser O(n).
- Verificar a existência de um elemento usando `contains(_:)`: O(log n) em média, onde n é o número de elementos na árvore. No pior caso, quando a árvore está desbalanceada, a complexidade pode ser O(n).
- Traversing (travessia) da árvore usando as funções de travessia: O(n), onde n é o número de elementos na árvore.

## Eficiência

A `BinaryTree` é eficiente para realizar operações de busca, inserção e travessia em uma estrutura hierárquica de dados. No entanto, a eficiência da árvore depende do seu balanceamento

. Se a árvore estiver desbalanceada, a complexidade das operações pode se aproximar de O(n), tornando-as menos eficientes.

## Limitações

Alguns pontos a serem considerados ao usar a `BinaryTree` incluem:

- A estrutura não garante o balanceamento automático da árvore. Portanto, é importante garantir que a árvore esteja balanceada para obter um desempenho ideal.
- A remoção de elementos não está implementada nesta versão.

## Aplicações

A `BinaryTree` pode ser aplicada em diversas situações, incluindo:

- Implementação de algoritmos de busca como busca binária.
- Organização e manipulação de dados hierárquicos.
- Representação de expressões matemáticas ou árvores de análise sintática.

## Implementação

A implementação da `BinaryTree` segue os princípios da orientação a objetos, utilizando uma classe `BinaryTree` e uma classe aninhada `Node`. A classe `Node` representa cada nó na árvore e contém o valor, além das referências para o nó filho esquerdo e o nó filho direito.

Exemplo de uso:

```swift
// Criar uma instância da BinaryTree
let tree = BinaryTree<Int>()

// Inserir elementos na árvore
tree.insert(5)
tree.insert(3)
tree.insert(7)
tree.insert(1)
tree.insert(4)

// Verificar a existência de um valor na árvore
let containsValue = tree.contains(3)
print(containsValue) // Output: true

// Realizar a travessia preOrder
let preOrderElements = tree.preOrderTraversal()
print(preOrderElements) // Output: [5, 3, 1, 4, 7]

// Realizar a travessia inOrder
let inOrderElements = tree.inOrderTraversal()
print(inOrderElements) // Output: [1, 3, 4, 5, 7]

// Realizar a travessia postOrder
let postOrderElements = tree.postOrderTraversal()
print(postOrderElements) // Output: [1, 4, 3, 7, 5]
```

## Instalação

A `BinaryTree` está disponível como um pacote Swift e pode ser facilmente instalada usando o Swift Package Manager. Siga as etapas abaixo para incluir a `BinaryTree` em seu projeto:

1. Abra seu projeto no Xcode.
2. Vá para "File" > "Swift Packages" > "Add Package Dependency...".
3. Insira o URL do repositório do pacote: https://github.com/seu-usuario/BinaryTree.git
4. Siga as instruções fornecidas para completar a instalação.

Certifique-se de substituir "seu-usuario" pelo seu nome de usuário do GitHub ou o URL correto do repositório.

## Contribuição

Contribuições são bem-vindas! Se você encontrar problemas, tiver sugestões de melhorias ou quiser adicionar novos recursos à `BinaryTree`, fique à vontade para abrir uma issue ou enviar uma pull request no repositório do projeto.

## Licença

Este projeto está licenciado sob a [MIT License](LICENSE).

## Agradecimentos

Agradecemos a todos os colaboradores que ajudaram a tornar este projeto melhor.

## Contato

Se você tiver alguma dúvida, sugestão ou precisar entrar em contato, você pode me

 encontrar em:

- Email: seu-email@example.com
- Twitter: [@seu_usuario](https://twitter.com/seu_usuario)

Fique à vontade para entrar em contato se tiver alguma dúvida ou precisar de assistência relacionada à `BinaryTree`.

Esperamos que este projeto seja útil para você!
