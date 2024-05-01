# frozen_string_literal: true

require 'spec_helper'

describe 'pp_demo::config' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }
      let(:pre_condition) { 'include pp_demo::install' }

      it { is_expected.to compile }
      it {
        is_expected.to contain_file(
          '/etc/rsyslog.d/10_modules.conf',
        ).with(
          'ensure' => 'file',
          'owner'  => 'root',
          'group'  => 'root',
          'mode'   => '0640',
        ).that_requires(
          'Package[rsyslog]',
        ).that_notifies(
          'Service[rsyslog]',
        )
      }
    end
  end
end
