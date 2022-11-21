Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA82D631E32
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Nov 2022 11:23:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231401AbiKUKXu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Nov 2022 05:23:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231364AbiKUKXn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Nov 2022 05:23:43 -0500
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4641CAFE73
        for <linux-gpio@vger.kernel.org>; Mon, 21 Nov 2022 02:23:33 -0800 (PST)
Received: by mail-pf1-x430.google.com with SMTP id b29so10896106pfp.13
        for <linux-gpio@vger.kernel.org>; Mon, 21 Nov 2022 02:23:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LGcyAe8GyJ+y9vC12Ekbeu5s9md27uBMyvj5p5Jeyig=;
        b=pHeyIG8zTqLshq9oy3LtA0p2KhbWj/9pqhBt4Tqunm00fZLy8XwTPZ1b7VM0zxs6dP
         mZ/0K6G0yJtiUftWSAXqMBTmYNXZxVJDHSpfZVB40fUkJ+y2YhupgOjVP8Et47Rwf3lU
         C87iZQ9/XFAFIeFXuuNRNkAcHt7rPXXnaeLdCUkZwnBN14rppPcM2dBZNaPHNQo2Tg/3
         8/IM32WBWAflEu+IyuWxxGl6+zKxyrqMTSwiltVf4ZKoWBd6lxbXqrG9Qd6Q6V21HCS4
         bK/z+osnH+AB+s872zFiTiha9gCK+wEqbcGqLBMO2Brtt/CzcNQ0M1SMKrkMLgDobtWK
         2WPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LGcyAe8GyJ+y9vC12Ekbeu5s9md27uBMyvj5p5Jeyig=;
        b=xnzAgBZS8SlgshgxtFz/e6JVe81j5V9X0L7gxq5UtdMEcWjHVjFuroMK8O2FK7tqVM
         9U8PD5c1LddwTm/iqkIto0wBw3yE75EjK50tpU/OWgdkJ5an3PXQHoGF7QiuFSZRmnpq
         Cxz7H6wcpUcxp7vH+AIL/CL70owIwOpBlR7ZXyAsKoZ0wZCSR+YcCMppKEP6LPRibtx3
         XOiWZS7pWwVSnyuUV8hl86YtZMkvsY0Cn4/KuxZw9MlSwFAPFa387tWPY1R6zzuwADEd
         /bVBJluHWAvS3l2tsEf0arUH01lKa+VdZnusPwpwXg7RfyNPvL17aVTGZOFTil/if91E
         hJYg==
X-Gm-Message-State: ANoB5pkb7rUF8c2xByI/b3EReErZx4mZKs1nQnA63oID2Vqv3kMwiB3l
        MD/JhGq+09Su4HKk7rFPM6qdtpksHD8=
X-Google-Smtp-Source: AA0mqf43CBKyZWP5eBUPCw26LknMNMiNN5lCmiydxvrQ1jC9IalByG5gr3mxp47EbgkApZNGUGcpaA==
X-Received: by 2002:a63:5122:0:b0:464:3f16:e296 with SMTP id f34-20020a635122000000b004643f16e296mr449363pgb.526.1669026210877;
        Mon, 21 Nov 2022 02:23:30 -0800 (PST)
Received: from sol.home.arpa (14-200-229-209.tpgi.com.au. [14.200.229.209])
        by smtp.gmail.com with ESMTPSA id s184-20020a625ec1000000b0056ba7ce4d5asm8347419pfb.52.2022.11.21.02.23.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Nov 2022 02:23:30 -0800 (PST)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, brgl@bgdev.pl
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod v2][PATCH v5 2/6] tools: line name focussed rework
Date:   Mon, 21 Nov 2022 18:22:49 +0800
Message-Id: <20221121102253.38306-3-warthog618@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221121102253.38306-1-warthog618@gmail.com>
References: <20221121102253.38306-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Rework the tool suite to support identifying lines by name and to
support operating on the GPIO lines available to the user at once, rather
than on one particular GPIO chip.

All tools, other than gpiodetect, now provide the name to (chip,offset)
mapping that was previously only performed by gpiofind. As names are not
guaranteed to be unique, a --strict option is provided for all tools to
either abort the operation or report all lines with the matching name, as
appropriate.
By default the tools operate on the first line found with a matching name.

Selection of line by (chip,offset) is still supported with a --chip
option, though it restricts the scope of the operation to an individual
chip.  When the --chip option is specified, the lines are assumed to be
identified by offset where they parse as an integer, else by name.
To cater for the unusual case where a line name parses as an integer,
but is different from the offset, the --by-name option forces the lines
to be identified by name.

The updated tools are intentionally NOT backwardly compatible with the
previous tools. Using old command lines with the updated tools will
almost certainly fail, though migrating old command lines is generally as
simple as adding a '-c' before the chip.

In addition the individual tools are modified as follows:

gpiodetect:

Add the option to select individual chips.

gpioinfo:

Change the focus from chips to lines, so the scope can be
an individual line, a subset of lines, all lines on a particular chip,
or all the lines available to the user.  For line scope a single line
summary is output for each line.  For chip scope the existing format
displaying a summary of the chip and each of its lines is retained.

Line attributes are consolidated into a list format, and are extended
to cover all attributes supported by uAPI v2.

gpioget:

The default output format is becomes line=value, as per the
input for gpioset, and the value is reported as active or inactive,
rather than 0 or 1.
The previous format is available using the --numeric option.

Add an optional hold period between requesting a line and reading the
value to allow the line to settle once the requested configuration has
been applied (e.g. bias).

gpiomon:

Consolidate the edge options into a single option.

Add a debounce period option.

Add options to report event times as UTC or localtime.

Add format specifiers for GPIO chip path, line name, stringified event
type, and event time as a datetime.

Rearrange default output format to place fields with more predicable
widths to the left, and to separate major field groups with tabs.
Lines are identified consistent with the command line.

gpioset:

Add a hold period option that specifies the minimum period the line
value must be held for.  This applies to all set options.

Support line values specified as active/inactive, on/off and
true/false, as well as 1/0.

Add a toggle option that specifies a time sequence over which the
requested lines should be toggled.  If the sequence is 0 terminated then
gpioset exits when the sequence completes, else it repeats the sequence.
This allows for anything from simple blinkers to bit bashing from the
command line. e.g. gpioset -t 500ms LED=on

Add an interactive option to provide a shell-like interface to allow
manual or scripted manipulation of requested lines.  A basic command set
allows lines to be get, set, or toggled, and to insert sleeps between
operations.

Remove the --mode, --sec, and --usec options.
The combination of hold period and interactive mode provide functionality
equivalent to the old --mode options.  By default gpioset now holds the
line indefinitely, rather than exiting immediately.  The old exit
behaviour can be emulated with a "-t 0" option.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 TODO                 |  12 +
 configure.ac         |  24 +-
 tools/Makefile.am    |   7 +
 tools/gpiodetect.c   | 113 ++++-
 tools/gpioget.c      | 225 +++++++++-
 tools/gpioinfo.c     | 250 ++++++++++-
 tools/gpiomon.c      | 470 ++++++++++++++++++++-
 tools/gpioset.c      | 975 ++++++++++++++++++++++++++++++++++++++++++-
 tools/tools-common.c | 693 +++++++++++++++++++++++++++++-
 tools/tools-common.h |  98 ++++-
 10 files changed, 2819 insertions(+), 48 deletions(-)

diff --git a/TODO b/TODO
index 8bb4d8f..bf90bde 100644
--- a/TODO
+++ b/TODO
@@ -47,3 +47,15 @@ over unix sockets.
 In this case however the goal is to have as few dependencies as possible. This
 is because for some small systems dbus is overkill. Since we won't be using any
 standardized protocol, it will take much more effort to implement it correctly.
+
+----------
+
+* improve gpioset --interactive tab completion
+
+The existing tab completion uses libedit's readline emulation layer which
+has a few limitations, including not being able to correctly handle quoted
+line names and being disabled when stdin/stdout are not a tty (which makes
+testing with gpio-tools-test.bats using coproc problematic).
+
+One approach that could address both these problems is to bypass the readline
+emulation and use the libedit API (histedit.h) directly.
diff --git a/configure.ac b/configure.ac
index 048b2ac..23d9060 100644
--- a/configure.ac
+++ b/configure.ac
@@ -103,18 +103,20 @@ AM_CONDITIONAL([WITH_TOOLS], [test "x$with_tools" = xtrue])
 AC_DEFUN([FUNC_NOT_FOUND_TOOLS],
 	[ERR_NOT_FOUND([$1()], [tools])])
 
