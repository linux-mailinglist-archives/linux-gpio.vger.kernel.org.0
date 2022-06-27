Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B4F855D5D8
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Jun 2022 15:16:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236197AbiF0NqS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 Jun 2022 09:46:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233224AbiF0NqQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Jun 2022 09:46:16 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1F3A5FE6
        for <linux-gpio@vger.kernel.org>; Mon, 27 Jun 2022 06:46:13 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id 128so9050579pfv.12
        for <linux-gpio@vger.kernel.org>; Mon, 27 Jun 2022 06:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ybwXw5ihexvKCv3B3AHlCBJu0o9YDq4tSuAOOD/DpQU=;
        b=cGhllRca8BT3S1wBjGWEdYoY6rsh2uLTYIDXPhbFII+ZnpcDMw/MMGxmv73IP+5iHu
         ga1oXHSf5AvRYrsfzea/J9+pCU2j/GdmPK3SgMGqmdS8nHFeHNo9sUueX9bWifKilKDz
         InK4a2JOgQo1237RKXoe/hjl2SWKL0sdUrETaUdVuZrLvbzS4e/3I0iiI9xe/gHvb1X2
         LPdBsaGHuCB4YEhzIubPHYeWFBYAne+QJ+hVtS1SbRW3kkR8m23CbyiTirpv+78tehrN
         4RYEILPuZUSnP+W92/DRgn0bTwGBlGLCLB0bDCZKmT+mFZ6CfyhPP9a6HgFTVr7npEkH
         oHVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ybwXw5ihexvKCv3B3AHlCBJu0o9YDq4tSuAOOD/DpQU=;
        b=K9uizGzpl/SrPJ5uiaxgqIj4rh1fhGR+kvD6Yfw1jCw/9LFrpvZjucpnNoBg+1BvLI
         NzAQYSwe6J6VOhmVe/QGIRcKHsi4B6gD5MkcWE/aVX+ItXP0ot1rN89hWRFFcxUercIs
         aakFTyFOOPb1NBxBd+aX6q4Us3yjbP9ucHDylLRuf2hhGNe7Bi/JQeQqEHEILolvAb/D
         CdwrXcXYsZLjdzqHvEI5TwTIkv1drkp7QzPmpl0hjXUvNxFZkF2Nk5LaODI2/mdpTkQ+
         h3KRBBMFsUK6NiAm3ychcNWt5HKll15LkATcP/DoYrWGCM86EU0c2/JABjqa/S3hMQpB
         ygfA==
X-Gm-Message-State: AJIora8BILkPF22Jxozqs78jcwhTDvvLp0GTs+Yu8doaKQogEpY69ld4
        CF4s/4caCy3d3HUbmuZp3Qggc0b1Gfg=
X-Google-Smtp-Source: AGRyM1tK7cWMxzjXsNJyNXVQcjiK9wiss3XJcWtMjn0fs+HPln+RFbn/c3lzSLwPdLdrbAf2v1O2aQ==
X-Received: by 2002:a63:5304:0:b0:3fb:92eb:8e90 with SMTP id h4-20020a635304000000b003fb92eb8e90mr13234454pgb.36.1656337570993;
        Mon, 27 Jun 2022 06:46:10 -0700 (PDT)
Received: from sol.home.arpa (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id b5-20020a170902bd4500b0016a565f3f34sm6783395plx.168.2022.06.27.06.46.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 06:46:10 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, brgl@bgdev.pl
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod v2][PATCH 1/4] tools: line name focussed rework
Date:   Mon, 27 Jun 2022 21:44:44 +0800
Message-Id: <20220627134447.81927-2-warthog618@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220627134447.81927-1-warthog618@gmail.com>
References: <20220627134447.81927-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
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

gpiofind:

Add the option to display the info for found lines.

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
equivalent to the old --mode options.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 configure.ac         |   9 +-
 tools/gpiodetect.c   | 108 ++++--
 tools/gpiofind.c     | 126 +++++--
 tools/gpioget.c      | 200 ++++++----
 tools/gpioinfo.c     | 356 ++++++++----------
 tools/gpiomon.c      | 493 +++++++++++++++----------
 tools/gpioset.c      | 861 +++++++++++++++++++++++++++++++------------
 tools/tools-common.c | 640 +++++++++++++++++++++++++++++---
 tools/tools-common.h |  59 ++-
 9 files changed, 2011 insertions(+), 841 deletions(-)

diff --git a/configure.ac b/configure.ac
index ab03673..c7e353c 100644
--- a/configure.ac
+++ b/configure.ac
@@ -105,14 +105,15 @@ AC_DEFUN([FUNC_NOT_FOUND_TOOLS],
 AC_DEFUN([HEADER_NOT_FOUND_TOOLS],
 	[ERR_NOT_FOUND([$1 header], [tools])])
 
+AC_DEFUN([LIB_NOT_FOUND_TOOLS],
+	[ERR_NOT_FOUND([lib$1], [tools])])
+
 if test "x$with_tools" = xtrue
 then
 	# These are only needed to build tools
-	AC_CHECK_FUNC([basename], [], [FUNC_NOT_FOUND_TOOLS([basename])])
 	AC_CHECK_FUNC([daemon], [], [FUNC_NOT_FOUND_TOOLS([daemon])])
-	AC_CHECK_FUNC([signalfd], [], [FUNC_NOT_FOUND_TOOLS([signalfd])])
-	AC_CHECK_FUNC([setlinebuf], [], [FUNC_NOT_FOUND_TOOLS([setlinebuf])])
-	AC_CHECK_HEADERS([sys/signalfd.h], [], [HEADER_NOT_FOUND_TOOLS([sys/signalfd.h])])
+	AC_CHECK_HEADERS([readline/readline.h], [], [HEADER_NOT_FOUND_TOOLS([readline/readline.h])])
+	AC_CHECK_LIB([readline], readline, [], [LIB_NOT_FOUND_TOOLS([readline])])
 fi
 
 AC_ARG_ENABLE([tests],
diff --git a/tools/gpiodetect.c b/tools/gpiodetect.c
index 8f6e8b3..18b6e95 100644
--- a/tools/gpiodetect.c
+++ b/tools/gpiodetect.c
@@ -1,7 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
-// SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
+// SPDX-FileCopyrightText: 2017-2022 Bartosz Golaszewski <bartekgola@gmail.com>
 
-#include <dirent.h>
 #include <errno.h>
 #include <getopt.h>
 #include <gpiod.h>
@@ -21,21 +20,23 @@ static const char *const shortopts = "+hv";
 
 static void print_help(void)
 {
-	printf("Usage: %s [OPTIONS]\n", get_progname());
+	printf("Usage: %s [OPTIONS] [chip]...\n", get_progname());
 	printf("\n");
-	printf("List all GPIO chips, print their labels and number of GPIO lines.\n");
+	printf("List GPIO chips, print their labels and number of GPIO lines.\n");
+	printf("\n");
+	printf("Chips may be identified by number, name, or path.\n");
+	printf("e.g. '0', 'gpiochip0', and '/dev/gpiochip0' all refer to the same chip.\n");
+	printf("\n");
+	printf("If no chips are specified then all chips are listed.\n");
 	printf("\n");
 	printf("Options:\n");
-	printf("  -h, --help:\t\tdisplay this message and exit\n");
-	printf("  -v, --version:\tdisplay the version and exit\n");
+	printf("  -h, --help\t\tdisplay this help and exit\n");
+	printf("  -v, --version\t\toutput version information and exit\n");
 }
 
-int main(int argc, char **argv)
+int parse_config(int argc, char **argv)
 {
-	int optc, opti, num_chips, i;
-	struct gpiod_chip *chip;
-	struct gpiod_chip_info *info;
-	struct dirent **entries;
+	int optc, opti;
 
 	for (;;) {
 		optc = getopt_long(argc, argv, shortopts, longopts, &opti);
@@ -45,48 +46,77 @@ int main(int argc, char **argv)
 		switch (optc) {
 		case 'h':
 			print_help();
-			return EXIT_SUCCESS;
+			exit(EXIT_SUCCESS);
 		case 'v':
 			print_version();
-			return EXIT_SUCCESS;
+			exit(EXIT_SUCCESS);
 		case '?':
 			die("try %s --help", get_progname());
 		default:
 			abort();
 		}
 	}
+	return optind;
+}
 
-	argc -= optind;
-	argv += optind;
-
-	if (argc > 0)
-		die("unrecognized argument: %s", argv[0]);
-
-	num_chips = scandir("/dev/", &entries, chip_dir_filter, alphasort);
-	if (num_chips < 0)
-		die_perror("unable to scan /dev");
+int print_chip_info(const char *path)
+{
+	struct gpiod_chip *chip;
+	struct gpiod_chip_info *info;
 
-	for (i = 0; i < num_chips; i++) {
-		chip = chip_open_by_name(entries[i]->d_name);
-		if (!chip)
-			die_perror("unable to open %s", entries[i]->d_name);
+	chip = gpiod_chip_open(path);
+	if (!chip) {
+		print_perror("unable to open chip %s", path);
+		return 1;
+	}
 
-		info = gpiod_chip_get_info(chip);
-		if (!info)
-			die_perror("unable to get info for %s", entries[i]->d_name);
+	info = gpiod_chip_get_info(chip);
+	if (!info)
+		die_perror("unable to get info for %s", path);
 
+	printf("%s [%s] (%zu lines)\n",
+	       gpiod_chip_info_get_name(info),
+	       gpiod_chip_info_get_label(info),
+	       gpiod_chip_info_get_num_lines(info));
 
-		printf("%s [%s] (%zu lines)\n",
-		       gpiod_chip_info_get_name(info),
-		       gpiod_chip_info_get_label(info),
-		       gpiod_chip_info_get_num_lines(info));
+	gpiod_chip_info_free(info);
+	gpiod_chip_close(chip);
+	return 0;
+}
 
-		gpiod_chip_info_free(info);
-		gpiod_chip_close(chip);
-		free(entries[i]);
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
+			free(paths[i]);
+		}
+		free(paths);
+	}
+	for (i = 0; i < argc; i++) {
+		if (chip_path_lookup(argv[i], &path)) {
+			print_chip_info(path);
+			free(path);
+		} else if (errno == ENOENT) {
+			print_error("cannot find a GPIO chip character device corresponding to %s",
+				    argv[i]);
+			ret = EXIT_FAILURE;
+		} else {
+			print_perror("unable to open chip %s", path);
+			ret = EXIT_FAILURE;
+		}
 	}
 
-	free(entries);
-
-	return EXIT_SUCCESS;
+	return ret;
 }
diff --git a/tools/gpiofind.c b/tools/gpiofind.c
index 03b15c9..a048c06 100644
--- a/tools/gpiofind.c
+++ b/tools/gpiofind.c
@@ -1,7 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
-// SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
+// SPDX-FileCopyrightText: 2017-2022 Bartosz Golaszewski <bartekgola@gmail.com>
 
-#include <dirent.h>
 #include <errno.h>
 #include <getopt.h>
 #include <gpiod.h>
@@ -12,30 +11,44 @@
 #include "tools-common.h"
 
 static const struct option longopts[] = {
-	{ "help",	no_argument,	NULL,	'h' },
-	{ "version",	no_argument,	NULL,	'v' },
+	{ "chip",	required_argument,	NULL,	'c' },
+	{ "help",	no_argument,		NULL,	'h' },
+	{ "info",	no_argument,		NULL,	'i' },
+	{ "strict",	no_argument,		NULL,	's' },
+	{ "version",	no_argument,		NULL,	'v' },
 	{ GETOPT_NULL_LONGOPT },
 };
 
-static const char *const shortopts = "+hv";
+static const char *const shortopts = "+c:hisv";
 
 static void print_help(void)
 {
 	printf("Usage: %s [OPTIONS] <name>\n", get_progname());
 	printf("\n");
-	printf("Find a GPIO line by name. The output of this command can be used as input for gpioget/set.\n");
+	printf("Find a GPIO line by name.\n");
+	printf("\n");
+	printf("The output of this command can be used as input for gpioget/set.\n");
 	printf("\n");
 	printf("Options:\n");
-	printf("  -h, --help:\t\tdisplay this message and exit\n");
-	printf("  -v, --version:\tdisplay the version and exit\n");
+	printf("  -c, --chip <chip>\trestrict scope to a particular chip\n");
+	printf("  -h, --help\t\tdisplay this help and exit\n");
+	printf("  -i, --info\t\tdisplay info for found lines\n");
+	printf("  -s, --strict\t\tcheck all lines - don't assume line names are unique\n");
+	printf("  -v, --version\t\toutput version information and exit\n");
+	print_chip_help();
 }
 
