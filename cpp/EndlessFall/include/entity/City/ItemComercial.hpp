#ifndef EF_ITEMCOMERCIAL_H
#define EF_ITEMCOMERCIAL_H

#include "Types.hpp"
#include "Item.hpp"

class ItemComercial : public Service {
public:
    ItemComercial(const std::string&, Gold, bool, const Item&);

    Item item;
};

#endif