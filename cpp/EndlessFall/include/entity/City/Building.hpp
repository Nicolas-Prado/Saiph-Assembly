#ifndef EF_BUILDING_H
#define EF_BUILDING_H

#include <string>

#include "Character.hpp"

class Building {
public:
    enum class BuildingType {
        Shop
    };

    std::string name;
    BuildingType type;
//    Character user;

    Building(BuildingType, const std::string&);
};

#endif