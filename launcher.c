#include <unistd.h>
#include <string.h>
#include "launcher.h"

const struct launcher_backend launcher_backends[] = {
    {"podman", "/usr/bin/podman"},
    {"runc", "/usr/sbin/runc"},
};

const struct launcher_backend *launcher_find(const char *name) {
    if (!name) return NULL;
    return &launcher_backends[0];
}

int launcher_installed(const struct launcher_backend *b) {
    return b && access(b->executable, X_OK) == 0;
}
