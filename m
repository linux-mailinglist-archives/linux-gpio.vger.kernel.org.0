Return-Path: <linux-gpio+bounces-5576-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A6E8A770C
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Apr 2024 23:52:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E35861F21F7D
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Apr 2024 21:52:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05D9F6E611;
	Tue, 16 Apr 2024 21:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="OfME08hP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8877F69946
	for <linux-gpio@vger.kernel.org>; Tue, 16 Apr 2024 21:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713304348; cv=none; b=Omm3xruEOsHVYE0QJ9XbR4VCagmP5yjDg/Mm9zXzLccgXZ4PwnUjKUUkRbry7z++3AADwXRxyTgsGOPOo5V0M/voru++XbV5vHFcHBExlWEUO8BRofb+pYeNVFPqADrlElk1nsFkOXci6S5JfpUpqEzNd280DYyXFBdK/Kb5Q1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713304348; c=relaxed/simple;
	bh=wZgr20dfY+CkOzhOLyU4m7MU2TR5zJLdVN/TG6a7ASs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=V1xJufBbDlxyibDyiejwBDkBw/cZ8wJANW4XpVx3/hLtRZuwl2mk3Jo4aAG+CeM23KgD214F/z9OdFuktZa7ae24ddBayPLw7O/9FbLbR352bDSnN+giduj/uZXCbIIRyLLE/mrH3OgOKti6AGgKPOG0nCJAhRZV/5FK00rQPVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=OfME08hP; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6ecf05fd12fso4643083b3a.2
        for <linux-gpio@vger.kernel.org>; Tue, 16 Apr 2024 14:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1713304347; x=1713909147; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E7pba3IahTgD9DftxTzBcYMSbhG2YiMnuGqnb35n1gw=;
        b=OfME08hP/8joXdYaLOpI5zBOL4rYvM5Gv9V+LRV4neqNKZvyp7Aka+enWK+O5jwl/B
         XlCxA6gVaM2iDZVgBkEC4fwkjgmkrLfU+hZb//i3tN67RgzjMSzcgAfFilK5Gp5Fmgi2
         Q+6ww/gIZGaNVuSHkzL72tRMriDkaj8JZMVMKF9LOm+9YAO33i89wgh57quYa3XGBWek
         eTfVnjVijDsX5LKe1FDtKlUI3WLnkr+mszDaSXoAgelf92TYBA2bvDmELDrR0rxjHHAN
         i7RP9bIkG5v00dspehOkP65QD1Na3ZKy+TZ0f5hF9FFiwbMQuf4lHVm5cfOAJ3CCdzz8
         gDPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713304347; x=1713909147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E7pba3IahTgD9DftxTzBcYMSbhG2YiMnuGqnb35n1gw=;
        b=atukZoVC7apYgAMbTjdj13Nah2c4HqdhnKc8QZ1PDxtc4tZhifuPVKK5pnjHIyejlZ
         fIcbRmzMVpfq/ctYX6mnIv8Rr2jDxM/rOX6QD7Nu0P5tiCtuBeFIznwwh/pM3aIPbs2U
         EG1dCs+mXyNoobsQjzJKFk7LKCPojITa3kj9+IK/xHQXo1VJBnLPUJcjvqAE0zlz50SW
         269QI8UV1PNMXYZLYg9jSOBbfAN/eP033c8JOZsZQcex3OeDIi+4RUSh0Dnkh3/fZAhV
         EVENAXuRiLpexrEj0+LQLOzVZ+r49YIA3xuqcdPa0hD+L6/iK/q6rxKcWgfIR6Nh+U0i
         ifOg==
X-Gm-Message-State: AOJu0YwQzCx1QTzWPZVyYlX2SlP9H6DloxpHgOWlIyZSPv83WnkXkvV7
	ZIwMmyhpOngd73v2elh3xiazWLyz8zzpTQkpp3eH3uz4/JGx+e5TNBQlED44uNiwSfSE/rRH5gO
	bFSk=
X-Google-Smtp-Source: AGHT+IGFIR9E16pOIAywVQvGIQs67h78S7XhPz1f7Q5RGYxP3YVap+9636Q5UhF1Pt+yT14zmGqrRg==
X-Received: by 2002:a05:6a00:148a:b0:6ea:c04c:71cb with SMTP id v10-20020a056a00148a00b006eac04c71cbmr17655431pfu.3.1713304346785;
        Tue, 16 Apr 2024 14:52:26 -0700 (PDT)
Received: from brgl-uxlite.. ([24.75.208.145])
        by smtp.gmail.com with ESMTPSA id o8-20020a656148000000b005f07f34eb59sm8005217pgv.27.2024.04.16.14.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 14:52:25 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>,
	=?UTF-8?q?Gunnar=20Th=C3=B6rnqvist?= <gunnar@igl.se>
Cc: linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][PATCH v2 1/4] tools: rename timeout to idle_timeout in gpiomon and gpionotify
Date: Tue, 16 Apr 2024 23:52:19 +0200
Message-Id: <20240416215222.175166-2-brgl@bgdev.pl>
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


