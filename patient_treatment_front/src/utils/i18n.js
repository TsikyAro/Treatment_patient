
export function detectBrowserLanguage() {
    const browserLang = navigator.language || navigator.userLanguage 
    const shortLang = browserLang.split('-')[0]                   
    return ['fr', 'en', 'mg'].includes(shortLang) ? shortLang : 'fr'
}
  