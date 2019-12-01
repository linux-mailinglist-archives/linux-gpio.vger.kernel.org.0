Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D0BBE10E043
	for <lists+linux-gpio@lfdr.de>; Sun,  1 Dec 2019 04:25:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727379AbfLADZW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 30 Nov 2019 22:25:22 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:41918 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727012AbfLADZV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 30 Nov 2019 22:25:21 -0500
Received: by mail-pg1-f196.google.com with SMTP id x8so2755530pgk.8
        for <linux-gpio@vger.kernel.org>; Sat, 30 Nov 2019 19:25:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=j1zGsfK83lwXdHgMhoBI/YJlJOhOKxtVS1n/mixo238=;
        b=oVYLgPAQbdsQtzC5Ss6YHCayLK+1lsdiJeytalzJBPJblfcIeGA2SlSxiG9afl1xMF
         WWjgQoB7ekXJTJirEQRiWc0sg0U7hShVHbONfSTkTSWQY1WvNzhQ56o8msYH2sxQSeAL
         jglLwRbQ+jB8exzYtqNcijvCytRG5rLRUs19SZu3KHEu7/pXD5+NnxFBjWnqkx7dAFBe
         ns2L8T0QUHb5wGcRwBihnH/0ZzSscm0/+4Dhz0SiGidXrIsV1dWuv8b2A5mytjhBtrJD
         +KhJgxjbjwdVuU8203SZhONcGWO6QWZVbdUge5mUeR/na5tdkYwo823oO7ou/ls2ujqJ
         EOiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=j1zGsfK83lwXdHgMhoBI/YJlJOhOKxtVS1n/mixo238=;
        b=cc2o31wSRNobG4tfcGMgEdN58vGcWfU12iLaWSFCF5YEd5n0uQPsKPbmTSEFMVXIqp
         3HvGHEjnrY8eqrdN/qQ9OTYkVWjbM7Qoppne+MrIzDKAS3FuPocIofb9RKqS04zlYkeX
         aTTLRr6vMcaJVickrBKGmCHVwvigEwkekztzTrKW3CRAuQ74hCqmmSb/5qpUwC3yY8l/
         q9tSIIxulI4CIFn6QbwYNtvWXePVaIPJ0MpZueai/+hL0nxaL13IkY7pbtQdkeVXw781
         t9PaYeqSdxjNFx+dKJ0dXB6FZjDE0beXwNWpn1SxleDiaXA1AvLB3hYmVSyTfRk7fnie
         N1hw==
X-Gm-Message-State: APjAAAX728eR26VKOe80ANxTz2ZE9JGWpw5UcPGHrX++aCnE5Xj09CS+
        os4N0S5VO3EKiwP6kpcEzaxVpEm8
X-Google-Smtp-Source: APXvYqz7L1wL0GbvzyY434n6lajEyDi5aN7ARALqcExMGHdATadZ4I+1W4VHUmJoNMED6/N9dSqgFg==
X-Received: by 2002:a63:7d8:: with SMTP id 207mr25068109pgh.154.1575170720852;
        Sat, 30 Nov 2019 19:25:20 -0800 (PST)
Received: from sol.lan (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id z1sm30307655pfk.61.2019.11.30.19.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Nov 2019 19:25:20 -0800 (PST)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH v4 14/20] tools: add support for bias flags
Date:   Sun,  1 Dec 2019 11:24:01 +0800
Message-Id: <20191201032407.23589-15-warthog618@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191201032407.23589-1-warthog618@gmail.com>
References: <20191201032407.23589-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add support for bias flags to applicable tools - gpioget, gpioset, and
gpiomon.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 tools/gpioget.c      | 17 +++++++++++++----
 tools/gpiomon.c      | 21 +++++++++++++++------
 tools/gpioset.c      | 19 ++++++++++++++-----
 tools/tools-common.c | 22 ++++++++++++++++++++++
 tools/tools-common.h |  2 ++
 5 files changed, 66 insertions(+), 15 deletions(-)

diff --git a/tools/gpioget.c b/tools/gpioget.c
index 196ebeb..5b35dcc 100644
--- a/tools/gpioget.c
+++ b/tools/gpioget.c
@@ -17,10 +17,11 @@ static const struct option longopts[] = {
 	{ "help",	no_argument,	NULL,	'h' },
 	{ "version",	no_argument,	NULL,	'v' },
 	{ "active-low",	no_argument,	NULL,	'l' },
+	{ "bias", required_argument,	NULL,	'B' },
 	{ GETOPT_NULL_LONGOPT },
 };
 
-static const char *const shortopts = "+hvl";
+static const char *const shortopts = "+hvlB:";
 
 static void print_help(void)
 {
@@ -32,6 +33,10 @@ static void print_help(void)
 	printf("  -h, --help:\t\tdisplay this message and exit\n");
 	printf("  -v, --version:\tdisplay the version and exit\n");
 	printf("  -l, --active-low:\tset the line active state to low\n");
+	printf("  -B, --bias=[as-is|disable|pull-down|pull-up] (defaults to 'as-is'):\n");
+	printf("		set the line bias\n");
+	printf("\n");
+	print_bias_help();
 }
 
 int main(int argc, char **argv)
