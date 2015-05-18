module Constants
  SPECIALTIES = [
    { short_name: "acupuncturist", description: "Acupuncturist", payout_level: 4},
    { short_name: "allergist", description: "Allergist", payout_level: 4},
    { short_name: "anesthesiologist", description: "Anesthesiologist", payout_level: 2},
    { short_name: "cardiologist", description: "Cardiologist", payout_level: 4},
    { short_name: "cardiothoracic", description: "Cardiothoracic Surgeon", payout_level: 3},
    { short_name: "dermatologist", description: "Dermatologist", payout_level: 4},
    { short_name: "embryologist", description: "Embryologist", payout_level: 4},
    { short_name: "er_physician", description: "Emergency Room Physician", payout_level: 3},
    { short_name: "endocrinologist", description: "Endocrinologist", payout_level: 4},
    { short_name: "family", description: "Family Medicine", payout_level: 4},
    { short_name: "gastroeterologist", description: "Gastroenterologist", payout_level: 4},
    { short_name: "gp", description: "General Practicioner", payout_level: 4},
    { short_name: "geneticist", description: "Geneticist", payout_level: 4},
    { short_name: "geriatrician", description: "Geriatrician", payout_level: 4},
    { short_name: "gynecologist", description: "Gynecologist", payout_level: 3},
    { short_name: "hematologist", description: "Hematologist", payout_level: 3},
    { short_name: "hospitalist", description: "Hospitalist", payout_level: 3},
    { short_name: "immunologist", description: "Immunologist", payout_level: 4},
    { short_name: "internist", description: "Internist", payout_level: 4},
    { short_name: "invasive_cardio", description: "Invasive Cardiologist", payout_level: 4},
    { short_name: "naturopathic", description: "Naturopathic Physician", payout_level: 3},
    { short_name: "neonatologist", description: "Neonatologist", payout_level: 4},
    { short_name: "nephrologist", description: "Nephrologist", payout_level: 4},
    { short_name: "neurologist", description: "Neurologist", payout_level: 4},
    { short_name: "neurootologist", description: "Neuro-Otologist", payout_level: 4},
    { short_name: "nuclear", description: "Nuclear Medicine", payout_level: 4},
    { short_name: "obsterician", description: "Obsterician", payout_level: 3},
    { short_name: "occupational", description: "Occupational Medicine", payout_level: 4},
    { short_name: "oncologist", description: "Oncologist", payout_level: 4},
    { short_name: "opthalmologist", description: "Opthalmologist", payout_level: 4},
    { short_name: "orthopedist", description: "Orthopedist", payout_level: 3},
    { short_name: "osteopath", description: "Osteopath", payout_level: 4},
    { short_name: "otolaryngologist", description: "Otolarynologist", payout_level: 4},
    { short_name: "otologist", description: "Otologist", payout_level: 4},
    { short_name: "pain", description: "Pain Management", payout_level: 3},
    { short_name: "pathologist", description: "Pathologist", payout_level: 4},
    { short_name: "pediatrician", description: "Pediatrician", payout_level: 4},
    { short_name: "perfusionist", description: "Perfusionist", payout_level: 3},
    { short_name: "physiatrist", description: "Physiatrist/Physical Medicine", payout_level: 4},
    { short_name: "plastic", description: "Plastic Surgeon", payout_level: 3},
    { short_name: "proctologist", description: "Proctologist", payout_level: 3},
    { short_name: "psychiatrist", description: "Psychiatrist", payout_level: 3},
    { short_name: "pulmonologist", description: "Pulmonologist", payout_level: 3},
    { short_name: "radiologist", description: "Radiologist", payout_level: 4},
    { short_name: "rheumatologist", description: "Rheumatologist", payout_level: 4},
    { short_name: "surgeon", description: "Surgeon", payout_level: 3},
    { short_name: "thoracic", description: "Thoracic Surgeon", payout_level: 3},
    { short_name: "urologist", description: "Urologist", payout_level: 4}
  ]

  QUOTES_OFFSET = 28 #28 is the lowest age for these quotes, keeping the quotes in an array
  PAYOUTS = {
    3500 => 0,
    5000 => 1
  }
  PROFESSION_LEVEL_OFFSET = 2

  EDUCATION_LEVELS = {
    fellow: "Fellow",
    final_year: "Final Year Resident",
    resident: "Resident - Not in Final Year"
  }

  SCHOOLS = {
    ucsf: "UCSF",
    ucsf_fresno: "UCSF Fresno"
  }
end