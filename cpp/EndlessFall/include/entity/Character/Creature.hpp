#ifndef EF_CREATURE_H
#define EF_CREATURE_H

#include <string>
#include <vector>

#include <Attribute.hpp>

class Creature {
private:
    std::string name;
    float healthPoints;
    std::vector<Attribute> attributes;
public:
    Creature(const std::string&, float, std::vector<Attribute>);
};
#endif