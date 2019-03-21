require 'spec_helper'

describe Faf::Forks, vcr: { cassette_name: 'github/dblock/fue/forks' } do
  let(:repo) { Faf::Repo.new('dblock/fue') }
  let(:forks) { repo.forks }
  let(:first_fork) { forks.first }
  it 'finds all forks' do
    expect(forks.count).to eq 2
  end
  it 'sorts forks by pushed_at' do
    expect(first_fork).to be_a Faf::Repo
    expect(first_fork.owner).to eq 'zacklayton'
    expect(first_fork.name).to eq 'fue'
    expect(first_fork.pushed_at).to eq Time.parse('2018-09-01 14:38:07 UTC')
  end
end
