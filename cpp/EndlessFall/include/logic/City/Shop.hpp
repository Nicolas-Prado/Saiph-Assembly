#ifndef EF_SHOP_H
#define EF_SHOP_H

#include <vector>

#include "Types.hpp"
#include "ItemComercial.hpp"
#include "ServiceBuilding.hpp"

class Shop : public ServiceBuilding {
private:
    std::vector<ItemComercial> itens;
public:
    Item buyItem(std::string name);
    Gold sellItem(std::string name);
};

#endif