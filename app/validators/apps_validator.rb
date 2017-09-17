# frozen_string_literal: true

class AppsValidator < ActiveModel::Validator
  def validate app
    validate_data(app)
  end

  private
  def validate_data app
    data = app.data

    unless data
      app.errors.add(:data, "can't be empty") && return
    end

    unless data.is_a?(Hash)
      app.errors.add(:data, 'must be a hash') && return
    end

    errors = JSON::Validator.fully_validate(schema, data, strict: true)
    app.errors.add(:data, errors) && return if errors.present?

    if app.image.present? && !uri_compliant?(app.image)
      app.errors.add(:image, 'is not a valid HTTP URL')
    end

    unless uri_compliant?(app.link)
      app.errors.add(:link, 'is not a valid HTTP URL')
    end
  end

  def schema
    {
      'type' => 'object',
      'required' => %w[name image link category rank],
      'properties' => {
        'name' => { 'type' => 'string' },
        'image' => { 'type' => 'string' },
        'link' => { 'type' => 'string' },
        'category' => { 'type' => 'string' },
        'rank' => { 'type' => 'integer' }
      }
    }
  end

  def uri_compliant?(value)
    uri = URI.parse(value)
    uri.is_a?(URI::HTTP) && !uri.host.nil?
  rescue URI::InvalidURIError
    false
  end
end
