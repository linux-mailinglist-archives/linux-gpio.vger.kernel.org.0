Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 20B42FE05E
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Nov 2019 15:44:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727576AbfKOOou (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 15 Nov 2019 09:44:50 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:43433 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727556AbfKOOou (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 15 Nov 2019 09:44:50 -0500
Received: by mail-pl1-f193.google.com with SMTP id a18so4795426plm.10
        for <linux-gpio@vger.kernel.org>; Fri, 15 Nov 2019 06:44:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SnaiY0S+/8nKSFFBV00qiyMZTLj4SC/M1Y1RlYUZJAg=;
        b=b7RPzPRuouPfe5Vz2cPz2cCuSMMOOXI3FRhXlTHrEccQiWzFeABGGTHgQyV96qEs6D
         IjHxSLZ6MDBXnQvD7TCNCbB9Htcg6/N4cflkuOK/88G+8w+j4ZF2LReMqAMnFYV49zOi
         1s3zEq75quRWBOS8PNwKmlqAwv6WEPWhAAwujYDeuGExA6+buXuZBIBxS3Lj+7mQd5gs
         7LLL0veyyaqsQp+sE4vR1Rr5x96h9nIjLT4OZp2XpuDng7DxRlpMrTlHswozFOX9zmYU
         2iafUPbAOa++C5n4DFYj1vGIjC5MIFSEZudkMVALtQeK3GtKBGai/nnY7jyr8maHU6Gs
         TuJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SnaiY0S+/8nKSFFBV00qiyMZTLj4SC/M1Y1RlYUZJAg=;
        b=LSwjtdMg9a+tl1nu3OgePGukbdwhV/XQMEcHASKOYlq9ZQFe7qfkwhWaCVoVI4Xw5U
         rX0Xt2BEkh3eV/ZHx8VflarrxYwL/qibBH+WleaumJAzw4TH0gDQ1C3qllg5mIMWLenM
         HQx+uxDt6srKesEiJt/aMAy6k6b/NNUljsE16Oj5MxMSuIGun4m9V0iNmVCWCXyA+OAk
         jxJC5SP1dd4xPhvUHtJE4yYwzVmn/9pb3FZ1XcxVEQSQn6oDP3LKTKJc4FvmX6etpZMa
         +GwNhFu5PPwsVUMr3D0HFmwSyxhbAKjDhgug7nAT4d50ZjETAQK0QlbcBtiSEDEhN+xr
         SmXA==
X-Gm-Message-State: APjAAAXsi/giJE8+Ltt/YRN//ICSDzyQq573otD9maID0RUiLkl/fV22
        11IaGdwwLB5mN86Porp/0D8ZoTvXfD8=
X-Google-Smtp-Source: APXvYqy3YGs3ScE8gJYWj6kFRyPUyRV7vRLkQqvgu3B/s105QHGGQ1VtEVTBhktqY0IPyDF6Lr6Fmw==
X-Received: by 2002:a17:90a:7784:: with SMTP id v4mr20559928pjk.74.1573829089150;
        Fri, 15 Nov 2019 06:44:49 -0800 (PST)
Received: from sol.lan (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id y123sm10517726pfg.64.2019.11.15.06.44.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2019 06:44:48 -0800 (PST)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod] [PATCH 04/19] tests: add tests for bias flags
Date:   Fri, 15 Nov 2019 22:43:40 +0800
Message-Id: <20191115144355.975-5-warthog618@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191115144355.975-1-warthog618@gmail.com>
References: <20191115144355.975-1-warthog618@gmail.com>
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
index c1e1ca6..da70587 100644
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
+				false, GPIOD_CTXLESS_FLAG_BIAS_PULL_DOWN,
+				GPIOD_TEST_CONSUMER);
+	g_assert_cmpint(ret, ==, 0);
+
+	ret = gpiod_ctxless_get_value_ext(gpiod_test_chip_name(0), 3,
+				false, GPIOD_CTXLESS_FLAG_BIAS_PULL_UP,
+				GPIOD_TEST_CONSUMER);
+	g_assert_cmpint(ret, ==, 1);
+
+	ret = gpiod_ctxless_get_value_ext(gpiod_test_chip_name(0), 3,
+				true, GPIOD_CTXLESS_FLAG_BIAS_PULL_DOWN,
+				GPIOD_TEST_CONSUMER);
+	g_assert_cmpint(ret, ==, 1);
+
+	ret = gpiod_ctxless_get_value_ext(gpiod_test_chip_name(0), 3,
+				true, GPIOD_CTXLESS_FLAG_BIAS_PULL_UP,
+				GPIOD_TEST_CONSUMER);
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
+			false, 0, GPIOD_TEST_CONSUMER,
+			set_value_check_hi, NULL);
+	gpiod_test_return_if_failed();
+	g_assert_cmpint(ret, ==, 0);
+	g_assert_cmpint(gpiod_test_chip_get_value(0, 3), ==, 0);
+
+	// test drive flags by checking that sets are caught by emulation
+	ret = gpiod_ctxless_set_value_ext(gpiod_test_chip_name(0), 3, 1,
+			false, GPIOD_CTXLESS_FLAG_OPEN_DRAIN,
+			GPIOD_TEST_CONSUMER, set_value_check_lo, NULL);
+	gpiod_test_return_if_failed();
+	g_assert_cmpint(ret, ==, 0);
+	g_assert_cmpint(gpiod_test_chip_get_value(0, 3), ==, 0);
+
+	gpiod_test_chip_set_pull(0, 3, 1);
+	ret = gpiod_ctxless_set_value_ext(gpiod_test_chip_name(0), 3, 0,
+			false, GPIOD_CTXLESS_FLAG_OPEN_SOURCE,
+			GPIOD_TEST_CONSUMER, set_value_check_hi, NULL);
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
index 4792211..b4bef1a 100644
--- a/tests/tests-line.c
+++ b/tests/tests-line.c
@@ -451,6 +451,7 @@ GPIOD_TEST_CASE(misc_flags, 0, { 8 })
 	g_assert_false(gpiod_line_is_used(line));
 	g_assert_false(gpiod_line_is_open_drain(line));
 	g_assert_false(gpiod_line_is_open_source(line));
