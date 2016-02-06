require 'spec_helper'

describe EikValidator do
  it 'has a version number' do
    expect(EikValidator::VERSION).not_to be nil
  end

  it 'throws EikArgumentError' do
    expect { EikValidator.validate('12345678a') }.to raise_error(EikValidator::EikArgumentError)
  end

  it 'throws EikLengthError' do
    expect { EikValidator.validate('123456') }.to raise_error(EikValidator::EikLengthError)
  end

  it 'fails to validate an invalid 9-digit EIK' do
    expect(EikValidator.validate('123456789')).to be false
  end

  it 'fails to validate an invalid 13-digit EIK' do
    expect(EikValidator.validate('1234567891234')).to be false
  end

  it 'successfully validates valid 9-digit EIKs' do
    eiks = ['020469788', '201355508', '201968703']
    eiks.each do |eik|
      expect(EikValidator.validate(eik)).to be true
    end
  end

  it 'successfully validates valid 13-digit EIKs' do
    eiks = ['1213961230342']
    eiks.each do |eik|
      expect(EikValidator.validate(eik)).to be true
    end
  end
end
