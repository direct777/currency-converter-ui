<template>
  <div class="currency-converter">
    <h2>Currency Converter</h2>
    
    <div v-if="errorMessage" class="error">{{ errorMessage }}</div>
    <div v-if="loading" class="loading">Converting...</div>

    <form @submit.prevent="convertCurrency">
      <div class="form-row">
        <label for="source">Source Currency:</label>
        <input type="text" id="source" v-model="source" placeholder="USD">
      </div>

      <div class="form-row">
        <label for="target">Target Currency:</label>
        <input type="text" id="target" v-model="target" placeholder="EUR">
      </div>

      <div class="form-row">
        <label for="value">Amount:</label>
        <input type="number" id="value" v-model="value" placeholder="Amount to convert">
      </div>

      <div class="form-row">
        <label for="locale">Locale (Optional):</label>
        <input type="text" id="locale" v-model="locale" placeholder="Locale (e.g., en-US)">
      </div>

      <button type="submit" :disabled="loading">Convert</button>
    </form>

    <div v-if="convertedResult" class="result">
      <h3>Converted Result:</h3>
      <p>{{ convertedResult }}</p>
    </div>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data() {
    return {
      source: '',
      target: '',
      value: '',
      locale: '',
      convertedResult: '',
      loading: false,
      errorMessage: ''
    };
  },
  methods: {
    async convertCurrency() {
      this.errorMessage = '';
      this.loading = true;

      try {
        const response = await axios.get('http://localhost:8080/api/currency/convert', {
          params: {
            source: this.source,
            target: this.target,
            value: this.value,
            locale: this.locale || 'en-US'
          }
        });

        this.convertedResult = response.data;
      } catch (error) {
        this.errorMessage = 'Error during currency conversion: ' + error.response?.data || error.message;
      } finally {
        this.loading = false;
      }
    }
  }
};
</script>

<style scoped>
.currency-converter {
  max-width: 400px;
  margin: 0 auto;
  padding: 20px;
  border-radius: 8px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  background-color: #f9f9f9;
}

.currency-converter h2 {
  text-align: center;
  margin-bottom: 20px;
}

form {
  display: flex;
  flex-direction: column;
}

.form-row {
  display: flex;
  justify-content: flex-start; /* Align everything to the start (left) */
  align-items: flex-start; /* Align items to the top */
  margin-bottom: 10px;
}

form label {
  margin-bottom: 5px;
  font-weight: bold;
  text-align: left;  /* Ensures the label text is aligned to the left */
  width: 150px; /* All labels will have the same width */
}

form input {
  padding: 10px;
  font-size: 16px;
  border: 1px solid #ccc;
  border-radius: 4px;
  flex-grow: 1; /* Input takes the remaining space */
  width: auto; /* Prevent input from shrinking */
}

button {
  padding: 10px;
  background-color: #42b983;
  color: white;
  border: none;
  border-radius: 4px;
  font-size: 16px;
  cursor: pointer;
  width: 100%;
}

button:disabled {
  background-color: #ccc;
}

.result {
  margin-top: 20px;
  text-align: center;
}

.error {
  color: red;
  margin-bottom: 10px;
}

.loading {
  text-align: center;
}

</style>
