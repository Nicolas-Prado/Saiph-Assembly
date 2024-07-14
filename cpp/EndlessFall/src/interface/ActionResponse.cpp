#include "ActionResponse.hpp"

ActionResponse::ActionResponse(std::vector<std::string> messages, DataType data):
    messages(std::move(messages)),
    data(std::move(data)) {}