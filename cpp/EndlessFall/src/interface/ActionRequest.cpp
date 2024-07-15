#include "ActionRequest.hpp"

ActionRequest::ActionRequest(const std::string& descriptor, const std::string& name, ParamsType params):
    descriptor(descriptor),
    name(name),
    params(std::move(params)) {}