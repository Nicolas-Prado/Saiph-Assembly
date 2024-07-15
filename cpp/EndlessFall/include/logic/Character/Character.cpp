#include "Character.hpp"

Character::Character(
    Inventory inventory, Gold gold, const std::string& name, 
    float healthPoints, std::vector<Attribute> attributes
):
    inventory(inventory),
    gold(gold),
    Creature(name, healthPoints, attributes) {};