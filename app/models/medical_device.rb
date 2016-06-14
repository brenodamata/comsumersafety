class MedicalDevice < ApplicationRecord
  belongs_to :category, optional: true
  has_many :recalls, as: :recallable

  def self.import data_set
    import_event data_set["classification"]
    import_label data_set["recall"]
    import_label data_set["registrationlisting"]
    import_label data_set["pma"]
    import_label data_set["event"]
  end

  # Returns true/false if successful/not
  def self.process data, type
    case type
    when "enforcement"
      return self.process_enforcemnt data
    when "classification"
        return self.process_classification data
    when "recall"
      return self.process_recall data
    when "registrationlisting"
      return self.process_registrationlisting data
    when "pma"
      return self.process_pma data
    when "event"
      return self.process_event data
    else
      return false # TODO: implement a failsafe
    end
  end

  # Reads and input Json formatted data about Device Enforcements
  # Return true/false if successful/not
  def self.process_enforcemnt data
    # data in json format
  end

  # Reads and input Json formatted data about Device Classification
  # Return true/false if successful/not
  def self.process_classification data
    # data in json format
  end

  # Reads and input Json formatted data about Device Recall
  # Return true/false if successful/not
  def self.process_recall data
    # data in json format
  end

  # Reads and input Json formatted data about Device Registration Listing
  # Return true/false if successful/not
  def self.process_registrationlisting data
    # data in json format
  end

  # Reads and input Json formatted data about Device PMA
  # Return true/false if successful/not
  def self.process_pma data
    # data in json format
  end

  # Reads and input Json formatted data about Device Events
  # Return true/false if successful/not
  def self.process_event data
    # data in json format
  end
end

