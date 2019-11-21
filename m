Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E47C5104796
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Nov 2019 01:36:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726568AbfKUAgY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 20 Nov 2019 19:36:24 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:37486 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726044AbfKUAgY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Nov 2019 19:36:24 -0500
Received: by mail-pg1-f195.google.com with SMTP id b10so629706pgd.4
        for <linux-gpio@vger.kernel.org>; Wed, 20 Nov 2019 16:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fbezLULghY7JmklQ25RnbLNA20g5Ser92Orgxev1FKE=;
        b=u7MTZhRC75BJOGfTjLqzB9NenT/ET0Hpq8XAAQ2YnniokSk4s5Z8neiru1Iwk8EHij
         EsCK+enWzJLdcqkGK0u/+jp9wTOx64kYicW0PGMOUkh5Lcjdktq3H6KB7VcZBZA4KhP1
         rFgl2sDqbXsriX8oaiHSlMeI/5nxZwLknP3BGPJv319CESGZ5CtqyickzhMuvt6kre2P
         /JjGlSvUkesOpWuHVKeC3L8nsMEfOnzEVttUgNGBede0j5eP/vy4t4ax/H2HPIhTxEMV
         XFM+sxQweV4JQTeXti3dfWBZ5dbTzf9ndYU4VA/OiSqSkqJ//2alX+jbM998P0UcqirG
         PyUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fbezLULghY7JmklQ25RnbLNA20g5Ser92Orgxev1FKE=;
        b=PQfnT0y1B/RVG9hSPUouVoxtHk4Wqyo7yrGQVOc6RoAT6eG9RShOrMisvDGjevHjO8
         FZAd5z5wc3fcluDFmaulYmhSOI0V9ejLeQdxS5yNtQWPyF1TPp13NP8NBKtMMD9oipAZ
         C+ZChaXGefNt5V0Eg1/qC0RPdQQ0He8WvcKqrorL8W+kw0dXeFT2sTP/c49z5DSZZX1C
         /xDiCspXopX1G/APDZsHJF6N/dx693mzJ8q9JqHJc3rFq4ptawO4l6FxmOs7LL1LxZP6
         PX6UL6XgFYHj7+e1cweJDZoEggMN3yKwGpwMWFkM3N3M1dZxr3qwvUdiViYQq1zs5Te5
         sO2Q==
X-Gm-Message-State: APjAAAUQsdsZo6pXXAcPMCNOjFFdSba1udH2ESikkxJNteJ/0oR2C69B
        FZpUceu7YqhT3zSKVZp5ZAA0lxiGE08=
X-Google-Smtp-Source: APXvYqzYnsyV9cSMjhOV8PVMjYpjRgxNBVaN3YUWlBcVXb41x4RIXRdCuP84AAARUCxs4+ZObg5dtA==
X-Received: by 2002:a63:3144:: with SMTP id x65mr6126544pgx.283.1574296582794;
        Wed, 20 Nov 2019 16:36:22 -0800 (PST)
Received: from sol.lan (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id s1sm420756pgk.9.2019.11.20.16.36.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2019 16:36:22 -0800 (PST)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod] [PATCH v2 02/14] tests: add tests for bias flags
Date:   Thu, 21 Nov 2019 08:35:44 +0800
Message-Id: <20191121003556.9020-3-warthog618@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191121003556.9020-1-warthog618@gmail.com>
References: <20191121003556.9020-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Extend test coverage over the bias flags, gpiod_line_bias and the extended
ctxless functions.

Also update existing tests to check bias flags where line state is checked.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 tests/tests-ctxless.c |  64 +++++++++++++++++++++-
 tests/tests-event.c   | 120 ++++++++++++++++++++++++++++++++++++++++++
 tests/tests-line.c    |  98 ++++++++++++++++++++++++++++++++++
 3 files changed, 280 insertions(+), 2 deletions(-)

diff --git a/tests/tests-ctxless.c b/tests/tests-ctxless.c
index c1e1ca6..76b9a7c 100644
--- a/tests/tests-ctxless.c
+++ b/tests/tests-ctxless.c
@@ -26,11 +26,41 @@ GPIOD_TEST_CASE(get_value, 0, { 8 })
 	g_assert_cmpint(ret, ==, 1);
 }
 