-AC_DEFUN([HEADER_NOT_FOUND_TOOLS],
-	[ERR_NOT_FOUND([$1 header], [tools])])
-
-if test "x$with_tools" = xtrue
-then
-	# These are only needed to build tools
-	AC_CHECK_FUNC([basename], [], [FUNC_NOT_FOUND_TOOLS([basename])])
+AC_ARG_ENABLE([gpioset-interactive],
+	[AS_HELP_STRING([--enable-gpioset-interactive],
+		[enable gpioset interactive mode [default=no]])],
+	[if test "x$enableval" = xyes; then with_gpioset_interactive=true; fi],
+	[with_gpioset_interactive=false])
+AM_CONDITIONAL([WITH_GPIOSET_INTERACTIVE],
+	[test "x$with_gpioset_interactive" = xtrue])
+
+AS_IF([test "x$with_tools" = xtrue],
+	[# These are only needed to build tools
 	AC_CHECK_FUNC([daemon], [], [FUNC_NOT_FOUND_TOOLS([daemon])])
-	AC_CHECK_FUNC([signalfd], [], [FUNC_NOT_FOUND_TOOLS([signalfd])])
-	AC_CHECK_FUNC([setlinebuf], [], [FUNC_NOT_FOUND_TOOLS([setlinebuf])])
-	AC_CHECK_HEADERS([sys/signalfd.h], [], [HEADER_NOT_FOUND_TOOLS([sys/signalfd.h])])
-fi
+	AS_IF([test "x$with_gpioset_interactive" = xtrue],
+		[PKG_CHECK_MODULES([LIBEDIT], [libedit >= 3.1])])
+	])
 
 AC_ARG_ENABLE([tests],
 	[AS_HELP_STRING([--enable-tests],[enable libgpiod tests [default=no]])],
diff --git a/tools/Makefile.am b/tools/Makefile.am
index fc074b9..6f3c86d 100644
--- a/tools/Makefile.am
+++ b/tools/Makefile.am
@@ -9,6 +9,13 @@ libtools_common_la_SOURCES = tools-common.c tools-common.h
 
 LDADD = libtools-common.la $(top_builddir)/lib/libgpiod.la
 
+if WITH_GPIOSET_INTERACTIVE
+
+AM_CFLAGS += -DGPIOSET_INTERACTIVE
+LDADD += $(LIBEDIT_LIBS)
+
+endif
+
 bin_PROGRAMS = gpiodetect gpioinfo gpioget gpioset gpiomon
 
 gpiodetect_SOURCES = gpiodetect.c
diff --git a/tools/gpiodetect.c b/tools/gpiodetect.c
index 30bde32..3c1ba8b 100644
--- a/tools/gpiodetect.c
+++ b/tools/gpiodetect.c
@@ -1,8 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 // SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
+// SPDX-FileCopyrightText: 2022 Kent Gibson <warthog618@gmail.com>
 
-#include <dirent.h>
-#include <errno.h>
 #include <getopt.h>
 #include <gpiod.h>
 #include <stdio.h>
@@ -11,3 +10,113 @@
 
 #include "tools-common.h"
 
+static void print_help(void)
+{
+	printf("Usage: %s [OPTIONS] [chip]...\n", get_progname());
+	printf("\n");
+	printf("List GPIO chips, print their labels and number of GPIO lines.\n");
+	printf("\n");
+	printf("Chips may be identified by number, name, or path.\n");
+	printf("e.g. '0', 'gpiochip0', and '/dev/gpiochip0' all refer to the same chip.\n");
+	printf("\n");
+	printf("If no chips are specified then all chips are listed.\n");
+	printf("\n");
+	printf("Options:\n");
+	printf("  -h, --help\t\tdisplay this help and exit\n");
+	printf("  -v, --version\t\toutput version information and exit\n");
+}
+
+static int parse_config(int argc, char **argv)
+{
+	int optc, opti;
+	const char *const shortopts = "+hv";
+	static const struct option longopts[] = {
+		{ "help",	no_argument,	NULL,	'h' },
+		{ "version",	no_argument,	NULL,	'v' },
+		{ GETOPT_NULL_LONGOPT },
+	};
+
+	for (;;) {
+		optc = getopt_long(argc, argv, shortopts, longopts, &opti);
+		if (optc < 0)
+			break;
+
+		switch (optc) {
+		case 'h':
+			print_help();
+			exit(EXIT_SUCCESS);
+		case 'v':
+			print_version();
+			exit(EXIT_SUCCESS);
+		case '?':
+			die("try %s --help", get_progname());
+		default:
+			abort();
+		}
+	}
+	return optind;
+}
+
+static int print_chip_info(const char *path)
+{
+	struct gpiod_chip *chip;
+	struct gpiod_chip_info *info;
+
+	chip = gpiod_chip_open(path);
+	if (!chip) {
+		print_perror("unable to open chip '%s'", path);
+		return 1;
+	}
+
+	info = gpiod_chip_get_info(chip);
+	if (!info)
+		die_perror("unable to read info for '%s'", path);
+
+	printf("%s [%s] (%zu lines)\n",
+	       gpiod_chip_info_get_name(info),
+	       gpiod_chip_info_get_label(info),
+	       gpiod_chip_info_get_num_lines(info));
+
+	gpiod_chip_info_free(info);
+	gpiod_chip_close(chip);
+	return 0;
+}
+
+int main(int argc, char **argv)
+{
+	int num_chips, i;
+	char **paths;
+	char *path;
+	int ret = EXIT_SUCCESS;
+
+	i = parse_config(argc, argv);
+	argc -= i;
+	argv += i;
+
+	if (argc == 0) {
+		num_chips = all_chip_paths(&paths);
+		for (i = 0; i < num_chips; i++) {
+			if (print_chip_info(paths[i]))
+				ret = EXIT_FAILURE;
+
+			free(paths[i]);
+		}
+		free(paths);
+	}
+
+	for (i = 0; i < argc; i++) {
+		if (chip_path_lookup(argv[i], &path)) {
+			if (print_chip_info(path))
+				ret = EXIT_FAILURE;
+
+			free(path);
+		} else {
+			print_error(
+				"cannot find GPIO chip character device '%s'",
+				argv[i]);
+			ret = EXIT_FAILURE;
+		}
+	}
+
+	return ret;
+}
diff --git a/tools/gpioget.c b/tools/gpioget.c
index 1b3e666..497f273 100644
--- a/tools/gpioget.c
+++ b/tools/gpioget.c
@@ -1,12 +1,235 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 // SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
+// SPDX-FileCopyrightText: 2022 Kent Gibson <warthog618@gmail.com>
 
 #include <getopt.h>
 #include <gpiod.h>
-#include <limits.h>
 #include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
+#include <unistd.h>
 
 #include "tools-common.h"
 
+static void print_help(void)
+{
+	printf("Usage: %s [OPTIONS] <line>...\n", get_progname());
+	printf("\n");
+	printf("Read values of GPIO lines.\n");
+	printf("\n");
+	printf("Lines are specified by name, or optionally by offset if the chip option\n");
+	printf("is provided.\n");
+	printf("\n");
+	printf("Options:\n");
+	printf("  -a, --as-is\t\tleave the line direction unchanged, not forced to input\n");
+	print_bias_help();
+	printf("      --by-name\t\ttreat lines as names even if they would parse as an offset\n");
+	printf("  -c, --chip <chip>\trestrict scope to a particular chip\n");
+	printf("  -C, --consumer <name>\tconsumer name applied to requested lines (default is 'gpioget')\n");
+	printf("  -h, --help\t\tdisplay this help and exit\n");
+	printf("  -l, --active-low\ttreat the line as active low\n");
+	printf("  -p, --hold-period <period>\n");
+	printf("\t\t\twait between requesting the lines and reading the values\n");
+	printf("      --numeric\t\tdisplay line values as '0' (inactive) or '1' (active)\n");
+	printf("  -s, --strict\t\tabort if requested line names are not unique\n");
+	printf("      --unquoted\tdon't quote line names\n");
+	printf("  -v, --version\t\toutput version information and exit\n");
+	print_chip_help();
+	print_period_help();
+}
+struct config {
+	bool active_low;
+	bool by_name;
+	bool numeric;
+	bool strict;
+	bool unquoted;
+	int bias;
+	int direction;
+	unsigned int hold_period_us;
+	const char *chip_id;
+	const char *consumer;
+};
+
+static int parse_config(int argc, char **argv, struct config *cfg)
+{
+	int opti, optc;
+	const char *const shortopts = "+ab:c:C:hlp:sv";
+	static const struct option longopts[] = {
+		{ "active-low",	no_argument,		NULL,	'l' },
+		{ "as-is",	no_argument,		NULL,	'a' },
+		{ "bias",	required_argument,	NULL,	'b' },
+		{ "by-name",	no_argument,		NULL,	'B' },
+		{ "chip",	required_argument,	NULL,	'c' },
+		{ "consumer",	required_argument,	NULL,	'C' },
+		{ "help",	no_argument,		NULL,	'h' },
+		{ "hold-period", required_argument,	NULL,	'p' },
+		{ "numeric",	no_argument,		NULL,	'N' },
+		{ "strict",	no_argument,		NULL,	's' },
+		{ "unquoted",	no_argument,		NULL,	'Q' },
+		{ "version",	no_argument,		NULL,	'v' },
+		{ GETOPT_NULL_LONGOPT },
+	};
+
+	memset(cfg, 0, sizeof(*cfg));
+	cfg->direction = GPIOD_LINE_DIRECTION_INPUT;
+	cfg->consumer = "gpioget";
+
+	for (;;) {
+		optc = getopt_long(argc, argv, shortopts, longopts, &opti);
+		if (optc < 0)
+			break;
+
+		switch (optc) {
+		case 'a':
+			cfg->direction = GPIOD_LINE_DIRECTION_AS_IS;
+			break;
+		case 'b':
+			cfg->bias = parse_bias_or_die(optarg);
+			break;
+		case 'B':
+			cfg->by_name = true;
+			break;
+		case 'c':
+			cfg->chip_id = optarg;
+			break;
+		case 'C':
+			cfg->consumer = optarg;
+			break;
+		case 'l':
+			cfg->active_low = true;
+			break;
+		case 'N':
+			cfg->numeric = true;
+			break;
+		case 'p':
+			cfg->hold_period_us = parse_period_or_die(optarg);
+			break;
+		case 'Q':
+			cfg->unquoted = true;
+			break;
+		case 's':
+			cfg->strict = true;
+			break;
+		case 'h':
+			print_help();
+			exit(EXIT_SUCCESS);
+		case 'v':
+			print_version();
+			exit(EXIT_SUCCESS);
+		case '?':
+			die("try %s --help", get_progname());
+		case 0:
+			break;
+		default:
+			abort();
+		}
+	}
+
+	return optind;
+}
+
+int main(int argc, char **argv)
+{
+	int i, num_lines, ret, *values;
+	struct gpiod_line_settings *settings;
+	struct gpiod_request_config *req_cfg;
+	struct gpiod_line_request *request;
+	struct gpiod_line_config *line_cfg;
+	struct gpiod_chip *chip;
+	unsigned int *offsets;
+	struct line_resolver *resolver;
+	struct resolved_line *line;
+	struct config cfg;
+	const char *fmt;
+
+	i = parse_config(argc, argv, &cfg);
+	argc -= i;
+	argv += i;
+
+	if (argc < 1)
+		die("at least one GPIO line must be specified");
+
+	resolver = resolve_lines(argc, argv, cfg.chip_id, cfg.strict,
+				 cfg.by_name);
+	validate_resolution(resolver, cfg.chip_id);
+
+	offsets = calloc(resolver->num_lines, sizeof(*offsets));
+	values = calloc(resolver->num_lines, sizeof(*values));
+	if (!offsets || !values)
+		die("out of memory");
+
+	settings = gpiod_line_settings_new();
+	if (!settings)
+		die_perror("unable to allocate line settings");
+
+	gpiod_line_settings_set_direction(settings, cfg.direction);
+
+	if (cfg.bias)
+		gpiod_line_settings_set_bias(settings, cfg.bias);
+
+	if (cfg.active_low)
+		gpiod_line_settings_set_active_low(settings, true);
+
+	req_cfg = gpiod_request_config_new();
+	if (!req_cfg)
+		die_perror("unable to allocate the request config structure");
+
+	line_cfg = gpiod_line_config_new();
+	if (!line_cfg)
+		die_perror("unable to allocate the line config structure");
+
+	gpiod_request_config_set_consumer(req_cfg, cfg.consumer);
+	for (i = 0; i < resolver->num_chips; i++) {
+		chip = gpiod_chip_open(resolver->chips[i].path);
+		if (!chip)
+			die_perror("unable to open chip '%s'",
+				   resolver->chips[i].path);
+
+		num_lines = get_line_offsets_and_values(resolver, i, offsets,
+							NULL);
+
+		gpiod_line_config_reset(line_cfg);
+		ret = gpiod_line_config_add_line_settings(line_cfg, offsets,
+							  num_lines, settings);
+		if (ret)
+			die_perror("unable to add line settings");
+
+		request = gpiod_chip_request_lines(chip, req_cfg, line_cfg);
+		if (!request)
+			die_perror("unable to request lines");
+
+		if (cfg.hold_period_us)
+			usleep(cfg.hold_period_us);
+
+		ret = gpiod_line_request_get_values(request, values);
+		if (ret)
+			die_perror("unable to read GPIO line values");
+
+		set_line_values(resolver, i, values);
+
+		gpiod_line_request_release(request);
+		gpiod_chip_close(chip);
+	}
+	fmt = cfg.unquoted ? "%s=%s" : "\"%s\"=%s";
+	for (i = 0; i < resolver->num_lines; i++) {
+		line = &resolver->lines[i];
+		if (cfg.numeric)
+			printf("%d", line->value);
+		else
+			printf(fmt, line->id,
+			       line->value ? "active" : "inactive");
+
+		if (i != resolver->num_lines - 1)
+			printf(" ");
+	}
+	printf("\n");
+
+	free_line_resolver(resolver);
+	gpiod_request_config_free(req_cfg);
+	gpiod_line_config_free(line_cfg);
+	gpiod_line_settings_free(settings);
+	free(offsets);
+	free(values);
+
+	return EXIT_SUCCESS;
+}
diff --git a/tools/gpioinfo.c b/tools/gpioinfo.c
index ae368fa..b79690c 100644
--- a/tools/gpioinfo.c
+++ b/tools/gpioinfo.c
@@ -1,8 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 // SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
+// SPDX-FileCopyrightText: 2022 Kent Gibson <warthog618@gmail.com>
 
-#include <dirent.h>
-#include <errno.h>
 #include <getopt.h>
 #include <gpiod.h>
 #include <stdarg.h>
@@ -12,3 +11,250 @@
 
 #include "tools-common.h"
 
+static void print_help(void)
+{
+	printf("Usage: %s [OPTIONS] [line]...\n", get_progname());
+	printf("\n");
+	printf("Print information about GPIO lines.\n");
+	printf("\n");
+	printf("Lines are specified by name, or optionally by offset if the chip option\n");
+	printf("is provided.\n");
+	printf("\n");
+	printf("If no lines are specified then all lines are displayed.\n");
+	printf("\n");
+	printf("Options:\n");
+	printf("      --by-name\t\ttreat lines as names even if they would parse as an offset\n");
+	printf("  -c, --chip <chip>\trestrict scope to a particular chip\n");
+	printf("  -h, --help\t\tdisplay this help and exit\n");
+	printf("  -s, --strict\t\tcheck all lines - don't assume line names are unique\n");
+	printf("      --unquoted\tdon't quote line or consumer names\n");
+	printf("  -v, --version\t\toutput version information and exit\n");
+	print_chip_help();
+}
+
+struct config {
+	bool by_name;
+	bool strict;
+	bool unquoted_strings;
+	const char *chip_id;
+};
+
+static int parse_config(int argc, char **argv, struct config *cfg)
+{
+	int opti, optc;
+	const char *const shortopts = "+c:hsv";
+	static const struct option longopts[] = {
+		{ "by-name",	no_argument,	NULL,		'B' },
+		{ "chip",	required_argument, NULL,	'c' },
+		{ "help",	no_argument,	NULL,		'h' },
+		{ "strict",	no_argument,	NULL,		's' },
+		{ "unquoted",	no_argument,	NULL,		'Q' },
+		{ "version",	no_argument,	NULL,		'v' },
+		{ GETOPT_NULL_LONGOPT },
+	};
+
+	memset(cfg, 0, sizeof(*cfg));
+
+	for (;;) {
+		optc = getopt_long(argc, argv, shortopts, longopts, &opti);
+		if (optc < 0)
+			break;
+
+		switch (optc) {
+		case 'B':
+			cfg->by_name = true;
+			break;
+		case 'c':
+			cfg->chip_id = optarg;
+			break;
+		case 's':
+			cfg->strict = true;
+			break;
+		case 'h':
+			print_help();
+			exit(EXIT_SUCCESS);
+		case 'Q':
+			cfg->unquoted_strings = true;
+			break;
+		case 'v':
+			print_version();
+			exit(EXIT_SUCCESS);
+		case '?':
+			die("try %s --help", get_progname());
+		case 0:
+			break;
+		default:
+			abort();
+		}
+	}
+
+	return optind;
+}
+
+
+/*
+ * minimal version similar to tools-common that indicates if a line should be
+ * printed rather than storing details into the resolver.
+ * Does not die on non-unique lines.
+ */
+static bool resolve_line(struct line_resolver *resolver,
+			  struct gpiod_line_info *info, int chip_num)
+{
+	struct resolved_line *line;
+	const char *name;
+	int i;
+	unsigned int offset;
+	bool resolved = false;
+
+	offset = gpiod_line_info_get_offset(info);
+	for (i = 0; i < resolver->num_lines; i++) {
+		line = &resolver->lines[i];
+		/* already resolved by offset? */
+		if (line->resolved &&
+		    (line->offset == offset) &&
+		    (line->chip_num == chip_num)) {
+			resolved = true;
+		}
+		if (line->resolved && !resolver->strict)
+			continue;
+
+		/* else resolve by name */
+		name = gpiod_line_info_get_name(info);
+		if (name && (strcmp(line->id, name) == 0)) {
+			line->resolved = true;
+			line->offset = offset;
+			line->chip_num = chip_num;
+			resolved = true;
+		}
+	}
+
+	return resolved;
+}
+
+static void print_line_info(struct gpiod_line_info *info, bool unquoted_strings)
+{
+	const char *name;
+	char quoted_name[17];
+	int len;
+
+	name = gpiod_line_info_get_name(info);
+	if (!name) {
+		name = "unnamed";
+		unquoted_strings = true;
+	}
+	if (unquoted_strings) {
+		printf("%-16s\t", name);
+	} else {
+		len = strlen(name);
+		if (len <= 14) {
+			quoted_name[0] = '"';
+			memcpy(&quoted_name[1], name, len);
+			quoted_name[len + 1] = '"';
+			quoted_name[len + 2] = '\0';
+			printf("%-16s\t", quoted_name);
+		} else {
+			printf("\"%s\"\t", name);
+		}
+	}
+	print_line_attributes(info, unquoted_strings);
+}
+
+/*
+ * based on resolve_lines, but prints lines immediately rather than collecting
+ * details in the resolver.
+ */
+static void list_lines(struct line_resolver *resolver, struct gpiod_chip *chip,
+		       int chip_num, struct config *cfg)
+{
+	struct gpiod_chip_info *chip_info;
+	struct gpiod_line_info *info;
+	int offset, num_lines;
+
+	chip_info = gpiod_chip_get_info(chip);
+	if (!chip_info)
+		die_perror("unable to read info from chip %s",
+			   gpiod_chip_get_path(chip));
+
+	num_lines = gpiod_chip_info_get_num_lines(chip_info);
+
+	if ((chip_num == 0) && (cfg->chip_id && !cfg->by_name))
+		resolve_lines_by_offset(resolver, num_lines);
+
+	for (offset = 0;
+	     ((offset < num_lines) &&
+	      !(resolver->num_lines && resolve_done(resolver)));
+	     offset++) {
+		info = gpiod_chip_get_line_info(chip, offset);
+		if (!info)
+			die_perror("unable to read info for line %d from %s",
+				   offset, gpiod_chip_info_get_name(chip_info));
+
+		if (resolver->num_lines &&
+		    !resolve_line(resolver, info, chip_num))
+			continue;
+
+		if (resolver->num_lines) {
+			printf("%s %u", gpiod_chip_info_get_name(chip_info),
+			       offset);
+		} else {
+			if (offset == 0)
+				printf("%s - %u lines:\n",
+				       gpiod_chip_info_get_name(chip_info),
+				       num_lines);
+
+			printf("\tline %3u:", offset);
+		}
+		fputc('\t', stdout);
+		print_line_info(info, cfg->unquoted_strings);
+		fputc('\n', stdout);
+		gpiod_line_info_free(info);
+		resolver->num_found++;
+	}
+	gpiod_chip_info_free(chip_info);
+}
+
+int main(int argc, char **argv)
+{
+	struct gpiod_chip *chip;
+	struct line_resolver *resolver = NULL;
+	struct config cfg;
+	char **paths;
+	int num_chips, i, ret = EXIT_SUCCESS;
+
+	i = parse_config(argc, argv, &cfg);
+	argc -= i;
+	argv += i;
+
+	if (!cfg.chip_id)
+		cfg.by_name = true;
+
+	num_chips = chip_paths(cfg.chip_id, &paths);
+	if (cfg.chip_id  && (num_chips == 0))
+		die("cannot find GPIO chip character device '%s'", cfg.chip_id);
+
+	resolver = resolver_init(argc, argv, num_chips, cfg.strict,
+				 cfg.by_name);
+
+	for (i = 0; i < num_chips; i++) {
+		chip = gpiod_chip_open(paths[i]);
+		if (chip) {
+			list_lines(resolver, chip, i, &cfg);
+			gpiod_chip_close(chip);
+		} else {
+			print_perror("unable to open chip '%s'", paths[i]);
+
+			if (cfg.chip_id)
+				return EXIT_FAILURE;
+
+			ret = EXIT_FAILURE;
+		}
+		free(paths[i]);
+	}
+	free(paths);
+
+	validate_resolution(resolver, cfg.chip_id);
+	if (argc && resolver->num_found != argc)
+		ret = EXIT_FAILURE;
+	free(resolver);
+	return ret;
+}
diff --git a/tools/gpiomon.c b/tools/gpiomon.c
index 6fa19b6..6e5125c 100644
--- a/tools/gpiomon.c
+++ b/tools/gpiomon.c
@@ -1,19 +1,481 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 // SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
+// SPDX-FileCopyrightText: 2022 Kent Gibson <warthog618@gmail.com>
 
-#include <errno.h>
 #include <getopt.h>
 #include <gpiod.h>
 #include <inttypes.h>
-#include <limits.h>
 #include <poll.h>
-#include <signal.h>
 #include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
-#include <unistd.h>
 
 #include "tools-common.h"
 
 #define EVENT_BUF_SIZE 32
 
+static void print_help(void)
+{
+	printf("Usage: %s [OPTIONS] <line>...\n", get_progname());
+	printf("\n");
+	printf("Wait for events on GPIO lines and print them to standard output.\n");
+	printf("\n");
+	printf("Lines are specified by name, or optionally by offset if the chip option\n");
+	printf("is provided.\n");
+	printf("\n");
+	printf("Options:\n");
+	printf("      --banner\t\tdisplay a banner on successful startup\n");
+	print_bias_help();
+	printf("      --by-name\t\ttreat lines as names even if they would parse as an offset\n");
+	printf("  -c, --chip <chip>\trestrict scope to a particular chip\n");
+	printf("  -C, --consumer <name>\tconsumer name applied to requested lines (default is 'gpiomon')\n");
+	printf("  -e, --edges <edges>\tspecify the edges to monitor\n");
+	printf("\t\t\tPossible values: 'falling', 'rising', 'both'.\n");
+	printf("\t\t\t(default is 'both')\n");
+	printf("  -E, --event-clock <clock>\n");
+	printf("\t\t\tspecify the source clock for event timestamps\n");
+	printf("\t\t\tPossible values: 'monotonic', 'realtime', 'hte'.\n");
+	printf("\t\t\t(default is 'monotonic')\n");
+	printf("\t\t\tBy default 'realtime' is formatted as UTC, others as raw u64.\n");
+	printf("  -h, --help\t\tdisplay this help and exit\n");
+	printf("  -F, --format <fmt>\tspecify a custom output format\n");
+	printf("  -l, --active-low\ttreat the line as active low, flipping the sense of\n");
+	printf("\t\t\trising and falling edges\n");
+	printf("      --localtime\tformat event timestamps as local time\n");
+	printf("  -n, --num-events <num>\n");
+	printf("\t\t\texit after processing num events\n");
+	printf("  -p, --debounce-period <period>\n");
+	printf("\t\t\tdebounce the line(s) with the specified period\n");
+	printf("  -q, --quiet\t\tdon't generate any output\n");
+	printf("  -s, --strict\t\tabort if requested line names are not unique\n");
+	printf("      --unquoted\tdon't quote line or consumer names\n");
+	printf("      --utc\t\tformat event timestamps as UTC (default for 'realtime')\n");
+	printf("  -v, --version\t\toutput version information and exit\n");
+	print_chip_help();
+	print_period_help();
+	printf("\n");
+	printf("Format specifiers:\n");
+	printf("  %%o   GPIO line offset\n");
+	printf("  %%l   GPIO line name\n");
+	printf("  %%c   GPIO chip name\n");
+	printf("  %%e   numeric edge event type ('1' - rising or '2' - falling)\n");
+	printf("  %%E   edge event type ('rising' or 'falling')\n");
+	printf("  %%S   event timestamp as seconds\n");
+	printf("  %%U   event timestamp as UTC\n");
+	printf("  %%L   event timestamp as local time\n");
+}
+
+static int parse_edges_or_die(const char *option)
+{
+	if (strcmp(option, "rising") == 0)
+		return GPIOD_LINE_EDGE_RISING;
+	if (strcmp(option, "falling") == 0)
+		return GPIOD_LINE_EDGE_FALLING;
+	if (strcmp(option, "both") != 0)
+		die("invalid edges: %s", option);
+	return GPIOD_LINE_EDGE_BOTH;
+}
+
+static int parse_event_clock_or_die(const char *option)
+{
+	if (strcmp(option, "realtime") == 0)
+		return GPIOD_LINE_EVENT_CLOCK_REALTIME;
+	if (strcmp(option, "hte") != 0)
+		return GPIOD_LINE_EVENT_CLOCK_HTE;
+	if (strcmp(option, "monotonic") != 0)
+		die("invalid event clock: %s", option);
+	return GPIOD_LINE_EVENT_CLOCK_MONOTONIC;
+}
+
+struct config {
+	bool active_low;
+	bool banner;
+	bool by_name;
+	bool quiet;
+	bool strict;
+	bool unquoted;
+	int bias;
+	int edges;
+	int events_wanted;
+	unsigned int debounce_period_us;
+	const char *chip_id;
+	const char *consumer;
+	const char *fmt;
+	int event_clock;
+	int timestamp_fmt;
+};
+
+static int parse_config(int argc, char **argv, struct config *cfg)
+{
+	int opti, optc;
+	const char *const shortopts = "+b:c:C:e:E:hF:ln:p:qshv";
+	const struct option longopts[] = {
+		{ "active-low",	no_argument,	NULL,		'l' },
+		{ "banner",	no_argument,	NULL,		'-'},
+		{ "bias",	required_argument, NULL,	'b' },
+		{ "by-name",	no_argument,	NULL,		'B'},
+		{ "chip",	required_argument, NULL,	'c' },
+		{ "consumer",	required_argument, NULL,	'C' },
+		{ "debounce-period", required_argument, NULL,	'p' },
+		{ "edges",	required_argument, NULL,	'e' },
+		{ "event-clock", required_argument, NULL,	'E' },
+		{ "format",	required_argument, NULL,	'F' },
+		{ "help",	no_argument,	NULL,		'h' },
+		{ "localtime",	no_argument,	&cfg->timestamp_fmt,	2 },
+		{ "num-events",	required_argument, NULL,	'n' },
+		{ "quiet",	no_argument,	NULL,		'q' },
+		{ "silent",	no_argument,	NULL,		'q' },
+		{ "strict",	no_argument,	NULL,		's' },
+		{ "unquoted",	no_argument,	NULL,		'Q' },
+		{ "utc",	no_argument,	&cfg->timestamp_fmt,	1 },
+		{ "version",	no_argument,	NULL,		'v' },
+		{ GETOPT_NULL_LONGOPT },
+	};
+
+	memset(cfg, 0, sizeof(*cfg));
+	cfg->edges = GPIOD_LINE_EDGE_BOTH;
+	cfg->consumer = "gpiomon";
+
+	for (;;) {
+		optc = getopt_long(argc, argv, shortopts, longopts, &opti);
+		if (optc < 0)
+			break;
+
+		switch (optc) {
+		case '-':
+			cfg->banner = true;
+			break;
+		case 'b':
+			cfg->bias = parse_bias_or_die(optarg);
+			break;
+		case 'B':
+			cfg->by_name = true;
+			break;
+		case 'c':
+			cfg->chip_id = optarg;
+			break;
+		case 'C':
+			cfg->consumer = optarg;
+			break;
+		case 'e':
+			cfg->edges = parse_edges_or_die(optarg);
+			break;
+		case 'E':
+			cfg->event_clock = parse_event_clock_or_die(optarg);
+			break;
+		case 'F':
+			cfg->fmt = optarg;
+			break;
+		case 'l':
+			cfg->active_low = true;
+			break;
+		case 'n':
+			cfg->events_wanted = parse_uint_or_die(optarg);
+			break;
+		case 'p':
+			cfg->debounce_period_us = parse_period_or_die(optarg);
+			break;
+		case 'q':
+			cfg->quiet = true;
+			break;
+		case 'Q':
+			cfg->unquoted = true;
+			break;
+		case 's':
+			cfg->strict = true;
+			break;
+		case 'h':
+			print_help();
+			exit(EXIT_SUCCESS);
+		case 'v':
+			print_version();
+			exit(EXIT_SUCCESS);
+		case '?':
+			die("try %s --help", get_progname());
+		case 0:
+			break;
+		default:
+			abort();
+		}
+	}
+
+	/* setup default clock/format combinations, where not overridden */
+	if (cfg->event_clock == 0) {
+		if (cfg->timestamp_fmt)
+			cfg->event_clock = GPIOD_LINE_EVENT_CLOCK_REALTIME;
+		else
+			cfg->event_clock = GPIOD_LINE_EVENT_CLOCK_MONOTONIC;
+	} else if ((cfg->event_clock == GPIOD_LINE_EVENT_CLOCK_REALTIME) &&
+		 (cfg->timestamp_fmt == 0)) {
+		cfg->timestamp_fmt = 1;
+	}
+
+	return optind;
+}
+
+static void print_banner(int num_lines, char **lines)
+{
+	int i;
+
+	if (num_lines > 1) {
+		printf("Monitoring lines ");
+
+		for (i = 0; i < num_lines - 1; i++)
+			printf("'%s', ", lines[i]);
+
+		printf("and '%s'...\n", lines[i]);
+	} else {
+		printf("Monitoring line '%s'...\n", lines[0]);
+	}
+}
+
+static void event_print_formatted(struct gpiod_edge_event *event,
+			struct line_resolver *resolver, int chip_num,
+			struct config *cfg)
+{
+	const char *lname, *prev, *curr;
+	char  fmt;
+	uint64_t evtime;
+	int evtype;
+	unsigned int offset;
+
+	offset = gpiod_edge_event_get_line_offset(event);
+	evtime = gpiod_edge_event_get_timestamp_ns(event);
+	evtype = gpiod_edge_event_get_event_type(event);
+
+	for (prev = curr = cfg->fmt;;) {
+		curr = strchr(curr, '%');
+		if (!curr) {
+			fputs(prev, stdout);
+			break;
+		}
+
+		if (prev != curr)
+			fwrite(prev, curr - prev, 1, stdout);
+
+		fmt = *(curr + 1);
+
+		switch (fmt) {
+		case 'c':
+			fputs(get_chip_name(resolver, chip_num), stdout);
+			break;
+		case 'e':
+			printf("%d", evtype);
+			break;
+		case 'E':
+			if (evtype == GPIOD_EDGE_EVENT_RISING_EDGE)
+				fputs("rising", stdout);
+			else
+				fputs("falling", stdout);
+			break;
+		case 'l':
+			lname = get_line_name(resolver, chip_num, offset);
+			if (!lname)
+				lname = "unnamed";
+			fputs(lname, stdout);
+			break;
+		case 'L':
+			print_event_time(evtime, 2);
+			break;
+		case 'o':
+			printf("%u", offset);
+			break;
+		case 'S':
+			print_event_time(evtime, 0);
+			break;
+		case 'U':
+			print_event_time(evtime, 1);
+			break;
+		case '%':
+			fputc('%', stdout);
+			break;
+		case '\0':
+			fputc('%', stdout);
+			goto end;
+		default:
+			fwrite(curr, 2, 1, stdout);
+			break;
+		}
+
+		curr += 2;
+		prev = curr;
+	}
+
+end:
+	fputc('\n', stdout);
+}
+
+static void event_print_human_readable(struct gpiod_edge_event *event,
+				       struct line_resolver *resolver,
+				       int chip_num, struct config *cfg)
+{
+	unsigned int offset;
+	uint64_t evtime;
+
+	offset = gpiod_edge_event_get_line_offset(event);
+	evtime = gpiod_edge_event_get_timestamp_ns(event);
+
+	print_event_time(evtime, cfg->timestamp_fmt);
+
+	if (gpiod_edge_event_get_event_type(event) ==
+	    GPIOD_EDGE_EVENT_RISING_EDGE)
+		fputs("\trising\t", stdout);
+	else
+		fputs("\tfalling\t", stdout);
+
+	print_line_id(resolver, chip_num, offset, cfg->chip_id, cfg->unquoted);
+	fputc('\n', stdout);
+}
+
+static void event_print(struct gpiod_edge_event *event,
+			struct line_resolver *resolver, int chip_num,
+			struct config *cfg)
+{
+	if (cfg->quiet)
+		return;
+
+	if (cfg->fmt)
+		event_print_formatted(event, resolver, chip_num, cfg);
+	else
+		event_print_human_readable(event, resolver, chip_num, cfg);
+}
+
+int main(int argc, char **argv)
+{
+	int num_lines, events_done = 0;
+	struct gpiod_edge_event_buffer *event_buffer;
+	int ret, i, j;
+	struct gpiod_line_settings *settings;
+	struct gpiod_request_config *req_cfg;
+	struct gpiod_line_request **requests;
+	struct pollfd *pollfds;
+	struct gpiod_line_config *line_cfg;
+	unsigned int *offsets;
+	struct gpiod_edge_event *event;
+	struct gpiod_chip *chip;
+	struct line_resolver *resolver;
+	struct config cfg;
+
+	i = parse_config(argc, argv, &cfg);
+	argc -= i;
+	argv += i;
+
+	if (argc < 1)
+		die("at least one GPIO line must be specified");
+
+	if (argc > 64)
+		die("too many lines given");
+
+	settings = gpiod_line_settings_new();
+	if (!settings)
+		die_perror("unable to allocate line settings");
+
+	if (cfg.bias)
+		gpiod_line_settings_set_bias(settings, cfg.bias);
+
+	if (cfg.active_low)
+		gpiod_line_settings_set_active_low(settings, true);
+
+	if (cfg.debounce_period_us)
+		gpiod_line_settings_set_debounce_period_us(settings,
+					cfg.debounce_period_us);
+
+	gpiod_line_settings_set_event_clock(settings, cfg.event_clock);
+	gpiod_line_settings_set_edge_detection(settings, cfg.edges);
+
+	line_cfg = gpiod_line_config_new();
+	if (!line_cfg)
+		die_perror("unable to allocate the line config structure");
+
+	req_cfg = gpiod_request_config_new();
+	if (!req_cfg)
+		die_perror("unable to allocate the request config structure");
+
+	gpiod_request_config_set_consumer(req_cfg, cfg.consumer);
+
+	event_buffer = gpiod_edge_event_buffer_new(EVENT_BUF_SIZE);
+	if (!event_buffer)
+		die_perror("unable to allocate the line event buffer");
+
+	resolver = resolve_lines(argc, argv, cfg.chip_id, cfg.strict,
+				 cfg.by_name);
+	validate_resolution(resolver, cfg.chip_id);
+	requests = calloc(resolver->num_chips, sizeof(*requests));
+	pollfds = calloc(resolver->num_chips, sizeof(*pollfds));
+	offsets = calloc(resolver->num_lines, sizeof(*offsets));
+	if (!requests || !pollfds || !offsets)
+		die("out of memory");
+
+	for (i = 0; i < resolver->num_chips; i++) {
+		num_lines = get_line_offsets_and_values(resolver, i, offsets,
+							NULL);
+		gpiod_line_config_reset(line_cfg);
+		ret = gpiod_line_config_add_line_settings(line_cfg, offsets,
+							  num_lines, settings);
+		if (ret)
+			die_perror("unable to add line settings");
+
+		chip = gpiod_chip_open(resolver->chips[i].path);
+		if (!chip)
+			die_perror("unable to open chip '%s'",
+				   resolver->chips[i].path);
+
+		requests[i] = gpiod_chip_request_lines(chip, req_cfg, line_cfg);
+		if (!requests[i])
+			die_perror("unable to request lines on chip %s",
+				   resolver->chips[i].path);
+
+		pollfds[i].fd = gpiod_line_request_get_fd(requests[i]);
+		pollfds[i].events = POLLIN;
+		gpiod_chip_close(chip);
+	}
+	gpiod_request_config_free(req_cfg);
+	gpiod_line_config_free(line_cfg);
+	gpiod_line_settings_free(settings);
+
+	if (cfg.banner)
+		print_banner(argc, argv);
+
+	for (;;) {
+		fflush(stdout);
+
+		if (poll(pollfds, resolver->num_chips, -1) < 0)
+			die_perror("error polling for events");
+
+		for (i = 0; i < resolver->num_chips; i++) {
+			if (pollfds[i].revents == 0)
+				continue;
+
+			ret = gpiod_line_request_read_edge_event(requests[i],
+					 event_buffer, EVENT_BUF_SIZE);
+			if (ret < 0)
+				die_perror("error reading line events");
+
+			for (j = 0; j < ret; j++) {
+				event = gpiod_edge_event_buffer_get_event(
+						event_buffer, j);
+				if (!event)
+					die_perror("unable to retrieve event from buffer");
+
+				event_print(event, resolver, i, &cfg);
+
+				events_done++;
+
+				if (cfg.events_wanted &&
+				    events_done >= cfg.events_wanted)
+					goto done;
+			}
+		}
+	}
+done:
+	for (i = 0; i < resolver->num_chips; i++)
+		gpiod_line_request_release(requests[i]);
+
+	free(requests);
+	free_line_resolver(resolver);
+	gpiod_edge_event_buffer_free(event_buffer);
+	free(offsets);
+
+	return EXIT_SUCCESS;
+}
+
diff --git a/tools/gpioset.c b/tools/gpioset.c
index 0e3a1e4..6df5a09 100644
--- a/tools/gpioset.c
+++ b/tools/gpioset.c
@@ -1,7 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 // SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
+// SPDX-FileCopyrightText: 2022 Kent Gibson <warthog618@gmail.com>
 
-#include <errno.h>
+#include <ctype.h>
 #include <gpiod.h>
 #include <getopt.h>
 #include <limits.h>
@@ -9,8 +10,978 @@
 #include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
-#include <sys/select.h>
 #include <unistd.h>
+#if GPIOSET_INTERACTIVE
+#include <editline/readline.h>
+#endif
 
 #include "tools-common.h"
 
+static void print_help(void)
+{
+	printf("Usage: %s [OPTIONS] <line=value>...\n", get_progname());
+	printf("\n");
+	printf("Set values of GPIO lines.\n");
+	printf("\n");
+	printf("Lines are specified by name, or optionally by offset if the chip option\n");
+	printf("is provided.\n");
+	printf("Values may be '1' or '0', or equivalently 'active'/'inactive' or 'on'/'off'.\n");
+	printf("\n");
+	printf("The line output state is maintained until the process exits, but after that\n");
+	printf("is not guaranteed.\n");
+	printf("\n");
+	printf("Options:\n");
+	printf("      --banner\t\tdisplay a banner on successful startup\n");
+	print_bias_help();
+	printf("      --by-name\t\ttreat lines as names even if they would parse as an offset\n");
+	printf("  -c, --chip <chip>\trestrict scope to a particular chip\n");
+	printf("  -C, --consumer <name>\tconsumer name applied to requested lines (default is 'gpioset')\n");
+	printf("  -d, --drive <drive>\tspecify the line drive mode\n");
+	printf("\t\t\tPossible values: 'push-pull', 'open-drain', 'open-source'.\n");
+	printf("\t\t\t(default is 'push-pull')\n");
+	printf("  -h, --help\t\tdisplay this help and exit\n");
+#ifdef GPIOSET_INTERACTIVE
+	printf("  -i, --interactive\tset the lines then wait for additional set commands\n");
+	printf("\t\t\tUse the 'help' command at the interactive prompt to get help\n");
+	printf("\t\t\tfor the supported commands.\n");
+#endif
+	printf("  -l, --active-low\ttreat the line as active low\n");
+	printf("  -p, --hold-period <period>\n");
+	printf("\t\t\tthe minimum time period to hold lines at the requested values\n");
+	printf("  -s, --strict\t\tabort if requested line names are not unique\n");
+	printf("  -t, --toggle <period>[,period]...\n");
+	printf("\t\t\ttoggle the line(s) after the specified period(s)\n");
+	printf("\t\t\tIf the last period is non-zero then the sequence repeats.\n");
+	printf("      --unquoted\tdon't quote line names\n");
+	printf("  -v, --version\t\toutput version information and exit\n");
+	printf("  -z, --daemonize\tset values then detach from the controlling terminal\n");
+	print_chip_help();
+	print_period_help();
+	printf("\n");
+	printf("*Note*\n");
+	printf("    The state of a GPIO line controlled over the character device reverts to default\n");
+	printf("    when the last process referencing the file descriptor representing the device file exits.\n");
+	printf("    This means that it's wrong to run gpioset, have it exit and expect the line to continue\n");
+	printf("    being driven high or low. It may happen if given pin is floating but it must be interpreted\n");
+	printf("    as undefined behavior.\n");
+}
+
+static int parse_drive_or_die(const char *option)
+{
+	if (strcmp(option, "open-drain") == 0)
+		return GPIOD_LINE_DRIVE_OPEN_DRAIN;
+	if (strcmp(option, "open-source") == 0)
+		return GPIOD_LINE_DRIVE_OPEN_SOURCE;
+	if (strcmp(option, "push-pull") != 0)
+		die("invalid drive: %s", option);
+	return 0;
+}
+
+static int parse_periods_or_die(char *option, unsigned int **periods)
+{
+	int i, num_periods = 1;
+	unsigned int *pp;
+	char *end;
+
+	for (i = 0; option[i] != '\0'; i++)
+		if (option[i] == ',')
+			num_periods++;
+
+	pp = calloc(num_periods, sizeof(*pp));
+	if (pp == NULL)
+		die("out of memory");
+
+	for (i = 0; i < num_periods - 1; i++) {
+		for (end = option; *end != ','; end++)
+			;
+
+		*end = '\0';
+		pp[i] = parse_period_or_die(option);
+		option = end + 1;
+	}
+	pp[i] = parse_period_or_die(option);
+	*periods = pp;
+
+	return num_periods;
+}
+
+
+struct config {
+	bool active_low;
+	bool banner;
+	bool by_name;
+	bool daemonize;
+	bool interactive;
+	bool strict;
+	bool unquoted;
+	int bias;
+	int drive;
+	int toggles;
+	unsigned int *toggle_periods;
+	unsigned int hold_period_us;
+	const char *chip_id;
+	const char *consumer;
+};
+
+static int parse_config(int argc, char **argv, struct config *cfg)
+{
+	int opti, optc;
+#ifdef GPIOSET_INTERACTIVE
+	const char *const shortopts = "+b:c:C:d:hilp:st:vz";
+#else
+	const char *const shortopts = "+b:c:C:d:hlp:st:vz";
+#endif
+	static const struct option longopts[] = {
+		{ "active-low",	no_argument,		NULL,	'l' },
+		{ "banner",	no_argument,		NULL,	'-'},
+		{ "bias",	required_argument,	NULL,	'b' },
+		{ "by-name",	no_argument,		NULL,	'B' },
+		{ "chip",	required_argument,	NULL,	'c' },
+		{ "consumer",	required_argument,	NULL,	'C' },
+		{ "daemonize",	no_argument,		NULL,	'z' },
+		{ "drive",	required_argument,	NULL,	'd' },
+		{ "help",	no_argument,		NULL,	'h' },
+		{ "hold-period", required_argument,	NULL,	'p' },
+#ifdef GPIOSET_INTERACTIVE
+		{ "interactive", no_argument,		NULL,	'i' },
+#endif
+		{ "strict",	no_argument,		NULL,	's' },
+		{ "toggle",	required_argument,	NULL,	't' },
+		{ "unquoted",	no_argument,		NULL,	'Q' },
+		{ "version",	no_argument,		NULL,	'v' },
+		{ GETOPT_NULL_LONGOPT },
+	};
+
+	memset(cfg, 0, sizeof(*cfg));
+	cfg->consumer = "gpioset";
+	for (;;) {
+		optc = getopt_long(argc, argv, shortopts, longopts, &opti);
+		if (optc < 0)
+			break;
+
+		switch (optc) {
+		case '-':
+			cfg->banner = true;
+			break;
+		case 'b':
+			cfg->bias = parse_bias_or_die(optarg);
+			break;
+		case 'B':
+			cfg->by_name = true;
+			break;
+		case 'c':
+			cfg->chip_id = optarg;
+			break;
+		case 'C':
+			cfg->consumer = optarg;
+			break;
+		case 'd':
+			cfg->drive = parse_drive_or_die(optarg);
+			break;
+#ifdef GPIOSET_INTERACTIVE
+		case 'i':
+			cfg->interactive = true;
+			break;
+#endif
+		case 'l':
+			cfg->active_low = true;
+			break;
+		case 'p':
+			cfg->hold_period_us = parse_period_or_die(optarg);
+			break;
+		case 'Q':
+			cfg->unquoted = true;
+			break;
+		case 's':
+			cfg->strict = true;
+			break;
+		case 't':
+			cfg->toggles = parse_periods_or_die(optarg,
+						 &cfg->toggle_periods);
+			break;
+		case 'z':
+			cfg->daemonize = true;
+			break;
+		case 'h':
+			print_help();
+			exit(EXIT_SUCCESS);
+		case 'v':
+			print_version();
+			exit(EXIT_SUCCESS);
+		case '?':
+			die("try %s --help", get_progname());
+		case 0:
+			break;
+		default:
+			abort();
+		}
+	}
+
+#ifdef GPIOSET_INTERACTIVE
+	if (cfg->toggles && cfg->interactive)
+		die("can't combine interactive with toggle");
+#endif
+
+	return optind;
+}
+
+static int parse_value(const char *option)
+{
+	if (strcmp(option, "0") == 0)
+		return 0;
+	if (strcmp(option, "1") == 0)
+		return 1;
+	if (strcmp(option, "inactive") == 0)
+		return 0;
+	if (strcmp(option, "active") == 0)
+		return 1;
+	if (strcmp(option, "off") == 0)
+		return 0;
+	if (strcmp(option, "on") == 0)
+		return 1;
+	if (strcmp(option, "false") == 0)
+		return 0;
+	if (strcmp(option, "true") == 0)
+		return 1;
+	return -1;
+}
+
+/*
+ * Parse line id and values from lvs into lines and values.
+ *
+ * Accepted forms:
+ *	'line=value'
+ *	'"line"=value'
+ *
+ * If line id is quoted then it is returned unquoted.
+ */
+static bool parse_line_values(int num_lines, char **lvs, char **lines,
+			      int *values, bool interactive)
+{
+	int i;
+	char *value;
+	char *line;
+
+	for (i = 0; i < num_lines; i++) {
+		line = lvs[i];
+		if (*line != '"') {
+			value = strchr(line, '=');
+		} else {
+			line++;
+			value = strstr(line, "\"=");
+			if (value) {
+				*value = '\0';
+				value++;
+			}
+
+		}
+		if (!value) {
+			if (interactive)
+				printf("invalid line value: '%s'\n", lvs[i]);
+			else
+				print_error("invalid line value: '%s'", lvs[i]);
+
+			return false;
+		}
+		*value = '\0';
+		value++;
+		values[i] = parse_value(value);
+		if (values[i] < 0) {
+			if (interactive)
+				printf("invalid line value: '%s'\n", value);
+			else
+				print_error("invalid line value: '%s'", value);
+
+			return false;
+		}
+		lines[i] = line;
+	}
+	return true;
+}
+
+/*
+ * Parse line id and values from lvs into lines and values, or die trying.
+ */
+static void parse_line_values_or_die(int num_lines, char **lvs, char **lines,
+				     int *values)
+{
+	if (!parse_line_values(num_lines, lvs, lines, values, false))
+		exit(EXIT_FAILURE);
+}
+
+static void print_banner(int num_lines, char **lines)
+{
+	int i;
+
+	if (num_lines > 1) {
+		printf("Setting lines ");
+
+		for (i = 0; i < num_lines - 1; i++)
+			printf("'%s', ", lines[i]);
+
+		printf("and '%s'...\n", lines[i]);
+	} else {
+		printf("Setting line '%s'...\n", lines[0]);
+	}
+	fflush(stdout);
+}
+
+static void wait_fd(int fd)
+{
+	struct pollfd pfd;
+
+	pfd.fd = fd;
+	pfd.events = POLLERR;
+
+	if (poll(&pfd, 1, -1) < 0)
+		die_perror("error waiting on request");
+}
+
+/*
+ * Apply values from the resolver to the requests.
+ * offset and values are scratch pads for working.
+ */
+static void apply_values(struct gpiod_line_request **requests,
+			 struct line_resolver *resolver,
+			 unsigned int *offsets, int *values)
+{
+	int i;
+
+	for (i = 0; i < resolver->num_chips; i++) {
+		get_line_offsets_and_values(resolver, i, offsets, values);
+		if (gpiod_line_request_set_values(requests[i], values))
+			print_perror("unable to set values on '%s'",
+				     get_chip_name(resolver, i));
+	}
+}
+
+/* Toggle the values of all lines in the resolver */
+static void toggle_all_lines(struct line_resolver *resolver)
+{
+	int i;
+
+	for (i = 0; i < resolver->num_lines; i++)
+		resolver->lines[i].value = !resolver->lines[i].value;
+}
+
+/*
+ * Toggle the resolved lines as specified by the toggle_periods,
+ * and apply the values to the requests.
+ * offset and values are scratch pads for working.
+ */
+static void toggle_sequence(int toggles, unsigned int *toggle_periods,
+			 struct gpiod_line_request **requests,
+			 struct line_resolver *resolver,
+			 unsigned int *offsets, int *values)
+{
+	int i = 0;
+
+	if ((toggles == 1) && (toggle_periods[0] == 0))
+		return;
+
+	for (;;) {
+		usleep(toggle_periods[i]);
+		toggle_all_lines(resolver);
+		apply_values(requests, resolver, offsets, values);
+
+		i++;
+		if ((i == toggles - 1) && (toggle_periods[i] == 0))
+			return;
+
+		if (i == toggles)
+			i = 0;
+	}
+}
+
+
+#ifdef GPIOSET_INTERACTIVE
+
+/*
+ * Parse line id from words into lines.
+ *
+ * If line id is quoted then it is returned unquoted.
+ */
+static bool parse_line_ids(int num_lines, char **words, char **lines)
+{
+	int i, len;
+	char *line;
+
+	for (i = 0; i < num_lines; i++) {
+		line = words[i];
+		if (*line == '"') {
+			line++;
+			len = strlen(line);
+			if ((len == 0) || line[len - 1] != '"') {
+				printf("invalid line id: '%s'\n", words[i]);
+				return false;
+			}
+			line[len - 1] = '\0';
+		}
+		lines[i] = line;
+	}
+	return true;
+}
+
+/*
+ * Set the values in the resolver for the line values specified by
+ * the remaining parameters.
+ */
+static void set_line_values_subset(struct line_resolver *resolver,
+				   int num_lines, char **lines, int *values)
+{
+	int l, i;
+
+	for (l = 0; l < num_lines; l++)
+		for (i = 0; i < resolver->num_lines; i++)
+			if (strcmp(lines[l], resolver->lines[i].id) == 0) {
+				resolver->lines[i].value = values[l];
+				break;
+			}
+}
+
+static void print_all_line_values(struct line_resolver *resolver, bool unquoted)
+{
+	int i;
+	char *fmt = unquoted ? "%s=%s " : "\"%s\"=%s ";
+
+	for (i = 0; i < resolver->num_lines; i++) {
+		if (i == resolver->num_lines - 1)
+			fmt = unquoted ? "%s=%s\n" : "\"%s\"=%s\n";
+
+		printf(fmt, resolver->lines[i].id,
+		       resolver->lines[i].value ? "active" : "inactive");
+	}
+}
+
+/*
+ * Print the resovler line values for a subset of lines, specified by
+ * num_lines and lines.
+ */
+static void print_line_values(struct line_resolver *resolver, int num_lines,
+			      char **lines, bool unquoted)
+{
+	int i, j;
+	char *fmt = unquoted ? "%s=%s " : "\"%s\"=%s ";
+	struct resolved_line *line;
+
+	for (i = 0; i < num_lines; i++) {
+		if (i == num_lines - 1)
+			fmt = unquoted ? "%s=%s\n" : "\"%s\"=%s\n";
+
+		for (j = 0; j < resolver->num_lines; j++) {
+			line = &resolver->lines[j];
+			if (strcmp(lines[i], line->id) == 0) {
+				printf(fmt, line->id,
+				       line->value ? "active" : "inactive");
+				break;
+			}
+		}
+	}
+}
+
+/*
+ * Toggle a subset of lines, specified by num_lines and lines, in the resolver.
+ */
+static void toggle_lines(struct line_resolver *resolver, int num_lines,
+			 char **lines)
+{
+	int i, j;
+	struct resolved_line *line;
+
+	for (i = 0; i < num_lines; i++)
+		for (j = 0; j < resolver->num_lines; j++) {
+			line = &resolver->lines[j];
+			if (strcmp(lines[i], line->id) == 0) {
+				line->value = !line->value;
+				break;
+			}
+		}
+}
+
+/*
+ * Check that a set of lines, specified by num_lines and lines, are all
+ * resolved lines.
+ */
+static bool valid_lines(struct line_resolver *resolver, int num_lines,
+			char **lines)
+{
+	bool ret = true;
+	int i, l;
+	bool found;
+
+	for (l = 0; l < num_lines; l++) {
+		found = false;
+		for (i = 0; i < resolver->num_lines; i++) {
+			if (strcmp(lines[l], resolver->lines[i].id) == 0) {
+				found = true;
+				break;
+			}
+		}
+		if (!found) {
+			printf("unknown line: '%s'\n", lines[l]);
+			ret = false;
+		}
+	}
+	return  ret;
+}
+
+static void print_interactive_help(void)
+{
+	printf("COMMANDS:\n\n");
+	printf("    exit\n");
+	printf("        Exit the program\n");
+	printf("    get [line]...\n");
+	printf("        Display the output values of the given requested lines\n\n");
+	printf("        If no lines are specified then all requested lines are displayed\n\n");
+	printf("    help\n");
+	printf("        Print this help\n\n");
+	printf("    set <line=value>...\n");
+	printf("        Update the output values of the given requested lines\n\n");
+	printf("    sleep <period>\n");
+	printf("        Sleep for the specified period\n\n");
+	printf("    toggle [line]...\n");
+	printf("        Toggle the output values of the given requested lines\n\n");
+	printf("        If no lines are specified then all requested lines are toggled\n\n");
+}
+
+/*
+ * Split a line into words, returning the each of the words and the count.
+ *
+ * max_words specifies the max number of words that may be returned in words.
+ *
+ * Any escaping is ignored, on the assumption that the only escaped
+ * character of consequence is '"', and that names won't include quotes.
+ */
+static int split_words(char *line, int max_words, char **words)
+{
+	int num_words = 0;
+	bool in_word = false;
+	bool in_quotes = false;
+
+	for (; (*line != '\0'); line++) {
+		if (!in_word) {
+			if (isspace(*line))
+				continue;
+
+			in_word = true;
+			in_quotes = (*line == '"');
+
+			/* count all words, but only store max_words */
+			if (num_words < max_words)
+				words[num_words] = line;
+		} else {
+			if (in_quotes) {
+				if (*line == '"')
+					in_quotes = false;
+				continue;
+			}
+			if (isspace(*line)) {
+				num_words++;
+				in_word = false;
+				*line = '\0';
+			}
+		}
+	}
+	if (in_word)
+		num_words++;
+
+	return num_words;
+}
+
+/* check if a line is specified somewhere in the rl_line_buffer */
+static bool in_line_buffer(const char *id)
+{
+	int len = strlen(id);
+	char *match = rl_line_buffer;
+
+	while ((match = strstr(match, id))) {
+		if ((match > rl_line_buffer && isspace(match[-1])) &&
+		    ((match[len] == '=') || isspace(match[len])))
+			return true;
+
+		match += len;
+	}
+
+	return false;
+}
+
+/* context for complete_line_id, so it can provide valid line ids */
+static struct line_resolver *completion_context;
+
+/* tab completion helper for line ids */
+static char *complete_line_id(const char *text, int state)
+{
+	static int idx, len;
+	const char *id;
+
+	if (!state) {
+		idx = 0;
+		len = strlen(text);
+	}
+	while (idx < completion_context->num_lines) {
+		id = completion_context->lines[idx].id;
+		idx++;
+		if ((strncmp(id, text, len) == 0) &&
+		    (!in_line_buffer(id)))
+			return strdup(id);
+	}
+	return NULL;
+}
+
+/* tab completion helper for line values (just the value component) */
+static char *complete_value(const char *text, int state)
+{
+	static const char * const values[] = {
+		"1", "0", "active", "inactive", "on", "off", "true", "false",
+		NULL
+	};
+	static int idx, len;
+	const char *value;
+
+	if (!state) {
+		idx = 0;
+		len = strlen(text);
+	}
+	while ((value = values[idx])) {
+		idx++;
+		if (strncmp(value, text, len) == 0)
+			return strdup(value);
+	}
+	return NULL;
+}
+
+/* tab completion help for interactive commands */
+static char *complete_command(const char *text, int state)
+{
+	static const char * const commands[] = {
+		"get", "set", "toggle", "sleep", "help", "exit", NULL
+	};
+	static int idx, len;
+	const char *cmd;
+
+	if (!state) {
+		idx = 0;
+		len = strlen(text);
+	}
+
+	while ((cmd = commands[idx])) {
+		idx++;
+		if (strncmp(cmd, text, len) == 0)
+			return strdup(cmd);
+	}
+	return NULL;
+}
+
+/* tab completion for interactive command lines */
+static char **tab_completion(const char *text, int start, int end)
+{
+	char **matches = NULL;
+	int cmd_start, cmd_end, len;
+
+	rl_attempted_completion_over = true;
+	rl_completion_type = '@';
+	rl_completion_append_character = ' ';
+
+	for (cmd_start = 0;
+	     isspace(rl_line_buffer[cmd_start]) && cmd_start < end;
+	     cmd_start++)
+		;
+
+	if (cmd_start == start)
+		matches = rl_completion_matches(text, complete_command);
+
+	for (cmd_end = cmd_start + 1;
+	     !isspace(rl_line_buffer[cmd_end]) && cmd_end < end;
+	     cmd_end++)
+		;
+
+	len = cmd_end - cmd_start;
+	if (len == 3 && strncmp("set ", &rl_line_buffer[cmd_start], 4) == 0) {
+		if (rl_line_buffer[start - 1] == '=') {
+			matches = rl_completion_matches(text, complete_value);
+		} else {
+			rl_completion_append_character = '=';
+			matches = rl_completion_matches(text, complete_line_id);
+		}
+	}
+
+	if ((len == 3 && strncmp("get ", &rl_line_buffer[cmd_start], 4) == 0) ||
+	    (len == 6 && strncmp("toggle ", &rl_line_buffer[cmd_start], 7) == 0))
+		matches = rl_completion_matches(text, complete_line_id);
+
+	return matches;
+}
+
+#define PROMPT "gpioset> "
+
+static void interact(struct gpiod_line_request **requests,
+		    struct line_resolver *resolver,
+		    char **lines, unsigned int *offsets, int *values,
+		    bool unquoted)
+{
+	char *line;
+	int num_words, num_lines, max_words;
+	char **words;
+	int period_us, i;
+	char *line_buf;
+	bool done, stdout_is_tty;
+
+	stifle_history(20);
+	rl_attempted_completion_function = tab_completion;
+	rl_basic_word_break_characters = " =\"";
+	completion_context = resolver;
+	stdout_is_tty = isatty(1);
+
+	max_words = resolver->num_lines + 1;
+	words = calloc(max_words, sizeof(*words));
+	if (!words)
+		die("out of memory");
+
+	for (done = false; !done;) {
+		/*
+		 * manually print the prompt, as libedit doesn't if stdout
+		 * is not a tty.  And fflush to ensure the prompt and any
+		 * output buffered from the previous command is sent.
+		 */
+		if (!stdout_is_tty)
+			printf(PROMPT);
+		fflush(stdout);
+
+		line = readline(PROMPT);
+		if (!line || line[0] == '\0')
+			continue;
+
+		for (i = strlen(line) - 1; (i > 0) && isspace(line[i]); i--)
+			line[i] = '\0';
+
+		line_buf = strdup(line);
+		num_words = split_words(line_buf, max_words, words);
+		if (num_words > max_words) {
+			printf("too many command parameters provided\n");
+			goto cmd_done;
+		}
+		num_lines = num_words - 1;
+		if (strcmp(words[0], "get") == 0) {
+			if (num_lines == 0)
+				print_all_line_values(resolver, unquoted);
+			else if (parse_line_ids(num_lines, &words[1], lines) &&
+				 valid_lines(resolver, num_lines, lines))
+				print_line_values(resolver, num_lines,
+						  lines, unquoted);
+			goto cmd_ok;
+		}
+		if (strcmp(words[0], "set") == 0) {
+			if (num_lines == 0)
+				printf("at least one GPIO line value must be specified\n");
+			else if (parse_line_values(num_lines, &words[1], lines,
+						   values, true) &&
+				 valid_lines(resolver, num_lines, lines)) {
+				set_line_values_subset(resolver, num_lines,
+						       lines, values);
+				apply_values(requests, resolver, offsets,
+					     values);
+			}
+			goto cmd_ok;
+		}
+		if (strcmp(words[0], "toggle") == 0) {
+			if (num_lines == 0)
+				toggle_all_lines(resolver);
+			else if (parse_line_ids(num_lines, &words[1], lines) &&
+				 valid_lines(resolver, num_lines, lines))
+				toggle_lines(resolver, num_lines, lines);
+
+			apply_values(requests, resolver, offsets, values);
+			goto cmd_ok;
+		}
+		if (strcmp(words[0], "sleep") == 0) {
+			if (num_lines == 0) {
+				printf("a period must be specified\n");
+				goto cmd_ok;
+			}
+			if (num_lines > 1) {
+				printf("only one period can be specified\n");
+				goto cmd_ok;
+			}
+			period_us = parse_period(words[1]);
+			if (period_us < 0) {
+				printf("invalid period: '%s'\n", words[1]);
+				goto cmd_ok;
+			}
+			usleep(period_us);
+			goto cmd_ok;
+		}
+
+		if (strcmp(words[0], "exit") == 0) {
+			done = true;
+			goto cmd_done;
+		}
+
+		if (strcmp(words[0], "help") == 0) {
+			print_interactive_help();
+			goto cmd_done;
+		}
+
+		printf("unknown command: '%s'\n", words[0]);
+		printf("Try the 'help' command\n")
+			;
+
+cmd_ok:
+		for (i = 0; isspace(line[i]); i++)
+			;
+
+		if ((history_length) == 0 ||
+		    (strcmp(history_list()[history_length - 1]->line,
+			    &line[i]) != 0))
+			add_history(&line[i]);
+
+cmd_done:
+		free(line);
+		free(line_buf);
+	}
+	free(words);
+}
+
+#endif /* GPIOSET_INTERACTIVE */
+
+int main(int argc, char **argv)
+{
+	int i, j, num_lines, ret, *values;
+	struct gpiod_line_settings *settings;
+	struct gpiod_request_config *req_cfg;
+	struct gpiod_line_request **requests;
+	struct gpiod_line_config *line_cfg;
+	struct gpiod_chip *chip;
+	unsigned int *offsets;
+	struct line_resolver *resolver;
+	char **lines;
+	struct config cfg;
+
+	i = parse_config(argc, argv, &cfg);
+	argc -= i;
+	argv += i;
+
+	if (argc < 1)
+		die("at least one GPIO line value must be specified");
+
+	num_lines = argc;
+
+	lines = calloc(num_lines, sizeof(*lines));
+	values = calloc(num_lines, sizeof(*values));
+	if (!lines || !values)
+		die("out of memory");
+
+	parse_line_values_or_die(argc, argv, lines, values);
+
+	settings = gpiod_line_settings_new();
+	if (!settings)
+		die_perror("unable to allocate line settings");
+
+	if (cfg.bias)
+		gpiod_line_settings_set_bias(settings, cfg.bias);
+
+	if (cfg.drive)
+		gpiod_line_settings_set_drive(settings, cfg.drive);
+
+	if (cfg.active_low)
+		gpiod_line_settings_set_active_low(settings, true);
+
+	gpiod_line_settings_set_direction(settings,
+					  GPIOD_LINE_DIRECTION_OUTPUT);
+
+	req_cfg = gpiod_request_config_new();
+	if (!req_cfg)
+		die_perror("unable to allocate the request config structure");
+
+	gpiod_request_config_set_consumer(req_cfg, cfg.consumer);
+	resolver = resolve_lines(num_lines, lines, cfg.chip_id, cfg.strict,
+				 cfg.by_name);
+	validate_resolution(resolver, cfg.chip_id);
+	for (i = 0; i < num_lines; i++)
+		resolver->lines[i].value = values[i];
+
+	requests = calloc(resolver->num_chips, sizeof(*requests));
+	offsets = calloc(num_lines, sizeof(*offsets));
+	if (!requests || !offsets)
+		die("out of memory");
+
+	line_cfg = gpiod_line_config_new();
+	if (!line_cfg)
+		die_perror("unable to allocate the line config structure");
+
+	for (i = 0; i < resolver->num_chips; i++) {
+		num_lines = get_line_offsets_and_values(resolver, i,
+							offsets, values);
+
+		gpiod_line_config_reset(line_cfg);
+		for (j = 0; j < num_lines; j++) {
+			gpiod_line_settings_set_output_value(settings,
+							     values[j]);
+
+			ret = gpiod_line_config_add_line_settings(line_cfg,
+					 &offsets[j], 1, settings);
+			if (ret)
+				die_perror("unable to add line settings");
+		}
+
+		chip = gpiod_chip_open(resolver->chips[i].path);
+		if (!chip)
+			die_perror("unable to open chip '%s'",
+				   resolver->chips[i].path);
+
+		requests[i] = gpiod_chip_request_lines(chip, req_cfg, line_cfg);
+		if (!requests[i])
+			die_perror("unable to request lines on chip '%s'",
+				   resolver->chips[i].path);
+
+		gpiod_chip_close(chip);
+	}
+
+	gpiod_request_config_free(req_cfg);
+	gpiod_line_config_free(line_cfg);
+	gpiod_line_settings_free(settings);
+
+	if (cfg.banner)
+		print_banner(argc, lines);
+
+	if (cfg.daemonize)
+		if (daemon(0, cfg.interactive) < 0)
+			die_perror("unable to daemonize");
+
+	if (cfg.toggles) {
+		for (i = 0; i < cfg.toggles; i++)
+			if ((cfg.hold_period_us > cfg.toggle_periods[i]) &&
+			    ((i != cfg.toggles - 1) ||
+			     cfg.toggle_periods[i] != 0))
+				cfg.toggle_periods[i] = cfg.hold_period_us;
+
+		toggle_sequence(cfg.toggles, cfg.toggle_periods, requests,
+				resolver, offsets, values);
+		free(cfg.toggle_periods);
+	}
+
+	if (cfg.hold_period_us)
+		usleep(cfg.hold_period_us);
+
+#ifdef GPIOSET_INTERACTIVE
+	if (cfg.interactive)
+		interact(requests, resolver, lines, offsets, values,
+			 cfg.unquoted);
+	else if (!cfg.toggles)
+		wait_fd(gpiod_line_request_get_fd(requests[0]));
+#else
+	if (!cfg.toggles)
+		wait_fd(gpiod_line_request_get_fd(requests[0]));
+#endif
+
+	for (i = 0; i < resolver->num_chips; i++)
+		gpiod_line_request_release(requests[i]);
+
+	free(requests);
+	free_line_resolver(resolver);
+	free(lines);
+	free(values);
+	free(offsets);
+
+	return EXIT_SUCCESS;
+}
+
diff --git a/tools/tools-common.c b/tools/tools-common.c
index ea7dfa8..b6f4335 100644
--- a/tools/tools-common.c
+++ b/tools/tools-common.c
@@ -1,18 +1,22 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 // SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
+// SPDX-FileCopyrightText: 2022 Kent Gibson <warthog618@gmail.com>
 
 /* Common code for GPIO tools. */
 
 #include <ctype.h>
+#include <dirent.h>
 #include <errno.h>
 #include <gpiod.h>
+#include <inttypes.h>
 #include <libgen.h>
-#include <signal.h>
+#include <limits.h>
 #include <stdarg.h>
 #include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
-#include <sys/signalfd.h>
+#include <sys/stat.h>
+#include <time.h>
 
 #include "tools-common.h"
 
@@ -21,6 +25,28 @@ const char *get_progname(void)
 	return program_invocation_name;
 }
 
