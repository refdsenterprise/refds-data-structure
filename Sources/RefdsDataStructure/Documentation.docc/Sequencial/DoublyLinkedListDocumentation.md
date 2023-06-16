# Doubly Linked List

Uma implementação de uma lista duplamente encadeada em Swift.

## Descrição

A classe `DoublyLinkedList` representa uma lista duplamente encadeada, onde cada elemento na lista é armazenado em um nó que contém uma referência para o elemento anterior e o próximo elemento na lista. A lista duplamente encadeada oferece operações eficientes de inserção, remoção e acesso aos elementos em ambos os sentidos.

## Propósito

O propósito da `DoublyLinkedList` é fornecer uma estrutura de dados flexível e eficiente para armazenar uma coleção de elementos, onde a ordem e a posição dos elementos são importantes. Ela permite a inserção e a remoção de elementos em qualquer posição da lista de forma eficiente.

## Funcionamento

A `DoublyLinkedList` é implementada usando uma classe `Node` para representar cada nó na lista. Cada nó contém um valor genérico `T`, bem como referências para o nó anterior (`previous`) e o próximo nó (`next`). A lista mantém referências para o primeiro nó (`head`) e o último nó (`tail`) para facilitar a manipulação da lista.

A inserção de um elemento na lista é feita chamando o método `append(_:)`, que adiciona o elemento ao final da lista. O método `insert(_:at:)` permite inserir um elemento em uma posição específica da lista. A remoção de um elemento é feita chamando o método `remove(at:)`, que remove o elemento na posição especificada.

A lista também oferece métodos para verificar o número de elementos (`count`), se a lista está vazia (`isEmpty`), obter um elemento específico (`element(at:)`) e outras operações comuns.

## Complexidade

- Inserção de um elemento usando `append(_:)` ou `insert(_:at:)`: O(1) para inserção no início ou no final da lista; O(n) para inserção em uma posição específica.
- Remoção de um elemento usando `remove(at:)`: O(1) para remoção no início ou no final da lista; O(n) para remoção de uma posição específica.
- Acesso a um elemento usando `element(at:)`: O(n) para acessar um elemento em uma posição específica.

## Eficiência

A `DoublyLinkedList` é eficiente para inserção e remoção de elementos em qualquer posição da lista. Ela permite percorrer a lista em ambos os sentidos, facilitando a iteração e a manipulação dos elementos. No entanto, o acesso a elementos em posições específicas pode ser menos eficiente em comparação com outras estruturas de dados, como arrays.

## Limitações

Alguns pontos a serem considerados ao usar a `DoublyLinkedList` incluem:

- A manipulação de elementos na lista requer conhecimento das posições dos elementos.
- O acesso a elementos em posições específicas pode ser menos eficiente em comparação com outras estruturas de dados, especialmente para listas grandes.

## Aplicações

A `DoublyLinkedList` pode ser aplicada em diversas situações, incluindo:

- Implementação de estruturas de dados mais complexas, como filas, pilhas e deques.
- Implementação de algoritmos que exigem manipulação eficiente de elementos em uma ordem específica.

## Implementação

A implementação da `Doubly

LinkedList` é fornecida no código abaixo:

```swift
// Criar uma instância da DoublyLinkedList vazia
let list = DoublyLinkedList<Int>()

// Adicionar elementos à lista
list.append(10)
list.append(20)
list.append(30)

// Inserir um elemento em uma posição específica
try list.insert(15, at: 1)

// Remover um elemento em uma posição específica
try list.remove(at: 2)

// Verificar o número de elementos na lista
let count = list.count
print("Count: \(count)")

// Verificar se a lista está vazia
let isEmpty = list.isEmpty
print("Is Empty: \(isEmpty)")

// Acessar um elemento em uma posição específica
if let element = list.element(at: 1) {
    print("Element at index 1: \(element)")
}

// Realizar outras operações com a lista
```

## Instalação

A `DoublyLinkedList` está disponível como um pacote Swift e pode ser facilmente instalada usando o Swift Package Manager. Siga as etapas abaixo para incluir a `DoublyLinkedList` em seu projeto:

1. Abra seu projeto no Xcode.
2. Vá para "File" > "Swift Packages" > "Add Package Dependency...".
3. Insira o URL do repositório do pacote: https://github.com/seu-usuario/DoublyLinkedList.git
4. Siga as instruções fornecidas para completar a instalação.

Certifique-se de substituir "seu-usuario" pelo seu nome de usuário do GitHub ou o URL correto do repositório.

## Contribuição

Contribuições são bem-vindas! Se você encontrar problemas, tiver sugestões de melhorias ou quiser adicionar novos recursos à `DoublyLinkedList`, fique à vontade para abrir uma issue ou enviar uma pull request no repositório do projeto.

## Licença

Este projeto está licenciado sob a [MIT License](LICENSE).

## Agradecimentos

Agradecemos a todos os colaboradores que ajudaram a tornar este projeto melhor.

## Contato

Se você tiver alguma dúvida, sugestão ou precisar entrar em contato, você pode me encontrar em:

- Email: seu-email@example.com
- Twitter: [@seu_usuario](https://twitter.com/seu_usuario)

Fique à vontade para entrar em contato se tiver alguma dúvida ou precisar de assistência relacionada à `DoublyLinkedList`.

Esperamos que este projeto seja útil para você!
