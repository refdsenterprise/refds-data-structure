# Queue

Uma implementação de uma fila em Swift.

## Descrição

A classe `Queue` é uma estrutura de dados que representa uma fila, onde os elementos são inseridos no final e removidos do início. A fila segue a política "First-In-First-Out" (FIFO), onde o primeiro elemento adicionado é o primeiro a ser removido.

## Propósito

O propósito da `Queue` é fornecer uma estrutura de dados eficiente para armazenar e manipular elementos em uma ordem específica. A fila é especialmente útil quando é necessário processar elementos na ordem em que foram adicionados, como em algoritmos de busca em largura (BFS) ou em sistemas de agendamento.

## Funcionamento

A `Queue` é implementada usando um array para armazenar os elementos. A inserção de elementos é feita no final do array usando o método `enqueue(_:)`, e a remoção de elementos é feita no início do array usando o método `dequeue()`. O método `peek()` permite obter o elemento no início da fila sem removê-lo.

## Complexidade

- Inserir um elemento na fila usando `enqueue(_:)`: O(1).
- Remover um elemento da fila usando `dequeue()`: O(1).
- Obter o elemento no início da fila usando `peek()`: O(1).

## Eficiência

A `Queue` é eficiente para inserir e remover elementos em tempo constante, pois as operações são realizadas no final e no início do array, respectivamente. A estrutura de uma fila é especialmente adequada para algoritmos que requerem processamento em ordem de chegada, como a busca em largura (BFS).

## Limitações

Alguns pontos a serem considerados ao usar a `Queue` incluem:

- A `Queue` é baseada em um array, portanto, o tamanho máximo da fila é limitado pelo tamanho máximo do array.
- A busca de um elemento específico na fila requer uma busca sequencial, o que pode ser ineficiente para grandes filas.

## Aplicações

A `Queue` pode ser aplicada em diversas situações, incluindo:

- Algoritmos de busca em largura (BFS).
- Sistemas de agendamento.
- Processamento de tarefas em ordem de chegada.

## Implementação

A implementação da `Queue` é simples e direta, usando um array para armazenar os elementos e métodos para inserir, remover e obter elementos da fila.

Exemplo de uso:

```swift
// Criar uma instância da Queue vazia
let myQueue = Queue<Int>()

// Enfileirar elementos
myQueue.enqueue(1)
myQueue.enqueue(2)
myQueue.enqueue(3)

// Desenfileirar o próximo elemento
if let nextElement = try myQueue.dequeue() {
    print(nextElement) // Output: 1
}

// Obter o próximo elemento sem removê-lo
if let peekElement = try myQueue.peek() {
    print(peekElement) // Output: 2
}
```

## Instalação

A `Queue` está disponível como um pacote Swift e pode ser facilmente instalada usando o Swift Package Manager. Siga as etapas abaixo para incluir a `Queue` em seu projeto:

1. Abra seu projeto no Xcode.
2. Vá para "File" > "Swift Packages" > "Add Package Dependency...".
3. Insira o URL do re

positório do pacote: https://github.com/seu-usuario/Queue.git
4. Siga as instruções fornecidas para completar a instalação.

Certifique-se de substituir "seu-usuario" pelo seu nome de usuário do GitHub ou o URL correto do repositório.

## Contribuição

Contribuições são bem-vindas! Se você encontrar problemas, tiver sugestões de melhorias ou quiser adicionar novos recursos à `Queue`, fique à vontade para abrir uma issue ou enviar uma pull request no repositório do projeto.

## Licença

Este projeto está licenciado sob a [MIT License](LICENSE).

## Agradecimentos

Agradecemos a todos os colaboradores que ajudaram a tornar este projeto melhor.

## Contato

Se você tiver alguma dúvida, sugestão ou precisar entrar em contato, você pode me encontrar em:

- Email: seu-email@example.com
- Twitter: [@seu_usuario](https://twitter.com/seu_usuario)

Fique à vontade para entrar em contato se tiver alguma dúvida ou precisar de assistência relacionada à `Queue`.

Esperamos que este projeto seja útil para você!
