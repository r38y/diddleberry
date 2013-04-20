require 'spec_helper'

describe 'routing emails' do
  it { should route( :post, '/emails' ).
    to( controller: 'emails', action: 'create' ) }
  it { should route( :get, '/e/moo/remove' ).
    to( controller: 'emails', action: 'destroy', token: 'moo' ) }

  context 'named routes' do
    it { emails_path.should == '/emails' }
    it { remove_email_path('moo') == '/e/moo/remove'}
  end
end
