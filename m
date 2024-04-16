Return-Path: <linux-gpio+bounces-5579-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1118A770F
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Apr 2024 23:52:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 932C4B22C34
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Apr 2024 21:52:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD1006E612;
	Tue, 16 Apr 2024 21:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="QlgfEazB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306E86BFAB
	for <linux-gpio@vger.kernel.org>; Tue, 16 Apr 2024 21:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713304353; cv=none; b=VOmfCLW5wlX0/iDRFGgU7zovyh0u43X1BCW2CvqYajaeVcCN4mTm0LmPK4cDWwoNQFiUHRo+WOcqYDN4rjvjOFH0/ML0XLMHE5kl//UQY+bjoDr0lt3aOgni0BZ8aAq3/FcizEX9jm67qf57xRcsD7ZJlj/EIEN21iDeztZEjQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713304353; c=relaxed/simple;
	bh=FmZoPc2UXgA8hQ4F4ZNh77W/5ObFZOZybBTJ50S689g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T6AntaFwlbC3x5GhDAk/Ck7v+Xa1bQv8x7dIb4diwtf6XDILXeJFgbd5KQma/UrvRiHcURj36Q5AD/SMn0wICDZczxKivBtK613qlMkQh4wZJgZr0NUJQdk91inrxGHiv6QJPrAL9VDOJ8gfq/QMhM3axWz4ljLDqhk9/z0VkZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=QlgfEazB; arc=none smtp.client-ip=209.85.166.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-36b21e8c6ccso9481405ab.2
        for <linux-gpio@vger.kernel.org>; Tue, 16 Apr 2024 14:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1713304350; x=1713909150; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZB3bHTCzmJTzu2hQoCQM4n0k1utz0ffigFXp5Or7q7M=;
        b=QlgfEazBxONYU+FqiAXu/9RPyDOCRzhnnL/wbgR8Iat+wZqgMTrgcQ5CIqyUEnO+hi
         83uuAL27jQhkvlPnlqW6FimlsNgXEOzu1T36Bq0JGZeifJZ6TBrIrLPVS/vtMayYqcH0
         UyMIHvo7fQ+Ez1BktumC/DA8Mv+Q1Gp8BcChpghJGANvFCz2ftv1h5ChrnPNgR0M16hu
         p794PKwdcNwLlz7/eWVS0W/HirjKqTmRrIC4RTk/5iYzts4zbniXh6Am7rLU87nXTQt1
         hpCWTNGMJGB7muhaLaNZcEPg1Fpw9UM2j2gObUtJhJbk58xJpYIbZnYhYTx7KYLdYIIH
         TgcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713304350; x=1713909150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZB3bHTCzmJTzu2hQoCQM4n0k1utz0ffigFXp5Or7q7M=;
        b=QPjhJTK8AEmRA28m2qWBXWukEwNTE3B8lo2/tc3Vz+I4Nu+pzMUk8mikGnG6xawWMn
         T6YYejFvFczJv2Nv1E7FUPZwYnPW8Ezc9LdAxHI+J49eN1hNxoePUZupA64YvfkleXan
         MmhZNbzfcQC6Ed6PxM4g0gKQVCcbxtrwM3nTgpwcnAnS4AI5t+qcHLMMzzzaai5XPxG+
         PcAarm4RVrxAiOXz4t1c0cLf/jafKxVnuhS/4tY/mlYxMGFi2b1M5mKPfFpSItBqNoKv
         bDSZ8sOwN+Gen4M02QKn5loZITr5/py7CYfHkHEBVUfeOeVKPpqGoWdeBXE3Qz87qpeR
         q5Ow==
X-Gm-Message-State: AOJu0YyM73u9Z54AsKce1cLsREMMQ73vw4jwV4E0o+4F+wrj7KMYItB+
	PliD/XSTVU5FfXkuvTnCwIcwmoqlOZDNnqN2PLuAhMj4X+B5lTcB/p5p++3bRZQ=
X-Google-Smtp-Source: AGHT+IFHDOj9GWio1hqxusecpY0Xx/dDFfjOzkFjNj2HvF1FFMy2gXF8Xrtf89jDLkYe9iR1h2yZbQ==
X-Received: by 2002:a05:6e02:20e8:b0:368:c433:51db with SMTP id q8-20020a056e0220e800b00368c43351dbmr18627921ilv.23.1713304350168;
        Tue, 16 Apr 2024 14:52:30 -0700 (PDT)
Received: from brgl-uxlite.. ([24.75.208.145])
        by smtp.gmail.com with ESMTPSA id o8-20020a656148000000b005f07f34eb59sm8005217pgv.27.2024.04.16.14.52.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 14:52:28 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>,
	=?UTF-8?q?Gunnar=20Th=C3=B6rnqvist?= <gunnar@igl.se>
