# BinarySearchTree

Uma implementação de uma árvore binária de busca em Swift.

## Descrição

A classe `BinarySearchTree` é uma estrutura de dados que representa uma árvore binária de busca, onde cada nó na árvore contém um valor do tipo genérico `T` que deve ser comparável. A árvore binária de busca possui a propriedade de que todos os valores menores que o valor de um nó estão no seu subárvore esquerdo, e todos os valores maiores estão no seu subárvore direito.

## Propósito

O propósito da `BinarySearchTree` é fornecer uma estrutura de dados eficiente para armazenar elementos em uma árvore binária de busca, permitindo a inserção, busca e travessia dos elementos. A árvore binária de busca é útil para realizar operações de busca eficientes e manter os elementos ordenados.

## Funcionamento

A `BinarySearchTree` é implementada usando uma classe `Node` para representar cada nó na árvore. Cada nó contém um valor, além de referências para o nó filho esquerdo e nó filho direito.

Ao inserir um valor na árvore usando o método `insert(_:)`, um novo nó é criado com o valor fornecido. Se a árvore estiver vazia, o novo nó se torna a raiz. Caso contrário, o método `insertNode(_:at:)` é chamado recursivamente para encontrar a posição correta para inserir o novo nó na árvore.

O método `contains(_:)` verifica se a árvore contém um determinado valor. Ele chama o método `containsValue(_:at:)` recursivamente para percorrer a árvore em busca do valor desejado.

A `BinarySearchTree` também oferece métodos para realizar travessias (traversal) na árvore. Os métodos `preOrderTraversal()`, `inOrderTraversal()`, e `postOrderTraversal()` retornam um array de elementos na ordem correspondente de travessia.

## Complexidade

- Inserir um elemento usando `insert(_:)`: O(log n) em média, onde n é o número de elementos na árvore. No pior caso, quando a árvore está desbalanceada, a complexidade pode ser O(n).
- Verificar a existência de um elemento usando `contains(_:)`: O(log n) em média, onde n é o número de elementos na árvore. No pior caso, quando a árvore está desbalanceada, a complexidade pode ser O(n).
- Traversing (travessia) da árvore usando as funções de travessia: O(n), onde n é o número de elementos na árvore.

## Eficiência

A `BinarySearchTree` é eficiente para busca de elementos em uma árvore ordenada. A complexidade média de busca é logarítmica, o que a torna uma estrutura de dados eficiente para problemas que envolvem busca ou consulta em dados ordenados.

No entanto, a eficiência da árvore depende do seu balanceamento. Se a árvore estiver desbalanceada, a complexidade das operações pode se aproximar de O(n), tornando-as menos eficientes.

## Limitações

Alguns pontos a serem considerados ao usar a `BinarySearchTree` incluem:

- A estrutura assume que os elementos

 são comparáveis usando o operador `<` e `>`. Portanto, o tipo genérico `T` deve conformar-se ao protocolo `Comparable`.
- A inserção de elementos pode levar a uma árvore desbalanceada, afetando a eficiência das operações.
- A remoção de elementos não está implementada nesta versão.

## Aplicações

A `BinarySearchTree` pode ser aplicada em diversas situações, incluindo:

- Organização e busca eficiente de dados em ordem.
- Implementação de algoritmos de busca binária.
- Estrutura de dados para indexação e pesquisa em bancos de dados.

## Implementação

A implementação da `BinarySearchTree` segue os princípios da orientação a objetos, utilizando uma classe `BinarySearchTree` e uma classe aninhada `Node`. A classe `Node` representa cada nó na árvore e contém o valor, além das referências para o nó filho esquerdo e nó filho direito.

Exemplo de uso:

```swift
// Criar uma instância da BinarySearchTree
let tree = BinarySearchTree<Int>()

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

A `BinarySearchTree` está disponível como um pacote Swift e pode ser facilmente instalada usando o Swift Package Manager. Siga as etapas abaixo para incluir a `BinarySearchTree` em seu projeto:

1. Abra seu projeto no Xcode.
2. Vá para "File" > "Swift Packages" > "Add Package Dependency...".
3. Insira o URL do repositório do pacote: https://github.com/seu-usuario/BinarySearchTree.git
4. Siga as instruções fornecidas para completar a instalação.

Certifique-se de substituir "seu-usuario" pelo seu nome de usuário do GitHub ou o URL correto do repositório.

## Contribuição

Contribuições são bem-vindas! Se você encontrar problemas, tiver sugestões de melhorias ou quiser adicionar novos recursos à `BinarySearchTree`, fique à vontade para abrir uma issue ou enviar uma pull request no repositório do projeto.

## Licença

Este projeto está licenciado sob a [MIT License](LICENSE).

## Agradecimentos

Agradecemos a todos os colaboradores que ajudaram a tornar este projeto melhor.

## Contato

Se você tiver alguma dúvida, sugestão ou precisar entrar em contato, você pode me encontrar em:

- Email: seu-email@example.com
- Twitter: [@seu_usuario](https://twitter.com/seu_usuario)

Fique à vontade para entrar em contato se tiver alguma

 dúvida ou precisar de assistência relacionada à `BinarySearchTree`.

Esperamos que este projeto seja útil para você!
