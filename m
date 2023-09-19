Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 229237A5DF9
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Sep 2023 11:31:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231274AbjISJcB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Sep 2023 05:32:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231360AbjISJb6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Sep 2023 05:31:58 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C31BEC
        for <linux-gpio@vger.kernel.org>; Tue, 19 Sep 2023 02:31:52 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-9adb9fa7200so1111696866b.0
        for <linux-gpio@vger.kernel.org>; Tue, 19 Sep 2023 02:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1695115910; x=1695720710; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EP8CNcj3JznP//5tthZpvquc3g4fz+B7Dv+gCyH6NEE=;
        b=cQ7bwbEt1a5CwhvEWNEZOyqovmmj5UmOA5lLEVBqo53x5LaWGgo25quwq7bVeYtqB+
         ieB/EIQUXQUiJfqKLYpUVHgilX147LZ11xw/gQRfsgN0N/WfaGHHCVB6+o4GpX1IhdGm
         qzegUBRQc7ZQUhNO4eikc/0vwAVm4uCt8Y5XZUV0XcodfolsPiwbj6qWSxg2awBsJQXU
         TPLwN4w2riHnWM1TB0cCR6TNK2wiHTWo5nZOneNVZkDa3T78/MTa5cTY/NmnRQCYvMC5
         pJLdQtbOclTWLhQlUoaB5clp3xL9tzcsAd/9Q0KnTVEaUiBQu+XbA9kqtxmE6eV/xn3L
         o8Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695115910; x=1695720710;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EP8CNcj3JznP//5tthZpvquc3g4fz+B7Dv+gCyH6NEE=;
        b=co3DC1CSUOJK6FG0F/QGpKDIo/w06W2CQOiRSnhY8bBJRUVEerYz3k3i0kBlsjMXyR
         oHGrK9rd47x3xfgOdIvy6rPdgyYunj6HNjqdvYJsUhEq0RQVGSeET5o0vcm04N8yahr5
         /ATQYnCdRq+YD7A0ftD4DumcZxdJqjjftom80YPQo13sramCVqiA/Ve69zDW5dWT+pZw
         rin8TGsub5/VPdQcwlTVviX7CzqbXh7bevNPhBLsfJBaUFnQHjwbaBF0FhNwmXqv18QY
         TVlXr5Berk0wpbYvEPuAE4n2ZOUxoYLLLom7hnN4wvVQpuIARD16k2xK2SCFtAuxBzha
         77Dg==
X-Gm-Message-State: AOJu0YzXVumb8musDW+v6PCfxhYmegDBEjYB/q+40e0LaoK4J+TcGqn0
        Q+GkDEmhkLKRyQKcD+FGO2fU7Q==
X-Google-Smtp-Source: AGHT+IFhu76rRRxxNPIa+0qmS7JyQHAIVLj+MgJxY9f7fCYxhES12uOU7jNZsxl2im10Nt3qCfRgSA==
X-Received: by 2002:a17:907:a412:b0:9a1:c69c:9388 with SMTP id sg18-20020a170907a41200b009a1c69c9388mr2523901ejc.37.1695115910299;
        Tue, 19 Sep 2023 02:31:50 -0700 (PDT)
Received: from brgl-uxlite.. (static-212-193-78-212.thenetworkfactory.nl. [212.78.193.212])
        by smtp.gmail.com with ESMTPSA id cy18-20020a0564021c9200b005231e1780aasm3227294edb.91.2023.09.19.02.31.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Sep 2023 02:31:49 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Erik Schilling <erik.schilling@linaro.org>
Subject: [libgpiod][PATCH 1/3] tests: don't use the same chip object from different threads
Date:   Tue, 19 Sep 2023 11:31:40 +0200
Message-Id: <20230919093142.85389-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

There are no thread-safety guarantees in libgpiod. Let's not reuse the
chip object created in one thread to generate info events in another but
create a second chip for that purpose instead.

Reported-by: Erik Schilling <erik.schilling@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 tests/tests-info-event.c | 62 +++++++++++++++++++++-------------------
 1 file changed, 33 insertions(+), 29 deletions(-)

