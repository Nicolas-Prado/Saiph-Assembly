#ifndef EF_SERVICEITEM_H
#define EF_SERVICEITEM_H

#include <vector>

#include "Service.hpp"
#include "ItemComercial.hpp"

class ServiceItem : public Service {
public:
    std::vector<ItemComercial> itens;
};

#endif