Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 871F8FE06F
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Nov 2019 15:45:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727626AbfKOOpr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 15 Nov 2019 09:45:47 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:46026 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727427AbfKOOpq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 15 Nov 2019 09:45:46 -0500
Received: by mail-pl1-f195.google.com with SMTP id w7so4792011plz.12
        for <linux-gpio@vger.kernel.org>; Fri, 15 Nov 2019 06:45:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WOr1Q6dXWaibFXJlC1SbG3Y209qZriV1js594rgglWc=;
        b=qVgzTk0c7xk2yv9G9/UuB+NoDgrQ/JdXSZHWSXRBeqg+vefEXmFaCQLaNM3wwpNRB3
         +u0Lq44Zh6dwhI5GSroIBjgyyS0Fs/t4aNiqAdDDAxzDI3zSe8Awe5KUfnskq/YxOnKV
         fO87IQmXCbjhOQkWOU1bVyx6jPalg7adFAZGSpxOZLwGOzKBkj5mOXzhBITcpnfz9yhZ
         QQfElP50R0atcVxxL+mKari351Lg08gy4fnznZX0ai7fN4eeIsXDKyDbOIRqIDHkIsRL
         KQmYM/GUAEolF0nRz0GIsY1eV82883a4rQJHhaepUmnN1WPB6Isca4NIhIJ3WAsvr04f
         4y4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WOr1Q6dXWaibFXJlC1SbG3Y209qZriV1js594rgglWc=;
        b=OHKPHPGQavDJSvCMKTmesCUYt4zuaH9bInyT8cfFEjBqjT4OOpZq0bPShIEQBj6ezr
         E1F1d9RSuJafxQIGOV3AX40Ki1H4d25qHv3QLub6yfGcEGJdb3hP1XcZu9Vab+09AUWB
         KUdmlWtHDnco/nufS72sL+FIC9Bdu8a7pK0PuGk5nl67QJINMZwLBeDQyx+qqFTb8WGY
         miDJXldTGD8xX3Rd+aBGw0gKbywR7fQFTgebe+xko3mSKobdGvUcniz6YnUkizUjAaNS
         3VFYRZsnQRpv1+fuzdeTYrOqXe/1QGAztk1FrfjnbephyAbD5pmTE3al0tRYmThDbD7J
         IEvA==
X-Gm-Message-State: APjAAAWm6HlEeHR6/UrTethiUVWdphmrgIQF+4K/Xfq5oMhtzFV8d/yE
        Mx6ini5NbZolHHhcyygoFM/9KoKCHn4=
X-Google-Smtp-Source: APXvYqx9ovrM2wBRm4LzTuI7SND+bq6MysK69J7l++Gvre5gt7116NLzRQX7C33KT9ZPCdH1jxrE/Q==
X-Received: by 2002:a17:90b:4386:: with SMTP id in6mr20255461pjb.33.1573829145547;
        Fri, 15 Nov 2019 06:45:45 -0800 (PST)
Received: from sol.lan (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id y123sm10517726pfg.64.2019.11.15.06.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2019 06:45:45 -0800 (PST)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod] [PATCH 18/19] tools: add support for bias flags
Date:   Fri, 15 Nov 2019 22:43:54 +0800
Message-Id: <20191115144355.975-19-warthog618@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191115144355.975-1-warthog618@gmail.com>
References: <20191115144355.975-1-warthog618@gmail.com>
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
 tools/gpioget.c | 24 ++++++++++++++++++++----
 tools/gpiomon.c | 28 ++++++++++++++++++++++------
 tools/gpioset.c | 26 +++++++++++++++++++++-----
 3 files changed, 63 insertions(+), 15 deletions(-)

diff --git a/tools/gpioget.c b/tools/gpioget.c
index 196ebeb..025811a 100644
--- a/tools/gpioget.c
+++ b/tools/gpioget.c
@@ -17,10 +17,13 @@ static const struct option longopts[] = {
 	{ "help",	no_argument,	NULL,	'h' },
 	{ "version",	no_argument,	NULL,	'v' },
 	{ "active-low",	no_argument,	NULL,	'l' },
+	{ "pull-down",	no_argument,	NULL,	'D' },
+	{ "pull-up",	no_argument,	NULL,	'U' },
+	{ "bias-disable", no_argument,	NULL,	'B' },
 	{ GETOPT_NULL_LONGOPT },
 };
 
