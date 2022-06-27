Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A390F55D92D
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Jun 2022 15:21:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236226AbiF0Nqf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 Jun 2022 09:46:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236225AbiF0Nqd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Jun 2022 09:46:33 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D00066271
        for <linux-gpio@vger.kernel.org>; Mon, 27 Jun 2022 06:46:31 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id jb13so8210078plb.9
        for <linux-gpio@vger.kernel.org>; Mon, 27 Jun 2022 06:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IjWlFFPoHjfhByHYSNZryk1TNb+LKXad0m0aRtU8qzA=;
        b=XS4wdj748m1OeV7xTOgfocqrd8yHfjP0+SSJDU4GwjcbboRdLRSQE7oj7A6PZ2QV5m
         YwLL5bnhkVS1q2drmBXBowMpktV0Kex4aFrA3+unBjrXCKLS81noZVFgrOMKpkSz/VTq
         g+IfMK28kAcgeYv1n7xMjIcjgpBKI/hhnS6TtD468g4RKIWEAUDGSzwHs1ELrZLrDhsS
         OZ2d7iywT5a+nu6J9V1u/ecQE3UjvudBDP744lwzHUr3KOI3apO3aEt0EyxXVOuP2Nbc
         qTBAx9YiQZNRd/ttKTlv14lXQQ/vk+Nb73IZz+MnZ5YJuO13sJxMdhOZuZqdGm70aI7c
         zTXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IjWlFFPoHjfhByHYSNZryk1TNb+LKXad0m0aRtU8qzA=;
        b=RVrV2tKC7e0lksLj0+mGBRYi2Fa0+mWHqcKEFcuYu7CdlPw4a+HMCgcTbSy4tN8e8W
         zZ6mICe5ip3FOu/quZkqTwMBPAYcjESaH+7DiAvzx9ULCHOSaSMDm1QpQonl6X3oFDrE
         YEFFvhLh3cOZdb4JwnEGteZw3GZ8mWwGJN4eESoKbm9rYMeTIAR251g4UJieuTMo2nKG
         ykFxNviIeN8Akp2foaawKH802ucWldieFyB2o2NMFkixGUT8UEqYJBtLam28BKm6pUeq
         JuB04aL7vVCrd33SOFaJpERnEGhAb7JJrulSLf/eEaRUELpUktOCYtXE8VeEcdbxg6uf
         u11A==
X-Gm-Message-State: AJIora/lQ3eMhUQh3AQew+pE3sLvqMl2UEp9iCuES9JX52psCF0sEkJE
        eV/2eAFsBPZ/EhnBi93VJgcpAt6F+p0=
X-Google-Smtp-Source: AGRyM1vXEuTNO3AnHeVg+G4zLM8mQSJybDQ02XvEn8PsCJ6N/4M7tKYo+nvcD6X/0PKXh4nEb9FM+A==
X-Received: by 2002:a17:90b:3505:b0:1ec:db5d:794b with SMTP id ls5-20020a17090b350500b001ecdb5d794bmr16387397pjb.24.1656337590798;
        Mon, 27 Jun 2022 06:46:30 -0700 (PDT)
Received: from sol.home.arpa (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id b5-20020a170902bd4500b0016a565f3f34sm6783395plx.168.2022.06.27.06.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 06:46:30 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, brgl@bgdev.pl
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod v2][PATCH 3/4] tools: add gpiowatch
Date:   Mon, 27 Jun 2022 21:44:46 +0800
Message-Id: <20220627134447.81927-4-warthog618@gmail.com>
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

Add a gpiowatch tool, based on gpiomon, but reporting line info change
events similar to the gpio-watch tool in the linux kernel.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 man/Makefile.am   |   2 +-
 tools/.gitignore  |   1 +
 tools/Makefile.am |   4 +-
 tools/gpiowatch.c | 214 ++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 219 insertions(+), 2 deletions(-)
 create mode 100644 tools/gpiowatch.c

diff --git a/man/Makefile.am b/man/Makefile.am
index 4d2c29b..3badd3b 100644
--- a/man/Makefile.am
+++ b/man/Makefile.am
@@ -3,7 +3,7 @@
 
 if WITH_MANPAGES
 
