# Octree

Uma implementação de uma Octree em Swift.

## Descrição

A classe `Octree` é uma estrutura de dados que representa uma Octree, uma árvore espacial tridimensional que divide o espaço em oito octantes. Cada nó na Octree pode armazenar um valor genérico `T` e tem oito filhos, correspondendo aos oito octantes do espaço.

## Propósito

O propósito da `Octree` é fornecer uma estrutura de dados eficiente para organizar e pesquisar valores em um espaço tridimensional. Ela permite inserir valores em coordenadas específicas e procurar valores associados a pontos no espaço.

## Funcionamento

A `Octree` é composta por nós internos da classe `Node`, onde cada nó representa um octante do espaço. Cada nó pode armazenar um valor genérico e tem oito filhos, correspondendo aos oito octantes do espaço. O nó raiz representa o espaço total.

Ao inserir um valor na Octree usando o método `insert(_:at:)`, a árvore é percorrida recursivamente até encontrar o octante correspondente à posição do ponto. O valor é inserido no nó correspondente se estiver vazio, caso contrário, a busca continua em um dos filhos do nó.

Para pesquisar um valor em um ponto específico na Octree usando o método `search(at:)`, a árvore é percorrida recursivamente até encontrar o octante correspondente à posição do ponto. Se o nó contiver um valor, ele é retornado, caso contrário, a busca continua em um dos filhos do nó.

## Complexidade

- Inserção usando `insert(_:at:)`: O(log n), onde n é o número de elementos armazenados na árvore.
- Pesquisa usando `search(at:)`: O(log n), onde n é o número de elementos armazenados na árvore.

## Eficiência

A `Octree` é eficiente para inserção e pesquisa de valores em um espaço tridimensional. Ela permite dividir o espaço em octantes e reduzir a quantidade de nós a serem percorridos durante a pesquisa.

A eficiência da Octree depende da distribuição dos pontos no espaço. Se houver um agrupamento desigual dos pontos, a árvore pode ficar desequilibrada e a eficiência pode diminuir.

## Limitações

Alguns pontos a serem considerados ao usar a `Octree` incluem:

- A `Octree` é adequada para armazenar e pesquisar valores em um espaço tridimensional, mas não suporta outras operações mais complexas, como remoção de valores específicos ou busca por intervalos.
- A `Octree` requer uma `BoundingBox` para definir o espaço tridimensional em que opera. É responsabilidade do usuário garantir que os pontos estejam dentro dos limites da caixa delimitadora.
- A implementação atual da `Octree` não lida com colisões ou sobreposições de pontos. Se vários pontos forem inseridos em uma mesma posição, apenas o último valor inserido será retido.

## Aplicações

A `Octree` pode ser aplicada em diversas situações, incluindo:

- Renderização de gráficos 3D e jogos para acelerar o processamento de objetos espaciais.
- Sistemas de detecção de colisão

 em ambientes tridimensionais.
- Armazenamento e pesquisa de dados espaciais em bancos de dados geoespaciais.

## Implementação

A implementação da `Octree` utiliza uma classe `Octree` com uma classe aninhada `Node` para representar os nós da árvore. A `BoundingBox` é usada para definir a região tridimensional da árvore, e a `Point` é usada para representar um ponto tridimensional.

Exemplo de uso:

```swift
// Criar uma instância da Octree
let boundingBox = Octree.BoundingBox(minX: 0, minY: 0, minZ: 0, maxX: 10, maxY: 10, maxZ: 10)
let octree = Octree(boundingBox: boundingBox)

// Inserir valores na Octree
do {
    let point = Octree.Point(x: 2, y: 3, z: 5)
    try octree.insert("Value 1", at: point)
    
    let anotherPoint = Octree.Point(x: 8, y: 6, z: 4)
    try octree.insert("Value 2", at: anotherPoint)
} catch let error as Octree.OctreeError {
    print("Error: \(error.title) - \(error.description)")
}

// Pesquisar valores na Octree
do {
    let searchPoint = Octree.Point(x: 2, y: 3, z: 5)
    if let value = try octree.search(at: searchPoint) {
        print(value) // Output: "Value 1"
    } else {
        print("Value not found")
    }
} catch let error as Octree.OctreeError {
    print("Error: \(error.title) - \(error.description)")
}
```

## Contribuição

Contribuições são bem-vindas! Se você encontrar problemas, tiver sugestões de melhorias ou quiser adicionar novos recursos à `Octree`, fique à vontade para abrir uma issue ou enviar uma pull request no repositório do projeto.

## Licença

Este projeto está licenciado sob a [MIT License](LICENSE).

## Agradecimentos

Agradecemos a todos os colaboradores que ajudaram a tornar este projeto melhor.

## Contato

Se você tiver alguma dúvida, sugestão ou precisar entrar em contato, você pode me encontrar em:

- Email: seu-email@example.com
- Twitter: [@seu_usuario](https://twitter.com/seu_usuario)

Fique à vontade para entrar em contato se tiver alguma dúvida ou precisar de assistência relacionada à `Octree`.

Esperamos que este projeto seja útil para você!
