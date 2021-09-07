Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 356D3402CA3
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Sep 2021 18:09:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234165AbhIGQLD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Sep 2021 12:11:03 -0400
Received: from wes1-so1-redir.wedos.net ([46.28.106.44]:52496 "EHLO
        wes1-so1.wedos.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233616AbhIGQLC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Sep 2021 12:11:02 -0400
X-Greylist: delayed 455 seconds by postgrey-1.27 at vger.kernel.org; Tue, 07 Sep 2021 12:11:02 EDT
Received: from [192.168.42.180] (pc-213-194-230-47.valachnet.cz [213.194.230.47])
        by wes1-so1.wedos.net (Postfix) with ESMTPSA id 4H3qls2qldz4KF
        for <linux-gpio@vger.kernel.org>; Tue,  7 Sep 2021 18:02:17 +0200 (CEST)
To:     linux-gpio@vger.kernel.org
From:   "Marek Novak | ACRIOS Systems s.r.o." <novak@acrios.com>
Subject: [libgpiod] Add Lua 5.1 binding for libgpiod v1.0.x branch
Message-ID: <8a49314e-f727-aace-9c54-122b038d1fad@acrios.com>
Date:   Tue, 7 Sep 2021 18:02:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

 From ca1b5688de2d1cb63bb9823e28b87c52f23df449 Mon Sep 17 00:00:00 2001
From: Marek NOVAK <novak@acrios.com>
Date: Fri, 3 Sep 2021 18:41:02 +0200
Subject: [PATCH] Adding Lua 5.1 bindings as 'gpiod' Lua module

- Adding bindings directory with wrapper code
- Adding Makefile.am for building and distributing as a Lua module
- Adding --enable-bindings-lua option for autogen.sh
- Adding examples with basic lua gpioset and gpioget implementation
- Output, input and event input with new(), get(), set() and wait()
   methods are implemented.

Signed-off-by: Marek NOVAK <novak@acrios.com>
---
  Makefile.am                       |   7 +
  bindings/Makefile.am              |  10 +
  bindings/lua/Makefile.am          |  20 +
  bindings/lua/examples/Makefile.am |   6 +
  bindings/lua/examples/gpioget.lua |  28 ++
  bindings/lua/examples/gpioset.lua |  47 ++
  bindings/lua/gpiod.c              | 686 ++++++++++++++++++++++++++++++
  configure.ac                      |  24 +-
  8 files changed, 827 insertions(+), 1 deletion(-)
  create mode 100644 bindings/Makefile.am
  create mode 100644 bindings/lua/Makefile.am
  create mode 100644 bindings/lua/examples/Makefile.am
  create mode 100644 bindings/lua/examples/gpioget.lua
  create mode 100644 bindings/lua/examples/gpioset.lua
  create mode 100644 bindings/lua/gpiod.c

diff --git a/Makefile.am b/Makefile.am
index 9b1d00b..174f7a2 100644
--- a/Makefile.am
+++ b/Makefile.am
@@ -20,6 +20,13 @@ SUBDIRS += tests

  endif

+if WITH_BINDINGS_LUA
+
+SUBDIRS += bindings
+
+endif
+
+
  if HAS_DOXYGEN

  doc:
diff --git a/bindings/Makefile.am b/bindings/Makefile.am
new file mode 100644
index 0000000..753b377
--- /dev/null
+++ b/bindings/Makefile.am
@@ -0,0 +1,10 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2021 Marek Novak <novak@acrios.com>
+
+SUBDIRS = .
+
+if WITH_BINDINGS_LUA
+
+SUBDIRS += lua
+
+endif
diff --git a/bindings/lua/Makefile.am b/bindings/lua/Makefile.am
new file mode 100644
index 0000000..b66ae05
--- /dev/null
+++ b/bindings/lua/Makefile.am
@@ -0,0 +1,20 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2021 Marek Novak <novak@acrios.com>
+
+lualibdir = ${libdir}/lua/${LUA_VERSION}
+
+lualib_LTLIBRARIES = gpiod.la
+
+gpiod_la_SOURCES = gpiod.c
+gpiod_la_CFLAGS = -Wall -Wextra -g -fPIC -pedantic -std=c11 $(LUA_INCLUDE)
+gpiod_la_CFLAGS += -I$(top_srcdir)/include/
+gpiod_la_LDFLAGS = -std=c11 -shared -module -lgpiod -version-info 1:0:0 
$(LUA_LDFLAGS)
+gpiod_la_LIBADD = $(LUA_LIB)
+
+SUBDIRS = .
+
+if WITH_EXAMPLES
+
+SUBDIRS += examples
+
+endif
diff --git a/bindings/lua/examples/Makefile.am 
b/bindings/lua/examples/Makefile.am
new file mode 100644
index 0000000..b2abaf1
--- /dev/null
+++ b/bindings/lua/examples/Makefile.am
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2021 Marek Novak <novak@acrios.com>
+
+EXTRA_DIST =				\
+		gpioget.lua		\
+		gpioset.lua
diff --git a/bindings/lua/examples/gpioget.lua 
b/bindings/lua/examples/gpioget.lua
new file mode 100644
index 0000000..57c8051
--- /dev/null
+++ b/bindings/lua/examples/gpioget.lua
@@ -0,0 +1,28 @@
+-- SPDX-License-Identifier: GPL-2.0-or-later
+-- SPDX-FileCopyrightText: 2021 Marek Novak <novak@acrios.com>
+
+-- Simplified reimplementation of the gpioget tool in Lua.
+
+require 'gpiod'
+
+
+chip = arg[1]
+offsets = {unpack(arg, 2)}
+if chip == nil or #offsets < 1 then
+    print("usage: gpioget.lua <gpiochip> <offset1> <offset2> ...")
+else
+    ans = ""
+    for index, offset in ipairs(offsets) do
+        line = gpiod:new({chip, offset, "in"})
+        if line == nil then
+            print("failed accessing gpio " .. tostring(chip) .. ":" .. 
tostring(offset))
+            ans = nil
+            break
+        end
+
+        ans = ans .. line.get() .. " "
+    end
+    if ans ~= nil then
+	print(ans)
+    end
+end
diff --git a/bindings/lua/examples/gpioset.lua 
b/bindings/lua/examples/gpioset.lua
new file mode 100644
index 0000000..c0be02a
--- /dev/null
+++ b/bindings/lua/examples/gpioset.lua
@@ -0,0 +1,47 @@
+-- SPDX-License-Identifier: GPL-2.0-or-later
+-- SPDX-FileCopyrightText: 2021 Marek Novak <novak@acrios.com>
+
+-- Simplified reimplementation of the gpioset tool in Lua.
+
+require 'gpiod'
+
+-- helper split function
+function split(s, delimiter)
+    result = {};
+    for match in (s..delimiter):gmatch("(.-)"..delimiter) do
+        table.insert(result, match);
+    end
+    return result;
+end
+
+function usage()
+    print("usage: gpioset.lua <gpiochip> <offset1=value1> 
<offset2=value2> ...")
+end
+
+
+chip = arg[1]
+offsets_values = {unpack(arg, 2)}
+if chip == nil or #offsets_values < 1 then
+    usage()
+else
+    print(offsets_values[1])
+    for index, offset_value in ipairs(offsets_values) do
+        offset_value_table = split(offset_value, "=")
+        if #offset_value_table ~= 2 then
+            usage()
+            break
+        end
+
+        offset = tonumber(offset_value_table[1])
+        value = tonumber(offset_value_table[2])
+
+        if offset == nil or (value ~= 0 and value ~= 1) then
+            usage()
+            break
+        end
+
+        line = gpiod:new({chip, offset, "in", value})
+        -- unnecessary - the value is set as default on previous line
+        -- line:set(value)
+    end
+end
diff --git a/bindings/lua/gpiod.c b/bindings/lua/gpiod.c
new file mode 100644
index 0000000..7e19af8
--- /dev/null
+++ b/bindings/lua/gpiod.c
@@ -0,0 +1,686 @@
+// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-FileCopyrightText: 2021 Marek Novak <novak@acrios.com>
+//
+// gpiod.c
+//
+// When this module is loaded, it registers new gpiod metatable
+// and makes it possible to control GPIOs using libgpiod.
+// Three GPIO line modes are available - in, out and event.
+// Out mode is used to output value to the line,
+// in mode is used to synchronously read the value and
+// event mode is used to wait for a rising or falling or both edges
+// and to read the time of event and type of event which happened.
+// By assigning a nil value to a line created using gpiod:new(),
+// it gets released eventually using the garbage collector or
+// you can force collection using collectgarbage().
+// On loading this module, all GPIO CHIPS/Ports are opened
+// and used later when allocating individual lines.
+
+#include <stdarg.h>
+#include <stdio.h>
+#include <string.h>
+
+#include <gpiod.h>
+
+#include <lua.h>
+#include <lauxlib.h>
+
+// macros
+#define GPIOD_METATABLE "gpiod"
+#define GPIOD_CONSUMER_NAME "Lua"
+#define MAX_GPIO_CHIPS (16)
+#define GPIOD_DBG(verbose, ...) dbg_print(verbose, __func__, __VA_ARGS__)
+// #define PULL_UP_DOWN_SUPPORTED // uncomment to enable pull-up and 
pull-down support
+
+// typedefs
+struct gpiod_ud {
+	lua_Integer chip;
+	lua_Integer line;
+	const char *mode;
+	struct gpiod_chip *chip_obj;
+	struct gpiod_line *line_obj;
+	bool verbose;
+};
+
+// functions
+static int gpiod_mt_index(lua_State *L);
+static int gpiod_finalize(lua_State *L);
+static int gpiod_new(lua_State *L);
+static int gpiod_get(lua_State *L);
+static int gpiod_set(lua_State *L);
+static int gpiod_wait(lua_State *L);
+static void dbg_print(bool enable, const char *func_name, char *fmt, ...);
+
+// module global data
+static int gpiochips_opened; // zero since static
+static struct gpiod_chip *gpiochips[MAX_GPIO_CHIPS];
+
+// for verbose mode printing
+static void dbg_print(bool enable, const char *func_name, char *fmt, ...)
+{
+	va_list argptr;
+
+	if (!enable)
+		return;
+
+	va_start(argptr, fmt);
+	printf("[%s]: ", func_name);
+	vprintf(fmt, argptr);
+	printf("\n");
+	va_end(argptr);
+}
+
+// gpiod:new(p)
+static int gpiod_new(lua_State *L)
+{
+	int chip, line, def_val;
+	bool verbose = false;
+	const char *mode;
+	struct gpiod_chip *chip_obj;
+	struct gpiod_line *line_obj;
+	struct gpiod_line_bulk bulk;
+	bool is_rising_edge = false;
+	bool is_falling_edge = false;
+	bool is_open_drain = false;
+	bool is_open_source = false;
+	bool is_active_low = false;
+
+#ifdef PULL_UP_DOWN_SUPPORTED // not available in all versions of libgpiod
+	bool has_pull_up = false;
+	bool has_pull_down = false;
+#endif
+
+	int rv, flags = 0;
+	size_t arglen;
+
+	// Extract the gpiod initialization data from the stack.
+	luaL_checktype(L, 2, LUA_TTABLE);
+	arglen = lua_objlen(L, 2);
+
+	if (arglen < 3) {
+		lua_settop(L, 0);
+		lua_pushnil(L);
+		return 1;
+	}
+
+	// stack = [self, p]
+	lua_rawgeti(L, 2, 1); // 2, 1 = idx in stack, idx in table
+	// stack = [self, p, p[1]]
+	lua_rawgeti(L, 2, 2);
+	// stack = [self, p, p[1], p[2]]
+	lua_rawgeti(L, 2, 3);
+	// stack = [self, p, p[1], p[2], p[3]]
+
+	chip = lua_tointeger(L, -3);  // p[1]
+	line = lua_tointeger(L, -2);  // p[2]
+	mode = lua_tostring(L, -1); // p[3]
+
+	if (!strcmp(mode, "out")) {
+
+		switch (lua_type(L, 3)) {
+
+		case LUA_TTABLE:
+			arglen = lua_objlen(L, 3);
+			switch (arglen) {
+			case 0:
+				def_val = 0;
+			break;
+
+			case 1:
+				lua_rawgeti(L, 3, 1);
+				def_val = lua_tointeger(L, -1);
+			break;
+
+			case 2:
+				lua_rawgeti(L, 3, 1);
+				lua_rawgeti(L, 3, 2);
+				def_val = lua_tointeger(L, -2);
+				if (lua_tointeger(L, -1)) // open drain ?
+					is_open_drain = true;
+
+			break;
+
+			case 3:
+				lua_rawgeti(L, 3, 1);
+				lua_rawgeti(L, 3, 2);
+				lua_rawgeti(L, 3, 3);
+				def_val = lua_tointeger(L, -3);
+				if (lua_tointeger(L, -2)) // open drain ?
+					is_open_drain = true;
+				if (lua_tointeger(L, -1)) // open source ?
+					is_open_source = true;
+			break;
+
+			case 4:
+				lua_rawgeti(L, 3, 1);
+				lua_rawgeti(L, 3, 2);
+				lua_rawgeti(L, 3, 3);
+				lua_rawgeti(L, 3, 4);
+				def_val = lua_tointeger(L, -4);
+				if (lua_tointeger(L, -3)) // open drain ?
+					is_open_drain = true;
+				if (lua_tointeger(L, -2)) // open source ?
+					is_open_source = true;
+				if (lua_tointeger(L, -1)) // active low ?
+					is_active_low = true;
+			break;
+
+			default:
+				lua_settop(L, 0);
+				lua_pushnil(L);
+				return 1;
+			}
+
+			verbose = luaL_optinteger(L, 4, 0);
+		break;
+
+		case LUA_TNONE:
+		case LUA_TNUMBER:
+			verbose = luaL_optinteger(L, 3, 0);
+			def_val = 0;
+		break;
+
+		default:
+			lua_settop(L, 0);
+			lua_pushnil(L);
+			return 1;
+		}
+
+		if (is_open_drain)
+			flags |= GPIOD_LINE_REQUEST_FLAG_OPEN_DRAIN;
+		if (is_open_source)
+			flags |= GPIOD_LINE_REQUEST_FLAG_OPEN_SOURCE;
+		if (is_active_low)
+			flags |= GPIOD_LINE_REQUEST_FLAG_ACTIVE_LOW;
+	} else if (!strcmp(mode, "in")) {
+
+		switch (lua_type(L, 3)) {
+
+		case LUA_TTABLE:
+
+			arglen = lua_objlen(L, 3);
+			switch (arglen) {
+			case 0:
+				break;
+
+#ifdef PULL_UP_DOWN_SUPPORTED // not available in all versions of libgpiod
+			case 1:
+				lua_rawgeti(L, 3, 1);
+				if (lua_tointeger(L, -1)) // pull up ?
+					has_pull_up = true;
+				break;
+
+			case 2:
+				lua_rawgeti(L, 3, 1);
+				lua_rawgeti(L, 3, 2);
+				if (lua_tointeger(L, -2)) // pull up ?
+					has_pull_up = true;
+
+				if (lua_tointeger(L, -1)) // pull down ?
+					has_pull_down = true;
+				break;
+#endif
+			default:
+				lua_settop(L, 0);
+				lua_pushnil(L);
+				return 1;
+			}
+			verbose = luaL_optinteger(L, 4, 0);
+			break;
+
+		case LUA_TNONE:
+		case LUA_TNUMBER:
+			verbose = luaL_optinteger(L, 3, 0);
+			break;
+
+		default:
+			lua_settop(L, 0);
+			lua_pushnil(L);
+			return 1;
+		}
+
+#ifdef PULL_UP_DOWN_SUPPORTED
+
+		if (has_pull_up)
+			flags |= GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_UP;
+		if (has_pull_down)
+			flags |= GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_DOWN;
+#endif
+
+	} else if (!strcmp(mode, "event")) {
+
+		switch (lua_type(L, 3)) {
+
+		case LUA_TTABLE:
+
+			arglen = lua_objlen(L, 3);
+			switch (arglen) {
+			case 0:
+				is_rising_edge = true;
+				is_falling_edge = false;
+				break;
+
+			case 1:
+				lua_rawgeti(L, 3, 1);
+				is_rising_edge = lua_tointeger(L, -1);
+				break;
+
+			case 2:
+				lua_rawgeti(L, 3, 1);
+				lua_rawgeti(L, 3, 2);
+				is_rising_edge = lua_tointeger(L, -2);
+				is_falling_edge = lua_tointeger(L, -1);
+				break;
+
+#ifdef PULL_UP_DOWN_SUPPORTED
+			case 3:
+				lua_rawgeti(L, 3, 1);
+				lua_rawgeti(L, 3, 2);
+				lua_rawgeti(L, 3, 3);
+				is_rising_edge = lua_tointeger(L, -3);
+				is_falling_edge = lua_tointeger(L, -2);
+				if (lua_tointeger(L, -1)) // pull up ?
+					has_pull_up = true;
+				break;
+
+			case 4:
+				lua_rawgeti(L, 3, 1);
+				lua_rawgeti(L, 3, 2);
+				lua_rawgeti(L, 3, 3);
+				is_rising_edge = lua_tointeger(L, -4);
+				is_falling_edge = lua_tointeger(L, -3);
+				if (lua_tointeger(L, -2)) // pull up ?
+					has_pull_up = true;
+				if (lua_tointeger(L, -1)) // pull down ?
+					has_pull_down = true;
+				break;
+#endif
+			default:
+				lua_settop(L, 0);
+				lua_pushnil(L);
+				return 1;
+			}
+			verbose = luaL_optinteger(L, 4, 0);
+			break;
+
+		case LUA_TNONE:
+		case LUA_TNUMBER:
+			verbose = luaL_optinteger(L, 3, 0);
+			break;
+
+		default:
+			lua_settop(L, 0);
+			lua_pushnil(L);
+			return 1;
+		}
+
+#ifdef PULL_UP_DOWN_SUPPORTED
+		if (has_pull_up)
+			flags |= GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_UP;
+		if (has_pull_down)
+			flags |= GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_DOWN;
+#endif
+
+	}
+
+	lua_settop(L, 0);
+	// stack = []
+
+	// validate chip number, line number and mode...
+	if (chip < gpiochips_opened)
+		chip_obj = gpiochips[chip];
+	else {
+		GPIOD_DBG(verbose, "Bad GPIOCHIP!");
+		lua_settop(L, 0);
+		lua_pushnil(L);
+		return 1;
+	}
+
+	gpiod_line_bulk_init(&bulk);
+	line_obj = gpiod_chip_get_line(chip_obj, line);
+	if (!line_obj) {
+		GPIOD_DBG(verbose, "Failed to get line %d", line);
+		lua_settop(L, 0);
+		lua_pushnil(L);
+		return 1;
+	}
+
+	gpiod_line_bulk_add(&bulk, line_obj);
+
+	if (!strcmp("out", mode)) {
+
+		rv = gpiod_line_request_bulk_output_flags(&bulk,
+			GPIOD_CONSUMER_NAME, flags, &def_val);
+
+		if (rv < 0) {  // failed to open line
+			GPIOD_DBG(verbose,
+				"Fail: line %d, mode 'out', flags 0x%08X!",
+				 line, flags);
+			lua_settop(L, 0);
+			lua_pushnil(L);
+			return 1;
+		}
+	} else if (!strcmp("in", mode)) {
+		rv = gpiod_line_request_bulk_input_flags(&bulk,
+			GPIOD_CONSUMER_NAME, flags);
+		if (rv < 0) {  // failed to open line
+			GPIOD_DBG(verbose,
+				"Fail: line %d, mode 'in', flags 0x%08X!",
+				line, flags);
+			lua_settop(L, 0);
+			lua_pushnil(L);
+			return 1;
+		}
+	} else if (!strcmp("event", mode)) {
+		if (is_rising_edge)
+			rv = gpiod_line_request_bulk_rising_edge_events_flags(
+				&bulk, GPIOD_CONSUMER_NAME, flags);
+		else if (is_falling_edge)
+			rv = gpiod_line_request_bulk_falling_edge_events_flags(
+				&bulk, GPIOD_CONSUMER_NAME, flags);
+		else
+			rv = gpiod_line_request_bulk_both_edges_events_flags(
+				&bulk, GPIOD_CONSUMER_NAME, flags);
+
+		if (rv < 0) {  // failed to open line
+			GPIOD_DBG(verbose,
+				"Fail: line %d, mode '%s', flags 0x%08X!",
+				(is_rising_edge)?"evt rising" :
+				(is_falling_edge)?"evt falling" :
+				"evt rising/falling",
+				line, flags);
+			lua_settop(L, 0);
+			lua_pushnil(L);
+			return 1;
+		}
+
+	} else { // bad mode
+		GPIOD_DBG(verbose, "Bad mode '%s'!", mode);
+		lua_settop(L, 0);
+		lua_pushnil(L);
+		return 1;
+	}
+
+
+	// Create a gpiod instance and set its metatable.
+	struct gpiod_ud *gpiod = (struct gpiod_ud *)lua_newuserdata(L,
+						sizeof(struct gpiod_ud));
+	// stack = [gpiod]
+	luaL_getmetatable(L, GPIOD_METATABLE);
+	// stack = [gpiod, mt]
+	lua_setmetatable(L, 1);
+	// stack = [gpiod]
+
+	// Set up the C data.
+	gpiod->chip = chip;
+	gpiod->line = line;
+	gpiod->mode = mode;
+	gpiod->chip_obj = chip_obj;
+	gpiod->line_obj = line_obj;
+	gpiod->verbose = verbose;
+
+	GPIOD_DBG(gpiod->verbose,
+		"new line chip=%d, line=%d, mode='%s'", chip, line, mode);
+
+	return 1;
+}
+
+// gpiod:set(p)
+static int gpiod_set(lua_State *L)
+{
+	// Expected: stack = [self, key]
+	struct gpiod_ud *gpiod = (struct gpiod_ud *)luaL_checkudata(L, 1,
+							GPIOD_METATABLE);
+	int value = 0;
+	int rv;
+	int t = lua_type(L, 2);
+
+	if (t == LUA_TNUMBER) {
+		value = (int)lua_tointeger(L, 2);
+		value = !(!value);
+	} else {
+		GPIOD_DBG(gpiod->verbose,
+			"Number required as new value, bad type!");
+		return 0;
+	}
+
+	rv = gpiod_line_set_value(gpiod->line_obj, value);
+
+	if (rv)
+		GPIOD_DBG(gpiod->verbose, "Failed to set new value!");
+	else
+		GPIOD_DBG(gpiod->verbose, "GPIO %d.%d=%d",
+			gpiod->chip, gpiod->line, value);
+	return 0;
+}
+
+// gpiod:get(p)
+static int gpiod_get(lua_State *L)
+{
+	// Expected: stack = [self, key]
+	struct gpiod_ud *gpiod = (struct gpiod_ud *)luaL_checkudata(L, 1,
+							GPIOD_METATABLE);
+	int t = lua_type(L, 2);
+	int rv;
+
+	if (t != LUA_TNONE) {
+		GPIOD_DBG(gpiod->verbose, "No extra arguments required!");
+		return 0;
+	}
+
+	rv = gpiod_line_get_value(gpiod->line_obj);
+
+	if (rv < 0) {
+		GPIOD_DBG(gpiod->verbose, "Failed to set new value!");
+		return 0;
+	}
+
+	GPIOD_DBG(gpiod->verbose, "GPIO %d.%d=%d",
+		gpiod->chip, gpiod->line, rv);
+	lua_pushboolean(L, rv);
+	return 1;
+
+}
+
+// gpiod:wait(p)
+static int gpiod_wait(lua_State *L)
+{
+	// Expected: stack = [self, key]
+	struct gpiod_ud *gpiod = (struct gpiod_ud *)luaL_checkudata(L, 1, 
GPIOD_METATABLE);
+
+	struct gpiod_line_event evt;
+	int timeout = 0;
+	int rv;
+	int t = lua_type(L, 2);
+	struct timespec tout;
+
+	if (t != LUA_TNUMBER) {
+		GPIOD_DBG(gpiod->verbose, "Expected numeric timeout value in sec");
+		return 0;
+	}
+
+	timeout = lua_tointeger(L, 2);
+
+	t = lua_type(L, 3);
+	if (t != LUA_TNONE) {
+		GPIOD_DBG(gpiod->verbose, "Only one argument expected!");
+		return 0;
+	}
+
+	tout.tv_nsec = 0;
+	tout.tv_sec = timeout;
+
+	rv = gpiod_line_event_wait(gpiod->line_obj, &tout);
+	if (rv < 0) {
+		GPIOD_DBG(gpiod->verbose, "Failed waiting for event!");
+		return 0;
+	} else if (rv == 0) {
+		GPIOD_DBG(gpiod->verbose, "Timed out waiting for event!");
+		return 0;
+	}
+
+	rv = gpiod_line_event_read(gpiod->line_obj, &evt);
+	if (rv < 0) {
+		GPIOD_DBG(gpiod->verbose,
+			"Failed reading event type!");
+		return 0;
+	}
+	if (evt.event_type == GPIOD_LINE_EVENT_RISING_EDGE)
+		lua_pushstring(L, "rising");
+	else
+		lua_pushstring(L, "falling");
+
+	lua_pushinteger(L, evt.ts.tv_sec);
+	lua_pushinteger(L, evt.ts.tv_nsec);
+
+	GPIOD_DBG(gpiod->verbose, "GPIO %d.%d -> %s @ %d.%09d",
+		gpiod->chip, gpiod->line,
+		(evt.event_type == GPIOD_LINE_EVENT_RISING_EDGE) ?
+		"rising" : "falling",
+		evt.ts.tv_sec, evt.ts.tv_nsec);
+
+	return 3;
+}
+
+// gpiod_mt:index(key)
+static int gpiod_mt_index(lua_State *L)
+{
+
+	// Expected: stack = [self, key]
+	struct gpiod_ud *gpiod = (struct gpiod_ud *)luaL_checkudata(L, 1,
+							GPIOD_METATABLE);
+	int t = lua_type(L, 2);
+	const char *str_key;
+
+	if (t != LUA_TSTRING) {
+		GPIOD_DBG(gpiod->verbose, "Bad property!");
+		lua_pushnil(L);
+		return 1;
+	}
+
+	str_key = lua_tostring(L, 2);
+
+	if (strcmp(str_key, "chip") == 0) {
+		lua_pushinteger(L, gpiod->chip);
+		return 1;
+	} else if (strcmp(str_key, "line") == 0) {
+		lua_pushinteger(L, gpiod->line);
+		return 1;
+	} else if (strcmp(str_key, "mode") == 0) {
+		lua_pushstring(L, gpiod->mode);
+		return 1;
+	}
+
+	if (!strcmp(gpiod->mode, "out")) {
+		static struct luaL_Reg fns_out[] = {
+		{"set", gpiod_set},
+		{NULL, NULL}};
+		for (int idx = 0; fns_out[idx].func; idx++) {
+			if (!strcmp(str_key, fns_out[idx].name)) {
+				lua_pushcfunction(L,
+					fns_out[idx].func);
+				return 1;
+			}
+		}
+	} else if (!strcmp(gpiod->mode, "in")) {
+		static struct luaL_Reg fns_in[] = {
+		{"get", gpiod_get},
+		{NULL, NULL}};
+
+		for (int idx = 0; fns_in[idx].func; idx++) {
+			if (!strcmp(str_key, fns_in[idx].name)) {
+				lua_pushcfunction(L, fns_in[idx].func);
+				return 1;
+			}
+		}
+	} else if (!strcmp(gpiod->mode, "event")) {
+		static struct luaL_Reg fns_event[] = {
+		{"wait", gpiod_wait},
+		{NULL, NULL}};
+
+		for (int idx = 0; fns_event[idx].func; idx++) {
+			if (!strcmp(str_key, fns_event[idx].name)) {
+				lua_pushcfunction(L,
+					fns_event[idx].func);
+				return 1;
+			}
+		}
+	}
+
+
+	GPIOD_DBG(gpiod->verbose, "Bad property!");
+	lua_pushnil(L);
+	return 1;
+}
+
+static int gpiod_finalize(lua_State *L)
+{
+	struct gpiod_ud *gpiod = (struct gpiod_ud *)luaL_checkudata(L, 1,
+							GPIOD_METATABLE);
+	GPIOD_DBG(gpiod->verbose, "finalizing GPIO %d.%d",
+		gpiod->chip, gpiod->line);
+	gpiod_line_release(gpiod->line_obj);
+	return 0;
+}
+
+
+
+// entrypoint
+int luaopen_gpiod(lua_State *L)
+{
+
+	// The user may pass in values here,
+	// but we'll ignore those values.
+	lua_settop(L, 0);
+
+	// stack = []
+
+	// If this metatable already exists, the library is already
+	// loaded.
+	if (luaL_newmetatable(L, GPIOD_METATABLE)) {
+		// stack = [mt]
+		static struct luaL_Reg metamethods[] = {
+			{"__index", gpiod_mt_index},
+			{"__gc", gpiod_finalize},
+			{NULL, NULL}};
+		lua_setglobal(L, GPIOD_METATABLE);
+		luaL_register(L, GPIOD_METATABLE, metamethods);
+		// in lua 5.2+ luaL_setfuncs(L, metamethods, 0);
+		lua_pop(L, 1); // The table is saved in the Lua's registry.
+
+		// stack = []
+		struct gpiod_chip_iter *iter;
+		struct gpiod_chip *chip;
+
+		iter = gpiod_chip_iter_new();
+		gpiochips_opened = 0;
+		if (!iter)
+			return 0;
+		gpiod_foreach_chip_noclose(iter, chip) {
+			gpiochips[gpiochips_opened] = chip;
+			gpiochips_opened++;
+			if (gpiochips_opened >= MAX_GPIO_CHIPS) {
+				GPIOD_DBG(true,
+					"Limiting number of GPIOCHIPS!");
+				break;
+			}
+		}
+
+		gpiod_chip_iter_free(iter);
+
+	}
+
+	static struct luaL_Reg fns[] = {
+	{"new", gpiod_new},
+	{"set", gpiod_set},
+	{"get", gpiod_get},
+	{"wait", gpiod_wait},
+	{NULL, NULL}};
+
+	luaL_register(L, GPIOD_METATABLE, fns); // Push a new table with fns 
key/vals.
+	// lua 5.2+ luaL_newlib(L, fns);
+
+	// stack = [gpiod = {new = new}]
+
+	return 1; // Return the top item, the gpiod table.
+}
diff --git a/configure.ac b/configure.ac
index 523c21e..2ea0067 100644
--- a/configure.ac
+++ b/configure.ac
@@ -113,6 +113,25 @@ then
  	PKG_CHECK_MODULES([UDEV], [libudev >= 215])
  fi

+AC_ARG_ENABLE([examples],
+	[AS_HELP_STRING([--enable-examples], [enable building code 
examples[default=no]])],
+	[if test "x$enableval" = xyes; then with_examples=true; fi],
+	[with_examples=false])
+AM_CONDITIONAL([WITH_EXAMPLES], [test "x$with_examples" = xtrue])
+
+AC_ARG_ENABLE([bindings-lua],
+	[AS_HELP_STRING([--enable-bindings-lua],[enable lua 5.1 bindings 
[default=no]])],
+	[if test "x$enableval" = xyes; then with_bindings_lua=true; fi],
+	[with_bindings_lua=false])
+AM_CONDITIONAL([WITH_BINDINGS_LUA], [test "x$with_bindings_lua" = xtrue])
+
+if test "x$with_bindings_lua" = xtrue
+then
+	AX_PROG_LUA([5.1], [5.2])
+	AX_LUA_HEADERS
+	AX_LUA_LIBS
+fi
+
  AC_CHECK_PROG([has_doxygen], [doxygen], [true], [false])
  AM_CONDITIONAL([HAS_DOXYGEN], [test "x$has_doxygen" = xtrue])
  if test "x$has_doxygen" = xfalse
@@ -126,6 +145,9 @@ AC_CONFIG_FILES([libgpiod.pc
  		 src/Makefile
  		 src/lib/Makefile
  		 src/tools/Makefile
-		 tests/Makefile])
+		 tests/Makefile
+		 bindings/Makefile
+		 bindings/lua/Makefile
+		 bindings/lua/examples/Makefile])

  AC_OUTPUT
-- 
2.32.0
[libgpiod] Add Lua 5.1 binding for libgpiod v1.0.x branch
