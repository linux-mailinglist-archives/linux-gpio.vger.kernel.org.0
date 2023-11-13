Return-Path: <linux-gpio+bounces-74-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99AFC7E9ED3
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Nov 2023 15:34:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B9DD81C2096F
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Nov 2023 14:34:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AEB520326;
	Mon, 13 Nov 2023 14:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m04/AEQo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19E212110D
	for <linux-gpio@vger.kernel.org>; Mon, 13 Nov 2023 14:34:06 +0000 (UTC)
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A89621737
	for <linux-gpio@vger.kernel.org>; Mon, 13 Nov 2023 06:34:04 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-40a48775c58so24238275e9.3
        for <linux-gpio@vger.kernel.org>; Mon, 13 Nov 2023 06:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699886043; x=1700490843; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jKJXq8oIEKMCtThL0xN3ztdHho+flrDPqusvJzTlEdk=;
        b=m04/AEQoqEQwc83XcuRUWGYglNAr4yz6dQDWgVjrjqATTxvOmZYtDPoFn7OW7UmcgH
         9/AXb8bc7kv2UKpW6H6rrDrcVmq3RzVU61B+CLfn7E9UtWZnl8xuyu2bMKPjIH3lSB4/
         BiWsRyjiLbgs3SPhke3MdnViFUXk/vwr/sT2fRoH+2j4qHnsjuGNK0Cg71+DgIwoH7BG
         MCCHbWIMhprG3682r0KmHhkGoSjketxIkbixp6DSCiGhFf+2oQIsnX0i6uttDidOXxDl
         rO6yOiUJB96TcCGkwE6TXFiTn2cTaFffNyCvkW4BEzjdQpfCx4FK0clsZY/lxer5w4ce
         LYQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699886043; x=1700490843;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jKJXq8oIEKMCtThL0xN3ztdHho+flrDPqusvJzTlEdk=;
        b=WpC7loz/ijEcni8N944+JVa3CabjBxfbBppnbncySm/sq5aCCDivBepytR8sYBefOo
         WvUM4ZKfofXtQGrVOr5uMCIuzPQPYARUTB6kDRL+7LQ+STysbeeHu36nPvfon5ftMp2Q
         tyD4ygGJ8gvRFxKvi+MGjTzWonKrpFuEY4qO2q4QF1HdS6vBAuevoDKXEVBF9vgQXwLy
         ukfaPbOhhWvTYxqi+LXw2J5582Bac9utquu57d+Y4E6PfZFNQXewLw7COoGzlZUa4Oa9
         aRsFoM7XZMYZ/8nteewSfqCtrg/TFM3ubs8YZ2uR82CrtFJobn1eGjRu1DifMwX0kSAC
         uPcw==
X-Gm-Message-State: AOJu0YxwyR97/uTFYqzH4g+b57eyKYabpSw/r2XsRwwZQ/KYGHoEtrPe
	3lYuy0IwyZiMJAg/BfZg4qSH1G/wc9yDNw==
X-Google-Smtp-Source: AGHT+IEOleUZC84ti7PR5yO/Z+opk3gk/4wKbXG05rusG8bneZnGsqPK6J3n67uS25niOLdV/OInzw==
X-Received: by 2002:a1c:790b:0:b0:409:7aa9:a903 with SMTP id l11-20020a1c790b000000b004097aa9a903mr5636109wme.19.1699886042639;
        Mon, 13 Nov 2023 06:34:02 -0800 (PST)
Received: from Kalray-lp232.station ([2a01:827:1724:ad01:4d9d:f50e:f7dc:7e98])
        by smtp.gmail.com with ESMTPSA id a17-20020a05600c349100b003fee6e170f9sm8351558wmq.45.2023.11.13.06.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 06:34:02 -0800 (PST)
From: Adrien Zinger <zinger.ad@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: zinger.ad@gmail.com
Subject: [libgpiod][PATCH] libgpiod: Allow to gracefully exit from a wait event
Date: Mon, 13 Nov 2023 15:32:20 +0100
Message-Id: <20231113143219.43498-1-zinger.ad@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a function in core `gpiod_line_request_wait_edge_events_or` with an
additional argument `fd` to trigger ppoll manually from another thread.

It allows users to gracefully cancel and join a worker thread waiting
for an edge event.

