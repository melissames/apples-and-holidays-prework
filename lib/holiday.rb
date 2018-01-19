require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array
  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
  holiday_hash[:winter][:christmas] << supply
  holiday_hash[:winter][:new_years] << supply
end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash[:spring][:memorial_day] << supply
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
  holiday_hash[season][holiday_name] = supply_array
  holiday_hash
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  holiday_supplies = []

  holiday_hash.each { |season, holiday|
    holiday.each { |supplies_array|
      holiday_supplies << supplies_array
    }
  }
  holiday_supplies.flatten
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.

  holiday_hash.each { |season, holiday_object|
    puts "#{season.capitalize}:"
    holiday_object.each { |holiday, supplies_array|
      string_holiday = holiday.to_s
      formatted_holiday = ''
      formatted_supplies = ''
      supplies_array.each { |supply|
        if supply == supplies_array[-1]
          formatted_supplies << "#{supply}"
        else
          formatted_supplies << "#{supply}, "
        end
      }
      string_holiday.split('').each_with_index { |letter, index|
        if string_holiday[0] == letter
          formatted_holiday << letter.upcase
        elsif string_holiday[index] == "_"
          formatted_holiday << ' '
        elsif string_holiday[index - 1] == '_'
          formatted_holiday << string_holiday[index].upcase
        else
          formatted_holiday << letter
        end
      }
      puts "  #{formatted_holiday}: #{formatted_supplies}"
    }
  }


def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  bbq_holidays = []

  holiday_hash.each{ |season, holiday_object|
    holiday_object.each { |holiday, supplies|
      supplies.each{ |supply|
        if supply == "BBQ"
          bbq_holidays << holiday
        end
      }

    }
  }
  bbq_holidays
end
