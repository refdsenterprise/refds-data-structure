# CircularList

Uma implementação de uma lista circular em Swift.

## Descrição

A classe `CircularList` é uma estrutura de dados que representa uma lista circular, onde cada nó na lista possui um valor do tipo genérico `T` que deve ser equatable. A lista circular permite adicionar, remover e verificar a existência de valores na lista.

## Propósito

O propósito da `CircularList` é fornecer uma estrutura de dados eficiente para armazenar elementos de forma circular, onde o último elemento se conecta ao primeiro elemento. Essa estrutura é útil quando é necessário trabalhar com dados que precisam ser acessados de maneira circular, como em algoritmos de simulação, jogos ou algoritmos que envolvem iterações contínuas.

## Funcionamento

A `CircularList` é implementada usando nós encadeados, onde cada nó contém um valor e uma referência para o próximo nó na lista. O último nó da lista se conecta ao primeiro nó, formando um ciclo.

Ao adicionar um elemento à lista usando o método `append(value:)`, um novo nó é criado e adicionado ao final da lista. Caso a lista esteja vazia, o novo nó se torna o primeiro nó e se conecta a si mesmo. Caso contrário, o novo nó se conecta ao próximo nó do último nó e se torna o novo último nó.

Para remover um valor específico da lista usando o método `remove(value:)`, a lista é percorrida até que o valor seja encontrado. Se o valor for encontrado, o nó correspondente é removido, e as referências dos nós adjacentes são ajustadas para manter a estrutura circular. Caso o valor não seja encontrado, uma exceção do tipo `CircularListError.valueNotFound` é lançada.

O método `contains(value:)` percorre a lista para verificar se um valor está presente. Ele retorna `true` se o valor for encontrado e `false` caso contrário.

## Complexidade

- Adicionar um elemento usando `append(value:)`: O(1)
- Remover um elemento usando `remove(value:)`: O(n) no pior caso, onde n é o número de elementos na lista.
- Verificar a existência de um elemento usando `contains(value:)`: O(n) no pior caso, onde n é o número de elementos na lista.

## Eficiência

A `CircularList` é eficiente para adicionar elementos no final da lista, pois isso pode ser feito em tempo constante. No entanto, a remoção de um elemento ou a verificação da existência de um elemento requer percorrer a lista, o que pode levar mais tempo à medida que o número de elementos aumenta.

## Limitações

Alguns pontos a serem considerados ao usar a `CircularList` incluem:

- A estrutura não suporta a inserção ou remoção de elementos em posições arbitrárias da lista. Apenas a adição no final e a remoção do primeiro valor igual encontrado são suportadas.
- A `CircularList` é otimizada para acesso sequencial e ciclos contínuos. Se você precisa de acesso aleatório ou busca rápida por índice, uma estrutura de dados diferente pode ser mais adequada.

## Aplicações

A `CircularList` pode ser aplicada em diversas situações, incluindo:

- Algoritmos de simulação que envolvem ciclos ou itera

ções contínuas.
- Jogos que exigem o acesso cíclico a elementos.
- Implementação de buffers circulares em sistemas de comunicação ou streaming de dados.

## Implementação

A implementação da `CircularList` segue os princípios da orientação a objetos, utilizando uma classe `CircularList` e uma classe aninhada `Node`. A classe `Node` representa cada nó na lista e contém o valor e uma referência para o próximo nó.

Exemplo de uso:

```swift
// Criar uma instância da CircularList
let myList = CircularList<Int>()

// Adicionar elementos à lista
myList.append(value: 5)
myList.append(value: 10)
myList.append(value: 15)

// Verificar a existência de um valor na lista
let hasValue = myList.contains(value: 10)
print(hasValue) // Output: true

// Remover um valor da lista
do {
    try myList.remove(value: 10)
} catch let error as CircularList.CircularListError {
    print("Error: \(error.title) - \(error.description)")
}

// Verificar a existência do valor removido
let hasRemovedValue = myList.contains(value: 10)
print(hasRemovedValue) // Output: false
```

## Instalação

A `CircularList` está disponível como um pacote Swift e pode ser facilmente instalada usando o Swift Package Manager. Siga as etapas abaixo para incluir a `CircularList` em seu projeto:

1. Abra seu projeto no Xcode.
2. Vá para "File" > "Swift Packages" > "Add Package Dependency...".
3. Insira o URL do repositório do pacote: https://github.com/seu-usuario/CircularList.git
4. Siga as instruções fornecidas para completar a instalação.

Certifique-se de substituir "seu-usuario" pelo seu nome de usuário do GitHub ou o URL correto do repositório.

## Contribuição

Contribuições são bem-vindas! Se você encontrar problemas, tiver sugestões de melhorias ou quiser adicionar novos recursos à `CircularList`, fique à vontade para abrir uma issue ou enviar uma pull request no repositório do projeto.

## Licença

Este projeto está licenciado sob a [MIT License](LICENSE).

## Agradecimentos

Agradecemos a todos os colaboradores que ajudaram a tornar este projeto melhor.

## Contato

Se você tiver alguma dúvida, sugestão ou precisar entrar em contato, você pode me encontrar em:

- Email: seu-email@example.com
- Twitter: [@seu_usuario](https://twitter.com/seu_usuario)

Fique à vontade para entrar em contato se tiver alguma dúvida ou precisar de assistência relacionada à `CircularList`.

Esperamos que este projeto seja útil para você!
