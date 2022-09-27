# # load data from Terraform output
#content = inspec.profile.file("outputs.json.local")
#params = JSON.parse(content)
# Get outputs
#azurerm_storage_account_max_length = params['names']['value']['resource_type']['azurerm_storage_account']['length']
root_dir = ( os_env('ROOT_DIR').content() )
test_dir = ( os_env('TEST_DIR').content() )
file =root_dir + '/' + test_dir + '/inspec-tests/files/outputs.json.local'

title "OTC Inspec Test"

control 'Cloud Region' do
  impact 1.0
title "Check Input from example deployment."
desc "Check necessary Input parameter CLOUD_REGION"
  describe input('CLOUD_REGION') do    # This line reads the value of the input
    it { should be_in ['eu-central-1', 'westeurope'] }
  end
end

control 'Terraform local outputs' do
  impact 1.0
title "Check Local Outputs from commons module from deployment."
desc "Check  Outputs"
  describe json(file) do  # This line reads outputs from terraform
      its(['locals','value','seperator']) { should eq '-' }
      its(['locals','value','local','customer_prefix']) { should eq 'cgbp' }
      its(['locals','value','local','env']) { should eq 'tst' }
      its(['locals','value','local','custom_name']) { should eq '' }
      its(['locals','value','local','app_name']) { should eq 'simple' }
      its(['locals','value','local','product_id']) { should eq 'swp-3397' }
      its(['locals','value','local','application']) { should eq 'appd-304118' }
      its(['locals','value','local','costcenter']) { should eq '1884' }
  end
end

control 'Azure critical Names' do
  impact 1.0
title "Check Azure critical Names from output."
desc "Check  Outputs"
  describe json(file) do  # This line reads outputs from terraform
    its(['names','value','resource_type','azurerm_storage_account','name']) { should match /^[a-z0-9]{,24}$/ }
    its(['names','value','resource_type','azurerm_key_vault','name']) { should match /^[a-zA-Z0-9_-]{,24}$/ }
  end
end

control 'AWS critical Names' do
  impact 1.0
title "Check AWS critical Names from output."
desc "Check  Outputs"
  describe json(file) do  # This line reads outputs from terraform
    its(['names','value','resource_type','aws_lb','name']) { should match /^[a-zA-Z0-9_-]{,32}$/ }
    its(['names','value','resource_type','aws_lb_target_group','name']) { should match /^[a-zA-Z0-9_-]{,32}/ }
  end
end