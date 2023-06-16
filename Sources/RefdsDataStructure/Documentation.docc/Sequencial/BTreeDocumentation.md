# B-Tree

Uma implementação de uma árvore B em Swift.

## Descrição

A classe `BTree` é uma estrutura de dados que representa uma árvore B, onde cada nó na árvore contém uma lista ordenada de chaves do tipo genérico `Key` e uma lista de nós filhos. A árvore B é uma árvore balanceada que permite uma eficiente busca, inserção e remoção de elementos, mantendo uma altura mínima.

## Propósito

O propósito da `BTree` é fornecer uma estrutura de dados eficiente para armazenar e organizar grandes volumes de dados, especialmente em sistemas de armazenamento em disco ou em memória secundária. A árvore B é adequada para uso em cenários onde o acesso aleatório aos dados é necessário, como em bancos de dados, sistemas de arquivos e sistemas de indexação.

## Funcionamento

A `BTree` é implementada usando uma classe `Node` para representar cada nó na árvore. Cada nó contém uma lista ordenada de chaves e uma lista de nós filhos. O número máximo de chaves em um nó é determinado pelo parâmetro `order` especificado na inicialização da árvore.

A inserção de um par chave-valor na árvore é feita chamando o método `insert(_:value:)`. Se a raiz da árvore estiver cheia, uma nova raiz é criada e o nó original é dividido. O método `insertNonFull(_:key:value:)` é chamado recursivamente para encontrar o nó não cheio apropriado para a inserção do par chave-valor.

Durante a divisão de um nó cheio, o método `splitChild(_:at:parent:)` é chamado. Ele cria um novo nó e redistribui as chaves e os filhos entre os nós envolvidos na divisão.

A busca de uma chave na árvore é realizada chamando o método `contains(_:key:)`, que retorna verdadeiro se a chave estiver presente na árvore e falso caso contrário.

## Complexidade

- Inserir um par chave-valor usando `insert(_:value:)`: O(log n), onde n é o número de elementos na árvore.
- Verificar a existência de uma chave usando `contains(_:key:)`: O(log n), onde n é o número de elementos na árvore.

## Eficiência

A `BTree` é eficiente para armazenar e organizar grandes volumes de dados. Ela oferece um acesso eficiente aos elementos, especialmente quando os dados estão distribuídos em vários nós. A altura da árvore é mantida mínima, permitindo uma busca eficiente.

## Limitações

Alguns pontos a serem considerados ao usar a `BTree` incluem:

- A remoção de elementos não está implementada nesta versão.
- A complexidade das operações depende do parâmetro `order` especificado na inicialização da árvore. Um valor maior de `order` pode resultar em uma melhor eficiência para operações de leitura, mas pode aumentar a complexidade das operações de gravação.

## Aplicações

A `BTree` pode ser aplicada em diversas situações, incluindo:

- Armazenamento e indexação de dados em bancos de dados.
- Sistemas de arquivos em que a organização eficiente de dados é necessária.


- Estruturas de dados para indexação e busca em grandes conjuntos de dados.

## Implementação

A implementação da `BTree` segue os princípios da árvore B, utilizando uma classe `BTree` e uma classe aninhada `Node`. A classe `Node` representa cada nó na árvore e contém as chaves, os filhos e outras propriedades necessárias.

Exemplo de uso:

```swift
// Criar uma instância da BTree com order igual a 3
let bTree = BTree<Int, String>(order: 3)

// Inserir pares chave-valor na árvore
bTree.insert(10, value: "Apple")
bTree.insert(20, value: "Banana")
bTree.insert(5, value: "Orange")
bTree.insert(15, value: "Grape")

// Verificar a existência de uma chave na árvore
let containsKey = bTree.contains(bTree.root, key: 20)
print(containsKey) // Output: true

// Realizar outras operações, como remoção de elementos ou travessia da árvore
```

## Instalação

A `BTree` está disponível como um pacote Swift e pode ser facilmente instalada usando o Swift Package Manager. Siga as etapas abaixo para incluir a `BTree` em seu projeto:

1. Abra seu projeto no Xcode.
2. Vá para "File" > "Swift Packages" > "Add Package Dependency...".
3. Insira o URL do repositório do pacote: https://github.com/seu-usuario/BTree.git
4. Siga as instruções fornecidas para completar a instalação.

Certifique-se de substituir "seu-usuario" pelo seu nome de usuário do GitHub ou o URL correto do repositório.

## Contribuição

Contribuições são bem-vindas! Se você encontrar problemas, tiver sugestões de melhorias ou quiser adicionar novos recursos à `BTree`, fique à vontade para abrir uma issue ou enviar uma pull request no repositório do projeto.

## Licença

Este projeto está licenciado sob a [MIT License](LICENSE).

## Agradecimentos

Agradecemos a todos os colaboradores que ajudaram a tornar este projeto melhor.

## Contato

Se você tiver alguma dúvida, sugestão ou precisar entrar em contato, você pode me encontrar em:

- Email: seu-email@example.com
- Twitter: [@seu_usuario](https://twitter.com/seu_usuario)

Fique à vontade para entrar em contato se tiver alguma dúvida ou precisar de assistência relacionada à `BTree`.

Esperamos que este projeto seja útil para você!
