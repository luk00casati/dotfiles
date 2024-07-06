from libqtile import bar, layout, widget
from libqtile.config import Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from customfunc import (
    view_next_group,
    view_prev_group,
    view_next_group_skip,
    view_prev_group_skip,
)

mod = "mod4"
terminal = "kitty"
appmenu = "rofi -show drun"

keys = [
    # A list of available commands that can be bound to keys can be found
    # at https://docs.qtile.org/en/latest/manual/config/lazy.html
    Key([mod], "Left", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod], "Right", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod], "Down", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod], "Up", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.next(), desc="Move window focus to other window"), # lazy.group.next_window()
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    Key([mod, "shift"], "Return", lazy.spawn(appmenu), desc="appmenu"),
    Key([mod], "q", lazy.window.kill(), desc="Kill focused window"),
    Key(
        [mod],
        "f",
        lazy.window.toggle_fullscreen(),
        desc="Toggle fullscreen on the focused window",
    ),
    Key(
        [mod],
        "space",
        lazy.window.toggle_floating(),
        desc="Toggle floating on the focused window",
    ),
    Key([mod, "shift"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "shift"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    # Key([mod], "r", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),
    Key([mod, "shift"], "period", view_next_group()),
    Key([mod, "shift"], "comma", view_prev_group()),
    Key([mod], "period", view_next_group_skip()),
    Key([mod], "comma", view_prev_group_skip()),
]

groups = [Group(i) for i in "123456789"]

for i in groups:
    keys.extend(
        [
            # mod + group number = switch to group
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            # mod + shift + group number = switch to & move focused window to group
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(i.name),
            ),
            # Or, use below if you prefer not to switch to that group.
            # # mod + shift + group number = move focused window to group
            # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
            #     desc="move focused window to group {}".format(i.name)),
        ]
    )

layouts = [
    layout.Columns(),
    # layout.Max(),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(),
    # layout.Bsp(),
    # layout.Matrix(),
    # layout.MonadTall(),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

widget_defaults = dict(
    font="mono",
    fontsize=12,
    padding=3,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        bottom=bar.Bar(
            [
                #widget.CurrentLayout(),
                widget.GroupBox(),
                widget.Spacer(bar.STRETCH),
                widget.Spacer(bar.STRETCH),
                # widget.WindowName(),
                widget.CPU(
                    format='CPU: {load_percent}%',
                    update_interval=1.0
                ),
                widget.Memory(
                    format='Mem: {MemUsed:.0f}',
                    update_interval=1.0
                ),
                widget.DF(
                    format='Disk: {uf} {m}B',
                    partition='/',
                    visible_on_warn=False,
                    update_interval=60
                ),
                widget.Battery(
                    format="Batt: {char} {percent:2.0%}",
                    charge_char="↑",
                    discharge_char="↓",
                    full_char="=",
                    unknown_char="?",
                    empty_char="!",
                    update_interval=60,
                ),
                widget.Clock(format="%Y-%m-%d %a %I:%M %p"),
            ],
            24,
        ),
        # You can uncomment this variable if you see that on X11 floating resize/moving is laggy
        # By default we handle these events delayed to already improve performance, however your system might still be struggling
        # This variable is set to None (no cap) by default, but you can set it to 60 to indicate that you limit it to 60 events per second
        x11_drag_polling_rate=60,
    ),
]

# Drag floating layouts.
mouse = [
    Drag(
        [mod],
        "Button1",
        lazy.window.set_position_floating(),
        start=lazy.window.get_position(),
    ),
    Drag(
        [mod, "shift"],
        "Button1",
        lazy.window.set_size_floating(),
        start=lazy.window.get_size(),
    ),
    # Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []
follow_mouse_focus = False
bring_front_click = True
floats_kept_above = True
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = False