Signed-off-by: Adrien Zinger <zinger.ad@gmail.com>
---
 include/gpiod.h          | 17 ++++++++++++++
 lib/internal.c           | 38 ++++++++++++++++++++++++------
 lib/internal.h           |  1 +
 lib/line-request.c       |  9 +++++++
 tests/tests-edge-event.c | 51 ++++++++++++++++++++++++++++++++++++++++
 5 files changed, 109 insertions(+), 7 deletions(-)

diff --git a/include/gpiod.h b/include/gpiod.h
index d86c6ac..cbc83f9 100644
--- a/include/gpiod.h
+++ b/include/gpiod.h
@@ -1176,6 +1176,23 @@ int gpiod_line_request_get_fd(struct gpiod_line_request *request);
 int gpiod_line_request_wait_edge_events(struct gpiod_line_request *request,
 					int64_t timeout_ns);
 
+/**
+ * @brief Wait for edge events on any of the requested lines or a
+ *        POLLHUP/POLLERR event on the given file descriptor.
+ * @param request GPIO line request.
+ * @param fd file descriptor from any I/O, channel, fifo, or pipe.
+ * @param timeout_ns Wait time limit in nanoseconds. If set to 0, the function
+ *                   returns immediately. If set to a negative number, the
+ *                   function blocks indefinitely until an event becomes
+ *                   available.
+ * @return 0 if wait timed out, -1 if an error occurred, 1 if an event is
+ *         pending, 2 if the file descriptor raised an event.
+ *
+ * Lines must have edge detection set for edge events to be emitted.
+ * By default edge detection is disabled.
+ */
+int gpiod_line_request_wait_edge_events_or(struct gpiod_line_request *request,
+					int fd, int64_t timeout_ns);
 /**
  * @brief Read a number of edge events from a line request.
  * @param request GPIO line request.
diff --git a/lib/internal.c b/lib/internal.c
index c80d01f..aaf96ff 100644
--- a/lib/internal.c
+++ b/lib/internal.c
@@ -81,22 +81,18 @@ out:
 	return ret;
 }
 
-int gpiod_poll_fd(int fd, int64_t timeout_ns)
+static int
+gpiod_poll_fds(struct pollfd *pfds, uint8_t len, int64_t timeout_ns)
 {
 	struct timespec ts;
-	struct pollfd pfd;
 	int ret;
 
-	memset(&pfd, 0, sizeof(pfd));
-	pfd.fd = fd;
-	pfd.events = POLLIN | POLLPRI;
-
 	if (timeout_ns >= 0) {
 		ts.tv_sec = timeout_ns / 1000000000ULL;
 		ts.tv_nsec = timeout_ns % 1000000000ULL;
 	}
 
-	ret = ppoll(&pfd, 1, timeout_ns < 0 ? NULL : &ts, NULL);
+	ret = ppoll(pfds, len, timeout_ns < 0 ? NULL : &ts, NULL);
 	if (ret < 0)
 		return -1;
 	else if (ret == 0)
@@ -105,6 +101,34 @@ int gpiod_poll_fd(int fd, int64_t timeout_ns)
 	return 1;
 }
 
+int gpiod_poll_fd(int fd, int64_t timeout_ns)
+{
+	struct pollfd pfd;
+
+	memset(&pfd, 0, sizeof(pfd));
+	pfd.fd = fd;
+	pfd.events = POLLIN | POLLPRI;
+
+	return gpiod_poll_fds(&pfd, 1, timeout_ns);
+}
+
+int gpiod_poll_fd_or(int fd1, int fd2, int64_t timeout_ns)
+{
+	struct pollfd pfds[2];
+	int ret;
+
+	memset(&pfds, 0, sizeof(pfds));
+	pfds[0].fd = fd1;
+	pfds[0].events = POLLIN | POLLPRI;
+	pfds[1].fd = fd2;
+	pfds[1].events = POLLIN | POLLERR;
+
+	ret = gpiod_poll_fds(pfds, 2, timeout_ns);
+	if (ret >= 1 && pfds[1].revents != 0)
+		return 2;
+	return ret;
+}
+
 int gpiod_set_output_value(enum gpiod_line_value in, enum gpiod_line_value *out)
 {
 	switch (in) {
diff --git a/lib/internal.h b/lib/internal.h
index 61d7aec..6b2105b 100644
--- a/lib/internal.h
+++ b/lib/internal.h
@@ -36,6 +36,7 @@ gpiod_info_event_from_uapi(struct gpio_v2_line_info_changed *uapi_evt);
 struct gpiod_info_event *gpiod_info_event_read_fd(int fd);
 
 int gpiod_poll_fd(int fd, int64_t timeout);
+int gpiod_poll_fd_or(int fd1, int fd2, int64_t timeout);
 int gpiod_set_output_value(enum gpiod_line_value in,
 			   enum gpiod_line_value *out);
 
diff --git a/lib/line-request.c b/lib/line-request.c
index e867d91..dd2a5a2 100644
--- a/lib/line-request.c
+++ b/lib/line-request.c
@@ -295,6 +295,15 @@ gpiod_line_request_wait_edge_events(struct gpiod_line_request *request,
 	return gpiod_poll_fd(request->fd, timeout_ns);
 }
 
+GPIOD_API int
+gpiod_line_request_wait_edge_events_or(struct gpiod_line_request *request,
+				    int fd, int64_t timeout_ns)
+{
+	assert(request);
+
+	return gpiod_poll_fd_or(request->fd, fd, timeout_ns);
+}
+
 GPIOD_API int
 gpiod_line_request_read_edge_events(struct gpiod_line_request *request,
 				    struct gpiod_edge_event_buffer *buffer,
diff --git a/tests/tests-edge-event.c b/tests/tests-edge-event.c
index b744ca5..3281831 100644
--- a/tests/tests-edge-event.c
+++ b/tests/tests-edge-event.c
@@ -81,6 +81,17 @@ GPIOD_TEST_CASE(cannot_request_lines_in_output_mode_with_edge_detection)
 	gpiod_test_expect_errno(EINVAL);
 }
 
+static gpointer trigger_cancel_channel(gpointer data)
+{
+	int cancel_sender = ((int *)data)[1];
+
+	g_usleep(1000);
+
+	g_assert_cmpint(write(cancel_sender, "\0", 1), ==, 1);
+
+	return NULL;
+}
+
 static gpointer falling_and_rising_edge_events(gpointer data)
 {
 	GPIOSimChip *sim = data;
@@ -361,6 +372,46 @@ GPIOD_TEST_CASE(read_rising_edge_event_polled)
 	g_thread_join(thread);
 }
 
+GPIOD_TEST_CASE(cancel_edge_event_wait)
+{
+	static const guint offset = 2;
+	gint channel[2];
+
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(struct_gpiod_chip) chip = NULL;
+	g_autoptr(struct_gpiod_line_settings) settings = NULL;
+	g_autoptr(struct_gpiod_line_config) line_cfg = NULL;
+	g_autoptr(struct_gpiod_line_request) request = NULL;
+	g_autoptr(GThread) thread = NULL;
+	g_autoptr(struct_gpiod_edge_event_buffer) buffer = NULL;
+	gint ret;
+
+	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
+	settings = gpiod_test_create_line_settings_or_fail();
+	line_cfg = gpiod_test_create_line_config_or_fail();
+	buffer = gpiod_test_create_edge_event_buffer_or_fail(64);
+
+	gpiod_line_settings_set_direction(settings, GPIOD_LINE_DIRECTION_INPUT);
+	gpiod_line_settings_set_edge_detection(settings,
+					       GPIOD_LINE_EDGE_RISING);
+
+	gpiod_test_line_config_add_line_settings_or_fail(line_cfg, &offset, 1,
+							 settings);
+
+	request = gpiod_test_chip_request_lines_or_fail(chip, NULL, line_cfg);
+
+	g_assert_cmpint(pipe(channel), ==, 0);
+
+	thread = g_thread_new("trigger-cancel-channel",
+			      trigger_cancel_channel, channel);
+
+	ret = gpiod_line_request_wait_edge_events_or(request, channel[0], 1000000000);
+	g_assert_cmpint(ret, ==, 2); /* Canceled */
+	close(channel[0]);
+	close(channel[1]);
+	g_thread_join(thread);
+}
+
 GPIOD_TEST_CASE(read_both_events_blocking)
 {
 	/*
-- 
2.34.1


