Return-Path: <linux-gpio+bounces-6342-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 242358C44B8
	for <lists+linux-gpio@lfdr.de>; Mon, 13 May 2024 18:00:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 46C391C21261
	for <lists+linux-gpio@lfdr.de>; Mon, 13 May 2024 16:00:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5AF2155322;
	Mon, 13 May 2024 16:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IQjlSwWK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F2E8154423
	for <linux-gpio@vger.kernel.org>; Mon, 13 May 2024 16:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715616042; cv=none; b=GUDgyAL03tsYj0vXxK7MMc35KlABMTcK2u2IsD5rucgg2rCGkqbsIMF4wEMu4QUJ/i5grkIClRLqZ2d3tLJu0gOBWH3TTtolgdY+FylN3R4Jvja02ivLMWEWCs6vLNR9pRl7QlYcvfskaVvhu/BCqyRN0+Z+/7N2T/OxSZ3+9oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715616042; c=relaxed/simple;
	bh=Uh6pKliHDjiDlMryuuvZ8WMdzrsu6kEPrlI/HCA8LYE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kymazAuBfLoI+M4GUaMhrBULP9wuKkdAEMxHLA+nGreTXNURrPnj7tWmINUEDt3b+0hYAT6d82PYwJF10a7bflGiXWB5I+M2w9BIx8q9jd40WK6HPp2tAE8H8Z3A0F2oZuYykAnNuu1I3f+VIrslhPadIfZ5I+N1Io5z7FHihhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IQjlSwWK; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-61eba9f9c5dso3447442a12.0
        for <linux-gpio@vger.kernel.org>; Mon, 13 May 2024 09:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715616040; x=1716220840; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=brkn6v8SSbjYiuiZBSlHF51hLOGKsSq7XCa0uWmwoVc=;
        b=IQjlSwWKzLuLPoEwNd6SHOjaUJonQ85kvkfDVzKZZSyRavvz7kPigsp71ZjbhPP3Re
         8SGmdGOqQEHpN0exHcCaHPDmrDeKHvTWHISt0nxAf6lBX8i74Slix0tdrz3p4ir3SDgo
         tRZN9WwlGpxOZBCtzr4bFqnPZRUC0/JD5NGCwYCekCmQ7ZlkdDx6nrs8d1lmxfi51XPQ
         wwDaPuP6mv1y0y83HQMcFs5yHcBPY52dES8HpBynwmByuxuUPG0cDEU2Ns2H7CR7kCsP
         arjp+Tts9VqAMrkL9MjKDBbdMDHQeHtgKACvfObrcvHordiHCwL9TEGjoxLIv6lWgVtF
         CZbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715616040; x=1716220840;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=brkn6v8SSbjYiuiZBSlHF51hLOGKsSq7XCa0uWmwoVc=;
        b=hh7DBmRsvokqH5kkzH/dSnim6uL/gD+Axjt/MPuc0dR80n2N5L8YEm5mXqjdAuHqeE
         czo6UdkORmYY79rU475bjX5d5W8mHzD7h2UHjbgvWFbP958kAyi0CRzNHrPzLgPhaSSX
         bqimQkgEPlgh0QljW3aNeuzvu4Lin8bTKSQ2QxysvkRGXbtEAHwhUC52wXnGjYgYYk4r
         GpM98/z4vTM+3Qmws0iiGkbraSEd5hAUnK2OkZbgFb+mXAXYu/0Vv4KG5R8QmXscJxEa
         mlaX5FZoR1kEJYTi2u/eWAOhyhn3HyYriv/TddNt0zFqcoNZY1Ak2CsSe0hl7WallXCk
         E9Fw==
X-Gm-Message-State: AOJu0Yypxzjs8uv9hVl0QcawoBdmOGxpgTvYy7e9BR6Eyt2y4jWkj88A
	yv+fw/oWk167+qs9Ly8Az1KhJXEucChLEh4PeciOr1h4BT4dGJxujeCZ/Q==
X-Google-Smtp-Source: AGHT+IE/gM42S+iLpQs0wAk0gU4ss5GFijo3Iwq6/z5ArfARUF+SvbeFnj/mnPlMhqHtUNunyuOPXA==
X-Received: by 2002:a17:90b:11d4:b0:2b5:340d:cfcc with SMTP id 98e67ed59e1d1-2b6cc44f53bmr8446253a91.11.1715616040058;
        Mon, 13 May 2024 09:00:40 -0700 (PDT)
Received: from rigel.home.arpa (60-241-107-82.static.tpgi.com.au. [60.241.107.82])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2b628ca5279sm9967544a91.41.2024.05.13.09.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 May 2024 09:00:39 -0700 (PDT)
From: Kent Gibson <warthog618@gmail.com>
To: linux-gpio@vger.kernel.org,
	brgl@bgdev.pl
Cc: Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH] tests: add enable_debounce_then_edge_detection
Date: Tue, 14 May 2024 00:00:31 +0800
Message-Id: <20240513160031.309139-1-warthog618@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A bug was recently discovered in the kernel that can result in the edge
event fifo not being correctly initialised and stack contents being
returned in edge events. The trigger for the bug is requesting a line with
debounce, but not edge detection, and then reconfiguring the line to
enable edge detection.

Add a test case that triggers the bug.  This will fail on kernels that
do not contain the fix for the bug.  The test is located in a new test
file, tests-kernel-uapi.c, intended to contain tests specifically
testing some aspect of the kernel uAPI, not libgpiod itself.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 tests/Makefile.am         |   1 +
 tests/tests-kernel-uapi.c | 112 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 113 insertions(+)
 create mode 100644 tests/tests-kernel-uapi.c

