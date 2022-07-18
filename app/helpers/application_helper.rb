module ApplicationHelper
  def human_enum_name(modelname, enum_name, enum_value)
    I18n.t("activerecord.attributes.#{modelname.to_s.downcase}.#{enum_name.to_s.pluralize}.#{enum_value}")
  end
end
