class ConjuredItem < GenericItem
  def quality_decrement_rate
    super * 2
  end
end
