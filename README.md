# README

Salaries Calculator is a Rails api only that allows to calculate a team's players salary depending on individual and team goals.

| Nivel |Goles/mes|
| ------------- |:-------------:| 
|A |5|
|B |10|
|C |15|
|Cuauh |20|

* Ruby version
  - 2.6.3
  
* Rails version
  - 5.2.3

* System dependencies
  - Postgres

* Configuration
```ruby
  # first clone this project
  $ cd project
  $ bundle install
  $ rails db:setup && rails db:migrate
```

* How to run the test suite
```ruby
  # on your project dir
  $ rspec spec
```

* Run locally
```ruby
  $ rails s
```

* Make requests locally via curl
```
  curl -X GET \
    http://localhost:3000/api/v1/salaries \
    -H 'Content-Type: application/json' \
    -H 'Postman-Token: c05a9cfa-85bd-44fb-95b4-af19734bf17a' \
    -H 'cache-control: no-cache' \
    -d '[
      {
          "nombre": "Juan Perez",
          "nivel": "C",
          "goles": 10,
          "sueldo": 50000,
          "bono": 25000,
          "sueldo_completo": null,
          "equipo": "rojo"
      },
      {
          "nombre": "EL Cuauh",
          "nivel": "Cuauh",
          "goles": 30,
          "sueldo": 100000,
          "bono": 30000,
          "sueldo_completo": null,
          "equipo": "azul"
      },
      {
          "nombre": "Cosme Fulanito",
          "nivel": "A",
          "goles": 7,
          "sueldo": 20000,
          "bono": 10000,
          "sueldo_completo": null,
          "equipo": "azul"
      },
      {
          "nombre": "El Rulo",
          "nivel": "B",
          "goles": 9,
          "sueldo": 30000,
          "bono": 15000,
          "sueldo_completo": null,
          "equipo": "rojo"
      }
  ]'
```

* Make requests to heroku via curl
```
  curl -X GET \
    https://salaries-calculator.herokuapp.com/api/v1/salaries \
    -H 'Content-Type: application/json' \
    -H 'Postman-Token: 9fa46208-4a19-48a9-ab2d-920b4bf97b1c' \
    -H 'cache-control: no-cache' \
    -d '[
      {
          "nombre": "Juan Perez",
          "nivel": "C",
          "goles": 10,
          "sueldo": 50000,
          "bono": 25000,
          "sueldo_completo": null,
          "equipo": "rojo"
      },
      {
          "nombre": "EL Cuauh",
          "nivel": "Cuauh",
          "goles": 30,
          "sueldo": 100000,
          "bono": 30000,
          "sueldo_completo": null,
          "equipo": "azul"
      },
      {
          "nombre": "Cosme Fulanito",
          "nivel": "A",
          "goles": 7,
          "sueldo": 20000,
          "bono": 10000,
          "sueldo_completo": null,
          "equipo": "azul"
      },
      {
          "nombre": "El Rulo",
          "nivel": "B",
          "goles": 9,
          "sueldo": 30000,
          "bono": 15000,
          "sueldo_completo": null,
          "equipo": "rojo"
      }
  ]'
```

* [Heroku Project](https://salaries-calculator.herokuapp.com/api/v1/salaries)

* [Postman Collection](https://www.getpostman.com/collections/6d05643282fad8cafbce)
