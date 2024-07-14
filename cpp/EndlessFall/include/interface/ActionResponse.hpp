#ifndef EF_ACTIONRESPONSE_H
#define EF_ACTIONRESPONSE_H

#include <string>
#include <vector>
#include <unordered_map>
#include <any>

using DataType = std::unordered_map<std::string, std::any>;

class ActionResponse {
public:
    std::vector<std::string> messages;
    DataType data;

    ActionResponse(std::vector<std::string>, DataType);
};
#endif