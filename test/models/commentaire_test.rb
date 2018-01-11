require "test_helper"

describe Commentaire do
  let(:commentaire) { Commentaire.new }

  it "must be valid" do
    value(commentaire).must_be :valid?
  end
end
