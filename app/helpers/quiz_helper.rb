module QuizHelper
  ProgressBar = Struct.new(:type, :width) do
    self::TYPES = {
      correct: "progress-bar-success",
      incorrect: "progress-bar-danger",
      skipped: "progress-bar-info",
    }

    def initialize(type, width=1); super; end
  end

  def progressbars(game)
    skips = []
    incorrects = []

    game.mistakes.each do |m|
      case m.mistake_type
      when Mistake::TYPES[:skipped]
        skips << m.mp_id
      when Mistake::TYPES[:incorrect]
        incorrects << m.mp_id
      end
    end
        
    bars = []

    game.seen.each do |mp|
      id = mp.to_i

      if skips.include? id
        type = ProgressBar::TYPES[:skipped]
      elsif incorrects.include? id
        type = ProgressBar::TYPES[:incorrect]
      else
        type = ProgressBar::TYPES[:correct]
      end

      if bars.last&.type == type
        bars.last.width += 1
      else
        bars << ProgressBar.new(type)
      end
    end

    bars
  end

  def number_of_mps
    number_of_mps ||= Mp.all.count
  end
end
