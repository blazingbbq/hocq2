class Mp < ApplicationRecord
  PARTIES = {
    cpc: 'CPC',
    lib: 'LIB',
    ndp: 'NDP',
    ind: 'IND',
  }

  validates :name, presence: true
  validates :party, presence: true, inclusion: { in: PARTIES.values }
end