-static void set_value_check(gpointer data G_GNUC_UNUSED)
+GPIOD_TEST_CASE(get_value_ext, 0, { 8 })
+{
+	gint ret;
+
+	ret = gpiod_ctxless_get_value_ext(gpiod_test_chip_name(0), 3,
+				false, GPIOD_TEST_CONSUMER,
+				GPIOD_CTXLESS_FLAG_BIAS_PULL_DOWN);
+	g_assert_cmpint(ret, ==, 0);
+
+	ret = gpiod_ctxless_get_value_ext(gpiod_test_chip_name(0), 3,
+				false, GPIOD_TEST_CONSUMER,
+				GPIOD_CTXLESS_FLAG_BIAS_PULL_UP);
+	g_assert_cmpint(ret, ==, 1);
+
+	ret = gpiod_ctxless_get_value_ext(gpiod_test_chip_name(0), 3,
+				true, GPIOD_TEST_CONSUMER
+				, GPIOD_CTXLESS_FLAG_BIAS_PULL_DOWN);
+	g_assert_cmpint(ret, ==, 1);
+
+	ret = gpiod_ctxless_get_value_ext(gpiod_test_chip_name(0), 3,
+				true, GPIOD_TEST_CONSUMER,
+				GPIOD_CTXLESS_FLAG_BIAS_PULL_UP);
+	g_assert_cmpint(ret, ==, 0);
+}
+
+static void set_value_check_hi(gpointer data G_GNUC_UNUSED)
 {
 	g_assert_cmpint(gpiod_test_chip_get_value(0, 3), ==, 1);
 }
 
+static void set_value_check_lo(gpointer data G_GNUC_UNUSED)
+{
+	g_assert_cmpint(gpiod_test_chip_get_value(0, 3), ==, 0);
+}
+
 GPIOD_TEST_CASE(set_value, 0, { 8 })
 {
 	gint ret;
@@ -39,13 +69,43 @@ GPIOD_TEST_CASE(set_value, 0, { 8 })
 
 	ret = gpiod_ctxless_set_value(gpiod_test_chip_name(0), 3, 1,
 				      false, GPIOD_TEST_CONSUMER,
-				      set_value_check, NULL);
+				      set_value_check_hi, NULL);
 	gpiod_test_return_if_failed();
 	g_assert_cmpint(ret, ==, 0);
 
 	g_assert_cmpint(gpiod_test_chip_get_value(0, 3), ==, 0);
 }
 
+GPIOD_TEST_CASE(set_value_ext, 0, { 8 })
+{
+	gint ret;
+
+	gpiod_test_chip_set_pull(0, 3, 0);
+
+	ret = gpiod_ctxless_set_value_ext(gpiod_test_chip_name(0), 3, 1,
+			false, GPIOD_TEST_CONSUMER,
+			set_value_check_hi, NULL, 0);
+	gpiod_test_return_if_failed();
+	g_assert_cmpint(ret, ==, 0);
+	g_assert_cmpint(gpiod_test_chip_get_value(0, 3), ==, 0);
+
+	/* test drive flags by checking that sets are caught by emulation */
+	ret = gpiod_ctxless_set_value_ext(gpiod_test_chip_name(0), 3, 1,
+			false, GPIOD_TEST_CONSUMER, set_value_check_lo,
+			NULL, GPIOD_CTXLESS_FLAG_OPEN_DRAIN);
+	gpiod_test_return_if_failed();
+	g_assert_cmpint(ret, ==, 0);
+	g_assert_cmpint(gpiod_test_chip_get_value(0, 3), ==, 0);
+
+	gpiod_test_chip_set_pull(0, 3, 1);
+	ret = gpiod_ctxless_set_value_ext(gpiod_test_chip_name(0), 3, 0,
+			false, GPIOD_TEST_CONSUMER, set_value_check_hi,
+			NULL, GPIOD_CTXLESS_FLAG_OPEN_SOURCE);
+	gpiod_test_return_if_failed();
+	g_assert_cmpint(ret, ==, 0);
+	g_assert_cmpint(gpiod_test_chip_get_value(0, 3), ==, 1);
+}
+
 static const guint get_value_multiple_offsets[] = {
 	1, 3, 4, 5, 6, 7, 8, 9, 13, 14
 };
diff --git a/tests/tests-event.c b/tests/tests-event.c
index 28b77ec..d425d1a 100644
--- a/tests/tests-event.c
+++ b/tests/tests-event.c
@@ -196,6 +196,126 @@ GPIOD_TEST_CASE(both_edges_active_low, 0, { 8 })
 	g_assert_cmpint(ev.event_type, ==, GPIOD_LINE_EVENT_RISING_EDGE);
 }
 
