describe Greenin do
  it 'check default setting values' do
    expect(Greenin.entity_method_name).to eq 'entity'
    expect(Greenin.entity_class_name).to eq 'Entity'
  end
end
