require 'spec_helper'
require_relative '../lib/sub_strings'

RSpec.describe SubStrings do
  describe 'sub strings project' do
    let(:object) { SubStrings.new }

    context 'when entering lowercase letters' do
      it 'returns the correct hash for a small dictionary' do
        text = 'some valid lowercase text here for tests'
        dictionary = ['s', 'te']
        result = object.get_hash(text, dictionary)
        expect(result).to eq({ 's' =>  4, 'te' =>  2 })
      end

      it 'returns the correct hash for a large dictionary' do
        text = 'below'
        dictionary = ['below', 'down', 'go', 'going', 'horn', 'how', 'howdy', 'it', 'i', 'low', 'own', 'part', 'partner', 'sit']
        result = object.get_hash(text, dictionary)
        expect(result).to eq({ 'below' =>  1, 'low' =>  1 })
      end
    end

    context 'when entering lowercase and uppercase letters' do
      it 'returns the correct hash for a small dictionary' do
        text = 'Some lowercase valid text here for Tests'
        dictionary = ['s', 'te']
        result = object.get_hash(text, dictionary)
        expect(result).to eq({ 's' =>  4, 'te' =>  2 })
      end

      it 'returns the correct hash for a large dictionary' do
        text = "Howdy partner, sit down! How's it going?"
        dictionary = ['below', 'down', 'go', 'going', 'horn', 'how', 'howdy', 'it', 'i', 'low', 'own', 'part', 'partner', 'sit']
        result = object.get_hash(text, dictionary)
        expect(result).to eq({ 'down' =>  1, 'go' =>  1, 'going' =>  1, 'how' =>  2, 'howdy' =>  1, 'it' =>  2, 'i' =>  3, 'own' =>  1, 'part' =>  1, 'partner' =>  1, 'sit' =>  1 })
      end
    end
  end
end