@@ -39,6 +44,7 @@ int main(int argc, char **argv)
 	unsigned int *offsets, i, num_lines;
 	int *values, optc, opti, rv;
 	bool active_low = false;
+	int flags = 0;
 	char *device, *end;
 
 	for (;;) {
@@ -56,6 +62,9 @@ int main(int argc, char **argv)
 		case 'l':
 			active_low = true;
 			break;
+		case 'B':
+			flags = bias_flags(optarg);
+			break;
 		case '?':
 			die("try %s --help", get_progname());
 		default:
@@ -86,9 +95,9 @@ int main(int argc, char **argv)
 			die("invalid GPIO offset: %s", argv[i + 1]);
 	}
 
-	rv = gpiod_ctxless_get_value_multiple(device, offsets, values,
-					      num_lines, active_low,
-					      "gpioget");
+	rv = gpiod_ctxless_get_value_multiple_ext(device, offsets, values,
+						  num_lines, active_low,
+						  "gpioget", flags);
 	if (rv < 0)
 		die_perror("error reading GPIO values");
 
diff --git a/tools/gpiomon.c b/tools/gpiomon.c
index 9a1843b..0a61abf 100644
--- a/tools/gpiomon.c
+++ b/tools/gpiomon.c
@@ -22,6 +22,7 @@ static const struct option longopts[] = {
 	{ "help",		no_argument,		NULL,	'h' },
 	{ "version",		no_argument,		NULL,	'v' },
 	{ "active-low",		no_argument,		NULL,	'l' },
+	{ "bias",		required_argument,	NULL,	'B' },
 	{ "num-events",		required_argument,	NULL,	'n' },
 	{ "silent",		no_argument,		NULL,	's' },
 	{ "rising-edge",	no_argument,		NULL,	'r' },
@@ -31,7 +32,7 @@ static const struct option longopts[] = {
 	{ GETOPT_NULL_LONGOPT },
 };
 
-static const char *const shortopts = "+hvln:srfbF:";
+static const char *const shortopts = "+hvlB:n:srfbF:";
 
 static void print_help(void)
 {
@@ -43,6 +44,8 @@ static void print_help(void)
 	printf("  -h, --help:\t\tdisplay this message and exit\n");
 	printf("  -v, --version:\tdisplay the version and exit\n");
 	printf("  -l, --active-low:\tset the line active state to low\n");
+	printf("  -B, --bias=[as-is|disable|pull-down|pull-up] (defaults to 'as-is'):\n");
+	printf("		set the line bias\n");
 	printf("  -n, --num-events=NUM:\texit after processing NUM events\n");
 	printf("  -s, --silent:\t\tdon't print event info\n");
 	printf("  -r, --rising-edge:\tonly process rising edge events\n");
@@ -50,6 +53,8 @@ static void print_help(void)
 	printf("  -b, --line-buffered:\tset standard output as line buffered\n");
 	printf("  -F, --format=FMT\tspecify custom output format\n");
 	printf("\n");
+	print_bias_help();
+	printf("\n");
 	printf("Format specifiers:\n");
 	printf("  %%o:  GPIO line offset\n");
 	printf("  %%e:  event type (0 - falling edge, 1 rising edge)\n");
@@ -244,6 +249,7 @@ int main(int argc, char **argv)
 {
 	unsigned int offsets[GPIOD_LINE_BULK_MAX_LINES], num_lines = 0, offset;
 	bool active_low = false, watch_rising = false, watch_falling = false;
+	int flags = 0;
 	struct timespec timeout = { 10, 0 };
 	int optc, opti, rv, i, event_type;
 	struct mon_ctx ctx;
@@ -266,6 +272,9 @@ int main(int argc, char **argv)
 		case 'l':
 			active_low = true;
 			break;
+		case 'B':
+			flags = bias_flags(optarg);
+			break;
 		case 'n':
 			ctx.events_wanted = strtoul(optarg, &end, 10);
 			if (*end != '\0')
@@ -320,11 +329,11 @@ int main(int argc, char **argv)
 
 	ctx.sigfd = make_signalfd();
 
-	rv = gpiod_ctxless_event_monitor_multiple(argv[0], event_type,
-						  offsets, num_lines,
-						  active_low, "gpiomon",
-						  &timeout, poll_callback,
-						  event_callback, &ctx);
+	rv = gpiod_ctxless_event_monitor_multiple_ext(
+				argv[0], event_type, offsets,
+				num_lines, active_low, "gpiomon",
+				&timeout, poll_callback,
+				event_callback, &ctx, flags);
 	if (rv)
 		die_perror("error waiting for events");
 
diff --git a/tools/gpioset.c b/tools/gpioset.c
index d9977a7..347fb2e 100644
--- a/tools/gpioset.c
+++ b/tools/gpioset.c
@@ -23,6 +23,7 @@ static const struct option longopts[] = {
 	{ "help",		no_argument,		NULL,	'h' },
 	{ "version",		no_argument,		NULL,	'v' },
 	{ "active-low",		no_argument,		NULL,	'l' },
+	{ "bias",		required_argument,	NULL,	'B' },
 	{ "mode",		required_argument,	NULL,	'm' },
 	{ "sec",		required_argument,	NULL,	's' },
 	{ "usec",		required_argument,	NULL,	'u' },
@@ -30,7 +31,7 @@ static const struct option longopts[] = {
 	{ GETOPT_NULL_LONGOPT },
 };
 
-static const char *const shortopts = "+hvlm:s:u:b";
+static const char *const shortopts = "+hvlB:m:s:u:b";
 
 static void print_help(void)
 {
@@ -42,12 +43,16 @@ static void print_help(void)
 	printf("  -h, --help:\t\tdisplay this message and exit\n");
 	printf("  -v, --version:\tdisplay the version and exit\n");
 	printf("  -l, --active-low:\tset the line active state to low\n");
+	printf("  -B, --bias=[as-is|disable|pull-down|pull-up] (defaults to 'as-is'):\n");
+	printf("		set the line bias\n");
 	printf("  -m, --mode=[exit|wait|time|signal] (defaults to 'exit'):\n");
 	printf("		tell the program what to do after setting values\n");
 	printf("  -s, --sec=SEC:\tspecify the number of seconds to wait (only valid for --mode=time)\n");
 	printf("  -u, --usec=USEC:\tspecify the number of microseconds to wait (only valid for --mode=time)\n");
 	printf("  -b, --background:\tafter setting values: detach from the controlling terminal\n");
 	printf("\n");
+	print_bias_help();
+	printf("\n");
 	printf("Modes:\n");
 	printf("  exit:\t\tset values and exit immediately\n");
 	printf("  wait:\t\tset values and wait for user to press ENTER\n");
@@ -182,7 +187,7 @@ int main(int argc, char **argv)
 {
 	const struct mode_mapping *mode = &modes[MODE_EXIT];
 	unsigned int *offsets, num_lines, i;
-	int *values, rv, optc, opti;
+	int *values, rv, optc, opti, flags = 0;
 	struct callback_data cbdata;
 	bool active_low = false;
 	char *device, *end;
@@ -204,6 +209,9 @@ int main(int argc, char **argv)
 		case 'l':
 			active_low = true;
 			break;
+		case 'B':
+			flags |= bias_flags(optarg);
+			break;
 		case 'm':
 			mode = parse_mode(optarg);
 			if (!mode)
@@ -268,9 +276,10 @@ int main(int argc, char **argv)
 			die("invalid offset: %s", argv[i + 1]);
 	}
 
-	rv = gpiod_ctxless_set_value_multiple(device, offsets, values,
-					      num_lines, active_low, "gpioset",
-					      mode->callback, &cbdata);
+	rv = gpiod_ctxless_set_value_multiple_ext(
+				device, offsets, values,
+				num_lines, active_low, "gpioset",
+				mode->callback, &cbdata, flags);
 	if (rv < 0)
 		die_perror("error setting the GPIO line values");
 
diff --git a/tools/tools-common.c b/tools/tools-common.c
index a6e38e5..199f472 100644
--- a/tools/tools-common.c
+++ b/tools/tools-common.c
@@ -57,3 +57,25 @@ void print_version(void)
 	printf("This is free software: you are free to change and redistribute it.\n");
 	printf("There is NO WARRANTY, to the extent permitted by law.\n");
 }
+
+int bias_flags(const char *option)
+{
+	if (strcmp(option, "pull-down") == 0)
+		return GPIOD_CTXLESS_FLAG_BIAS_PULL_DOWN;
+	if (strcmp(option, "pull-up") == 0)
+		return GPIOD_CTXLESS_FLAG_BIAS_PULL_UP;
+	if (strcmp(option, "disable") == 0)
+		return GPIOD_CTXLESS_FLAG_BIAS_DISABLE;
+	if (strcmp(option, "as-is") != 0)
+		die("invalid bias: %s", option);
+	return 0;
+}
+
+void print_bias_help(void)
+{
+	printf("Biases:\n");
+	printf("  as-is:\tleave bias unchanged\n");
+	printf("  disable:\tdisable bias\n");
+	printf("  pull-up:\tenable pull-up\n");
+	printf("  pull-down:\tenable pull-down\n");
+}
diff --git a/tools/tools-common.h b/tools/tools-common.h
index ace3b46..c0d0cf2 100644
--- a/tools/tools-common.h
+++ b/tools/tools-common.h
@@ -25,5 +25,7 @@ const char *get_progname(void);
 void die(const char *fmt, ...) NORETURN PRINTF(1, 2);
 void die_perror(const char *fmt, ...) NORETURN PRINTF(1, 2);
 void print_version(void);
+int bias_flags(const char *option);
+void print_bias_help(void);
 
 #endif /* __GPIOD_TOOLS_COMMON_H__ */
-- 
2.24.0

