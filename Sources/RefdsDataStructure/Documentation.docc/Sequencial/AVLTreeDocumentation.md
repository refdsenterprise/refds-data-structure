# AVLTree

Uma implementação de uma árvore AVL em Swift.

## Descrição

A classe `AVLTree` é uma árvore de busca binária balanceada que segue a propriedade da Árvore AVL. Uma árvore AVL é uma árvore de busca binária em que a diferença de altura entre as subárvores esquerda e direita de cada nó é no máximo 1. Isso garante que a árvore permaneça balanceada e evita a ocorrência de operações ineficientes.

## Propósito

O propósito da `AVLTree` é fornecer uma estrutura de dados eficiente para armazenar e manipular elementos em uma ordem específica. A árvore AVL é especialmente útil quando é necessário manter uma ordem de elementos e garantir um desempenho de busca, inserção e remoção eficiente, mesmo quando a árvore está sujeita a alterações constantes.

## Funcionamento

A `AVLTree` é implementada usando a classe interna `Node`, que representa um nó na árvore. Cada nó contém um valor, referências para os nós esquerdo e direito, e a altura do nó. A altura de um nó é calculada com base nas alturas de seus nós filhos.

A inserção de um valor na árvore é feita de forma recursiva usando o método `insert(_:)`. Durante a inserção, a árvore é reequilibrada para garantir que as propriedades da AVL sejam mantidas. Os métodos `rotateRight(_:)` e `rotateLeft(_:)` são usados para realizar as rotações necessárias para reequilibrar a árvore.

A classe `AVLTree` também fornece métodos auxiliares para calcular o fator de equilíbrio de um nó, obter a altura de um nó e manipular erros específicos da árvore AVL.

## Complexidade

- Inserir um valor na árvore usando `insert(_:)`: O(log n) no caso médio, onde n é o número de nós na árvore.
- Obter o fator de equilíbrio de um nó usando `getBalanceFactor(_:)`: O(1).
- Obter a altura de um nó usando `height(_:)`: O(1).
- Realizar rotações à direita ou à esquerda usando `rotateRight(_:)` ou `rotateLeft(_:)`: O(1).

## Eficiência

A `AVLTree` é eficiente para operações de busca, inserção e remoção. A árvore AVL garante que a altura da árvore permaneça balanceada, o que resulta em um desempenho de busca eficiente. As rotações realizadas durante a inserção garantem que a árvore permaneça balanceada, evitando a degeneração da árvore e mantendo um desempenho eficiente para todas as operações.

## Limitações

Alguns pontos a serem considerados ao usar a `AVLTree` incluem:

- A inserção, remoção e busca são eficientes, mas a criação da árvore inicial a partir de uma sequência desordenada pode ser custosa.
- A implementação atual da `AVLTree` não suporta operações como mesclar duas árvores ou dividir uma

 árvore em partes menores.
- A classe `AVLTree` é projetada para armazenar valores únicos. Valores duplicados não são suportados e podem levar a resultados imprevisíveis.

## Aplicações

A `AVLTree` é amplamente utilizada em situações em que é necessário armazenar uma coleção de elementos em uma ordem específica e manter um desempenho eficiente para operações de busca, inserção e remoção. Alguns exemplos de aplicações da `AVLTree` incluem:

- Dicionários ordenados: A `AVLTree` pode ser usada para implementar um dicionário ordenado, onde os elementos são armazenados em ordem crescente ou decrescente com base em suas chaves.
- Implementações de conjuntos: A `AVLTree` pode ser usada para implementar conjuntos ordenados, onde os elementos são armazenados sem duplicatas em uma ordem específica.
- Índices de banco de dados: A `AVLTree` pode ser usada para criar índices de banco de dados, onde os registros são organizados em uma ordem específica para facilitar a busca eficiente.

## Implementação

A implementação da `AVLTree` é fornecida no arquivo "AVLTree.swift". O código está organizado em classes e métodos para facilitar o uso e a compreensão. A classe `Node` representa um nó da árvore e contém as propriedades necessárias. A classe `AVLTree` contém os métodos para inserção, rotação e manipulação de erros.

```swift
// Exemplo de uso da AVLTree

// Cria uma nova instância da AVLTree
let avlTree = AVLTree<Int>()

// Insere valores na árvore
avlTree.insert(10)
avlTree.insert(5)
avlTree.insert(15)
avlTree.insert(3)
avlTree.insert(7)

// Obtém a raiz da árvore
if let root = avlTree.root {
    print("Valor da raiz: \(root.value)")
}

// Verifica se a árvore está vazia
if avlTree.isEmpty {
    print("A árvore está vazia.")
} else {
    print("A árvore não está vazia.")
}

// Obtém a altura da árvore
let treeHeight = avlTree.height(avlTree.root)
print("Altura da árvore: \(treeHeight)")

// Realiza a busca de um valor na árvore
do {
    let searchValue = 7
    let index = try avlTree.search(searchValue)
    print("O valor \(searchValue) está no índice \(index).")
} catch {
    print("O valor não foi encontrado na árvore.")
}
```

## Contribuição

Contribuições são bem-vindas! Se você encontrar problemas, tiver sugestões de melhorias ou quiser adicionar novos recursos à `AVLTree`, fique à vontade para abrir uma issue ou enviar uma pull request no repositório do projeto.

## Licença

Este projeto está licenciado sob a [MIT License](LICENSE).

## Agradecimentos

Agradecemos a todos os colaboradores que ajudaram a tornar este projeto melhor.

## Contato

Se você tiver alguma dúvida, sugestão ou precisar entrar em contato, você pode me encontrar em:

- Email: seu-email@example.com
- Twitter

: @seu_usuario
