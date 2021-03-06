#
# Copyright (C) 2016 Red Hat Inc. <licensing@redhat.com>
#
# Author: Alex Schultz <aschultz@redhat.com>
#
# Licensed under the Apache License, Version 2.0 (the "License"); you may
# not use this file except in compliance with the License. You may obtain
# a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
# License for the specific language governing permissions and limitations
# under the License.
#
require 'spec_helper'

describe 'contrail::service_token' do
  shared_examples 'contrail::service_token' do
    context 'with default parameters' do
      it { is_expected.to contain_class('contrail::service_token') }
      it { is_expected.to contain_file('/etc/contrail/service.token').with(
        :ensure => 'file',
        :content => '', )
      }
    end

    context 'with a service token' do
      let (:params) do
        { :keystone_service_token => 'atoken' }
      end
      it { is_expected.to contain_file('/etc/contrail/service.token').with(
        :ensure => 'file',
        :content => 'atoken', )
      }
    end

  end

  on_supported_os.each do |os, facts|
    it_behaves_like 'contrail::service_token'
  end
end
