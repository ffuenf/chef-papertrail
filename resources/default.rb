actions :add
default_action :add

attribute :name, kind_of: String, name_attribute: true
attribute :ruleset, kind_of: String
attribute :inputfilename, kind_of: String
attribute :inputfiletag, kind_of: String
attribute :inputfilepersiststateinterval, kind_of: Integer, default: 100
