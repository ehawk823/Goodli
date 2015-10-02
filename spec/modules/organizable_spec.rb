describe Organizable do
  context "cntxt1" do
    let(:dummy_class) do
      Class.new do
        include Organizable

        def self.organizable_class?
          true
        end
      end
    end

    context "instances" do
      subject { dummy_class.new }

      it { subject.should be_an_instance_of(dummy_class) }
      it { should respond_to(self.organizable_class?)}
      it { should be_a(Organizable) }
      its (:to_s) { should eq(true) }
    end
  end
end

# describe Organizable do
#   include Organizable

#   it { self.organizable_class?.should == true}
# end

# shared_examples_for Organizable do
#   context 'with an instance' do
#     before(:each) do
#       @obj = described_class.new
#     end
#   end

#   context 'class methods' do
#     it 'should be a organizable class' do
#       described_class.organizable_class?.should be_true
#     end
#   end
# end

# describe Event do
#   it_behaves_like Organizable
# end