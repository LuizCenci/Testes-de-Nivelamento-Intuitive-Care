<script setup>
import { ref } from "vue";

const key = ref("");
const operadoras = ref([]);
const erro = ref("");

const buscar_operadoras = async () => {
  if (!key.value.trim()) {
    erro.value = "Digite um termo de busca.";
    operadoras.value = [];
    return;
  }

  erro.value = "";
  try {
    const response = await fetch(`http://127.0.0.1:8000/buscar-operadoras/?q=${key.value}`);
    const data = await response.json();
    operadoras.value = data;
    
    if (operadoras.value.length === 0) {
      erro.value = "Nenhuma operadora encontrada.";
    }
  } catch (error) {
    erro.value = "Erro ao buscar operadoras.";
    console.error(error);
  }
};
</script>

<template>
  <div >
    <input v-model="key" placeholder="Digite o nome da operadora" />
    <button @click="buscar_operadoras">Buscar</button>

    <p v-if="erro">{{ erro }}</p>

    <table v-if="operadoras.length > 0">
      <thead>
        <tr>
          <th>Registro ANS</th>
          <th>Nome Fantasia</th>
          <th>CNPJ</th>
          <th>Modalidade</th>
          <th>UF</th>
          <th>Cidade</th>
          <th>Telefone</th>
          <th>Email</th>
        </tr>
      </thead>  
      <tbody>
        <tr v-for="op in operadoras" :key="op.registro_ans">
          <td>{{ op.registro_ans }}</td>
          <td>{{ op.nome_fantasia }}</td>
          <td>{{ op.cnpj }}</td>
          <td>{{ op.modalidade }}</td>
          <td>{{ op.uf }}</td>
          <td>{{ op.cidade }}</td>
          <td>{{ op.telefone }}</td>
          <td>{{ op.endereco_eletronico}}</td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<style scoped>
    input {
        padding: 8px;
        width: 60%;
        margin-right: 8px;
        border-radius: 10px;
    }
</style>