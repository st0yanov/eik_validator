require 'spec_helper'

describe EikValidator do
  context 'default usage' do
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
end

describe 'ActiveModel EIK Validation' do
  class Validatable
    include ActiveModel::Model
    include ActiveModel::Validations

    attr_accessor :eik

    validates :eik, eik: true
  end

  subject { Validatable.new }

  context 'doesn\'t validate an invalid EIK' do
    before do
      subject.eik = '123456789'
      subject.valid?
    end

    it 'validation is invalid' do
      expect(subject).to be_invalid
    end

    it 'stores an error message' do
      expect(subject.errors[:eik]).not_to be_empty
    end
  end

  context 'validates a valid EIK' do
    before do
      subject.eik = '020469788'
      subject.valid?
    end

    it 'validation is valid' do
      expect(subject).to be_valid
    end

    it 'doesn\'t store any errors' do
      expect(subject.errors[:eik]).to be_empty
    end
  end
end
