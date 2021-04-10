Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C3C235AE8D
	for <lists+linux-gpio@lfdr.de>; Sat, 10 Apr 2021 16:52:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234836AbhDJOwl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 10 Apr 2021 10:52:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234795AbhDJOwl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 10 Apr 2021 10:52:41 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 795CAC06138B
        for <linux-gpio@vger.kernel.org>; Sat, 10 Apr 2021 07:52:26 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id x15so8435394wrq.3
        for <linux-gpio@vger.kernel.org>; Sat, 10 Apr 2021 07:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+9bUD/g3iMqHmud+S7NI6/nBPPqnz0nYWUKe+mjOp0o=;
        b=FU2s282eoPm7/QfNNJpkJPYwZG6N24IqZZvu4FmDVLhkKNTpb+c7ZoNVavSs7BBqwl
         Xhy5lDuG7a6yh2L0c9n7F8uy5kJ6iFN58B6bzh32/PsI5jYbpYsLFfC8MjOExv99M91F
         STrFLhimac3h/CfBd3QwjMjw8qxAQ32DgmN9YzF2h/Ab6CDUoMXwP2unm5fgD+c9eKRo
         z8V8yFgHJLF4/+8KrkCjNEoY3T9tPkqQbFZaNvulZs8n4lVr4ADdh8MqFx5LZHnxZXOn
         KlN3QIf9osmx97JxM29a5KfdNoVIDcuBWNTSPVcgyPwu8vfEtCl6ha+iscDw3GYDY9NG
         iFOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+9bUD/g3iMqHmud+S7NI6/nBPPqnz0nYWUKe+mjOp0o=;
        b=gnD/xEj3MlKyf/Bk2Q/K/7NZvo2Hi+9JZsCxJ0+qz85NR+z1gxuWZi+hxuHbqAojv5
         OfQMjAcQsDOd/FcO/ZQNhZr8jTcI+D/1fXIvJYppT+hnWo1C6Zt3biA+OZPfeEU5ZowZ
         XxogELGwT3YwoJTLbCc5Jx/P61j+lBN6utc64tZxutZiBav6dGaal5u8CqtJqLrtElyR
         MI6MO1/5n9CeR5aSL4PT5xiNzc9uxx/plEGW/xjV3jtlkHmvAYaJFepmLoDgrYh7uqew
         ftoNbewqoagXAcrBGv0mD3dMbteQLE1Qcvg7tQHGt5ImFqIlOKo8HNxE3duAD1WBY27a
         i8sA==
X-Gm-Message-State: AOAM531POHfyWJzd/JnI7zjifaANGy1VPv4xyAR37qSRC55ZW5tkgk0N
        KGHVwf86R964QLwK1ceE+HaF/A==
X-Google-Smtp-Source: ABdhPJwQOYKd1QWs+mUxbHIaWjtx9GQsPOIwfENW3OL6bBLFE/NyZxShWjtGfu8gZQr9L8Lw+4w0/g==
X-Received: by 2002:adf:d1ed:: with SMTP id g13mr9002046wrd.86.1618066345191;
        Sat, 10 Apr 2021 07:52:25 -0700 (PDT)
Received: from debian-brgl.home (lfbn-nic-1-149-6.w2-15.abo.wanadoo.fr. [2.15.231.6])
        by smtp.gmail.com with ESMTPSA id a15sm9167083wrr.53.2021.04.10.07.52.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Apr 2021 07:52:24 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [libgpiod][RFC 6/6] core: implement line watch events
Date:   Sat, 10 Apr 2021 16:51:57 +0200
Message-Id: <20210410145157.30718-7-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210410145157.30718-1-brgl@bgdev.pl>
References: <20210410145157.30718-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This implement support for line status watch events in libgpiod. Unlike
line events, these are not expected to happen very often and continuously
so there's no need for a dedicated container.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 include/gpiod.h | 103 ++++++++++++++++++++++++++++++++++++++++++++++++
 lib/Makefile.am |   3 +-
 lib/chip.c      |  65 ++++++++++++++++++++++++++----
 lib/handle.c    |  20 +---------
 lib/internal.c  |  24 +++++++++++
 lib/internal.h  |   4 ++
 lib/watch.c     |  96 ++++++++++++++++++++++++++++++++++++++++++++
 7 files changed, 288 insertions(+), 27 deletions(-)
 create mode 100644 lib/watch.c

