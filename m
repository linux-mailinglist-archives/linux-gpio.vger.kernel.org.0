Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B921E627521
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Nov 2022 05:01:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235771AbiKNEBw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 13 Nov 2022 23:01:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235714AbiKNEBv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 13 Nov 2022 23:01:51 -0500
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A61B713CD3
        for <linux-gpio@vger.kernel.org>; Sun, 13 Nov 2022 20:01:49 -0800 (PST)
Received: by mail-pf1-x42d.google.com with SMTP id v28so9883469pfi.12
        for <linux-gpio@vger.kernel.org>; Sun, 13 Nov 2022 20:01:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=maEdBsz2kLehmf10cGacNvNHGSNaGfa7oMa5GR8cWD0=;
        b=jAYkByFN1QAzAk8jByBfYnF7b59D39I0OdCQucUsk/5TbR4QlWeAkIIiKv90rV8gEQ
         AsFiUodh6RZbY6Qbx2rAqZSirZ7Am6Ts3b3Tlo8R4pJdBGnwY88ApAN4zHyGxeR+N3S7
         OjJwwv3G7j6YpBWGOpkRJcRZsMEGC/Ln5BODRYuPIICM/GcopppP8iEmCeLA4hVhk/+0
         OzrvzuJDOj8ZzQm9oFjk8bZn4cfBmBj8P2INdeS7yNryxozuKduuYvN6x9C0PdHzmWWp
         HB7E6v0UxC3oliv5y+5Ug4R6vx1DB8LFqKSVqmrOL3QRyQJMKtdATOd9wase2d/BzrHz
         WJ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=maEdBsz2kLehmf10cGacNvNHGSNaGfa7oMa5GR8cWD0=;
        b=02qY2crYnzROx5CBx8kas+Ok2oay3r9VF3/rej/GZlzth1jV4CMVVHYed6qnLeyNnu
         /ppyQea3JlIC7Oxi/NuFNgboV2x24QKsAPibbUX4MUSMv2ybDJUHgfGEjZLPNKNyqufY
         33Go8I4Y1aYSvVEvVQh99SCpEOkhAMmQWoaJ363/IcQ2WtOuQiNnlVte7wYownDXQqam
         0J3d/u4yxirAGkaeeyIynM/dX2l9d7bWzhFMm7PrFVpMZI49HnXed74UBRQmZBcGlQM+
         UpH/LNYSbpvlA8N4316ZFc/oNGVrhQ1LDHQg9y+m7/YcDzHSDUWyUdShIl0WZY7PdYIq
         kMMw==
X-Gm-Message-State: ANoB5pkiW9a4yLa0n8pNNin5rUvnWugw1rD6jNMGHB5CR5TeiAWhJQd7
        4JebWwAr/ysq9STVvgACyEEcc6VvYKE=
X-Google-Smtp-Source: AA0mqf77H0kDVk5Nj2CycFWJ5Xc/c264ucsacuZxURx8YQvKdqgOQSGPQ2BCamjJtj5Rd0ei0KB6yw==
X-Received: by 2002:a63:dd4f:0:b0:464:2135:5f88 with SMTP id g15-20020a63dd4f000000b0046421355f88mr10278340pgj.360.1668398508870;
        Sun, 13 Nov 2022 20:01:48 -0800 (PST)
Received: from sol.home.arpa (14-200-229-209.tpgi.com.au. [14.200.229.209])
        by smtp.gmail.com with ESMTPSA id f11-20020a170902684b00b001801aec1f6bsm6018636pln.141.2022.11.13.20.01.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Nov 2022 20:01:48 -0800 (PST)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, brgl@bgdev.pl
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod v2][PATCH v4 4/5] tools: add gpionotify
Date:   Mon, 14 Nov 2022 12:01:01 +0800
Message-Id: <20221114040102.66031-5-warthog618@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221114040102.66031-1-warthog618@gmail.com>
References: <20221114040102.66031-1-warthog618@gmail.com>
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

Add a gpionotify tool, based on gpiomon, to report line info change
events read from chip file descriptors.

Inspired by the gpio-watch tool in the linux kernel, but with gpiomon
features such as custom formatted output, filtering events of
interest and exiting after a number of events, so more useful for
scripting.

Default output is minimalist, so just time, event type and line id.
Full event details are available using the custom formatted output.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 man/Makefile.am    |   2 +-
 tools/.gitignore   |   1 +
 tools/Makefile.am  |   4 +-
 tools/gpionotify.c | 445 +++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 450 insertions(+), 2 deletions(-)
 create mode 100644 tools/gpionotify.c

