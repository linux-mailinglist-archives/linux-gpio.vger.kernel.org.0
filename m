Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 302EC35AE8C
	for <lists+linux-gpio@lfdr.de>; Sat, 10 Apr 2021 16:52:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234754AbhDJOwf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 10 Apr 2021 10:52:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234708AbhDJOwf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 10 Apr 2021 10:52:35 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CBFAC06138A
        for <linux-gpio@vger.kernel.org>; Sat, 10 Apr 2021 07:52:20 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id w4so4677824wrt.5
        for <linux-gpio@vger.kernel.org>; Sat, 10 Apr 2021 07:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gww/julcMQ0AcjRgiAUqG+COB5fdS769tKh6lfjtJ0A=;
        b=irHpS6LajtqjNekinx+bTW/iE3FWHdPrBZsph/9K7v+0vy9Z5DXWcIZ4WfU8yBP+KM
         /zneD52VoEt9sK90JYZ6Lw91JXuK77g/dXxZDXN85ouFkQ5/t6MwAeVIoHlrhKn4ShcH
         mEflUf3vYi9XrRw4+84/z2IsjHGtdlHHbn3G8XSyxC7V/BImEue4OFafG97q89RyYMc0
         zzzMZWHWIwZNSzbrVev3cBxP38Uuxf92mrG8SDyn3ndz3wx/JE1c954eCLR4axMeY82L
         3O896vkaMNy0a9xxUihUnxtX7/bQhERSEwMyDqlJsq2d4D/KPz77Qd6Yux1UA1HAxLqe
         fp9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gww/julcMQ0AcjRgiAUqG+COB5fdS769tKh6lfjtJ0A=;
        b=mGgtgS79TryUDLlwkx/uH3HF+2aAzxKWU09672awTy3ZtZNz3wXn3Ir+6SPKWzc1m8
         5X7u7pw5ZF2KSupiSlHlM0pSchMuGpRNEyTJ/2Nomli34qWyvST2ILse1dym8YnW0+hS
         aq6npEtN/TRz0JDQjLeh9nAg5QldUT0c308+cTqycCarNiK5tt48yGjliB4UdiCRDqzc
         JoE+lQOLY089YNtRjmybLE8QyBnXmqkPylmnh9NCmknrjw1ZM7ynxJGC8tcTi5JvD9wu
         WOu5nzVyVRUr8tns8lIWwNCgkTQ3tnrjMPlQ4QhUNO8ce+SlTvxMwEEczEI6zJopVMPs
         QOLQ==
X-Gm-Message-State: AOAM532Kn9mHzCs5SbNqzdcWRNVJj+OQqTJLd6XuwzbyU5NRaqa2LIMu
        7YgWYFfR63LxCbM9/4a8KGRZKw==
X-Google-Smtp-Source: ABdhPJxaAQaEqqqAfTOkIrzI3SniMe9G2bZKBwJ1EgAL96tii2Ir0NZDCjgKtkhbBPVXrcPimejFkQ==
X-Received: by 2002:adf:f543:: with SMTP id j3mr22376774wrp.259.1618066338837;
        Sat, 10 Apr 2021 07:52:18 -0700 (PDT)
Received: from debian-brgl.home (lfbn-nic-1-149-6.w2-15.abo.wanadoo.fr. [2.15.231.6])
        by smtp.gmail.com with ESMTPSA id a15sm9167083wrr.53.2021.04.10.07.52.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Apr 2021 07:52:18 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [libgpiod][RFC 4/6] core: rework line events
Date:   Sat, 10 Apr 2021 16:51:55 +0200
Message-Id: <20210410145157.30718-5-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210410145157.30718-1-brgl@bgdev.pl>
References: <20210410145157.30718-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Introduce opaque event objects: gpiod_line_event and
gpiod_line_event_buffer. The latter serves as a container into which
multiple events can be read without having to dynamically allocate memory
for each one as reading line events should be as fast as possible.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 include/gpiod.h     |  65 +++---
 lib/Makefile.am     |   9 +-
 lib/core.c          |  98 +--------
 lib/event.c         | 250 +++++++++++++++++++++++
 lib/misc.c          |   5 +
 tests/gpiod-test.h  |   3 +
 tests/tests-event.c | 470 ++++++++++++++++++++++++++++++++------------
 tools/gpiomon.c     |  45 +++--
 8 files changed, 690 insertions(+), 255 deletions(-)
 create mode 100644 lib/event.c

diff --git a/include/gpiod.h b/include/gpiod.h
index 7da9ff4..e99233b 100644
--- a/include/gpiod.h
+++ b/include/gpiod.h
@@ -6,7 +6,7 @@
 
 #include <stdbool.h>
 #include <stdlib.h>
-#include <time.h>
+#include <stdint.h>
 
 #ifdef __cplusplus
 extern "C" {
@@ -37,6 +37,8 @@ struct gpiod_chip;
 struct gpiod_line;
 struct gpiod_line_info;
 struct gpiod_line_bulk;
+struct gpiod_line_event;
+struct gpiod_line_event_buffer;
 
 /**
  * @defgroup common Common helper macros
@@ -928,17 +930,35 @@ enum {
 	/**< Falling edge event. */
 };
 
-/**
- * @brief Structure holding event info.
- */
-struct gpiod_line_event {
-	struct timespec ts;
-	/**< Best estimate of time of event occurrence. */
-	int event_type;
-	/**< Type of the event that occurred. */
-	int offset;
-	/**< Offset of line on which the event occurred. */
-};
+struct gpiod_line_event *gpiod_line_event_ref(struct gpiod_line_event *event);
+
+void gpiod_line_event_unref(struct gpiod_line_event *event);
+
+int gpiod_line_event_get_event_type(struct gpiod_line_event *event);
+
+uint64_t gpiod_line_event_get_timestamp(struct gpiod_line_event *event);
+
+unsigned int gpiod_line_event_get_line_offset(struct gpiod_line_event *event);
+
+unsigned int gpiod_line_event_get_global_seqno(struct gpiod_line_event *event);
+
+unsigned int gpiod_line_event_get_line_seqno(struct gpiod_line_event *event);
+
+struct gpiod_line_event_buffer *
+gpiod_line_event_buffer_new(unsigned int capacity);
+
+struct gpiod_line_event_buffer *
+gpiod_line_event_buffer_ref(struct gpiod_line_event_buffer *buf);
+
+void gpiod_line_event_buffer_unref(struct gpiod_line_event_buffer *buf);
+
+struct gpiod_line_event *
+gpiod_line_event_buffer_get_event(struct gpiod_line_event_buffer *buf,
+				  unsigned long index);
+
+struct gpiod_line_event *
+gpiod_line_event_buffer_copy_event(struct gpiod_line_event_buffer *buf,
+				   unsigned long index);
 
 /**
  * @brief Wait for an event on a single line.
@@ -947,8 +967,7 @@ struct gpiod_line_event {
  * @return 0 if wait timed out, -1 if an error occurred, 1 if an event
  *         occurred.
  */
-int gpiod_line_event_wait(struct gpiod_line *line,
-			  const struct timespec *timeout);
+int gpiod_line_event_wait(struct gpiod_line *line, uint64_t timeout);
 
 /**
  * @brief Wait for events on a set of lines.
@@ -959,8 +978,7 @@ int gpiod_line_event_wait(struct gpiod_line *line,
  * @return 0 if wait timed out, -1 if an error occurred, 1 if at least one
  *         event occurred.
  */
-int gpiod_line_event_wait_bulk(struct gpiod_line_bulk *bulk,
-			       const struct timespec *timeout,
+int gpiod_line_event_wait_bulk(struct gpiod_line_bulk *bulk, uint64_t timeout,
 			       struct gpiod_line_bulk *event_bulk);
 
 /**
@@ -971,7 +989,7 @@ int gpiod_line_event_wait_bulk(struct gpiod_line_bulk *bulk,
  * @note This function will block if no event was queued for this line.
  */
 int gpiod_line_event_read(struct gpiod_line *line,
-			  struct gpiod_line_event *event);
+			  struct gpiod_line_event_buffer *buf);
 
 /**
  * @brief Read up to a certain number of events from the GPIO line.
@@ -983,7 +1001,7 @@ int gpiod_line_event_read(struct gpiod_line *line,
  *         failure -1 is returned.
  */
 int gpiod_line_event_read_multiple(struct gpiod_line *line,
-				   struct gpiod_line_event *events,
+				   struct gpiod_line_event_buffer *buf,
 				   unsigned int num_events);
 
 /**
@@ -1008,19 +1026,20 @@ int gpiod_line_event_get_fd(struct gpiod_line *line);
  * directly read the event data from it using this routine. This function
  * translates the kernel representation of the event to the libgpiod format.
  */
-int gpiod_line_event_read_fd(int fd, struct gpiod_line_event *event);
+int gpiod_line_event_read_fd(int fd, struct gpiod_line_event_buffer *buf);
 
 /**
  * @brief Read up to a certain number of events directly from a file descriptor.
  * @param fd File descriptor.
  * @param events Buffer to which the event data will be copied. Must hold at
  *               least the amount of events specified in num_events.
- * @param num_events Specifies how many events can be stored in the buffer.
+ * @param max_events Specifies the maximum number of events to read.
  * @return On success returns the number of events stored in the buffer, on
  *         failure -1 is returned.
  */
-int gpiod_line_event_read_fd_multiple(int fd, struct gpiod_line_event *events,
-				      unsigned int num_events);
+int gpiod_line_event_read_fd_multiple(int fd,
+				      struct gpiod_line_event_buffer *buf,
+				      unsigned int max_events);
 
 /**
  * @}
@@ -1033,6 +1052,8 @@ int gpiod_line_event_read_fd_multiple(int fd, struct gpiod_line_event *events,
  * Various libgpiod-related functions.
  */
 
