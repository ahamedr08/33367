#ifndef LAUNCHER_H
#define LAUNCHER_H
struct launcher_backend {
    const char *name;
    const char *executable;
};
const struct launcher_backend *launcher_find(const char *name);
int launcher_installed(const struct launcher_backend *b);
#endif