+void print_error(const char *fmt, ...)
+{
+	va_list va;
+
+	va_start(va, fmt);
+	fprintf(stderr, "%s: ", program_invocation_name);
+	vfprintf(stderr, fmt, va);
+	fprintf(stderr, "\n");
+	va_end(va);
+}
+
+void print_perror(const char *fmt, ...)
+{
+	va_list va;
+
+	va_start(va, fmt);
+	fprintf(stderr, "%s: ", program_invocation_name);
+	vfprintf(stderr, fmt, va);
+	fprintf(stderr, ": %s\n", strerror(errno));
+	va_end(va);
+}
+
 void die(const char *fmt, ...)
 {
 	va_list va;
@@ -57,41 +83,305 @@ void print_version(void)
 	printf("There is NO WARRANTY, to the extent permitted by law.\n");
 }
 
-int parse_bias(const char *option)
+int parse_bias_or_die(const char *option)
 {
 	if (strcmp(option, "pull-down") == 0)
 		return GPIOD_LINE_BIAS_PULL_DOWN;
 	if (strcmp(option, "pull-up") == 0)
 		return GPIOD_LINE_BIAS_PULL_UP;
-	if (strcmp(option, "disable") == 0)
-		return GPIOD_LINE_BIAS_DISABLED;
-	if (strcmp(option, "as-is") != 0)
+	if (strcmp(option, "disabled") != 0)
 		die("invalid bias: %s", option);
-	return 0;
+	return GPIOD_LINE_BIAS_DISABLED;
+}
+
+int parse_period(const char *option)
+{
+	unsigned long p, m = 0;
+	char *end;
+
+	p = strtoul(option, &end, 10);
+	switch (*end) {
+	case 'u':
+		m = 1;
+		end++;
+		break;
+	case 'm':
+		m = 1000;
+		end++;
+		break;
+	case 's':
+		m = 1000000;
+		break;
+	case '\0':
+		break;
+	default:
+		return -1;
+	}
+
+	if (m) {
+		if (*end != 's')
+			return -1;
+
+		end++;
+	} else {
+		m = 1000;
+	}
+
+	p *= m;
+	if (*end != '\0' || p > INT_MAX)
+		return -1;
+
+	return p;
+}
+
+unsigned int parse_period_or_die(const char *option)
+{
+	int period = parse_period(option);
+
+	if (period < 0)
+		die("invalid period: %s", option);
+
+	return period;
+}
+
+int parse_uint(const char *option)
+{
+	unsigned long o;
+	char *end;
+
+	o = strtoul(option, &end, 10);
+	if (*end == '\0' && o <= INT_MAX)
+		return o;
+
+	return -1;
+}
+
+unsigned int parse_uint_or_die(const char *option)
+{
+	int i = parse_uint(option);
+
+	if (i < 0)
+		die("invalid number: '%s'", option);
+
+	return i;
 }
 
 void print_bias_help(void)
 {
-	printf("Biases:\n");
-	printf("  as-is:\tleave bias unchanged\n");
-	printf("  disable:\tdisable bias\n");
-	printf("  pull-up:\tenable pull-up\n");
-	printf("  pull-down:\tenable pull-down\n");
+	printf("  -b, --bias <bias>\tspecify the line bias\n");
+	printf("\t\t\tPossible values: 'pull-down', 'pull-up', 'disabled'.\n");
+	printf("\t\t\t(default is to leave bias unchanged)\n");
+}
+
+void print_chip_help(void)
+{
+	printf("\nChips:\n");
+	printf("    A GPIO chip may be identified by number, name, or path.\n");
+	printf("    e.g. '0', 'gpiochip0', and '/dev/gpiochip0' all refer to the same chip.\n");
 }
 
