# FenwickTree

Uma implementação de uma árvore Fenwick em Swift.

## Descrição

A classe `FenwickTree` é uma estrutura de dados que representa uma árvore Fenwick, também conhecida como árvore de índice ou BIT (Binary Indexed Tree). A árvore Fenwick permite computar eficientemente somas prefixas e realizar atualizações de valores em uma sequência de elementos.

## Propósito

O propósito da `FenwickTree` é fornecer uma estrutura de dados eficiente para calcular somas prefixas e atualizar valores em um array de elementos. A árvore Fenwick é particularmente útil quando é necessário realizar essas operações com frequência, como em problemas relacionados a intervalos ou consultas acumulativas.

## Funcionamento

A `FenwickTree` é inicializada com um array de valores e constrói a árvore Fenwick com base nesses valores. A árvore é armazenada internamente como um array `tree` que contém as somas acumuladas em diferentes intervalos.

Ao atualizar um valor na árvore usando o método `update(_:at:)`, a árvore é atualizada recursivamente para refletir a mudança no valor. Isso é feito adicionando o valor à posição correspondente no array `tree` e atualizando as posições subsequentes afetadas pela mudança.

Para calcular a soma prefixa até um determinado índice usando o método `prefixSum(upTo:)`, a árvore é percorrida de forma recursiva, somando os valores armazenados nas posições relevantes no array `tree`.

## Complexidade

- Inicialização: O(n), onde n é o número de elementos no array inicial.
- Atualização usando `update(_:at:)`: O(log n), onde n é o número de elementos no array.
- Cálculo da soma prefixa usando `prefixSum(upTo:)`: O(log n), onde n é o número de elementos no array.

## Eficiência

A `FenwickTree` é eficiente para calcular somas prefixas e realizar atualizações em um array de elementos. Ela oferece uma melhoria em relação às abordagens de força bruta para cálculo de somas prefixas, reduzindo a complexidade de tempo de O(n) para O(log n).

A principal vantagem da `FenwickTree` é a economia de espaço em relação a outras estruturas de dados, como árvores de segmento. A árvore Fenwick requer apenas um array para armazenar as somas acumuladas, ocupando menos espaço na memória.

## Limitações

Alguns pontos a serem considerados ao usar a `FenwickTree` incluem:

- A `FenwickTree` é adequada para cálculos de somas prefixas, mas não suporta outras operações mais complexas, como atualizações em posições arbitrárias do array ou busca rápida de valores específicos.
- Os elementos no array fornecido devem ser do tipo numérico, conforme especificado pela restrição genérica `Numeric`.
- A `FenwickTree` não lida com mudanças dinâmicas no array inicial após a inicialização. Se o array for modificado, é necessário recriar a árvore Fenwick para refletir as alterações.

## Aplicações

A `FenwickTree` pode ser aplicada em diversas situações, incluindo

:

- Cálculo eficiente de somas prefixas em uma sequência de elementos.
- Resolução de problemas relacionados a intervalos ou consultas acumulativas, como encontrar a soma dos elementos em um intervalo específico ou calcular médias móveis.

## Implementação

A implementação da `FenwickTree` utiliza uma classe `FenwickTree` com métodos para inicialização, atualização de valores e cálculo de somas prefixas. A árvore Fenwick é representada pelo array `tree`.

Exemplo de uso:

```swift
// Criar uma instância da FenwickTree
do {
    let values = [1, 3, 2, -4, 5, 2, 7]
    let fenwickTree = try FenwickTree(values)
    
    // Calcular a soma prefixa até um determinado índice
    let prefixSum = try fenwickTree.prefixSum(upTo: 4)
    print(prefixSum) // Output: 7
    
    // Atualizar o valor em um determinado índice
    try fenwickTree.update(10, at: 2)
    
    // Calcular a nova soma prefixa
    let newPrefixSum = try fenwickTree.prefixSum(upTo: 4)
    print(newPrefixSum) // Output: 17
} catch let error as FenwickTree.FenwickTreeError {
    print("Error: \(error.title) - \(error.description)")
}
```

## Instalação

A `FenwickTree` está disponível como um pacote Swift e pode ser facilmente instalada usando o Swift Package Manager. Siga as etapas abaixo para incluir a `FenwickTree` em seu projeto:

1. Abra seu projeto no Xcode.
2. Vá para "File" > "Swift Packages" > "Add Package Dependency...".
3. Insira o URL do repositório do pacote: https://github.com/seu-usuario/FenwickTree.git
4. Siga as instruções fornecidas para completar a instalação.

Certifique-se de substituir "seu-usuario" pelo seu nome de usuário do GitHub ou o URL correto do repositório.

## Contribuição

Contribuições são bem-vindas! Se você encontrar problemas, tiver sugestões de melhorias ou quiser adicionar novos recursos à `FenwickTree`, fique à vontade para abrir uma issue ou enviar uma pull request no repositório do projeto.

## Licença

Este projeto está licenciado sob a [MIT License](LICENSE).

## Agradecimentos

Agradecemos a todos os colaboradores que ajudaram a tornar este projeto melhor.

## Contato

Se você tiver alguma dúvida, sugestão ou precisar entrar em contato, você pode me encontrar em:

- Email: seu-email@example.com
- Twitter: [@seu_usuario](https://twitter.com/seu_usuario)

Fique à vontade para entrar em contato se tiver alguma dúvida ou precisar de assistência relacionada à `FenwickTree`.

Esperamos que este projeto seja útil para você!
