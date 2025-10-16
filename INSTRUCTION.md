ToDo App - Docker інструкція.

Посилання на репозиторій - https://hub.docker.com/r/spridoloba/todoapp

Застосунок працює на 8080-ому порті, та використовує айпі 0.0.0.0.
Наприклад:

docker run -p 8080:8080 --name todoapp todoapp:1.0.0