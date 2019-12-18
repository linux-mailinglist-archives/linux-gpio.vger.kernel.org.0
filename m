Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A7A1B124976
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Dec 2019 15:25:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727124AbfLROZC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 18 Dec 2019 09:25:02 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:46316 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727035AbfLROZC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 18 Dec 2019 09:25:02 -0500
Received: by mail-wr1-f66.google.com with SMTP id z7so2460044wrl.13
        for <linux-gpio@vger.kernel.org>; Wed, 18 Dec 2019 06:25:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YcNCrQ+B8lyhBiCcH0QGc6Yk3IkX2EQdiRvcWYWQbIQ=;
        b=yWS+065C+sms34f27HWExolK9jLYW2a3/8Esmn0Mm9K9K1EQoRl29r+eT/0A6XF0T9
         fCg3vu3YiFhXw8MRKS15Awetg1oMt1p2Ve7DToLclRjDLJqIe2o0xulO7ZjdhXVg44N8
         adB97VVYUBZUwbX/z0FYprJn8rehI/5gKvct0snri0zDxrXQd7nmjiKW8Qgk3nrld445
         jDJj52HSuVO6GMy7Lfxmcqu8a9mm7an9UPj3dbsImyFGxjcVFCIJ7jnSvQ25ZsGbJhkD
         QnrIuaQfNQg6BDU3jVYGNLePevcsNEXwuaEe/pBf+IQfrmbyWH8vmJYJKLY+22uwIhQq
         pgOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YcNCrQ+B8lyhBiCcH0QGc6Yk3IkX2EQdiRvcWYWQbIQ=;
        b=SOfYK/A8Pdk9eT5kL1C/hKBLhhZ0B1mtbQhMYXff0XTeg/CSLJOtcXu4xLeQjQqxje
         qJZ4CA1Li2cJaPw5Cl3wKQ5mCurAkK8SMYwkhAkad+nUH2qkI9hs7sjA/szogeDNIlkH
         2ORE2+/N2Cy4qpTJCuFGKBFqNl2x2YUIqcamon5dnILUUiVNUNNsBHAKqIuAUSSHfhpM
         cbhHYujk4WgF76I1rS91vIkBnMzbwxNOEOp3z615gOcw/2zTwiSEkmaCaN48CZqAaAIl
         CGaZZyazw0RfgXymiTC1SyBy5o2AE6RytArY16Kaw9RsPmHoIG4zOZat+TeipyTA6lrI
         xfTw==
X-Gm-Message-State: APjAAAUYVK1LPYoBlzxDb4brHgdWaWq+VlIfti6JFoBKX/c/mnO5O4GT
        vXsraXt+3lwkCAGA64pvtWkIAQ==
X-Google-Smtp-Source: APXvYqy35WmL270dJokjzGBVZvgPjMKnEPnWAWDbeaYht1H0epB6+GJtuMu440SXqr95B8XZwD2wNg==
X-Received: by 2002:a5d:53d1:: with SMTP id a17mr3074703wrw.327.1576679100696;
        Wed, 18 Dec 2019 06:25:00 -0800 (PST)
Received: from debian-brgl.home (amontpellier-652-1-53-230.w109-210.abo.wanadoo.fr. [109.210.44.230])
        by smtp.gmail.com with ESMTPSA id x11sm2889981wre.68.2019.12.18.06.24.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2019 06:25:00 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [libgpiod][PATCH 2/7] core: provide functions for reading multiple line events at once
Date:   Wed, 18 Dec 2019 15:24:44 +0100
Message-Id: <20191218142449.10957-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191218142449.10957-1-brgl@bgdev.pl>
References: <20191218142449.10957-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

The kernel allows us to read multiple (up to 16) line events with
a single read() call, but up to this point libgpiod only supported
reading one event at a time. Add two new functions that allow users
to read more events at the same time.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 include/gpiod.h | 25 ++++++++++++++++++++
 lib/core.c      | 61 ++++++++++++++++++++++++++++++++++++++++---------
 2 files changed, 75 insertions(+), 11 deletions(-)

