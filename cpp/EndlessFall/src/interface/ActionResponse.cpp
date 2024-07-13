#include "ActionResponse.hpp"

ActionResponse::ActionResponse(std::vector<std::string> responses):
    responses(std::move(responses)) {}