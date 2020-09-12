Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8B9426773A
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Sep 2020 04:23:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725768AbgILCXk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Sep 2020 22:23:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725765AbgILCXj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Sep 2020 22:23:39 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B7BAC061573
        for <linux-gpio@vger.kernel.org>; Fri, 11 Sep 2020 19:23:39 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id l191so7766970pgd.5
        for <linux-gpio@vger.kernel.org>; Fri, 11 Sep 2020 19:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=18Dm2iojGfO5+OYo1XLG6bTBD1jGVlwz09PNEWkVrDA=;
        b=XVngAXHKGMNEfxNcidcOjpZ6lmFxk0Qw063LZUvj7mlbO4Yjm5WsQLVq6IiO+To81S
         y4shgt/XQ2oCnV3V7LDcQf3dLZt7Pc7zewjQ0Uph2zshqQ84V7OGDp5/JUxYAvNdoEJR
         n0yg41zeG2vgz6W1Qz3/5MhSt4Vr3xw8KwHbA1rbJ+9DiNDDlov38yYAjd9tBvATisf3
         oBLdaw+KZvS1kVrwNnjLacqiSNyjVVOh/RRy2D2R3Hu/ofGiv66KKlRwuZQ3eL1Um6sb
         tICCDRyjTrDQ12ekmUbm5W20Xhuf0vPkNR2cXyyQaOIE1A07vyJ2nkocYoyCU6MEqX1Y
         hFXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=18Dm2iojGfO5+OYo1XLG6bTBD1jGVlwz09PNEWkVrDA=;
        b=P6Jnds7tNhpfpUhAj9vfr+jyEO5F9iRIKpQhHZdoTIbTwBPYshwWvQuv1wbIhgU++c
         q3kJf+/K7dSa7/h6YAlLBGkucyZYxzM9fYODi3JJu+Qrw2H/xjS8LEgaW21LVvgs3Cnm
         t/dFHJ1zXBtIDZTe37XTq/pplUzt/pBd/dE3w92rDvbFZeTfBBbUX4q3kIjyymUKFPQZ
         uo8ojoRH84sW30ZuS7/wiUmoyxEvi2sR8nYWazko03y8qfWwdI7v1GRB5QbIWQ0iZGwj
         jTU19C6bAboaBZ8se2AFC5AqaWaDm32SLt9bpTmB8MwL5qSuQHttmbtIH9jmNNa2J/cg
         tGoA==
X-Gm-Message-State: AOAM531dFHNkrl/WTdisbfGkQ3+DitdmIYewgfPqQ0sVO7fsFWUtgfbA
        aZ3hcWQ0KYWdh1Yx/EE37MB1enfx4Os=
X-Google-Smtp-Source: ABdhPJwNM1ZJXDBuEBzPR2GYGcYnlga318GHO+qDohes4uFsqeTOLWkKaDWn8tlLXYC7YeevXUpHdg==
X-Received: by 2002:a62:52ce:0:b029:13e:50c8:499b with SMTP id g197-20020a6252ce0000b029013e50c8499bmr4691378pfb.14.1599877418425;
        Fri, 11 Sep 2020 19:23:38 -0700 (PDT)
Received: from sol.lan (106-69-184-100.dyn.iinet.net.au. [106.69.184.100])
        by smtp.gmail.com with ESMTPSA id g21sm3545574pfh.30.2020.09.11.19.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2020 19:23:37 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH 1/2] tests: event: reading test coverage extended to cover reading a subset of available events
Date:   Sat, 12 Sep 2020 10:22:47 +0800
Message-Id: <20200912022248.16240-2-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200912022248.16240-1-warthog618@gmail.com>
References: <20200912022248.16240-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add tests for gpiod_line_event_read(), including reading multiple
entries from the kernel event kfifo, and extend the existing
read_multiple_event tests to read a subset of the available events as
well as all the available events.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---

I have removed the usleep()s between setting the pulls on the mockup as
I don't believe they are necessary.
Setting the pulls results in serial writes to the debugfs, which the
kernel should be able to deal with.
Any queuing in the kernel that results should come out in the wash.

 tests/tests-event.c | 144 ++++++++++++++++++++++++++++++++++++++------
 1 file changed, 124 insertions(+), 20 deletions(-)

