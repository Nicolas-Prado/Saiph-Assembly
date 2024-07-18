#ifndef EF_SHOPITEM_H
#define EF_SHOPITEM_H

#include <vector>

#include "Service.hpp"
#include "ItemComercial.hpp"

class ShopItem : public Service {
public:
    std::vector<ItemComercial> itens;
};

#endif