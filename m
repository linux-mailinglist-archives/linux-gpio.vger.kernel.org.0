Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6724A50FC3B
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Apr 2022 13:49:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346506AbiDZLwF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Apr 2022 07:52:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245043AbiDZLwE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Apr 2022 07:52:04 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D73B631DEC
        for <linux-gpio@vger.kernel.org>; Tue, 26 Apr 2022 04:48:55 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id 1-20020a05600c248100b00393fbf11a05so304360wms.3
        for <linux-gpio@vger.kernel.org>; Tue, 26 Apr 2022 04:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9H33O7xRav8901yVhv1bpnrBIyTXHHV3VRcDm2l4L7A=;
        b=0OXvmKCzDoH7Ac9DGgm95d1DFF2oleDWSuNjO/SUltlRwVcKQ6CsgcTo/Z8JhpEe1p
         6TsIw194HIfIHKzVNbSnodbAj0178X65htOgzEUsH3wELTtU6zu3pwlAhk6hCiY2UFVr
         xivstPrrYZwbCmY4XI6taMCcA1UQWcuaydQW2+A2mhSvo3q9nK1bLp/B5AuqVdMu1yhG
         KU8axFk+bUYSLlKbmYDk1QqUULm2QUKTbRA0SsFkjZuX3hgI8Xrt//7es1pbnd84+oCy
         dgtimdG8GcrbF636NlZau0ZWGlHubP1nm221ufupRzfK65FQMrzoASh4/bDdr/IsvEDQ
         k7MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9H33O7xRav8901yVhv1bpnrBIyTXHHV3VRcDm2l4L7A=;
        b=RjgZ3xjs5T6G6GztK5mj/+pD4hABPS+rU/st7wTXssdQzRUOd+kJAXYOiM3FN4l53t
         IvtSWtQntyKHNKgxGHc34nXygeNmdv58yWqQceTZv+ssN47zk5IRtG8g9eVFV8BQ6Kdn
         G+02SKieZJuSg54wuTVF6A4stAUBomVQoxSWoTLB04pnTtoDXTo6QIN24AmzjMGN0zk7
         3ilYy8Mc8pcHtf2gfYfmq/6v9NEKH1PJKdwlLQCMyZQD/qPFVngM/YYep/mTUy61fY6i
         73OTSa/4w24neHD6jpIw1NRp3zcECk+779iLzG/Wlmas3y6CBXi5IiAFv3J8jaLuyW5Y
         +eDw==
X-Gm-Message-State: AOAM533Mi7b50VhZ6k2FVCbiyCCOTkzJBRDR4vA2XtlS3S6Jmc1lEddO
        c1pUTAVJ7fsj0eTNraihPbG1Ev9BPboMBnRl
X-Google-Smtp-Source: ABdhPJzhJ9oiAE5p65yMbshFT9PImg8qz0Xg/1GkLiobqAXtDrLcUXI9z08CuwF2cbmGdJXIya5iyQ==
X-Received: by 2002:a05:600c:a08:b0:392:a561:9542 with SMTP id z8-20020a05600c0a0800b00392a5619542mr20488421wmp.62.1650973734397;
        Tue, 26 Apr 2022 04:48:54 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:faf0:6ae0:9a53:ee37])
        by smtp.gmail.com with ESMTPSA id v13-20020adfe28d000000b0020375f27a5asm11774741wri.4.2022.04.26.04.48.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Apr 2022 04:48:53 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [libgpiod v2][PATCH] chip: don't set the request's file descriptor to non-blocking
Date:   Tue, 26 Apr 2022 13:48:50 +0200
Message-Id: <20220426114850.2593123-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Make the behavior consistent with the documentation and don't set the
line request's fd to non-blocking. Add two more test-cases that make
sure the library behaves correctly.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 lib/chip.c               |  23 --------
 tests/tests-edge-event.c | 119 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 119 insertions(+), 23 deletions(-)

