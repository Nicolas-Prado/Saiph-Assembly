#include "City.hpp"

#include <algorithm>

City::City(std::array<Building, 1> buildings):
    buildings(std::move(buildings)) {};

Building City::gotoBuilding(Building::BuildingType searchingType) {
    std::array<Building, 1>& buildings = this->buildings;

    Building building = *std::find_if(buildings.begin(), buildings.end(), [searchingType](const Building& building) {
        return building.type == searchingType;
    });

    return building;
};