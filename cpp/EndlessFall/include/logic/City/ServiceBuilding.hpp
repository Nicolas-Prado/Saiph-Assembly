#ifndef EF_SERVICEBUILDING_H
#define EF_SERVICEBUILDING_H

#include <vector>

#include "Types.hpp"
#include "Service.hpp"
#include "Building.hpp"

class ServiceBuilding : public Building {
private:
    std::vector<Service> services;

public:
    Gold sellService(Service);
    Service buyService(Gold);
};

#endif