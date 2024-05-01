# frozen_string_literal: true

require 'spec_helper'

describe 'pp_demo::install' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile }
      it { is_expected.to contain_package('rsyslog').only_with_ensure('installed') }
      it { is_expected.to contain_service('rsyslog').with('ensure' => 'running', 'enable' => 'true').that_requires('Package[rsyslog]') }
    end
  end
end