+uint64_t gpiod_sec_to_nsec(uint64_t sec);
+
 /**
  * @brief Get the API version of the library as a human-readable string.
  * @return Human-readable string containing the library version.
diff --git a/lib/Makefile.am b/lib/Makefile.am
index c5d6070..0f19eec 100644
--- a/lib/Makefile.am
+++ b/lib/Makefile.am
@@ -2,7 +2,14 @@
 # SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 lib_LTLIBRARIES = libgpiod.la
-libgpiod_la_SOURCES = core.c helpers.c internal.c internal.h info.c misc.c uapi/gpio.h
+libgpiod_la_SOURCES =	core.c \
+			event.c \
+			helpers.c \
+			internal.h \
+			internal.c \
+			info.c \
+			misc.c \
+			uapi/gpio.h
 libgpiod_la_CFLAGS = -Wall -Wextra -g -std=gnu89
 libgpiod_la_CFLAGS += -fvisibility=hidden -I$(top_srcdir)/include/
 libgpiod_la_CFLAGS += -include $(top_builddir)/config.h
diff --git a/lib/core.c b/lib/core.c
index 526dcaa..ed65653 100644
--- a/lib/core.c
+++ b/lib/core.c
@@ -15,6 +15,7 @@
 #include <sys/stat.h>
 #include <sys/sysmacros.h>
 #include <sys/types.h>
+#include <time.h>
 #include <unistd.h>
 
 #include "internal.h"
@@ -1060,8 +1061,7 @@ GPIOD_API int gpiod_line_set_direction_output_bulk(struct gpiod_line_bulk *bulk,
 					  line->req_flags, values);
 }
 
-GPIOD_API int gpiod_line_event_wait(struct gpiod_line *line,
-				    const struct timespec *timeout)
+GPIOD_API int gpiod_line_event_wait(struct gpiod_line *line, uint64_t timeout)
 {
 	struct gpiod_line_bulk bulk = BULK_SINGLE_LINE_INIT(line);
 
@@ -1069,12 +1069,13 @@ GPIOD_API int gpiod_line_event_wait(struct gpiod_line *line,
 }
 
 GPIOD_API int gpiod_line_event_wait_bulk(struct gpiod_line_bulk *bulk,
-					 const struct timespec *timeout,
+					 uint64_t timeout,
 					 struct gpiod_line_bulk *event_bulk)
 {
 	struct pollfd fds[LINE_REQUEST_MAX_LINES];
 	unsigned int off, num_lines;
 	struct gpiod_line *line;
+	struct timespec ts;
 	int rv;
 
 	if (!line_bulk_all_requested(bulk))
@@ -1088,7 +1089,10 @@ GPIOD_API int gpiod_line_event_wait_bulk(struct gpiod_line_bulk *bulk,
 		fds[off].events = POLLIN | POLLPRI;
 	}
 
-	rv = ppoll(fds, num_lines, timeout, NULL);
+	ts.tv_sec = timeout / 1000000000ULL;
+	ts.tv_nsec = timeout % 1000000000ULL;
+
+	rv = ppoll(fds, num_lines, &ts, NULL);
 	if (rv < 0)
 		return -1;
 	else if (rv == 0)
@@ -1116,31 +1120,6 @@ GPIOD_API int gpiod_line_event_wait_bulk(struct gpiod_line_bulk *bulk,
 	return 1;
 }
 
-GPIOD_API int gpiod_line_event_read(struct gpiod_line *line,
-				    struct gpiod_line_event *event)
-{
-	int ret;
-
-	ret = gpiod_line_event_read_multiple(line, event, 1);
-	if (ret < 0)
-		return -1;
-
-	return 0;
-}
-
-GPIOD_API int gpiod_line_event_read_multiple(struct gpiod_line *line,
-					     struct gpiod_line_event *events,
-					     unsigned int num_events)
-{
-	int fd;
-
-	fd = gpiod_line_event_get_fd(line);
-	if (fd < 0)
-		return -1;
-
-	return gpiod_line_event_read_fd_multiple(fd, events, num_events);
-}
-
 GPIOD_API int gpiod_line_event_get_fd(struct gpiod_line *line)
 {
 	if (line->state != LINE_REQUESTED_EVENTS) {
@@ -1150,64 +1129,3 @@ GPIOD_API int gpiod_line_event_get_fd(struct gpiod_line *line)
 
 	return line_get_fd(line);
 }
-
-GPIOD_API int gpiod_line_event_read_fd(int fd, struct gpiod_line_event *event)
-{
-	int ret;
-
-	ret = gpiod_line_event_read_fd_multiple(fd, event, 1);
-	if (ret < 0)
-		return -1;
-
-	return 0;
-}
-
-GPIOD_API int gpiod_line_event_read_fd_multiple(int fd,
-						struct gpiod_line_event *events,
-						unsigned int num_events)
-{
-	/*
-	 * 16 is the maximum number of events the kernel can store in the FIFO
-	 * so we can allocate the buffer on the stack.
-	 *
-	 * NOTE: This is no longer strictly true for uAPI v2.  While 16 is
-	 * the default for single line, a request with multiple lines will
-	 * have a larger buffer.  So need to rethink the allocation here,
-	 * or at least the comment above...
-	 */
-	struct gpio_v2_line_event evdata[16], *curr;
-	struct gpiod_line_event *event;
-	unsigned int events_read, i;
-	ssize_t rd;
-
-	memset(evdata, 0, sizeof(evdata));
-
-	if (num_events > 16)
-		num_events = 16;
-
-	rd = read(fd, evdata, num_events * sizeof(*evdata));
-	if (rd < 0) {
-		return -1;
-	} else if ((unsigned int)rd < sizeof(*evdata)) {
-		errno = EIO;
-		return -1;
-	}
-
-	events_read = rd / sizeof(*evdata);
-	if (events_read < num_events)
-		num_events = events_read;
-
-	for (i = 0; i < num_events; i++) {
-		curr = &evdata[i];
-		event = &events[i];
-
-		event->offset = curr->offset;
-		event->event_type = curr->id == GPIO_V2_LINE_EVENT_RISING_EDGE
-					? GPIOD_LINE_EVENT_RISING_EDGE
-					: GPIOD_LINE_EVENT_FALLING_EDGE;
-		event->ts.tv_sec = curr->timestamp_ns / 1000000000ULL;
-		event->ts.tv_nsec = curr->timestamp_ns % 1000000000ULL;
-	}
-
-	return i;
-}
diff --git a/lib/event.c b/lib/event.c
new file mode 100644
index 0000000..f4dfce8
--- /dev/null
+++ b/lib/event.c
@@ -0,0 +1,250 @@
+// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-FileCopyrightText: 2021 Bartosz Golaszewski <brgl@bgdev.pl>
+
+#include <errno.h>
+#include <gpiod.h>
+#include <string.h>
+#include <unistd.h>
+
+#include "internal.h"
+#include "uapi/gpio.h"
+
+/* As defined in the kernel. */
+#define EVENT_BUFFER_MAX_CAPACITY	(GPIO_V2_LINES_MAX * 16)
+
+struct gpiod_line_event {
+	struct gpiod_refcount refcount;
+	int event_type;
+	uint64_t timestamp;
+	unsigned int line_offset;
+	unsigned int global_seqno;
+	unsigned int line_seqno;
+};
+
+struct gpiod_line_event_buffer {
+	struct gpiod_refcount refcount;
+	unsigned int capacity;
+	unsigned int num_events;
+	struct gpiod_line_event *events;
+	struct gpio_v2_line_event *event_data;
+};
+
+static void line_event_release(struct gpiod_refcount *refcount)
+{
+	struct gpiod_line_event *event;
+
+	event = gpiod_container_of(refcount, struct gpiod_line_event, refcount);
+
+	free(event);
+}
+
+GPIOD_API struct gpiod_line_event *
+gpiod_line_event_ref(struct gpiod_line_event *event)
+{
+	gpiod_refcount_ref(&event->refcount);
+	return event;
+}
+
+GPIOD_API void gpiod_line_event_unref(struct gpiod_line_event *event)
+{
+	gpiod_refcount_unref(&event->refcount);
+}
+
+GPIOD_API int gpiod_line_event_get_event_type(struct gpiod_line_event *event)
+{
+	return event->event_type;
+}
+
+GPIOD_API uint64_t
+gpiod_line_event_get_timestamp(struct gpiod_line_event *event)
+{
+	return event->timestamp;
+}
+
+GPIOD_API unsigned int
+gpiod_line_event_get_line_offset(struct gpiod_line_event *event)
+{
+	return event->line_offset;
+}
+
+GPIOD_API unsigned int
+gpiod_line_event_get_global_seqno(struct gpiod_line_event *event)
+{
+	return event->global_seqno;
+}
+
+GPIOD_API unsigned int
+gpiod_line_event_get_line_seqno(struct gpiod_line_event *event)
+{
+	return event->line_seqno;
+}
+
+static void line_event_buffer_release(struct gpiod_refcount *refcount)
+{
+	struct gpiod_line_event_buffer *buf;
+
+	buf = gpiod_container_of(refcount,
+				 struct gpiod_line_event_buffer, refcount);
+
+	free(buf);
+}
+
+GPIOD_API struct gpiod_line_event_buffer *
+gpiod_line_event_buffer_new(unsigned int capacity)
+{
+	struct gpiod_line_event_buffer *buf;
+
+	if (capacity == 0 || capacity > EVENT_BUFFER_MAX_CAPACITY) {
+		errno = EINVAL;
+		return NULL;
+	}
+
+	buf = malloc(sizeof(*buf));
+	if (!buf)
+		return NULL;
+
+	memset(buf, 0, sizeof(*buf));
+	gpiod_refcount_init(&buf->refcount, line_event_buffer_release);
+	buf->capacity = capacity;
+
+	buf->events = calloc(capacity, sizeof(*buf->events));
+	if (!buf->events) {
+		free(buf);
+		return NULL;
+	}
+
+	buf->event_data = calloc(capacity, sizeof(*buf->event_data));
+	if (!buf->event_data) {
+		free(buf->events);
+		free(buf);
+		return NULL;
+	}
+
+	return buf;
+}
+
+GPIOD_API struct gpiod_line_event_buffer *
+gpiod_line_event_buffer_ref(struct gpiod_line_event_buffer *buf)
+{
+	gpiod_refcount_ref(&buf->refcount);
+	return buf;
+}
+
+GPIOD_API void
+gpiod_line_event_buffer_unref(struct gpiod_line_event_buffer *buf)
+{
+	gpiod_refcount_unref(&buf->refcount);
+}
+
+GPIOD_API struct gpiod_line_event *
+gpiod_line_event_buffer_get_event(struct gpiod_line_event_buffer *buf,
+				  unsigned long index)
+{
+	if (index >= buf->num_events) {
+		errno = EINVAL;
+		return NULL;
+	}
+
+	return &buf->events[index];
+}
+
+GPIOD_API struct gpiod_line_event *
+gpiod_line_event_buffer_copy_event(struct gpiod_line_event_buffer *buf,
+                                   unsigned long index)
+{
+	struct gpiod_line_event *event;
+
+	if (index >= buf->num_events) {
+		errno = EINVAL;
+		return NULL;
+	}
+
+	event = malloc(sizeof(*event));
+	if (!event)
+		return NULL;
+
+	memcpy(event, &buf->events[index], sizeof(*event));
+	gpiod_refcount_init(&event->refcount, line_event_release);
+
+	return event;
+}
+
+GPIOD_API int gpiod_line_event_read(struct gpiod_line *line,
+				    struct gpiod_line_event_buffer *buf)
+{
+	int ret;
+
+	ret = gpiod_line_event_read_multiple(line, buf, 1);
+	if (ret < 0)
+		return -1;
+
+	return 0;
+}
+
+GPIOD_API int
+gpiod_line_event_read_multiple(struct gpiod_line *line,
+			       struct gpiod_line_event_buffer *buf,
+			       unsigned int num_events)
+{
+	int fd;
+
+	fd = gpiod_line_event_get_fd(line);
+	if (fd < 0)
+		return -1;
+
+	return gpiod_line_event_read_fd_multiple(fd, buf, num_events);
+}
+
+GPIOD_API int gpiod_line_event_read_fd(int fd,
+				       struct gpiod_line_event_buffer *buf)
+{
+	int ret;
+
+	ret = gpiod_line_event_read_fd_multiple(fd, buf, 1);
+	if (ret < 0)
+		return -1;
+
+	return 0;
+}
+
+GPIOD_API int
+gpiod_line_event_read_fd_multiple(int fd,
+				  struct gpiod_line_event_buffer *buf,
+				  unsigned int max_events)
+{
+	struct gpio_v2_line_event *curr;
+	struct gpiod_line_event *event;
+	unsigned int i;
+	ssize_t rd;
+
+	memset(buf->event_data, 0, sizeof(*buf->event_data) * buf->capacity);
+	memset(buf->events, 0, sizeof(*buf->events) * buf->capacity);
+
+	if (max_events > buf->capacity)
+		max_events = buf->capacity;
+
+	rd = read(fd, buf->event_data, max_events * sizeof(*buf->event_data));
+	if (rd < 0) {
+		return -1;
+	} else if ((unsigned int)rd < sizeof(*buf->event_data)) {
+		errno = EIO;
+		return -1;
+	}
+
+	buf->num_events = rd / sizeof(*buf->event_data);
+
+	for (i = 0; i < buf->num_events; i++) {
+		curr = &buf->event_data[i];
+		event = &buf->events[i];
+
+		event->line_offset = curr->offset;
+		event->event_type = curr->id == GPIO_V2_LINE_EVENT_RISING_EDGE
+					? GPIOD_LINE_EVENT_RISING_EDGE
+					: GPIOD_LINE_EVENT_FALLING_EDGE;
+		event->timestamp = curr->timestamp_ns;
+		event->global_seqno = curr->seqno;
+		event->line_seqno = curr->line_seqno;
+	}
+
+	return i;
+}
diff --git a/lib/misc.c b/lib/misc.c
index 984405b..67654f9 100644
--- a/lib/misc.c
+++ b/lib/misc.c
@@ -7,6 +7,11 @@
 
 #include "internal.h"
 
