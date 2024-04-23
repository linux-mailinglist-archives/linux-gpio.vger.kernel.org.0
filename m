Return-Path: <linux-gpio+bounces-5731-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0378AE1BB
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Apr 2024 12:05:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8D8981C21E08
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Apr 2024 10:05:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 537BB63417;
	Tue, 23 Apr 2024 10:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="AYYCqLNB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74F7F21345
	for <linux-gpio@vger.kernel.org>; Tue, 23 Apr 2024 10:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713866703; cv=none; b=MEV5NXrpwTafh4YK5g+EDTbnrV+fvHHhVp6H7oejCQVbQauE0M9aDw/Cdu7O4aFu01RKvkvzKMdzAgGd6/TEz2mx4RuxiRZo9DxEENF1gXleTKQkK8X+jwGdaBNVJNLfZ+qFUF7Q4IuBinJC1IDFf1QthAkwl2W/73K7dsJGCYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713866703; c=relaxed/simple;
	bh=GoYcV2EEJmxmZ4gOONxqYQ75JfAbZA6wjMX9gjO2YD8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=c+exVWTkQFCWCTVhPbTBBuLgsWWUJmvqP0QQ6LOE9TNOpOkDV+Q7LRYpvTt4+SKvJDVWhwO2BdCT3Xmarzcvni5Wt0i7pMg3t8yBC3EzRN8Drkd+5lVb6lIPFk7Sevt6yXMHAiDmZVa6fRvM0eHnKUDAzmpwd8gJUUw2Qbgj81s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=AYYCqLNB; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-41a5b68ed85so11036105e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 23 Apr 2024 03:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1713866700; x=1714471500; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z0ljU0dAxpreVzya4hDO6u1lqFoQ8PEr13UAkYz/FkM=;
        b=AYYCqLNB7+dSCJzMF3lApnht82/llBmJi5EPaBpl/9VNkJ+EJ2tnge4fYK6NV3hl3A
         fmLpr7g8HZzkSXjM+x3o/x6VK9DnkXdDGbGxn6JTQHX+lf27z6ZP32m0pPoRYeRs/5lG
         nRb5tYDRXgzogthskqEHIPZmWdkV8H+pbJLlTSllfPCrtMn3xNT6B7eKez4bk6ddAMUd
         c05f13rQrML5juHd9PCFQuDb76GfR89C/pHdPgA5mfiefxJ+h9holMr+wbJ9AaYeL0kD
         ZK085TtE/pLebAA/fYQ5eH9c8b/PxGc9TC/sMt9NEm97wSAD83xcc+uCn+XmkwvZZ968
         E1Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713866700; x=1714471500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z0ljU0dAxpreVzya4hDO6u1lqFoQ8PEr13UAkYz/FkM=;
        b=Zor+10reDWBAbjQCrm7aDarJdAJO6vg35DJOxMuqvGTc5zjq1bOV9U5Tfduzx6kXGV
         BIIIvk5gFAOBGY1NGMqP+cwwW5PPSd5JfonpUWQg3/exVxClHO1VYibJeEk0vcG/waKj
         MFxBJywV81OuoEI1aaY/XfHYcuNEBpmamtwyyguHTXCrKmtcNGw/+11Bp5S+1SUy2wHp
         Gw9Bnxzi6s5TTApGQJ9WPnmYFlUG4rwRYUJAEcs2RTOaYFfvLsBfieXMG9bPYounvktu
         pyLiRjlhRjdnfz+jC/NwC1j8uu0rSLe1BhT3MDfY/v/m+mWl9rC4WgteKrfhvfOVuCtP
         aUfg==
X-Gm-Message-State: AOJu0YzXy5Ociudbu4X7yy+ZJrHWCmPbppZwBOYW0+YjXZGGsKPVBR8T
	INfu/Esm+kesVISddk7ar7PziOnqzNsL9cK+YzJf2k1IGxgp76FZ8eiXgy0xyU4=
X-Google-Smtp-Source: AGHT+IEEclelVhnY5GDJoXY/NTfZTouMr266GCavzpdka1qh9LvFh08drKzDGBssLn41vaM5BVl+4g==
X-Received: by 2002:a05:600c:510f:b0:41a:b42d:e6cd with SMTP id o15-20020a05600c510f00b0041ab42de6cdmr1176520wms.4.1713866699622;
        Tue, 23 Apr 2024 03:04:59 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:75a:e000:a046:fbef:467d:18f7])
        by smtp.gmail.com with ESMTPSA id ay13-20020a05600c1e0d00b0041a7581f8b6sm5223200wmb.23.2024.04.23.03.04.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 03:04:58 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>,
	=?UTF-8?q?Gunnar=20Th=C3=B6rnqvist?= <gunnar@igl.se>
