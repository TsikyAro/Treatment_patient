<template>
    <div class="container mt-4">
      <h2>Ajouter un traitement à un patient</h2>
  
      <!-- Numéro de téléphone -->
      <div class="mb-3">
        <label class="form-label">Numéro de téléphone :</label>
        <input v-model="phoneNumber" @blur="checkPatient" class="form-control" placeholder="Entrer le numéro" />
      </div>
  
      <!-- Nom du patient -->
      <div class="mb-3">
        <label class="form-label">Nom Patient</label>
        <input type="text" class="form-control" v-model="patientName" placeholder="ex: Rakoto" :disabled="patientExists" />
      </div>
  
      <!-- Sélecteur de traitement -->
      <div class="mb-3">
        <label class="form-label">Traitements :</label>
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
  
      <button class="btn btn-primary" @click="sendData">Valider</button>
    </div>
  </template>
  
  <script setup>
  import { ref, computed, watchEffect } from 'vue'
  import { fetchTreatments, checkPatientAPI, addPatientTreatment } from '@/services/api.js'
  
  const props = defineProps(['selectedLang']) 
  
  const treatments = ref([]) 
  const selectedTreatment = ref('')
  const phoneNumber = ref('')
  const patientName = ref('')
  const patientExists = ref(false)
  
  // Charger les traitements
  const loadTreatments = async () => {
    treatments.value = await fetchTreatments()
  }
  
  // Vérifie si le patient existe
  const checkPatient = async () => {
    if (!phoneNumber.value) return
    const response = await checkPatientAPI(phoneNumber.value)
    
    if (response.patient) {
      patientName.value = response.patient.nomPatient
      patientExists.value = true
    } else {
      patientExists.value = false
      patientName.value = ''
    }
  }
  
  // Filtrer les traitements par langue
  const filteredTreatments = computed(() => {
    return treatments.value.map(treatment => ({
      id: treatment.id,
      name: treatment.nomtraitement[props.selectedLang] || treatment.nomtraitement['en'] || "Non disponible"
    }))
  })
  
  // Associer un traitement à un patient
  const sendData = async () => {
    if (!phoneNumber.value || !selectedTreatment.value || !patientName.value) return
  
    await addPatientTreatment(phoneNumber.value, patientName.value, selectedTreatment.value)
    alert("Traitement ajouté avec succès")
  }
  
  // Mettre à jour les traitements si la langue change
  watchEffect(() => {
    loadTreatments()
  })
  </script>
  