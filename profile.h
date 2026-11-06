#ifndef PROFILE_H
#define PROFILE_H
struct profile {
    const char *profile_id;
    const char *target_path;
    int enabled;
};
#endif
