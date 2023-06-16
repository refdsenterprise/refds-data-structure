# LinkedList

Uma implementação de uma lista encadeada em Swift.

## Descrição

A classe `LinkedList` é uma estrutura de dados que representa uma lista encadeada, onde os elementos são armazenados em nós que possuem referências para o próximo nó na lista. A lista encadeada permite a inserção e remoção eficientes de elementos em qualquer posição da lista.

## Propósito

O propósito da `LinkedList` é fornecer uma estrutura de dados flexível para armazenar e manipular uma coleção de elementos. A lista encadeada é especialmente adequada quando é necessário inserir ou remover elementos com frequência em posições arbitrarias da lista.

## Funcionamento

A `LinkedList` é implementada usando nós que contêm um valor genérico e referências para o próximo e o nó anterior na lista. O primeiro nó é chamado de cabeça (`head`) e o último nó é chamado de cauda (`tail`).

A lista encadeada permite inserir elementos no final da lista usando o método `append(value:)`, inserir elementos em uma posição específica usando o método `insert(value:atIndex:)`, remover elementos em uma posição específica usando o método `remove(atIndex:)`, verificar se a lista contém um determinado valor usando o método `contains(value:)`, e obter o índice da primeira ocorrência de um valor usando o método `index(of:)`.

## Complexidade

- Inserir um elemento no final da lista usando `append(value:)`: O(1).
- Inserir um elemento em uma posição específica usando `insert(value:atIndex:)`: O(n), onde n é o número de elementos na lista.
- Remover um elemento em uma posição específica usando `remove(atIndex:)`: O(n), onde n é o número de elementos na lista.
- Verificar se a lista contém um determinado valor usando `contains(value:)`: O(n), onde n é o número de elementos na lista.
- Obter o índice da primeira ocorrência de um valor usando `index(of:)`: O(n), onde n é o número de elementos na lista.

## Eficiência

A `LinkedList` é eficiente para inserir e remover elementos em posições arbitrarias da lista, pois não requer realocações de memória como em um array. No entanto, para acessar um elemento em uma posição específica, a eficiência é linear, pois a lista precisa percorrer os nós sequencialmente até a posição desejada.

## Limitações

Alguns pontos a serem considerados ao usar a `LinkedList` incluem:

- A lista encadeada não fornece acesso direto aos elementos por meio de um índice, a menos que seja percorrida sequencialmente até o índice desejado.
- A `LinkedList` ocupa mais espaço em memória do que um array, pois cada nó precisa de uma referência para o próximo e o nó anterior.
- A busca em uma `LinkedList` é menos eficiente do que em uma árvore binária de busca ou em um hash set/dictionary.

## Aplicações

A `LinkedList` pode ser aplicada em diversas situações, incluindo:

- Implementação de estruturas de dados mais complexas, como filas, pilhas e listas circulares.
- Manipulação eficiente de elementos em uma coleção, especialmente quando a ordem de inserção ou remoção é importante.

## Implementação

A implementação da `LinkedList` segue os princípios da estrutura de uma lista

 encadeada, usando nós que contêm um valor genérico e referências para o próximo e o nó anterior. A classe `Node` é uma classe interna utilizada para representar um nó da lista.

Exemplo de uso:

```swift
// Criar uma instância da LinkedList vazia
let myList = LinkedList<Int>()

// Adicionar elementos à lista
myList.append(value: 1)
myList.append(value: 2)
myList.append(value: 3)

// Inserir um elemento em uma posição específica
myList.insert(value: 4, atIndex: 1)

// Remover um elemento em uma posição específica
myList.remove(atIndex: 2)

// Verificar se a lista contém um determinado valor
if try myList.contains(value: 2) {
    print("A lista contém o valor 2")
}

// Obter o índice da primeira ocorrência de um valor
if let index = try myList.index(of: 3) {
    print("O valor 3 está na posição \(index)")
}
```

## Instalação

A `LinkedList` está disponível como um pacote Swift e pode ser facilmente instalada usando o Swift Package Manager. Siga as etapas abaixo para incluir a `LinkedList` em seu projeto:

1. Abra seu projeto no Xcode.
2. Vá para "File" > "Swift Packages" > "Add Package Dependency...".
3. Insira o URL do repositório do pacote: https://github.com/seu-usuario/LinkedList.git
4. Siga as instruções fornecidas para completar a instalação.

Certifique-se de substituir "seu-usuario" pelo seu nome de usuário do GitHub ou o URL correto do repositório.

## Contribuição

Contribuições são bem-vindas! Se você encontrar problemas, tiver sugestões de melhorias ou quiser adicionar novos recursos à `LinkedList`, fique à vontade para abrir uma issue ou enviar uma pull request no repositório do projeto.

## Licença

Este projeto está licenciado sob a [MIT License](LICENSE).

## Agradecimentos

Agradecemos a todos os colaboradores que ajudaram a tornar este projeto melhor.

## Contato

Se você tiver alguma dúvida, sugestão ou precisar entrar em contato, você pode me encontrar em:

- Email: seu-email@example.com
- Twitter: [@seu_usuario](https://twitter.com/seu_usuario)

Fique à vontade para entrar em contato se tiver alguma dúvida ou precisar de assistência relacionada à `LinkedList`.

Esperamos que este projeto seja útil para você!
