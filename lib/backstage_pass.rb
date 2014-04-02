class BackstagePass < GenericItem
  def adjust_quality
    self.quality = if sell_in >= 1
                     [MAXIMUM_QUALITY, quality + quality_increment].min
                   else
                     0
                   end
  end

  private

  def quality_increment
    if sell_in < 6
      3
    elsif sell_in < 11
      2
    else
      1
    end
  end
end
