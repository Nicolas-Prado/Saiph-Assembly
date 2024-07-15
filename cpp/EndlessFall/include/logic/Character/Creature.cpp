#include "Creature.hpp"

Creature::Creature(const std::string& name, float healthPoints, std::vector<Attribute> attributes):
    name(name),
    healthPoints(healthPoints),
    attributes(std::move(attributes)) {};