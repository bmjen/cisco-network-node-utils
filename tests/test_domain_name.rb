#
# Minitest for DomainName class
#
# Copyright (c) 2014-2015 Cisco and/or its affiliates.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require File.expand_path('../ciscotest', __FILE__)
require File.expand_path('../../lib/cisco_node_utils/domain_name', __FILE__)

# TestDomainName - Minitest for DomainName node utility.
class TestDomainName < CiscoTestCase
  def setup
    # setup runs at the beginning of each test
    super
    no_domainname_test_xyz
  end

  def teardown
    # teardown runs at the end of each test
    no_domainname_test_xyz
    super
  end

  def no_domainname_test_xyz
    # Turn the feature off for a clean test.
    config('no ip domain-name test.xyz')
  end

  # TESTS

  def test_domainname_create_destroy
    name = 'test.xyz'
    refute_includes(Cisco::DomainName.domainnames, name)

    domain = Cisco::DomainName.new(name)
    assert_includes(Cisco::DomainName.domainnames, name)
    assert_equal(Cisco::DomainName.domainnames[name], domain)

    domain.destroy
    refute_includes(Cisco::DomainName.domainnames, name)
  end
end