diff --git a/man/Makefile.am b/man/Makefile.am
index 8d1d9b3..201a52b 100644
--- a/man/Makefile.am
+++ b/man/Makefile.am
@@ -3,7 +3,7 @@
 
 if WITH_MANPAGES
 
-dist_man1_MANS = gpiodetect.man gpioinfo.man gpioget.man gpioset.man gpiomon.man
+dist_man1_MANS = gpiodetect.man gpioinfo.man gpioget.man gpioset.man gpiomon.man gpionotify.man
 
 %.man: $(top_builddir)/tools/$(*F)
 	help2man $(top_builddir)/tools/$(*F) --include=$(srcdir)/template --output=$(builddir)/$@ --no-info
diff --git a/tools/.gitignore b/tools/.gitignore
index d6b2f44..dfdbc0d 100644
--- a/tools/.gitignore
+++ b/tools/.gitignore
@@ -6,3 +6,4 @@ gpioinfo
 gpioget
 gpioset
 gpiomon
+gpionotify
diff --git a/tools/Makefile.am b/tools/Makefile.am
index 3fafec6..b6e8f34 100644
--- a/tools/Makefile.am
+++ b/tools/Makefile.am
@@ -15,7 +15,7 @@ libtools_common_la_SOURCES = tools-common.c tools-common.h
 
 LDADD = libtools-common.la $(top_builddir)/lib/libgpiod.la $(LIBEDIT_LIBS)
 
-bin_PROGRAMS = gpiodetect gpioinfo gpioget gpioset gpiomon
+bin_PROGRAMS = gpiodetect gpioinfo gpioget gpioset gpiomon gpionotify
 
 gpiodetect_SOURCES = gpiodetect.c
 
@@ -27,6 +27,8 @@ gpioset_SOURCES = gpioset.c
 
 gpiomon_SOURCES = gpiomon.c
 
+gpionotify_SOURCES = gpionotify.c
+
 EXTRA_DIST = gpio-tools-test gpio-tools-test.bats
 
 if WITH_TESTS
