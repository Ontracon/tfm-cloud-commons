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
      its(['locals','value','local','customer_prefix']) { should eq 'otc' }
      its(['locals','value','local','env']) { should eq 'tst' }
      its(['locals','value','local','custom_name']) { should eq '' }
      its(['locals','value','local','project']) { should eq 'common' }
      its(['locals','value','local','application']) { should eq '10-Simple' }
      its(['locals','value','local','costcenter']) { should eq '0815' }
  end
end