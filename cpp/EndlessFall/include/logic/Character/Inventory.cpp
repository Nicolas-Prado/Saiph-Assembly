#include "Inventory.hpp"

Inventory::Inventory(std::vector<ItemInventory> itens):
    itens(std::move(itens)) {};

void Inventory::addItem(ItemInventory item) {
    itens.push_back(item);
}