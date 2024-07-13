#ifndef EF_ACTIONRESPONSE_H
#define EF_ACTIONRESPONSE_H

#include <string>
#include <vector>

class ActionResponse{
public:
    std::vector<std::string> responses;

    ActionResponse(std::vector<std::string>);
};
#endif