diff --git a/tools/gpionotify.c b/tools/gpionotify.c
new file mode 100644
index 0000000..dfa0538
--- /dev/null
+++ b/tools/gpionotify.c
@@ -0,0 +1,445 @@
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
+	printf("Usage: %s [OPTIONS] <line>...\n", get_progname());
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
+	printf("  -e, --event <event>\tspecify the events to monitor\n");
+	printf("\t\t\tPossible values: 'requested', 'released', 'reconfigured'.\n");
+	printf("\t\t\t(default is all events)\n");
+	printf("  -h, --help\t\tdisplay this help and exit\n");
+	printf("  -F, --format <fmt>\tspecify a custom output format\n");
+	printf("      --localtime\tconvert event timestamps to local time\n");
+	printf("  -n, --num-events <num>\n");
+	printf("\t\t\texit after processing num events\n");
+	printf("  -q, --quiet\t\tdon't generate any output\n");
+	printf("  -s, --strict\t\tabort if requested line names are not unique\n");
+	printf("      --unquoted\tdon't quote line or consumer names\n");
+	printf("      --utc\t\tconvert event timestamps to UTC\n");
+	printf("  -v, --version\t\toutput version information and exit\n");
+	print_chip_help();
+	printf("\n");
+	printf("Format specifiers:\n");
+	printf("  %%o   GPIO line offset\n");
+	printf("  %%l   GPIO line name\n");
+	printf("  %%c   GPIO chip name\n");
+	printf("  %%e   numeric info event type ('1' - requested, '2' - released or '3' - reconfigured)\n");
+	printf("  %%E   info event type ('requested', 'released' or 'reconfigured')\n");
+	printf("  %%a   line attributes\n");
+	printf("  %%C   consumer\n");
+	printf("  %%S   event timestamp as seconds\n");
+	printf("  %%U   event timestamp as UTC\n");
+	printf("  %%L   event timestamp as local time\n");
+}
+
+static int parse_event_type_or_die(const char *option)
+{
+	if (strcmp(option, "requested") == 0)
+		return GPIOD_INFO_EVENT_LINE_REQUESTED;
+	if (strcmp(option, "released") == 0)
+		return GPIOD_INFO_EVENT_LINE_RELEASED;
+	if (strcmp(option, "reconfigured") != 0)
+		die("invalid edge: %s", option);
+	return GPIOD_INFO_EVENT_LINE_CONFIG_CHANGED;
+}
+
+struct config {
+	bool banner;
+	bool by_name;
+	bool quiet;
+	bool strict;
+	bool unquoted;
+	int event_type;
+	int events_wanted;
+	const char *chip_id;
+	const char *fmt;
+	int timestamp_fmt;
+};
+
+static int parse_config(int argc, char **argv, struct config *cfg)
+{
+	int opti, optc;
+	const char *const shortopts = "+c:e:hF:n:qshv";
+	const struct option longopts[] = {
+		{ "banner",	no_argument,	NULL,		'-'},
+		{ "by-name",	no_argument,	NULL,		'B'},
+		{ "chip",	required_argument, NULL,	'c' },
+		{ "event",	required_argument, NULL,	'e' },
+		{ "format",	required_argument, NULL,	'F' },
+		{ "help",	no_argument,	NULL,		'h' },
+		{ "localtime",	no_argument,	&cfg->timestamp_fmt, 2 },
+		{ "num-events",	required_argument, NULL,	'n' },
+		{ "quiet",	no_argument,	NULL,		'q' },
+		{ "silent",	no_argument,	NULL,		'q' },
+		{ "strict",	no_argument,	NULL,		's' },
+		{ "unquoted",	no_argument,	NULL,		'Q' },
+		{ "utc",	no_argument,	&cfg->timestamp_fmt, 1 },
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
+		case '-':
+			cfg->banner = true;
+			break;
+		case 'B':
+			cfg->by_name = true;
+			break;
+		case 'c':
+			cfg->chip_id = optarg;
+			break;
+		case 'e':
+			cfg->event_type = parse_event_type_or_die(optarg);
+			break;
+		case 'F':
+			cfg->fmt = optarg;
+			break;
+		case 'n':
+			cfg->events_wanted = parse_uint_or_die(optarg);
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
+	return optind;
+}
+
+static void print_banner(int num_lines, char **lines)
+{
+	int i;
+
+	if (num_lines > 1) {
+		printf("Watching lines ");
+
+		for (i = 0; i < num_lines - 1; i++)
+			printf("'%s', ", lines[i]);
+
+		printf("and '%s'...\n", lines[i]);
+	} else {
+		printf("Watching line '%s'...\n", lines[0]);
+	}
+}
+
+static void print_event_type(int evtype)
+{
+	switch (evtype) {
+	case GPIOD_INFO_EVENT_LINE_REQUESTED:
+		fputs("requested", stdout);
+		break;
+	case GPIOD_INFO_EVENT_LINE_RELEASED:
+		fputs("released", stdout);
+		break;
+	case GPIOD_INFO_EVENT_LINE_CONFIG_CHANGED:
+		fputs("reconfigured", stdout);
+		break;
+	default:
+		fputs("unknown", stdout);
+		break;
+	}
+}
+
+/*
+ * A convenience function to map clock monotonic to realtime, as uAPI only
+ * supports CLOCK_MONOTONIC.
+ *
+ * Samples the realtime clock on either side of a monotonic sample and averages
+ * the realtime samples to estimate the offset between the two clocks.
+ * Any time shifts between the two realtime samples will result in the
+ * monotonic time being mapped to the average of the before and after, so
+ * half way between the old and new times.
+ *
+ * Any CPU suspension between the event being generated and converted will
+ * result in the returned time being shifted by the period of suspension.
+ */
+static uint64_t monotonic_to_realtime(uint64_t evtime)
+{
+	struct timespec ts;
+	uint64_t before, after, mono;
+
+	clock_gettime(CLOCK_REALTIME, &ts);
+	before = ts.tv_nsec + ((uint64_t)ts.tv_sec) * 1000000000;
+
+	clock_gettime(CLOCK_MONOTONIC, &ts);
+	mono = ts.tv_nsec + ((uint64_t)ts.tv_sec) * 1000000000;
+
+	clock_gettime(CLOCK_REALTIME, &ts);
+	after = ts.tv_nsec + ((uint64_t)ts.tv_sec) * 1000000000;
+
+	evtime += (after/2 - mono + before/2);
+	return evtime;
+}
+
+static void event_print_formatted(struct gpiod_info_event *event,
+			struct line_resolver *resolver, int chip_num,
+			struct config *cfg)
+{
+	struct gpiod_line_info *info;
+	const char *lname, *prev, *curr, *consumer;
+	char  fmt;
+	uint64_t evtime;
+	int evtype;
+	unsigned int offset;
+
+	info = gpiod_info_event_get_line_info(event);
+	evtime = gpiod_info_event_get_timestamp_ns(event);
+	evtype = gpiod_info_event_get_event_type(event);
+	offset = gpiod_line_info_get_offset(info);
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
+		case 'a':
+			print_line_attributes(info, cfg->unquoted);
+			break;
+		case 'c':
+			fputs(get_chip_name(resolver, chip_num), stdout);
+			break;
+		case 'C':
+			if (!gpiod_line_info_is_used(info)) {
+				consumer = "unused";
+			} else {
+				consumer = gpiod_line_info_get_consumer(info);
+				if (!consumer)
+					consumer = "kernel";
+			}
+			fputs(consumer, stdout);
+			break;
+		case 'e':
+			printf("%d", evtype);
+			break;
+		case 'E':
+			print_event_type(evtype);
+			break;
+		case 'l':
+			lname = gpiod_line_info_get_name(info);
+			if (!lname)
+				lname = "unnamed";
+			fputs(lname, stdout);
+			break;
+		case 'L':
+			print_event_time(monotonic_to_realtime(evtime), 2);
+			break;
+		case 'o':
+			printf("%u", offset);
+			break;
+		case 'S':
+			print_event_time(evtime, 0);
+			break;
+		case 'U':
+			print_event_time(monotonic_to_realtime(evtime), 1);
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
+static void event_print_human_readable(struct gpiod_info_event *event,
+			struct line_resolver *resolver, int chip_num,
+			struct config *cfg)
+{
+	struct gpiod_line_info *info;
+	uint64_t evtime;
+	int evtype;
+	unsigned int offset;
+	char *evname;
+
+	info = gpiod_info_event_get_line_info(event);
+	evtime = gpiod_info_event_get_timestamp_ns(event);
+	evtype = gpiod_info_event_get_event_type(event);
+	offset = gpiod_line_info_get_offset(info);
+
+	switch (evtype) {
+	case GPIOD_INFO_EVENT_LINE_REQUESTED:
+		evname = "requested";
+		break;
+	case GPIOD_INFO_EVENT_LINE_RELEASED:
+		evname = "released";
+		break;
+	case GPIOD_INFO_EVENT_LINE_CONFIG_CHANGED:
+		evname = "reconfigured";
+		break;
+	default:
+		evname = "unknown";
+	}
+
+	if (cfg->timestamp_fmt)
+		evtime = monotonic_to_realtime(evtime);
+
+	print_event_time(evtime, cfg->timestamp_fmt);
+	printf("\t%s\t", evname);
+	print_line_id(resolver, chip_num, offset, cfg->chip_id, cfg->unquoted);
+	fputc('\n', stdout);
+}
+
+static void event_print(struct gpiod_info_event *event,
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
+	int i, j, events_done = 0, evtype;
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
+	validate_resolution(resolver, cfg.chip_id);
+	chips = calloc(resolver->num_chips, sizeof(*chips));
+	pollfds = calloc(resolver->num_chips, sizeof(*pollfds));
+	if (!pollfds)
+		die("out of memory");
+
+	for (i = 0; i < resolver->num_chips; i++) {
+		chip = gpiod_chip_open(resolver->chips[i].path);
+		if (!chip)
+			die_perror("unable to open chip '%s'",
+				   resolver->chips[i].path);
+
+		for (j = 0; j < resolver->num_lines; j++)
+			if ((resolver->lines[j].chip_num == i) &&
+			    !gpiod_chip_watch_line_info(
+					chip, resolver->lines[j].offset))
+				die_perror("unable to watch line on chip '%s'",
+					   resolver->chips[i].path);
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
+			if (!event)
+				die_perror("unable to retrieve chip event");
+
+			if (cfg.event_type) {
+				evtype = gpiod_info_event_get_event_type(event);
+				if (evtype != cfg.event_type)
+					continue;
+			}
+
+			event_print(event, resolver, i, &cfg);
+
+			events_done++;
+
+			if (cfg.events_wanted &&
+			    events_done >= cfg.events_wanted)
+				goto done;
+		}
+	}
+done:
+	for (i = 0; i < resolver->num_chips; i++)
+		gpiod_chip_close(chips[i]);
+
+	free(chips);
+	free_line_resolver(resolver);
+
+	return EXIT_SUCCESS;
+}
-- 
2.38.1