-dist_man1_MANS = gpiodetect.man gpioinfo.man gpioget.man gpioset.man gpiofind.man gpiomon.man
+dist_man1_MANS = gpiodetect.man gpioinfo.man gpioget.man gpioset.man gpiofind.man gpiomon.man gpiowatch.man
 
 %.man: $(top_builddir)/tools/$(*F)
 	help2man $(top_builddir)/tools/$(*F) --include=$(srcdir)/template --output=$(builddir)/$@ --no-info
diff --git a/tools/.gitignore b/tools/.gitignore
index 0d53de9..6175e26 100644
--- a/tools/.gitignore
+++ b/tools/.gitignore
@@ -7,3 +7,4 @@ gpioget
 gpioset
 gpiomon
 gpiofind
+gpiowatch
diff --git a/tools/Makefile.am b/tools/Makefile.am
index 4a13266..8bb2cac 100644
--- a/tools/Makefile.am
+++ b/tools/Makefile.am
@@ -9,7 +9,7 @@ libtools_common_la_SOURCES = tools-common.c tools-common.h
 
 LDADD = libtools-common.la $(top_builddir)/lib/libgpiod.la
 
-bin_PROGRAMS = gpiodetect gpioinfo gpioget gpioset gpiomon gpiofind
+bin_PROGRAMS = gpiodetect gpioinfo gpioget gpioset gpiomon gpiofind gpiowatch
 
 gpiodetect_SOURCES = gpiodetect.c
 
@@ -23,6 +23,8 @@ gpiomon_SOURCES = gpiomon.c
 
 gpiofind_SOURCES = gpiofind.c
 
+gpiowatch_SOURCES = gpiowatch.c
+
 EXTRA_DIST = gpio-tools-test gpio-tools-test.bats
 
 if WITH_TESTS
