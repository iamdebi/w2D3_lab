require('minitest/autorun')
require('minitest/rg')

require_relative('../pub')
require_relative('../drinks')
require_relative('../customer')

class CustomerTest < MiniTest::Test

  def setup
    @customer1 = Customer.new("Jefferson", 60)

    @drink1 = Drink.new("Tennets", 3)
    @drink2 = Drink.new("Strongbow", 4)
    @drink3 = Drink.new("Buckie", 6)
    @drinks = [@drink1, @drink2, @drink3]

    @pub = Pub.new("Clansman", @drinks)
  end

  def test_customer_name
    assert_equal("Jefferson", @customer1.name)
  end

  def test_customer_wallet
    assert_equal(60, @customer1.wallet)
  end

  def test_drink_starts_empty
    assert_equal(0, @customer1.drink_count)
  end

  def test_add_drink_to_customer
    @customer1.add_drink(@drink2)
    assert_equal(1, @customer1.drink_count)
  end

  def test_customer_spends_money
    @customer1.spend_money(@drink2)
    assert_equal(56, @customer1.wallet)
  end

  def test_buy_drink
    @customer1.buy_drink(@drink2, @pub)
    assert_equal(1, @customer1.drink_count)
    assert_equal(56, @customer1.wallet)
    assert_equal(2, @pub.stock_count)
    assert_equal(4, @pub.till)

  end

  def test_remove_drink
    @pub.sell_drink(@drink3)
    assert_equal(2, @pub.stock_count)
  end



end