-int main(int argc, char **argv)
+struct config {
+	bool strict;
+	bool display_info;
+	const char *chip_id;
+};
+
+int parse_config(int argc, char **argv, struct config *cfg)
 {
-	int i, num_chips, optc, opti, offset;
-	struct gpiod_chip *chip;
-	struct gpiod_chip_info *info;
-	struct dirent **entries;
+	int opti, optc;
+
+	memset(cfg, 0, sizeof(*cfg));
 
 	for (;;) {
 		optc = getopt_long(argc, argv, shortopts, longopts, &opti);
@@ -43,12 +56,21 @@ int main(int argc, char **argv)
 			break;
 
 		switch (optc) {
+		case 'c':
+			cfg->chip_id = optarg;
+			break;
+		case 'i':
+			cfg->display_info = true;
+			break;
+		case 's':
+			cfg->strict = true;
+			break;
 		case 'h':
 			print_help();
-			return EXIT_SUCCESS;
+			exit(EXIT_SUCCESS);
 		case 'v':
 			print_version();
-			return EXIT_SUCCESS;
+			exit(EXIT_SUCCESS);
 		case '?':
 			die("try %s --help", get_progname());
 		default:
@@ -56,38 +78,74 @@ int main(int argc, char **argv)
 		}
 	}
 
+	return optind;
+}
+
+int main(int argc, char **argv)
+{
+	int i, num_chips, num_lines, offset, num_found = 0, ret = EXIT_FAILURE;
+	struct gpiod_chip *chip;
+	struct gpiod_chip_info *chip_info;
+	char **paths;
+	const char *name;
+	struct gpiod_line_info *line_info;
+	struct config cfg;
+
+	i = parse_config(argc, argv, &cfg);
 	argc -= optind;
 	argv += optind;
 
 	if (argc != 1)
 		die("exactly one GPIO line name must be specified");
 
-	num_chips = scandir("/dev/", &entries, chip_dir_filter, alphasort);
-	if (num_chips < 0)
-		die_perror("unable to scan /dev");
+	num_chips = chip_paths(cfg.chip_id, &paths);
+	if ((cfg.chip_id != NULL)  && (num_chips == 0))
+		die("cannot find a GPIO chip character device corresponding to %s", cfg.chip_id);
 
 	for (i = 0; i < num_chips; i++) {
-		chip = chip_open_by_name(entries[i]->d_name);
+		chip = gpiod_chip_open(paths[i]);
 		if (!chip) {
-			if (errno == EACCES)
+			if ((errno == EACCES) && (!cfg.chip_id))
 				continue;
 
-			die_perror("unable to open %s", entries[i]->d_name);
+			die_perror("unable to open %s", paths[i]);
 		}
 
-		offset = gpiod_chip_get_line_offset_from_name(chip, argv[0]);
-		if (offset >= 0) {
-			info = gpiod_chip_get_info(chip);
-			if (!info)
-				die_perror("unable to get info for %s", entries[i]->d_name);
-
-			printf("%s %u\n",
-			       gpiod_chip_info_get_name(info), offset);
-			gpiod_chip_info_free(info);
-			gpiod_chip_close(chip);
-			return EXIT_SUCCESS;
+		chip_info = gpiod_chip_get_info(chip);
+		if (!chip_info)
+			die_perror("unable to get info for %s", paths[i]);
+
+		num_lines = gpiod_chip_info_get_num_lines(chip_info);
+		for (offset = 0; offset < num_lines; offset++) {
+			line_info = gpiod_chip_get_line_info(chip, offset);
+			if (!line_info)
+				die_perror("unable to retrieve the line info from chip %s",
+					   gpiod_chip_get_path(chip));
+
+			name = gpiod_line_info_get_name(line_info);
+			if (name && strcmp(argv[0], gpiod_line_info_get_name(line_info)) == 0) {
+				num_found++;
+				printf("%s %u", gpiod_chip_info_get_name(chip_info), offset);
+				if (cfg.display_info)
+					print_line_info(line_info);
+				printf("\n");
+				if (!cfg.strict) {
+					gpiod_chip_info_free(chip_info);
+					gpiod_chip_close(chip);
+					goto exit_paths;
+				}
+			}
 		}
+		gpiod_chip_info_free(chip_info);
+		gpiod_chip_close(chip);
 	}
-
-	return EXIT_FAILURE;
+	if (!num_found)
+		print_error("cannot find line %s", argv[0]);
+exit_paths:
+	if (num_found == 1)
+		ret = EXIT_SUCCESS;
+	for (i = 0; i < num_chips; i++)
+		free(paths[i]);
+	free(paths);
+	return ret;
 }
diff --git a/tools/gpioget.c b/tools/gpioget.c
index ae80271..001049f 100644
--- a/tools/gpioget.c
+++ b/tools/gpioget.c
@@ -1,56 +1,73 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
-// SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
+// SPDX-FileCopyrightText: 2017-2022 Bartosz Golaszewski <bartekgola@gmail.com>
 
 #include <getopt.h>
 #include <gpiod.h>
-#include <limits.h>
 #include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
+#include <unistd.h>
 
 #include "tools-common.h"
 
+static int by_name;
+static int numeric;
 static const struct option longopts[] = {
-	{ "help",	no_argument,		NULL,	'h' },
-	{ "version",	no_argument,		NULL,	'v' },
-	{ "active-low",	no_argument,		NULL,	'l' },
-	{ "dir-as-is",	no_argument,		NULL,	'n' },
-	{ "bias",	required_argument,	NULL,	'B' },
+	{ "active-low",		no_argument,		NULL,	'l' },
+	{ "as-is",		no_argument,		NULL,	'a' },
+	{ "bias",		required_argument,	NULL,	'b' },
+	{ "by-name",		no_argument,		&by_name,	1 },
+	{ "chip",		required_argument,	NULL,	'c' },
+	{ "help",		no_argument,		NULL,	'h' },
+	{ "hold-period",	required_argument,	NULL,	'p' },
+	{ "numeric",		no_argument,		&numeric,	1 },
+	{ "strict",		no_argument,		NULL,	's' },
+	{ "version",		no_argument,		NULL,	'v' },
 	{ GETOPT_NULL_LONGOPT },
 };
 
-static const char *const shortopts = "+hvlnB:";
+static const char *const shortopts = "+ab:c:hlp:sv";
 
 static void print_help(void)
 {
-	printf("Usage: %s [OPTIONS] <chip name/number> <offset 1> <offset 2> ...\n",
-	       get_progname());
+	printf("Usage: %s [OPTIONS] <line> ...\n", get_progname());
 	printf("\n");
-	printf("Read line value(s) from a GPIO chip\n");
+	printf("Read values of GPIO lines.\n");
 	printf("\n");
-	printf("Options:\n");
-	printf("  -h, --help:\t\tdisplay this message and exit\n");
-	printf("  -v, --version:\tdisplay the version and exit\n");
-	printf("  -l, --active-low:\tset the line active state to low\n");
-	printf("  -n, --dir-as-is:\tdon't force-reconfigure line direction\n");
-	printf("  -B, --bias=[as-is|disable|pull-down|pull-up] (defaults to 'as-is'):\n");
-	printf("		set the line bias\n");
+	printf("Lines are specified by name, or optionally by offset if the chip option\n");
+	printf("is provided.\n");
 	printf("\n");
+	printf("Options:\n");
+	printf("  -a, --as-is\t\tleave the line direction unchanged, not forced to input\n");
 	print_bias_help();
+	printf("      --by-name\t\ttreat lines as names even if they would parse as an offset\n");
+	printf("  -c, --chip <chip>\trestrict scope to a particular chip\n");
+	printf("  -h, --help\t\tdisplay this help and exit\n");
+	printf("  -l, --active-low\ttreat the line as active low\n");
+	printf("  -p, --hold-period <period>\n");
+	printf("\t\t\tapply a settling period between requesting the line(s)\n");
+	printf("\t\t\tand reading the value(s)\n");
+	printf("      --numeric\t\tdisplay line values as '0' (inactive) or '1' (active)\n");
+	printf("  -s, --strict\t\tabort if requested line names are not unique\n");
+	printf("  -v, --version\t\toutput version information and exit\n");
+	print_chip_help();
+	print_period_help();
 }
+struct config {
+	bool active_low;
+	bool strict;
+	int bias;
+	int direction;
+	unsigned int hold_period_us;
+	const char *chip_id;
+};
 
-int main(int argc, char **argv)
+int parse_config(int argc, char **argv, struct config *cfg)
 {
-	int direction = GPIOD_LINE_DIRECTION_INPUT;
-	int optc, opti, bias = 0, ret, *values;
-	struct gpiod_request_config *req_cfg;
-	struct gpiod_line_request *request;
-	struct gpiod_line_config *line_cfg;
-	struct gpiod_chip *chip;
-	bool active_low = false;
-	unsigned int *offsets;
-	size_t i, num_lines;
-	char *device, *end;
+	int opti, optc;
+
+	memset(cfg, 0, sizeof(*cfg));
+	cfg->direction = GPIOD_LINE_DIRECTION_INPUT;
 
 	for (;;) {
 		optc = getopt_long(argc, argv, shortopts, longopts, &opti);
@@ -58,65 +75,79 @@ int main(int argc, char **argv)
 			break;
 
 		switch (optc) {
-		case 'h':
-			print_help();
-			return EXIT_SUCCESS;
-		case 'v':
-			print_version();
-			return EXIT_SUCCESS;
+		case 'a':
+			cfg->direction = GPIOD_LINE_DIRECTION_AS_IS;
+			break;
+		case 'b':
+			cfg->bias = parse_bias_or_die(optarg);
+			break;
+		case 'c':
+			cfg->chip_id = optarg;
+			break;
 		case 'l':
-			active_low = true;
+			cfg->active_low = true;
 			break;
-		case 'n':
-			direction = GPIOD_LINE_DIRECTION_AS_IS;
+		case 'p':
+			cfg->hold_period_us = parse_period_or_die(optarg);
 			break;
-		case 'B':
-			bias = parse_bias(optarg);
+		case 's':
+			cfg->strict = true;
 			break;
+		case 'h':
+			print_help();
+			exit(EXIT_SUCCESS);
+		case 'v':
+			print_version();
+			exit(EXIT_SUCCESS);
 		case '?':
 			die("try %s --help", get_progname());
+		case 0:
+			break;
 		default:
 			abort();
 		}
 	}
 
-	argc -= optind;
-	argv += optind;
+	return optind;
+}
 
-	if (argc < 1)
-		die("gpiochip must be specified");
+int main(int argc, char **argv)
+{
+	int i, num_lines, ret, *values;
+	struct gpiod_request_config *req_cfg;
+	struct gpiod_line_request *request;
+	struct gpiod_line_config *line_cfg;
+	struct gpiod_chip *chip;
+	unsigned int *offsets;
+	struct line_resolver *resolver;
+	struct resolved_line *line;
+	const char *chip_path;
+	struct config cfg;
+
+	i = parse_config(argc, argv, &cfg);
+	argc -= i;
+	argv += i;
 
-	if (argc < 2)
-		die("at least one GPIO line offset must be specified");
+	if (argc < 1)
+		die("at least one GPIO line must be specified");
 
-	device = argv[0];
-	num_lines = argc - 1;
+	resolver = resolve_lines(argc, argv, cfg.chip_id, cfg.strict, by_name);
 
-	offsets = calloc(num_lines, sizeof(*offsets));
-	values = calloc(num_lines, sizeof(*values));
+	offsets = calloc(resolver->num_lines, sizeof(*offsets));
+	values = calloc(resolver->num_lines, sizeof(*values));
 	if (!offsets || ! values)
 		die("out of memory");
 
-	for (i = 0; i < num_lines; i++) {
-		offsets[i] = strtoul(argv[i + 1], &end, 10);
-		if (*end != '\0' || offsets[i] > INT_MAX)
-			die("invalid GPIO offset: %s", argv[i + 1]);
-	}
-
-	chip = chip_open_lookup(device);
-	if (!chip)
-		die_perror("unable to open %s", device);
-
 	line_cfg = gpiod_line_config_new();
 	if (!line_cfg)
 		die_perror("unable to allocate the line config structure");
 
-	gpiod_line_config_set_direction_default(line_cfg, direction);
+	gpiod_line_config_set_direction_default(line_cfg, cfg.direction);
 
-	if (bias)
-		gpiod_line_config_set_bias_default(line_cfg, bias);
+	if (cfg.bias)
+		gpiod_line_config_set_bias_default(line_cfg, cfg.bias);
 
-	if (active_low)
+	if (cfg.active_low)
 		gpiod_line_config_set_active_low_default(line_cfg, true);
 
 	req_cfg = gpiod_request_config_new();
@@ -124,27 +155,44 @@ int main(int argc, char **argv)
 		die_perror("unable to allocate the request config structure");
 
 	gpiod_request_config_set_consumer(req_cfg, "gpioget");
-	gpiod_request_config_set_offsets(req_cfg, num_lines, offsets);
+	for (i = 0; i < resolver->num_chips; i++) {
+		chip_path = resolver->chip_paths[i];
+		chip = gpiod_chip_open(chip_path);
+		if (!chip)
+			die_perror("unable to open chip %s", chip_path);
+		num_lines = get_line_offsets_and_values(resolver, chip_path, offsets, NULL);
+		gpiod_request_config_set_offsets(req_cfg, num_lines, offsets);
+
+		request = gpiod_chip_request_lines(chip, req_cfg, line_cfg);
+		if (!request)
+			die_perror("unable to request lines");
 
-	request = gpiod_chip_request_lines(chip, req_cfg, line_cfg);
-	if (!request)
-		die_perror("unable to request lines");
+		if (cfg.hold_period_us)
+			usleep(cfg.hold_period_us);
 
-	ret = gpiod_line_request_get_values(request, values);
-	if (ret)
-		die_perror("unable to read GPIO line values");
+		ret = gpiod_line_request_get_values(request, values);
+		if (ret)
+			die_perror("unable to read GPIO line values");
 
-	for (i = 0; i < num_lines; i++) {
-		printf("%d", values[i]);
-		if (i != num_lines - 1)
+		set_line_values(resolver, chip_path, values);
+
+		gpiod_line_request_release(request);
+		gpiod_chip_close(chip);
+	}
+	for (i = 0; i < resolver->num_lines; i++) {
+		line = &resolver->lines[i];
+		if (numeric)
+			printf("%d", line->value);
+		else
+			printf("%s=%s", line->id, line->value ? "active" : "inactive");
+		if (i != resolver->num_lines - 1)
 			printf(" ");
 	}
 	printf("\n");
 
-	gpiod_line_request_release(request);
+	free_line_resolver(resolver);
 	gpiod_request_config_free(req_cfg);
 	gpiod_line_config_free(line_cfg);
-	gpiod_chip_close(chip);
 	free(offsets);
 	free(values);
 
diff --git a/tools/gpioinfo.c b/tools/gpioinfo.c
index fbe2a13..a7f43d1 100644
--- a/tools/gpioinfo.c
+++ b/tools/gpioinfo.c
@@ -1,7 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
-// SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
+// SPDX-FileCopyrightText: 2017-2022 Bartosz Golaszewski <bartekgola@gmail.com>
 
-#include <dirent.h>
 #include <errno.h>
 #include <getopt.h>
 #include <gpiod.h>
@@ -12,181 +11,142 @@
 
 #include "tools-common.h"
 
-typedef bool (*is_set_func)(struct gpiod_line_info *);
-
-struct flag {
-	const char *name;
-	is_set_func is_set;
+static int by_name;
+static const struct option longopts[] = {
+	{ "by-name",	no_argument,		&by_name,	1 },
+	{ "chip",	required_argument,	NULL,	'c' },
+	{ "help",	no_argument,		NULL,	'h' },
+	{ "strict",	no_argument,		NULL,	's' },
+	{ "version",	no_argument,		NULL,	'v' },
+	{ GETOPT_NULL_LONGOPT },
 };
 
-static bool line_bias_is_pullup(struct gpiod_line_info *info)
-{
-	return gpiod_line_info_get_bias(info) == GPIOD_LINE_BIAS_PULL_UP;
-}
+static const char *const shortopts = "+c:hsv";
 
-static bool line_bias_is_pulldown(struct gpiod_line_info *info)
-{
-	return gpiod_line_info_get_bias(info) == GPIOD_LINE_BIAS_PULL_DOWN;
-}
-
-static bool line_bias_is_disabled(struct gpiod_line_info *info)
+static void print_help(void)
 {
-	return gpiod_line_info_get_bias(info) == GPIOD_LINE_BIAS_DISABLED;
+	printf("Usage: %s [OPTIONS] [line] ...\n", get_progname());
+	printf("\n");
+	printf("Print information about GPIO lines.\n");
+	printf("\n");
+	printf("Lines are specified by name, or optionally by offset if the chip option\n");
+	printf("is provided.\n");
+	printf("\n");
+	printf("If no lines are specified than all lines are displayed.\n");
+	printf("\n");
+	printf("Options:\n");
+	printf("      --by-name\t\ttreat lines as names even if they would parse as an offset\n");
+	printf("  -c, --chip <chip>\trestrict scope to a particular chip\n");
+	printf("  -h, --help\t\tdisplay this help and exit\n");
+	printf("  -s, --strict\t\tcheck all lines - don't assume line names are unique\n");
+	printf("  -v, --version\t\toutput version information and exit\n");
+	print_chip_help();
 }
 
-static bool line_drive_is_open_drain(struct gpiod_line_info *info)
-{
-	return gpiod_line_info_get_drive(info) == GPIOD_LINE_DRIVE_OPEN_DRAIN;
-}
+struct config {
+	bool strict;
+	const char *chip_id;
+};
 
-static bool line_drive_is_open_source(struct gpiod_line_info *info)
+int parse_config(int argc, char **argv, struct config *cfg)
 {
-	return gpiod_line_info_get_drive(info) == GPIOD_LINE_DRIVE_OPEN_SOURCE;
-}
+	int opti, optc;
 
-static const struct flag flags[] = {
-	{
-		.name = "used",
-		.is_set = gpiod_line_info_is_used,
-	},
-	{
-		.name = "open-drain",
-		.is_set = line_drive_is_open_drain,
-	},
-	{
-		.name = "open-source",
-		.is_set = line_drive_is_open_source,
-	},
-	{
-		.name = "pull-up",
-		.is_set = line_bias_is_pullup,
-	},
-	{
-		.name = "pull-down",
-		.is_set = line_bias_is_pulldown,
-	},
-	{
-		.name = "bias-disabled",
-		.is_set = line_bias_is_disabled,
-	},
-};
+	memset(cfg, 0, sizeof(*cfg));
 
-static const struct option longopts[] = {
-	{ "help",	no_argument,	NULL,	'h' },
-	{ "version",	no_argument,	NULL,	'v' },
-	{ GETOPT_NULL_LONGOPT },
-};
+	for (;;) {
+		optc = getopt_long(argc, argv, shortopts, longopts, &opti);
+		if (optc < 0)
+			break;
 
-static const char *const shortopts = "+hv";
+		switch (optc) {
+		case 'c':
+			cfg->chip_id = optarg;
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
 
-static void print_help(void)
-{
-	printf("Usage: %s [OPTIONS] <gpiochip1> ...\n", get_progname());
-	printf("\n");
-	printf("Print information about all lines of the specified GPIO chip(s) (or all gpiochips if none are specified).\n");
-	printf("\n");
-	printf("Options:\n");
-	printf("  -h, --help:\t\tdisplay this message and exit\n");
-	printf("  -v, --version:\tdisplay the version and exit\n");
+	return optind;
 }
 
-static PRINTF(3, 4) void prinfo(bool *of,
-				unsigned int prlen, const char *fmt, ...)
+static bool filter_line(struct gpiod_line_info *info, const char *chip_path,
+			struct line_resolver *resolver)
 {
-	char *buf, *buffmt = NULL;
-	size_t len;
-	va_list va;
-	int rv;
-
-	va_start(va, fmt);
-	rv = vasprintf(&buf, fmt, va);
-	va_end(va);
-	if (rv < 0)
-		die("vasprintf: %s\n", strerror(errno));
-
-	len = strlen(buf) - 1;
-
-	if (len >= prlen || *of) {
-		*of = true;
-		printf("%s", buf);
-	} else {
-		rv = asprintf(&buffmt, "%%%us", prlen);
-		if (rv < 0)
-			die("asprintf: %s\n", strerror(errno));
-
-		printf(buffmt, buf);
+	int i;
+	struct resolved_line *line;
+	bool skip = true;
+	const char *name;
+
+	if (!resolver)
+		return false;
+
+	for (i = 0; i < resolver->num_lines; i++) {
+		line = &resolver->lines[i];
+		name = gpiod_line_info_get_name(info);
+		if (((line->offset == (int)gpiod_line_info_get_offset(info)) ||
+		     (name && strcmp(line->id, name) == 0)) &&
+		    (resolver->strict || !line->chip_path)) {
+			skip = false;
+			line->chip_path = chip_path;
+			resolver->num_found++;
+		}
 	}
+	return skip;
+}
 
-	free(buf);
-	if (fmt)
-		free(buffmt);
+static bool filter_done(struct line_resolver *resolver)
+{
+	return (resolver && !resolver->strict && resolver->num_found >= resolver->num_lines);
 }
 
-static void list_lines(struct gpiod_chip *chip)
+static void list_lines(struct gpiod_chip *chip, const char *chip_path,
+		       struct line_resolver *resolver)
 {
-	bool flag_printed, of, active_low;
 	struct gpiod_chip_info *chip_info;
 	struct gpiod_line_info *info;
-	const char *name, *consumer;
-	size_t i, offset, num_lines;
-	int direction;
+	int offset, num_lines;
 
 	chip_info = gpiod_chip_get_info(chip);
 	if (!chip_info)
-		die_perror("unable to retrieve the chip info from chip");
+		die_perror("unable to retrieve the chip info from chip %s",
+			   gpiod_chip_get_path(chip));
 
 	num_lines = gpiod_chip_info_get_num_lines(chip_info);
-	printf("%s - %zu lines:\n",
-	       gpiod_chip_info_get_name(chip_info), num_lines);
 
-	for (offset = 0; offset < num_lines; offset++) {
+	for (offset = 0; ((offset < num_lines) && !filter_done(resolver)); offset++) {
 		info = gpiod_chip_get_line_info(chip, offset);
 		if (!info)
-			die_perror("unable to retrieve the line info from chip");
-		name = gpiod_line_info_get_name(info);
-		consumer = gpiod_line_info_get_consumer(info);
-		direction = gpiod_line_info_get_direction(info);
-		active_low = gpiod_line_info_is_active_low(info);
-
-		of = false;
-
-		printf("\tline ");
-		prinfo(&of, 3, "%zu", offset);
-		printf(": ");
-
-		name ? prinfo(&of, 12, "\"%s\"", name)
-		     : prinfo(&of, 12, "unnamed");
-		printf(" ");
-
-		if (!gpiod_line_info_is_used(info))
-			prinfo(&of, 12, "unused");
-		else
-			consumer ? prinfo(&of, 12, "\"%s\"", consumer)
-				 : prinfo(&of, 12, "kernel");
-
-		printf(" ");
-
-		prinfo(&of, 8, "%s ", direction == GPIOD_LINE_DIRECTION_INPUT
-							? "input" : "output");
-		prinfo(&of, 13, "%s ",
-		       active_low ? "active-low" : "active-high");
-
-		flag_printed = false;
-		for (i = 0; i < ARRAY_SIZE(flags); i++) {
-			if (flags[i].is_set(info)) {
-				if (flag_printed)
-					printf(" ");
-				else
-					printf("[");
-				printf("%s", flags[i].name);
-				flag_printed = true;
-			}
+			die_perror("unable to retrieve the line info from chip %s",
+				   gpiod_chip_get_path(chip));
+
+		if (filter_line(info, chip_path, resolver))
+			continue;
+
+		if (resolver && resolver->num_lines) {
+			printf("%s %u", gpiod_chip_info_get_name(chip_info), offset);
+		} else {
+			if (offset == 0)
+				printf("%s - %u lines:\n",
+				       gpiod_chip_info_get_name(chip_info), num_lines);
+			printf("\tline %3u:", offset);
 		}
-		if (flag_printed)
-			printf("]");
-
+		print_line_info(info);
 		printf("\n");
-
 		gpiod_line_info_free(info);
 	}
 	gpiod_chip_info_free(chip_info);
@@ -194,61 +154,69 @@ static void list_lines(struct gpiod_chip *chip)
 
 int main(int argc, char **argv)
 {
-	int num_chips, i, optc, opti;
+	int num_chips, i, ret = EXIT_SUCCESS;
 	struct gpiod_chip *chip;
-	struct dirent **entries;
-
-	for (;;) {
-		optc = getopt_long(argc, argv, shortopts, longopts, &opti);
-		if (optc < 0)
-			break;
-
-		switch (optc) {
-		case 'h':
-			print_help();
-			return EXIT_SUCCESS;
-		case 'v':
-			print_version();
-			return EXIT_SUCCESS;
-		case '?':
-			die("try %s --help", get_progname());
-		default:
-			abort();
+	char **paths;
+	struct line_resolver *resolver = NULL;
+	struct resolved_line *line;
+	struct config cfg;
+
+	i = parse_config(argc, argv, &cfg);
+	argc -= i;
+	argv += i;
+
+	if (!cfg.chip_id)
+		by_name = true;
+
+	num_chips = chip_paths(cfg.chip_id, &paths);
+	if ((cfg.chip_id != NULL)  && (num_chips == 0))
+		die("cannot find a GPIO chip character device corresponding to %s", cfg.chip_id);
+
+	if (argc) {
+		resolver = malloc(sizeof(*resolver) + argc * sizeof(struct resolved_line));
+		if (resolver == NULL)
+			die("out of memory");
+		resolver->num_lines = argc;
+		resolver->num_found = 0;
+		resolver->strict = cfg.strict;
+		for (i = 0; i < argc; i++) {
+			line = &resolver->lines[i];
+			line->id = argv[i];
+			line->chip_path = NULL;  // doubles as found flag
+			line->offset = by_name ? -1 : parse_uint(argv[i]);
+			line->id_is_name = (line->offset == -1);
 		}
 	}
 
-	argc -= optind;
-	argv += optind;
-
-	if (argc == 0) {
-		num_chips = scandir("/dev/", &entries,
-				    chip_dir_filter, alphasort);
-		if (num_chips < 0)
-			die_perror("unable to scan /dev");
-
-		for (i = 0; i < num_chips; i++) {
-			chip = chip_open_by_name(entries[i]->d_name);
-			if (!chip)
-				die_perror("unable to open %s",
-					   entries[i]->d_name);
-
-			list_lines(chip);
-
+	for (i = 0; i < num_chips; i++) {
+		chip = gpiod_chip_open(paths[i]);
+		if (chip) {
+			list_lines(chip, paths[i], resolver);
 			gpiod_chip_close(chip);
-			free(entries[i]);
+		} else {
+			print_perror("unable to open chip %s", paths[i]);
+			ret = EXIT_FAILURE;
+			if (cfg.chip_id)
+				return EXIT_FAILURE;
 		}
-		free(entries);
-	} else {
-		for (i = 0; i < argc; i++) {
-			chip = chip_open_lookup(argv[i]);
-			if (!chip)
-				die_perror("looking up chip %s", argv[i]);
-
-			list_lines(chip);
-
-			gpiod_chip_close(chip);
+		free(paths[i]);
+	}
+	free(paths);
+
+	if (resolver) {
+		for (i = 0; i < resolver->num_lines; i++) {
+			if (resolver->lines[i].chip_path)
+				continue;
+			if (cfg.chip_id && !resolver->lines[i].id_is_name)
+				print_error("offset %s is out of range on chip %s",
+					resolver->lines[i].id, cfg.chip_id);
+			else
+				print_error("cannot find line %s", resolver->lines[i].id);
+			ret = EXIT_FAILURE;
 		}
+		if (resolver->num_lines != resolver->num_found)
+			ret = EXIT_FAILURE;
+		free(resolver);
 	}
-
-	return EXIT_SUCCESS;
+	return ret;
 }
diff --git a/tools/gpiomon.c b/tools/gpiomon.c
index f6a0dba..488eee1 100644
--- a/tools/gpiomon.c
+++ b/tools/gpiomon.c
@@ -1,79 +1,196 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
-// SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
+// SPDX-FileCopyrightText: 2017-2022 Bartosz Golaszewski <bartekgola@gmail.com>
 
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
 
+static int by_name;
+static int event_clock_mode;
+static int banner;
 static const struct option longopts[] = {
-	{ "help",		no_argument,		NULL,	'h' },
-	{ "version",		no_argument,		NULL,	'v' },
 	{ "active-low",		no_argument,		NULL,	'l' },
-	{ "bias",		required_argument,	NULL,	'B' },
-	{ "num-events",		required_argument,	NULL,	'n' },
-	{ "silent",		no_argument,		NULL,	's' },
-	{ "rising-edge",	no_argument,		NULL,	'r' },
-	{ "falling-edge",	no_argument,		NULL,	'f' },
-	{ "line-buffered",	no_argument,		NULL,	'b' },
+	{ "banner",		no_argument,		&banner,	1 },
+	{ "bias",		required_argument,	NULL,	'b' },
+	{ "by-name",		no_argument,		&by_name,	1 },
+	{ "chip",		required_argument,	NULL,	'c' },
+	{ "debounce-period",	required_argument,	NULL,	'p' },
+	{ "edge",		required_argument,	NULL,	'e' },
 	{ "format",		required_argument,	NULL,	'F' },
+	{ "help",		no_argument,		NULL,	'h' },
+	{ "localtime",		no_argument,		&event_clock_mode,	2 },
+	{ "num-events",		required_argument,	NULL,	'n' },
+	{ "quiet",		no_argument,		NULL,	'q' },
+	{ "silent",		no_argument,		NULL,	'q' },
+	{ "strict",		no_argument,		NULL,	's' },
+	{ "utc",		no_argument,		&event_clock_mode,	1 },
+	{ "version",		no_argument,		NULL,	'v' },
 	{ GETOPT_NULL_LONGOPT },
 };
 
-static const char *const shortopts = "+hvlB:n:srfbF:";
+static const char *const shortopts = "+b:c:e:hF:ln:p:qshv";
 
 static void print_help(void)
 {
-	printf("Usage: %s [OPTIONS] <chip name/number> <offset 1> <offset 2> ...\n",
-	       get_progname());
+	printf("Usage: %s [OPTIONS] <line> ...\n", get_progname());
 	printf("\n");
-	printf("Wait for events on GPIO lines and print them to standard output\n");
+	printf("Wait for events on GPIO lines and print them to standard output.\n");
 	printf("\n");
-	printf("Options:\n");
-	printf("  -h, --help:\t\tdisplay this message and exit\n");
-	printf("  -v, --version:\tdisplay the version and exit\n");
-	printf("  -l, --active-low:\tset the line active state to low\n");
-	printf("  -B, --bias=[as-is|disable|pull-down|pull-up] (defaults to 'as-is'):\n");
-	printf("		set the line bias\n");
-	printf("  -n, --num-events=NUM:\texit after processing NUM events\n");
-	printf("  -s, --silent:\t\tdon't print event info\n");
-	printf("  -r, --rising-edge:\tonly process rising edge events\n");
-	printf("  -f, --falling-edge:\tonly process falling edge events\n");
-	printf("  -b, --line-buffered:\tset standard output as line buffered\n");
-	printf("  -F, --format=FMT\tspecify custom output format\n");
+	printf("Lines are specified by name, or optionally by offset if the chip option\n");
+	printf("is provided.\n");
 	printf("\n");
+	printf("Options:\n");
+	printf("      --banner\t\tdisplay a banner on successful startup\n");
 	print_bias_help();
+	printf("      --by-name\t\ttreat lines as names even if they would parse as an offset\n");
+	printf("  -c, --chip <chip>\trestrict scope to a particular chip\n");
+	printf("  -e, --edge <edge>\tspecify the edges to monitor.\n");
+	printf("\t\t\tPossible values: 'falling', 'rising', 'both'.\n");
+	printf("\t\t\t(default is 'both')\n");
+	printf("  -h, --help\t\tdisplay this help and exit\n");
+	printf("  -F, --format <fmt>\tspecify a custom output format\n");
+	printf("  -l, --active-low\ttreat the line as active low, flipping the sense of\n");
+	printf("\t\t\trising and falling edges\n");
+	printf("      --localtime\treport event time as a local time (default is monotonic)\n");
+	printf("  -n, --num-events <num>\n");
+	printf("\t\t\texit after processing num events\n");
+	printf("  -p, --debounce-period <period>\n");
+	printf("\t\t\tdebounce the line(s) with the specified period\n");
+	printf("  -q, --quiet\t\tdon't generate any output\n");
+	printf("  -s, --strict\t\tabort if requested line names are not unique\n");
+	printf("      --utc\t\treport event time as UTC (default is monotonic)\n");
+	printf("  -v, --version\t\toutput version information and exit\n");
+	print_chip_help();
+	print_period_help();
 	printf("\n");
 	printf("Format specifiers:\n");
-	printf("  %%o:  GPIO line offset\n");
-	printf("  %%e:  event type (0 - falling edge, 1 rising edge)\n");
-	printf("  %%s:  seconds part of the event timestamp\n");
-	printf("  %%n:  nanoseconds part of the event timestamp\n");
+	printf("  %%o   GPIO line offset\n");
+	printf("  %%l   GPIO line name\n");
+	printf("  %%c   GPIO chip path\n");
+	printf("  %%e   numeric event type ('0' - falling edge or '1' - rising edge)\n");
+	printf("  %%E   event type (falling or rising)\n");
+	printf("  %%s   seconds part of the event timestamp\n");
+	printf("  %%n   nanoseconds part of the event timestamp\n");
+	printf("  %%T   event timestamp as datetime (UTC if --utc or local time if --localtime)\n");
 }
 
-struct mon_ctx {
-	unsigned int offset;
-	bool silent;
-	char *fmt;
+static int parse_edge_or_die(const char *option)
+{
+	if (strcmp(option, "rising") == 0)
+		return GPIOD_LINE_EDGE_RISING;
+	if (strcmp(option, "falling") == 0)
+		return GPIOD_LINE_EDGE_FALLING;
+	if (strcmp(option, "both") != 0)
+		die("invalid edge: %s", option);
+	return GPIOD_LINE_EDGE_BOTH;
+}
+
+struct config {
+	bool active_low;
+	bool quiet;
+	bool strict;
+	int bias;
+	int edge;
+	int events_wanted;
+	unsigned int debounce_period_us;
+	const char *chip_id;
+	const char *fmt;
 };
 
-static void event_print_custom(unsigned int offset, uint64_t timeout,
-			       int event_type, struct mon_ctx *ctx)
+int parse_config(int argc, char **argv, struct config *cfg)
+{
+	int opti, optc;
+
+	memset(cfg, 0, sizeof(*cfg));
+	cfg->edge = GPIOD_LINE_EDGE_BOTH;
+
+	for (;;) {
+		optc = getopt_long(argc, argv, shortopts, longopts, &opti);
+		if (optc < 0)
+			break;
+
+		switch (optc) {
+		case 'b':
+			cfg->bias = parse_bias_or_die(optarg);
+			break;
+		case 'c':
+			cfg->chip_id = optarg;
+			break;
+		case 'e':
+			cfg->edge = parse_edge_or_die(optarg);
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
+static void print_banner(int num_lines, char **lines)
 {
-	char *prev, *curr, fmt;
+	int i;
+
+	if (num_lines > 1) {
+		printf("Monitoring lines ");
+		for (i = 0; i < num_lines - 1; i++)
+			printf("%s, ", lines[i]);
+		printf("and %s...\n", lines[i]);
+	} else {
+		printf("Monitoring line %s ...\n", lines[0]);
+	}
+}
+
+static void event_print_custom(struct gpiod_edge_event *event, const char *chip_path,
+			       struct line_resolver *resolver, const char *evt_fmt)
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
 
-	for (prev = curr = ctx->fmt;;) {
+	for (prev = curr = evt_fmt;;) {
 		curr = strchr(curr, '%');
 		if (!curr) {
 			fputs(prev, stdout);
@@ -86,20 +203,38 @@ static void event_print_custom(unsigned int offset, uint64_t timeout,
 		fmt = *(curr + 1);
 
 		switch (fmt) {
-		case 'o':
-			printf("%u", offset);
+		case 'c':
+			printf("%s", chip_path);
 			break;
 		case 'e':
-			if (event_type == GPIOD_EDGE_EVENT_RISING_EDGE)
+			if (evtype == GPIOD_EDGE_EVENT_RISING_EDGE)
 				fputc('1', stdout);
 			else
 				fputc('0', stdout);
 			break;
-		case 's':
-			printf("%"PRIu64, timeout / 1000000000);
+		case 'E':
+			if (evtype == GPIOD_EDGE_EVENT_RISING_EDGE)
+				fputs("rising", stdout);
+			else
+				fputs("falling", stdout);
+			break;
+		case 'l':
+			lname = get_line_name(resolver, chip_path, offset);
+			if (!lname)
+				lname = "??";
+			printf("%s", lname);
+			break;
+		case 'o':
+			printf("%u", offset);
 			break;
 		case 'n':
-			printf("%"PRIu64, timeout % 1000000000);
+			printf("%"PRIu64, evtime % 1000000000);
+			break;
+		case 's':
+			printf("%"PRIu64, evtime / 1000000000);
+			break;
+		case 'T':
+			print_event_time(evtime, event_clock_mode);
 			break;
 		case '%':
 			fputc('%', stdout);
@@ -120,201 +255,161 @@ end:
 	fputc('\n', stdout);
 }
 
-static void event_print_human_readable(unsigned int offset,
-				       uint64_t timeout, int event_type)
+static void event_print_human_readable(struct gpiod_edge_event *event,
+				       const char *chip_id,
+				       const char *chip_path,
+				       struct line_resolver *resolver)
 {
+	unsigned int offset;
+	uint64_t evtime;
 	char *evname;
+	const char *lname;
 
-	if (event_type == GPIOD_EDGE_EVENT_RISING_EDGE)
-		evname = " RISING EDGE";
-	else
-		evname = "FALLING EDGE";
+	offset = gpiod_edge_event_get_line_offset(event);
+	evtime = gpiod_edge_event_get_timestamp_ns(event);
 
-	printf("event: %s offset: %u timestamp: [%8"PRIu64".%09"PRIu64"]\n",
-	       evname, offset, timeout / 1000000000, timeout % 1000000000);
-}
-
-static void handle_event(unsigned int line_offset, unsigned int event_type,
-			 uint64_t timestamp, struct mon_ctx *ctx)
-{
-	if (!ctx->silent) {
-		if (ctx->fmt)
-			event_print_custom(line_offset, timestamp,
-					   event_type, ctx);
+	if (gpiod_edge_event_get_event_type(event) == GPIOD_EDGE_EVENT_RISING_EDGE)
+		evname = "RISING ";
+	else
+		evname = "FALLING";
+	lname = get_line_name(resolver, chip_path, offset);
+	print_event_time(evtime, event_clock_mode);
+	if (lname)
+		if (chip_id)
+			printf(" %s chip: %s offset: %u name: %s\n",
+			       evname, chip_id, offset, lname);
 		else
-			event_print_human_readable(line_offset,
-						   timestamp, event_type);
-	}
+			printf(" %s %s\n", evname, lname);
+	else
+		printf(" %s chip: %s offset: %u\n", evname, chip_id, offset);
 }
 
-static void handle_signal(int signum UNUSED)
+static void event_print(struct gpiod_edge_event *event, const char *chip_id,
+			const char *chip_path,	struct line_resolver *resolver,
+			const char *fmt)
 {
-	exit(EXIT_SUCCESS);
+	if (fmt)
+		event_print_custom(event, chip_path, resolver, fmt);
+	else
+		event_print_human_readable(event, chip_id, chip_path, resolver);
 }
 
 int main(int argc, char **argv)
 {
-	bool watch_rising = false, watch_falling = false, active_low = false;
-	size_t num_lines = 0, events_wanted = 0, events_done = 0;
+	int num_lines, events_done = 0;
 	struct gpiod_edge_event_buffer *event_buffer;
-	int optc, opti, ret, i, edge, bias = 0;
-	uint64_t timeout = 10 * 1000000000LLU;
+	int ret, i, j;
 	struct gpiod_request_config *req_cfg;
-	struct gpiod_line_request *request;
+	struct gpiod_line_request **requests;
+	struct pollfd *pollfds;
 	struct gpiod_line_config *line_cfg;
-	unsigned int offsets[64], offset;
+	unsigned int *offsets;
 	struct gpiod_edge_event *event;
 	struct gpiod_chip *chip;
-	struct mon_ctx ctx;
-	char *end;
-
-	/*
-	 * FIXME: use signalfd once the API has been converted to using a single file
-	 * descriptor as provided by uAPI v2.
-	 */
-	signal(SIGINT, handle_signal);
-	signal(SIGTERM, handle_signal);
-
-	memset(&ctx, 0, sizeof(ctx));
+	struct line_resolver *resolver;
+	const char *chip_path;
+	struct config cfg;
 
-	for (;;) {
-		optc = getopt_long(argc, argv, shortopts, longopts, &opti);
-		if (optc < 0)
-			break;
-
-		switch (optc) {
-		case 'h':
-			print_help();
-			return EXIT_SUCCESS;
-		case 'v':
-			print_version();
-			return EXIT_SUCCESS;
-		case 'l':
-			active_low = true;
-			break;
-		case 'B':
-			bias = parse_bias(optarg);
-			break;
-		case 'n':
-			events_wanted = strtoul(optarg, &end, 10);
-			if (*end != '\0')
-				die("invalid number: %s", optarg);
-			break;
-		case 's':
-			ctx.silent = true;
-			break;
-		case 'r':
-			watch_rising = true;
-			break;
-		case 'f':
-			watch_falling = true;
-			break;
-		case 'b':
-			setlinebuf(stdout);
-			break;
-		case 'F':
-			ctx.fmt = optarg;
-			break;
-		case '?':
-			die("try %s --help", get_progname());
-		default:
-			abort();
-		}
-	}
-
-	argc -= optind;
-	argv += optind;
-
-	if (watch_rising && !watch_falling)
-		edge = GPIOD_LINE_EDGE_RISING;
-	else if (watch_falling && !watch_rising)
-		edge = GPIOD_LINE_EDGE_FALLING;
-	else
-		edge = GPIOD_LINE_EDGE_BOTH;
+	i = parse_config(argc, argv, &cfg);
+	argc -= i;
+	argv += i;
 
 	if (argc < 1)
-		die("gpiochip must be specified");
-
-	if (argc < 2)
-		die("at least one GPIO line offset must be specified");
-
-	if (argc > 65)
-		die("too many offsets given");
-
-	for (i = 1; i < argc; i++) {
-		offset = strtoul(argv[i], &end, 10);
-		if (*end != '\0' || offset > INT_MAX)
-			die("invalid GPIO offset: %s", argv[i]);
-
-		offsets[i - 1] = offset;
-		num_lines++;
-	}
+		die("at least one GPIO line must be specified");
 
-	chip = chip_open_lookup(argv[0]);
-	if (!chip)
-		die_perror("unable to open %s", argv[0]);
+	if (argc > 64)
+		die("too many lines given");
 
 	line_cfg = gpiod_line_config_new();
 	if (!line_cfg)
 		die_perror("unable to allocate the line config structure");
 
-	if (bias)
-		gpiod_line_config_set_bias_default(line_cfg, bias);
-	if (active_low)
+	if (cfg.bias)
+		gpiod_line_config_set_bias_default(line_cfg, cfg.bias);
+	if (cfg.active_low)
 		gpiod_line_config_set_active_low_default(line_cfg, true);
-	gpiod_line_config_set_edge_detection_default(line_cfg, edge);
+	if (cfg.debounce_period_us)
+		gpiod_line_config_set_debounce_period_us_default(line_cfg, cfg.debounce_period_us);
+	if (event_clock_mode)
+		gpiod_line_config_set_event_clock_default(line_cfg,
+							  GPIOD_LINE_EVENT_CLOCK_REALTIME);
+	gpiod_line_config_set_edge_detection_default(line_cfg, cfg.edge);
 
 	req_cfg = gpiod_request_config_new();
 	if (!req_cfg)
 		die_perror("unable to allocate the request config structure");
 
 	gpiod_request_config_set_consumer(req_cfg, "gpiomon");
-	gpiod_request_config_set_offsets(req_cfg, num_lines, offsets);
-
-	request = gpiod_chip_request_lines(chip, req_cfg, line_cfg);
-	if (!request)
-		die_perror("unable to request lines");
 
 	event_buffer = gpiod_edge_event_buffer_new(EVENT_BUF_SIZE);
 	if (!event_buffer)
 		die_perror("unable to allocate the line event buffer");
 
+	resolver = resolve_lines(argc, argv, cfg.chip_id, cfg.strict, by_name);
+	requests = calloc(resolver->num_chips, sizeof(*requests));
+	pollfds = calloc(resolver->num_chips, sizeof(*pollfds));
+	offsets = calloc(resolver->num_lines, sizeof(*offsets));
+	if (!requests || !pollfds || !offsets)
+		die("out of memory");
+	for (i = 0; i < resolver->num_chips; i++) {
+		chip_path = resolver->chip_paths[i];
+		num_lines = get_line_offsets_and_values(resolver, chip_path, offsets, NULL);
+		gpiod_request_config_set_offsets(req_cfg, num_lines, offsets);
+
+		chip = gpiod_chip_open(chip_path);
+		if (!chip)
+			die_perror("unable to open chip %s", chip_path);
+
+		requests[i] = gpiod_chip_request_lines(chip, req_cfg, line_cfg);
+		if (!requests[i])
+			die_perror("unable to request lines on chip %s", chip_path);
+
+		pollfds[i].fd = gpiod_line_request_get_fd(requests[i]);
+		pollfds[i].events = POLLIN;
+		gpiod_chip_close(chip);
+	}
+	gpiod_request_config_free(req_cfg);
+	gpiod_line_config_free(line_cfg);
+
+	if (banner)
+		print_banner(argc, argv);
+
 	for (;;) {
-		ret = gpiod_line_request_wait_edge_event(request, timeout);
-		if (ret < 0)
-			die_perror("error waiting for events");
-		if (ret == 0)
-			continue;
-
-		ret = gpiod_line_request_read_edge_event(request, event_buffer,
-							 EVENT_BUF_SIZE);
-		if (ret < 0)
-			die_perror("error reading line events");
-
-		for (i = 0; i < ret; i++) {
-			event = gpiod_edge_event_buffer_get_event(event_buffer,
-								  i);
-			if (!event)
-				die_perror("unable to retrieve the event from the buffer");
-
-			handle_event(gpiod_edge_event_get_line_offset(event),
-				     gpiod_edge_event_get_event_type(event),
-				     gpiod_edge_event_get_timestamp_ns(event),
-				     &ctx);
-
-			events_done++;
-
-			if (events_wanted && events_done >= events_wanted)
-				goto done;
+		if (poll(pollfds, resolver->num_chips, -1) < 0)
+			die_perror("error polling for events");
+
+		for (i = 0; i < resolver->num_chips; i++) {
+			if (pollfds[i].revents == 0)
+				continue;
+
+			ret = gpiod_line_request_read_edge_event(requests[i], event_buffer,
+								 EVENT_BUF_SIZE);
+			if (ret < 0)
+				die_perror("error reading line events");
+
+			for (j = 0; j < ret; j++) {
+				event = gpiod_edge_event_buffer_get_event(event_buffer, j);
+				if (!event)
+					die_perror("unable to retrieve event from buffer");
+
+				if (!cfg.quiet)
+					event_print(event, cfg.chip_id, resolver->chip_paths[i],
+						    resolver, cfg.fmt);
+
+				events_done++;
+
+				if (cfg.events_wanted && events_done >= cfg.events_wanted)
+					goto done;
+			}
 		}
 	}
-
 done:
+	for (i = 0; i < resolver->num_chips; i++)
+		gpiod_line_request_release(requests[i]);
+	free(requests);
+	free_line_resolver(resolver);
 	gpiod_edge_event_buffer_free(event_buffer);
-	gpiod_line_request_release(request);
-	gpiod_request_config_free(req_cfg);
-	gpiod_line_config_free(line_cfg);
-	gpiod_chip_close(chip);
+	free(offsets);
 
 	return EXIT_SUCCESS;
 }
diff --git a/tools/gpioset.c b/tools/gpioset.c
index 576b87d..70f9fb7 100644
--- a/tools/gpioset.c
+++ b/tools/gpioset.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
-// SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
+// SPDX-FileCopyrightText: 2017-2022 Bartosz Golaszewski <bartekgola@gmail.com>
 
-#include <errno.h>
+#include <ctype.h>
 #include <gpiod.h>
 #include <getopt.h>
 #include <limits.h>
@@ -9,322 +9,723 @@
 #include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
-#include <sys/select.h>
 #include <unistd.h>
+#include <readline/history.h>
+#include <readline/readline.h>
 
 #include "tools-common.h"
 
+static int by_name;
 static const struct option longopts[] = {
+	{ "active-low",		no_argument,		NULL,	'l' },
+	{ "bias",		required_argument,	NULL,	'b' },
+	{ "by-name",		no_argument,		&by_name,	1 },
+	{ "chip",		required_argument,	NULL,	'c' },
+	{ "daemonize",		no_argument,		NULL,	'z' },
+	{ "drive",		required_argument,	NULL,	'd' },
 	{ "help",		no_argument,		NULL,	'h' },
+	{ "hold-period",	required_argument,	NULL,	'p' },
+	{ "interactive",	no_argument,		NULL,	'i' },
+	{ "strict",		no_argument,		NULL,	's' },
+	{ "toggle",		required_argument,	NULL,	't' },
 	{ "version",		no_argument,		NULL,	'v' },
-	{ "active-low",		no_argument,		NULL,	'l' },
-	{ "bias",		required_argument,	NULL,	'B' },
-	{ "drive",		required_argument,	NULL,	'D' },
-	{ "mode",		required_argument,	NULL,	'm' },
-	{ "sec",		required_argument,	NULL,	's' },
-	{ "usec",		required_argument,	NULL,	'u' },
-	{ "background",		no_argument,		NULL,	'b' },
 	{ GETOPT_NULL_LONGOPT },
 };
 
-static const char *const shortopts = "+hvlB:D:m:s:u:b";
+static const char *const shortopts = "+b:c:d:hilp:st:vz";
 
 static void print_help(void)
 {
-	printf("Usage: %s [OPTIONS] <chip name/number> <offset1>=<value1> <offset2>=<value2> ...\n",
-	       get_progname());
-	printf("\n");
-	printf("Set GPIO line values of a GPIO chip and maintain the state until the process exits\n");
+	printf("Usage: %s [OPTIONS] <line>=<value> ...\n", get_progname());
 	printf("\n");
-	printf("Options:\n");
-	printf("  -h, --help:\t\tdisplay this message and exit\n");
-	printf("  -v, --version:\tdisplay the version and exit\n");
-	printf("  -l, --active-low:\tset the line active state to low\n");
-	printf("  -B, --bias=[as-is|disable|pull-down|pull-up] (defaults to 'as-is'):\n");
-	printf("		set the line bias\n");
-	printf("  -D, --drive=[push-pull|open-drain|open-source] (defaults to 'push-pull'):\n");
-	printf("		set the line drive mode\n");
-	printf("  -m, --mode=[exit|wait|time|signal] (defaults to 'exit'):\n");
-	printf("		tell the program what to do after setting values\n");
-	printf("  -s, --sec=SEC:\tspecify the number of seconds to wait (only valid for --mode=time)\n");
-	printf("  -u, --usec=USEC:\tspecify the number of microseconds to wait (only valid for --mode=time)\n");
-	printf("  -b, --background:\tafter setting values: detach from the controlling terminal\n");
+	printf("Set values of GPIO lines.\n");
 	printf("\n");
-	print_bias_help();
+	printf("Lines are specified by name, or optionally by offset if the chip option\n");
+	printf("is provided.\n");
+	printf("Values may be '1' or '0', or equivalently 'active'/'inactive' or 'on'/'off'.\n");
 	printf("\n");
-	printf("Drives:\n");
-	printf("  push-pull:\tdrive the line both high and low\n");
-	printf("  open-drain:\tdrive the line low or go high impedance\n");
-	printf("  open-source:\tdrive the line high or go high impedance\n");
+	printf("The line output state is maintained until the process exits, but after that\n");
+	printf("is not guaranteed.\n");
 	printf("\n");
-	printf("Modes:\n");
-	printf("  exit:\t\tset values and exit immediately\n");
-	printf("  wait:\t\tset values and wait for user to press ENTER\n");
-	printf("  time:\t\tset values and sleep for a specified amount of time\n");
-	printf("  signal:\tset values and wait for SIGINT or SIGTERM\n");
+	printf("Options:\n");
+	print_bias_help();
+	printf("      --by-name\t\ttreat lines as names even if they would parse as an offset\n");
+	printf("  -c, --chip <chip>\trestrict scope to a particular chip\n");
+	printf("  -d, --drive <drive>\tspecify the line drive mode.\n");
+	printf("\t\t\tPossible values: 'push-pull', 'open-drain', 'open-source'.\n");
+	printf("\t\t\t(default is 'push-pull')\n");
+	printf("  -h, --help\t\tdisplay this help and exit\n");
+	printf("  -i, --interactive\tset the lines then wait for additional set commands.\n");
+	printf("\t\t\tUse the 'help' command at the interactive prompt to get help\n");
+	printf("\t\t\tfor the supported commands.\n");
+	printf("  -l, --active-low\ttreat the line as active low\n");
+	printf("  -p, --hold-period <period>\n");
+	printf("\t\t\tthe minimum time period to hold lines at the requested values\n");
+	printf("  -s, --strict\t\tabort if requested line names are not unique\n");
+	printf("  -t, --toggle <period>[,period]...\n");
+	printf("\t\t\ttoggle the line(s) after the specified period(s).\n");
+	printf("\t\t\tIf the last period is non-zero then the sequence repeats.\n");
+	printf("  -v, --version\t\toutput version information and exit\n");
+	printf("  -z, --daemonize\tset values then detach from the controlling terminal\n");
+	print_chip_help();
+	print_period_help();
 	printf("\n");
-	printf("Note: the state of a GPIO line controlled over the character device reverts to default\n");
-	printf("when the last process referencing the file descriptor representing the device file exits.\n");
-	printf("This means that it's wrong to run gpioset, have it exit and expect the line to continue\n");
-	printf("being driven high or low. It may happen if given pin is floating but it must be interpreted\n");
-	printf("as undefined behavior.\n");
+	printf("*Note*\n");
+	printf("    The state of a GPIO line controlled over the character device reverts to default\n");
+	printf("    when the last process referencing the file descriptor representing the device file exits.\n");
+	printf("    This means that it's wrong to run gpioset, have it exit and expect the line to continue\n");
+	printf("    being driven high or low. It may happen if given pin is floating but it must be interpreted\n");
+	printf("    as undefined behavior.\n");
 }
 
-struct callback_data {
-	/* Replace with a union once we have more modes using callback data. */
-	struct timeval tv;
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
+struct config {
+	bool active_low;
+	bool interactive;
+	bool strict;
 	bool daemonize;
+	int bias;
+	int drive;
+	int toggles;
+	unsigned int *toggle_periods;
+	unsigned int hold_period_us;
+	const char *chip_id;
 };
 
-static void maybe_daemonize(bool daemonize)
+int parse_config(int argc, char **argv, struct config *cfg)
 {
-	int rv;
+	int opti, optc;
 
-	if (daemonize) {
-		rv = daemon(0, 0);
-		if (rv < 0)
-			die("unable to daemonize: %s", strerror(errno));
+	memset(cfg, 0, sizeof(*cfg));
+	for (;;) {
+		optc = getopt_long(argc, argv, shortopts, longopts, &opti);
+		if (optc < 0)
+			break;
+
+		switch (optc) {
+		case 'b':
+			cfg->bias = parse_bias_or_die(optarg);
+			break;
+		case 'c':
+			cfg->chip_id = optarg;
+			break;
+		case 'd':
+			cfg->drive = parse_drive_or_die(optarg);
+			break;
+		case 'i':
+			cfg->interactive = true;
+			break;
+		case 'l':
+			cfg->active_low = true;
+			break;
+		case 'p':
+			cfg->hold_period_us = parse_period_or_die(optarg);
+			break;
+		case 's':
+			cfg->strict = true;
+			break;
+		case 't':
+			cfg->toggles = parse_periods_or_die(optarg, &cfg->toggle_periods);
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
 	}
+	if (cfg->daemonize && cfg->interactive)
+		die("can't combine daemonize with interactive");
+
+	if (cfg->toggles && cfg->interactive)
+		die("can't combine interactive with toggle");
+
+	return optind;
 }
 
-static void wait_enter(void *data UNUSED)
+static int parse_value(const char *option)
 {
-	getchar();
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
 }
 
-static void wait_time(void *data)
+// parse num_lines line id and values from lvs into lines and values
+static bool parse_line_values(int num_lines, char **lvs, char **lines, int *values,
+			      bool interactive)
 {
-	struct callback_data *cbdata = data;
+	int i;
+	char *value;
 
-	maybe_daemonize(cbdata->daemonize);
-	select(0, NULL, NULL, NULL, &cbdata->tv);
+	for (i = 0; i < num_lines; i++) {
+		value = strchr(lvs[i], '=');
+		if (!value) {
+			if (interactive)
+				printf("invalid line value: %s\n", lvs[i]);
+			else
+				print_error("invalid line value: %s", lvs[i]);
+			return false;
+		}
+		*value = '\0';
+		value++;
+		values[i] = parse_value(value);
+		if (values[i] < 0) {
+			if (interactive)
+				printf("invalid line value: %s\n", value);
+			else
+				print_error("invalid line value: %s", value);
+			return false;
+		}
+		lines[i] = lvs[i];
+	}
+	return true;
 }
 
-static void wait_signal(void *data)
+// parse num_lines line id and values from lvs into lines and values, or die trying.
+static void parse_line_values_or_die(int num_lines, char **lvs, char **lines, int *values)
 {
-	struct callback_data *cbdata = data;
-	struct pollfd pfd;
-	int sigfd, rv;
+	if (!parse_line_values(num_lines, lvs, lines, values, false))
+		exit(EXIT_FAILURE);
+}
 
-	sigfd = make_signalfd();
+static void wait_fd(int fd)
+{
+	struct pollfd pfd;
 
-	memset(&pfd, 0, sizeof(pfd));
-	pfd.fd = sigfd;
-	pfd.events = POLLIN | POLLPRI;
+	pfd.fd = fd;
+	pfd.events = POLLERR;
 
-	maybe_daemonize(cbdata->daemonize);
+	if (poll(&pfd, 1, -1) < 0)
+		die_perror("error waiting on request");
+}
 
-	for (;;) {
-		rv = poll(&pfd, 1, 1000 /* one second */);
-		if (rv < 0)
-			die("error polling for signals: %s", strerror(errno));
-		else if (rv > 0)
-			break;
+// Apply values from the resolver to the requests.
+// offset and values are scratch pads for working.
+static void apply_values(struct gpiod_line_request **requests, struct line_resolver *resolver,
+			  unsigned int *offsets, int *values)
+{
+	int i;
+	const char *chip_path;
+
+	for (i = 0; i < resolver->num_chips; i++) {
+		chip_path = resolver->chip_paths[i];
+		get_line_offsets_and_values(resolver, chip_path, offsets, values);
+		if (gpiod_line_request_set_values(requests[i], values))
+			print_perror("failed to set values on chip %s", chip_path);
 	}
+}
 
-	/*
-	 * Don't bother reading siginfo - it's enough to know that we
-	 * received any signal.
-	 */
-	close(sigfd);
+// set the values in the resolver for the line values specified by the remaining parameters.
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
 }
 
-enum {
-	MODE_EXIT = 0,
-	MODE_WAIT,
-	MODE_TIME,
-	MODE_SIGNAL,
-};
+static void print_all_line_values(struct line_resolver *resolver)
+{
+	int i;
+	char *fmt = "%s=%s ";
+
+	for (i = 0; i < resolver->num_lines; i++) {
+		if (i == resolver->num_lines - 1)
+			fmt = "%s=%s\n";
+		printf(fmt, resolver->lines[i].id,
+		       resolver->lines[i].value ? "active" : "inactive");
+	}
+}
 
-struct mode_mapping {
-	int id;
-	const char *name;
-	void (*callback)(void *);
-};
+// print the resovler line values for a subset of lines, specified by num_lines and lines.
+static void print_line_values(struct line_resolver *resolver, int num_lines, char **lines)
+{
+	int i, j;
+	char *fmt = "%s=%s ";
 
-static const struct mode_mapping modes[] = {
-	[MODE_EXIT] = {
-		.id		= MODE_EXIT,
-		.name		= "exit",
-		.callback	= NULL,
-	},
-	[MODE_WAIT] = {
-		.id		= MODE_WAIT,
-		.name		= "wait",
-		.callback	= wait_enter,
-	},
-	[MODE_TIME] = {
-		.id		= MODE_TIME,
-		.name		= "time",
-		.callback	= wait_time,
-	},
-	[MODE_SIGNAL] = {
-		.id		= MODE_SIGNAL,
-		.name		= "signal",
-		.callback	= wait_signal,
-	},
-};
+	for (i = 0; i < num_lines; i++) {
+		if (i == num_lines - 1)
+			fmt = "%s=%s\n";
+		for (j = 0; j < resolver->num_lines; j++)
+			if (strcmp(lines[i], resolver->lines[j].id) == 0) {
+				printf(fmt, resolver->lines[j].id,
+				       resolver->lines[j].value ? "active" : "inactive");
+				break;
+			}
+	}
+}
 
-static const struct mode_mapping *parse_mode(const char *mode)
+// toggle the values of all lines in the resolver
+static void toggle_all_lines(struct line_resolver *resolver)
 {
-	size_t i;
-
-	for (i = 0; i < ARRAY_SIZE(modes); i++)
-		if (strcmp(mode, modes[i].name) == 0)
-			return &modes[i];
+	int i;
 
-	return NULL;
+	for (i = 0; i < resolver->num_lines; i++)
+		resolver->lines[i].value = !resolver->lines[i].value;
 }
 
-static int parse_drive(const char *option)
+// toggle a subset of lines, specified by num_lines and lines, in the resolver.
+static void toggle_lines(struct line_resolver *resolver, int num_lines, char **lines)
 {
-	if (strcmp(option, "open-drain") == 0)
-		return GPIOD_LINE_DRIVE_OPEN_DRAIN;
-	if (strcmp(option, "open-source") == 0)
-		return GPIOD_LINE_DRIVE_OPEN_SOURCE;
-	if (strcmp(option, "push-pull") != 0)
-		die("invalid drive: %s", option);
-	return 0;
+	int i, l;
+
+	for (l = 0; l < num_lines; l++)
+		for (i = 0; i < resolver->num_lines; i++)
+			if (strcmp(lines[l], resolver->lines[i].id) == 0) {
+				resolver->lines[i].value = !resolver->lines[i].value;
+				break;
+			}
 }
 
-int main(int argc, char **argv)
+// toggle the resolved lines as specified by the toggle_periods,
+// and apply the values to the requests.
+// offset and values are scratch pads for working.
+static void toggle_sequence(int toggles, unsigned int *toggle_periods,
+			 struct gpiod_line_request **requests,
+			 struct line_resolver *resolver,
+			 unsigned int *offsets, int *values)
 {
-	const struct mode_mapping *mode = &modes[MODE_EXIT];
-	int ret, optc, opti, bias = 0, drive = 0, *values;
-	struct gpiod_request_config *req_cfg;
-	struct gpiod_line_request *request;
-	struct gpiod_line_config *line_cfg;
-	struct callback_data cbdata;
-	struct gpiod_chip *chip;
-	bool active_low = false;
-	unsigned int *offsets;
-	size_t i, num_lines;
-	char *device, *end;
-
-	memset(&cbdata, 0, sizeof(cbdata));
+	int i = 0;
 
 	for (;;) {
-		optc = getopt_long(argc, argv, shortopts, longopts, &opti);
-		if (optc < 0)
-			break;
+		usleep(toggle_periods[i]);
+		toggle_all_lines(resolver);
+		apply_values(requests, resolver, offsets, values);
 
-		switch (optc) {
-		case 'h':
-			print_help();
-			return EXIT_SUCCESS;
-		case 'v':
-			print_version();
-			return EXIT_SUCCESS;
-		case 'l':
-			active_low = true;
-			break;
-		case 'B':
-			bias = parse_bias(optarg);
-			break;
-		case 'D':
-			drive = parse_drive(optarg);
-			break;
-		case 'm':
-			mode = parse_mode(optarg);
-			if (!mode)
-				die("invalid mode: %s", optarg);
-			break;
-		case 's':
-			cbdata.tv.tv_sec = strtoul(optarg, &end, 10);
-			if (*end != '\0')
-				die("invalid time value in seconds: %s", optarg);
-			break;
-		case 'u':
-			cbdata.tv.tv_usec = strtoul(optarg, &end, 10);
-			if (*end != '\0')
-				die("invalid time value in microseconds: %s",
-				    optarg);
-			break;
-		case 'b':
-			cbdata.daemonize = true;
-			break;
-		case '?':
-			die("try %s --help", get_progname());
-		default:
-			abort();
+		i++;
+		if ((i == toggles - 1) && (toggle_periods[i] == 0))
+			return;
+
+		if (i == toggles)
+			i = 0;
+	}
+}
+
+// check that a set of lines, specified by num_lines and lines, are all resolved lines.
+static bool valid_lines(struct line_resolver *resolver, int num_lines, char **lines)
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
 		}
 	}
+	return  ret;
+}
 
-	argc -= optind;
-	argv += optind;
+static void print_interactive_help(void)
+{
+	printf("COMMANDS:\n\n");
+	printf("    exit\n");
+	printf("        Exit the program\n");
+	printf("    get [line] ...\n");
+	printf("        Display the output values of the given requested lines\n\n");
+	printf("        If no lines are specified then all requested lines are displayed\n\n");
+	printf("    help\n");
+	printf("        Print this help\n\n");
+	printf("    set <line=value> ...\n");
+	printf("        Update the output values of the given requested lines\n\n");
+	printf("    sleep <period>\n");
+	printf("        Sleep for the specified period\n\n");
+	printf("    toggle [line] ...\n");
+	printf("        Toggle the output values of the given requested lines\n\n");
+	printf("        If no lines are specified then all requested lines are toggled\n\n");
+}
 
-	if (mode->id != MODE_TIME && (cbdata.tv.tv_sec || cbdata.tv.tv_usec))
-		die("can't specify wait time in this mode");
+// split a line into words, returning the each of the words and the count.
+// max_words specifies the msax number of words that may be returned in words.
+static int split_words(char *line, int max_words, char **words)
+{
+	int num_words = 0;
+	bool in_word = false;
+
+	while (*line != '\0') {
+		if (!in_word && !isspace(*line)) {
+			in_word = true;
+			// count all words, but only store max_words
+			if (num_words < max_words)
+				words[num_words] = line;
+		} else if (isspace(*line)) {
+			if (in_word) {
+				num_words++;
+				in_word = false;
+			}
+			*line = '\0';
+		}
+		line++;
+	}
+	if (in_word)
+		num_words++;
+	return num_words;
+}
 
-	if (mode->id != MODE_SIGNAL &&
-	    mode->id != MODE_TIME &&
-	    cbdata.daemonize)
-		die("can't daemonize in this mode");
+// check if a line is specified somewhere in the rl_line_buffer
+static bool in_line_buffer(const char *id)
+{
+	int len = strlen(id);
+	char *match = rl_line_buffer;
+
+	while ((match = strstr(rl_line_buffer, id))) {
+		if ((match > rl_line_buffer && isspace(match[-1])) &&
+		    (isspace(match[len]) || (match[len] == '=')))
+			return true;
+		match += len;
+	}
 
-	if (argc < 1)
-		die("gpiochip must be specified");
+	return false;
+}
 
-	if (argc < 2)
-		die("at least one GPIO line offset to value mapping must be specified");
+// context for complete_line_id, so it can provide valid line ids.
+static struct line_resolver *completion_context;
 
-	device = argv[0];
+// tab completion helper for line ids.
+static char *complete_line_id(const char *text, int state)
+{
+	static int idx, len;
+	const char *id;
 
-	num_lines = argc - 1;
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
 
-	offsets = calloc(num_lines, sizeof(*offsets));
-	values = calloc(num_lines, sizeof(*values));
-	if (!offsets)
-		die("out of memory");
+// tab completion helper for line values (just the value component)
+static char *complete_value(const char *text, int state)
+{
+	static const char * const values[] = {
+		"1", "0", "active", "inactive", "on", "off", "true", "false", NULL
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
 
-	for (i = 0; i < num_lines; i++) {
-		ret = sscanf(argv[i + 1], "%u=%d", &offsets[i], &values[i]);
-		if (ret != 2)
-			die("invalid offset<->value mapping: %s", argv[i + 1]);
+// tab completion help for interactive commands
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
+	while ((cmd = commands[idx])) {
+		idx++;
+		if (strncmp(cmd, text, len) == 0)
+			return strdup(cmd);
+	}
+	return NULL;
+}
 
-		if (values[i] != 0 && values[i] != 1)
-			die("value must be 0 or 1: %s", argv[i + 1]);
+// tab completion for interactive command lines
+static char **tab_completion(const char *text, int start, int end)
+{
+	char **matches = NULL;
+	int cmd_start, cmd_end, len;
+
+	rl_attempted_completion_over = true;
+	rl_completion_type = '@';
+	rl_sort_completion_matches = false;
+
+	for (cmd_start = 0;
+	     isspace(rl_line_buffer[cmd_start]) && cmd_start < end;
+	     cmd_start++)
+		;
+	if (cmd_start == start)
+		matches = rl_completion_matches(text, complete_command);
+	for (cmd_end = cmd_start + 1;
+	     !isspace(rl_line_buffer[cmd_end]) && cmd_end < end;
+	     cmd_end++)
+		;
+
+	len = cmd_end - cmd_start;
+	if (len == 3 && strncmp("set", &rl_line_buffer[cmd_start], 3) == 0) {
+		if (rl_line_buffer[start-1] == '=') {
+			matches = rl_completion_matches(text, complete_value);
+		} else {
+			rl_completion_append_character = '=';
+			matches = rl_completion_matches(text, complete_line_id);
+		}
+	}
+	if ((len == 3 && strncmp("get", &rl_line_buffer[cmd_start], 3) == 0) ||
+	    (len == 6 && strncmp("toggle", &rl_line_buffer[cmd_start], 6) == 0))
+		matches = rl_completion_matches(text, complete_line_id);
+	return matches;
+}
 
-		if (offsets[i] > INT_MAX)
-			die("invalid offset: %s", argv[i + 1]);
+static void interact(struct gpiod_line_request **requests,
+		    struct line_resolver *resolver,
+		    char **lines, unsigned int *offsets, int *values)
+{
+	char *line;
+	int num_words, num_lines, max_words;
+	char **words;
+	int period_us, i;
+	char *line_buf;
+	bool done;
+
+	stifle_history(20);
+	rl_attempted_completion_function = tab_completion;
+	completion_context = resolver;
+
+	max_words = resolver->num_lines + 1;
+	words = calloc(max_words, sizeof(*words));
+	if (!words)
+		die("out of memory");
+	for (done = false; !done;) {
+		line = readline("gpioset> ");
+		if (!line || line[0] == '\0')
+			continue;
+		for (i = strlen(line) - 1; (i > 0) && isspace(line[i]); i--)
+			line[i] = '\0';
+		line_buf = strdup(line);
+		num_words = split_words(line_buf, max_words, words);
+		if (num_words > max_words) {
+			printf("too many command parameters provided\n");
+			goto cmd_done;
+		}
+		num_lines = num_words - 1;
+		if (strcmp(words[0], "get") == 0) {
+			if (num_lines == 0)
+				print_all_line_values(resolver);
+			else if (valid_lines(resolver, num_lines, &words[1]))
+				print_line_values(resolver, num_lines, &words[1]);
+			goto cmd_ok;
+		}
+		if (strcmp(words[0], "set") == 0) {
+			if (num_lines == 0)
+				printf("at least one GPIO line value must be specified\n");
+			else if (parse_line_values(num_lines, &words[1], lines, values, true) &&
+				 valid_lines(resolver, num_lines, lines)) {
+				set_line_values_subset(resolver, num_lines, lines, values);
+				apply_values(requests, resolver, offsets, values);
+			}
+			goto cmd_ok;
+		}
+		if (strcmp(words[0], "toggle") == 0) {
+			if (num_lines == 0)
+				toggle_all_lines(resolver);
+			else if (valid_lines(resolver, num_lines, &words[1]))
+				toggle_lines(resolver, num_lines, &words[1]);
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
+				printf("invalid period: %s\n", words[1]);
+				goto cmd_ok;
+			}
+			usleep(period_us);
+			goto cmd_ok;
+		}
+		if (strcmp(words[0], "exit") == 0) {
+			done = true;
+			goto cmd_done;
+		}
+		if (strcmp(words[0], "help") == 0) {
+			print_interactive_help();
+			goto cmd_done;
+		}
+		printf("unknown command: %s\n", words[0]);
+		printf("Try the 'help' command\n")
+			;
+cmd_ok:
+		for (i = 0; isspace(line[i]); i++)
+			;
+		if ((history_length) == 0 ||
+		    (strcmp(history_list()[history_length - 1]->line, &line[i]) != 0))
+			add_history(&line[i]);
+cmd_done:
+		free(line);
+		free(line_buf);
 	}
+	free(words);
+}
 
-	chip = chip_open_lookup(device);
-	if (!chip)
-		die_perror("unable to open %s", device);
+int main(int argc, char **argv)
+{
+	int i, num_lines, *values;
+	struct gpiod_request_config *req_cfg;
+	struct gpiod_line_request **requests;
+	struct gpiod_line_config *line_cfg;
+	struct gpiod_chip *chip;
+	unsigned int *offsets;
+	struct line_resolver *resolver;
+	char **lines;
+	const char *chip_path;
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
 
 	line_cfg = gpiod_line_config_new();
 	if (!line_cfg)
 		die_perror("unable to allocate the line config structure");
 
-	if (bias)
-		gpiod_line_config_set_bias_default(line_cfg, bias);
-	if (drive)
-		gpiod_line_config_set_drive_default(line_cfg, drive);
-	if (active_low)
+	if (cfg.bias)
+		gpiod_line_config_set_bias_default(line_cfg, cfg.bias);
+	if (cfg.drive)
+		gpiod_line_config_set_drive_default(line_cfg, cfg.drive);
+	if (cfg.active_low)
 		gpiod_line_config_set_active_low_default(line_cfg, true);
-	gpiod_line_config_set_direction_default(line_cfg,
-						GPIOD_LINE_DIRECTION_OUTPUT);
-	gpiod_line_config_set_output_values(line_cfg, num_lines,
-					    offsets, values);
+	gpiod_line_config_set_direction_default(line_cfg, GPIOD_LINE_DIRECTION_OUTPUT);
 
 	req_cfg = gpiod_request_config_new();
 	if (!req_cfg)
 		die_perror("unable to allocate the request config structure");
 
 	gpiod_request_config_set_consumer(req_cfg, "gpioset");
-	gpiod_request_config_set_offsets(req_cfg, num_lines, offsets);
+	resolver = resolve_lines(num_lines, lines, cfg.chip_id, cfg.strict, by_name);
+	for (i = 0; i < num_lines; i++)
+		resolver->lines[i].value = values[i];
+	requests = calloc(resolver->num_chips, sizeof(*requests));
+	offsets = calloc(num_lines, sizeof(*offsets));
+	if (!requests || !offsets)
+		die("out of memory");
+	for (i = 0; i < resolver->num_chips; i++) {
+		chip_path = resolver->chip_paths[i];
+		num_lines = get_line_offsets_and_values(resolver, chip_path, offsets, values);
+		gpiod_request_config_set_offsets(req_cfg, num_lines, offsets);
+		gpiod_line_config_set_output_values(line_cfg, num_lines,
+						    offsets, values);
+
+		chip = gpiod_chip_open(resolver->chip_paths[i]);
+		if (!chip)
+			die_perror("unable to open chip %s", chip_path);
+
+		requests[i] = gpiod_chip_request_lines(chip, req_cfg, line_cfg);
+		if (!requests[i])
+			die_perror("unable to request lines on chip %s", chip_path);
+
+		gpiod_chip_close(chip);
+	}
+	gpiod_request_config_free(req_cfg);
+	gpiod_line_config_free(line_cfg);
 
-	request = gpiod_chip_request_lines(chip, req_cfg, line_cfg);
-	if (!request)
-		die_perror("unable to request lines");
+	if (cfg.daemonize)
+		if (daemon(0, 0) < 0)
+			die_perror("unable to daemonize");
+
+	if (cfg.toggles) {
+		for (i = 0; i < cfg.toggles; i++)
+			if ((cfg.hold_period_us > cfg.toggle_periods[i]) &&
+			    ((i != cfg.toggles - 1) || cfg.toggle_periods[i] != 0))
+				cfg.toggle_periods[i] = cfg.hold_period_us;
+		toggle_sequence(cfg.toggles, cfg.toggle_periods, requests, resolver,
+				offsets, values);
+		free(cfg.toggle_periods);
+	}
 
-	if (mode->callback)
-		mode->callback(&cbdata);
+	if (cfg.hold_period_us)
+		usleep(cfg.hold_period_us);
 
-	gpiod_line_request_release(request);
-	gpiod_request_config_free(req_cfg);
-	gpiod_line_config_free(line_cfg);
-	gpiod_chip_close(chip);
+	if (cfg.interactive)
+		interact(requests, resolver, lines, offsets, values);
+
+	if (cfg.daemonize)
+		wait_fd(gpiod_line_request_get_fd(requests[0]));
+
+	for (i = 0; i < resolver->num_chips; i++)
+		gpiod_line_request_release(requests[i]);
+	free(requests);
+	free_line_resolver(resolver);
+	free(lines);
+	free(values);
 	free(offsets);
 
 	return EXIT_SUCCESS;
diff --git a/tools/tools-common.c b/tools/tools-common.c
index f5fd50c..b567226 100644
--- a/tools/tools-common.c
+++ b/tools/tools-common.c
@@ -4,15 +4,18 @@
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
 
@@ -21,6 +24,28 @@ const char *get_progname(void)
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
@@ -57,93 +82,338 @@ void print_version(void)
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
+	if (strcmp(option, "disabled") == 0)
 		return GPIOD_LINE_BIAS_DISABLED;
 	if (strcmp(option, "as-is") != 0)
 		die("invalid bias: %s", option);
 	return 0;
 }
 
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
+	if (m) {
+		if (*end != 's')
+			return -1;
+		end++;
+	} else {
+		m = 1000;
+	}
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
+	return period;
+}
+
+int parse_periods_or_die(char *option, unsigned int **periods)
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
+	for (i = 0; i < num_periods - 1; i++) {
+		for (end = option; *end != ','; end++)
+			;
+		*end = '\0';
+		pp[i] = parse_period_or_die(option);
+		option = end + 1;
+	}
+	pp[i] = parse_period_or_die(option);
+	*periods = pp;
+	return num_periods;
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
+		die("invalid number: %s", option);
+
+	return i;
+}
+
 void print_bias_help(void)
 {
-	printf("Biases:\n");
-	printf("  as-is:\tleave bias unchanged\n");
-	printf("  disable:\tdisable bias\n");
-	printf("  pull-up:\tenable pull-up\n");
-	printf("  pull-down:\tenable pull-down\n");
+	printf("  -b, --bias <bias>\tspecify the line bias.\n");
+	printf("\t\t\tPossible values: 'as-is', 'pull-down', 'pull-up', 'disabled'.\n");
+	printf("\t\t\t(default is 'as-is')\n");
 }
 
-int make_signalfd(void)
+void print_chip_help(void)
 {
-	sigset_t sigmask;
-	int sigfd, rv;
+	printf("\nChips:\n");
+	printf("    A GPIO chip may be identified by number, name, or path.\n");
+	printf("    e.g. '0', 'gpiochip0', and '/dev/gpiochip0' all refer to the same chip.\n");
+}
 
-	sigemptyset(&sigmask);
-	sigaddset(&sigmask, SIGTERM);
-	sigaddset(&sigmask, SIGINT);
+void print_period_help(void)
+{
+	printf("\nPeriods:\n");
+	printf("    Periods are taken as milliseconds unless units are specified. e.g. 10us.\n");
+	printf("    Supported units are 's', 'ms', and 'us'.\n");
+}
+
+#define TIME_BUFFER_SIZE 20
+
+// mode:
+// 0: monotonic time
+// 1: utc time
+// 2: local time
+void print_event_time(uint64_t evtime, int mode)
+{
+	time_t evtsec;
+	struct tm t;
+	char tbuf[TIME_BUFFER_SIZE];
+	char *tz;
+
+	if (mode) {
+		evtsec = evtime / 1000000000;
+		if (mode == 2) {
+			localtime_r(&evtsec, &t);
+			tz = "";
+		} else {
+			gmtime_r(&evtsec, &t);
+			tz = "Z";
+		}
+		strftime(tbuf, TIME_BUFFER_SIZE, "%FT%T", &t);
+		printf("%s.%09"PRIu64"%s", tbuf, evtime % 1000000000, tz);
+	} else {
+		printf("%8"PRIu64".%09"PRIu64,
+		       evtime / 1000000000, evtime % 1000000000);
+	}
+}
 
-	rv = sigprocmask(SIG_BLOCK, &sigmask, NULL);
-	if (rv < 0)
-		die("error masking signals: %s", strerror(errno));
 
-	sigfd = signalfd(-1, &sigmask, 0);
-	if (sigfd < 0)
-		die("error creating signalfd: %s", strerror(errno));
+typedef bool (*is_set_func)(struct gpiod_line_info *);
 
-	return sigfd;
+struct flag {
+	const char *name;
+	is_set_func is_set;
+};
+
+static bool line_bias_is_pullup(struct gpiod_line_info *info)
+{
+	return gpiod_line_info_get_bias(info) == GPIOD_LINE_BIAS_PULL_UP;
 }
 
-int chip_dir_filter(const struct dirent *entry)
+static bool line_bias_is_pulldown(struct gpiod_line_info *info)
 {
-	bool is_chip;
-	char *path;
-	int ret;
+	return gpiod_line_info_get_bias(info) == GPIOD_LINE_BIAS_PULL_DOWN;
+}
 
-	ret = asprintf(&path, "/dev/%s", entry->d_name);
-	if (ret < 0)
-		return 0;
+static bool line_bias_is_disabled(struct gpiod_line_info *info)
+{
+	return gpiod_line_info_get_bias(info) == GPIOD_LINE_BIAS_DISABLED;
+}
 
-	is_chip = gpiod_is_gpiochip_device(path);
-	free(path);
-	return !!is_chip;
+static bool line_drive_is_open_drain(struct gpiod_line_info *info)
+{
+	return gpiod_line_info_get_drive(info) == GPIOD_LINE_DRIVE_OPEN_DRAIN;
 }
 
-struct gpiod_chip *chip_open_by_name(const char *name)
+static bool line_drive_is_open_source(struct gpiod_line_info *info)
 {
-	struct gpiod_chip *chip;
-	char *path;
-	int ret;
+	return gpiod_line_info_get_drive(info) == GPIOD_LINE_DRIVE_OPEN_SOURCE;
+}
 
-	ret = asprintf(&path, "/dev/%s", name);
-	if (ret < 0)
-		return NULL;
+static bool line_edge_detection_is_both(struct gpiod_line_info *info)
+{
+	return gpiod_line_info_get_edge_detection(info) == GPIOD_LINE_BIAS_PULL_UP;
+}
 
-	chip = gpiod_chip_open(path);
-	free(path);
+static bool line_edge_detection_is_rising(struct gpiod_line_info *info)
+{
+	return gpiod_line_info_get_edge_detection(info) == GPIOD_LINE_EDGE_RISING;
+}
 
-	return chip;
+static bool line_edge_detection_is_falling(struct gpiod_line_info *info)
+{
+	return gpiod_line_info_get_edge_detection(info) == GPIOD_LINE_EDGE_FALLING;
 }
 
-static struct gpiod_chip *chip_open_by_number(unsigned int num)
+static bool line_event_clock_realtime(struct gpiod_line_info *info)
+{
+	return gpiod_line_info_get_event_clock(info) == GPIOD_LINE_EVENT_CLOCK_REALTIME;
+}
+
+static const struct flag flags[] = {
+	{
+		.name = "used",
+		.is_set = gpiod_line_info_is_used,
+	},
+	{
+		.name = "open-drain",
+		.is_set = line_drive_is_open_drain,
+	},
+	{
+		.name = "open-source",
+		.is_set = line_drive_is_open_source,
+	},
+	{
+		.name = "pull-up",
+		.is_set = line_bias_is_pullup,
+	},
+	{
+		.name = "pull-down",
+		.is_set = line_bias_is_pulldown,
+	},
+	{
+		.name = "bias-disabled",
+		.is_set = line_bias_is_disabled,
+	},
+	{
+		.name = "both-edges",
+		.is_set = line_edge_detection_is_both,
+	},
+	{
+		.name = "rising-edges",
+		.is_set = line_edge_detection_is_rising,
+	},
+	{
+		.name = "falling-edges",
+		.is_set = line_edge_detection_is_falling,
+	},
+	{
+		.name = "event-clock-realtime",
+		.is_set = line_event_clock_realtime,
+	},
+};
+
+static PRINTF(3, 4) void prinfo(bool *of, unsigned int prlen, const char *fmt, ...)
+{
+	char *buf, *buffmt = NULL;
+	size_t len;
+	va_list va;
+	int rv;
+
+	va_start(va, fmt);
+	rv = vasprintf(&buf, fmt, va);
+	va_end(va);
+	if (rv < 0)
+		die("vasprintf: %s\n", strerror(errno));
+
+	len = strlen(buf) - 1;
+
+	if (len >= prlen || *of) {
+		*of = true;
+		printf("%s", buf);
+	} else {
+		rv = asprintf(&buffmt, "%%%us", prlen);
+		if (rv < 0)
+			die("asprintf: %s\n", strerror(errno));
+
+		printf(buffmt, buf);
+	}
+
+	free(buf);
+	if (fmt)
+		free(buffmt);
+}
+
+void print_line_info(struct gpiod_line_info *info)
+{
+	bool of = false;
+	const char *name, *consumer;
+	size_t i;
+	int direction;
+	unsigned long debounce;
+
+	name = gpiod_line_info_get_name(info);
+	consumer = gpiod_line_info_get_consumer(info);
+	direction = gpiod_line_info_get_direction(info);
+	debounce = gpiod_line_info_get_debounce_period_us(info);
+
+	name ? prinfo(&of, 16, "\t%s", name) : prinfo(&of, 16, "\tunnamed");
+
+	if (!gpiod_line_info_is_used(info))
+		prinfo(&of, 12, "\tunused");
+	else
+		consumer ? prinfo(&of, 12, "\t%s", consumer)
+			 : prinfo(&of, 12, "\tkernel");
+
+	printf("\t[%s", direction == GPIOD_LINE_DIRECTION_INPUT ? "input" : "output");
+
+	if (gpiod_line_info_is_active_low(info))
+		printf(" active-low");
+
+	for (i = 0; i < ARRAY_SIZE(flags); i++) {
+		if (flags[i].is_set(info))
+			printf(" %s", flags[i].name);
+	}
+
+	if (debounce)
+		printf(" debounce_period=%luus", debounce);
+
+	printf("]");
+}
+
+static int chip_dir_filter(const struct dirent *entry)
 {
-	struct gpiod_chip *chip;
 	char *path;
-	int ret;
+	int ret = 0;
+	struct stat sb;
 
-	ret = asprintf(&path, "/dev/gpiochip%u", num);
-	if (!ret)
-		return NULL;
+	if (asprintf(&path, "/dev/%s", entry->d_name) < 0)
+		return 0;
 
-	chip = gpiod_chip_open(path);
+	if ((lstat(path, &sb) == 0) && (!S_ISLNK(sb.st_mode)) && gpiod_is_gpiochip_device(path))
+		ret = 1;
 	free(path);
-
-	return chip;
+	return ret;
 }
 
 static bool isuint(const char *str)
@@ -154,18 +424,270 @@ static bool isuint(const char *str)
 	return *str == '\0';
 }
 
-struct gpiod_chip *chip_open_lookup(const char *device)
+bool chip_path_lookup(const char *id, char **path_ptr)
 {
-	struct gpiod_chip *chip;
+	char *path;
 
-	if (isuint(device)) {
-		chip = chip_open_by_number(strtoul(device, NULL, 10));
+	if (isuint(id)) {
+		// by number
+		if (asprintf(&path, "/dev/gpiochip%s", id) < 0)
+			return false;
+	} else if (strchr(id, '/')) {
+		// by path
+		if (asprintf(&path, "%s", id) < 0)
+			return false;
 	} else {
-		if (strncmp(device, "/dev/", 5))
-			chip = chip_open_by_name(device);
+		// by device name
+		if (asprintf(&path, "/dev/%s", id) < 0)
+			return false;
+	}
+	if (!gpiod_is_gpiochip_device(path)) {
+		free(path);
+		return false;
+	}
+	*path_ptr = path;
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
+	paths = malloc(sizeof(*paths));
+	if (paths == NULL) {
+		free(path);
+		return 0;
+	}
+	paths[0] = path;
+	*paths_ptr = paths;
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
+		goto free_entries;
+
+	for (i = 0; i < num_chips; i++) {
+		if (asprintf(&paths[i], "/dev/%s", entries[i]->d_name) < 0) {
+			for (j = 0; j < i; j++)
+				free(paths[j]);
+			free(paths);
+			return 0;
+		}
+	}
+	*paths_ptr = paths;
+	ret = num_chips;
+free_entries:
+	for (i = 0; i < num_chips; i++)
+		free(entries[i]);
+	free(entries);
+	return ret;
+}
+
+static bool resolve_line(struct gpiod_line_info *info, const char *chip_path,
+			 struct line_resolver *resolver)
+{
+	int i, found_idx = -1;
+	unsigned int offset;
+	struct resolved_line *line;
+	const char *name;
+
+	offset = gpiod_line_info_get_offset(info);
+	for (i = 0; i < resolver->num_lines; i++) {
+		line = &resolver->lines[i];
+		name = gpiod_line_info_get_name(info);
+		if ((!line->id_is_name && (line->offset == (int)offset)) ||
+		    (name && strcmp(line->id, name) == 0)) {
+			if (resolver->strict && line->chip_path)
+				die("line %s is not unique", line->id);
+			if (found_idx != -1)
+				die("lines %s and %s are the same",
+				    resolver->lines[found_idx].id, line->id);
+			found_idx = i;
+			line->chip_path = chip_path;
+			line->offset = offset;
+			resolver->num_found++;
+		}
+	}
+	return (found_idx != -1);
+}
+
+static bool resolve_done(struct line_resolver *resolver)
+{
+	return (!resolver->strict && resolver->num_found >= resolver->num_lines);
+}
+
+
+struct line_resolver *resolve_lines(int num_lines, char **lines, const char *chip_id,
+				    bool strict, bool by_name)
+{
+	char **paths;
+	int num_chips, i, j, offset;
+	size_t resolver_size;
+	struct line_resolver *resolver;
+	struct resolved_line *line;
+	struct gpiod_chip *chip;
+	struct gpiod_chip_info *chip_info;
+	struct gpiod_line_info *line_info;
+	bool chip_used;
+
+	if (chip_id == NULL)
+		by_name = true;
+
+	num_chips = chip_paths(chip_id, &paths);
+	if ((chip_id != NULL)  && (num_chips == 0))
+		die("cannot find a GPIO chip character device corresponding to %s", chip_id);
+
+	resolver_size = sizeof(*resolver) + num_lines * sizeof(*line);
+	resolver = malloc(resolver_size);
+	if (resolver == NULL)
+		die("out of memory");
+
+	memset(resolver, 0, resolver_size);
+
+	resolver->num_lines = num_lines;
+	resolver->strict = strict;
+	for (i = 0; i < num_lines; i++) {
+		line = &resolver->lines[i];
+		line->id = lines[i];
+		line->offset = by_name ? -1 : parse_uint(lines[i]);
+		line->id_is_name = (line->offset == -1);
+	}
+
+	for (i = 0; (i < num_chips) && !resolve_done(resolver); i++) {
+		chip_used = false;
+		chip = gpiod_chip_open(paths[i]);
+		if (!chip) {
+			if ((errno == EACCES) && (chip_id == NULL))
+				goto finalize_path;
+
+			die_perror("unable to open chip %s", paths[i]);
+		}
+
+		chip_info = gpiod_chip_get_info(chip);
+		if (!chip_info)
+			die_perror("unable to get info for %s", paths[i]);
+
+		num_lines = gpiod_chip_info_get_num_lines(chip_info);
+		gpiod_chip_info_free(chip_info);
+		for (offset = 0; (offset < num_lines) && !resolve_done(resolver); offset++) {
+			line_info = gpiod_chip_get_line_info(chip, offset);
+			if (!line_info)
+				die_perror("unable to retrieve the line info from chip %s",
+					   paths[i]);
+
+			if (resolve_line(line_info, paths[i], resolver))
+				chip_used = true;
+
+			gpiod_line_info_free(line_info);
+		}
+		gpiod_chip_close(chip);
+finalize_path:
+		if (chip_used) {
+			resolver->num_chips++;
+		} else {
+			free(paths[i]);
+			paths[i] = NULL;
+		}
+	}
+	for (i = 0 ; i < resolver->num_lines; i++) {
+		if (resolver->lines[i].chip_path)
+			continue;
+		if (chip_id && !resolver->lines[i].id_is_name)
+			print_error("offset %s is out of range on chip %s",
+				    resolver->lines[i].id, chip_id);
 		else
-			chip = gpiod_chip_open(device);
+			print_error("cannot find line %s", resolver->lines[i].id);
+	}
+
+	if (resolver->num_found != resolver->num_lines)
+		exit(EXIT_FAILURE);
+
+	// condense paths to remove freed paths
+	for (i = 0; i < resolver->num_chips; i++) {
+		if (paths[i] == NULL)
+			// note the limit is the uncondensed size
+			for (j = i + 1; j < num_chips; j++) {
+				if (paths[j] != NULL) {
+					paths[i] = paths[j];
+					paths[j] = NULL;
+					break;
+				}
+			}
 	}
+	resolver->chip_paths = paths;
 
-	return chip;
+	return resolver;
+}
+
+void free_line_resolver(struct line_resolver *resolver)
+{
+	int i;
+
+	if (!resolver)
+		return;
+
+	for (i = 0; i < resolver->num_chips; i++)
+		free(resolver->chip_paths[i]);
+	free(resolver->chip_paths);
+	free(resolver);
+}
+
+int get_line_offsets_and_values(struct line_resolver *resolver, const char *chip_path,
+				unsigned int *offsets, int *values)
+{
+	int i, num_lines = 0;
+	struct resolved_line *line;
+
+	for (i = 0; i < resolver->num_lines; i++) {
+		line = &resolver->lines[i];
+		if (line->chip_path == chip_path) {
+			offsets[num_lines] = line->offset;
+			if (values)
+				values[num_lines] = line->value;
+			num_lines++;
+		}
+	}
+	return num_lines;
+}
+
+const char *get_line_name(struct line_resolver *resolver, const char *chip_path,
+			  unsigned int offset)
+{
+	int i;
+
+	for (i = 0; i < resolver->num_lines; i++)
+		if ((resolver->lines[i].offset == (int)offset) &&
+		    (resolver->lines[i].chip_path == chip_path) &&
+		    (resolver->lines[i].id_is_name))
+			return resolver->lines[i].id;
+	return 0;
+}
+
+void set_line_values(struct line_resolver *resolver, const char *chip_path, int *values)
+{
+	int i, j;
+
+	for (i = 0, j = 0; i < resolver->num_lines; i++) {
+		if (resolver->lines[i].chip_path == chip_path) {
+			resolver->lines[i].value = values[j];
+			j++;
+		}
+	}
 }
diff --git a/tools/tools-common.h b/tools/tools-common.h
index f059440..885b1aa 100644
--- a/tools/tools-common.h
+++ b/tools/tools-common.h
@@ -4,7 +4,6 @@
 #ifndef __GPIOD_TOOLS_COMMON_H__
 #define __GPIOD_TOOLS_COMMON_H__
 
-#include <dirent.h>
 #include <gpiod.h>
 
 /*
@@ -21,15 +20,63 @@
 
 #define GETOPT_NULL_LONGOPT	NULL, 0, NULL, 0
 
+struct resolved_line {
+	// from the command line
+	const char *id;
+	// id is a name, not an offset
+	bool id_is_name;
+	// path of chip - if line found
+	const char *chip_path;
+	// if found then offset on chip
+	// if not found then atoi(id) or -1
+	int offset;
+	// place holder for line value in gpioget/set.
+	int value;
+};
+
+// a resolver from requested line names/offsets to lines on the system
+struct line_resolver {
+	// number of chips the lines span, and number of entries is in chip_paths
+	int num_chips;
+	// paths to the relevant chips
+	char **chip_paths;
+	// number of lines in lines
+	int num_lines;
+	// number of lines found
+	int num_found;
+	// perform exhaustive search to check line names are unique
+	bool strict;
+	// descriptors for the requested lines
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
+int parse_periods_or_die(char *option, unsigned int **periods);
+int parse_uint(const char *option);
+unsigned int parse_uint_or_die(const char *option);
 void print_bias_help(void);
-int make_signalfd(void);
-int chip_dir_filter(const struct dirent *entry);
-struct gpiod_chip *chip_open_by_name(const char *name);
-struct gpiod_chip *chip_open_lookup(const char *device);
+void print_chip_help(void);
+void print_period_help(void);
+void print_event_time(uint64_t evtime, int mode);
+void print_line_info(struct gpiod_line_info *info);
+bool chip_path_lookup(const char *id, char **path_ptr);
+int chip_paths(const char *id, char ***paths_ptr);
+int all_chip_paths(char ***paths_ptr);
+struct line_resolver *resolve_lines(int num_lines, char **lines, const char *chip_id,
+				    bool strict, bool by_name);
+void free_line_resolver(struct line_resolver *resolver);
+int get_line_offsets_and_values(struct line_resolver *resolver, const char *chip_path,
+				unsigned int *offsets, int *values);
+const char *get_line_name(struct line_resolver *resolver, const char *chip_path,
+			  unsigned int offset);
+void set_line_values(struct line_resolver *resolver, const char *chip_path, int *values);
 
 #endif /* __GPIOD_TOOLS_COMMON_H__ */
-- 
2.36.1

