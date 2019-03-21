require 'spec_helper'

describe Faf::Shell do
  context '#system!' do
    it 'returns a zero error code' do
      expect(Faf::Shell.system!('echo OK')).to eq 'OK'
    end
    it 'returns a non zero error code' do
      expect do
        Faf::Shell.system!('exit 1')
      end.to raise_error RuntimeError, /exit code pid \d* exit 1/
    end
  end
end
