Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E326D109011
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Nov 2019 15:33:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728160AbfKYOdO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 Nov 2019 09:33:14 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:33901 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728026AbfKYOdN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 Nov 2019 09:33:13 -0500
Received: by mail-pf1-f196.google.com with SMTP id n13so7480656pff.1
        for <linux-gpio@vger.kernel.org>; Mon, 25 Nov 2019 06:33:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KZG+sko3Mu2G5Y3MZdfnnns/llFcRSW4rXp5yXhdtko=;
        b=rVcv8PQl9WJTm8QsFwf3WvKknTeJU360F4SPZSVP8AyTZIolGtfAd6sEWHbsGI1+zp
         sDurXsi2if8hlKazKEhHkLUNqom11c5UanEqpnSgS/KFmdoIoyGj0+spZfqVlMr/9ywt
         zZGn8l+FjmgZYeSrZarCIzey2nX0CIdP/rzBcmnxN3KVwNTk90FsN6D2iy+HNa2uq1f3
         zqRmfcDStah4FZFJ4YUL/uI1bWmd4/Wl0K/0A7QwD6G+MG65GY5qA/bvkCmrKBAdJcLN
         +ydSZ/5+ZdQdv6b4FNSP4ovYZtR38qfaJRYWGFehyTU1quzcoMiTDLS43XMOscihxhNH
         GzVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KZG+sko3Mu2G5Y3MZdfnnns/llFcRSW4rXp5yXhdtko=;
        b=lu3oKvewd07w+9Vd+Op/yZ5sKKgXcl30e+Qt88fIF/p6W+zuBpvSaekgamgNU9h8Oq
         h7vJ0ILMvVYKvUX9wS61qqiAF8EXFI3OXYo9wqVc8CH4R4l1AFyCQX724Gi3iewyv/DD
         lv8/oYPqjbzT0e86oYiisruxunDu5tspXYTN+HA7sqsiZBQdPzKRnK7i3YBEjZVhJ9qy
         Q4iSgSI0/QHMmaQxm8OKXJ2cNz+c/OYE3am7nlCNYRg6pqnz76jBJoGBV3310IhvecXP
         NCmZkVbry4XlTh3up+fx7XBMxcdagCQ4VXkVrYb3Ohb0CYR1rh0q/0A5QFYn13MF4hrj
         KixQ==
X-Gm-Message-State: APjAAAVLsO4h2IC31Zt0Vg8PoBdopR2LpIR6sKHAUxCrkgmTcSDh/l31
        IP9HCEFcanGxyIloHCzaNKkSnHAXR26H4g==
X-Google-Smtp-Source: APXvYqw8zZZRWV08BAVY2FvBdvjRyOLbe8hioKhTP2gygtoooqGjCBtMV7cEEZpyCLZcvt8Sl8ayOg==
X-Received: by 2002:a63:c80e:: with SMTP id z14mr31770550pgg.240.1574692392153;
        Mon, 25 Nov 2019 06:33:12 -0800 (PST)
Received: from sol.lan (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id i5sm8642100pfo.52.2019.11.25.06.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2019 06:33:11 -0800 (PST)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH v3 13/14] tools: add support for bias flags
Date:   Mon, 25 Nov 2019 22:31:56 +0800
Message-Id: <20191125143157.26154-14-warthog618@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191125143157.26154-1-warthog618@gmail.com>
References: <20191125143157.26154-1-warthog618@gmail.com>
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
 tools/gpioget.c | 32 +++++++++++++++++++++++++----
 tools/gpiomon.c | 36 +++++++++++++++++++++++++++------
 tools/gpioset.c | 54 ++++++++++++++++++++++++++++++++++++++++++++-----
 3 files changed, 107 insertions(+), 15 deletions(-)

diff --git a/tools/gpioget.c b/tools/gpioget.c
index 196ebeb..17614cb 100644
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
@@ -32,6 +33,25 @@ static void print_help(void)
 	printf("  -h, --help:\t\tdisplay this message and exit\n");
 	printf("  -v, --version:\tdisplay the version and exit\n");
 	printf("  -l, --active-low:\tset the line active state to low\n");
