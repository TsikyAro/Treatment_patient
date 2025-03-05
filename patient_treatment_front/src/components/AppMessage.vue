<template>
    <div class="container mt-4">
      <h1>{{ t('message.hello') }}</h1>
      <p>{{ t('message.welcome') }}</p>
    </div>
  </template>
  
  <script setup>
  import { useI18n } from 'vue-i18n'
  import { fetchTranslations } from '@/services/api.js'
  import { watchEffect } from 'vue'
  
  const { t, locale, messages } = useI18n()

  const loadTranslations = async () => {
    console.log(locale.value);
    const data = await fetchTranslations("traitements#index");
    console.log(data);

    if (data) {
      messages.nomtraitement[locale.value] = data
    }
  }
  
  // Surveiller les changements de langue et charger les nouvelles traductions
  watchEffect(() => {
    loadTranslations()
  })
  </script>
  