+GPIOD_API uint64_t gpiod_sec_to_nsec(uint64_t sec)
+{
+	return sec * 1000000000ULL;
+}
+
 GPIOD_API const char *gpiod_version_string(void)
 {
 	return GPIOD_VERSION_STR;
diff --git a/tests/gpiod-test.h b/tests/gpiod-test.h
index 6b93a96..236cb16 100644
--- a/tests/gpiod-test.h
+++ b/tests/gpiod-test.h
@@ -22,10 +22,13 @@
 typedef struct gpiod_chip gpiod_chip_struct;
 typedef struct gpiod_line_bulk gpiod_line_bulk_struct;
 typedef struct gpiod_line_info gpiod_line_info_struct;
+typedef struct gpiod_line_event_buffer gpiod_line_event_buffer_struct;
 
 G_DEFINE_AUTOPTR_CLEANUP_FUNC(gpiod_chip_struct, gpiod_chip_unref);
 G_DEFINE_AUTOPTR_CLEANUP_FUNC(gpiod_line_bulk_struct, gpiod_line_bulk_free);
 G_DEFINE_AUTOPTR_CLEANUP_FUNC(gpiod_line_info_struct, gpiod_line_info_unref);
+G_DEFINE_AUTOPTR_CLEANUP_FUNC(gpiod_line_event_buffer_struct,
+			      gpiod_line_event_buffer_unref);
 
 /* These are private definitions and should not be used directly. */
 typedef void (*_gpiod_test_func)(void);
diff --git a/tests/tests-event.c b/tests/tests-event.c
index 53d3e8c..cb4aac4 100644
--- a/tests/tests-event.c
+++ b/tests/tests-event.c
@@ -10,10 +10,11 @@
 
 GPIOD_TEST_CASE(rising_edge_good, 0, { 8 })
 {
+	g_autoptr(gpiod_line_event_buffer_struct) event_buf = NULL;
 	g_autoptr(GpiodTestEventThread) ev_thread = NULL;
 	g_autoptr(gpiod_chip_struct) chip = NULL;
-	struct timespec ts = { 1, 0 };
-	struct gpiod_line_event ev;
+	uint64_t timeout = gpiod_sec_to_nsec(1);
+	struct gpiod_line_event *event;
 	struct gpiod_line *line;
 	gint ret;
 
@@ -21,6 +22,10 @@ GPIOD_TEST_CASE(rising_edge_good, 0, { 8 })
 	g_assert_nonnull(chip);
 	gpiod_test_return_if_failed();
 
+	event_buf = gpiod_line_event_buffer_new(1);
+	g_assert_nonnull(event_buf);
+	gpiod_test_return_if_failed();
+
 	line = gpiod_chip_get_line(chip, 7);
 	g_assert_nonnull(line);
 	gpiod_test_return_if_failed();
@@ -31,21 +36,27 @@ GPIOD_TEST_CASE(rising_edge_good, 0, { 8 })
 
 	ev_thread = gpiod_test_start_event_thread(0, 7, 100);
 
-	ret = gpiod_line_event_wait(line, &ts);
+	ret = gpiod_line_event_wait(line, timeout);
 	g_assert_cmpint(ret, ==, 1);
 
-	ret = gpiod_line_event_read(line, &ev);
+	ret = gpiod_line_event_read(line, event_buf);
 	g_assert_cmpint(ret, ==, 0);
 
-	g_assert_cmpint(ev.event_type, ==, GPIOD_LINE_EVENT_RISING_EDGE);
+	event = gpiod_line_event_buffer_get_event(event_buf, 0);
+	g_assert_nonnull(event);
+	gpiod_test_return_if_failed();
+
+	g_assert_cmpint(gpiod_line_event_get_event_type(event), ==,
+			GPIOD_LINE_EVENT_RISING_EDGE);
 }
 
 GPIOD_TEST_CASE(falling_edge_good, 0, { 8 })
 {
+	g_autoptr(gpiod_line_event_buffer_struct) event_buf = NULL;
 	g_autoptr(GpiodTestEventThread) ev_thread = NULL;
 	g_autoptr(gpiod_chip_struct) chip = NULL;
-	struct timespec ts = { 1, 0 };
-	struct gpiod_line_event ev;
+	uint64_t timeout = gpiod_sec_to_nsec(1);
+	struct gpiod_line_event *event;
 	struct gpiod_line *line;
 	gint ret;
 
@@ -53,6 +64,10 @@ GPIOD_TEST_CASE(falling_edge_good, 0, { 8 })
 	g_assert_nonnull(chip);
 	gpiod_test_return_if_failed();
 
+	event_buf = gpiod_line_event_buffer_new(1);
+	g_assert_nonnull(event_buf);
+	gpiod_test_return_if_failed();
+
 	line = gpiod_chip_get_line(chip, 7);
 	g_assert_nonnull(line);
 	gpiod_test_return_if_failed();
@@ -64,21 +79,29 @@ GPIOD_TEST_CASE(falling_edge_good, 0, { 8 })
 
 	ev_thread = gpiod_test_start_event_thread(0, 7, 100);
 
-	ret = gpiod_line_event_wait(line, &ts);
+	ret = gpiod_line_event_wait(line, timeout);
 	g_assert_cmpint(ret, ==, 1);
 
-	ret = gpiod_line_event_read(line, &ev);
+	ret = gpiod_line_event_read(line, event_buf);
 	g_assert_cmpint(ret, ==, 0);
 
-	g_assert_cmpint(ev.event_type, ==, GPIOD_LINE_EVENT_FALLING_EDGE);
+	event = gpiod_line_event_buffer_get_event(event_buf, 0);
+	g_assert_nonnull(event);
+	gpiod_test_return_if_failed();
+
+	g_assert_cmpint(gpiod_line_event_get_event_type(event), ==,
+			GPIOD_LINE_EVENT_FALLING_EDGE);
 }
 
 GPIOD_TEST_CASE(rising_edge_ignore_falling, 0, { 8 })
 {
+	g_autoptr(gpiod_line_event_buffer_struct) event_buf0 = NULL;
+	g_autoptr(gpiod_line_event_buffer_struct) event_buf1 = NULL;
+	g_autoptr(gpiod_line_event_buffer_struct) event_buf2 = NULL;
 	g_autoptr(GpiodTestEventThread) ev_thread = NULL;
 	g_autoptr(gpiod_chip_struct) chip = NULL;
-	struct timespec ts = { 1, 0 };
-	struct gpiod_line_event ev[3];
+	uint64_t timeout = gpiod_sec_to_nsec(1);
+	struct gpiod_line_event *events[3];
 	struct gpiod_line *line;
 	gint ret;
 
@@ -86,6 +109,14 @@ GPIOD_TEST_CASE(rising_edge_ignore_falling, 0, { 8 })
 	g_assert_nonnull(chip);
 	gpiod_test_return_if_failed();
 
+	event_buf0 = gpiod_line_event_buffer_new(1);
+	event_buf1 = gpiod_line_event_buffer_new(1);
+	event_buf2 = gpiod_line_event_buffer_new(1);
+	g_assert_nonnull(event_buf0);
+	g_assert_nonnull(event_buf1);
+	g_assert_nonnull(event_buf2);
+	gpiod_test_return_if_failed();
+
 	line = gpiod_chip_get_line(chip, 7);
 	g_assert_nonnull(line);
 	gpiod_test_return_if_failed();
@@ -96,32 +127,44 @@ GPIOD_TEST_CASE(rising_edge_ignore_falling, 0, { 8 })
 
 	ev_thread = gpiod_test_start_event_thread(0, 7, 100);
 
-	ret = gpiod_line_event_wait(line, &ts);
+	ret = gpiod_line_event_wait(line, timeout);
 	g_assert_cmpint(ret, ==, 1);
-	ret = gpiod_line_event_read(line, &ev[0]);
+	ret = gpiod_line_event_read(line, event_buf0);
 	g_assert_cmpint(ret, ==, 0);
 
-	ret = gpiod_line_event_wait(line, &ts);
+	ret = gpiod_line_event_wait(line, timeout);
 	g_assert_cmpint(ret, ==, 1);
-	ret = gpiod_line_event_read(line, &ev[1]);
+	ret = gpiod_line_event_read(line, event_buf1);
 	g_assert_cmpint(ret, ==, 0);
 
-	ret = gpiod_line_event_wait(line, &ts);
+	ret = gpiod_line_event_wait(line, timeout);
 	g_assert_cmpint(ret, ==, 1);
-	ret = gpiod_line_event_read(line, &ev[2]);
+	ret = gpiod_line_event_read(line, event_buf2);
 	g_assert_cmpint(ret, ==, 0);
 
-	g_assert_cmpint(ev[0].event_type, ==, GPIOD_LINE_EVENT_RISING_EDGE);
-	g_assert_cmpint(ev[1].event_type, ==, GPIOD_LINE_EVENT_RISING_EDGE);
-	g_assert_cmpint(ev[2].event_type, ==, GPIOD_LINE_EVENT_RISING_EDGE);
+	events[0] = gpiod_line_event_buffer_get_event(event_buf0, 0);
+	events[1] = gpiod_line_event_buffer_get_event(event_buf1, 0);
+	events[2] = gpiod_line_event_buffer_get_event(event_buf2, 0);
+	g_assert_nonnull(events[0]);
+	g_assert_nonnull(events[1]);
+	g_assert_nonnull(events[2]);
+	gpiod_test_return_if_failed();
+
+	g_assert_cmpint(gpiod_line_event_get_event_type(events[0]), ==,
+			GPIOD_LINE_EVENT_RISING_EDGE);
+	g_assert_cmpint(gpiod_line_event_get_event_type(events[1]), ==,
+			GPIOD_LINE_EVENT_RISING_EDGE);
+	g_assert_cmpint(gpiod_line_event_get_event_type(events[2]), ==,
+			GPIOD_LINE_EVENT_RISING_EDGE);
 }
 
 GPIOD_TEST_CASE(both_edges, 0, { 8 })
 {
+	g_autoptr(gpiod_line_event_buffer_struct) event_buf = NULL;
 	g_autoptr(GpiodTestEventThread) ev_thread = NULL;
 	g_autoptr(gpiod_chip_struct) chip = NULL;
-	struct timespec ts = { 1, 0 };
-	struct gpiod_line_event ev;
+	uint64_t timeout = gpiod_sec_to_nsec(1);
+	struct gpiod_line_event *event;
 	struct gpiod_line *line;
 	gint ret;
 
@@ -129,6 +172,10 @@ GPIOD_TEST_CASE(both_edges, 0, { 8 })
 	g_assert_nonnull(chip);
 	gpiod_test_return_if_failed();
 
+	event_buf = gpiod_line_event_buffer_new(1);
+	g_assert_nonnull(event_buf);
+	gpiod_test_return_if_failed();
+
 	line = gpiod_chip_get_line(chip, 7);
 	g_assert_nonnull(line);
 	gpiod_test_return_if_failed();
@@ -139,29 +186,40 @@ GPIOD_TEST_CASE(both_edges, 0, { 8 })
 
 	ev_thread = gpiod_test_start_event_thread(0, 7, 100);
 
-	ret = gpiod_line_event_wait(line, &ts);
+	ret = gpiod_line_event_wait(line, timeout);
 	g_assert_cmpint(ret, ==, 1);
 
-	ret = gpiod_line_event_read(line, &ev);
+	ret = gpiod_line_event_read(line, event_buf);
 	g_assert_cmpint(ret, ==, 0);
 
-	g_assert_cmpint(ev.event_type, ==, GPIOD_LINE_EVENT_RISING_EDGE);
+	event = gpiod_line_event_buffer_get_event(event_buf, 0);
+	g_assert_nonnull(event);
+	gpiod_test_return_if_failed();
+
+	g_assert_cmpint(gpiod_line_event_get_event_type(event), ==,
+			GPIOD_LINE_EVENT_RISING_EDGE);
 
-	ret = gpiod_line_event_wait(line, &ts);
+	ret = gpiod_line_event_wait(line, timeout);
 	g_assert_cmpint(ret, ==, 1);
 
-	ret = gpiod_line_event_read(line, &ev);
+	ret = gpiod_line_event_read(line, event_buf);
 	g_assert_cmpint(ret, ==, 0);
 
-	g_assert_cmpint(ev.event_type, ==, GPIOD_LINE_EVENT_FALLING_EDGE);
+	event = gpiod_line_event_buffer_get_event(event_buf, 0);
+	g_assert_nonnull(event);
+	gpiod_test_return_if_failed();
+
+	g_assert_cmpint(gpiod_line_event_get_event_type(event), ==,
+			GPIOD_LINE_EVENT_FALLING_EDGE);
 }
 
 GPIOD_TEST_CASE(both_edges_active_low, 0, { 8 })
 {
+	g_autoptr(gpiod_line_event_buffer_struct) event_buf = NULL;
 	g_autoptr(GpiodTestEventThread) ev_thread = NULL;
 	g_autoptr(gpiod_chip_struct) chip = NULL;
-	struct timespec ts = { 1, 0 };
-	struct gpiod_line_event ev;
+	uint64_t timeout = gpiod_sec_to_nsec(1);
+	struct gpiod_line_event *event;
 	struct gpiod_line *line;
 	gint ret;
 
@@ -169,6 +227,10 @@ GPIOD_TEST_CASE(both_edges_active_low, 0, { 8 })
 	g_assert_nonnull(chip);
 	gpiod_test_return_if_failed();
 
+	event_buf = gpiod_line_event_buffer_new(1);
+	g_assert_nonnull(event_buf);
+	gpiod_test_return_if_failed();
+
 	line = gpiod_chip_get_line(chip, 7);
 	g_assert_nonnull(line);
 	gpiod_test_return_if_failed();
@@ -180,29 +242,40 @@ GPIOD_TEST_CASE(both_edges_active_low, 0, { 8 })
 
 	ev_thread = gpiod_test_start_event_thread(0, 7, 100);
 
-	ret = gpiod_line_event_wait(line, &ts);
+	ret = gpiod_line_event_wait(line, timeout);
 	g_assert_cmpint(ret, ==, 1);
 
-	ret = gpiod_line_event_read(line, &ev);
+	ret = gpiod_line_event_read(line, event_buf);
 	g_assert_cmpint(ret, ==, 0);
 
-	g_assert_cmpint(ev.event_type, ==, GPIOD_LINE_EVENT_FALLING_EDGE);
+	event = gpiod_line_event_buffer_get_event(event_buf, 0);
+	g_assert_nonnull(event);
+	gpiod_test_return_if_failed();
+
+	g_assert_cmpint(gpiod_line_event_get_event_type(event), ==,
+			GPIOD_LINE_EVENT_FALLING_EDGE);
 
-	ret = gpiod_line_event_wait(line, &ts);
+	ret = gpiod_line_event_wait(line, timeout);
 	g_assert_cmpint(ret, ==, 1);
 
-	ret = gpiod_line_event_read(line, &ev);
+	ret = gpiod_line_event_read(line, event_buf);
 	g_assert_cmpint(ret, ==, 0);
 
-	g_assert_cmpint(ev.event_type, ==, GPIOD_LINE_EVENT_RISING_EDGE);
+	event = gpiod_line_event_buffer_get_event(event_buf, 0);
+	g_assert_nonnull(event);
+	gpiod_test_return_if_failed();
+
+	g_assert_cmpint(gpiod_line_event_get_event_type(event), ==,
+			GPIOD_LINE_EVENT_RISING_EDGE);
 }
 
 GPIOD_TEST_CASE(both_edges_bias_disable, 0, { 8 })
 {
+	g_autoptr(gpiod_line_event_buffer_struct) event_buf = NULL;
 	g_autoptr(GpiodTestEventThread) ev_thread = NULL;
 	g_autoptr(gpiod_chip_struct) chip = NULL;
-	struct timespec ts = { 1, 0 };
-	struct gpiod_line_event ev;
+	uint64_t timeout = gpiod_sec_to_nsec(1);
+	struct gpiod_line_event *event;
 	struct gpiod_line *line;
 	gint ret;
 
@@ -210,6 +283,10 @@ GPIOD_TEST_CASE(both_edges_bias_disable, 0, { 8 })
 	g_assert_nonnull(chip);
 	gpiod_test_return_if_failed();
 
+	event_buf = gpiod_line_event_buffer_new(1);
+	g_assert_nonnull(event_buf);
+	gpiod_test_return_if_failed();
+
 	line = gpiod_chip_get_line(chip, 7);
 	g_assert_nonnull(line);
 	gpiod_test_return_if_failed();
@@ -221,29 +298,40 @@ GPIOD_TEST_CASE(both_edges_bias_disable, 0, { 8 })
 
 	ev_thread = gpiod_test_start_event_thread(0, 7, 100);
 
-	ret = gpiod_line_event_wait(line, &ts);
+	ret = gpiod_line_event_wait(line, timeout);
 	g_assert_cmpint(ret, ==, 1);
 
-	ret = gpiod_line_event_read(line, &ev);
+	ret = gpiod_line_event_read(line, event_buf);
 	g_assert_cmpint(ret, ==, 0);
 
-	g_assert_cmpint(ev.event_type, ==, GPIOD_LINE_EVENT_RISING_EDGE);
+	event = gpiod_line_event_buffer_get_event(event_buf, 0);
+	g_assert_nonnull(event);
+	gpiod_test_return_if_failed();
+
+	g_assert_cmpint(gpiod_line_event_get_event_type(event), ==,
+			GPIOD_LINE_EVENT_RISING_EDGE);
 
-	ret = gpiod_line_event_wait(line, &ts);
+	ret = gpiod_line_event_wait(line, timeout);
 	g_assert_cmpint(ret, ==, 1);
 
-	ret = gpiod_line_event_read(line, &ev);
+	ret = gpiod_line_event_read(line, event_buf);
 	g_assert_cmpint(ret, ==, 0);
 
-	g_assert_cmpint(ev.event_type, ==, GPIOD_LINE_EVENT_FALLING_EDGE);
+	event = gpiod_line_event_buffer_get_event(event_buf, 0);
+	g_assert_nonnull(event);
+	gpiod_test_return_if_failed();
+
+	g_assert_cmpint(gpiod_line_event_get_event_type(event), ==,
+			GPIOD_LINE_EVENT_FALLING_EDGE);
 }
 
 GPIOD_TEST_CASE(both_edges_bias_pull_down, 0, { 8 })
 {
+	g_autoptr(gpiod_line_event_buffer_struct) event_buf = NULL;
 	g_autoptr(GpiodTestEventThread) ev_thread = NULL;
 	g_autoptr(gpiod_chip_struct) chip = NULL;
-	struct timespec ts = { 1, 0 };
-	struct gpiod_line_event ev;
+	uint64_t timeout = gpiod_sec_to_nsec(1);
+	struct gpiod_line_event *event;
 	struct gpiod_line *line;
 	gint ret;
 
@@ -251,6 +339,10 @@ GPIOD_TEST_CASE(both_edges_bias_pull_down, 0, { 8 })
 	g_assert_nonnull(chip);
 	gpiod_test_return_if_failed();
 
+	event_buf = gpiod_line_event_buffer_new(1);
+	g_assert_nonnull(event_buf);
+	gpiod_test_return_if_failed();
+
 	line = gpiod_chip_get_line(chip, 7);
 	g_assert_nonnull(line);
 	gpiod_test_return_if_failed();
@@ -262,29 +354,40 @@ GPIOD_TEST_CASE(both_edges_bias_pull_down, 0, { 8 })
 
 	ev_thread = gpiod_test_start_event_thread(0, 7, 100);
 
-	ret = gpiod_line_event_wait(line, &ts);
+	ret = gpiod_line_event_wait(line, timeout);
 	g_assert_cmpint(ret, ==, 1);
 
-	ret = gpiod_line_event_read(line, &ev);
+	ret = gpiod_line_event_read(line, event_buf);
 	g_assert_cmpint(ret, ==, 0);
 
-	g_assert_cmpint(ev.event_type, ==, GPIOD_LINE_EVENT_RISING_EDGE);
+	event = gpiod_line_event_buffer_get_event(event_buf, 0);
+	g_assert_nonnull(event);
+	gpiod_test_return_if_failed();
+
+	g_assert_cmpint(gpiod_line_event_get_event_type(event), ==,
+			GPIOD_LINE_EVENT_RISING_EDGE);
 
-	ret = gpiod_line_event_wait(line, &ts);
+	ret = gpiod_line_event_wait(line, timeout);
 	g_assert_cmpint(ret, ==, 1);
 
-	ret = gpiod_line_event_read(line, &ev);
+	ret = gpiod_line_event_read(line, event_buf);
 	g_assert_cmpint(ret, ==, 0);
 
-	g_assert_cmpint(ev.event_type, ==, GPIOD_LINE_EVENT_FALLING_EDGE);
+	event = gpiod_line_event_buffer_get_event(event_buf, 0);
+	g_assert_nonnull(event);
+	gpiod_test_return_if_failed();
+
+	g_assert_cmpint(gpiod_line_event_get_event_type(event), ==,
+			GPIOD_LINE_EVENT_FALLING_EDGE);
 }
 
 GPIOD_TEST_CASE(both_edges_bias_pull_up, 0, { 8 })
 {
+	g_autoptr(gpiod_line_event_buffer_struct) event_buf = NULL;
 	g_autoptr(GpiodTestEventThread) ev_thread = NULL;
 	g_autoptr(gpiod_chip_struct) chip = NULL;
-	struct timespec ts = { 1, 0 };
-	struct gpiod_line_event ev;
+	uint64_t timeout = gpiod_sec_to_nsec(1);
+	struct gpiod_line_event *event;
 	struct gpiod_line *line;
 	gint ret;
 
@@ -292,6 +395,10 @@ GPIOD_TEST_CASE(both_edges_bias_pull_up, 0, { 8 })
 	g_assert_nonnull(chip);
 	gpiod_test_return_if_failed();
 
+	event_buf = gpiod_line_event_buffer_new(1);
+	g_assert_nonnull(event_buf);
+	gpiod_test_return_if_failed();
+
 	line = gpiod_chip_get_line(chip, 7);
 	g_assert_nonnull(line);
 	gpiod_test_return_if_failed();
@@ -303,29 +410,40 @@ GPIOD_TEST_CASE(both_edges_bias_pull_up, 0, { 8 })
 
 	ev_thread = gpiod_test_start_event_thread(0, 7, 100);
 
-	ret = gpiod_line_event_wait(line, &ts);
+	ret = gpiod_line_event_wait(line, timeout);
 	g_assert_cmpint(ret, ==, 1);
 
-	ret = gpiod_line_event_read(line, &ev);
+	ret = gpiod_line_event_read(line, event_buf);
 	g_assert_cmpint(ret, ==, 0);
 
-	g_assert_cmpint(ev.event_type, ==, GPIOD_LINE_EVENT_FALLING_EDGE);
+	event = gpiod_line_event_buffer_get_event(event_buf, 0);
+	g_assert_nonnull(event);
+	gpiod_test_return_if_failed();
+
+	g_assert_cmpint(gpiod_line_event_get_event_type(event), ==,
+			GPIOD_LINE_EVENT_FALLING_EDGE);
 
-	ret = gpiod_line_event_wait(line, &ts);
+	ret = gpiod_line_event_wait(line, timeout);
 	g_assert_cmpint(ret, ==, 1);
 
-	ret = gpiod_line_event_read(line, &ev);
+	ret = gpiod_line_event_read(line, event_buf);
 	g_assert_cmpint(ret, ==, 0);
 
-	g_assert_cmpint(ev.event_type, ==, GPIOD_LINE_EVENT_RISING_EDGE);
+	event = gpiod_line_event_buffer_get_event(event_buf, 0);
+	g_assert_nonnull(event);
+	gpiod_test_return_if_failed();
+
+	g_assert_cmpint(gpiod_line_event_get_event_type(event), ==,
+			GPIOD_LINE_EVENT_RISING_EDGE);
 }
 
 GPIOD_TEST_CASE(falling_edge_active_low, 0, { 8 })
 {
+	g_autoptr(gpiod_line_event_buffer_struct) event_buf = NULL;
 	g_autoptr(GpiodTestEventThread) ev_thread = NULL;
 	g_autoptr(gpiod_chip_struct) chip = NULL;
-	struct timespec ts = { 1, 0 };
-	struct gpiod_line_event ev;
+	uint64_t timeout = gpiod_sec_to_nsec(1);
+	struct gpiod_line_event *event;
 	struct gpiod_line *line;
 	gint ret;
 
@@ -333,6 +451,10 @@ GPIOD_TEST_CASE(falling_edge_active_low, 0, { 8 })
 	g_assert_nonnull(chip);
 	gpiod_test_return_if_failed();
 
+	event_buf = gpiod_line_event_buffer_new(1);
+	g_assert_nonnull(event_buf);
+	gpiod_test_return_if_failed();
+
 	line = gpiod_chip_get_line(chip, 7);
 	g_assert_nonnull(line);
 	gpiod_test_return_if_failed();
@@ -344,21 +466,27 @@ GPIOD_TEST_CASE(falling_edge_active_low, 0, { 8 })
 
 	ev_thread = gpiod_test_start_event_thread(0, 7, 100);
 
-	ret = gpiod_line_event_wait(line, &ts);
+	ret = gpiod_line_event_wait(line, timeout);
 	g_assert_cmpint(ret, ==, 1);
 
-	ret = gpiod_line_event_read(line, &ev);
+	ret = gpiod_line_event_read(line, event_buf);
 	g_assert_cmpint(ret, ==, 0);
 
-	g_assert_cmpint(ev.event_type, ==, GPIOD_LINE_EVENT_FALLING_EDGE);
+	event = gpiod_line_event_buffer_get_event(event_buf, 0);
+	g_assert_nonnull(event);
+	gpiod_test_return_if_failed();
+
+	g_assert_cmpint(gpiod_line_event_get_event_type(event), ==,
+			GPIOD_LINE_EVENT_FALLING_EDGE);
 }
 
 GPIOD_TEST_CASE(get_value, 0, { 8 })
 {
+	g_autoptr(gpiod_line_event_buffer_struct) event_buf = NULL;
 	g_autoptr(GpiodTestEventThread) ev_thread = NULL;
 	g_autoptr(gpiod_chip_struct) chip = NULL;
-	struct timespec ts = { 1, 0 };
-	struct gpiod_line_event ev;
+	uint64_t timeout = gpiod_sec_to_nsec(1);
+	struct gpiod_line_event *event;
 	struct gpiod_line *line;
 	gint ret;
 
@@ -366,6 +494,10 @@ GPIOD_TEST_CASE(get_value, 0, { 8 })
 	g_assert_nonnull(chip);
 	gpiod_test_return_if_failed();
 
+	event_buf = gpiod_line_event_buffer_new(1);
+	g_assert_nonnull(event_buf);
+	gpiod_test_return_if_failed();
+
 	line = gpiod_chip_get_line(chip, 7);
 	g_assert_nonnull(line);
 	gpiod_test_return_if_failed();
@@ -381,21 +513,27 @@ GPIOD_TEST_CASE(get_value, 0, { 8 })
 
 	ev_thread = gpiod_test_start_event_thread(0, 7, 100);
 
-	ret = gpiod_line_event_wait(line, &ts);
+	ret = gpiod_line_event_wait(line, timeout);
 	g_assert_cmpint(ret, ==, 1);
 
-	ret = gpiod_line_event_read(line, &ev);
+	ret = gpiod_line_event_read(line, event_buf);
 	g_assert_cmpint(ret, ==, 0);
 
-	g_assert_cmpint(ev.event_type, ==, GPIOD_LINE_EVENT_FALLING_EDGE);
+	event = gpiod_line_event_buffer_get_event(event_buf, 0);
+	g_assert_nonnull(event);
+	gpiod_test_return_if_failed();
+
+	g_assert_cmpint(gpiod_line_event_get_event_type(event), ==,
+			GPIOD_LINE_EVENT_FALLING_EDGE);
 }
 
 GPIOD_TEST_CASE(get_value_active_low, 0, { 8 })
 {
+	g_autoptr(gpiod_line_event_buffer_struct) event_buf = NULL;
 	g_autoptr(GpiodTestEventThread) ev_thread = NULL;
 	g_autoptr(gpiod_chip_struct) chip = NULL;
-	struct timespec ts = { 1, 0 };
-	struct gpiod_line_event ev;
+	uint64_t timeout = gpiod_sec_to_nsec(1);
+	struct gpiod_line_event *event;
 	struct gpiod_line *line;
 	gint ret;
 
@@ -403,6 +541,10 @@ GPIOD_TEST_CASE(get_value_active_low, 0, { 8 })
 	g_assert_nonnull(chip);
 	gpiod_test_return_if_failed();
 
+	event_buf = gpiod_line_event_buffer_new(1);
+	g_assert_nonnull(event_buf);
+	gpiod_test_return_if_failed();
+
 	line = gpiod_chip_get_line(chip, 7);
 	g_assert_nonnull(line);
 	gpiod_test_return_if_failed();
@@ -419,13 +561,18 @@ GPIOD_TEST_CASE(get_value_active_low, 0, { 8 })
 
 	ev_thread = gpiod_test_start_event_thread(0, 7, 100);
 
-	ret = gpiod_line_event_wait(line, &ts);
+	ret = gpiod_line_event_wait(line, timeout);
 	g_assert_cmpint(ret, ==, 1);
 
-	ret = gpiod_line_event_read(line, &ev);
+	ret = gpiod_line_event_read(line, event_buf);
 	g_assert_cmpint(ret, ==, 0);
 
-	g_assert_cmpint(ev.event_type, ==, GPIOD_LINE_EVENT_FALLING_EDGE);
+	event = gpiod_line_event_buffer_get_event(event_buf, 0);
+	g_assert_nonnull(event);
+	gpiod_test_return_if_failed();
+
+	g_assert_cmpint(gpiod_line_event_get_event_type(event), ==,
+			GPIOD_LINE_EVENT_FALLING_EDGE);
 }
 
 GPIOD_TEST_CASE(get_values, 0, { 8 })
@@ -548,12 +695,13 @@ GPIOD_TEST_CASE(get_values_active_low, 0, { 8 })
 
 GPIOD_TEST_CASE(wait_multiple, 0, { 8 })
 {
+	g_autoptr(gpiod_line_event_buffer_struct) event_buf = NULL;
 	g_autoptr(GpiodTestEventThread) ev_thread = NULL;
 	g_autoptr(gpiod_line_bulk_struct) ev_bulk = NULL;
 	g_autoptr(gpiod_line_bulk_struct) bulk = NULL;
 	g_autoptr(gpiod_chip_struct) chip = NULL;
-	struct timespec ts = { 1, 0 };
-	struct gpiod_line_event ev;
+	uint64_t timeout = gpiod_sec_to_nsec(1);
+	struct gpiod_line_event *event;
 	struct gpiod_line *line;
 	gint ret, i;
 
@@ -561,6 +709,10 @@ GPIOD_TEST_CASE(wait_multiple, 0, { 8 })
 	g_assert_nonnull(chip);
 	gpiod_test_return_if_failed();
 
+	event_buf = gpiod_line_event_buffer_new(1);
+	g_assert_nonnull(event_buf);
+	gpiod_test_return_if_failed();
+
 	bulk = gpiod_line_bulk_new(8);
 	ev_bulk = gpiod_line_bulk_new(8);
 	g_assert_nonnull(bulk);
@@ -582,17 +734,23 @@ GPIOD_TEST_CASE(wait_multiple, 0, { 8 })
 
 	ev_thread = gpiod_test_start_event_thread(0, 4, 100);
 
-	ret = gpiod_line_event_wait_bulk(bulk, &ts, ev_bulk);
+	ret = gpiod_line_event_wait_bulk(bulk, timeout, ev_bulk);
 	g_assert_cmpint(ret, ==, 1);
 
 	g_assert_cmpuint(gpiod_line_bulk_num_lines(ev_bulk), ==, 1);
 	line = gpiod_line_bulk_get_line(ev_bulk, 0);
 	g_assert_cmpuint(gpiod_line_offset(line), ==, 4);
 
-	ret = gpiod_line_event_read(line, &ev);
+	ret = gpiod_line_event_read(line, event_buf);
 	g_assert_cmpint(ret, ==, 0);
-	g_assert_cmpint(ev.event_type, ==, GPIOD_LINE_EVENT_RISING_EDGE);
-	g_assert_cmpint(ev.offset, ==, 4);
+
+	event = gpiod_line_event_buffer_get_event(event_buf, 0);
+	g_assert_nonnull(event);
+	gpiod_test_return_if_failed();
+
+	g_assert_cmpint(gpiod_line_event_get_event_type(event), ==,
+			GPIOD_LINE_EVENT_RISING_EDGE);
+	g_assert_cmpint(gpiod_line_event_get_line_offset(event), ==, 4);
 }
 
 GPIOD_TEST_CASE(get_fd_when_values_requested, 0, { 8 })
@@ -659,7 +817,7 @@ GPIOD_TEST_CASE(invalid_fd, 0, { 8 })
 	g_autoptr(gpiod_line_bulk_struct) ev_bulk = NULL;
 	g_autoptr(gpiod_line_bulk_struct) bulk = NULL;
 	g_autoptr(gpiod_chip_struct) chip = NULL;
-	struct timespec ts = { 1, 0 };
+	uint64_t timeout = gpiod_sec_to_nsec(1);
 	struct gpiod_line *line;
 	gint ret, fd;
 
@@ -678,7 +836,7 @@ GPIOD_TEST_CASE(invalid_fd, 0, { 8 })
 	fd = gpiod_line_event_get_fd(line);
 	close(fd);
 
-	ret = gpiod_line_event_wait(line, &ts);
+	ret = gpiod_line_event_wait(line, timeout);
 	g_assert_cmpint(ret, ==, -1);
 	g_assert_cmpint(errno, ==, EINVAL);
 
@@ -693,16 +851,17 @@ GPIOD_TEST_CASE(invalid_fd, 0, { 8 })
 	 * as well.
 	 */
 	gpiod_line_bulk_add_line(bulk, line);
-	ret = gpiod_line_event_wait_bulk(bulk, &ts, ev_bulk);
+	ret = gpiod_line_event_wait_bulk(bulk, timeout, ev_bulk);
 	g_assert_cmpint(ret, ==, -1);
 	g_assert_cmpint(errno, ==, EINVAL);
 }
 
 GPIOD_TEST_CASE(read_events_individually, 0, { 8 })
 {
+	g_autoptr(gpiod_line_event_buffer_struct) event_buf = NULL;
 	g_autoptr(gpiod_chip_struct) chip = NULL;
-	struct timespec ts = { 1, 0 };
-	struct gpiod_line_event ev;
+	uint64_t timeout = gpiod_sec_to_nsec(1);
+	struct gpiod_line_event *event;
 	struct gpiod_line *line;
 	gint ret;
 	guint i;
@@ -711,6 +870,10 @@ GPIOD_TEST_CASE(read_events_individually, 0, { 8 })
 	g_assert_nonnull(chip);
 	gpiod_test_return_if_failed();
 
+	event_buf = gpiod_line_event_buffer_new(1);
+	g_assert_nonnull(event_buf);
+	gpiod_test_return_if_failed();
+
 	line = gpiod_chip_get_line(chip, 7);
 	g_assert_nonnull(line);
 	gpiod_test_return_if_failed();
@@ -727,45 +890,61 @@ GPIOD_TEST_CASE(read_events_individually, 0, { 8 })
 	}
 
 	/* read them individually... */
