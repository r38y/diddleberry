require 'spec_helper'

describe 'routing emails' do
  it { should route( :post, '/emails' ).
    to( controller: 'emails', action: 'create' ) }

  context 'named routes' do
    it { emails_path.should == '/emails' }
  end
end