-static const char *const shortopts = "+hvl";
+static const char *const shortopts = "+hvlDUB";
 
 static void print_help(void)
 {
@@ -32,6 +35,9 @@ static void print_help(void)
 	printf("  -h, --help:\t\tdisplay this message and exit\n");
 	printf("  -v, --version:\tdisplay the version and exit\n");
 	printf("  -l, --active-low:\tset the line active state to low\n");
+	printf("  -D, --pull-down:\tenable internal pull-down\n");
+	printf("  -U, --pull-up:\tenable internal pull-up\n");
+	printf("  -B, --bias-disable:\tdisable internal bias\n");
 }
 
 int main(int argc, char **argv)
@@ -39,6 +45,7 @@ int main(int argc, char **argv)
 	unsigned int *offsets, i, num_lines;
 	int *values, optc, opti, rv;
 	bool active_low = false;
+	int flags = 0;
 	char *device, *end;
 
 	for (;;) {
@@ -56,6 +63,15 @@ int main(int argc, char **argv)
 		case 'l':
 			active_low = true;
 			break;
+		case 'D':
+			flags |= GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_DOWN;
+			break;
+		case 'U':
+			flags |= GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_UP;
+			break;
+		case 'B':
+			flags |= GPIOD_LINE_REQUEST_FLAG_BIAS_DISABLE;
+			break;
 		case '?':
 			die("try %s --help", get_progname());
 		default:
@@ -86,9 +102,9 @@ int main(int argc, char **argv)
 			die("invalid GPIO offset: %s", argv[i + 1]);
 	}
 
-	rv = gpiod_ctxless_get_value_multiple(device, offsets, values,
-					      num_lines, active_low,
-					      "gpioget");
+	rv = gpiod_ctxless_get_value_multiple_ext(device, offsets, values,
+						  num_lines, active_low, flags,
+						  "gpioget");
 	if (rv < 0)
 		die_perror("error reading GPIO values");
 
diff --git a/tools/gpiomon.c b/tools/gpiomon.c
index 9a1843b..5779718 100644
--- a/tools/gpiomon.c
+++ b/tools/gpiomon.c
@@ -26,12 +26,15 @@ static const struct option longopts[] = {
 	{ "silent",		no_argument,		NULL,	's' },
 	{ "rising-edge",	no_argument,		NULL,	'r' },
 	{ "falling-edge",	no_argument,		NULL,	'f' },
+	{ "pull-down",		no_argument,		NULL,	'D' },
+	{ "pull-up",		no_argument,		NULL,	'U' },
+	{ "bias-disable",	no_argument,		NULL,	'B' },
 	{ "line-buffered",	no_argument,		NULL,	'b' },
 	{ "format",		required_argument,	NULL,	'F' },
 	{ GETOPT_NULL_LONGOPT },
 };
 