-	ret = gpiod_line_event_wait(line, &ts);
+	ret = gpiod_line_event_wait(line, timeout);
 	g_assert_cmpint(ret, ==, 1);
 	if (!ret)
 		return;
 
-	ret = gpiod_line_event_read(line, &ev);
+	ret = gpiod_line_event_read(line, event_buf);
 	g_assert_cmpint(ret, ==, 0);
 
-	g_assert_cmpint(ev.event_type, ==, GPIOD_LINE_EVENT_FALLING_EDGE);
+	event = gpiod_line_event_buffer_get_event(event_buf, 0);
+	g_assert_nonnull(event);
+	gpiod_test_return_if_failed();
+
+	g_assert_cmpint(gpiod_line_event_get_event_type(event), ==,
+			GPIOD_LINE_EVENT_FALLING_EDGE);
 
-	ret = gpiod_line_event_wait(line, &ts);
+	ret = gpiod_line_event_wait(line, timeout);
 	g_assert_cmpint(ret, ==, 1);
 	if (!ret)
 		return;
 
-	ret = gpiod_line_event_read(line, &ev);
+	ret = gpiod_line_event_read(line, event_buf);
 	g_assert_cmpint(ret, ==, 0);
 
-	g_assert_cmpint(ev.event_type, ==, GPIOD_LINE_EVENT_RISING_EDGE);
+	event = gpiod_line_event_buffer_get_event(event_buf, 0);
+	g_assert_nonnull(event);
+	gpiod_test_return_if_failed();
+
+	g_assert_cmpint(gpiod_line_event_get_event_type(event), ==,
+			GPIOD_LINE_EVENT_RISING_EDGE);
 
