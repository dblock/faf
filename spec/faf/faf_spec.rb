require 'spec_helper'

describe Faf do
  let(:faf) { File.expand_path(File.join(__FILE__, '../../../bin/faf')) }
  context 'forks' do
    describe 'default' do
      subject do
        Faf::Shell.system!(['ruby', %("#{faf}")].join(' '))
      end
      it 'displays help' do
        expect(subject).to include 'Find active GitHub forks.'
      end
      it 'displays version' do
        expect(subject).to include Faf::VERSION
      end
    end
    describe 'help' do
      subject do
        Faf::Shell.system!(['ruby', %("#{faf}"), 'help'].join(' '))
      end
      it 'displays help' do
        expect(subject).to include 'Find active GitHub forks.'
      end
    end
  end
end
