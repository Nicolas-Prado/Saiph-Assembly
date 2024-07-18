#ifndef EF_SHOP_H
#define EF_SHOP_H

#include <vector>

#include "Types.hpp"
#include "ItemComercial.hpp"
#include "ServiceBuilding.hpp"

class Shop : public ServiceBuilding {
public:
    Shop(BuildingType, const std::string&, std::vector<ItemComercial*>);

    ItemComercial* buyService(const std::string&, Gold) override;
    Gold sellService(const std::string&) override;
};

#endif