+	g_assert_cmpint(gpiod_line_bias(line), ==, GPIOD_LINE_BIAS_AS_IS);
 
 	config.request_type = GPIOD_LINE_REQUEST_DIRECTION_OUTPUT;
 	config.consumer = GPIOD_TEST_CONSUMER;
@@ -462,6 +463,7 @@ GPIOD_TEST_CASE(misc_flags, 0, { 8 })
 	g_assert_true(gpiod_line_is_used(line));
 	g_assert_true(gpiod_line_is_open_drain(line));
 	g_assert_false(gpiod_line_is_open_source(line));
+	g_assert_cmpint(gpiod_line_bias(line), ==, GPIOD_LINE_BIAS_AS_IS);
 	g_assert_cmpint(gpiod_line_direction(line), ==,
 			GPIOD_LINE_DIRECTION_OUTPUT);
 
@@ -475,8 +477,11 @@ GPIOD_TEST_CASE(misc_flags, 0, { 8 })
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
@@ -510,6 +515,7 @@ GPIOD_TEST_CASE(misc_flags_work_together, 0, { 8 })
 	g_assert_true(gpiod_line_is_used(line));
 	g_assert_true(gpiod_line_is_open_drain(line));
 	g_assert_false(gpiod_line_is_open_source(line));
+	g_assert_cmpint(gpiod_line_bias(line), ==, GPIOD_LINE_BIAS_AS_IS);
 	g_assert_cmpint(gpiod_line_active_state(line), ==,
 			GPIOD_LINE_ACTIVE_STATE_LOW);
 	g_assert_cmpint(gpiod_line_direction(line), ==,
@@ -526,8 +532,59 @@ GPIOD_TEST_CASE(misc_flags_work_together, 0, { 8 })
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
@@ -576,6 +633,47 @@ GPIOD_TEST_CASE(open_source_open_drain_simultaneously, 0, { 8 })
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

