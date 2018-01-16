require "../../spec_helper"

module Amber::Operations
  describe Contract do
    describe "#validation" do
      context "when contract params are valid" do

        it "returns success true" do
          header = HTTP::Headers.new
          header["content-type"] = "application/x-www-form-urlencoded"
          request = HTTP::Request.new("GET", "/?test=test", header, "_method=put")
          context = create_context(request)
          contract = Contract.call(context)
          contract.success?.should eq true
        end
      end
    end
  end
end
