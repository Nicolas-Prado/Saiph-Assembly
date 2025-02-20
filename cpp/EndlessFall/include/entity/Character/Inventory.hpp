#ifndef EF_INVENTORY_H
#define EF_INVENTORY_H

#include <vector>

#include "ItemInventory.hpp"

class Inventory {
private:
    std::vector<ItemInventory> itens;
public:
    Inventory(std::vector<ItemInventory>);
    void addItem(ItemInventory);
};

#endif