# classification
"results": [
  {
    "definition": "",
    "implant_flag": "N",
    "review_code": "",
    "gmp_exempt_flag": "N",
    "third_party_flag": "Y",
    "regulation_number": "866.3870",
    "device_class": "1",
    "openfda": {},
    "medical_specialty": "MI",
    "device_name": "Antigen, Cf, T. Cruzi",
    "life_sustain_support_flag": "N",
    "review_panel": "MI",
    "submission_type_id": "1",
    "medical_specialty_description": "Microbiology",
    "product_code": "GNF",
    "unclassified_reason": ""
  },

# recall
"results": [
  {
    "event_date_terminated": "2007-01-29",
    "firm_fei_number": "2022180",
    "openfda": {
      "regulation_number": "864.1860",
      "fei_number": [
        "2022180"
      ],
      "device_name": "Immunohistochemistry Reagents And Kits",
      "device_class": "1",
      "medical_specialty_description": "Hematology",
      "registration_number": [
        "2022180"
      ]
    },
    "res_event_number": "33957",
    "other_submission_description": "",
    "k_numbers": [],
    "product_res_number": "Z-0318-2006",
    "product_code": "NJT",
    "root_cause_description": "Process Control",
    "pma_numbers": []
  },

# registrationlisting
"results": [
  {
    "pma_number": "",
    "proprietary_name": [],
    "products": [
      {
        "created_date": "2007-10-05",
        "product_code": "GEI",
        "openfda": {
          "regulation_number": "878.4400",
          "medical_specialty_description": "General, Plastic Surgery",
          "device_class": "2",
          "device_name": "Electrosurgical, Cutting & Coagulation & Accessories"
        },
        "owner_operator_number": "9910100",
        "exempt": ""
      }
    ],
    "k_number": "K945760",
    "establishment_type": [
      "Manufacture Medical Device"
    ],
    "registration": {
      "iso_country_code": "US",
      "city": "Clearwater",
      "initial_importer_flag": "Y",
      "name": "BOVIE MEDICAL CORPORATION",
      "status_code": "1",
      "zip_code": "33760",
      "fei_number": "3007593903",
      "postal_code": "",
      "reg_expiry_date_year": "2016",
      "owner_operator": {
        "contact_address": {
          "iso_country_code": "US",
          "city": "Clearwater",
          "state_province": "",
          "postal_code": "33760",
          "address_1": "5115 ULMERTON ROAD",
          "address_2": "--",
          "state_code": "FL"
        },
        "owner_operator_number": "9910100",
        "official_correspondent": {},
        "firm_name": "BOVIE MEDICAL CORPORATION"
      },
      "us_agent": {},
      "state_code": "FL",
      "address_line_2": "--",
      "registration_number": "3007593903",
      "address_line_1": "5115 Ulmerton Road"
    }
  },

# pma
"results": [
  {
    "applicant": "Nuvectra Corporation",
    "supplement_number": "",
    "fed_reg_notice_date": "2015-11-30",
    "decision_date": "2015-11-20",
    "product_code": "LGW",
    "city": "BLAINE",
    "zip": "55449",
    "pma_number": "P130028",
    "generic_name": "STIMULATOR, SPINAL-CORD, TOTALLY IMPLANTED FOR PAIN RELIEF",
    "openfda": {
      "regulation_number": "",
      "fei_number": [
        "2024311",
        "3009380063",
        "3007014520",
        "1000132370",
        "2017865",
        "3005700659",
        "3007826630",
        "3007566237",
        "2183787",
        "1627487",
        "3009265194",
        "3000203466",
        "3011874692",
        "3006630150",
        "3004209178",
        "3006705815",
        "1000514656",
        "3010309840",
        "3010326622",
        "3008514029",
        "3009920161",
        "2182207",
        "2649622"
      ],
      "device_name": "Stimulator, Spinal-Cord, Totally Implanted For Pain Relief",
      "device_class": "3",
      "medical_specialty_description": "Unknown",
      "registration_number": [
        "2024311",
        "3009380063",
        "3007014520",
        "1056553",
        "2133641",
        "2135338",
        "2017865",
        "3006705815",
        "3007826630",
        "3007566237",
        "2183787",
        "1627487",
        "3009265194",
        "3011874692",
        "3006630150",
        "3004209178",
        "1422634",
        "3010309840",
        "3010326622",
        "3008514029",
        "3009920161",
        "2182207",
        "2649622"
      ]
    },
    "state": "MN",
    "date_received": "2013-12-16",
    "trade_name": "ALGOVITA SPINAL CORD STIMULATION SYSTEM",
    "expedited_review_flag": "N",
    "supplement_reason": "",
    "advisory_committee_description": "Neurology",
    "zip_ext": "",
    "street_1": "10675 NAPLES STREET NE",
    "street_2": "",
    "docket_number": "15M-4434",
    "decision_code": "APPR",
    "advisory_committee": "NE",
    "supplement_type": "",
    "ao_statement": "APPROVAL FOR THE ALGOVITA SPINAL CORD STIMULATION SYSTEM. THIS DEVICE IS INDICATED AS AN AID IN THE MANAGEMENT OF CHRONIC INTRACTABLE PAIN OF THE TRUNK AND/OR LIMBS, INCLUDING UNILATERAL OR BILATERAL PAIN ASSOCIATED WITH FAILED BACK SURGERY SYNDROME, INTRACTABLE LOW BACK PAIN AND LEG PAIN."
  },

# event
"results": [
  {
    "manufacturer_contact_t_name": "",
    "manufacturer_g1_name": "MEDTRONIC SOFAMOR DANEK USA, INC.",
    "number_patients_in_event": "",
    "manufacturer_g1_city": "MEMPHIS",
    "event_type": "Injury",
    "manufacturer_city": "MEMPHIS",
    "report_number": "1030489-2008-00011",
    "patient": [
      {
        "patient_sequence_number": "1",
        "sequence_number_treatment": "",
        "sequence_number_outcome": [
          "1. R"
        ]
      }
    ],
    "product_problem_flag": "N",
    "manufacturer_country": "US",
    "manufacturer_g1_address_2": "",
    "manufacturer_g1_address_1": "4340 SWINNEA RD.",
    "distributor_zip_code": "",
    "device_date_of_manufacturer": "",
    "distributor_address_2": "",
    "manufacturer_contact_city": "MEMPHIS",
    "single_use_flag": "Y",
    "manufacturer_contact_plocal": "9013963133",
    "event_location": "",
    "manufacturer_contact_address_2": "",
    "manufacturer_g1_state": "TN",
    "manufacturer_contact_phone_number": "9013",
    "manufacturer_name": "MEDTRONIC SOFAMOR DANEK USA, INC.",
    "distributor_address_1": "",
    "manufacturer_contact_extension": "",
    "report_source_code": "Manufacturer report",
    "distributor_state": "",
    "remedial_action": "",
    "number_devices_in_event": "",
    "manufacturer_contact_zip_ext": "",
    "manufacturer_contact_exchange": "901",
    "manufacturer_g1_zip_code_ext": "",
    "mdr_text": [
      {
        "patient_sequence_number": "1",
        "text": "NEITHER THE DEVICE NOR FILMS OF APPLICABLE IMAGING STUDIES WERE RETURNED TO THE MFR FOR EVAL. THEREFORE, WE ARE UNABLE TO DETERMINE THE DEFINITIVE CAUSE OF THE REPORTED EVENT.",
        "text_type_code": "Additional Manufacturer Narrative",
        "mdr_text_key": "4304810"
      },
      {
        "patient_sequence_number": "1",
        "text": "VIA THE SPINE JOURNAL (2007) IN AN ARTICLE ENTITLED \"NEUROLOGIC IMPAIRMENT FROM ECTOPIC BONE IN THE LUMBAR CANAL: A POTENTIAL COMPLICATION OF OFF-LABEL PLIF/TLIF USE OF BONE MORPHOGENETIC PROTEIN-2 (BMP-2)\" THAT A PT WHO HAD UNDERGONE THREE-LEVEL L3-S1 TLIF USING RHBMP-2/ACS WITH INTERBODY CONSTRUCTS ULTIMATELY DEVELOPED UNANTICIPATED POST-OP PAIN. AN MRI OR CT WAS PERFORMED APPROX SEVEN MONTHS POST-OP THAT FOUND UNANTICIPATED BONE GROWTH INTO THE SPINAL CANAL AT L5/S1. A SURGICAL INTERVENTION WAS REPORTEDLY PERFORMED AT AN UNKNOWN TIME POST-OP TO RESECT THE HETEROTOPIC BONE GROWTH AND DECOMPRESS THE AFFECTED NEURAL STRUCTURES. THE DURA OF THE NERVE ROOTS WAS REPORTEDLY ADHERED TO THE SURFACE OF THE RESECTED BONE. THE EXTERIOR SHELL OF THE BONE FORMATION WAS 1-2 MM THICK, HARD AND WELL CORTICATED, BUT THE INNER TISSUES WERE SOFTER, MORE CANCELLOUS OR CARTILAGINOUS TISSUE THAT OOZED A SMALL AMOUNT OF BLOOD. THE PT REPORTEDLY EXPERIENCED AT LEAST PARTIAL IMPROVEMENT IN HER CORRESPONDING RADICULAR PAIN POST-OPERATIVELY.",
        "text_type_code": "Description of Event or Problem",
        "mdr_text_key": "4304818"
      }
    ],
    "reprocessed_and_reused_flag": "N",
    "type_of_report": [
      "Initial submission"
    ],
    "manufacturer_zip_code_ext": "",
    "manufacturer_contact_country": "US",
    "health_professional": "Y",
    "manufacturer_contact_area_code": "901",
    "event_key": "",
    "manufacturer_g1_zip_code": "38118",
    "manufacturer_g1_country": "US",
    "manufacturer_contact_pcity": "90139631",
    "mdr_report_key": "975468",
    "distributor_city": "",
    "date_report": "20071210",
    "manufacturer_zip_code": "38118",
    "manufacturer_contact_l_name": "DESROCHERS",
    "manufacturer_g1_postal_code": "38118",
    "previous_use_code": "U",
    "manufacturer_contact_f_name": "DEBORAH",
    "manufacturer_address_1": "4340 SWINNEA RD.",
    "manufacturer_contact_address_1": "1800 PYRAMID PLACE",
    "manufacturer_contact_state": "TN",
    "manufacturer_address_2": "",
    "manufacturer_state": "TN",
    "distributor_name": "",
    "reporter_occupation_code": "PHYSICIAN",
    "source_type": [
      "Literature"
    ],
    "date_manufacturer_received": "20071210",
    "device": [
      {
        "lot_number": "UNK",
        "manufacturer_d_country": "US",
        "manufacturer_d_zip_code_ext": "",
        "manufacturer_d_postal_code": "",
        "baseline_510_k__exempt_flag": "",
        "device_operator": "HEALTH PROFESSIONAL",
        "generic_name": "INFUSE BONE GRAFT",
        "openfda": {
          "regulation_number": "",
          "medical_specialty_description": "Unknown",
          "device_class": "3",
          "device_name": "Filler, Recombinant Human Bone Morphogenetic Protein, Collagen Scaffold With Metal Prosthesis, Osteoinduction"
        },
        "model_number": "NA",
        "device_event_key": "944944",
        "device_evaluated_by_manufacturer": "R",
        "manufacturer_d_zip_code": "38118",
        "baseline_510_k__flag": "",
        "device_sequence_number": "1",
        "device_age_text": "DA",
        "brand_name": "INFUSE BONE GRAFT",
        "baseline_510_k__number": "",
        "manufacturer_d_state": "TN",
        "other_id_number": "NA",
        "implant_flag": "N",
        "manufacturer_d_address_2": "",
        "catalog_number": "UNK",
        "manufacturer_d_address_1": "4340 SWINNEA RD.",
        "manufacturer_d_city": "MEMPHIS",
        "manufacturer_d_name": "MEDTRONIC SOFAMOR DANEK USA, INC.",
        "device_availability": "No",
        "date_removed_flag": "B",
        "device_report_product_code": "NEK"
      }
    ],
    "report_to_manufacturer": "",
    "manufacturer_contact_zip_code": "38132",
    "manufacturer_link_flag": "Y",
    "adverse_event_flag": "Y",
    "report_to_fda": "",
    "removal_correction_number": "",
    "manufacturer_contact_postal_code": "38132",
    "distributor_zip_code_ext": "",
    "initial_report_to_fda": "Unknown",
    "manufacturer_postal_code": "38118",
    "manufacturer_contact_pcountry": ""
  },

# 510k
"results": [
  {
    "applicant": "SOLO-SLED, LLC.",
    "statement_or_summary": "Summary",
    "expedited_review_flag": "",
    "postal_code": "37404",
    "country_code": "US",
    "decision_date": "1997-04-21",
    "product_code": "IXA",
    "city": "CHATTANOOGA",
    "openfda": {
      "regulation_number": "892.1850",
      "fei_number": [
        "1219183",
        "3003768251",
        "3002707445",
        "3002532594",
        "3001451453",
        "3002375395",
        "3006115340",
        "1000114111",
        "3003775006",
        "3001722928",
        "3004475699",
        "1317267",
        "1825034",
        "1317307",
        "2443168",
        "3003772619",
        "3003343596"
      ],
      "device_name": "Cassette, Radiographic Film",
      "device_class": "2",
      "medical_specialty_description": "Radiology",
      "registration_number": [
        "1225677",
        "3003768251",
        "3002707445",
        "3002532594",
        "1054713",
        "3006115340",
        "3003775006",
        "3001722928",
        "9616389",
        "3004475699",
        "1317267",
        "1317307",
        "2443168",
        "3003343596",
        "1219183",
        "1825034",
        "9613151"
      ]
    },
    "date_received": "1997-01-10",
    "state": "TN",
    "address_1": "2413 VANCE AVE.",
    "advisory_committee_description": "Radiology",
    "review_advisory_committee": "RA",
    "third_party_flag": "N",
    "decision_description": "Substantially Equivalent",
    "decision_code": "SESE",
    "clearance_type": "Traditional",
    "device_name": "SOLO-SLED",
    "advisory_committee": "RA",
    "contact": "PATRICIA A RODDY",
    "k_number": "K970090",
    "address_2": "P.O.BOX 3718",
    "zip_code": "37404"
  },
