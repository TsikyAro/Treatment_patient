import axios from 'axios'

export const fetchTreatments = async () => {
  try {
    const response = await axios.get(`http://127.0.0.1:3000/api/v1/traitements#index `) 
    return response.data
  } catch (error) {
    console.error("Erreur lors du chargement des traitements :", error)
    return []
  }
}

export const checkPatientAPI = async (phoneNumber) => {
    try {
      const response = await axios.post('http://127.0.0.1:3000/api/v1/patients/check_patient', { numerotelephone: phoneNumber })
      return response.data
    } catch (error) {
      return { patient: null }
    }
  }
  
export const addPatientTreatment = async (phoneNumber, patientName, treatmentId) => {
    try {
        await axios.post('http://127.0.0.1:3000/api/v1/patient_traitements', {
        numerotelephone: phoneNumber,
        nomPatient: patientName,
        idtraitement: treatmentId
        })
    } catch (error) {
        console.error("Erreur lors de l'ajout du traitement :", error)
    }
}