Cc: linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][PATCH v2 3/4] tools: allow longer time periods
Date: Tue, 16 Apr 2024 23:52:21 +0200
Message-Id: <20240416215222.175166-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240416215222.175166-1-brgl@bgdev.pl>
References: <20240416215222.175166-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We currently store time as microseconds in 32-bit integers and allow
seconds as the longest time unit when parsing command-line arguments
limiting the time period possible to specify when passing arguments such
as --hold-period to 35 minutes. Let's use 64-bit integers to vastly
increase that.

Use nanosleep() instead of usleep() to extend the possible sleep time
range.

Reported-by: Gunnar Thörnqvist <gunnar@igl.se>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 configure.ac         |  2 ++
 tools/gpioget.c      |  4 ++--
 tools/gpiomon.c      | 14 ++++++++++----
 tools/gpionotify.c   |  2 +-
 tools/gpioset.c      | 16 ++++++++--------
 tools/tools-common.c | 22 ++++++++++++++++------
 tools/tools-common.h |  5 +++--
 7 files changed, 42 insertions(+), 23 deletions(-)

diff --git a/configure.ac b/configure.ac
index 3b5bbf2..a2370c5 100644
--- a/configure.ac
+++ b/configure.ac
@@ -120,6 +120,8 @@ AS_IF([test "x$with_tools" = xtrue],
 	AC_CHECK_FUNC([asprintf], [], [FUNC_NOT_FOUND_TOOLS([asprintf])])
 	AC_CHECK_FUNC([scandir], [], [FUNC_NOT_FOUND_TOOLS([scandir])])
 	AC_CHECK_FUNC([versionsort], [], [FUNC_NOT_FOUND_TOOLS([versionsort])])
+	AC_CHECK_FUNC([strtoull], [], [FUNC_NOT_FOUND_TOOLS([strtoull])])
+	AC_CHECK_FUNC([nanosleep], [], [FUNC_NOT_FOUND_TOOLS([nanosleep])])
 	AS_IF([test "x$with_gpioset_interactive" = xtrue],
 		[PKG_CHECK_MODULES([LIBEDIT], [libedit >= 3.1])])
 	])
diff --git a/tools/gpioget.c b/tools/gpioget.c
index f611737..bad7667 100644
--- a/tools/gpioget.c
+++ b/tools/gpioget.c
@@ -19,7 +19,7 @@ struct config {
 	bool unquoted;
 	enum gpiod_line_bias bias;
 	enum gpiod_line_direction direction;
-	unsigned int hold_period_us;
+	unsigned long long hold_period_us;
 	const char *chip_id;
 	const char *consumer;
 };
@@ -205,7 +205,7 @@ int main(int argc, char **argv)
 			die_perror("unable to request lines");
 
 		if (cfg.hold_period_us)
-			usleep(cfg.hold_period_us);
+			sleep_us(cfg.hold_period_us);
 
 		ret = gpiod_line_request_get_values(request, values);
 		if (ret)
diff --git a/tools/gpiomon.c b/tools/gpiomon.c
index 728a671..cf1857c 100644
--- a/tools/gpiomon.c
+++ b/tools/gpiomon.c
@@ -5,6 +5,7 @@
 #include <getopt.h>
 #include <gpiod.h>
 #include <inttypes.h>
+#include <limits.h>
 #include <poll.h>
 #include <stdio.h>
 #include <stdlib.h>
@@ -24,13 +25,13 @@ struct config {
 	enum gpiod_line_bias bias;
 	enum gpiod_line_edge edges;
 	int events_wanted;
-	unsigned int debounce_period_us;
+	unsigned long long debounce_period_us;
 	const char *chip_id;
 	const char *consumer;
 	const char *fmt;
 	enum gpiod_line_clock event_clock;
 	int timestamp_fmt;
-	int idle_timeout;
+	long long idle_timeout;
 };
 
 static void print_help(void)
@@ -390,9 +391,14 @@ int main(int argc, char **argv)
 	if (cfg.active_low)
 		gpiod_line_settings_set_active_low(settings, true);
 
-	if (cfg.debounce_period_us)
+	if (cfg.debounce_period_us) {
+		if (cfg.debounce_period_us > UINT_MAX)
+			die("maximum debounce period is %uus, got %lluus",
+			    UINT_MAX, cfg.debounce_period_us);
+
 		gpiod_line_settings_set_debounce_period_us(
-			settings, cfg.debounce_period_us);
+			settings, (unsigned long)cfg.debounce_period_us);
+	}
 
 	gpiod_line_settings_set_event_clock(settings, cfg.event_clock);
 	gpiod_line_settings_set_edge_detection(settings, cfg.edges);
diff --git a/tools/gpionotify.c b/tools/gpionotify.c
index 962896c..53bd1d0 100644
--- a/tools/gpionotify.c
+++ b/tools/gpionotify.c
@@ -23,7 +23,7 @@ struct config {
 	const char *chip_id;
 	const char *fmt;
 	int timestamp_fmt;
-	int idle_timeout;
+	long long idle_timeout;
 };
 
 static void print_help(void)