-int chip_dir_filter(const struct dirent *entry)
+void print_period_help(void)
+{
+	printf("\nPeriods:\n");
+	printf("    Periods are taken as milliseconds unless units are specified. e.g. 10us.\n");
+	printf("    Supported units are 's', 'ms', and 'us'.\n");
+}
+
+#define TIME_BUFFER_SIZE 20
+
+/*
+ * format:
+ * 0: raw seconds
+ * 1: utc time
+ * 2: local time
+ */
+void print_event_time(uint64_t evtime, int format)
+{
+	time_t evtsec;
+	struct tm t;
+	char tbuf[TIME_BUFFER_SIZE];
+	char *tz;
+
+	if (format) {
+		evtsec = evtime / 1000000000;
+		if (format == 2) {
+			localtime_r(&evtsec, &t);
+			tz = "";
+		} else {
+			gmtime_r(&evtsec, &t);
+			tz = "Z";
+		}
+		strftime(tbuf, TIME_BUFFER_SIZE, "%FT%T", &t);
+		printf("%s.%09"PRIu64"%s", tbuf, evtime % 1000000000, tz);
+	} else {
+		printf("%"PRIu64".%09"PRIu64,
+		       evtime / 1000000000, evtime % 1000000000);
+	}
+}
+
+static void print_bias(struct gpiod_line_info *info)
+{
+	const char *name;
+
+	switch (gpiod_line_info_get_bias(info)) {
+	case GPIOD_LINE_BIAS_PULL_UP:
+		name = "pull-up";
+		break;
+	case GPIOD_LINE_BIAS_PULL_DOWN:
+		name = "pull-down";
+		break;
+	case GPIOD_LINE_BIAS_DISABLED:
+		name = "disabled";
+		break;
+	default:
+		return;
+	}
+	printf(" bias=%s", name);
+}
+
+static void print_drive(struct gpiod_line_info *info)
+{
+	const char *name;
+
+	switch (gpiod_line_info_get_drive(info)) {
+	case GPIOD_LINE_DRIVE_OPEN_DRAIN:
+		name = "open-drain";
+		break;
+	case GPIOD_LINE_DRIVE_OPEN_SOURCE:
+		name = "open-source";
+		break;
+	default:
+		return;
+	}
+	printf(" drive=%s", name);
+}
+
+static void print_edge_detection(struct gpiod_line_info *info)
+{
+	const char *name;
+
+	switch (gpiod_line_info_get_edge_detection(info)) {
+	case GPIOD_LINE_EDGE_BOTH:
+		name = "both";
+		break;
+	case GPIOD_LINE_EDGE_RISING:
+		name = "rising";
+		break;
+	case GPIOD_LINE_EDGE_FALLING:
+		name = "falling";
+		break;
+	default:
+		return;
+	}
+	printf(" edges=%s", name);
+}
+
+static void print_event_clock(struct gpiod_line_info *info)
+{
+	const char *name;
+
+	switch (gpiod_line_info_get_event_clock(info)) {
+	case GPIOD_LINE_EVENT_CLOCK_REALTIME:
+		name = "realtime";
+		break;
+	case GPIOD_LINE_EVENT_CLOCK_HTE:
+		name = "hte";
+		break;
+	default:
+		return;
+	}
+	printf(" event-clock=%s", name);
+}
+
+static void print_debounce(struct gpiod_line_info *info)
+{
+	unsigned long debounce;
+	const char *units = "us";
+
+	debounce = gpiod_line_info_get_debounce_period_us(info);
+	if (!debounce)
+		return;
+	if (debounce % 1000000 == 0) {
+		debounce /= 1000000;
+		units = "s";
+	} else if (debounce % 1000 == 0) {
+		debounce /= 1000;
+		units = "ms";
+	}
+	printf(" debounce-period=%lu%s", debounce, units);
+}
+
+static void print_consumer(struct gpiod_line_info *info, bool unquoted)
+{
+	const char *consumer;
+	const char *fmt;
+
+	if (!gpiod_line_info_is_used(info))
+		return;
+
+	consumer = gpiod_line_info_get_consumer(info);
+	if (!consumer)
+		consumer = "kernel";
+
+	fmt = unquoted ? " consumer=%s" : " consumer=\"%s\"";
+
+	printf(fmt, consumer);
+}
+
+void print_line_attributes(struct gpiod_line_info *info, bool unquoted_strings)
+{
+	int direction;
+
+	direction = gpiod_line_info_get_direction(info);
+
+	printf("%s", direction == GPIOD_LINE_DIRECTION_INPUT ?
+			"input" : "output");
+
+	if (gpiod_line_info_is_active_low(info))
+		printf(" active-low");
+
+	print_drive(info);
+	print_bias(info);
+	print_edge_detection(info);
+	print_event_clock(info);
+	print_debounce(info);
+	print_consumer(info, unquoted_strings);
+}
+
+void print_line_id(struct line_resolver *resolver, int chip_num,
+		   unsigned int offset, const char *chip_id, bool unquoted)
+{
+	const char *lname;
+	const char *fmt;
+
+	lname = get_line_name(resolver, chip_num, offset);
+	if (!lname) {
+		printf("%s %u", get_chip_name(resolver, chip_num), offset);
+		return;
+	}
+	if (chip_id)
+		printf("%s %u ", get_chip_name(resolver, chip_num), offset);
+
+	fmt = unquoted ? "%s" : "\"%s\"";
+	printf(fmt, lname);
+}
+
+static int chip_dir_filter(const struct dirent *entry)
 {
-	bool is_chip;
 	char *path;
-	int ret;
+	int ret = 0;
+	struct stat sb;
 
-	ret = asprintf(&path, "/dev/%s", entry->d_name);
-	if (ret < 0)
+	if (asprintf(&path, "/dev/%s", entry->d_name) < 0)
 		return 0;
 
-	is_chip = gpiod_is_gpiochip_device(path);
+	if ((lstat(path, &sb) == 0) &&
+	    (!S_ISLNK(sb.st_mode)) &&
+	    gpiod_is_gpiochip_device(path))
+		ret = 1;
+
 	free(path);
-	return !!is_chip;
+	return ret;
 }
 
 static bool isuint(const char *str)
