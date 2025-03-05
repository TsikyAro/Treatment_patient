<template>
  <AppHeader @languageChanged="updateLanguage" />
  <PatientTreatment :selectedLang="selectedLang" />
</template>

<script setup>
import { ref } from 'vue'
import AppHeader from '@/components/AppHeader.vue'
import PatientTreatment from '@/components/PatientTreatment.vue'

const selectedLang = ref('fr')


const updateLanguage = (lang) => {
  selectedLang.value = lang
}
</script>
