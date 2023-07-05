require 'spec_helper'
require_relative '../lib/caesar_cipher'

RSpec.describe CaesarCipher do
  describe 'caeser cipher project' do
    let(:object) { CaesarCipher.new }

    context 'when entering a positive key' do
      it 'returns the correct encrypted message respecting case' do
        result = object.encrypt('AbC', 5)
        expect(result).to eq('FgH')
      end

      it 'returns the correct encrypted message respecting case and looping from Z to A' do
        result = object.encrypt('xYz', 3)
        expect(result).to eq('aBc')
      end

      it 'returns the correct encrypted message respecting case and punctuation' do
        result = object.encrypt('Hello, World!', 10)
        expect(result).to eq('Rovvy, Gybvn!')
      end
    end

    context 'when entering a negative key' do
      it 'returns the correct encrypted message respecting case' do
        result = object.encrypt('FgH', -5)
        expect(result).to eq('AbC')
      end

      it 'returns the correct encrypted message respecting case and looping from A to Z' do
        result = object.encrypt('aBc', -3)
        expect(result).to eq('xYz')
      end

      it 'returns the correct encrypted message respecting case and punctuation' do
        result = object.encrypt('Rovvy, Gybvn!', -10)
        expect(result).to eq('Hello, World!')
      end
    end
  end
end
