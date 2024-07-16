#ifndef EF_CITY_H
#define EF_CITY_H

#include <array>
#include <string>

#include "Building.hpp"

class City {
private:
    std::array<Building, 1> buildings;

public:
    City(std::array<Building, 1>);
    Building gotoBuilding(Building::BuildingType);
};

#endif