# Heap

Uma implementação de um heap em Swift.

## Descrição

A classe `Heap` é uma estrutura de dados que representa um heap binário, uma árvore binária completa onde cada nó pai é menor ou igual aos seus nós filhos. A classe `Heap` oferece métodos para inserir elementos no heap, remover o elemento mínimo (o menor elemento), verificar o elemento mínimo sem removê-lo e construir um heap a partir de uma lista de elementos.

## Propósito

O propósito da `Heap` é fornecer uma estrutura de dados eficiente para realizar operações em um conjunto de elementos, especialmente quando o acesso ao menor elemento é frequente. O heap é útil para implementar algoritmos como ordenação por seleção (heapsort), algoritmos de busca em grafos, entre outros.

## Funcionamento

A `Heap` é implementada usando um array de elementos, onde cada elemento ocupa uma posição correspondente na estrutura de árvore binária completa. Os elementos são organizados de forma que o elemento pai seja sempre menor ou igual aos seus nós filhos.

Ao inserir um elemento usando o método `insert(_:)`, o elemento é adicionado ao final do array e em seguida, é feito um ajuste subindo (sift-up) para garantir a propriedade do heap. Durante o ajuste subindo, o elemento é comparado com o seu pai e, se for menor, é trocado com o pai.

Ao remover o elemento mínimo usando o método `extractMin()`, o elemento raiz (índice 0) é removido e substituído pelo último elemento do array. Em seguida, é feito um ajuste descendo (sift-down) para garantir a propriedade do heap. Durante o ajuste descendo, o elemento é comparado com os seus filhos e, se for maior, é trocado com o menor filho.

O método `peek()` retorna o elemento mínimo do heap sem removê-lo.

O método `buildHeap()` constrói o heap a partir do array de elementos fornecido, garantindo que todos os elementos obedeçam à propriedade do heap.

## Complexidade

- Inserir um elemento usando `insert(_:)`: O(log n), onde n é o número de elementos no heap.
- Remover o elemento mínimo usando `extractMin()`: O(log n), onde n é o número de elementos no heap.
- Verificar o elemento mínimo usando `peek()`: O(1).
- Construir o heap usando `buildHeap()`: O(n), onde n é o número de elementos no array fornecido.

## Eficiência

A `Heap` é eficiente para encontrar e remover o elemento mínimo do conjunto de elementos. No entanto, a eficiência de inserção pode ser afetada caso haja uma quantidade significativa de ajustes subindo e descendo necessários para manter a propriedade do heap.

## Limitações

Alguns pontos a serem considerados ao usar a `Heap` incluem:

- A `Heap` é uma estrutura de dados para ordenação parcial, não permite acesso rápido a elementos arbitrários.
- A implementação atual não suporta a remoção de elementos em posições arbitrárias ou a alteração de valores de elementos existentes.

## Aplicações

A `Heap` pode ser aplicada em diversas situações, incluindo:

- Ordenação parcial de elementos (heapsort).
- Algoritmos de busca em grafos, como o algorit

mo de Dijkstra.
- Implementação de filas de prioridade.

## Implementação

A implementação da `Heap` segue os princípios da estrutura de um heap binário, utilizando um array para representar a árvore binária completa. A comparação entre os elementos é feita com base na conformidade com o protocolo `Comparable`.

Exemplo de uso:

```swift
// Criar uma instância da Heap vazia
let myHeap = Heap<Int>()

// Inserir elementos no heap
myHeap.insert(5)
myHeap.insert(10)
myHeap.insert(3)

// Remover e obter o elemento mínimo do heap
if let minElement = try myHeap.extractMin() {
    print(minElement) // Output: 3
}

// Obter o elemento mínimo sem removê-lo
if let peekElement = myHeap.peek() {
    print(peekElement) // Output: 5
}
```

## Instalação

A `Heap` está disponível como um pacote Swift e pode ser facilmente instalada usando o Swift Package Manager. Siga as etapas abaixo para incluir a `Heap` em seu projeto:

1. Abra seu projeto no Xcode.
2. Vá para "File" > "Swift Packages" > "Add Package Dependency...".
3. Insira o URL do repositório do pacote: https://github.com/seu-usuario/Heap.git
4. Siga as instruções fornecidas para completar a instalação.

Certifique-se de substituir "seu-usuario" pelo seu nome de usuário do GitHub ou o URL correto do repositório.

## Contribuição

Contribuições são bem-vindas! Se você encontrar problemas, tiver sugestões de melhorias ou quiser adicionar novos recursos à `Heap`, fique à vontade para abrir uma issue ou enviar uma pull request no repositório do projeto.

## Licença

Este projeto está licenciado sob a [MIT License](LICENSE).

## Agradecimentos

Agradecemos a todos os colaboradores que ajudaram a tornar este projeto melhor.

## Contato

Se você tiver alguma dúvida, sugestão ou precisar entrar em contato, você pode me encontrar em:

- Email: seu-email@example.com
- Twitter: [@seu_usuario](https://twitter.com/seu_usuario)

Fique à vontade para entrar em contato se tiver alguma dúvida ou precisar de assistência relacionada à `Heap`.

Esperamos que este projeto seja útil para você!