diff --git a/tools/gpioset.c b/tools/gpioset.c
index 863da4a..46dde07 100644
--- a/tools/gpioset.c
+++ b/tools/gpioset.c
@@ -28,8 +28,8 @@ struct config {
 	enum gpiod_line_bias bias;
 	enum gpiod_line_drive drive;
 	int toggles;
-	unsigned int *toggle_periods;
-	unsigned int hold_period_us;
+	unsigned long long *toggle_periods;
+	unsigned long long hold_period_us;
 	const char *chip_id;
 	const char *consumer;
 };
@@ -94,10 +94,10 @@ static int parse_drive_or_die(const char *option)
 	return 0;
 }
 
-static int parse_periods_or_die(char *option, unsigned int **periods)
+static int parse_periods_or_die(char *option, unsigned long long **periods)
 {
 	int i, num_periods = 1;
-	unsigned int *pp;
+	unsigned long long *pp;
 	char *end;
 
 	for (i = 0; option[i] != '\0'; i++)
@@ -376,7 +376,7 @@ static void toggle_all_lines(struct line_resolver *resolver)
  * and apply the values to the requests.
  * offset and values are scratch pads for working.
  */
-static void toggle_sequence(int toggles, unsigned int *toggle_periods,
+static void toggle_sequence(int toggles, unsigned long long *toggle_periods,
 			    struct gpiod_line_request **requests,
 			    struct line_resolver *resolver,
 			    unsigned int *offsets,
@@ -388,7 +388,7 @@ static void toggle_sequence(int toggles, unsigned int *toggle_periods,
 		return;
 
 	for (;;) {
-		usleep(toggle_periods[i]);
+		sleep_us(toggle_periods[i]);
 		toggle_all_lines(resolver);
 		apply_values(requests, resolver, offsets, values);
 
@@ -826,7 +826,7 @@ static void interact(struct gpiod_line_request **requests,
 				printf("invalid period: '%s'\n", words[1]);
 				goto cmd_ok;
 			}
-			usleep(period_us);
+			sleep_us(period_us);
 			goto cmd_ok;
 		}
 
@@ -981,7 +981,7 @@ int main(int argc, char **argv)
 	}
 
 	if (cfg.hold_period_us)
-		usleep(cfg.hold_period_us);
+		sleep_us(cfg.hold_period_us);
 
 #ifdef GPIOSET_INTERACTIVE
 	if (cfg.interactive)
diff --git a/tools/tools-common.c b/tools/tools-common.c
index 64592d3..500e9a2 100644
--- a/tools/tools-common.c
+++ b/tools/tools-common.c
@@ -112,12 +112,12 @@ int parse_bias_or_die(const char *option)
 	return GPIOD_LINE_BIAS_DISABLED;
 }
 
-int parse_period(const char *option)
+long long parse_period(const char *option)
 {
-	unsigned long p, m = 0;
+	unsigned long long p, m = 0;
 	char *end;
 
-	p = strtoul(option, &end, 10);
+	p = strtoull(option, &end, 10);
 
 	switch (*end) {
 	case 'u':
@@ -147,15 +147,15 @@ int parse_period(const char *option)
 	}
 
 	p *= m;
-	if (*end != '\0' || p > INT_MAX)
+	if (*end != '\0' || p > LLONG_MAX)
 		return -1;
 
 	return p;
 }
 
-unsigned int parse_period_or_die(const char *option)
+unsigned long long parse_period_or_die(const char *option)
 {
-	int period = parse_period(option);
+	long long period = parse_period(option);
 
 	if (period < 0)
 		die("invalid period: %s", option);
@@ -163,6 +163,16 @@ unsigned int parse_period_or_die(const char *option)
 	return period;
 }
 
+void sleep_us(unsigned long long period)
+{
+	struct timespec	spec;
+
+	spec.tv_sec = period / 1000000;
+	spec.tv_nsec = (period % 1000000) * 1000;
+
+	nanosleep(&spec, NULL);
+}
+
 int parse_uint(const char *option)
 {
 	unsigned long o;
diff --git a/tools/tools-common.h b/tools/tools-common.h
index c82317a..bc63080 100644
--- a/tools/tools-common.h
+++ b/tools/tools-common.h
@@ -87,8 +87,9 @@ void die(const char *fmt, ...) NORETURN PRINTF(1, 2);
 void die_perror(const char *fmt, ...) NORETURN PRINTF(1, 2);
 void print_version(void);
 int parse_bias_or_die(const char *option);
-int parse_period(const char *option);
-unsigned int parse_period_or_die(const char *option);
+long long parse_period(const char *option);
+unsigned long long parse_period_or_die(const char *option);
+void sleep_us(unsigned long long period);
 int parse_uint(const char *option);
 unsigned int parse_uint_or_die(const char *option);
 void print_bias_help(void);
-- 
2.40.1