diff --git a/tests/tests-event.c b/tests/tests-event.c
index e323060..c1f73d4 100644
--- a/tests/tests-event.c
+++ b/tests/tests-event.c
@@ -663,13 +663,74 @@ GPIOD_TEST_CASE(invalid_fd, 0, { 8 })
 	g_assert_cmpint(errno, ==, EINVAL);
 }
 
+GPIOD_TEST_CASE(read_event, 0, { 8 })
+{
+	g_autoptr(gpiod_chip_struct) chip = NULL;
+	struct timespec ts = { 1, 0 };
+	struct gpiod_line_event ev;
+	struct gpiod_line *line;
+	gint ret;
+	unsigned int i;
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
+	/* generate multiple events */
+	for (i = 0; i < 3; i++)
+		gpiod_test_chip_set_pull(0, 7, i & 1);
+
+	/* read them individually... */
+	ret = gpiod_line_event_wait(line, &ts);
+	g_assert_cmpint(ret, ==, 1);
+	if (!ret)
+		return;
+
+	ret = gpiod_line_event_read(line, &ev);
+	g_assert_cmpint(ret, ==, 0);
+
+	g_assert_cmpint(ev.event_type, ==, GPIOD_LINE_EVENT_FALLING_EDGE);
+
+	ret = gpiod_line_event_wait(line, &ts);
+	g_assert_cmpint(ret, ==, 1);
+	if (!ret)
+		return;
+
+	ret = gpiod_line_event_read(line, &ev);
+	g_assert_cmpint(ret, ==, 0);
+
+	g_assert_cmpint(ev.event_type, ==, GPIOD_LINE_EVENT_RISING_EDGE);
+
+	ret = gpiod_line_event_wait(line, &ts);
+	g_assert_cmpint(ret, ==, 1);
+	if (!ret)
+		return;
+
+	ret = gpiod_line_event_read(line, &ev);
+	g_assert_cmpint(ret, ==, 0);
+
+	g_assert_cmpint(ev.event_type, ==, GPIOD_LINE_EVENT_FALLING_EDGE);
+
+	ret = gpiod_line_event_wait(line, &ts);
+	g_assert_cmpint(ret, ==, 0);
+}
+
 GPIOD_TEST_CASE(read_multiple_events, 0, { 8 })
 {
 	g_autoptr(gpiod_chip_struct) chip = NULL;
-	struct gpiod_line_event events[3];
+	struct gpiod_line_event events[5];
 	struct timespec ts = { 1, 0 };
 	struct gpiod_line *line;
 	gint ret;
+	unsigned int i;
 
 	chip = gpiod_chip_open(gpiod_test_chip_path(0));
 	g_assert_nonnull(chip);
@@ -682,22 +743,16 @@ GPIOD_TEST_CASE(read_multiple_events, 0, { 8 })
 	ret = gpiod_line_request_both_edges_events(line, GPIOD_TEST_CONSUMER);
 	g_assert_cmpint(ret, ==, 0);
 
-	gpiod_test_chip_set_pull(0, 4, 1);
-	/*
-	 * We sleep for a short period of time here and in other test cases
-	 * for multiple events to let the kernel service each simulated
-	 * interrupt. Otherwise we'd risk triggering an interrupt while the
-	 * previous one is still being handled.
-	 */
-	usleep(10000);
-	gpiod_test_chip_set_pull(0, 4, 0);
-	usleep(10000);
-	gpiod_test_chip_set_pull(0, 4, 1);
-	usleep(10000);
+	/* generate multiple events */
+	for (i = 0; i < 7; i++)
+		gpiod_test_chip_set_pull(0, 4, !(i & 1));
 
 	ret = gpiod_line_event_wait(line, &ts);
 	g_assert_cmpint(ret, ==, 1);
+	if (!ret)
+		return;
 
+	/* read a chunk */
 	ret = gpiod_line_event_read_multiple(line, events, 3);
 	g_assert_cmpint(ret, ==, 3);
 
@@ -707,15 +762,40 @@ GPIOD_TEST_CASE(read_multiple_events, 0, { 8 })
 			GPIOD_LINE_EVENT_FALLING_EDGE);
 	g_assert_cmpint(events[2].event_type, ==,
 			GPIOD_LINE_EVENT_RISING_EDGE);