diff --git a/include/gpiod.h b/include/gpiod.h
index 8831d4c..5202ede 100644
--- a/include/gpiod.h
+++ b/include/gpiod.h
@@ -41,6 +41,7 @@ extern "C" {
 
 struct gpiod_chip;
 struct gpiod_line_info;
+struct gpiod_watch_event;
 struct gpiod_line_attr;
 struct gpiod_line_config;
 struct gpiod_request_config;
@@ -107,6 +108,49 @@ unsigned int gpiod_chip_get_num_lines(struct gpiod_chip *chip);
 struct gpiod_line_info *gpiod_chip_get_line_info(struct gpiod_chip *chip,
 						 unsigned int offset);
 
+/**
+ * @brief Get the current snapshot of information about the line at given
+ *        offset and start watching it for future changes.
+ * @param chip GPIO chip object.
+ * @param offset The offset of the GPIO line.
+ * @return New GPIO line info object or NULL if an error occurred.
+ */
+struct gpiod_line_info *gpiod_chip_watch_line_info(struct gpiod_chip *chip,
+						   unsigned int offset);
+
+/**
+ * @brief Stop watching the line at given offset for status changes.
+ * @param chip GPIO chip object.
+ * @param offset The offset of the GPIO line.
+ * @return 0 on success, -1 on failure.
+ */
+int gpiod_chip_unwatch_line_info(struct gpiod_chip *chip, unsigned int offset);
+
+/**
+ * @brief Get the file descriptor associated with this chip.
+ * @param chip GPIO chip object.
+ * @return File descriptor number. This function never fails.
+ */
+int gpiod_chip_get_fd(struct gpiod_chip *chip);
+
+/**
+ * @brief Wait for line status events on any of the lines associated with
+ *        this chip.
+ * @param chip GPIO chip object.
+ * @param timeout Wait time limit in nanoseconds.
+ * @return 0 if wait timed out, -1 if an error occurred, 1 if an event is
+ *         pending.
+ */
+int gpiod_chip_watch_event_wait(struct gpiod_chip *chip, uint64_t timeout);
+
+/**
+ * @brief Read a single line status change event from this chip.
+ * @param chip GPIO chip object.
+ * @return Newly read watch event object or NULL on error.
+ * @note If no events are pending, this function will block.
+ */
+struct gpiod_watch_event *gpiod_chip_watch_event_read(struct gpiod_chip *chip);
+
 /**
  * @brief Map a GPIO line's name to its offset within the chip.
  * @param chip GPIO chip object.
@@ -295,6 +339,65 @@ bool gpiod_line_is_debounced(struct gpiod_line_info *info);
 unsigned long
 gpiod_line_get_debounce_period(struct gpiod_line_info *info);
 
+/**
+ * @}
+ *
+ * @defgroup line_watch Line status watch events
+ * @{
+ */
+
+/**
+ * @brief Possible line status change event types.
+ */
+enum {
+	GPIOD_WATCH_EVENT_LINE_REQUESTED = 1,
+	/**< Line has been requested. */
+	GPIOD_WATCH_EVENT_LINE_RELEASED,
+	/**< Previously requested line has been released. */
+	GPIOD_WATCH_EVENT_LINE_CONFIG_CHANGED,
+	/**< Line configuration has changed. */
+};
+
+/**
+ * @brief Increase the reference count of this line status watch event.
+ * @param event Line status watch event.
+ * @return Passed reference to this line watch event.
+ */
+struct gpiod_watch_event *
+gpiod_watch_event_ref(struct gpiod_watch_event *event);
+
+/**
+ * @brief Decrease the reference count of this line status watch event. If the
+ *        reference count reaches 0, release all associated resources.
+ * @param event Line status watch event.
+ */
+void gpiod_watch_event_unref(struct gpiod_watch_event *event);
+
+/**
+ * @brief Get the event type of this status change event.
+ * @param event Line status watch event.
+ * @return One of ::GPIOD_WATCH_EVENT_LINE_REQUESTED,
+ *         ::GPIOD_WATCH_EVENT_LINE_RELEASED or
+ *         ::GPIOD_WATCH_EVENT_LINE_CONFIG_CHANGED.
+ */
+int gpiod_watch_event_get_event_type(struct gpiod_watch_event *event);
+
+/**
+ * @brief Get the line info snapshot at the time of the watch event occurence.
+ * @param event Line status watch event.
+ * @return Reference to the line info object whose lifetime must be managed
+ *         by the caller.
+ */
+struct gpiod_line_info *
+gpiod_watch_event_get_line_info(struct gpiod_watch_event *event);
+
+/**
+ * @brief Get the timestamp of the event.
+ * @param event Line status watch event.
+ * @return Timestamp in nanoseconds.
+ */
+uint64_t gpiod_watch_event_get_timestamp(struct gpiod_watch_event *event);
+
 /**
  * @}
  *
diff --git a/lib/Makefile.am b/lib/Makefile.am
index 8713d52..5d9b998 100644
--- a/lib/Makefile.am
+++ b/lib/Makefile.am
@@ -13,7 +13,8 @@ libgpiod_la_SOURCES =	attr.c \
 			mask.c \
 			misc.c \
 			request.c \
-			uapi/gpio.h
+			uapi/gpio.h \
+			watch.c
 
 libgpiod_la_CFLAGS = -Wall -Wextra -g -std=gnu89
 libgpiod_la_CFLAGS += -fvisibility=hidden -I$(top_srcdir)/include/
diff --git a/lib/chip.c b/lib/chip.c
index 9bacfe7..6fb4c1b 100644
--- a/lib/chip.c
+++ b/lib/chip.c
@@ -117,33 +117,84 @@ GPIOD_API unsigned int gpiod_chip_get_num_lines(struct gpiod_chip *chip)
 }
 
 static int chip_read_line_info(int fd, unsigned int offset,
-			       struct gpio_v2_line_info *infobuf)
+			       struct gpio_v2_line_info *infobuf, bool watch)
 {
-	int ret;
+	int ret, cmd;
 
 	memset(infobuf, 0, sizeof(*infobuf));
 	infobuf->offset = offset;
 
-	ret = ioctl(fd, GPIO_V2_GET_LINEINFO_IOCTL, infobuf);
+	cmd = watch ? GPIO_V2_GET_LINEINFO_WATCH_IOCTL :
+		      GPIO_V2_GET_LINEINFO_IOCTL;
+
+	ret = ioctl(fd, cmd, infobuf);
 	if (ret)
 		return -1;
 
 	return 0;
 }
 
-GPIOD_API struct gpiod_line_info *
-gpiod_chip_get_line_info(struct gpiod_chip *chip, unsigned int offset)
+static struct gpiod_line_info *
+chip_get_line_info(struct gpiod_chip *chip, unsigned int offset, bool watch)
 {
 	struct gpio_v2_line_info infobuf;
 	int ret;
 
-	ret = chip_read_line_info(chip->fd, offset, &infobuf);
+	ret = chip_read_line_info(chip->fd, offset, &infobuf, watch);
 	if (ret)
 		return NULL;
 
 	return gpiod_line_info_from_kernel(&infobuf);
 }
 
+GPIOD_API struct gpiod_line_info *
+gpiod_chip_get_line_info(struct gpiod_chip *chip, unsigned int offset)
+{
+	return chip_get_line_info(chip, offset, false);
+}
+
+GPIOD_API struct gpiod_line_info *
+gpiod_chip_watch_line_info(struct gpiod_chip *chip, unsigned int offset)
+{
+	return chip_get_line_info(chip, offset, true);
+}
+
+GPIOD_API int gpiod_chip_unwatch_line_info(struct gpiod_chip *chip,
+					   unsigned int offset)
+{
+	return ioctl(chip->fd, GPIO_GET_LINEINFO_UNWATCH_IOCTL, &offset);
+}
+
+GPIOD_API int gpiod_chip_get_fd(struct gpiod_chip *chip)
+{
+	return chip->fd;
+}
+
+GPIOD_API int gpiod_chip_watch_event_wait(struct gpiod_chip *chip,
+					  uint64_t timeout)
+{
+	return gpiod_poll_fd(chip->fd, timeout);
+}
+
+GPIOD_API struct gpiod_watch_event *
+gpiod_chip_watch_event_read(struct gpiod_chip *chip)
+{
+	struct gpio_v2_line_info_changed evbuf;
+	ssize_t rd;
+
+	memset(&evbuf, 0, sizeof(evbuf));
+
+	rd = read(chip->fd, &evbuf, sizeof(evbuf));
+	if (rd < 0) {
+		return NULL;
+	} else if ((unsigned int)rd < sizeof(evbuf)) {
+		errno = EIO;
+		return NULL;
+	}
+
+	return gpiod_watch_event_from_kernel(&evbuf);
+}
+
 GPIOD_API int gpiod_chip_find_line(struct gpiod_chip *chip, const char *name)
 {
 	struct gpio_v2_line_info infobuf;
@@ -151,7 +202,7 @@ GPIOD_API int gpiod_chip_find_line(struct gpiod_chip *chip, const char *name)
 	int ret;
 
 	for (offset = 0; offset < chip->num_lines; offset++) {
-		ret = chip_read_line_info(chip->fd, offset, &infobuf);
+		ret = chip_read_line_info(chip->fd, offset, &infobuf, false);
 		if (ret)
 			return -1;
 
diff --git a/lib/handle.c b/lib/handle.c
index abd08f9..9fccb7c 100644
--- a/lib/handle.c
+++ b/lib/handle.c
@@ -5,7 +5,6 @@
 
 #include <errno.h>
 #include <gpiod.h>
-#include <poll.h>
 #include <stdlib.h>
 #include <string.h>
 #include <sys/ioctl.h>
@@ -110,24 +109,7 @@ GPIOD_API int
 gpiod_request_handle_event_wait(struct gpiod_request_handle *handle,
 				uint64_t timeout)
 {
-	struct timespec ts;
-	struct pollfd pfd;
-	int ret;
-
-	memset(&pfd, 0, sizeof(pfd));
-	pfd.fd = handle->fd;
-	pfd.events = POLLIN | POLLPRI;
-
-	ts.tv_sec = timeout / 1000000000ULL;
-	ts.tv_nsec = timeout % 1000000000ULL;
-
-	ret = ppoll(&pfd, 1, &ts, NULL);
-	if (ret < 0)
-		return -1;
-	else if (ret == 0)
-		return 0;
-
-	return 1;
+	return gpiod_poll_fd(handle->fd, timeout);
 }
 
 GPIOD_API int
diff --git a/lib/internal.c b/lib/internal.c
index 06adcd2..66a42e6 100644
--- a/lib/internal.c
+++ b/lib/internal.c
@@ -2,6 +2,8 @@
 // SPDX-FileCopyrightText: 2021 Bartosz Golaszewski <brgl@bgdev.pl>
 
 #include <errno.h>
+#include <poll.h>
+#include <string.h>
 
 #include "internal.h"
 
@@ -121,3 +123,25 @@ uint64_t gpiod_make_kernel_flags(int request_type, int drive, int bias,
 
 	return flags;
 }
+
+int gpiod_poll_fd(int fd, uint64_t timeout)
+{
+	struct timespec ts;
+	struct pollfd pfd;
+	int ret;
+
+	memset(&pfd, 0, sizeof(pfd));
+	pfd.fd = fd;
+	pfd.events = POLLIN | POLLPRI;
+
+	ts.tv_sec = timeout / 1000000000ULL;
+	ts.tv_nsec = timeout % 1000000000ULL;
+
+	ret = ppoll(&pfd, 1, &ts, NULL);
+	if (ret < 0)
+		return -1;
+	else if (ret == 0)
+		return 0;
+
+	return 1;
+}
diff --git a/lib/internal.h b/lib/internal.h
index 2677ee3..fa2bc04 100644
--- a/lib/internal.h
+++ b/lib/internal.h
@@ -42,9 +42,13 @@ void gpiod_line_attr_to_kernel(struct gpiod_line_attr *attr,
 uint64_t gpiod_make_kernel_flags(int request_type, int drive, int bias,
 				 bool active_low, bool clock_realtime);
 struct gpiod_request_handle *gpiod_request_handle_from_fd(int fd);
+struct gpiod_watch_event *
+gpiod_watch_event_from_kernel(struct gpio_v2_line_info_changed *evbuf);
 
 int gpiod_validate_request_type(int request_type);
 int gpiod_validate_drive(int drive);
 int gpiod_validate_bias(int bias);
 
+int gpiod_poll_fd(int fd, uint64_t timeout);
+
 #endif /* __LIBGPIOD_GPIOD_INTERNAL_H__ */
diff --git a/lib/watch.c b/lib/watch.c
new file mode 100644
index 0000000..bc1721d
--- /dev/null
+++ b/lib/watch.c
@@ -0,0 +1,96 @@
+// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-FileCopyrightText: 2021 Bartosz Golaszewski <brgl@bgdev.pl>
+
+/* Line status watch. */
+
+#include <errno.h>
+#include <stdlib.h>
+#include <string.h>
+
+#include "internal.h"
+
+struct gpiod_watch_event {
+	struct gpiod_refcount refcount;
+	int event_type;
+	uint64_t timestamp;
+	struct gpiod_line_info *info;
+};
+
+static void watch_event_release(struct gpiod_refcount *refcount)
+{
+	struct gpiod_watch_event *event;
+
+	event = gpiod_container_of(refcount,
+				   struct gpiod_watch_event, refcount);
+
+	gpiod_line_info_unref(event->info);
+	free(event);
+}
+
+struct gpiod_watch_event *
+gpiod_watch_event_from_kernel(struct gpio_v2_line_info_changed *evbuf)
+{
+	struct gpiod_watch_event *event;
+
+	event = malloc(sizeof(*event));
+	if (!event)
+		return NULL;
+
+	memset(event, 0, sizeof(*event));
+	gpiod_refcount_init(&event->refcount, watch_event_release);
+	event->timestamp = evbuf->timestamp_ns;
+
+	switch (evbuf->event_type) {
+	case GPIOLINE_CHANGED_REQUESTED:
+		event->event_type = GPIOD_WATCH_EVENT_LINE_REQUESTED;
+		break;
+	case GPIOLINE_CHANGED_RELEASED:
+		event->event_type = GPIOD_WATCH_EVENT_LINE_RELEASED;
+		break;
+	case GPIOLINE_CHANGED_CONFIG:
+		event->event_type = GPIOD_WATCH_EVENT_LINE_CONFIG_CHANGED;
+		break;
+	default:
+		/* Can't happen unless there's a bug in the kernel. */
+		errno = ENOMSG;
+		free(event);
+		return NULL;
+	}
+
+	event->info = gpiod_line_info_from_kernel(&evbuf->info);
+	if (!event->info) {
+		free(event);
+		return NULL;
+	}
+
+	return event;
+}
+
+GPIOD_API struct gpiod_watch_event *
+gpiod_watch_event_ref(struct gpiod_watch_event *event)
+{
+	gpiod_refcount_ref(&event->refcount);
+	return event;
+}
+
+GPIOD_API void gpiod_watch_event_unref(struct gpiod_watch_event *event)
+{
+	gpiod_refcount_unref(&event->refcount);
+}
+
+GPIOD_API int gpiod_watch_event_get_event_type(struct gpiod_watch_event *event)
+{
+	return event->event_type;
+}
+
+GPIOD_API struct gpiod_line_info *
+gpiod_watch_event_get_line_info(struct gpiod_watch_event *event)
+{
+	return gpiod_line_info_ref(event->info);
+}
+
+GPIOD_API uint64_t
+gpiod_watch_event_get_timestamp(struct gpiod_watch_event *event)
+{
+	return event->timestamp;
+}
-- 
2.30.1

