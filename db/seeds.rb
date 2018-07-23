require_relative('../models/wizard.rb')
require_relative('../models/codeclanner.rb')
require_relative('../models/attack.rb')
require( 'pry-byebug' )

Codeclanner.delete_all()
Wizard.delete_all()
Attack.delete_all()

wizard1 = Wizard.new({ "name" => "Voldemort", "house" => "Slytherin",
  "wand" => "very black" })
wizard2 = Wizard.new({ "name" => "Bellatrix Lestrange", "house" => "Slytherin",
  "wand" => "black" })

    wizard1.save
    wizard2.save

    codeclanner1 = Codeclanner.new({ "name" => "Emil", "kohort" => "E23"})
    codeclanner2 = Codeclanner.new({ "name" => "Gary", "kohort" => "E22"})
    codeclanner3 = Codeclanner.new({ "name" => "Ian", "kohort" => "E21"})
    codeclanner4 = Codeclanner.new({ "name" => "Kirstie", "kohort" => "E23"})
    codeclanner5 = Codeclanner.new({ "name" => "Jesus", "kohort" => "E22"})
    codeclanner6 = Codeclanner.new({ "name" => "Mellinda", "kohort" => "CEO Codeclan"})
    codeclanner7 = Codeclanner.new({ "name" => "Pawel", "kohort" => "Tutor"})

    codeclanner1.save
    codeclanner2.save
    codeclanner3.save
    codeclanner4.save
    codeclanner5.save
    codeclanner6.save
    codeclanner7.save

    attack1 = Attack.new({ "wizard_id" => wizard1.id, "codeclanner_id" => codeclanner3.id})
    attack2 = Attack.new({ "wizard_id" => wizard1.id, "codeclanner_id" => codeclanner2.id})
    attack3 = Attack.new({ "wizard_id" => wizard2.id, "codeclanner_id" => codeclanner1.id})
    attack4 = Attack.new({ "wizard_id" => wizard1.id, "codeclanner_id" => codeclanner4.id})
    attack5 = Attack.new({ "wizard_id" => wizard2.id, "codeclanner_id" => codeclanner7.id})
    attack6 = Attack.new({ "wizard_id" => wizard1.id, "codeclanner_id" => codeclanner6.id})
    attack7 = Attack.new({ "wizard_id" => wizard2.id, "codeclanner_id" => codeclanner5.id})


    attack1.save
    attack2.save
    attack3.save
    attack4.save
    attack5.save
    attack6.save
    attack7.save

codeclanner1.delete

    binding.pry
    nil