+
+	ret = gpiod_line_event_wait(line, &ts);
+	g_assert_cmpint(ret, ==, 1);
+	if (!ret)
+		return;
+
+	/*
+	 * read the remainder
+	 * - note the attempt to read more than are available
+	 */
+	ret = gpiod_line_event_read_multiple(line, events, 5);
+	g_assert_cmpint(ret, ==, 4);
+
+	g_assert_cmpint(events[0].event_type, ==,
+			GPIOD_LINE_EVENT_FALLING_EDGE);
+	g_assert_cmpint(events[1].event_type, ==,
+			GPIOD_LINE_EVENT_RISING_EDGE);
+	g_assert_cmpint(events[2].event_type, ==,
+			GPIOD_LINE_EVENT_FALLING_EDGE);
+	g_assert_cmpint(events[3].event_type, ==,
+			GPIOD_LINE_EVENT_RISING_EDGE);
+
+	ret = gpiod_line_event_wait(line, &ts);
+	g_assert_cmpint(ret, ==, 0);
 }
 
 GPIOD_TEST_CASE(read_multiple_events_fd, 0, { 8 })
 {
 	g_autoptr(gpiod_chip_struct) chip = NULL;
-	struct gpiod_line_event events[3];
+	struct gpiod_line_event events[5];
 	struct timespec ts = { 1, 0 };
 	struct gpiod_line *line;
 	gint ret, fd;
+	unsigned int i;
 
 	chip = gpiod_chip_open(gpiod_test_chip_path(0));
 	g_assert_nonnull(chip);
@@ -728,19 +808,19 @@ GPIOD_TEST_CASE(read_multiple_events_fd, 0, { 8 })
 	ret = gpiod_line_request_both_edges_events(line, GPIOD_TEST_CONSUMER);
 	g_assert_cmpint(ret, ==, 0);
 
-	gpiod_test_chip_set_pull(0, 4, 1);
-	usleep(10000);
-	gpiod_test_chip_set_pull(0, 4, 0);
-	usleep(10000);
-	gpiod_test_chip_set_pull(0, 4, 1);
-	usleep(10000);
+	/* generate multiple events */
+	for (i = 0; i < 7; i++)
+		gpiod_test_chip_set_pull(0, 4, !(i & 1));
 
 	ret = gpiod_line_event_wait(line, &ts);
 	g_assert_cmpint(ret, ==, 1);
+	if (!ret)
+		return;
 
 	fd = gpiod_line_event_get_fd(line);
 	g_assert_cmpint(fd, >=, 0);
 
+	/* read a chunk */
 	ret = gpiod_line_event_read_fd_multiple(fd, events, 3);
 	g_assert_cmpint(ret, ==, 3);
 
@@ -750,4 +830,28 @@ GPIOD_TEST_CASE(read_multiple_events_fd, 0, { 8 })
 			GPIOD_LINE_EVENT_FALLING_EDGE);
 	g_assert_cmpint(events[2].event_type, ==,
 			GPIOD_LINE_EVENT_RISING_EDGE);
+
+	ret = gpiod_line_event_wait(line, &ts);
+	g_assert_cmpint(ret, ==, 1);
+	if (!ret)
+		return;
+
+	/*
+	 * read the remainder
+	 * - note the attempt to read more than are available
+	 */
+	ret = gpiod_line_event_read_fd_multiple(fd, events, 5);
+	g_assert_cmpint(ret, ==, 4);
+
+	g_assert_cmpint(events[0].event_type, ==,
+			GPIOD_LINE_EVENT_FALLING_EDGE);
+	g_assert_cmpint(events[1].event_type, ==,
+			GPIOD_LINE_EVENT_RISING_EDGE);
+	g_assert_cmpint(events[2].event_type, ==,
+			GPIOD_LINE_EVENT_FALLING_EDGE);
+	g_assert_cmpint(events[3].event_type, ==,
+			GPIOD_LINE_EVENT_RISING_EDGE);
+
+	ret = gpiod_line_event_wait(line, &ts);
+	g_assert_cmpint(ret, ==, 0);
 }
-- 
2.28.0

