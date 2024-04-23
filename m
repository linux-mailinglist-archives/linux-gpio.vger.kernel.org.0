Return-Path: <linux-gpio+bounces-5729-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF148AE1BA
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Apr 2024 12:05:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A89061F250C5
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Apr 2024 10:05:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A889D63102;
	Tue, 23 Apr 2024 10:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Q86PCwzx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E8F60DCF
	for <linux-gpio@vger.kernel.org>; Tue, 23 Apr 2024 10:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713866702; cv=none; b=L3zfYgFeZ/Z5rukKPudcsu/q1InDXlyKnNAt91e9Ji/L0nGsjxKuz6iLaftrQnof6QgwYqi/+60SbFSKYwxmjyg6zZZL7/3ezFdbiZEHTfqO+xMKztetTOvriW6sqpyLDi/RlxklJFBjLy82+V+S7p0PUf//83h76KcerGyiApM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713866702; c=relaxed/simple;
	bh=wZgr20dfY+CkOzhOLyU4m7MU2TR5zJLdVN/TG6a7ASs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tecpCOI98Pk49L2f1aV6f3fyd8OLmrrcvrb8PBkGLXBXG0r2Roaok/as/Oqi7ki/Pg0cCf1gWSazw6fAsmJYgScR1LeNrKrOf0ssD1OVlJ5CUK/Rvs0LMmWnppXkNqgBWSWjcRRg0MFHRgOZBSVew+5kmxh/9u2i8KMILS9Eg/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Q86PCwzx; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-41a5b68ed85so11035885e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 23 Apr 2024 03:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1713866698; x=1714471498; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E7pba3IahTgD9DftxTzBcYMSbhG2YiMnuGqnb35n1gw=;
        b=Q86PCwzxmL20dHEkmZD0V911rfDI3vUmEuXXslvs2maNaFHl1FeAYBLu0rHkDoP71Q
         TesEbIx8UHkPzjLXWYUI04XwF7bzmWDrBJw2qVKBKYDIzyp8FuMjHKKH41CIdW9G/TzT
         cT0mZAQqwKPsQUeKK1AMfEwls0NFV8s8oohZnhEwXU7tceatFeNPSaKoHJ+o0u7svo+l
         OIRQJ+AT+s7GOJDxfyO2yqtFGZs/JqJ7eKVZ7SBP9XlWN1TShUtZ9XSwDn5n3curMQ0e
         vKjrXG04ydlqJNmR7BxrAK8BLvU8cmbS7fz5M3dDRs63VWYVs7Lj9WzOfTJGXUZw1yTm
         cj6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713866698; x=1714471498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E7pba3IahTgD9DftxTzBcYMSbhG2YiMnuGqnb35n1gw=;
        b=Ld2Ew83xJR7OURW+MPM31r/yLtKF3cS9XkpzvKazUc34SzwzsU9ZkZLtqfZ8phfskG
         6JwY0fomc2ZYQilRmpHFTzG38WA7SJ7Fulizc/gOzAmIAXBDPMy5B3WMofdhtYZzEU7P
         GxRez2VhQH1UYdNz1yWPGVtG50WQAgfDGPEIwWD4Gy6AfGEUuA2GaU8lynJpQ0bFxXZs
         DQzosIM9J+I4S0Lw0727of2tks2v0334Zeq+5m74wFETLyNRU4os6Pp3t9KERhr4kUbi
         JBZC/7efgqtk+bU0GNlIImvcDNi6p6/QtnYix25xilBeKfvGkF8kYM7Qn50d53wMZE4d
         tiTw==
X-Gm-Message-State: AOJu0YyNGMZ0hcsaEtBwIa58oyqGM5qbTCzNI6ejWM3MqJxzL0luOLsz
	odgvmMeUM0oAV+SqMPgqDKjwXwMfm0pVkU3VN19v6+qrsJMnDjG9SI+nL3DMvYc=
