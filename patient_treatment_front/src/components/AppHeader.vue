<template>
  <div class="container mt-4">
    <div class="mb-3">
      <label for="langSelect" class="form-label">Choisir une langue :</label>
      <select v-model="selectedLang" class="form-select" @change="updateLanguage">
        <option value="fr">Français</option>
        <option value="en">English</option>
        <option value="mg">Malagasy</option>
      </select>
    </div>
  </div>
</template>

<script setup>
import { ref, defineEmits } from 'vue'

const selectedLang = ref('fr')
const emit = defineEmits(['languageChanged'])

const updateLanguage = () => {
  emit('languageChanged', selectedLang.value) 
}
</script>
