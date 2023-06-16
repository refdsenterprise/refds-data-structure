# LinkedList

LinkedList is a generic data structure that represents a linked list in Swift. It provides methods to append elements, remove elements, and search for elements efficiently.

## Table of Contents

- [Installation](#installation)
- [Usage](#usage)
- [API Reference](#api-reference)
- [Error Handling](#error-handling)
- [Contributing](#contributing)
- [License](#license)

## Installation

You can simply copy the `LinkedList.swift` file into your project to start using it.

## Usage

First, import the `LinkedList` module:

```swift
import LinkedList
```

Create an instance of the `LinkedList` class:

```swift
let list = LinkedList<Int>()
```

Now you can append elements to the linked list using the `append` method:

```swift
list.append(10)
list.append(20)
list.append(30)
```

To remove an element from the list, use the `remove` method:

```swift
try list.remove(20)
```

To search for an element in the list, you can use the `firstIndex` method:

```swift
if let index = list.firstIndex(of: 10) {
    print("Found at index:", index)
} else {
    print("Element not found")
}
```

You can also retrieve the value of an element at a specific index using the `value` method:

```swift
if let value = list.value(at: 0) {
    print("Value at index 0:", value)
} else {
    print("Invalid index")
}
```

## API Reference

### `LinkedList<T>`

Represents a generic linked list data structure.

#### Methods

- `append(_ value: T)`: Adds a new element to the end of the linked list.
- `remove(_ value: T) throws`: Removes the first occurrence of the specified element from the linked list.
- `firstIndex(of value: T) -> Int?`: Searches for the first occurrence of the specified element in the linked list and returns its index.
- `value(at index: Int) -> T?`: Retrieves the value of the element at the specified index in the linked list.

### `LinkedList.LinkedListError`

An error type that represents possible errors in a linked list.

- `emptyList`: Indicates that the list is empty.
- `elementNotFound`: Indicates that the specified element was not found in the list.

## Error Handling

The `remove` method throws a `LinkedListError` if the list is empty or if the element is not found. Make sure to handle these errors appropriately using do-catch blocks.

```swift
do {
    try list.remove(20)
} catch LinkedList.LinkedListError.emptyList {
    print("List is empty")
} catch LinkedList.LinkedListError.elementNotFound {
    print("Element not found")
} catch {
    print("An error occurred:", error)
}
```

## Contributing

Contributions are welcome! Please feel free to submit issues and pull requests.

## License

This project is licensed under the [MIT License](LICENSE).

In this README file, we start with a brief introduction to the LinkedList class and its features. We provide installation instructions and usage examples with code snippets. The API reference section lists the available methods and their descriptions. Error handling is explained, and contributions are encouraged. Finally, we mention the project's license.

Remember to replace the `LICENSE` file path with the actual file path of your project's license.

Feel free to customize this README to fit the specific needs of your project, including adding more sections or providing additional explanations.
