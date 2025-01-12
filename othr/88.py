import re
import os

# Путь к файлу, который нужно преобразовать
file_path = "test.md"

# Чтение исходного файла
with open(file_path, "r", encoding="utf-8") as file:
    content = file.read()

# Регулярное выражение для поиска wiki-ссылок
pattern = r'!\[\[([^|\]]+)(?:\|(\d+))?\]\]'

# Функция замены wiki-ссылок на markdown-ссылки
def convert_to_markdown(match):
    file_name = match.group(1).replace(" ", "%20")
    size = match.group(2)
    if size:
        return f"![{file_name}](attachments/{file_name})"
    else:
        return f"![{file_name}](attachments/{file_name})"

# Замена по регулярному выражению
new_content = re.sub(pattern, convert_to_markdown, content)

# Сохранение преобразованного файла
with open(file_path, "w", encoding="utf-8") as file:
    file.write(new_content)

print("Конвертация завершена!")