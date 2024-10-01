# currency-converter-ui

## Project setup
```
npm install
```

### Compiles and hot-reloads for development
```
npm run serve
```

### Compiles and minifies for production
```
npm run build
```

### Lints and fixes files
```
npm run lint
```

### Customize configuration
See [Configuration Reference](https://cli.vuejs.org/config/).

### To Build and Run the Docker Image
```
docker build -t currency-converter-ui .
```

### run it and map the container port 8081 to your local machine
```
docker run -p 8081:8081 currency-converter-ui
```
![image](https://github.com/user-attachments/assets/fca6c74b-a547-498f-978f-8e6b30453f58)

### There is base_currency EUR for free account for https://swop.cx/rest/rates 
### There are direct and reverse rates are supported by the application.
```
[
  {
    "base_currency": "EUR",
    "quote_currency": "AED",
    "quote": 4.08906,
    "date": "2024-10-01"
  },
  {
    "base_currency": "EUR",
    "quote_currency": "AFN",
    "quote": 77.005751,
    "date": "2024-10-01"
  },
  {
    "base_currency": "EUR",
    "quote_currency": "ALL",
    "quote": 99.632592,
    "date": "2024-10-01"
  },
  {
    "base_currency": "EUR",
    "quote_currency": "AMD",
    "quote": 432.786742,
    "date": "2024-10-01"
  },
  {
    "base_currency": "EUR",
    "quote_currency": "ANG",
    "quote": 1.992185,
    "date": "2024-10-01"
  },
  {
    "base_currency": "EUR",
    "quote_currency": "AOA",
    "quote": 1067.946162,
    "date": "2024-10-01"
  },
  ```
