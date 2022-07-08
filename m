Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0351756B95B
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Jul 2022 14:09:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237866AbiGHMIK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Jul 2022 08:08:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237952AbiGHMIF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Jul 2022 08:08:05 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DA309B1AE
        for <linux-gpio@vger.kernel.org>; Fri,  8 Jul 2022 05:08:03 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id o31-20020a17090a0a2200b001ef7bd037bbso1596777pjo.0
        for <linux-gpio@vger.kernel.org>; Fri, 08 Jul 2022 05:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jHvL+Rl6mf9+SxPxnqbzy8BynAoA8gp0++OYMzvWWqE=;
        b=bBIgYPG7Iq6m1GR1oPAva1WZOJZLGxKH3ZoEl7cd545NbCtdpcTIKPAjAISsd3T/7g
         FdwWxU8eSKkd3Rca3xCTmFqlNOHbm3A9EIuXk8ybtTXira4/JM46IXU6gwJI9C9mK8XH
         nw2C0mIVpVkPfxCVgfMb/cCrZr2QMmXnILjAGCrbAFMKvmPVruqUzvocyuNJVUh3VU1V
         WJFLp8cxob1c9aLEwh5c2/586Dv+TUN+3n/Q6LaNrPuhdpPZX/1fQ8Uk051EtyiPElfJ
         hh1cojbUKoSYlmCQKbc+VJwTMn8J8ZCdHp8jXm7R1rt29s1EM0crj7fK7kqxVHzr7x1e
         JBQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jHvL+Rl6mf9+SxPxnqbzy8BynAoA8gp0++OYMzvWWqE=;
        b=d0QDIOaTIjeEq6BWYdwC3GpgObl+6EMHvxxJDqiWpUNhVk1tW/dL0iPooaiKrJg7kq
         moqtg9v+J9vtxE5gfP/WxZ/TOS4OPOzUR7JNX2ZwECoUfy6NzYwVHeoXWXW2BPSd56Cg
         nlLkOfNCyFZdwSyegicRCCtfk8WuDkJew5K5vji/ELsmi5I5052RU3+IouzbsmEQry/h
         1hFZiV0JVKZaAp8fKR8b2Cz5+ArveUNFPNQgTjrIbz6yQIrVY31PAsTL6OcGnNVN6Oxd
         6TTwvEPLEOWf8OiI4c9JmbubOwx9QgjEmDyCi737WqI+P/uv7iIJ7/9/uPeFc0CktVY4
         cMsQ==
X-Gm-Message-State: AJIora+mBmluwlCJgi4N4ucjmO1DdncipT/KllpmAnXIXC1BTKBpg4QG
        oI4/jMQwWqCV6UiejqKDB0hG2tKyUFs=
X-Google-Smtp-Source: AGRyM1tygquMXod824X4adK0kIlQycy8Ws00gUdlDWomFjtTU/s1Mz3glr1klpCTBbcTEMLUJio7EA==
X-Received: by 2002:a17:902:e751:b0:16c:19fd:5428 with SMTP id p17-20020a170902e75100b0016c19fd5428mr3475015plf.48.1657282082172;
        Fri, 08 Jul 2022 05:08:02 -0700 (PDT)
Received: from sol.home.arpa (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id s16-20020a170902a51000b0016bfafffa0esm6490312plq.227.2022.07.08.05.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jul 2022 05:08:01 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, brgl@bgdev.pl
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod v2][PATCH v2 4/6] tools: add gpiowatch
Date:   Fri,  8 Jul 2022 20:06:24 +0800
Message-Id: <20220708120626.89844-5-warthog618@gmail.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220708120626.89844-1-warthog618@gmail.com>
References: <20220708120626.89844-1-warthog618@gmail.com>
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
 tools/gpiowatch.c | 231 ++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 236 insertions(+), 2 deletions(-)
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
index b5f5c2d..31b7cc9 100644
--- a/tools/Makefile.am
+++ b/tools/Makefile.am
@@ -9,7 +9,7 @@ libtools_common_la_SOURCES = tools-common.c tools-common.h
 
 LDADD = libtools-common.la $(top_builddir)/lib/libgpiod.la $(LIBEDIT_LIBS)
 
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
index 0000000..43f6a92
--- /dev/null
+++ b/tools/gpiowatch.c
@@ -0,0 +1,231 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2022 Kent Gibson <warthog618@gmail.com>
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
+	int by_name;
+	int event_clock_mode;
+	int banner;
+};
+
+int parse_config(int argc, char **argv, struct config *cfg)
+{
+	int opti, optc;
+	static const char *const shortopts = "+c:shv";
+	const struct option longopts[] = {
+		{ "banner",	no_argument,	&cfg->banner,	1 },
+		{ "by-name",	no_argument,	&cfg->by_name,	1 },
+		{ "chip",	required_argument, NULL,	'c' },
+		{ "help",	no_argument,	NULL,		'h' },
+		{ "localtime",	no_argument,	&cfg->event_clock_mode,	2 },
+		{ "strict",	no_argument,	NULL,		's' },
+		{ "utc",	no_argument,	&cfg->event_clock_mode,	1 },
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
+static void event_print(struct gpiod_info_event *event, struct config *cfg)
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
+
+	if (cfg->event_clock_mode) {
+		/*
+		 * map clock monotonic to realtime,
+		 * as uAPI only supports CLOCK_MONOTONIC
+		 */
+		clock_gettime(CLOCK_REALTIME, &ts);
+		before = ts.tv_nsec + ts.tv_sec * 1000000000;
+
+		clock_gettime(CLOCK_MONOTONIC, &ts);
+		mono = ts.tv_nsec + ts.tv_sec * 1000000000;
+
+		clock_gettime(CLOCK_REALTIME, &ts);
+		after = ts.tv_nsec + ts.tv_sec * 1000000000;
+
+		evtime += (after/2 - mono + before/2);
+	}
+
+	print_event_time(evtime, cfg->event_clock_mode);
+	printf(" %s", evname);
+
+	if (cfg->chip_id)
+		printf(" %s %d", cfg->chip_id,
+		       gpiod_line_info_get_offset(info));
+
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
+	resolver = resolve_lines(argc, argv, cfg.chip_id, cfg.strict,
+				 cfg.by_name);
+	chips = calloc(resolver->num_chips, sizeof(*chips));
+	pollfds = calloc(resolver->num_chips, sizeof(*pollfds));
+	if (!pollfds)
+		die("out of memory");
+
+	for (i = 0; i < resolver->num_chips; i++) {
+		chip = gpiod_chip_open(resolver->chip_paths[i]);
+		if (!chip)
+			die_perror("unable to open chip %s",
+				   resolver->chip_paths[i]);
+
+		for (j = 0; j < resolver->num_lines; j++)
+			if (resolver->lines[j].chip_path ==
+			    resolver->chip_paths[i])
+				if (!gpiod_chip_watch_line_info(chip,
+						resolver->lines[j].offset))
+					die_perror("unable to watch line on chip %s",
+						   resolver->chip_paths[i]);
+
+		chips[i] = chip;
+		pollfds[i].fd = gpiod_chip_get_fd(chip);
+		pollfds[i].events = POLLIN;
+	}
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
+			event = gpiod_chip_read_info_event(chips[i]);
+			event_print(event, &cfg);
+		}
+	}
+
+	for (i = 0; i < resolver->num_chips; i++)
+		gpiod_chip_close(chips[i]);
+
+	free(chips);
+	free_line_resolver(resolver);
+
+	return EXIT_SUCCESS;
+}
-- 
2.37.0