-static const char *const shortopts = "+hvln:srfbF:";
+static const char *const shortopts = "+hvln:srfDUBbF:";
 
 static void print_help(void)
 {
@@ -47,6 +50,9 @@ static void print_help(void)
 	printf("  -s, --silent:\t\tdon't print event info\n");
 	printf("  -r, --rising-edge:\tonly process rising edge events\n");
 	printf("  -f, --falling-edge:\tonly process falling edge events\n");
+	printf("  -D, --pull-down:\tenable internal pull-down\n");
+	printf("  -U, --pull-up:\tenable internal pull-up\n");
+	printf("  -B, --bias-disable:\tdisable internal bias\n");
 	printf("  -b, --line-buffered:\tset standard output as line buffered\n");
 	printf("  -F, --format=FMT\tspecify custom output format\n");
 	printf("\n");
@@ -244,6 +250,7 @@ int main(int argc, char **argv)
 {
 	unsigned int offsets[GPIOD_LINE_BULK_MAX_LINES], num_lines = 0, offset;
 	bool active_low = false, watch_rising = false, watch_falling = false;
+	int flags = 0;
 	struct timespec timeout = { 10, 0 };
 	int optc, opti, rv, i, event_type;
 	struct mon_ctx ctx;
@@ -266,6 +273,15 @@ int main(int argc, char **argv)
 		case 'l':
 			active_low = true;
 			break;
+		case 'D':
+			flags |= GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_DOWN;
+			break;
+		case 'U':
+			flags |= GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_UP;
+			break;
+		case 'B':
+			flags |= GPIOD_LINE_REQUEST_FLAG_BIAS_DISABLE;
+			break;
 		case 'n':
 			ctx.events_wanted = strtoul(optarg, &end, 10);
 			if (*end != '\0')
@@ -320,11 +336,11 @@ int main(int argc, char **argv)
 
 	ctx.sigfd = make_signalfd();
 
-	rv = gpiod_ctxless_event_monitor_multiple(argv[0], event_type,
-						  offsets, num_lines,
-						  active_low, "gpiomon",
-						  &timeout, poll_callback,
-						  event_callback, &ctx);
+	rv = gpiod_ctxless_event_monitor_multiple_ext(
+				argv[0], event_type, offsets,
+				num_lines, active_low, flags, "gpiomon",
+				&timeout, poll_callback,
+				event_callback, &ctx);
 	if (rv)
 		die_perror("error waiting for events");
 
diff --git a/tools/gpioset.c b/tools/gpioset.c
index d9977a7..8855eb0 100644
--- a/tools/gpioset.c
+++ b/tools/gpioset.c
@@ -27,10 +27,13 @@ static const struct option longopts[] = {
 	{ "sec",		required_argument,	NULL,	's' },
 	{ "usec",		required_argument,	NULL,	'u' },
 	{ "background",		no_argument,		NULL,	'b' },
+	{ "pull-down",		no_argument,		NULL,	'D' },
+	{ "pull-up",		no_argument,		NULL,	'U' },
+	{ "bias-disable",	no_argument,		NULL,	'B' },
 	{ GETOPT_NULL_LONGOPT },
 };
 
-static const char *const shortopts = "+hvlm:s:u:b";
+static const char *const shortopts = "+hvlm:s:u:bDUB";
 
 static void print_help(void)
 {
@@ -42,6 +45,9 @@ static void print_help(void)
 	printf("  -h, --help:\t\tdisplay this message and exit\n");
 	printf("  -v, --version:\tdisplay the version and exit\n");
 	printf("  -l, --active-low:\tset the line active state to low\n");
+	printf("  -D, --pull-down:\tenable internal pull-down\n");
+	printf("  -U, --pull-up:\tenable internal pull-up\n");
+	printf("  -B, --bias-disable:\tdisable internal bias\n");
 	printf("  -m, --mode=[exit|wait|time|signal] (defaults to 'exit'):\n");
 	printf("		tell the program what to do after setting values\n");
 	printf("  -s, --sec=SEC:\tspecify the number of seconds to wait (only valid for --mode=time)\n");
@@ -182,7 +188,7 @@ int main(int argc, char **argv)
 {
 	const struct mode_mapping *mode = &modes[MODE_EXIT];
 	unsigned int *offsets, num_lines, i;
-	int *values, rv, optc, opti;
+	int *values, rv, optc, opti, flags = 0;
 	struct callback_data cbdata;
 	bool active_low = false;
 	char *device, *end;
@@ -204,6 +210,15 @@ int main(int argc, char **argv)
 		case 'l':
 			active_low = true;
 			break;
+		case 'D':
+			flags |= GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_DOWN;
+			break;
+		case 'U':
+			flags |= GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_UP;
+			break;
+		case 'B':
+			flags |= GPIOD_LINE_REQUEST_FLAG_BIAS_DISABLE;
+			break;
 		case 'm':
 			mode = parse_mode(optarg);
 			if (!mode)
@@ -268,9 +283,10 @@ int main(int argc, char **argv)
 			die("invalid offset: %s", argv[i + 1]);
 	}
 
-	rv = gpiod_ctxless_set_value_multiple(device, offsets, values,
-					      num_lines, active_low, "gpioset",
-					      mode->callback, &cbdata);
+	rv = gpiod_ctxless_set_value_multiple_ext(
+				device, offsets, values,
+				num_lines, active_low, flags, "gpioset",
+				mode->callback, &cbdata);
 	if (rv < 0)
 		die_perror("error setting the GPIO line values");
 
-- 
2.24.0