diff --git a/tests/Makefile.am b/tests/Makefile.am
index 0680d5e..a5e1fe0 100644
--- a/tests/Makefile.am
+++ b/tests/Makefile.am
@@ -24,6 +24,7 @@ gpiod_test_SOURCES = \
 	tests-chip-info.c \
 	tests-edge-event.c \
 	tests-info-event.c \
+	tests-kernel-uapi.c \
 	tests-line-config.c \
 	tests-line-info.c \
 	tests-line-request.c \
diff --git a/tests/tests-kernel-uapi.c b/tests/tests-kernel-uapi.c
new file mode 100644
index 0000000..453237c
--- /dev/null
+++ b/tests/tests-kernel-uapi.c
@@ -0,0 +1,112 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2021-2022 Bartosz Golaszewski <bartekgola@gmail.com>
+// SPDX-FileCopyrightText: 2024 Kent Gibson <warthog618@gmail.com>
+
+#include <glib.h>
+#include <gpiod.h>
+#include <poll.h>
+
+#include "gpiod-test.h"
+#include "gpiod-test-helpers.h"
+#include "gpiod-test-sim.h"
+
+#define GPIOD_TEST_GROUP "kernel-uapi"
+
+static gpointer falling_and_rising_edge_events(gpointer data)
+{
+	GPIOSimChip *sim = data;
+
+	/*
+	 * needs to be as long as several system timer ticks or resulting
+	 * pulse width is unreliable and may get filtered by debounce.
+	 */
+	g_usleep(50000);
+
+	g_gpiosim_chip_set_pull(sim, 2, G_GPIOSIM_PULL_UP);
+
+	g_usleep(50000);
+
+	g_gpiosim_chip_set_pull(sim, 2, G_GPIOSIM_PULL_DOWN);
+
+	return NULL;
+}
+
+GPIOD_TEST_CASE(enable_debounce_then_edge_detection)
+{
+	static const guint offset = 2;
+
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(struct_gpiod_chip) chip = NULL;
+	g_autoptr(struct_gpiod_line_settings) settings = NULL;
+	g_autoptr(struct_gpiod_line_config) line_cfg = NULL;
+	g_autoptr(struct_gpiod_line_request) request = NULL;
+	g_autoptr(GThread) thread = NULL;
+	g_autoptr(struct_gpiod_edge_event_buffer) buffer = NULL;
+	struct gpiod_edge_event *event;
+	guint64 ts_rising, ts_falling;
+	gint ret;
+
+	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
+	settings = gpiod_test_create_line_settings_or_fail();
+	line_cfg = gpiod_test_create_line_config_or_fail();
+	buffer = gpiod_test_create_edge_event_buffer_or_fail(64);
+
+	gpiod_line_settings_set_direction(settings, GPIOD_LINE_DIRECTION_INPUT);
+	gpiod_line_settings_set_debounce_period_us(settings, 10);
+	gpiod_test_line_config_add_line_settings_or_fail(line_cfg, &offset, 1,
+							 settings);
+	request = gpiod_test_chip_request_lines_or_fail(chip, NULL, line_cfg);
+
+	gpiod_line_settings_set_edge_detection(settings, GPIOD_LINE_EDGE_BOTH);
+	gpiod_test_line_config_add_line_settings_or_fail(line_cfg, &offset, 1,
+							 settings);
+	gpiod_test_line_request_reconfigure_lines_or_fail(request, line_cfg);
+
+	thread = g_thread_new("request-release",
+			      falling_and_rising_edge_events, sim);
+	g_thread_ref(thread);
+
+	/* First event. */
+
+	ret = gpiod_line_request_wait_edge_events(request, 1000000000);
+	g_assert_cmpint(ret, >, 0);
+	gpiod_test_join_thread_and_return_if_failed(thread);
+
+	ret = gpiod_line_request_read_edge_events(request, buffer, 1);
+	g_assert_cmpint(ret, ==, 1);
+	gpiod_test_join_thread_and_return_if_failed(thread);
+
+	g_assert_cmpuint(gpiod_edge_event_buffer_get_num_events(buffer), ==, 1);
+	event = gpiod_edge_event_buffer_get_event(buffer, 0);
+	g_assert_nonnull(event);
+	gpiod_test_join_thread_and_return_if_failed(thread);
+
+	g_assert_cmpint(gpiod_edge_event_get_event_type(event), ==,
+			GPIOD_EDGE_EVENT_RISING_EDGE);
+	g_assert_cmpuint(gpiod_edge_event_get_line_offset(event), ==, 2);
+	ts_rising = gpiod_edge_event_get_timestamp_ns(event);
+
+	/* Second event. */
+
+	ret = gpiod_line_request_wait_edge_events(request, 1000000000);
+	g_assert_cmpint(ret, >, 0);
+	gpiod_test_join_thread_and_return_if_failed(thread);
+
+	ret = gpiod_line_request_read_edge_events(request, buffer, 1);
+	g_assert_cmpint(ret, ==, 1);
+	gpiod_test_join_thread_and_return_if_failed(thread);
+
+	g_assert_cmpuint(gpiod_edge_event_buffer_get_num_events(buffer), ==, 1);
+	event = gpiod_edge_event_buffer_get_event(buffer, 0);
+	g_assert_nonnull(event);
+	gpiod_test_join_thread_and_return_if_failed(thread);
+
+	g_assert_cmpint(gpiod_edge_event_get_event_type(event), ==,
+			GPIOD_EDGE_EVENT_FALLING_EDGE);
+	g_assert_cmpuint(gpiod_edge_event_get_line_offset(event), ==, 2);
+	ts_falling = gpiod_edge_event_get_timestamp_ns(event);
+
+	g_thread_join(thread);
+
+	g_assert_cmpuint(ts_falling, >, ts_rising);
+}
-- 
2.39.2


