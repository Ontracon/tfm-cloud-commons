# # load data from Terraform output
content = inspec.profile.file("outputs.json.local")
params = JSON.parse(content)
# # # Get outputs
locals = params['locals']['value']

title "OTC Inspec Test"

control 'Cloud Region' do
  impact 1.0
title "Check Input from example deployment."
desc "Check necessary Input parameter CLOUD_REGION"
  describe input('CLOUD_REGION') do    # This line reads the value of the input
    it { should be_in ['eu-central-1', 'westeurope'] }
  end
end
