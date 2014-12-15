module Constants
  SPECIALTIES = [
    { short_name: "acupuncturist", description: "Acupuncturist", payout_level: 4},
    { short_name: "allergist", description: "Allergist", payout_level: 4},
    { short_name: "anesthesiologist", description: "Anesthesiologist", payout_level: 3},
    { short_name: "cardiologist", description: "Cardiologist", payout_level: 4},
    { short_name: "cardiothoracic", description: "Cardiothoracic Surgeon", payout_level: 3},
    { short_name: "dermatologist", description: "Dermatologist", payout_level: 4},
    { short_name: "embryologist", description: "Embryologist", payout_level: 4},
    { short_name: "er_physician", description: "Emergency Room Physician", payout_level: 3},
    { short_name: "endocrinologist", description: "Endocrinologist", payout_level: 4},
    { short_name: "family", description: "Family Medicine or Family Practicioner", payout_level: 4},
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
    { short_name: "otolaryngologist", description: "Otolarynologist Ear - Nose - Throat", payout_level: 4},
    { short_name: "otologist", description: "Otologist", payout_level: 4},
    { short_name: "pain", description: "Pain Management", payout_level: 3},
    { short_name: "pathologist", description: "Pathologist", payout_level: 4},
    { short_name: "pediatrician", description: "Pediatrician", payout_level: 4},
    { short_name: "perfusionist", description: "Perfusionist", payout_level: 3},
    { short_name: "physiatrist", description: "Physiatrist/Physical Medicine/Rehabilitation", payout_level: 4},
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
  LEVEL_2 = 0
  LEVEL_3 = 1
  LEVEL_4 = 2
  QUOTES = [
    [228.70, 313.30], [150.08, 204.61], [126.90, 172.80],
    [240.94, 329.72], [157.64, 214.86], [133.29, 181.47],
    [253.64, 326.87], [166.08, 226.23], [140.36, 190.99],
    [268.93, 366.81], [176.10, 239.45], [148.99, 202.39],
    [284.94, 387.76], [187.32, 254.16], [158.81, 215.28],
    [302.26, 410.27], [199.06, 269.60], [169.42, 229.27],
    [319.92, 433.27], [211.96, 287.47], [181.07, 244.53],
    [338.80, 457.69], [225.31, 303.96], [193.06, 260.27],
    [355.89, 480.42], [238.18, 321.11], [204.54, 275.58],
    [373.40, 503.66], [251.31, 338.58], [216.17, 291.07],
    [391.20, 527.22], [264.82, 356.50], [227.85, 306.54],
    [409.10, 550.85], [278.26, 374.29], [239.12, 321.47],
    [426.72, 574.08], [291.73, 392.06], [250.01, 335.82],
    [444.89, 597.17], [306.48, 411.02], [261.56, 350.59],
    [463.86, 621.21], [321.33, 429.97], [272.80, 364.86],
    [483.34, 645.77], [336.26, 448.91], [283.87, 378.79],
    [503.25, 670.76], [351.42, 468.04], [294.93, 392.62],
    [523.38, 695.85], [366.90, 487.46], [306.01, 406.36],
    [417.03, 594.26], [293.94, 418.41], [243.85, 346.86],
    [427.68, 609.47], [303.18, 431.61], [250.02, 366.67],
    [437.88, 624.05], [312.78, 445.33], [256.50, 364.93],
    [447.58, 637.89], [322.75, 459.57], [263.27, 374.59],
    [456.78, 651.04], [333.34, 474.71], [270.72, 385.24],
    [465.52, 663.54], [344.37, 490.46], [278.59, 396.49],
    [474.12, 675.82], [355.86, 506.87], [286.84, 408.27]

  ]
end