# DDM – Dart Discord Markovifier
## 🇷🇺
Утилита, предназначенная для генерации [переходной матрицы](https://en.wikipedia.org/wiki/Stochastic_matrix) для цепи Маркова из массива сообщений с Дискорд-сервера.
Для того, чтобы выгрузить данные из дискорда, воспользуйтесь, например, этой программой: https://github.com/Tyrrrz/DiscordChatExporter.

### Использование
Разместите файл данных из Дискорда с названием `input.json` в корень проекта.<br>
Запустите скрипт командой<br>
`dart run bin\main.dart <userid>`, например, `dart run bin\main.dart 319482794478927872`.<br>
Обработанные данные появятся в `output.json`.
Затем их можно использовать для работы [бота](https://github.com/peaashmeter/markovbot).

🤍💙🤍
Нет войне!

## 🇺🇸
This is a script for generating a [transitive matrix](https://en.wikipedia.org/wiki/Stochastic_matrix) for a Markov chain using an array of messages from Discord.
You can use any other instruments to get a JSON with data. For example, take a look at this one: https://github.com/Tyrrrz/DiscordChatExporter.

### Usage
Put a file named `input.json` which contains data from Discord to the root of the project.<br>
Run the script using<br>
`dart run bin\main.dart <userid>` command, e.g. `dart run bin\main.dart 319482794478927872`.<br>
A file named `output.json` will be created.
Then you can use it for the [bot](https://github.com/peaashmeter/markovbot).

🤍💙🤍
Peace to Ukraine!