+GPIOD_TEST_CASE(both_edges_bias_disable, 0, { 8 })
+{
+	g_autoptr(GpiodTestEventThread) ev_thread = NULL;
+	g_autoptr(gpiod_chip_struct) chip = NULL;
+	struct timespec ts = { 1, 0 };
+	struct gpiod_line_event ev;
+	struct gpiod_line *line;
+	gint ret;
+
+	chip = gpiod_chip_open(gpiod_test_chip_path(0));
+	g_assert_nonnull(chip);
+	gpiod_test_return_if_failed();
+
+	line = gpiod_chip_get_line(chip, 7);
+	g_assert_nonnull(line);
+	gpiod_test_return_if_failed();
+
+	ret = gpiod_line_request_both_edges_events_flags(line,
+		GPIOD_TEST_CONSUMER, GPIOD_LINE_REQUEST_FLAG_BIAS_DISABLE);
+	g_assert_cmpint(ret, ==, 0);
+
+	ev_thread = gpiod_test_start_event_thread(0, 7, 100);
+
+	ret = gpiod_line_event_wait(line, &ts);
+	g_assert_cmpint(ret, ==, 1);
+
+	ret = gpiod_line_event_read(line, &ev);
+	g_assert_cmpint(ret, ==, 0);
+
+	g_assert_cmpint(ev.event_type, ==, GPIOD_LINE_EVENT_RISING_EDGE);
+
+	ret = gpiod_line_event_wait(line, &ts);
+	g_assert_cmpint(ret, ==, 1);
+
+	ret = gpiod_line_event_read(line, &ev);
+	g_assert_cmpint(ret, ==, 0);
+
+	g_assert_cmpint(ev.event_type, ==, GPIOD_LINE_EVENT_FALLING_EDGE);
+}
+
+GPIOD_TEST_CASE(both_edges_bias_pull_down, 0, { 8 })
+{
+	g_autoptr(GpiodTestEventThread) ev_thread = NULL;
+	g_autoptr(gpiod_chip_struct) chip = NULL;
+	struct timespec ts = { 1, 0 };
+	struct gpiod_line_event ev;
+	struct gpiod_line *line;
+	gint ret;
+
+	chip = gpiod_chip_open(gpiod_test_chip_path(0));
+	g_assert_nonnull(chip);
+	gpiod_test_return_if_failed();
+
+	line = gpiod_chip_get_line(chip, 7);
+	g_assert_nonnull(line);
+	gpiod_test_return_if_failed();
+
+	ret = gpiod_line_request_both_edges_events_flags(line,
+		GPIOD_TEST_CONSUMER, GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_DOWN);
+	g_assert_cmpint(ret, ==, 0);
+
+	ev_thread = gpiod_test_start_event_thread(0, 7, 100);
+
+	ret = gpiod_line_event_wait(line, &ts);
+	g_assert_cmpint(ret, ==, 1);
+
+	ret = gpiod_line_event_read(line, &ev);
+	g_assert_cmpint(ret, ==, 0);
+
+	g_assert_cmpint(ev.event_type, ==, GPIOD_LINE_EVENT_RISING_EDGE);
+
+	ret = gpiod_line_event_wait(line, &ts);
+	g_assert_cmpint(ret, ==, 1);
+
+	ret = gpiod_line_event_read(line, &ev);
+	g_assert_cmpint(ret, ==, 0);
+
+	g_assert_cmpint(ev.event_type, ==, GPIOD_LINE_EVENT_FALLING_EDGE);
+}
+
+GPIOD_TEST_CASE(both_edges_bias_pull_up, 0, { 8 })
+{
+	g_autoptr(GpiodTestEventThread) ev_thread = NULL;
+	g_autoptr(gpiod_chip_struct) chip = NULL;
+	struct timespec ts = { 1, 0 };
+	struct gpiod_line_event ev;
+	struct gpiod_line *line;
+	gint ret;
+
+	chip = gpiod_chip_open(gpiod_test_chip_path(0));
+	g_assert_nonnull(chip);
+	gpiod_test_return_if_failed();
+
+	line = gpiod_chip_get_line(chip, 7);
+	g_assert_nonnull(line);
+	gpiod_test_return_if_failed();
+
+	ret = gpiod_line_request_both_edges_events_flags(line,
+		GPIOD_TEST_CONSUMER, GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_UP);
+	g_assert_cmpint(ret, ==, 0);
+
+	ev_thread = gpiod_test_start_event_thread(0, 7, 100);
+
+	ret = gpiod_line_event_wait(line, &ts);
+	g_assert_cmpint(ret, ==, 1);
+
+	ret = gpiod_line_event_read(line, &ev);
+	g_assert_cmpint(ret, ==, 0);
+
+	g_assert_cmpint(ev.event_type, ==, GPIOD_LINE_EVENT_FALLING_EDGE);
+
+	ret = gpiod_line_event_wait(line, &ts);
+	g_assert_cmpint(ret, ==, 1);
+
+	ret = gpiod_line_event_read(line, &ev);
+	g_assert_cmpint(ret, ==, 0);
+
+	g_assert_cmpint(ev.event_type, ==, GPIOD_LINE_EVENT_RISING_EDGE);
+}
+
 GPIOD_TEST_CASE(falling_edge_active_low, 0, { 8 })
 {
 	g_autoptr(GpiodTestEventThread) ev_thread = NULL;
diff --git a/tests/tests-line.c b/tests/tests-line.c
index 8411132..b453dad 100644
--- a/tests/tests-line.c
+++ b/tests/tests-line.c
@@ -504,6 +504,7 @@ GPIOD_TEST_CASE(misc_flags, 0, { 8 })
 	g_assert_false(gpiod_line_is_used(line));
 	g_assert_false(gpiod_line_is_open_drain(line));
 	g_assert_false(gpiod_line_is_open_source(line));
+	g_assert_cmpint(gpiod_line_bias(line), ==, GPIOD_LINE_BIAS_AS_IS);
 
 	config.request_type = GPIOD_LINE_REQUEST_DIRECTION_OUTPUT;
 	config.consumer = GPIOD_TEST_CONSUMER;
@@ -515,6 +516,7 @@ GPIOD_TEST_CASE(misc_flags, 0, { 8 })
 	g_assert_true(gpiod_line_is_used(line));
 	g_assert_true(gpiod_line_is_open_drain(line));
 	g_assert_false(gpiod_line_is_open_source(line));
+	g_assert_cmpint(gpiod_line_bias(line), ==, GPIOD_LINE_BIAS_AS_IS);
 	g_assert_cmpint(gpiod_line_direction(line), ==,
 			GPIOD_LINE_DIRECTION_OUTPUT);
 
@@ -528,8 +530,11 @@ GPIOD_TEST_CASE(misc_flags, 0, { 8 })
 	g_assert_true(gpiod_line_is_used(line));
 	g_assert_false(gpiod_line_is_open_drain(line));
 	g_assert_true(gpiod_line_is_open_source(line));
+	g_assert_cmpint(gpiod_line_bias(line), ==, GPIOD_LINE_BIAS_AS_IS);
 	g_assert_cmpint(gpiod_line_direction(line), ==,
 			GPIOD_LINE_DIRECTION_OUTPUT);
+
+	gpiod_line_release(line);
 }
 
 GPIOD_TEST_CASE(misc_flags_work_together, 0, { 8 })
