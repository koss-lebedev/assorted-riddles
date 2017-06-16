class Hash

  def flattened_keys
    Hash[*self.map { |key, value| flat_key_value(key, value) }.flatten]
  end

private

  def flat_key_value(key, value)
    if value.is_a?(Hash)
      value.map do |k, v|
        new_key = key.to_s + '_' + k.to_s
        new_key = :"#{new_key}" if key.is_a?(Symbol) && k.is_a?(Symbol)
        flat_key_value(new_key, v)
      end
    else
      [key, value]
    end
  end

end



require 'minitest/autorun'

describe 'Hash' do
  it 'flattens keys' do
    deep = {
        id: 1,
        info: {
            name: 'example',
            more_info: {
                count: 1
            }
        }
    }

    flat = deep.flattened_keys
    assert_equal flat, { id: 1, info_name: 'example', info_more_info_count: 1 }
  end
end