@@ -101,3 +391,368 @@ static bool isuint(const char *str)
 
 	return *str == '\0';
 }
+
+bool chip_path_lookup(const char *id, char **path_ptr)
+{
+	char *path;
+
+	if (isuint(id)) {
+		/* by number */
+		if (asprintf(&path, "/dev/gpiochip%s", id) < 0)
+			return false;
+	} else if (strchr(id, '/')) {
+		/* by path */
+		if (asprintf(&path, "%s", id) < 0)
+			return false;
+	} else {
+		/* by device name */
+		if (asprintf(&path, "/dev/%s", id) < 0)
+			return false;
+	}
+
+	if (!gpiod_is_gpiochip_device(path)) {
+		free(path);
+		return false;
+	}
+
+	*path_ptr = path;
+
+	return true;
+}
+
+int chip_paths(const char *id, char ***paths_ptr)
+{
+	char *path;
+	char **paths;
+
+	if (id == NULL)
+		return all_chip_paths(paths_ptr);
+
+	if (!chip_path_lookup(id, &path))
+		return 0;
+
+	paths = malloc(sizeof(*paths));
+	if (paths == NULL)
+		die("out of memory");
+
+	paths[0] = path;
+	*paths_ptr = paths;
+
+	return 1;
+}
+
+int all_chip_paths(char ***paths_ptr)
+{
+	int i, j, num_chips, ret = 0;
+	struct dirent **entries;
+	char **paths;
+
+	num_chips = scandir("/dev/", &entries, chip_dir_filter, alphasort);
+	if (num_chips < 0)
+		die_perror("unable to scan /dev");
+
+	paths = calloc(num_chips, sizeof(*paths));
+	if (paths == NULL)
+		die("out of memory");
+
+	for (i = 0; i < num_chips; i++) {
+		if (asprintf(&paths[i], "/dev/%s", entries[i]->d_name) < 0) {
+			for (j = 0; j < i; j++)
+				free(paths[j]);
+
+			free(paths);
+			return 0;
+		}
+	}
+
+	*paths_ptr = paths;
+	ret = num_chips;
+
+	for (i = 0; i < num_chips; i++)
+		free(entries[i]);
+
+	free(entries);
+	return ret;
+}
+
+static bool resolve_line(struct line_resolver *resolver,
+			  struct gpiod_line_info *info,
+			  int chip_num)
+{
+	struct resolved_line *line;
+	const char *name;
+	int i;
+	unsigned int offset;
+	bool resolved = false;
+
+	offset = gpiod_line_info_get_offset(info);
+	for (i = 0; i < resolver->num_lines; i++) {
+		line = &resolver->lines[i];
+		/* already resolved by offset? */
+		if (line->resolved &&
+		    (line->offset == offset) &&
+		    (line->chip_num == chip_num)) {
+			line->info = info;
+			resolver->num_found++;
+			resolved = true;
+		}
+		if (line->resolved && !resolver->strict)
+			continue;
+
+		/* else resolve by name */
+		name = gpiod_line_info_get_name(info);
+		if (name && (strcmp(line->id, name) == 0)) {
+			if (resolver->strict && line->resolved)
+				die("line '%s' is not unique", line->id);
+			line->offset = offset;
+			line->info = info;
+			line->chip_num = resolver->num_chips;
+			line->resolved = true;
+			resolver->num_found++;
+			resolved = true;
+		}
+	}
+
+	return resolved;
+}
+
+/*
+ * check for lines that can be identified by offset
+ *
+ * This only applies to the first chip, as otherwise the lines must be
+ * identified by name.
+ */
+bool resolve_lines_by_offset(struct line_resolver *resolver,
+			     unsigned int num_lines)
+{
+	int i;
+	struct resolved_line *line;
+	bool used = false;
+
+	for (i = 0; i < resolver->num_lines; i++) {
+		line = &resolver->lines[i];
+		if ((line->id_as_offset != -1) &&
+		    (line->id_as_offset < (int)num_lines)) {
+			line->chip_num = 0;
+			line->offset = line->id_as_offset;
+			line->resolved = true;
+			used = true;
+		}
+	}
+	return used;
+}
+
+
+bool resolve_done(struct line_resolver *resolver)
+{
+	return (!resolver->strict &&
+		resolver->num_found >= resolver->num_lines);
+}
+
+struct line_resolver *resolver_init(int num_lines, char **lines, int num_chips,
+				    bool strict, bool by_name)
+{
+	struct line_resolver *resolver;
+	struct resolved_line *line;
+	size_t resolver_size;
+	int i;
+
+	resolver_size = sizeof(*resolver) + num_lines * sizeof(*line);
+	resolver = malloc(resolver_size);
+	if (resolver == NULL)
+		die("out of memory");
+
+	memset(resolver, 0, resolver_size);
+
+	resolver->chips = calloc(num_chips, sizeof(struct resolved_chip));
+	if (resolver->chips == NULL)
+		die("out of memory");
+	memset(resolver->chips, 0, num_chips * sizeof(struct resolved_chip));
+
+	resolver->num_lines = num_lines;
+	resolver->strict = strict;
+	for (i = 0; i < num_lines; i++) {
+		line = &resolver->lines[i];
+		line->id = lines[i];
+		line->id_as_offset = by_name ? -1 : parse_uint(lines[i]);
+		line->chip_num = -1;
+	}
+	return resolver;
+}
+
+struct line_resolver *resolve_lines(int num_lines, char **lines,
+			const char *chip_id, bool strict, bool by_name)
+{
+	struct line_resolver *resolver;
+	struct gpiod_chip *chip;
+	struct gpiod_chip_info *chip_info;
+	struct gpiod_line_info *line_info;
+	char **paths;
+	int num_chips, i, offset;
+	bool chip_used;
+
+	if (chip_id == NULL)
+		by_name = true;
+
+	num_chips = chip_paths(chip_id, &paths);
+	if (chip_id  && (num_chips == 0))
+		die("cannot find GPIO chip character device '%s'", chip_id);
+
+	resolver = resolver_init(num_lines, lines, num_chips, strict, by_name);
+
+	for (i = 0; (i < num_chips) && !resolve_done(resolver); i++) {
+		chip_used = false;
+		chip = gpiod_chip_open(paths[i]);
+		if (!chip) {
+			if ((errno == EACCES) && (chip_id == NULL)) {
+				free(paths[i]);
+				continue;
+			}
+
+			die_perror("unable to open chip '%s'", paths[i]);
+		}
+
+		chip_info = gpiod_chip_get_info(chip);
+		if (!chip_info)
+			die_perror("unable to get info for '%s'", paths[i]);
+
+		num_lines = gpiod_chip_info_get_num_lines(chip_info);
+
+		if (i == 0 && chip_id && !by_name)
+			chip_used = resolve_lines_by_offset(resolver, num_lines);
+
+		for (offset = 0;
+		     (offset < num_lines) && !resolve_done(resolver);
+		     offset++) {
+			line_info = gpiod_chip_get_line_info(chip, offset);
+			if (!line_info)
+				die_perror("unable to read the info for line %d from %s",
+					   offset,
+					   gpiod_chip_info_get_name(chip_info));
+
+			if (resolve_line(resolver, line_info, i))
+				chip_used = true;
+			else
+				gpiod_line_info_free(line_info);
+
+		}
+
+		gpiod_chip_close(chip);
+
+		if (chip_used) {
+			resolver->chips[resolver->num_chips].info = chip_info;
+			resolver->chips[resolver->num_chips].path = paths[i];
+			resolver->num_chips++;
+		} else {
+			gpiod_chip_info_free(chip_info);
+			free(paths[i]);
+		}
+	}
+	free(paths);
+
+	return resolver;
+}
+
+void validate_resolution(struct line_resolver *resolver, const char *chip_id)
+{
+	struct resolved_line *line, *prev;
+	int i, j;
+	bool valid = true;
+
+	for (i = 0 ; i < resolver->num_lines; i++) {
+		line = &resolver->lines[i];
+		if (line->resolved) {
+			for (j = 0; j < i; j++) {
+				prev = &resolver->lines[j];
+				if (prev->resolved &&
+				    (prev->chip_num == line->chip_num) &&
+				    (prev->offset == line->offset)) {
+					print_error("lines '%s' and '%s' are the same line",
+						    prev->id, line->id);
+					valid = false;
+					break;
+				}
+			}
+			continue;
+		}
+		valid = false;
+		if (chip_id && line->id_as_offset != -1)
+			print_error("offset %s is out of range on chip '%s'",
+				    line->id, chip_id);
+		else
+			print_error("cannot find line '%s'", line->id);
+	}
+	if (!valid)
+		exit(EXIT_FAILURE);
+}
+
+void free_line_resolver(struct line_resolver *resolver)
+{
+	int i;
+
+	if (!resolver)
+		return;
+
+	for (i = 0; i < resolver->num_lines; i++)
+		gpiod_line_info_free(resolver->lines[i].info);
+
+	for (i = 0; i < resolver->num_chips; i++) {
+		gpiod_chip_info_free(resolver->chips[i].info);
+		free(resolver->chips[i].path);
+	}
+
+	free(resolver->chips);
+	free(resolver);
+}
+
+int get_line_offsets_and_values(struct line_resolver *resolver,
+		int chip_num, unsigned int *offsets, int *values)
+{
+	struct resolved_line *line;
+	int i, num_lines = 0;
+
+	for (i = 0; i < resolver->num_lines; i++) {
+		line = &resolver->lines[i];
+		if (line->chip_num == chip_num) {
+			offsets[num_lines] = line->offset;
+			if (values)
+				values[num_lines] = line->value;
+
+			num_lines++;
+		}
+	}
+	return num_lines;
+}
+
+const char *get_chip_name(struct line_resolver *resolver, int chip_num)
+{
+	return gpiod_chip_info_get_name(resolver->chips[chip_num].info);
+}
+
+const char *get_line_name(struct line_resolver *resolver,
+			  int chip_num, unsigned int offset)
+{
+	struct resolved_line *line;
+	int i;
+
+	for (i = 0; i < resolver->num_lines; i++) {
+		line = &resolver->lines[i];
+		if (line->info && (line->offset == offset) &&
+		    (line->chip_num == chip_num))
+			return gpiod_line_info_get_name(resolver->lines[i].info);
+	}
+
+	return 0;
+}
+
+void set_line_values(struct line_resolver *resolver, int chip_num, int *values)
+{
+	int i, j;
+
+	for (i = 0, j = 0; i < resolver->num_lines; i++) {
+		if (resolver->lines[i].chip_num == chip_num) {
+			resolver->lines[i].value = values[j];
+			j++;
+		}
+	}
+}
diff --git a/tools/tools-common.h b/tools/tools-common.h
index cb61d54..aa697de 100644
--- a/tools/tools-common.h
+++ b/tools/tools-common.h
@@ -1,10 +1,10 @@
 /* SPDX-License-Identifier: GPL-2.0-or-later */
 /* SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com> */
