class ValidateMe < ValidationsStore
   
  validates_numericality_of :number_int, :integer_only => true, :less => 100
  validates_numericality_of :number_float, :message => "is not a float"
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates_size_of :email, :maximum => 99, :message => "email message"
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
