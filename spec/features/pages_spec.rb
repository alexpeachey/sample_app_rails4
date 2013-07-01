require 'spec_helper'

describe "Pages" do
  describe "GET root_path" do
    before { visit root_path }

    specify { expect(response.status).to be 200 }
  end
end