diff --git a/include/gpiod.h b/include/gpiod.h
index 0ecb804..b275f4a 100644
--- a/include/gpiod.h
+++ b/include/gpiod.h
@@ -1479,6 +1479,19 @@ int gpiod_line_event_wait_bulk(struct gpiod_line_bulk *bulk,
 int gpiod_line_event_read(struct gpiod_line *line,
 			  struct gpiod_line_event *event) GPIOD_API;
 
+/**
+ * @brief Read up to a certain number of events from the GPIO line.
+ * @param line GPIO line object.
+ * @param events Buffer to which the event data will be copied. Must hold at
+ *               least the amount of events specified in num_events.
+ * @param num_events Specifies how many events can be stored in the buffer.
+ * @return On success returns the number of events stored in the buffer, on
+ *         failure -1 is returned.
+ */
+int gpiod_line_event_read_multiple(struct gpiod_line *line,
+				   struct gpiod_line_event *events,
+				   unsigned int num_events) GPIOD_API;
+
 /**
  * @brief Get the event file descriptor.
  * @param line GPIO line object.
@@ -1503,6 +1516,18 @@ int gpiod_line_event_get_fd(struct gpiod_line *line) GPIOD_API;
  */
 int gpiod_line_event_read_fd(int fd, struct gpiod_line_event *event) GPIOD_API;
 
+/**
+ * @brief Read up to a certain number of events directly from a file descriptor.
+ * @param fd File descriptor.
+ * @param events Buffer to which the event data will be copied. Must hold at
+ *               least the amount of events specified in num_events.
+ * @param num_events Specifies how many events can be stored in the buffer.
+ * @return On success returns the number of events stored in the buffer, on
+ *         failure -1 is returned.
+ */
+int gpiod_line_event_read_fd_multiple(int fd, struct gpiod_line_event *events,
+				      unsigned int num_events) GPIOD_API;
+
 /**
  * @}
  *
diff --git a/lib/core.c b/lib/core.c
index 89f5465..8352e18 100644
--- a/lib/core.c
+++ b/lib/core.c
@@ -1009,6 +1009,19 @@ int gpiod_line_event_wait_bulk(struct gpiod_line_bulk *bulk,
 
 int gpiod_line_event_read(struct gpiod_line *line,
 			  struct gpiod_line_event *event)
+{
+	int ret;
+
+	ret = gpiod_line_event_read_multiple(line, event, 1);
+	if (ret < 0)
+		return -1;
+
+	return 0;
+}
+
+int gpiod_line_event_read_multiple(struct gpiod_line *line,
+				   struct gpiod_line_event *events,
+				   unsigned int num_events)
 {
 	int fd;
 
@@ -1016,7 +1029,7 @@ int gpiod_line_event_read(struct gpiod_line *line,
 	if (fd < 0)
 		return -1;
 
-	return gpiod_line_event_read_fd(fd, event);
+	return gpiod_line_event_read_fd_multiple(fd, events, num_events);
 }
 
 int gpiod_line_event_get_fd(struct gpiod_line *line)
@@ -1031,25 +1044,51 @@ int gpiod_line_event_get_fd(struct gpiod_line *line)
 
 int gpiod_line_event_read_fd(int fd, struct gpiod_line_event *event)
 {
-	struct gpioevent_data evdata;
+	int ret;
+
+	ret = gpiod_line_event_read_fd_multiple(fd, event, 1);
+	if (ret < 0)
+		return -1;
+
+	return 0;
+}
+
+int gpiod_line_event_read_fd_multiple(int fd, struct gpiod_line_event *events,
+				      unsigned int num_events)
+{
+	/*
+	 * 16 is the maximum number of events the kernel can store in the FIFO
+	 * so we can allocate the buffer on the stack.
+	 */
+	struct gpioevent_data evdata[16], *curr;
+	struct gpiod_line_event *event;
+	unsigned int events_read, i;
 	ssize_t rd;
 
-	memset(&evdata, 0, sizeof(evdata));
+	memset(evdata, 0, sizeof(evdata));
 
-	rd = read(fd, &evdata, sizeof(evdata));
+	rd = read(fd, evdata, sizeof(evdata));
 	if (rd < 0) {
 		return -1;
-	} else if (rd != sizeof(evdata)) {
+	} else if ((unsigned int)rd < sizeof(*evdata)) {
 		errno = EIO;
 		return -1;
 	}
 
-	event->event_type = evdata.id == GPIOEVENT_EVENT_RISING_EDGE
-						? GPIOD_LINE_EVENT_RISING_EDGE
-						: GPIOD_LINE_EVENT_FALLING_EDGE;
+	events_read = rd / sizeof(*evdata);
+	if (events_read < num_events)
+		num_events = events_read;
 
-	event->ts.tv_sec = evdata.timestamp / 1000000000ULL;
-	event->ts.tv_nsec = evdata.timestamp % 1000000000ULL;
+	for (i = 0; i < num_events; i++) {
+		curr = &evdata[i];
+		event = &events[i];
 
-	return 0;
+		event->event_type = curr->id == GPIOEVENT_EVENT_RISING_EDGE
+					? GPIOD_LINE_EVENT_RISING_EDGE
+					: GPIOD_LINE_EVENT_FALLING_EDGE;
+		event->ts.tv_sec = curr->timestamp / 1000000000ULL;
+		event->ts.tv_nsec = curr->timestamp % 1000000000ULL;
+	}
+
+	return i;
 }
-- 
2.23.0

