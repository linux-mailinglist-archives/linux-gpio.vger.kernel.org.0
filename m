Return-Path: <linux-gpio+bounces-5577-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9F68A770D
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Apr 2024 23:52:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9A5BA1F21F07
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Apr 2024 21:52:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D0C840850;
	Tue, 16 Apr 2024 21:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="xc8v5d9j"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34BD569946
	for <linux-gpio@vger.kernel.org>; Tue, 16 Apr 2024 21:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713304350; cv=none; b=JkR9qBtH+q8chM6AAzxta1kjVsxACV9kueYr0kXi+ev2g54KCbAu4/yZFV5rT0E3+d6IXYMw0hkL+D3xVE3cnJKaGWgTvblMGAscBLlzHFL6n8/33B/8JOvVTpbSzw88W9k+4g0PYGxlqD0NSPvbH5WVrL33PC7r1ucFxp3mayM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713304350; c=relaxed/simple;
	bh=Xpo2ETpkTSXzES1cPuQ73Aak9SSPA5hN4hSxtPFO+E0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fjcWc7ZA9yjbOdKxYzSXhoDLBXXKum03XQJOLYbUZd5AIc4x6YpXKHG9h7A9vmUnihdOnlGVqgjTv39OjxMLW7KlIi1RpAUL+ZuqFkN13YvpYNeOWt4gdbBsq7B5beTclArM08WnN/LK0kYhi6rgr6FEU59CL7a0iui48LYNX/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=xc8v5d9j; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6ed5109d924so4188621b3a.0
        for <linux-gpio@vger.kernel.org>; Tue, 16 Apr 2024 14:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1713304348; x=1713909148; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZUoEwV/WonERdygqJVUNKsyBTwb8gi0MTfMadGUK8J0=;
        b=xc8v5d9j1BK+yhWvBogEABIXDBgaLgQ8ITLd7EsTHKfJSmOs3+slFRMM/chs1/Za+3
         5YZkhl6HIjnzekJA3JKDpFU3oAcxaEnn7INbQeXSduy4F5/Ru+xBaXdNDgH0OKQJ25UI
         MFsxEzkhz/4efyCHlZ9Lh60RbOQ31lpeuDoLNKWSwOcbjaqeuZqM2IKIPvjTRp9/NkAh
         J4y0ZFtA7lHHA+xXYzdKPF42bEen/eNvLHo3y399IG2SpeaYJvLNSjpOXS9Zi9em2Ist
         tV7AlHt1hlBPJxyAoJEXvw15bk8ZCm56siYNVo5kmYX2ZYxl/1dnWI9uwV5rZC6C9Qrf
         yKlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713304348; x=1713909148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZUoEwV/WonERdygqJVUNKsyBTwb8gi0MTfMadGUK8J0=;
        b=D5ppD8FD6jK9wYfygYbEZ+9lZclFr4Pr8rcaJy+dDDUoI+itE8qjN+88vmJdr+mteg
         UL/uAzr9WvXwyB4O41qumzeuXwzwctwya7Ds7KcyHHdPQkntqQEucYmV9HYvWwdb+nrQ
         7xcPdGOvjcKhb6S30OvxV5JtfiGfxa34fwBUVfATTELnf7RxhrToOW7qziXKy6RcUAK4
         79L0Y+/bRtzLSLmDfXvEXZaB1na+3TKlj3ONGNR7loWuAtmzr9DlF5NKA67HR98Cjhs8
         jJqRI/oRDxM/BIBhwlTvz/2vMJ6uQYmyF8oiFySqy3dHEZPmv2cIVvfHSPFS9lpNUVOK
         HmrQ==
X-Gm-Message-State: AOJu0YzM6CC5I9EWeLKQ9bP70TQXjtKiNcCtXaJZuAvmiWHZQt208a7D
	XJkDt6Jz8RoEBdjFJSfeFV5ItlgUaITzUlF19FRKHEyCZLTgmsGZBMJ1GA+///I=
X-Google-Smtp-Source: AGHT+IEqnbIQNi207huXAQ8ctOL38JNw4GyD8GEfdN4/2489Qyp9aZRNzPKSh3bMbsxoP97/D/oPJA==
X-Received: by 2002:a05:6a00:3cc4:b0:6ed:def8:4dc with SMTP id ln4-20020a056a003cc400b006eddef804dcmr15435623pfb.10.1713304348411;
        Tue, 16 Apr 2024 14:52:28 -0700 (PDT)
Received: from brgl-uxlite.. ([24.75.208.145])
        by smtp.gmail.com with ESMTPSA id o8-20020a656148000000b005f07f34eb59sm8005217pgv.27.2024.04.16.14.52.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 14:52:27 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>,
	=?UTF-8?q?Gunnar=20Th=C3=B6rnqvist?= <gunnar@igl.se>
Cc: linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][PATCH v2 2/4] tools: use ppoll() where higher timeout resolution makes sense
Date: Tue, 16 Apr 2024 23:52:20 +0200
Message-Id: <20240416215222.175166-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240416215222.175166-1-brgl@bgdev.pl>
References: <20240416215222.175166-1-brgl@bgdev.pl>
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
---
 tools/gpiomon.c    | 12 ++++++++++--
 tools/gpionotify.c | 12 ++++++++++--
 2 files changed, 20 insertions(+), 4 deletions(-)

diff --git a/tools/gpiomon.c b/tools/gpiomon.c
index 40e6ac2..728a671 100644
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
@@ -453,7 +454,14 @@ int main(int argc, char **argv)
 	for (;;) {
 		fflush(stdout);
 
-		ret = poll(pollfds, resolver->num_chips, cfg.idle_timeout);
+		if (cfg.idle_timeout > 0) {
+			idle_timeout.tv_sec = cfg.idle_timeout / 1000000;
+			idle_timeout.tv_nsec =
+					(cfg.idle_timeout % 1000000) * 1000;
+		}
+
+		ret = ppoll(pollfds, resolver->num_chips,
+			    cfg.idle_timeout > 0 ? &idle_timeout : NULL, NULL);
 		if (ret < 0)
 			die_perror("error polling for events");
 
diff --git a/tools/gpionotify.c b/tools/gpionotify.c
index d2aee15..962896c 100644
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
@@ -422,7 +423,14 @@ int main(int argc, char **argv)
 	for (;;) {
 		fflush(stdout);
 
-		ret = poll(pollfds, resolver->num_chips, cfg.idle_timeout);
+		if (cfg.idle_timeout > 0) {
+			idle_timeout.tv_sec = cfg.idle_timeout / 1000000;
+			idle_timeout.tv_nsec =
+					(cfg.idle_timeout % 1000000) * 1000;
+		}
+
+		ret = ppoll(pollfds, resolver->num_chips,
+			    cfg.idle_timeout > 0 ? &idle_timeout : NULL, NULL);
 		if (ret < 0)
 			die_perror("error polling for events");
 
-- 
2.40.1


