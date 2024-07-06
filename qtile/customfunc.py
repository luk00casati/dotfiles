from libqtile.lazy import lazy

@lazy.function
def view_next_group(qtile):
    i = qtile.groups.index(qtile.current_group)
    num_groups = len(qtile.groups)
    if i < num_groups - 1:
        next_group = qtile.groups[i + 1]
    else:
        next_group = qtile.groups[0]
    next_group.toscreen()


@lazy.function
def view_prev_group(qtile):
    i = qtile.groups.index(qtile.current_group)
    if i > 0:
        next_group = qtile.groups[i - 1]
    else:
        next_group = qtile.groups[-1]
    next_group.toscreen()

@lazy.function
def view_next_group_skip(qtile):
    current_group = qtile.current_group
    i = qtile.groups.index(current_group)
    num_groups = len(qtile.groups)
    for _ in range(num_groups - 1):
        i = (i + 1) % num_groups
        next_group = qtile.groups[i]
        if next_group.windows:
            next_group.toscreen()
            break

@lazy.function
def view_prev_group_skip(qtile):
    current_group = qtile.current_group
    i = qtile.groups.index(current_group)
    num_groups = len(qtile.groups)
    for _ in range(num_groups - 1):
        i = (i - 1) % num_groups
        prev_group = qtile.groups[i]
        if prev_group.windows:
            prev_group.toscreen()
            break