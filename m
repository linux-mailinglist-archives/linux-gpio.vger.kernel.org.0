Return-Path: <linux-gpio+bounces-5733-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 135E28AE1BE
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Apr 2024 12:05:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B9F6C2811BB
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Apr 2024 10:05:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABE925FDD1;
	Tue, 23 Apr 2024 10:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="orc/eBux"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE8C629E6
	for <linux-gpio@vger.kernel.org>; Tue, 23 Apr 2024 10:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713866706; cv=none; b=a5QEHF8GmC6fAuPMXwwMSlfGrnD2Uaf79CMV++I64wxYLl6J1so995RiXLi9fBR8ZbUjrg+2cVZX9Rf4p4UDdycDr7AouPb9jx7JU1Gr5uxENi2lIWl+eVy/ze9cReu6byyC8tvdr/VBcnVA3j1npuWkJdvCv+bkUE2eH6X7BYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713866706; c=relaxed/simple;
	bh=yRTy5Urix0+EcC6rem4mU0DoVusZxQcEUyXn3cyhpLA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fTqr+vgqLae4FmSByRloRqqOEQY4ezIgNnvKrCuN0xZ4gN83hZuRrCGAED3Ky+HSEmqNXPRJW9KaGkiZNpkm32U4ncdN099l8m19qpwdZ5lmeTezLi3/O3LQhIUWIK4hbkojpfTOoCO1wkRhbvJezIU+YOfr9ha8vPRRgudQYj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=orc/eBux; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-41a4f291f80so16304005e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 23 Apr 2024 03:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1713866700; x=1714471500; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JU52uuOTpiN59Ue/ujb0LFAJqQDJUOxQOgM4+2iY6sI=;
        b=orc/eBuxbnB/Fp5zJ8lfI0dQ6Jpy0jXrLySCktG2zlTfLDiJmRAcReAkQtBSE1woRn
         CYGvP0y2J9lalNXmLI19DetDXFEGS27ajQkXK9bTi4K6FtRGlRSK6s30JxM4t4g8FySc
         lRHZr6UDtzsUTdnun/ApdLFoQ2KB+0R72abWqr9qxW1I+7083QgTTWtNKq/tLAnhi6JM
         YBokbhKRaJrcDcAJ9+uK4ZFwkK5HGclEuPVQ50quv6aTp+ndXE0EyaMfnxlE6fRRiP/p
         6sPFaa4qgWpLK9wt+I0aV7x2Hnw8K6FVejJTgnxA9mzCzbKN7hHCn+5JZcsx36xXy+he
         2O1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713866700; x=1714471500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JU52uuOTpiN59Ue/ujb0LFAJqQDJUOxQOgM4+2iY6sI=;
        b=vwzJbJ3buf+ke9aMKDBsdLVj8yEmYheWNdo7KmRWhIcTHcnLPyUwJSXBT9bu8dogwH
         tEY4MFiwo+ED9nibF1sTQeMA0+nR5JoZzciVmtwn8yXXRuKvjQxGGkaQ1t0WMBjxDWwI
         nkjcQudQ/gNAPZlSWjZ/BUWcNa9NW1APG4JufrTwqHSsT25XWCmp3X99iIyN2Gpjiic7
         N7QEnSBibI85Xt/bXbe0hl74Y3uadzvW6UA2CBxNRv2S18k0fiX/Dnon94qhpQCKJWio
         o47KETAZ82cYP6a3Lqi9z83Mm5HhkN64sx9bWeZcYpP/h8LEi0SBiUEXTuHq3f3sPbk/
         ABnw==
X-Gm-Message-State: AOJu0YwyyOPCPhfAfvLRDhFRVwF6AVKdIo7wRuirXVkkWKN/S5WsCLpb
	JCL9UgG0cwaPzl+15RrE8ODaEMsB0cnc+E9sPuLDxObzjH1wWTQKMPrYcW79wEg=
X-Google-Smtp-Source: AGHT+IF/wEiiewOAiH+wtmG9Fr3WsiXl46ZKyccICP0GuzhTsjPLeBymAyabdMNCkPiSd5haq2TQKw==
X-Received: by 2002:a05:600c:444c:b0:41a:b310:8959 with SMTP id v12-20020a05600c444c00b0041ab3108959mr1238852wmn.32.1713866700353;
        Tue, 23 Apr 2024 03:05:00 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:75a:e000:a046:fbef:467d:18f7])
        by smtp.gmail.com with ESMTPSA id ay13-20020a05600c1e0d00b0041a7581f8b6sm5223200wmb.23.2024.04.23.03.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 03:04:59 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>,
	=?UTF-8?q?Gunnar=20Th=C3=B6rnqvist?= <gunnar@igl.se>
Cc: linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][PATCH v3 3/4] tools: allow longer time periods
Date: Tue, 23 Apr 2024 12:04:51 +0200
Message-Id: <20240423100452.32958-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240423100452.32958-1-brgl@bgdev.pl>
References: <20240423100452.32958-1-brgl@bgdev.pl>
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
index 7135843..88b5ccf 100644
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
index 08f5da9..e74ca96 100644
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