diff --git a/tools/gpiowatch.c b/tools/gpiowatch.c
new file mode 100644
index 0000000..e6bfeb6
--- /dev/null
+++ b/tools/gpiowatch.c
@@ -0,0 +1,214 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2017-2022 Bartosz Golaszewski <bartekgola@gmail.com>
+
+#include <getopt.h>
+#include <gpiod.h>
+#include <inttypes.h>
+#include <poll.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <time.h>
+
+#include "tools-common.h"
+
+static int by_name;
+static int event_clock_mode;
+static int banner;
+
+static const struct option longopts[] = {
+	{ "banner",		no_argument,		&banner,	1 },
+	{ "by-name",		no_argument,		&by_name,	1 },
+	{ "chip",		required_argument,	NULL,	'c' },
+	{ "help",		no_argument,		NULL,	'h' },
+	{ "localtime",		no_argument,		&event_clock_mode,	2 },
+	{ "strict",		no_argument,		NULL,	's' },
+	{ "utc",		no_argument,		&event_clock_mode,	1 },
+	{ "version",		no_argument,		NULL,	'v' },
+	{ GETOPT_NULL_LONGOPT },
+};
+
+static const char *const shortopts = "+c:shv";
+
+static void print_help(void)
+{
+	printf("Usage: %s [OPTIONS] <line> ...\n", get_progname());
+	printf("\n");
+	printf("Wait for changes to info on GPIO lines and print them to standard output.\n");
+	printf("\n");
+	printf("Lines are specified by name, or optionally by offset if the chip option\n");
+	printf("is provided.\n");
+	printf("\n");
+	printf("Options:\n");
+	printf("      --banner\t\tdisplay a banner on successful startup\n");
+	printf("      --by-name\t\ttreat lines as names even if they would parse as an offset\n");
+	printf("  -c, --chip <chip>\trestrict scope to a particular chip\n");
+	printf("  -h, --help\t\tdisplay this help and exit\n");
+	printf("      --localtime\treport event time as a local time (default is monotonic)\n");
+	printf("  -s, --strict\t\tabort if requested line names are not unique\n");
+	printf("      --utc\t\treport event time as UTC (default is monotonic)\n");
+	printf("  -v, --version\t\toutput version information and exit\n");
+	print_chip_help();
+}
+
+struct config {
+	bool strict;
+	const char *chip_id;
+};
+
+int parse_config(int argc, char **argv, struct config *cfg)
+{
+	int opti, optc;
+
+	memset(cfg, 0, sizeof(*cfg));
+
+	for (;;) {
+		optc = getopt_long(argc, argv, shortopts, longopts, &opti);
+		if (optc < 0)
+			break;
+
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
+
+	return optind;
+}
+
+static void print_banner(int num_lines, char **lines)
+{
+	int i;
+
+	if (num_lines > 1) {
+		printf("Watching lines ");
+		for (i = 0; i < num_lines - 1; i++)
+			printf("%s, ", lines[i]);
+		printf("and %s...\n", lines[i]);
+	} else {
+		printf("Watching line %s ...\n", lines[0]);
+	}
+}
+
+static void event_print(struct gpiod_info_event *event, const char *chip_id)
+{
+	struct gpiod_line_info *info;
+	uint64_t evtime, before, after, mono;
+	char *evname;
+	int evtype;
+	struct timespec ts;
+
+	info = gpiod_info_event_get_line_info(event);
+	evtime = gpiod_info_event_get_timestamp_ns(event);
+	evtype = gpiod_info_event_get_event_type(event);
+
+	switch (evtype) {
+	case GPIOD_INFO_EVENT_LINE_REQUESTED:
+		evname = "REQUESTED";
+		break;
+	case GPIOD_INFO_EVENT_LINE_RELEASED:
+		evname = "RELEASED ";
+		break;
+	case GPIOD_INFO_EVENT_LINE_CONFIG_CHANGED:
+		evname = "RECONFIG ";
+		break;
+	default:
+		evname = "UNKNOWN  ";
+	}
+	if (event_clock_mode) {
+		// map clock monotonic to realtime, as uAPI only supports CLOCK_MONOTONIC
+		clock_gettime(CLOCK_REALTIME, &ts);
+		before = ts.tv_nsec + ts.tv_sec * 1000000000;
+		clock_gettime(CLOCK_MONOTONIC, &ts);
+		mono = ts.tv_nsec + ts.tv_sec * 1000000000;
+		clock_gettime(CLOCK_REALTIME, &ts);
+		after = ts.tv_nsec + ts.tv_sec * 1000000000;
+		evtime += (after/2 - mono + before/2);
+	}
+	print_event_time(evtime, event_clock_mode);
+	printf(" %s", evname);
+	if (chip_id)
+		printf(" %s %d", chip_id, gpiod_line_info_get_offset(info));
+	print_line_info(info);
+	printf("\n");
+}
+
+int main(int argc, char **argv)
+{
+	int i, j;
+	struct gpiod_chip **chips;
+	struct pollfd *pollfds;
+	struct gpiod_chip *chip;
+	struct line_resolver *resolver;
+	struct gpiod_info_event *event;
+	struct config cfg;
+
+	i = parse_config(argc, argv, &cfg);
+	argc -= optind;
+	argv += optind;
+
+	if (argc < 1)
+		die("at least one GPIO line must be specified");
+
+	if (argc > 64)
+		die("too many lines given");
+
+	resolver = resolve_lines(argc, argv, cfg.chip_id, cfg.strict, by_name);
+	chips = calloc(resolver->num_chips, sizeof(*chips));
+	pollfds = calloc(resolver->num_chips, sizeof(*pollfds));
+	if (!pollfds)
+		die("out of memory");
+	for (i = 0; i < resolver->num_chips; i++) {
+		chip = gpiod_chip_open(resolver->chip_paths[i]);
+		if (!chip)
+			die_perror("unable to open chip %s", resolver->chip_paths[i]);
+
+		for (j = 0; j < resolver->num_lines; j++)
+			if (resolver->lines[j].chip_path == resolver->chip_paths[i])
+				if (!gpiod_chip_watch_line_info(chip, resolver->lines[j].offset))
+					die_perror("unable to watch line on chip %s",
+						   resolver->chip_paths[i]);
+
+		chips[i] = chip;
+		pollfds[i].fd = gpiod_chip_get_fd(chip);
+		pollfds[i].events = POLLIN;
+	}
+
+	if (banner)
+		print_banner(argc, argv);
+
+	for (;;) {
+		if (poll(pollfds, resolver->num_chips, -1) < 0)
+			die_perror("error polling for events");
+
+		for (i = 0; i < resolver->num_chips; i++) {
+			if (pollfds[i].revents == 0)
+				continue;
+
+			event = gpiod_chip_read_info_event(chips[i]);
+			event_print(event, cfg.chip_id);
+		}
+	}
+	for (i = 0; i < resolver->num_chips; i++)
+		gpiod_chip_close(chips[i]);
+	free(chips);
+	free_line_resolver(resolver);
+
+	return EXIT_SUCCESS;
+}
-- 
2.36.1

