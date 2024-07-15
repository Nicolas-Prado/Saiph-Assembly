#ifndef EF_CHARACTER_H
#define EF_CHARACTER_H

#include "Types.hpp"
#include "Creature.hpp"
#include "Inventory.hpp"

class Character : public Creature {
private:
    Inventory inventory;
    Gold gold;
public:
    Character(Inventory, Gold, const std::string&, float, std::vector<Attribute>);
};
#endif