X-Google-Smtp-Source: AGHT+IEvyoelW2XJXtzNG4MegsaDgos16YqfhUsokEe8vzdbvwCRMmYJjSvMVqQSHAlrsonezdVmZA==
X-Received: by 2002:a05:600c:3b94:b0:417:e316:fbb3 with SMTP id n20-20020a05600c3b9400b00417e316fbb3mr1469245wms.15.1713866698051;
        Tue, 23 Apr 2024 03:04:58 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:75a:e000:a046:fbef:467d:18f7])
        by smtp.gmail.com with ESMTPSA id ay13-20020a05600c1e0d00b0041a7581f8b6sm5223200wmb.23.2024.04.23.03.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 03:04:56 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>,
	=?UTF-8?q?Gunnar=20Th=C3=B6rnqvist?= <gunnar@igl.se>
Cc: linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][PATCH v3 1/4] tools: rename timeout to idle_timeout in gpiomon and gpionotify
Date: Tue, 23 Apr 2024 12:04:49 +0200
Message-Id: <20240423100452.32958-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240423100452.32958-1-brgl@bgdev.pl>
References: <20240423100452.32958-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Use a more meaningful name for the variable storing the idle timeout
value.

Suggested-by: Kent Gibson <warthog618@gmail.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 tools/gpiomon.c    | 8 ++++----
 tools/gpionotify.c | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/tools/gpiomon.c b/tools/gpiomon.c
index e3abb2d..40e6ac2 100644
--- a/tools/gpiomon.c
+++ b/tools/gpiomon.c
@@ -30,7 +30,7 @@ struct config {
 	const char *fmt;
 	enum gpiod_line_clock event_clock;
 	int timestamp_fmt;
-	int timeout;
+	int idle_timeout;
 };
 
 static void print_help(void)
@@ -143,7 +143,7 @@ static int parse_config(int argc, char **argv, struct config *cfg)
 	memset(cfg, 0, sizeof(*cfg));
 	cfg->edges = GPIOD_LINE_EDGE_BOTH;
 	cfg->consumer = "gpiomon";
-	cfg->timeout = -1;
+	cfg->idle_timeout = -1;
 
 	for (;;) {
 		optc = getopt_long(argc, argv, shortopts, longopts, &opti);
@@ -176,7 +176,7 @@ static int parse_config(int argc, char **argv, struct config *cfg)
 			cfg->fmt = optarg;
 			break;
 		case 'i':
-			cfg->timeout = parse_period_or_die(optarg) / 1000;
+			cfg->idle_timeout = parse_period_or_die(optarg) / 1000;
 			break;
 		case 'l':
 			cfg->active_low = true;
@@ -453,7 +453,7 @@ int main(int argc, char **argv)
 	for (;;) {
 		fflush(stdout);
 
-		ret = poll(pollfds, resolver->num_chips, cfg.timeout);
+		ret = poll(pollfds, resolver->num_chips, cfg.idle_timeout);
 		if (ret < 0)
 			die_perror("error polling for events");
 
diff --git a/tools/gpionotify.c b/tools/gpionotify.c
index 2c56590..d2aee15 100644
--- a/tools/gpionotify.c
+++ b/tools/gpionotify.c
@@ -23,7 +23,7 @@ struct config {
 	const char *chip_id;
 	const char *fmt;
 	int timestamp_fmt;
-	int timeout;
+	int idle_timeout;
 };
 
 static void print_help(void)
@@ -108,7 +108,7 @@ static int parse_config(int argc, char **argv, struct config *cfg)
 	int opti, optc;
 
 	memset(cfg, 0, sizeof(*cfg));
-	cfg->timeout = -1;
+	cfg->idle_timeout = -1;
 
 	for (;;) {
 		optc = getopt_long(argc, argv, shortopts, longopts, &opti);
@@ -132,7 +132,7 @@ static int parse_config(int argc, char **argv, struct config *cfg)
 			cfg->fmt = optarg;
 			break;
 		case 'i':
-			cfg->timeout = parse_period_or_die(optarg) / 1000;
+			cfg->idle_timeout = parse_period_or_die(optarg) / 1000;
 			break;
 		case 'n':
 			cfg->events_wanted = parse_uint_or_die(optarg);
@@ -422,7 +422,7 @@ int main(int argc, char **argv)
 	for (;;) {
 		fflush(stdout);
 
-		ret = poll(pollfds, resolver->num_chips, cfg.timeout);
+		ret = poll(pollfds, resolver->num_chips, cfg.idle_timeout);
 		if (ret < 0)
 			die_perror("error polling for events");
 
-- 
2.40.1


