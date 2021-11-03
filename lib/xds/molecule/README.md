# Molecules

Here you will find the list of available molecules to build your components.

## TopBar

Provides back navigation, title and main action of the current screen.

### Properties

| Name           | Type        | Default value | Description                                                 |
| -------------- | ----------- | ------------- | ----------------------------------------------------------- |
| **title**      | String      | '' (empty)    | Text displayed in the center(or left) of the TopBar.        |
| **mainAction** | MainAction? | null          | Contains text and method to be executen on main action tap. |

### Usage

`TopBar` extends _AppBar_ to automatically provide application style and main action functionality. Use it in the Scaffold like:

```Dart
Scaffold(
    appBar: TopBar(
        title: 'My Screen',
        mainAction: MainAction(
            'Buy',
            () => print('Thanks! You have just bought me a coffee!'),
        ),
    ),
)
```
