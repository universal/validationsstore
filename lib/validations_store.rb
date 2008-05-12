module ValidationsStore
  def self.included(base)
    base.class_eval do
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
        # not needed, since it aliases to validates_numericality_of, which is realised..., true?
        # alias_method_chain :validates_size_of, :storage   
      end
    end
    base.extend(ClassMethods)
  end
  
  module ClassMethods
    def store_validations(key, attributes)
      VALIDATIONS[key] = {} unless VALIDATIONS[key]
      options = attributes.extract_options!
      attributes.each do |attr| 
        VALIDATIONS[key][attr] = options
      end
    end 
    
    def validates_acceptance_of_with_storage(*attr_names)
      self.store_validations(:acceptance, attr_names.clone)
      self.validates_acceptance_of_without_storage(*attr_names)
    end
    
    def validates_associated_with_storage(*attr_names)
      self.store_validations(:associated, attr_names.clone)
      self.validates_associated_with_storage(*attr_names)
    end
    
    def validates_confirmation_of_with_storage(*attr_names)
      self.store_validations(:confirmation, attr_names.clone)
      self.validates_confirmation_of_without_storage(*attr_names)
    end
    
    def validates_exclusion_of_with_storage(*attr_names)
      self.store_validations(:exclusion, attr_names.clone)
      self.validates_exclusion_of_without_storage(*attr_names) 
    end
    
    def validates_format_of_with_storage(*attr_names)
      self.store_validations(:format, attr_names.clone)
      self.validates_format_of_without_storage(*attr_names)
    end
    
    def validates_inclusion_of_with_storage(*attr_names)
      self.store_validations(:inclusion, attr_names.clone)
      self.validates_inclusion_of_without_storage(*attr_names)
    end
    
    def validates_length_of_with_storage(*attr_names)
      self.store_validations(:length, attr_names.clone)
      self.validates_length_of_without_storage(*attr_names)
    end
    
    def validates_numericality_of_with_storage(*attr_names)
      self.store_validations(:numericality, attr_names.clone)
      self.validates_numericality_of_without_storage(*attr_names)
    end
    
    def validates_presence_of_with_storage(*attr_names)
      self.store_validations(:presence, attr_names.clone)
      self.validates_presence_of_without_storage(*attr_names)
    end
    
    def validates_uniqueness_of_with_storage(*attr_names)
      self.store_validations(:uniqueness, attr_names.clone)
      self.validates_uniqueness_of_without_storage(*attr_names)
    end
    
    def validations
      VALIDATIONS
    end
  end
end


VALIDATIONS = {}





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
