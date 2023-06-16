# HashTable

Uma implementação de uma tabela de hash em Swift.

## Descrição

A classe `HashTable` é uma estrutura de dados que representa uma tabela de hash, onde os valores são armazenados e recuperados por meio de chaves únicas. A tabela de hash é implementada internamente usando um array de compartimentos (buckets), onde cada compartimento pode conter várias entradas representadas por um par chave-valor.

## Propósito

O propósito da `HashTable` é fornecer uma estrutura de dados eficiente para armazenar e recuperar valores por meio de chaves. Ela permite uma busca rápida e direta dos valores associados às chaves, tornando-a adequada para cenários onde o acesso eficiente aos dados é crucial.

## Funcionamento

A `HashTable` é implementada usando uma matriz de compartimentos (`buckets`), onde cada compartimento contém uma lista de entradas representadas por pares chave-valor. A função de hash é usada para mapear as chaves para um índice na matriz de compartimentos.

Ao adicionar um valor à tabela de hash, a função de hash é aplicada à chave para determinar o compartimento correspondente. Em seguida, a entrada (par chave-valor) é adicionada ao compartimento adequado. Se a chave já existe, o valor associado à chave existente é substituído pelo novo valor.

Para recuperar um valor com base em uma chave, a função de hash é novamente aplicada à chave para encontrar o compartimento correspondente. A lista de entradas no compartimento é percorrida para procurar uma entrada com a chave correspondente. Se a chave for encontrada, o valor associado é retornado; caso contrário, `nil` é retornado.

## Complexidade

- Adicionar um valor usando `subscript(key:)` ou `updateValue(_:forKey:)`: O(1) em média, mas pode ser O(n) no pior caso, onde n é o número de entradas colidindo no mesmo compartimento.
- Recuperar um valor usando `subscript(key:)` ou `value(forKey:)`: O(1) em média, mas pode ser O(n) no pior caso, onde n é o número de entradas colidindo no mesmo compartimento.
- Remover um valor usando `removeValue(forKey:)`: O(1) em média, mas pode ser O(n) no pior caso, onde n é o número de entradas colidindo no mesmo compartimento.

## Eficiência

A `HashTable` é eficiente para armazenar e recuperar valores com base em chaves, especialmente quando o número de entradas colidindo em cada compartimento é baixo. No entanto, se houver muitas colisões, o desempenho pode ser degradado, pois será necessário percorrer a lista de entradas colididas para encontrar a chave desejada.

Para manter a eficiência, é recomendável ajustar o fator de carga da tabela de hash (número de entradas dividido pelo número de compartimentos) e considerar o uso de funções de hash de alta qualidade para distribuir as chaves de forma mais uniforme.

## Limitações

Alguns pontos a serem considerados ao usar a `HashTable` incluem:

- O consumo de memória aumenta com o tamanho da tabela de hash, especialmente quando o fator de carga é alto.
- O desempenho da tabela de hash pode ser afetado por colisões de chaves. Uma boa

 função de hash e um fator de carga adequado ajudam a mitigar esse problema.

## Aplicações

A `HashTable` pode ser aplicada em diversas situações, incluindo:

- Armazenamento e recuperação eficiente de dados em um formato chave-valor.
- Implementação de caches de dados.
- Indexação rápida de informações em bancos de dados.

## Implementação

A implementação da `HashTable` segue os princípios da orientação a objetos, utilizando uma classe `HashTable` com capacidade ajustável e um tipo genérico para as chaves e valores. Os compartimentos são representados por uma matriz de listas, onde cada lista contém pares chave-valor.

Exemplo de uso:

```swift
// Criar uma instância da HashTable
let myHashTable = HashTable<String, Int>(capacity: 10)

// Adicionar valores à tabela de hash
myHashTable["one"] = 1
myHashTable["two"] = 2
myHashTable["three"] = 3

// Recuperar valores da tabela de hash
let value = myHashTable["two"]
print(value) // Output: Optional(2)

// Remover valores da tabela de hash
myHashTable["two"] = nil

// Verificar se uma chave existe na tabela de hash
let containsKey = (myHashTable["two"] != nil)
print(containsKey) // Output: false
```

## Instalação

A `HashTable` está disponível como um pacote Swift e pode ser facilmente instalada usando o Swift Package Manager. Siga as etapas abaixo para incluir a `HashTable` em seu projeto:

1. Abra seu projeto no Xcode.
2. Vá para "File" > "Swift Packages" > "Add Package Dependency...".
3. Insira o URL do repositório do pacote: https://github.com/seu-usuario/HashTable.git
4. Siga as instruções fornecidas para completar a instalação.

Certifique-se de substituir "seu-usuario" pelo seu nome de usuário do GitHub ou o URL correto do repositório.

## Contribuição

Contribuições são bem-vindas! Se você encontrar problemas, tiver sugestões de melhorias ou quiser adicionar novos recursos à `HashTable`, fique à vontade para abrir uma issue ou enviar uma pull request no repositório do projeto.

## Licença

Este projeto está licenciado sob a [MIT License](LICENSE).

## Agradecimentos

Agradecemos a todos os colaboradores que ajudaram a tornar este projeto melhor.

## Contato

Se você tiver alguma dúvida, sugestão ou precisar entrar em contato, você pode me encontrar em:

- Email: seu-email@example.com
- Twitter: [@seu_usuario](https://twitter.com/seu_usuario)

Fique à vontade para entrar em contato se tiver alguma dúvida ou precisar de assistência relacionada à `HashTable`.

Esperamos que este projeto seja útil para você!
