require('spec_helper')



describe(Author) do
  before :each  do
    @andrew = Author.new({:name => "andrew"})
    @kevin = Author.new({:name => "kevin"})
    @author = Author.new({:name => "andrew"})
  end
  describe('#initialize') do
    it "will return name" do
      expect(@andrew.name).to eq "andrew"
      expect(@andrew.id).to eq nil
    end
  end

#   describe('#save') do
#     it "will save into the database" do
#       @andrew.save()
#       expect(Author.all).to eq [@andrew]
#     end
#   end
#
#   describe(".all") do
#     it "will return empty" do
#       expect(Author.all()).to eq([])
#     end
#   end
#
#   describe('#==') do
#     it "will compare if it is eqaul by name" do
#       @andrew.save()
#       @author.save()
#       expect(@andrew).to eq @author
#     end
#   end

end
# TODO: save
# TODO: all
