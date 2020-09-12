Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 899D72678C7
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Sep 2020 10:11:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725805AbgILILa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 12 Sep 2020 04:11:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725839AbgILIL3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 12 Sep 2020 04:11:29 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E69DC061573
        for <linux-gpio@vger.kernel.org>; Sat, 12 Sep 2020 01:11:29 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id v196so9054546pfc.1
        for <linux-gpio@vger.kernel.org>; Sat, 12 Sep 2020 01:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BBuj/YWiYFbP8Cl9d2OVz7EzKNq/E+0FspPe2Bq1qwI=;
        b=HYofGFlE+Hdl7PzsYqOz7u8jjW4CsmQ9AYXrSIf99QnhX6qXm6BXy0zvPfHbNyRDnq
         mz0tmeQ6D9pRUfgxdMLuUe277EvQO9p3O8hAbwQ3I9/iGmN96/4g4Uz7vQhXrpTMUcgy
         I6xvyiJmMJkHQ3L2q02Ka3qPBN48IDOs/96f8OBMbUxcB7A//Qd+McCl5HpntCjGDKof
         VBBKYdG1zC7QfNGHqHb6vIXtcnAuDLITskMkf+4IMJ20dBkIKOII31l4D+b7lwhuHgFA
         CZnXipK+L1cabXoX2UyJsjnBTzEYKp7NeW1EwduCYR7NM3lpXd/Vk332H/r0F77apap+
         +MoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BBuj/YWiYFbP8Cl9d2OVz7EzKNq/E+0FspPe2Bq1qwI=;
        b=oNzK86ly3wPtx7cxlg0/lgLJAMudZUhrD6iTIZomE1Gl36b7WFdUS/QC7LDoIh+JlK
         kYBiPd1QrerJ2vrz0bKzVGMCoJnsiebBWBKGU/JNO8Bjbri7u8nyXgYzRyWkpt/i58G3
         pQfft2fzvpYmWKv4UyOj0OX+nsKA7Ln2DVKyxMeQoarpm6gTzV/NBHq4we2Ckfdclbrz
         8NJ3Q4Ic5FSV4dH8qJ7kNI3Xb1erPPawIOJqY+h9hrOjeu8jTf9zrPVGz3OypWcBrOli
         GUB7K3ymdyFasgvYCzLuDaysaZadp7VVT2P0RDnRomNQGJo+MDABjIKZjrzkir03VqeM
         4d/Q==
X-Gm-Message-State: AOAM5304n6htypXBjTpeOcdZPE404YHGQyR1tBP8cyhoihiDK3t0g1WP
        /dKDxCBaH6i35RNdLOfJ3gcvqomz2zY=
X-Google-Smtp-Source: ABdhPJzlR0sCoSMIhRbFQUVDm7nYJ9VRAjqA3xudbrWh4R1Bj2SviQ+D8I3Vf422AnJ77Dk6eWeSgA==
X-Received: by 2002:aa7:8f0b:0:b029:13e:d13d:a0fb with SMTP id x11-20020aa78f0b0000b029013ed13da0fbmr5265094pfr.23.1599898288762;
        Sat, 12 Sep 2020 01:11:28 -0700 (PDT)
Received: from sol.lan (106-69-184-100.dyn.iinet.net.au. [106.69.184.100])
        by smtp.gmail.com with ESMTPSA id y6sm4002811pjl.9.2020.09.12.01.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2020 01:11:28 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH v2 1/2] tests: event: reading test coverage extended to cover reading a subset of available events
Date:   Sat, 12 Sep 2020 16:11:04 +0800
Message-Id: <20200912081105.1615496-2-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200912081105.1615496-1-warthog618@gmail.com>
References: <20200912081105.1615496-1-warthog618@gmail.com>
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

Ignore my previous usleep() comments - edge detection hangs off the intr.
It was pre-coffee, OK.

 tests/tests-event.c | 157 ++++++++++++++++++++++++++++++++++++++------
 1 file changed, 137 insertions(+), 20 deletions(-)

diff --git a/tests/tests-event.c b/tests/tests-event.c
index e323060..d9f75e4 100644
--- a/tests/tests-event.c
+++ b/tests/tests-event.c
@@ -663,13 +663,76 @@ GPIOD_TEST_CASE(invalid_fd, 0, { 8 })
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
+	for (i = 0; i < 3; i++) {
+		gpiod_test_chip_set_pull(0, 7, i & 1);
+		usleep(10000);
+	}
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
@@ -682,22 +745,25 @@ GPIOD_TEST_CASE(read_multiple_events, 0, { 8 })
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
+	for (i = 0; i < 7; i++) {
+		gpiod_test_chip_set_pull(0, 4, !(i & 1));
+		/*
+		 * We sleep for a short period of time here and in other
+		 * test cases for multiple events to let the kernel service
+		 * each simulated interrupt. Otherwise we'd risk triggering
+		 * an interrupt while the previous one is still being
+		 * handled.
+		 */
+		usleep(10000);
+	}
 
 	ret = gpiod_line_event_wait(line, &ts);
 	g_assert_cmpint(ret, ==, 1);
+	if (!ret)
+		return;
 
+	/* read a chunk */
 	ret = gpiod_line_event_read_multiple(line, events, 3);
 	g_assert_cmpint(ret, ==, 3);
 
@@ -707,15 +773,40 @@ GPIOD_TEST_CASE(read_multiple_events, 0, { 8 })
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
@@ -728,19 +819,21 @@ GPIOD_TEST_CASE(read_multiple_events_fd, 0, { 8 })
 	ret = gpiod_line_request_both_edges_events(line, GPIOD_TEST_CONSUMER);
 	g_assert_cmpint(ret, ==, 0);
 
-	gpiod_test_chip_set_pull(0, 4, 1);
-	usleep(10000);
-	gpiod_test_chip_set_pull(0, 4, 0);
-	usleep(10000);
-	gpiod_test_chip_set_pull(0, 4, 1);
-	usleep(10000);
+	/* generate multiple events */
+	for (i = 0; i < 7; i++) {
+		gpiod_test_chip_set_pull(0, 4, !(i & 1));
+		usleep(10000);
+	}
 
 	ret = gpiod_line_event_wait(line, &ts);
 	g_assert_cmpint(ret, ==, 1);
+	if (!ret)
+		return;
 
 	fd = gpiod_line_event_get_fd(line);
 	g_assert_cmpint(fd, >=, 0);
 
+	/* read a chunk */
 	ret = gpiod_line_event_read_fd_multiple(fd, events, 3);
 	g_assert_cmpint(ret, ==, 3);
 
@@ -750,4 +843,28 @@ GPIOD_TEST_CASE(read_multiple_events_fd, 0, { 8 })
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

