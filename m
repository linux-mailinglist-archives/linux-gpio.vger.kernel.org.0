Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4E0072B519
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Jun 2023 03:31:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229573AbjFLBbU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 11 Jun 2023 21:31:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229477AbjFLBbT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 11 Jun 2023 21:31:19 -0400
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com [IPv6:2607:f8b0:4864:20::72f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49899C7
        for <linux-gpio@vger.kernel.org>; Sun, 11 Jun 2023 18:31:18 -0700 (PDT)
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-75da00a1eddso386545285a.3
        for <linux-gpio@vger.kernel.org>; Sun, 11 Jun 2023 18:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686533477; x=1689125477;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fDQw9Gzts5j4jOfDLvvaeNjkBd4HCeNiynejm4v91Es=;
        b=biFuuarR+HvNe12X2cc7Me5OSzsEqgcZDF3lmhDcCtOhspQQGE1siKLNZqhsERc773
         6pELjHjE4W9EgOESOJQzZCQ/36qm9mX9KP09Ozn6t9+7aj0kLTaetAM6Qf+0XCuJuXpL
         Ku0F6zABJlL63a8MmTAzeewnrBiqhQF2a7A5IPUXTtshmAHkkSbZT49rzJtqWivPZqZd
         w/FD8/7nTmjHVdVSKqMc7dAobS4YCljbVff4IYc499jYEwpl9HhP/2maO/njIm6/kCB+
         HA2mQi28LL79g3+N9RLk6BYYY1gDaQGmMqrvRPgN9cZ/LqqTzbE5eTpdRP9A44Qn6Fao
         rWNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686533477; x=1689125477;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fDQw9Gzts5j4jOfDLvvaeNjkBd4HCeNiynejm4v91Es=;
        b=UOv1bfdvGXfYH++XEopMpyDz+edavGYhYr/VblrPgmqJq8rtYBQmecL6BsItqoDgp0
         FG2jMft7wO9WTXOaHMjPYwJW+zn56TrlUbBXvVQTdhnOpUtZkn1EqE4DuuLDMHL+oOZE
         ZFvKxyQpOIYfNm8CbyBe1/nuoJLd81f0ao4v62nnKU5u0pUdrnf82AjeYQESuPgzk5yB
         F+QdAxIndPjfTwiZHq2W0dVWxuwagVyPN0+oE6MEmBEGf2rSA0IwAr71xtmjBojYO6Jd
         uJseKoTslIik46DmNwuioQjKN6/bOe1QzGKCQgEs7IssNzj6m90AyxY0Qqullt8eG6YX
         aTIA==
X-Gm-Message-State: AC+VfDwSmycdFVBLI/C8W5X9YTZKQFT9qPPLY1/1vTmyQyL4DLThMIUW
        p7I8k6pMHOjVvPr68d9hn1lVWkPl6RkU+Q==
X-Google-Smtp-Source: ACHHUZ5lxWiHQHQ9e+A0psX1DAbyxXQDBfT0X3EBtG5k8U89t+KGsikV6eydvXWfKUog/cli68xLng==
X-Received: by 2002:a05:620a:4899:b0:760:7913:e5d8 with SMTP id ea25-20020a05620a489900b007607913e5d8mr2443678qkb.78.1686533477101;
        Sun, 11 Jun 2023 18:31:17 -0700 (PDT)
Received: from localhost.localdomain ([138.229.23.230])
        by smtp.gmail.com with ESMTPSA id r29-20020a05620a03dd00b0075eba686017sm2531225qkm.94.2023.06.11.18.31.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jun 2023 18:31:16 -0700 (PDT)
From:   Gabriel Matni <gabriel.matni@gmail.com>
To:     linux-gpio@vger.kernel.org
Cc:     warthog618@gmail.com, brgl@bgdev.pl, gabriel.matni@gmail.com,
        gabriel.matni@exfo.com
Subject: [libgpiod][PATCH V4 1/1] tools: gpiomon/gpionotify: add idle-timeout option
Date:   Sun, 11 Jun 2023 21:30:49 -0400
Message-Id: <20230612013049.10708-1-gabriel.matni@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Gabriel Matni <gabriel.matni@exfo.com>

Add an idle timeout option to gpiomon and gpionotify to exit gracefully 
when no event has been detected for a given period.

Signed-off-by: Gabriel Matni <gabriel.matni@exfo.com>
---
V3 -> V4: Submitting patch with git send-email 

V2 -> V3: Addressed the following review comments:
- Simplify the commit message
- Clarify the help description of the --idle-timeout option
- Declare ret variable at the top of function for gpionotify, not required for gpiomon

V1 -> V2: Addressed the following review comments:
- Renamed timeout option to idle-timeout
- Timeout value is now signed
- Reused print_period_help() for idle-timeout option
- Added the idle-timeout option to gpionotify for consistency

 tools/gpiomon.c    | 14 +++++++++++++-
 tools/gpionotify.c | 17 +++++++++++++++--
 2 files changed, 28 insertions(+), 3 deletions(-)

diff --git a/tools/gpiomon.c b/tools/gpiomon.c
index c2684c2..e3abb2d 100644
--- a/tools/gpiomon.c
+++ b/tools/gpiomon.c
@@ -30,6 +30,7 @@ struct config {
 	const char *fmt;
 	enum gpiod_line_clock event_clock;
 	int timestamp_fmt;
+	int timeout;
 };
 
 static void print_help(void)
@@ -57,6 +58,8 @@ static void print_help(void)
 	printf("\t\t\tBy default 'realtime' is formatted as UTC, others as raw u64.\n");
 	printf("  -h, --help\t\tdisplay this help and exit\n");
 	printf("  -F, --format <fmt>\tspecify a custom output format\n");
+	printf("      --idle-timeout <period>\n");
+	printf("\t\t\texit gracefully if no events occur for the period specified\n");
 	printf("  -l, --active-low\ttreat the line as active low, flipping the sense of\n");
 	printf("\t\t\trising and falling edges\n");
 	printf("      --localtime\tformat event timestamps as local time\n");
@@ -123,6 +126,7 @@ static int parse_config(int argc, char **argv, struct config *cfg)
 		{ "event-clock", required_argument, NULL,	'E' },
 		{ "format",	required_argument, NULL,	'F' },
 		{ "help",	no_argument,	NULL,		'h' },
+		{ "idle-timeout",	required_argument,	NULL,		'i' },
 		{ "localtime",	no_argument,	&cfg->timestamp_fmt,	2 },
 		{ "num-events",	required_argument, NULL,	'n' },
 		{ "quiet",	no_argument,	NULL,		'q' },
@@ -139,6 +143,7 @@ static int parse_config(int argc, char **argv, struct config *cfg)
 	memset(cfg, 0, sizeof(*cfg));
 	cfg->edges = GPIOD_LINE_EDGE_BOTH;
 	cfg->consumer = "gpiomon";
+	cfg->timeout = -1;
 
 	for (;;) {
 		optc = getopt_long(argc, argv, shortopts, longopts, &opti);
@@ -170,6 +175,9 @@ static int parse_config(int argc, char **argv, struct config *cfg)
 		case 'F':
 			cfg->fmt = optarg;
 			break;
+		case 'i':
+			cfg->timeout = parse_period_or_die(optarg) / 1000;
+			break;
 		case 'l':
 			cfg->active_low = true;
 			break;
@@ -445,9 +453,13 @@ int main(int argc, char **argv)
 	for (;;) {
 		fflush(stdout);
 
-		if (poll(pollfds, resolver->num_chips, -1) < 0)
+		ret = poll(pollfds, resolver->num_chips, cfg.timeout);
+		if (ret < 0)
 			die_perror("error polling for events");
 
+		if (ret == 0)
+			goto done;
+
 		for (i = 0; i < resolver->num_chips; i++) {
 			if (pollfds[i].revents == 0)
 				continue;
diff --git a/tools/gpionotify.c b/tools/gpionotify.c
index 990ca04..2c56590 100644
--- a/tools/gpionotify.c
+++ b/tools/gpionotify.c
@@ -23,6 +23,7 @@ struct config {
 	const char *chip_id;
 	const char *fmt;
 	int timestamp_fmt;
+	int timeout;
 };
 
 static void print_help(void)
@@ -43,6 +44,8 @@ static void print_help(void)
 	printf("\t\t\t(default is all events)\n");
 	printf("  -h, --help\t\tdisplay this help and exit\n");
 	printf("  -F, --format <fmt>\tspecify a custom output format\n");
+	printf("      --idle-timeout <period>\n");
+	printf("\t\t\texit gracefully if no events occur for the period specified\n");
 	printf("      --localtime\tconvert event timestamps to local time\n");
 	printf("  -n, --num-events <num>\n");
 	printf("\t\t\texit after processing num events\n");
@@ -52,6 +55,7 @@ static void print_help(void)
 	printf("      --utc\t\tconvert event timestamps to UTC\n");
 	printf("  -v, --version\t\toutput version information and exit\n");
 	print_chip_help();
+	print_period_help();
 	printf("\n");
 	printf("Format specifiers:\n");
 	printf("  %%o   GPIO line offset\n");
@@ -89,6 +93,7 @@ static int parse_config(int argc, char **argv, struct config *cfg)
 		{ "event",	required_argument, NULL,	'e' },
 		{ "format",	required_argument, NULL,	'F' },
 		{ "help",	no_argument,	NULL,		'h' },
+		{ "idle-timeout",	required_argument,	NULL,		'i' },
 		{ "localtime",	no_argument,	&cfg->timestamp_fmt, 2 },
 		{ "num-events",	required_argument, NULL,	'n' },
 		{ "quiet",	no_argument,	NULL,		'q' },
@@ -103,6 +108,7 @@ static int parse_config(int argc, char **argv, struct config *cfg)
 	int opti, optc;
 
 	memset(cfg, 0, sizeof(*cfg));
+	cfg->timeout = -1;
 
 	for (;;) {
 		optc = getopt_long(argc, argv, shortopts, longopts, &opti);
@@ -125,6 +131,9 @@ static int parse_config(int argc, char **argv, struct config *cfg)
 		case 'F':
 			cfg->fmt = optarg;
 			break;
+		case 'i':
+			cfg->timeout = parse_period_or_die(optarg) / 1000;
+			break;
 		case 'n':
 			cfg->events_wanted = parse_uint_or_die(optarg);
 			break;
@@ -362,7 +371,7 @@ static void event_print(struct gpiod_info_event *event,
 
 int main(int argc, char **argv)
 {
-	int i, j, events_done = 0, evtype;
+	int i, j, ret, events_done = 0, evtype;
 	struct line_resolver *resolver;
 	struct gpiod_info_event *event;
 	struct gpiod_chip **chips;
@@ -413,9 +422,13 @@ int main(int argc, char **argv)
 	for (;;) {
 		fflush(stdout);
 
-		if (poll(pollfds, resolver->num_chips, -1) < 0)
+		ret = poll(pollfds, resolver->num_chips, cfg.timeout);
+		if (ret < 0)
 			die_perror("error polling for events");
 
+		if (ret == 0)
+			goto done;
+
 		for (i = 0; i < resolver->num_chips; i++) {
 			if (pollfds[i].revents == 0)
 				continue;

base-commit: 9788bdd3d6791205431e65366dcc518446f7ca6a
-- 
2.25.1