+	printf("  -B, --bias=[as-is|disable|pull-down|pull-up] (defaults to 'as-is'):\n");
+	printf("		set the line bias\n");
+	printf("\n");
+	printf("Biases:\n");
+	printf("  as-is:\tleave bias unchanged\n");
+	printf("  disable:\tdisable bias\n");
+	printf("  pull-up:\tenable pull-up\n");
+	printf("  pull-down:\tenable pull-down\n");
+}
+
+static int bias_flags(const char *option)
+{
+	if (strcmp(option, "pull-down") == 0)
+		return GPIOD_CTXLESS_FLAG_BIAS_PULL_DOWN;
+	if (strcmp(option, "pull-up") == 0)
+		return GPIOD_CTXLESS_FLAG_BIAS_PULL_UP;
+	if (strcmp(option, "disable") == 0)
+		return GPIOD_CTXLESS_FLAG_BIAS_DISABLE;
+	return 0;
 }
 
 int main(int argc, char **argv)
@@ -39,6 +59,7 @@ int main(int argc, char **argv)
 	unsigned int *offsets, i, num_lines;
 	int *values, optc, opti, rv;
 	bool active_low = false;
+	int flags = 0;
 	char *device, *end;
 
 	for (;;) {
@@ -56,6 +77,9 @@ int main(int argc, char **argv)
 		case 'l':
 			active_low = true;
 			break;
+		case 'B':
+			flags = bias_flags(optarg);
+			break;
 		case '?':
 			die("try %s --help", get_progname());
 		default:
@@ -86,9 +110,9 @@ int main(int argc, char **argv)
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
index 9a1843b..687212d 100644
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
@@ -50,6 +53,12 @@ static void print_help(void)
 	printf("  -b, --line-buffered:\tset standard output as line buffered\n");
 	printf("  -F, --format=FMT\tspecify custom output format\n");
 	printf("\n");
+	printf("Biases:\n");
+	printf("  as-is:\tleave bias unchanged\n");
+	printf("  disable:\tdisable bias\n");
+	printf("  pull-up:\tenable pull-up\n");
+	printf("  pull-down:\tenable pull-down\n");
+	printf("\n");
 	printf("Format specifiers:\n");
 	printf("  %%o:  GPIO line offset\n");
 	printf("  %%e:  event type (0 - falling edge, 1 rising edge)\n");
@@ -240,10 +249,22 @@ static int make_signalfd(void)
 	return sigfd;
 }
 
