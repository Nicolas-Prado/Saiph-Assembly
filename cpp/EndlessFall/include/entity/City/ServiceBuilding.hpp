#ifndef EF_SERVICEBUILDING_H
#define EF_SERVICEBUILDING_H

#include <vector>

#include "Types.hpp"
#include "Service.hpp"
#include "Building.hpp"

class ServiceBuilding : public Building {
private:
    std::vector<Service*> services;

public:
    ServiceBuilding(BuildingType, const std::string&, std::vector<Service*>);

    virtual Service* buyService(const std::string&, Gold);
    virtual Gold sellService(const std::string&);
};

#endif