Cc: linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][PATCH v3 2/4] tools: use ppoll() where higher timeout resolution makes sense
Date: Tue, 23 Apr 2024 12:04:50 +0200
Message-Id: <20240423100452.32958-3-brgl@bgdev.pl>
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

We allow timeout units to be specified in microseconds but for poll() we
need to round them up to milliseconds. Switch to ppoll() to avoid losing
precision.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Kent Gibson <warthog618@gmail.com>
---
 tools/gpiomon.c    | 12 ++++++++++--
 tools/gpionotify.c | 12 ++++++++++--
 2 files changed, 20 insertions(+), 4 deletions(-)

diff --git a/tools/gpiomon.c b/tools/gpiomon.c
index 40e6ac2..7135843 100644
--- a/tools/gpiomon.c
+++ b/tools/gpiomon.c
@@ -176,7 +176,7 @@ static int parse_config(int argc, char **argv, struct config *cfg)
 			cfg->fmt = optarg;
 			break;
 		case 'i':
-			cfg->idle_timeout = parse_period_or_die(optarg) / 1000;
+			cfg->idle_timeout = parse_period_or_die(optarg);
 			break;
 		case 'l':
 			cfg->active_low = true;
@@ -362,6 +362,7 @@ int main(int argc, char **argv)
 	int num_lines, events_done = 0;
 	struct gpiod_edge_event *event;
 	struct line_resolver *resolver;
+	struct timespec idle_timeout;
 	struct gpiod_chip *chip;
 	struct pollfd *pollfds;
 	unsigned int *offsets;
@@ -450,10 +451,17 @@ int main(int argc, char **argv)
 	if (cfg.banner)
 		print_banner(argc, argv);
 
+	if (cfg.idle_timeout > 0) {
+		idle_timeout.tv_sec = cfg.idle_timeout / 1000000;
+		idle_timeout.tv_nsec =
+				(cfg.idle_timeout % 1000000) * 1000;
+	}
+
 	for (;;) {
 		fflush(stdout);
 
-		ret = poll(pollfds, resolver->num_chips, cfg.idle_timeout);
+		ret = ppoll(pollfds, resolver->num_chips,
+			    cfg.idle_timeout > 0 ? &idle_timeout : NULL, NULL);
 		if (ret < 0)
 			die_perror("error polling for events");
 
diff --git a/tools/gpionotify.c b/tools/gpionotify.c
index d2aee15..08f5da9 100644
--- a/tools/gpionotify.c
+++ b/tools/gpionotify.c
@@ -132,7 +132,7 @@ static int parse_config(int argc, char **argv, struct config *cfg)
 			cfg->fmt = optarg;
 			break;
 		case 'i':
-			cfg->idle_timeout = parse_period_or_die(optarg) / 1000;
+			cfg->idle_timeout = parse_period_or_die(optarg);
 			break;
 		case 'n':
 			cfg->events_wanted = parse_uint_or_die(optarg);
@@ -374,6 +374,7 @@ int main(int argc, char **argv)
 	int i, j, ret, events_done = 0, evtype;
 	struct line_resolver *resolver;
 	struct gpiod_info_event *event;
+	struct timespec idle_timeout;
 	struct gpiod_chip **chips;
 	struct gpiod_chip *chip;
 	struct pollfd *pollfds;
@@ -419,10 +420,17 @@ int main(int argc, char **argv)
 	if (cfg.banner)
 		print_banner(argc, argv);
 
+	if (cfg.idle_timeout > 0) {
+		idle_timeout.tv_sec = cfg.idle_timeout / 1000000;
+		idle_timeout.tv_nsec =
+				(cfg.idle_timeout % 1000000) * 1000;
+	}
+
 	for (;;) {
 		fflush(stdout);
 
-		ret = poll(pollfds, resolver->num_chips, cfg.idle_timeout);
+		ret = ppoll(pollfds, resolver->num_chips,
+			    cfg.idle_timeout > 0 ? &idle_timeout : NULL, NULL);
 		if (ret < 0)
 			die_perror("error polling for events");
 
-- 
2.40.1