-	ret = gpiod_line_event_wait(line, &ts);
+	ret = gpiod_line_event_wait(line, timeout);
 	g_assert_cmpint(ret, ==, 1);
 	if (!ret)
 		return;
 
-	ret = gpiod_line_event_read(line, &ev);
+	ret = gpiod_line_event_read(line, event_buf);
 	g_assert_cmpint(ret, ==, 0);
 
-	g_assert_cmpint(ev.event_type, ==, GPIOD_LINE_EVENT_FALLING_EDGE);
+	event = gpiod_line_event_buffer_get_event(event_buf, 0);
+	g_assert_nonnull(event);
+	gpiod_test_return_if_failed();
+
+	g_assert_cmpint(gpiod_line_event_get_event_type(event), ==,
+			GPIOD_LINE_EVENT_FALLING_EDGE);
 
-	ret = gpiod_line_event_wait(line, &ts);
+	ret = gpiod_line_event_wait(line, timeout);
 	g_assert_cmpint(ret, ==, 0);
 }
 
 GPIOD_TEST_CASE(read_multiple_events, 0, { 8 })
 {
+	g_autoptr(gpiod_line_event_buffer_struct) event_buf = NULL;
 	g_autoptr(gpiod_chip_struct) chip = NULL;
-	struct gpiod_line_event events[5];
-	struct timespec ts = { 1, 0 };
+	uint64_t timeout = gpiod_sec_to_nsec(1);
+	struct gpiod_line_event *events[4];
 	struct gpiod_line *line;
 	gint ret;
 	guint i;
@@ -774,6 +953,10 @@ GPIOD_TEST_CASE(read_multiple_events, 0, { 8 })
 	g_assert_nonnull(chip);
 	gpiod_test_return_if_failed();
 
+	event_buf = gpiod_line_event_buffer_new(5);
+	g_assert_nonnull(event_buf);
+	gpiod_test_return_if_failed();
+
 	line = gpiod_chip_get_line(chip, 4);
 	g_assert_nonnull(line);
 	gpiod_test_return_if_failed();
@@ -795,23 +978,30 @@ GPIOD_TEST_CASE(read_multiple_events, 0, { 8 })
 		usleep(10000);
 	}
 
