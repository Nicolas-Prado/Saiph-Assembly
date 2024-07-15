#ifndef EF_ACTIONREQUEST_H
#define EF_ACTIONREQUEST_H

#include <string>
#include <unordered_map>
#include <any>

using ParamsType = std::unordered_map<std::string, std::any>;

class ActionRequest {
public:
    std::string name;
    std::string descriptor;
    ParamsType params;
    
    ActionRequest(const std::string&, const std::string&, ParamsType);
    
};
#endif