diff --git a/tests/tests-info-event.c b/tests/tests-info-event.c
index d069811..cbd9e9e 100644
--- a/tests/tests-info-event.c
+++ b/tests/tests-info-event.c
@@ -49,43 +49,59 @@ GPIOD_TEST_CASE(event_timeout)
 }
 
 struct request_ctx {
-	struct gpiod_chip *chip;
-	struct gpiod_line_config *line_cfg;
-	struct gpiod_line_settings *settings;
+	const char *path;
 	guint offset;
 };
 
 static gpointer request_reconfigure_release_line(gpointer data)
 {
+	g_autoptr(struct_gpiod_line_settings) settings = NULL;
+	g_autoptr(struct_gpiod_line_config) line_cfg = NULL;
 	g_autoptr(struct_gpiod_line_request) request = NULL;
+	g_autoptr(struct_gpiod_chip) chip = NULL;
 	struct request_ctx *ctx = data;
 	gint ret;
 
+	chip = gpiod_chip_open(ctx->path);
+	g_assert_nonnull(chip);
+	if (g_test_failed())
+		return NULL;
+
+	line_cfg = gpiod_line_config_new();
+	g_assert_nonnull(line_cfg);
+	if (g_test_failed())
+		return NULL;
+
+	settings = gpiod_line_settings_new();
+	g_assert_nonnull(settings);
+	if (g_test_failed())
+		return NULL;
+
 	g_usleep(1000);
 
-	ret = gpiod_line_config_add_line_settings(ctx->line_cfg, &ctx->offset,
-						  1, ctx->settings);
+	ret = gpiod_line_config_add_line_settings(line_cfg, &ctx->offset,
+						  1, settings);
 	g_assert_cmpint(ret, ==, 0);
 	if (g_test_failed())
 		return NULL;
 
-	request = gpiod_chip_request_lines(ctx->chip, NULL, ctx->line_cfg);
+	request = gpiod_chip_request_lines(chip, NULL, line_cfg);
 	g_assert_nonnull(request);
 	if (g_test_failed())
 		return NULL;
 
 	g_usleep(1000);
 
-	gpiod_line_config_reset(ctx->line_cfg);
-	gpiod_line_settings_set_direction(ctx->settings,
+	gpiod_line_config_reset(line_cfg);
+	gpiod_line_settings_set_direction(settings,
 					  GPIOD_LINE_DIRECTION_OUTPUT);
-	ret = gpiod_line_config_add_line_settings(ctx->line_cfg, &ctx->offset,
-						  1, ctx->settings);
+	ret = gpiod_line_config_add_line_settings(line_cfg, &ctx->offset,
+						  1, settings);
 	g_assert_cmpint(ret, ==, 0);
 	if (g_test_failed())
 		return NULL;
 
-	ret = gpiod_line_request_reconfigure_lines(request, ctx->line_cfg);
+	ret = gpiod_line_request_reconfigure_lines(request, line_cfg);
 	g_assert_cmpint(ret, ==, 0);
 	if (g_test_failed())
 		return NULL;
@@ -106,25 +122,19 @@ GPIOD_TEST_CASE(request_reconfigure_release_events)
 	g_autoptr(struct_gpiod_info_event) request_event = NULL;
 	g_autoptr(struct_gpiod_info_event) reconfigure_event = NULL;
 	g_autoptr(struct_gpiod_info_event) release_event = NULL;
-	g_autoptr(struct_gpiod_line_config) line_cfg = NULL;
-	g_autoptr(struct_gpiod_line_settings) settings = NULL;
 	g_autoptr(GThread) thread = NULL;
 	struct gpiod_line_info *request_info, *reconfigure_info, *release_info;
 	guint64 request_ts, reconfigure_ts, release_ts;
 	struct request_ctx ctx;
+	const char *chip_path = g_gpiosim_chip_get_dev_path(sim);
 	gint ret;
 
-	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
-	line_cfg = gpiod_test_create_line_config_or_fail();
-	settings = gpiod_test_create_line_settings_or_fail();
-
+	chip = gpiod_test_open_chip_or_fail(chip_path);
 	info = gpiod_test_chip_watch_line_info_or_fail(chip, 3);
 
 	g_assert_false(gpiod_line_info_is_used(info));
 
-	ctx.chip = chip;
-	ctx.line_cfg = line_cfg;
-	ctx.settings = settings;
+	ctx.path = chip_path;
 	ctx.offset = 3;
 
 	thread = g_thread_new("request-release",
@@ -199,26 +209,20 @@ GPIOD_TEST_CASE(chip_fd_can_be_polled)
 	g_autoptr(struct_gpiod_chip) chip = NULL;
 	g_autoptr(struct_gpiod_line_info) info = NULL;
 	g_autoptr(struct_gpiod_info_event) event = NULL;
-	g_autoptr(struct_gpiod_line_config) line_cfg = NULL;
-	g_autoptr(struct_gpiod_line_settings) settings = NULL;
 	g_autoptr(GThread) thread = NULL;
+	const char *chip_path = g_gpiosim_chip_get_dev_path(sim);
 	struct gpiod_line_info *evinfo;
 	struct request_ctx ctx;
 	struct timespec ts;
 	struct pollfd pfd;
 	gint ret, fd;
 
-	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
-	settings = gpiod_test_create_line_settings_or_fail();
-	line_cfg = gpiod_test_create_line_config_or_fail();
-
+	chip = gpiod_test_open_chip_or_fail(chip_path);
 	info = gpiod_test_chip_watch_line_info_or_fail(chip, 3);
 
 	g_assert_false(gpiod_line_info_is_used(info));
 
-	ctx.chip = chip;
-	ctx.line_cfg = line_cfg;
-	ctx.settings = settings;
+	ctx.path = chip_path;
 	ctx.offset = 3;
 
 	thread = g_thread_new("request-release",
-- 
2.39.2

