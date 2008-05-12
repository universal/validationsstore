# Abstract Class to store the Validations of a Model in a Hash, to be able to access them later
# needs to be dried up, and converted to a module
class ValidationsStore < ActiveRecord::Base
  self.abstract_class = true
  VALIDATIONS = {}
  
  # stores the validations in a hash
  def self.store_validations(key, attributes)
    options = attributes.extract_options!.symbolize_keys
    attributes.each do |attr| 
      VALIDATIONS[attr] = {} unless VALIDATIONS[attr]
      VALIDATIONS[attr][key] = options
    end
  end 
  
  def self.validates_acceptance_of_with_storage(*attr_names)
    self.store_validations(:acceptance, attr_names.clone)
    self.validates_acceptance_of_without_storage(*attr_names)
  end
  
  def self.validates_associated_with_storage(*attr_names)
    self.store_validations(:associated, attr_names.clone)
    self.validates_associated_with_storage(*attr_names)
  end
  
  def self.validates_confirmation_of_with_storage(*attr_names)
    self.store_validations(:confirmation, attr_names.clone)
    self.validates_confirmation_of_without_storage(*attr_names)
  end
  
  def self.validates_exclusion_of_with_storage(*attr_names)
    self.store_validations(:exclusion, attr_names.clone)
    self.validates_exclusion_of_without_storage(*attr_names) 
  end
  
  def self.validates_format_of_with_storage(*attr_names)
    self.store_validations(:format, attr_names.clone)
    self.validates_format_of_without_storage(*attr_names)
  end
  
  def self.validates_inclusion_of_with_storage(*attr_names)
    self.store_validations(:inclusion, attr_names.clone)
    self.validates_inclusion_of_without_storage(*attr_names)
  end
  
  def self.validates_length_of_with_storage(*attr_names)
    self.store_validations(:length, attr_names.clone)
    self.validates_length_of_without_storage(*attr_names)
  end
  
  def self.validates_numericality_of_with_storage(*attr_names)
    self.store_validations(:numericality, attr_names.clone)
    self.validates_numericality_of_without_storage(*attr_names)
  end
  
  def self.validates_presence_of_with_storage(*attr_names)
    self.store_validations(:presence, attr_names.clone)
    self.validates_presence_of_without_storage(*attr_names)
  end
  
  def self.validates_uniqueness_of_with_storage(*attr_names)
    self.store_validations(:uniqueness, attr_names.clone)
    self.validates_uniqueness_of_without_storage(*attr_names)
  end
  
  class << self
    alias_method_chain :validates_acceptance_of, :storage
    alias_method_chain :validates_confirmation_of, :storage
    alias_method_chain :validates_exclusion_of, :storage
    alias_method_chain :validates_format_of, :storage
    alias_method_chain :validates_inclusion_of, :storage
    alias_method_chain :validates_length_of, :storage
    alias_method_chain :validates_numericality_of, :storage
    alias_method_chain :validates_presence_of, :storage
    alias_method_chain :validates_associated, :storage
    alias_method_chain :validates_uniqueness_of, :storage
    # Alias for #validates_length_of
    # realias method, since it points to the old one without storage :)
    alias_method :validates_size_of, :validates_length_of   
  end
  
  def self.validations
    VALIDATIONS
  end
end



#validates_acceptance_of
#validates_associated
#validates_confirmation_of
#validates_exclusion_of
#validates_format_of
#validates_inclusion_of
#validates_length_of
#validates_numericality_of
#validates_presence_of
#validates_size_of   Alias for #validates_length_of
#validates_uniqueness_of

#%w{alidates_acceptance_of validates_associated validates_confirmation_of validates_exclusion_of validates_format_of validates_inclusion_of validates_length_of validates_numericality_of validates_presence_of validates_size_of validates_uniqueness_of}