+static int bias_flags(const char *option)
+{
+	if (strcmp(option, "pull-down") == 0)
+		return GPIOD_CTXLESS_FLAG_BIAS_PULL_DOWN;
+	if (strcmp(option, "pull-up") == 0)
+		return GPIOD_CTXLESS_FLAG_BIAS_PULL_UP;
+	if (strcmp(option, "disable") == 0)
+		return GPIOD_CTXLESS_FLAG_BIAS_DISABLE;
+	return 0;
+}
+
 int main(int argc, char **argv)
 {
 	unsigned int offsets[GPIOD_LINE_BULK_MAX_LINES], num_lines = 0, offset;
 	bool active_low = false, watch_rising = false, watch_falling = false;
+	int flags = 0;
 	struct timespec timeout = { 10, 0 };
 	int optc, opti, rv, i, event_type;
 	struct mon_ctx ctx;
@@ -266,6 +287,9 @@ int main(int argc, char **argv)
 		case 'l':
 			active_low = true;
 			break;
+		case 'B':
+			flags = bias_flags(optarg);
+			break;
 		case 'n':
 			ctx.events_wanted = strtoul(optarg, &end, 10);
 			if (*end != '\0')
@@ -320,11 +344,11 @@ int main(int argc, char **argv)
 
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
index d9977a7..b91baea 100644
--- a/tools/gpioset.c
+++ b/tools/gpioset.c
@@ -23,6 +23,8 @@ static const struct option longopts[] = {
 	{ "help",		no_argument,		NULL,	'h' },
 	{ "version",		no_argument,		NULL,	'v' },
 	{ "active-low",		no_argument,		NULL,	'l' },
+	{ "bias",		required_argument,	NULL,	'B' },
+	{ "drive",		required_argument,	NULL,	'D' },
 	{ "mode",		required_argument,	NULL,	'm' },
 	{ "sec",		required_argument,	NULL,	's' },
 	{ "usec",		required_argument,	NULL,	'u' },
@@ -30,7 +32,7 @@ static const struct option longopts[] = {
 	{ GETOPT_NULL_LONGOPT },
 };
 
-static const char *const shortopts = "+hvlm:s:u:b";
+static const char *const shortopts = "+hvlB:D:m:s:u:b";
 
 static void print_help(void)
 {
@@ -42,12 +44,27 @@ static void print_help(void)
 	printf("  -h, --help:\t\tdisplay this message and exit\n");
 	printf("  -v, --version:\tdisplay the version and exit\n");
 	printf("  -l, --active-low:\tset the line active state to low\n");
+	printf("  -B, --bias=[as-is|disable|pull-down|pull-up] (defaults to 'as-is'):\n");
+	printf("		set the line bias\n");
+	printf("  -D, --drive=[push-pull|open-drain|open-source] (defaults to 'push-pull'):\n");
+	printf("		set the line drive mode\n");
 	printf("  -m, --mode=[exit|wait|time|signal] (defaults to 'exit'):\n");
 	printf("		tell the program what to do after setting values\n");
 	printf("  -s, --sec=SEC:\tspecify the number of seconds to wait (only valid for --mode=time)\n");
 	printf("  -u, --usec=USEC:\tspecify the number of microseconds to wait (only valid for --mode=time)\n");
 	printf("  -b, --background:\tafter setting values: detach from the controlling terminal\n");
 	printf("\n");
+	printf("Biases:\n");
+	printf("  as-is:\tleave bias unchanged\n");
+	printf("  disable:\tdisable bias\n");
+	printf("  pull-up:\tenable pull-up\n");
+	printf("  pull-down:\tenable pull-down\n");
+	printf("\n");
+	printf("Drives:\n");
+	printf("  push-pull:\tdrive the line both high and low\n");
+	printf("  open-drain:\tdrive the line low or go high impedance\n");
+	printf("  open-source:\tdrive the line high or go high impedance\n");
+	printf("\n");
 	printf("Modes:\n");
 	printf("  exit:\t\tset values and exit immediately\n");
 	printf("  wait:\t\tset values and wait for user to press ENTER\n");
@@ -178,11 +195,31 @@ static const struct mode_mapping *parse_mode(const char *mode)
 	return NULL;
 }
 
+static int bias_flags(const char *option)
+{
+	if (strcmp(option, "pull-down") == 0)
+		return GPIOD_CTXLESS_FLAG_BIAS_PULL_DOWN;
+	if (strcmp(option, "pull-up") == 0)
+		return GPIOD_CTXLESS_FLAG_BIAS_PULL_UP;
+	if (strcmp(option, "disable") == 0)
+		return GPIOD_CTXLESS_FLAG_BIAS_DISABLE;
+	return 0;
+}
+
+static int drive_flags(const char *option)
+{
+	if (strcmp(option, "open-drain") == 0)
+		return GPIOD_CTXLESS_FLAG_OPEN_DRAIN;
+	if (strcmp(option, "open-source") == 0)
+		return GPIOD_CTXLESS_FLAG_OPEN_SOURCE;
+	return 0;
+}
+
 int main(int argc, char **argv)
 {
 	const struct mode_mapping *mode = &modes[MODE_EXIT];
 	unsigned int *offsets, num_lines, i;
-	int *values, rv, optc, opti;
+	int *values, rv, optc, opti, flags = 0;
 	struct callback_data cbdata;
 	bool active_low = false;
 	char *device, *end;
@@ -204,6 +241,12 @@ int main(int argc, char **argv)
 		case 'l':
 			active_low = true;
 			break;
+		case 'B':
+			flags |= bias_flags(optarg);
+			break;
+		case 'D':
+			flags |= drive_flags(optarg);
+			break;
 		case 'm':
 			mode = parse_mode(optarg);
 			if (!mode)
@@ -268,9 +311,10 @@ int main(int argc, char **argv)
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
 
-- 
2.24.0

