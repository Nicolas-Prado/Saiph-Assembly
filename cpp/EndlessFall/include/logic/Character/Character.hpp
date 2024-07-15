#ifndef EF_CHARACTER_H
#define EF_CHARACTER_H

#include <Creature.hpp>
#include <Inventory.hpp>

class Character : public Creature {
private:
    Inventory inventory;
};
#endif