diff --git a/lib/chip.c b/lib/chip.c
index eef3be2..fc3dda2 100644
--- a/lib/chip.c
+++ b/lib/chip.c
@@ -181,23 +181,6 @@ GPIOD_API int gpiod_chip_get_line_offset_from_name(struct gpiod_chip *chip,
 	return -1;
 }
 
-static int set_fd_noblock(int fd)
-{
-	int ret, flags;
-
-	flags = fcntl(fd, F_GETFL, 0);
-	if (flags < 0)
-		return -1;
-
-	flags |= O_NONBLOCK;
-
-	ret = fcntl(fd, F_SETFL, flags);
-	if (ret < 0)
-		return -1;
-
-	return 0;
-}
-
 GPIOD_API struct gpiod_line_request *
 gpiod_chip_request_lines(struct gpiod_chip *chip,
 			 struct gpiod_request_config *req_cfg,
@@ -222,12 +205,6 @@ gpiod_chip_request_lines(struct gpiod_chip *chip,
 	if (ret < 0)
 		return NULL;
 
-	ret = set_fd_noblock(uapi_req.fd);
-	if (ret) {
-		close(uapi_req.fd);
-		return NULL;
-	}
-
 	request = gpiod_line_request_from_uapi(&uapi_req);
 	if (!request) {
 		close(uapi_req.fd);
diff --git a/tests/tests-edge-event.c b/tests/tests-edge-event.c
index 306383f..987155f 100644
--- a/tests/tests-edge-event.c
+++ b/tests/tests-edge-event.c
@@ -357,6 +357,75 @@ GPIOD_TEST_CASE(read_rising_edge_event_polled)
 	g_thread_join(thread);
 }
 
+GPIOD_TEST_CASE(read_both_events_blocking)
+{
+	/*
+	 * This time without polling so that the read gets a chance to block
+	 * and we can make sure it doesn't immediately return an error.
+	 */
+
+	static const guint offset = 2;
+
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(struct_gpiod_chip) chip = NULL;
+	g_autoptr(struct_gpiod_request_config) req_cfg = NULL;
+	g_autoptr(struct_gpiod_line_config) line_cfg = NULL;
+	g_autoptr(struct_gpiod_line_request) request = NULL;
+	g_autoptr(GThread) thread = NULL;
+	g_autoptr(struct_gpiod_edge_event_buffer) buffer = NULL;
+	struct gpiod_edge_event *event;
+	gint ret;
+
+	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
+	req_cfg = gpiod_test_create_request_config_or_fail();
+	line_cfg = gpiod_test_create_line_config_or_fail();
+	buffer = gpiod_test_create_edge_event_buffer_or_fail(64);
+
+	gpiod_request_config_set_offsets(req_cfg, 1, &offset);
+	gpiod_line_config_set_direction_default(line_cfg,
+						GPIOD_LINE_DIRECTION_INPUT);
+	gpiod_line_config_set_edge_detection_default(line_cfg,
+						     GPIOD_LINE_EDGE_BOTH);
+
+	request = gpiod_test_request_lines_or_fail(chip, req_cfg, line_cfg);
+
+	thread = g_thread_new("request-release",
+			      falling_and_rising_edge_events, sim);
+	g_thread_ref(thread);
+
+	/* First event. */
+
+	ret = gpiod_line_request_read_edge_event(request, buffer, 1);
+	g_assert_cmpint(ret, ==, 1);
+	gpiod_test_join_thread_and_return_if_failed(thread);
+
+	g_assert_cmpuint(gpiod_edge_event_buffer_get_num_events(buffer), ==, 1);
+	event = gpiod_edge_event_buffer_get_event(buffer, 0);
+	g_assert_nonnull(event);
+	gpiod_test_join_thread_and_return_if_failed(thread);
+
+	g_assert_cmpint(gpiod_edge_event_get_event_type(event),
+			==, GPIOD_EDGE_EVENT_RISING_EDGE);
+	g_assert_cmpuint(gpiod_edge_event_get_line_offset(event), ==, 2);
+
+	/* Second event. */
+
+	ret = gpiod_line_request_read_edge_event(request, buffer, 1);
+	g_assert_cmpint(ret, ==, 1);
+	gpiod_test_join_thread_and_return_if_failed(thread);
+
+	g_assert_cmpuint(gpiod_edge_event_buffer_get_num_events(buffer), ==, 1);
+	event = gpiod_edge_event_buffer_get_event(buffer, 0);
+	g_assert_nonnull(event);
+	gpiod_test_join_thread_and_return_if_failed(thread);
+
+	g_assert_cmpint(gpiod_edge_event_get_event_type(event),
+			==, GPIOD_EDGE_EVENT_FALLING_EDGE);
+	g_assert_cmpuint(gpiod_edge_event_get_line_offset(event), ==, 2);
+
+	g_thread_join(thread);
+}
+
 static gpointer rising_edge_events_on_two_offsets(gpointer data)
 {
 	GPIOSimChip *sim = data;
@@ -488,3 +557,53 @@ GPIOD_TEST_CASE(event_copy)
 	g_assert_nonnull(copy);
 	g_assert_true(copy != event);
 }
+
+GPIOD_TEST_CASE(reading_more_events_than_the_queue_contains_doesnt_block)
+{
+	static const guint offset = 2;
+
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(struct_gpiod_chip) chip = NULL;
+	g_autoptr(struct_gpiod_request_config) req_cfg = NULL;
+	g_autoptr(struct_gpiod_line_config) line_cfg = NULL;
+	g_autoptr(struct_gpiod_line_request) request = NULL;
+	g_autoptr(GThread) thread = NULL;
+	g_autoptr(struct_gpiod_edge_event_buffer) buffer = NULL;
+	gint ret;
+
+	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
+	req_cfg = gpiod_test_create_request_config_or_fail();
+	line_cfg = gpiod_test_create_line_config_or_fail();
+	buffer = gpiod_test_create_edge_event_buffer_or_fail(64);
+
+	gpiod_request_config_set_offsets(req_cfg, 1, &offset);
+	gpiod_line_config_set_direction_default(line_cfg,
+						GPIOD_LINE_DIRECTION_INPUT);
+	gpiod_line_config_set_edge_detection_default(line_cfg,
+						     GPIOD_LINE_EDGE_BOTH);
+
+	request = gpiod_test_request_lines_or_fail(chip, req_cfg, line_cfg);
+
+	g_gpiosim_chip_set_pull(sim, 2, G_GPIOSIM_PULL_UP);
+	g_usleep(500);
+	g_gpiosim_chip_set_pull(sim, 2, G_GPIOSIM_PULL_DOWN);
+	g_usleep(500);
+	g_gpiosim_chip_set_pull(sim, 2, G_GPIOSIM_PULL_UP);
+	g_usleep(500);
+	g_gpiosim_chip_set_pull(sim, 2, G_GPIOSIM_PULL_DOWN);
+	g_usleep(500);
+	g_gpiosim_chip_set_pull(sim, 2, G_GPIOSIM_PULL_UP);
+	g_usleep(500);
+	g_gpiosim_chip_set_pull(sim, 2, G_GPIOSIM_PULL_DOWN);
+	g_usleep(500);
+	g_gpiosim_chip_set_pull(sim, 2, G_GPIOSIM_PULL_UP);
+	g_usleep(500);
+
+	ret = gpiod_line_request_read_edge_event(request, buffer, 12);
+	g_assert_cmpint(ret, ==, 7);
+	gpiod_test_return_if_failed();
+
+	ret = gpiod_line_request_wait_edge_event(request, 1000);
+	g_assert_cmpint(ret, ==, 0);
+	gpiod_test_return_if_failed();
+}
-- 
2.32.0