@@ -563,6 +568,7 @@ GPIOD_TEST_CASE(misc_flags_work_together, 0, { 8 })
 	g_assert_true(gpiod_line_is_used(line));
 	g_assert_true(gpiod_line_is_open_drain(line));
 	g_assert_false(gpiod_line_is_open_source(line));
+	g_assert_cmpint(gpiod_line_bias(line), ==, GPIOD_LINE_BIAS_AS_IS);
 	g_assert_cmpint(gpiod_line_active_state(line), ==,
 			GPIOD_LINE_ACTIVE_STATE_LOW);
 	g_assert_cmpint(gpiod_line_direction(line), ==,
@@ -579,8 +585,59 @@ GPIOD_TEST_CASE(misc_flags_work_together, 0, { 8 })
 	g_assert_true(gpiod_line_is_used(line));
 	g_assert_false(gpiod_line_is_open_drain(line));
 	g_assert_true(gpiod_line_is_open_source(line));
+	g_assert_cmpint(gpiod_line_bias(line), ==, GPIOD_LINE_BIAS_AS_IS);
 	g_assert_cmpint(gpiod_line_active_state(line), ==,
 			GPIOD_LINE_ACTIVE_STATE_LOW);
+
+	gpiod_line_release(line);
+
+	/*
+	 * Verify that pull-up/down flags work together
+	 * with active_low.
+	 */
+
+	config.request_type = GPIOD_LINE_REQUEST_DIRECTION_INPUT;
+	config.flags = GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_DOWN |
+		       GPIOD_LINE_REQUEST_FLAG_ACTIVE_LOW;
+
+	ret = gpiod_line_request(line, &config, 0);
+	g_assert_cmpint(ret, ==, 0);
+
+	g_assert_true(gpiod_line_is_used(line));
+	g_assert_false(gpiod_line_is_open_drain(line));
+	g_assert_false(gpiod_line_is_open_source(line));
+	g_assert_cmpint(gpiod_line_bias(line), ==, GPIOD_LINE_BIAS_PULL_DOWN);
+	g_assert_cmpint(gpiod_line_active_state(line), ==,
+			GPIOD_LINE_ACTIVE_STATE_LOW);
+	g_assert_cmpint(gpiod_line_direction(line), ==,
+			GPIOD_LINE_DIRECTION_INPUT);
+
+	ret = gpiod_line_get_value(line);
+	g_assert_cmpint(ret, ==, 1);
+	g_assert_cmpint(errno, ==, 0);
+
+	gpiod_line_release(line);
+
+	config.flags = GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_UP |
+		       GPIOD_LINE_REQUEST_FLAG_ACTIVE_LOW;
+
+	ret = gpiod_line_request(line, &config, 0);
+	g_assert_cmpint(ret, ==, 0);
+
+	g_assert_true(gpiod_line_is_used(line));
+	g_assert_false(gpiod_line_is_open_drain(line));
+	g_assert_false(gpiod_line_is_open_source(line));
+	g_assert_cmpint(gpiod_line_bias(line), ==, GPIOD_LINE_BIAS_PULL_UP);
+	g_assert_cmpint(gpiod_line_active_state(line), ==,
+			GPIOD_LINE_ACTIVE_STATE_LOW);
+	g_assert_cmpint(gpiod_line_direction(line), ==,
+			GPIOD_LINE_DIRECTION_INPUT);
+
+	ret = gpiod_line_get_value(line);
+	g_assert_cmpint(ret, ==, 0);
+	g_assert_cmpint(errno, ==, 0);
+
+	gpiod_line_release(line);
 }
 
 GPIOD_TEST_CASE(open_source_open_drain_input_mode, 0, { 8 })
