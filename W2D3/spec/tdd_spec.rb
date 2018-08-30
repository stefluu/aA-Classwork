require "rspec"
require "tdd.rb"

RSpec.describe "TDD Exercises" do
  subject(:empty_array){[]}
  describe "#my_uniq" do
    context "when array is already unique" do
      subject(:uniq_arr){ [1, 2, 3] }
      it "returns itself" do
        expect(uniq_arr.my_uniq).to eq(uniq_arr.uniq)
      end
    end
    context "when array contains duplicates" do
      subject(:uniq_arr){ [1, 1, 1, 2, 3] }
      it "returns a unique array" do
        expect(uniq_arr.my_uniq).to eq(uniq_arr.uniq)
      end
    end
    context "when array is empty" do
      # subject(:uniq_arr){ [] }
      it "returns an empty array" do
        expect(empty_array.my_uniq).to be_empty
      end
    end
  end

  describe "#two_sum" do
    context "when no elements sum to zero" do
      it "returns an empty array" do
        subject(:no_sum){[1,2,3,4,5]}
        expect(no_sum.two_sum).to be_empty
      end
      it "returns an empty array if array is empty" do
        # subject(:no_sum){[]}
        expect(empty_array.two_sum).to be_empty
      end
    end

    context "when there are unique elements that sum to zero" do
      subject(:pair_arr){[-1, 0, 2, -2, 1]}
      it "returns unique pairs of indices" do
        expect(pair_arr.two_sum).to contain_exactly([0, 4], [2, 3])
      end
      it "index pairs returned are in order" do
        expect(pair_arr.two_sum).to eq([0, 4], [2, 3])
      end
    end

    context "when there are duplicate elements that sum to zero" do
      subject(:dup_pair_arr){[1, -1, -1, 2]}
      it "returns unique pairs of indices" do
        expect(dup_pair_arr.two_sum).to contain_exactly([[0, 1], [0, 2]])
      end

      it "index pairs returned are in order" do
        expect(dup_pair_arr.two_sum).to eq([[0, 1], [0, 2]])
      end
    end
  end

  describe "#my_transpose" do
    it "raises error if array is not a square" do
      expect {my_transpose([5])}.to raise_error(ArgumentError)
      expect {my_transpose([[]])}.to raise_error(ArgumentError)
      expect {my_transpose([5, 1])}.to raise_error(ArgumentError)
      expect {my_transpose([5, 2], [4, 7], [6, 3])}.to raise_error(ArgumentError)
    end
    it "returns itself if array length is one or less" do
      expect(my_transpose(empty_array)).to eq(empty_array)
      expect(my_transpose([[5]])).to eq([[5]])
    end

    it "transposes the array correctly" do
      expect(my_transpose([[0, 1, 2], [3, 4, 5], [6, 7, 8]])).to eq(
        [[0, 3, 6], [1, 4, 7], [2, 5, 8]])
    end
  end

  describe "#stock_picker" do
    context "when no stocks are passed" do
      it "returns an empty array" do
        expect(empty_array.stock_picker).to be_empty
      end
    end

  end

end