-	ret = gpiod_line_event_wait(line, &ts);
+	ret = gpiod_line_event_wait(line, timeout);
 	g_assert_cmpint(ret, ==, 1);
 	if (!ret)
 		return;
 
 	/* read a chunk */
-	ret = gpiod_line_event_read_multiple(line, events, 3);
+	ret = gpiod_line_event_read_multiple(line, event_buf, 3);
 	g_assert_cmpint(ret, ==, 3);
 
-	g_assert_cmpint(events[0].event_type, ==,
+	events[0] = gpiod_line_event_buffer_get_event(event_buf, 0);
+	events[1] = gpiod_line_event_buffer_get_event(event_buf, 1);
+	events[2] = gpiod_line_event_buffer_get_event(event_buf, 2);
+	g_assert_nonnull(events[0]);
+	g_assert_nonnull(events[1]);
+	g_assert_nonnull(events[2]);
+
+	g_assert_cmpint(gpiod_line_event_get_event_type(events[0]), ==,
 			GPIOD_LINE_EVENT_RISING_EDGE);
-	g_assert_cmpint(events[1].event_type, ==,
+	g_assert_cmpint(gpiod_line_event_get_event_type(events[1]), ==,
 			GPIOD_LINE_EVENT_FALLING_EDGE);
-	g_assert_cmpint(events[2].event_type, ==,
+	g_assert_cmpint(gpiod_line_event_get_event_type(events[2]), ==,
 			GPIOD_LINE_EVENT_RISING_EDGE);
 
-	ret = gpiod_line_event_wait(line, &ts);
+	ret = gpiod_line_event_wait(line, timeout);
 	g_assert_cmpint(ret, ==, 1);
 	if (!ret)
 		return;
@@ -820,27 +1010,37 @@ GPIOD_TEST_CASE(read_multiple_events, 0, { 8 })
 	 * read the remainder
 	 * - note the attempt to read more than are available
 	 */
-	ret = gpiod_line_event_read_multiple(line, events, 5);
+	ret = gpiod_line_event_read_multiple(line, event_buf, 5);
 	g_assert_cmpint(ret, ==, 4);
 
-	g_assert_cmpint(events[0].event_type, ==,
+	events[0] = gpiod_line_event_buffer_get_event(event_buf, 0);
+	events[1] = gpiod_line_event_buffer_get_event(event_buf, 1);
+	events[2] = gpiod_line_event_buffer_get_event(event_buf, 2);
+	events[3] = gpiod_line_event_buffer_get_event(event_buf, 3);
+	g_assert_nonnull(events[0]);
+	g_assert_nonnull(events[1]);
+	g_assert_nonnull(events[2]);
+	g_assert_nonnull(events[3]);
+
+	g_assert_cmpint(gpiod_line_event_get_event_type(events[0]), ==,
 			GPIOD_LINE_EVENT_FALLING_EDGE);
-	g_assert_cmpint(events[1].event_type, ==,
+	g_assert_cmpint(gpiod_line_event_get_event_type(events[1]), ==,
 			GPIOD_LINE_EVENT_RISING_EDGE);
-	g_assert_cmpint(events[2].event_type, ==,
+	g_assert_cmpint(gpiod_line_event_get_event_type(events[2]), ==,
 			GPIOD_LINE_EVENT_FALLING_EDGE);
-	g_assert_cmpint(events[3].event_type, ==,
+	g_assert_cmpint(gpiod_line_event_get_event_type(events[3]), ==,
 			GPIOD_LINE_EVENT_RISING_EDGE);
 
-	ret = gpiod_line_event_wait(line, &ts);
+	ret = gpiod_line_event_wait(line, timeout);
 	g_assert_cmpint(ret, ==, 0);
 }
 
 GPIOD_TEST_CASE(read_multiple_events_fd, 0, { 8 })
 {
+	g_autoptr(gpiod_line_event_buffer_struct) event_buf = NULL;
 	g_autoptr(gpiod_chip_struct) chip = NULL;
-	struct gpiod_line_event events[5];
-	struct timespec ts = { 1, 0 };
+	uint64_t timeout = gpiod_sec_to_nsec(1);
+	struct gpiod_line_event *events[4];
 	struct gpiod_line *line;
 	gint ret, fd;
 	guint i;
@@ -849,6 +1049,10 @@ GPIOD_TEST_CASE(read_multiple_events_fd, 0, { 8 })
 	g_assert_nonnull(chip);
 	gpiod_test_return_if_failed();
 
+	event_buf = gpiod_line_event_buffer_new(5);
+	g_assert_nonnull(event_buf);
+	gpiod_test_return_if_failed();
+
 	line = gpiod_chip_get_line(chip, 4);
 	g_assert_nonnull(line);
 	gpiod_test_return_if_failed();
@@ -863,7 +1067,7 @@ GPIOD_TEST_CASE(read_multiple_events_fd, 0, { 8 })
 		usleep(10000);
 	}
 
-	ret = gpiod_line_event_wait(line, &ts);
+	ret = gpiod_line_event_wait(line, timeout);
 	g_assert_cmpint(ret, ==, 1);
 	if (!ret)
 		return;
@@ -872,17 +1076,24 @@ GPIOD_TEST_CASE(read_multiple_events_fd, 0, { 8 })
 	g_assert_cmpint(fd, >=, 0);
 
 	/* read a chunk */
-	ret = gpiod_line_event_read_fd_multiple(fd, events, 3);
+	ret = gpiod_line_event_read_fd_multiple(fd, event_buf, 3);
 	g_assert_cmpint(ret, ==, 3);
 
-	g_assert_cmpint(events[0].event_type, ==,
+	events[0] = gpiod_line_event_buffer_get_event(event_buf, 0);
+	events[1] = gpiod_line_event_buffer_get_event(event_buf, 1);
+	events[2] = gpiod_line_event_buffer_get_event(event_buf, 2);
+	g_assert_nonnull(events[0]);
+	g_assert_nonnull(events[1]);
+	g_assert_nonnull(events[2]);
+
+	g_assert_cmpint(gpiod_line_event_get_event_type(events[0]), ==,
 			GPIOD_LINE_EVENT_RISING_EDGE);
-	g_assert_cmpint(events[1].event_type, ==,
+	g_assert_cmpint(gpiod_line_event_get_event_type(events[1]), ==,
 			GPIOD_LINE_EVENT_FALLING_EDGE);
-	g_assert_cmpint(events[2].event_type, ==,
+	g_assert_cmpint(gpiod_line_event_get_event_type(events[2]), ==,
 			GPIOD_LINE_EVENT_RISING_EDGE);
 
-	ret = gpiod_line_event_wait(line, &ts);
+	ret = gpiod_line_event_wait(line, timeout);
 	g_assert_cmpint(ret, ==, 1);
 	if (!ret)
 		return;
@@ -891,18 +1102,27 @@ GPIOD_TEST_CASE(read_multiple_events_fd, 0, { 8 })
 	 * read the remainder
 	 * - note the attempt to read more than are available
 	 */
-	ret = gpiod_line_event_read_fd_multiple(fd, events, 5);
+	ret = gpiod_line_event_read_fd_multiple(fd, event_buf, 5);
 	g_assert_cmpint(ret, ==, 4);
 
-	g_assert_cmpint(events[0].event_type, ==,
+	events[0] = gpiod_line_event_buffer_get_event(event_buf, 0);
+	events[1] = gpiod_line_event_buffer_get_event(event_buf, 1);
+	events[2] = gpiod_line_event_buffer_get_event(event_buf, 2);
+	events[3] = gpiod_line_event_buffer_get_event(event_buf, 3);
+	g_assert_nonnull(events[0]);
+	g_assert_nonnull(events[1]);
+	g_assert_nonnull(events[2]);
+	g_assert_nonnull(events[3]);
+
+	g_assert_cmpint(gpiod_line_event_get_event_type(events[0]), ==,
 			GPIOD_LINE_EVENT_FALLING_EDGE);
-	g_assert_cmpint(events[1].event_type, ==,
+	g_assert_cmpint(gpiod_line_event_get_event_type(events[1]), ==,
 			GPIOD_LINE_EVENT_RISING_EDGE);
-	g_assert_cmpint(events[2].event_type, ==,
+	g_assert_cmpint(gpiod_line_event_get_event_type(events[2]), ==,
 			GPIOD_LINE_EVENT_FALLING_EDGE);
-	g_assert_cmpint(events[3].event_type, ==,
+	g_assert_cmpint(gpiod_line_event_get_event_type(events[3]), ==,
 			GPIOD_LINE_EVENT_RISING_EDGE);
 
-	ret = gpiod_line_event_wait(line, &ts);
+	ret = gpiod_line_event_wait(line, timeout);
 	g_assert_cmpint(ret, ==, 0);
 }
diff --git a/tools/gpiomon.c b/tools/gpiomon.c
index dda9f6f..3e6b715 100644
--- a/tools/gpiomon.c
+++ b/tools/gpiomon.c
@@ -13,6 +13,8 @@
 
 #include "tools-common.h"
 
+#define EVENT_BUF_SIZE 32
+
 static const struct option longopts[] = {
 	{ "help",		no_argument,		NULL,	'h' },
 	{ "version",		no_argument,		NULL,	'v' },
@@ -64,10 +66,8 @@ struct mon_ctx {
 	char *fmt;
 };
 
-static void event_print_custom(unsigned int offset,
-			       const struct timespec *ts,
-			       int event_type,
-			       struct mon_ctx *ctx)
+static void event_print_custom(unsigned int offset, uint64_t timeout,
+			       int event_type, struct mon_ctx *ctx)
 {
 	char *prev, *curr, fmt;
 
@@ -94,10 +94,10 @@ static void event_print_custom(unsigned int offset,
 				fputc('0', stdout);
 			break;
 		case 's':
-			printf("%ld", ts->tv_sec);
+			printf("%ld", timeout / 1000000000);
 			break;
 		case 'n':
-			printf("%ld", ts->tv_nsec);
+			printf("%ld", timeout % 1000000000);
 			break;
 		case '%':
 			fputc('%', stdout);
@@ -119,8 +119,7 @@ end:
 }
 
 static void event_print_human_readable(unsigned int offset,
-				       const struct timespec *ts,
-				       int event_type)
+				       uint64_t timeout, int event_type)
 {
 	char *evname;
 
@@ -130,11 +129,11 @@ static void event_print_human_readable(unsigned int offset,
 		evname = "FALLING EDGE";
 
 	printf("event: %s offset: %u timestamp: [%8ld.%09ld]\n",
-	       evname, offset, ts->tv_sec, ts->tv_nsec);
+	       evname, offset, timeout / 1000000000, timeout % 1000000000);
 }
 
 static void handle_event(unsigned int line_offset, unsigned int event_type,
-			 struct timespec *timestamp, struct mon_ctx *ctx)
+			 uint64_t timestamp, struct mon_ctx *ctx)
 {
 	if (!ctx->silent) {
 		if (ctx->fmt)
@@ -156,8 +155,8 @@ int main(int argc, char **argv)
 	unsigned int offsets[64], num_lines = 0, offset,
 		     events_wanted = 0, events_done = 0, x;
 	bool watch_rising = false, watch_falling = false;
+	uint64_t timeout = gpiod_sec_to_nsec(10);
 	int flags = 0;
-	struct timespec timeout = { 10, 0 };
 	int optc, opti, rv, i, y, event_type;
 	struct mon_ctx ctx;
 	struct gpiod_chip *chip;
@@ -165,7 +164,8 @@ int main(int argc, char **argv)
 	char *end;
 	struct gpiod_line_request_config config;
 	struct gpiod_line *line;
-	struct gpiod_line_event events[16];
+	struct gpiod_line_event_buffer *event_buffer;
+	struct gpiod_line_event *event;
 
 	/*
 	 * FIXME: use signalfd once the API has been converted to using a single file
@@ -271,9 +271,13 @@ int main(int argc, char **argv)
 	if (!evlines)
 		die("out of memory");
 
+	event_buffer = gpiod_line_event_buffer_new(EVENT_BUF_SIZE);
+	if (!event_buffer)
+		die_perror("unable to allocate the line event buffer");
+
 	for (;;) {
 		gpiod_line_bulk_reset(evlines);
-		rv = gpiod_line_event_wait_bulk(lines, &timeout, evlines);
+		rv = gpiod_line_event_wait_bulk(lines, timeout, evlines);
 		if (rv < 0)
 			die_perror("error waiting for events");
 		if (rv == 0)
@@ -284,15 +288,22 @@ int main(int argc, char **argv)
 		for (x = 0; x < num_lines; x++) {
 			line = gpiod_line_bulk_get_line(evlines, x);
 
-			rv = gpiod_line_event_read_multiple(line, events,
-							    ARRAY_SIZE(events));
+			rv = gpiod_line_event_read_multiple(line, event_buffer,
+							    EVENT_BUF_SIZE);
 			if (rv < 0)
 				die_perror("error reading line events");
 
 			for (y = 0; y < rv; y++) {
+				event = gpiod_line_event_buffer_get_event(
+							event_buffer, y);
+				if (!event)
+					die_perror("unable to retrieve the event");
+
 				handle_event(gpiod_line_offset(line),
-					     events[y].event_type,
-					     &events[y].ts, &ctx);
+					gpiod_line_event_get_event_type(event),
+					gpiod_line_event_get_timestamp(event),
+					&ctx);
+
 				events_done++;
 
 				if (events_wanted &&
-- 
2.30.1