@@ -629,6 +686,47 @@ GPIOD_TEST_CASE(open_source_open_drain_simultaneously, 0, { 8 })
 	g_assert_cmpint(errno, ==, EINVAL);
 }
 
+GPIOD_TEST_CASE(multiple_bias_flags, 0, { 8 })
+{
+	g_autoptr(gpiod_chip_struct) chip = NULL;
+	struct gpiod_line *line;
+	gint ret;
+
+	chip = gpiod_chip_open(gpiod_test_chip_path(0));
+	g_assert_nonnull(chip);
+	gpiod_test_return_if_failed();
+
+	line = gpiod_chip_get_line(chip, 2);
+	g_assert_nonnull(line);
+	gpiod_test_return_if_failed();
+
+	ret = gpiod_line_request_input_flags(line, GPIOD_TEST_CONSUMER,
+					GPIOD_LINE_REQUEST_FLAG_BIAS_DISABLE |
+					GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_DOWN);
+	g_assert_cmpint(ret, ==, -1);
+	g_assert_cmpint(errno, ==, EINVAL);
+
+	ret = gpiod_line_request_input_flags(line, GPIOD_TEST_CONSUMER,
+					GPIOD_LINE_REQUEST_FLAG_BIAS_DISABLE |
+					GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_UP);
+	g_assert_cmpint(ret, ==, -1);
+	g_assert_cmpint(errno, ==, EINVAL);
+
+	ret = gpiod_line_request_input_flags(line, GPIOD_TEST_CONSUMER,
+					GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_DOWN |
+					GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_UP);
+	g_assert_cmpint(ret, ==, -1);
+	g_assert_cmpint(errno, ==, EINVAL);
+
+	ret = gpiod_line_request_input_flags(line, GPIOD_TEST_CONSUMER,
+					GPIOD_LINE_REQUEST_FLAG_BIAS_DISABLE |
+					GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_DOWN |
+					GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_UP);
+	g_assert_cmpint(ret, ==, -1);
+	g_assert_cmpint(errno, ==, EINVAL);
+}
+
+
 /* Verify that the reference counting of the line fd handle works correctly. */
 GPIOD_TEST_CASE(release_one_use_another, 0, { 8 })
 {
-- 
2.24.0

