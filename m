Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53DB41047A6
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Nov 2019 01:36:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726725AbfKUAgx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 20 Nov 2019 19:36:53 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:42059 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726705AbfKUAgw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Nov 2019 19:36:52 -0500
Received: by mail-pf1-f194.google.com with SMTP id s5so674429pfh.9
        for <linux-gpio@vger.kernel.org>; Wed, 20 Nov 2019 16:36:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KZG+sko3Mu2G5Y3MZdfnnns/llFcRSW4rXp5yXhdtko=;
        b=ZdIMaGYaJrLPRFNlyTH91rtnBLWfKsVB2rzNDfV2UBN2FAqNeECpceG0HJdAR+2qiF
         fOBQxrzo1G0YpmB/1ao77tNt2iqMLWY5oN2C75FD9lyCMfDop3a/LZwczQx3cbCcYN7O
         VEBEyV5CBzPUVhGV9Qc5GWBY1Yu6LVLi6cBf+nLXLDI0hmJvWGi7VmvNT3johRrhpGrX
         hgugL8M3X1JDfy2g3DlmaWNMoy4mWnhQ1JWLao35gZn9huwPIhnvsRZ/wTJoXKRRt4HR
         UHjG6jJJwhlth3tHe+kD3UUyfVp44PRsvT3IEgmfKSd8Zuni4LEXWqWUk5/rVkjhe4TB
         1XYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KZG+sko3Mu2G5Y3MZdfnnns/llFcRSW4rXp5yXhdtko=;
        b=t6S394ZS3R5MS25p1SrQ6xn300sC0xWvZU2r9T6dsq4fXqd/8pBdHrl81wMR/cV+vK
         bQJArbInOdABuK8AAcijrAYSwj4hVOA79OLA4DBD/KNHzhAu62MloHaK9Xg5qqJ1F6m0
         RGAAfxx7uwvbbJff671oUcqqqsyrdWx8V96/8uTt+X1r91sgHfl8Z9A0P6jIJ16NtPIT
         5SEHh8fwMzvk9N6cvDE/lL22gbCsVthjviKcZjVb+6wss6xHzBjpc/PhmZycLZXX3bpu
         DokPB8LjAsycTcW65MjihgoX1IBADbiY3GenRGe3hSCWOcWzdhkk3401BQLEpQegqk+n
         UVow==
X-Gm-Message-State: APjAAAUKXhsrpvXfRU2s1h5uYRqsaEvNceWd1m7n2oDOWgwwGPRe+DUA
        nYMBcEezJDSOqosYScQjg7L8M6ENIiI=
X-Google-Smtp-Source: APXvYqwRhVRKRLDeblYRPLOF/R457U5wWzN8H1MMahnkR9Xh4Msz+Wb+kbBH6QvLdJBkO20VlMZ/qg==
X-Received: by 2002:a62:770d:: with SMTP id s13mr7429381pfc.239.1574296610891;
        Wed, 20 Nov 2019 16:36:50 -0800 (PST)
Received: from sol.lan (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id s1sm420756pgk.9.2019.11.20.16.36.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2019 16:36:50 -0800 (PST)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod] [PATCH v2 13/14] tools: add support for bias flags
Date:   Thu, 21 Nov 2019 08:35:55 +0800
Message-Id: <20191121003556.9020-14-warthog618@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191121003556.9020-1-warthog618@gmail.com>
References: <20191121003556.9020-1-warthog618@gmail.com>
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

