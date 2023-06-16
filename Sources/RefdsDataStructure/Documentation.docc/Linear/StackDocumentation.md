# Stack

Uma implementação de uma pilha em Swift.

## Descrição

A classe `Stack` é uma estrutura de dados que representa uma pilha, onde os elementos são inseridos e removidos do topo. A pilha segue a política "Last-In-First-Out" (LIFO), onde o último elemento adicionado é o primeiro a ser removido.

## Propósito

O propósito da `Stack` é fornecer uma estrutura de dados eficiente para armazenar e manipular elementos em uma ordem específica. A pilha é especialmente útil quando é necessário manter uma ordem de elementos e precisamos acessar o elemento mais recente rapidamente.

## Funcionamento

A `Stack` é implementada usando um array para armazenar os elementos. A inserção de elementos é feita no topo da pilha usando o método `push(_:)`, e a remoção de elementos também é feita no topo da pilha usando o método `pop()`. O método `peek()` permite obter o elemento no topo da pilha sem removê-lo.

## Complexidade

- Inserir um elemento na pilha usando `push(_:)`: O(1).
- Remover um elemento da pilha usando `pop()`: O(1).
- Obter o elemento no topo da pilha usando `peek()`: O(1).

## Eficiência

A `Stack` é eficiente para inserir e remover elementos em tempo constante, pois as operações são realizadas no final do array. A estrutura de uma pilha é especialmente adequada para algoritmos que requerem acesso ao elemento mais recente e precisam manter uma ordem específica de elementos.

## Limitações

Alguns pontos a serem considerados ao usar a `Stack` incluem:

- A `Stack` é baseada em um array, portanto, o tamanho máximo da pilha é limitado pelo tamanho máximo do array.
- A busca de um elemento específico na pilha requer uma busca sequencial, o que pode ser ineficiente para grandes pilhas.

## Aplicações

A `Stack` pode ser aplicada em diversas situações, incluindo:

- Avaliação de expressões matemáticas (por exemplo, conversão de infixas para postfixas).
- Rastreamento de chamadas de função em linguagens de programação.
- Gerenciamento de histórico de navegação em um aplicativo.

## Implementação

A implementação da `Stack` é simples e direta, usando um array para armazenar os elementos e métodos para inserir, remover e obter elementos da pilha.

Exemplo de uso:

```swift
// Criar uma instância da Stack vazia
let myStack = Stack<Int>()

// Empilhar elementos
myStack.push(1)
myStack.push(2)
myStack.push(3)

// Desempilhar o elemento do topo
if let poppedElement = myStack.pop() {
    print(poppedElement) // Output: 3
}

// Obter o elemento do topo sem removê-lo
if let peekElement = myStack.peek() {
    print(peekElement) // Output: 2
}
```

## Instalação

A `Stack` está disponível como um pacote Swift e pode ser facilmente instalada usando o Swift Package Manager. Siga as etapas abaixo para incluir a `Stack` em seu projeto:

1. Abra seu projeto no Xcode.
2. Vá para "File" > "Swift Packages" > "Add Package Dependency...".
3. Insira

 o URL do repositório do pacote: https://github.com/seu-usuario/Stack.git
4. Siga as instruções fornecidas para completar a instalação.

Certifique-se de substituir "seu-usuario" pelo seu nome de usuário do GitHub ou o URL correto do repositório.

## Contribuição

Contribuições são bem-vindas! Se você encontrar problemas, tiver sugestões de melhorias ou quiser adicionar novos recursos à `Stack`, fique à vontade para abrir uma issue ou enviar uma pull request no repositório do projeto.

## Licença

Este projeto está licenciado sob a [MIT License](LICENSE).

## Agradecimentos

Agradecemos a todos os colaboradores que ajudaram a tornar este projeto melhor.

## Contato

Se você tiver alguma dúvida, sugestão ou precisar entrar em contato, você pode me encontrar em:

- Email: seu-email@example.com
- Twitter: [@seu_usuario](https://twitter.com/seu_usuario)

Fique à vontade para entrar em contato se tiver alguma dúvida ou precisar de assistência relacionada à `Stack`.

Esperamos que este projeto seja útil para você!