+/* SPDX-FileCopyrightText: 2022 Kent Gibson <warthog618@gmail.com> */
 
 #ifndef __GPIOD_TOOLS_COMMON_H__
 #define __GPIOD_TOOLS_COMMON_H__
 
-#include <dirent.h>
 #include <gpiod.h>
 
 /*
@@ -21,16 +21,100 @@
 
 #define GETOPT_NULL_LONGOPT	NULL, 0, NULL, 0
 
+struct resolved_line {
+	/* from the command line */
+	const char *id;
+
+	/*
+	 * id parsed as int, if that is an option, or -1 if line must be
+	 * resolved by name
+	 */
+	int id_as_offset;
+
+	/* line has been located on a chip */
+	bool resolved;
+
+	/* remaining fields only valid once resolved... */
+
+	/* info for the line */
+	struct gpiod_line_info *info;
+
+	/* num of relevant chip in line_resolver */
+	int chip_num;
+
+	/* offset of line on chip */
+	uint offset;
+
+	/* line value for gpioget/set */
+	int value;
+};
+
+struct resolved_chip {
+	/* info of the relevant chips */
+	struct gpiod_chip_info *info;
+
+	/* path to the chip */
+	char *path;
+};
+
+/* a resolver from requested line names/offsets to lines on the system */
+struct line_resolver {
+	/*
+	 * number of chips the lines span, and number of entries in chips
+	 */
+	int num_chips;
+
+	/* number of lines in lines */
+	int num_lines;
+
+	/* number of lines found */
+	int num_found;
+
+	/* perform exhaustive search to check line names are unique */
+	bool strict;
+
+	/* details of the relevant chips */
+	struct resolved_chip *chips;
+
+	/* descriptors for the requested lines */
+	struct resolved_line lines[];
+};
+
 const char *get_progname(void);
