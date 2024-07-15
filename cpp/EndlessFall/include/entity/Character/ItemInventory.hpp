#ifndef EF_ITEMINVENTORY_H
#define EF_ITEMINVENTORY_H

#include "Item.hpp"

class ItemInventory {
public:
    Item item;
    int quantity;

    ItemInventory(Item, int);
};

#endif