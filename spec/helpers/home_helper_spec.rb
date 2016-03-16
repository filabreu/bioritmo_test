require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the HomeHelper. For example:
#
# describe HomeHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe HomeHelper, :type => :helper do
  describe "#current_week" do
    it "should return an interval of days of the current week" do
      expect(helper.current_week.to_a.size).to eql(5)
      expect(helper.current_week).to include(Date.today)
      expect(helper.current_week).not_to include(Date.today + 7)
      expect(helper.current_week).not_to include(Date.today - 7)
    end
  end
end
