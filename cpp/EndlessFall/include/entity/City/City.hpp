#ifndef EF_CITY_H
#define EF_CITY_H

#include <array>
#include <string>

#include "Building.hpp"

class City {
private:
    std::array<Building, 1> buildings;

public:
    Building gotoBuilding(std::string);
};

#endif