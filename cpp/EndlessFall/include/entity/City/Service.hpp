#ifndef EF_SERVICE_H
#define EF_SERVICE_H

#include <string>

#include "Types.hpp"

class Service {
public:
    Service(const std::string&, Gold, bool);

    std::string description;
    Gold cost;
    bool userService;
};

#endif