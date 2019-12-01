Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE5FC10E037
	for <lists+linux-gpio@lfdr.de>; Sun,  1 Dec 2019 04:24:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727169AbfLADYx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 30 Nov 2019 22:24:53 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:42191 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727012AbfLADYw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 30 Nov 2019 22:24:52 -0500
Received: by mail-pj1-f67.google.com with SMTP id o11so620280pjp.9
        for <linux-gpio@vger.kernel.org>; Sat, 30 Nov 2019 19:24:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iVqcQMplFc4ZC2IjUNHGhxSD+qmBqZm8oWSDiZbINK4=;
        b=YgjBlLOJ1ij1aN54aVVWM0c/PPpLcb+VB6N5LifKxjSK2Ju3kFHsKHSjvkfSLPDB6+
         CcOZAY+PcWqkc6AHKOeY8CxwV4N8KXcPebGQjt8XApCVcKnt5L+K7CMCGautvq5OkUbV
         KgICqmFKJJ7sCAbgz29p+PcoQYcw9iQm373DkGaceoX2UWmKoV/hXAaIQEu+f4EyYEhQ
         hECh06m/D6zLe5oLcja+2hcxX/qYTZBCtS1MqHdfPE27WciKchHGcgDU0PD+9wJpDctg
         Jv6xEhjj/Ddz4DPNGyyiLmRnJU/lo+zoUA4mpFE5jiE70QexwdDUaCMbZkFPui2QGALZ
         Vp0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iVqcQMplFc4ZC2IjUNHGhxSD+qmBqZm8oWSDiZbINK4=;
        b=STfEReumR+TN0+EJJZymgUqOOqklIXeAFnSinej+jS0tXFF+G4tE1IAoWESmYL1QCt
         LP68+e/mUdXT5AGC77QwQJ1QoLQ5iGRa1vmZc8pmz0EZQb2QOhk+GVZqqJPTdqkgc8+K
         v06y2qOCYQET3eLDpxoYKDD8GRI8DhQagm2i9W9b6gy8HP3dWbk8DhIxXlSt8f1Qc/Vt
         RAqFkNBwc+hUTn7Qo7sXPVvvs+q6aFUK7VO4TY09vsV9VQO1YAdGRljaI4c7my4Roilr
         8pFSbwXTbGi9yvu8ydsmlFPxbkoLiIScNfRj9dT6PZOY3ik3R9rk4QuvpTzDjA762ENq
         QJpw==
X-Gm-Message-State: APjAAAUqAtjJqhD0lTdadAnHVU+BIosO2GBZ6nm2pyAftVFhHUu43Ru0
        IBidY/CGmMovYGiN9HrLvH0eX4ac
X-Google-Smtp-Source: APXvYqw4hRA9J8pnpXwUPMqrK1al3UmXLOJk0doFriTko3K1u19VToMra4tAGPoKOj7iDEAd/fasVA==
X-Received: by 2002:a17:90b:d85:: with SMTP id bg5mr1662909pjb.99.1575170691061;
        Sat, 30 Nov 2019 19:24:51 -0800 (PST)
Received: from sol.lan (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id z1sm30307655pfk.61.2019.11.30.19.24.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Nov 2019 19:24:50 -0800 (PST)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH v4 02/20] tests: add tests for bias flags
Date:   Sun,  1 Dec 2019 11:23:49 +0800
Message-Id: <20191201032407.23589-3-warthog618@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191201032407.23589-1-warthog618@gmail.com>
References: <20191201032407.23589-1-warthog618@gmail.com>
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
 tests/gpiod-test.c    |   4 +-
 tests/tests-ctxless.c |  64 +++++++++++++++++++++-
 tests/tests-event.c   | 120 ++++++++++++++++++++++++++++++++++++++++++
 tests/tests-line.c    |  98 ++++++++++++++++++++++++++++++++++
 4 files changed, 282 insertions(+), 4 deletions(-)

diff --git a/tests/gpiod-test.c b/tests/gpiod-test.c
index c970cfd..72b228f 100644
--- a/tests/gpiod-test.c
+++ b/tests/gpiod-test.c
@@ -16,8 +16,8 @@
 #include "gpiod-test.h"
 
 #define MIN_KERNEL_MAJOR	5
-#define MIN_KERNEL_MINOR	2
-#define MIN_KERNEL_RELEASE	11
+#define MIN_KERNEL_MINOR	5
+#define MIN_KERNEL_RELEASE	0
 #define MIN_KERNEL_VERSION	KERNEL_VERSION(MIN_KERNEL_MAJOR, \
 					       MIN_KERNEL_MINOR, \
 					       MIN_KERNEL_RELEASE)
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