+void print_error(const char *fmt, ...) PRINTF(1, 2);
+void print_perror(const char *fmt, ...) PRINTF(1, 2);
 void die(const char *fmt, ...) NORETURN PRINTF(1, 2);
 void die_perror(const char *fmt, ...) NORETURN PRINTF(1, 2);
 void print_version(void);
-int parse_bias(const char *option);
+int parse_bias_or_die(const char *option);
+int parse_period(const char *option);
+unsigned int parse_period_or_die(const char *option);
+int parse_uint(const char *option);
+unsigned int parse_uint_or_die(const char *option);
 void print_bias_help(void);
-int make_signalfd(void);
-int chip_dir_filter(const struct dirent *entry);
-struct gpiod_chip *chip_open_by_name(const char *name);
-struct gpiod_chip *chip_open_lookup(const char *device);
-bool has_duplicate_offsets(size_t num_offsets, unsigned int *offsets);
+void print_chip_help(void);
+void print_period_help(void);
+void print_event_time(uint64_t evtime, int format);
+void print_line_attributes(struct gpiod_line_info *info, bool unquoted_strings);
+void print_line_id(struct line_resolver *resolver, int chip_num,
+		   unsigned int offset, const char *chip_id, bool unquoted);
+bool chip_path_lookup(const char *id, char **path_ptr);
+int chip_paths(const char *id, char ***paths_ptr);
+int all_chip_paths(char ***paths_ptr);
+struct line_resolver *resolve_lines(int num_lines, char **lines,
+		const char *chip_id, bool strict, bool by_name);
+struct line_resolver *resolver_init(int num_lines, char **lines, int num_chips,
+				    bool strict, bool by_name);
+bool resolve_lines_by_offset(struct line_resolver *resolver,
+			     unsigned int num_lines);
+bool resolve_done(struct line_resolver *resolver);
+void validate_resolution(struct line_resolver *resolver, const char *chip_id);
+void free_line_resolver(struct line_resolver *resolver);
+int get_line_offsets_and_values(struct line_resolver *resolver,
+		int chip_num, unsigned int *offsets, int *values);
+const char *get_chip_name(struct line_resolver *resolver, int chip_num);
+const char *get_line_name(struct line_resolver *resolver, int chip_num,
+			  unsigned int offset);
+void set_line_values(struct line_resolver *resolver, int chip_num, int *values);
 
 #endif /* __GPIOD_TOOLS_COMMON_H__ */
-- 
2.38.1

