<template>
    <div class="container mt-4">
      <h2>Liste des Traitements</h2>
  
      <!-- Sélecteur de langue -->
      <div class="mb-3">
        <label for="langSelect" class="form-label">Choisir une langue :</label>
        <select v-model="selectedLang" class="form-select" @change="updateTreatments">
          <option value="fr">Français</option>
          <option value="en">English</option>
          <option value="mg">Malagasy</option>
        </select>
      </div>
  
    

    <div class="mb-3">
        <label for="treatmentSelect" class="form-label">Traitements :</label>
        <select v-model="selectedTreatment" class="form-select">
            <option value="">Choisir un traitement</option>
            <option v-for="treatment in filteredTreatments" :key="treatment.id" :value="treatment.id">
            {{ treatment.name }}
            </option>
            <option v-if="filteredTreatments.length === 0" disabled>
            Aucun traitement disponible
            </option>
        </select>
    </div>
    <div class="mb-3">
        <label for="treatmentSelect" class="form-label">Nom Patient</label>
        <input type="text" class="form-control"  v-model="name" placeholder="ex:Rakoto">
    </div>
        <button class="btn btn-primary" type="button" @click="sendData">Valider</button>

    </div>
  </template>
  
  <script setup>
  import { ref, computed, onMounted } from 'vue'
  import { fetchTreatments } from '@/services/api.js'
  
  // Variables réactives
  const treatments = ref([])         
  const selectedLang = ref('fr')      
  const selectedTreatment = ref('')  
  const name = ref('')
  

  onMounted(async () => {
    treatments.value = await fetchTreatments("traitements#index")

    console.log(treatments.value);
  })
  
  const filteredTreatments = computed(() => {
    return treatments.value.map(treatment => ({
      id: treatment.id,
      name: treatment.nomtraitement[selectedLang.value] || treatment.nomtraitement['en'] || "Non disponible"
    }))
  })

  const sendData =()=>{
    console.log(name.value);
    console.log(selectedTreatment.value);
  }
  
  // Mettre à jour la liste lors du changement de langue
  const updateTreatments = () => {
    console.log(`Langue sélectionnée : ${selectedLang.value}`)
    console.log(`data : ${treatments.value  }`)
  }
  </script>
  