Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C334109007
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Nov 2019 15:32:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728150AbfKYOcr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 Nov 2019 09:32:47 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:44825 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728026AbfKYOcr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 Nov 2019 09:32:47 -0500
Received: by mail-pg1-f193.google.com with SMTP id e6so7270623pgi.11
        for <linux-gpio@vger.kernel.org>; Mon, 25 Nov 2019 06:32:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8hzek6rlvXZA0nYdWRLlvVYlpPAvoR4c7LCStLzj38o=;
        b=VnwqsUCHGzTqtfQPuNc9cNXiJPyqJUqcWyvMhgpBg6QLOkRIFWm7AeFDy/2s6diZCm
         VmG6fvbMQegNImkw3HKliDgqEqYMGsut6Vq0YrIby/7gg4c4qnbtBI33nbiWFR8nKcA3
         ya90YYMQ82AwGniwkmo6Stm1zG9rHfCEAxA39i3RBXBsDwTIBnYSxoRSVmvUT68jsc/n
         q2jnQv6cfjKkErM4x4/NVOm4AVfjyG3w4ZnI0W6ynZFZTnabD+v8qq7jI8Fqh/I1GCh9
         X1X6tLo7Iur3jvPwhrGT09eoZv4YL30ygWW94b/8pI6mXEUd5V4pbvoEWA8bX7UeoRej
         05oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8hzek6rlvXZA0nYdWRLlvVYlpPAvoR4c7LCStLzj38o=;
        b=muWi3r/NdW/+Oe3gt01o0vwkCptk5S/pdSijUNh5k+8YNRUTBTeRqwZlzqOPHVhvoh
         4H9+niJ3owxr3kJBpFkw0cXHFOpqIpf722CEE864GxecFLLO0o1lp+L41AxVIs1Mu/QJ
         IxGKekjtNyadaTJcIA9wLWwAJNCk4W3CwSC0dNZSYvDCt4a3KCrvC+s02hOsJ5IqFIJC
         sDY9fZMuo+ku2tXfmb61sAWEg5AyWO+nR/MZGVcSs9gIhp/PIPgqAF8zxwUKOC9DXtQT
         FxHZHpvROvjfo0/qBRiC2f/YSVhKXUN6zxR4mLqN224qoZMUI8gxIUHIHp+yCU0EraP3
         3otg==
X-Gm-Message-State: APjAAAVOBa9XII4rWvBbJUVOymQsdRQVWW4g5yP13ZlH569I82/qZiA+
        zRkduPw3Q6oQk4hP8gkPIcU5Vp+GE8hpXQ==
X-Google-Smtp-Source: APXvYqzTVexDGYt90+C+0L1nO9hwSfqkzIgVAveLRa6/Jg+XFdkL3M4fbWz/mJASxnDXe2PVjlHAXg==
X-Received: by 2002:a63:1563:: with SMTP id 35mr18750936pgv.140.1574692362620;
        Mon, 25 Nov 2019 06:32:42 -0800 (PST)
Received: from sol.lan (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id i5sm8642100pfo.52.2019.11.25.06.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2019 06:32:42 -0800 (PST)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH v3 02/14] tests: add tests for bias flags
Date:   Mon, 25 Nov 2019 22:31:45 +0800
Message-Id: <20191125143157.26154-3-warthog618@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191125143157.26154-1-warthog618@gmail.com>
References: <20191125143157.26154-1-warthog618@gmail.com>
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
index 205c622..4bf7c02 100644
--- a/tests/tests-line.c
+++ b/tests/tests-line.c
@@ -502,6 +502,7 @@ GPIOD_TEST_CASE(misc_flags, 0, { 8 })
 	g_assert_false(gpiod_line_is_used(line));
 	g_assert_false(gpiod_line_is_open_drain(line));
 	g_assert_false(gpiod_line_is_open_source(line));
+	g_assert_cmpint(gpiod_line_bias(line), ==, GPIOD_LINE_BIAS_AS_IS);
 
 	config.request_type = GPIOD_LINE_REQUEST_DIRECTION_OUTPUT;
 	config.consumer = GPIOD_TEST_CONSUMER;
@@ -513,6 +514,7 @@ GPIOD_TEST_CASE(misc_flags, 0, { 8 })
 	g_assert_true(gpiod_line_is_used(line));
 	g_assert_true(gpiod_line_is_open_drain(line));
 	g_assert_false(gpiod_line_is_open_source(line));
+	g_assert_cmpint(gpiod_line_bias(line), ==, GPIOD_LINE_BIAS_AS_IS);
 	g_assert_cmpint(gpiod_line_direction(line), ==,
 			GPIOD_LINE_DIRECTION_OUTPUT);
 
@@ -526,8 +528,11 @@ GPIOD_TEST_CASE(misc_flags, 0, { 8 })
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
@@ -561,6 +566,7 @@ GPIOD_TEST_CASE(misc_flags_work_together, 0, { 8 })
 	g_assert_true(gpiod_line_is_used(line));
 	g_assert_true(gpiod_line_is_open_drain(line));
 	g_assert_false(gpiod_line_is_open_source(line));
+	g_assert_cmpint(gpiod_line_bias(line), ==, GPIOD_LINE_BIAS_AS_IS);
 	g_assert_cmpint(gpiod_line_active_state(line), ==,
 			GPIOD_LINE_ACTIVE_STATE_LOW);
 	g_assert_cmpint(gpiod_line_direction(line), ==,
@@ -577,8 +583,59 @@ GPIOD_TEST_CASE(misc_flags_work_together, 0, { 8 })
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
@@ -627,6 +684,47 @@ GPIOD_TEST_CASE(open_source_open_drain_simultaneously, 0, { 8 })
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

