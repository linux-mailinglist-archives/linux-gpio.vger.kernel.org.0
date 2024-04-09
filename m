Return-Path: <linux-gpio+bounces-5222-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5677B89D5A2
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Apr 2024 11:33:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 478E91C22BF1
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Apr 2024 09:33:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A91CD7FBC7;
	Tue,  9 Apr 2024 09:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="z09Pt9yB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 823897FBB9
	for <linux-gpio@vger.kernel.org>; Tue,  9 Apr 2024 09:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712655226; cv=none; b=he+/1d753KUoi5ryv4J9Hn/cPModBY/cuo2KGfAbMt2DSofD2bY1eVE35t9EzCzzeOAjS3aP0D3czuV7XVAcYUqbW7nM9Tp6sHmJ9IJPThUyR6xbg+cGSsDmFW+A78ArXFBh3lWespUQdORmP7cgfht1Yc9Rd3EnuOG39d88buU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712655226; c=relaxed/simple;
	bh=Cvj2togFbqT4uzU16Y59yP1F1OMXwczFYKmTjgUjOP0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SK3aiN6iLcKCA/nDu1uug3253d4bXTPRUgQp5sHmox9vV8OJnh68qUYr7OQ+E3lV7dEFBZfz2c4Uhxp4pi55EOKw1q/XEVr5I/0qstS6+dhU6tiBXNeaJ3wk9VEc9AgBEt2GBA/6kekbiqckwHGBjH27GzcTTIs1bRvk82aNMkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=z09Pt9yB; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-41550858cabso36909065e9.2
        for <linux-gpio@vger.kernel.org>; Tue, 09 Apr 2024 02:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1712655223; x=1713260023; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ENRyDeVv+dCi5dPH8AYwniMEBAorz3nfW+9Fa32jwLM=;
        b=z09Pt9yBXfnogCTR2AYKCTLFSyDTN0hr+uOJELCucO+/85HcaMDhhdrlqoJRG877nH
         HIgO+HF/vtTq1ccIw3/rtQ9zzbpUB5heE6cbk3ObwtlwWW/oFxIsiFdgSrvc1EIRwTU8
         BSJYuzxhHFwmMaDpR9QwWSBxcBeCBuukmc4L2+wU5Y9+I1dhQA8BhmSlCQHXcxyyG3oX
         VIi89x4LxKH9njEqRN+Ju6zDgSa3zj4N80s5+5cMyP52f535PmzHXL51hU6/lSD5gM38
         xDEM7vZfg7vSOugr7xL7sUTqo5G4U4XRcFSP3PR79R2ssX78YJL8ap9J2DbWnyTSjpET
         j6vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712655223; x=1713260023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ENRyDeVv+dCi5dPH8AYwniMEBAorz3nfW+9Fa32jwLM=;
        b=qYB7GBnwIWCkDm9gWFgeD+OJuKbtyE0l5hV2XTPN8bmzUvo5t4kSd4EnSOfX66UjPJ
         S5kEBGHo7kxVCgWIuY0s32Tm3Q2JbIOSSGqSsrSTNA430KAWoKf5L9JkXu8uvQn8p7Q1
         k7HAvI+S0c6tb4+hG62e4FJcF0cnydI4Zg41vcFvUCAH40E4IMHOBlXRIil77lnfN29v
         e2SnH9zj/Vvo56sksvyIj8xgE0SXS70RWNCcL9eAO36A1rzdzTUdNoRvS03yxTVCHy6K
         /52mUHxEzMAeznknqc3lLoYD5Gds/rInJH1ug3xgH59uosgmPZNXrUx0dGJRLhaMKisl
         yUng==
X-Gm-Message-State: AOJu0YwF5oUEGp//dGzjNbAjtEOy7COT+aJC2ClsrLq6txMBOQy2Jz/y
	uPv7tofQ8v+6+or8rrbZ9znegUO/cV+3axAwNUVIx6pR3GMCsz69vIzCljX1wwU=
X-Google-Smtp-Source: AGHT+IFz+epZA2J4DGWEKTa9ARyQDGGf8MhLgmE6cRBMlGBDE14aywgtNq7qvvETGawQoyRQeNp0Xw==
X-Received: by 2002:a05:600c:350a:b0:414:69be:54b0 with SMTP id h10-20020a05600c350a00b0041469be54b0mr8101376wmq.22.1712655222775;
        Tue, 09 Apr 2024 02:33:42 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:75a:e000:bec9:44d9:5791:fb97])
        by smtp.gmail.com with ESMTPSA id fc9-20020a05600c524900b004162d0676cdsm16463072wmb.29.2024.04.09.02.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 02:33:41 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>,
	=?UTF-8?q?Gunnar=20Th=C3=B6rnqvist?= <gunnar@igl.se>
Cc: linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][PATCH 2/2] tools: allow longer time periods
Date: Tue,  9 Apr 2024 11:33:33 +0200
Message-Id: <20240409093333.138408-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240409093333.138408-1-brgl@bgdev.pl>
References: <20240409093333.138408-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We currently store time as milliseconds in 32-bit integers and allow
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
 tools/gpiomon.c      | 19 ++++++++++++++-----
 tools/gpioset.c      | 16 ++++++++--------
 tools/tools-common.c | 22 ++++++++++++++++------
 tools/tools-common.h |  5 +++--
 6 files changed, 45 insertions(+), 23 deletions(-)

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
index e3abb2d..a8a3302 100644
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
-	int timeout;
+	long long timeout;
 };
 
 static void print_help(void)
@@ -389,9 +390,17 @@ int main(int argc, char **argv)
 	if (cfg.active_low)
 		gpiod_line_settings_set_active_low(settings, true);
 
-	if (cfg.debounce_period_us)
+	if (cfg.debounce_period_us) {
+		if (cfg.debounce_period_us > UINT_MAX)
+			die("invalid debounce period: %llu",
+			    cfg.debounce_period_us);
+
 		gpiod_line_settings_set_debounce_period_us(
-			settings, cfg.debounce_period_us);
+			settings, (unsigned long)cfg.debounce_period_us);
+	}
+
+	if (cfg.timeout > INT_MAX)
+		die("invalid idle timeout: %llu", cfg.timeout);
 
 	gpiod_line_settings_set_event_clock(settings, cfg.event_clock);
 	gpiod_line_settings_set_edge_detection(settings, cfg.edges);
@@ -453,7 +462,7 @@ int main(int argc, char **argv)
 	for (;;) {
 		fflush(stdout);
 
-		ret = poll(pollfds, resolver->num_chips, cfg.timeout);
+		ret = poll(pollfds, resolver->num_chips, (int)cfg.timeout);
 		if (ret < 0)
 			die_perror("error polling for events");
 
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


