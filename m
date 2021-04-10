Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2A6335AE8B
	for <lists+linux-gpio@lfdr.de>; Sat, 10 Apr 2021 16:52:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234831AbhDJOwa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 10 Apr 2021 10:52:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234708AbhDJOwa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 10 Apr 2021 10:52:30 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DD04C06138A
        for <linux-gpio@vger.kernel.org>; Sat, 10 Apr 2021 07:52:15 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id x7so8400857wrw.10
        for <linux-gpio@vger.kernel.org>; Sat, 10 Apr 2021 07:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Hr/D5ZXVckh+SbZJpuYVUZEbGI+l8ZWgusGtHiZ7I+c=;
        b=ih+2v0ArFjkAxMIGSPr7+IuxXF4Vkmh9U1CLGR8lb0KXJCB0Ny0yF3TAMzwDt/Q1IY
         BxE10WzbNAWmy/r92zVw4tSZs36Iw0PqgNpL28wAHkPhGIs0s4ogNm3HurzgNZJL5swv
         vBd3Xlu2o+iptfYtEZ4sPnGPD2nymW4xx0gBT+6DDmjQ7OsXy44VEWXcNUkPIgEBGQkK
         tYWtrPziHT9KyIN0+i1hVIoxtI1aR4CqPtzopn49rVLnNHFmXkJ1fWZLlIOgEhAXfUuc
         5j2lrhuooOhwlInFe1VdZ2lHZuC5Juaj/9N0joeInJ4oJS1hiEuS/oBHTjKwxkb6JhjR
         lfhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Hr/D5ZXVckh+SbZJpuYVUZEbGI+l8ZWgusGtHiZ7I+c=;
        b=jE1/3Z9mALf/TN70cBZvWheSUyeV362mn2bWg/1d4jBjOmwle3IIl13WLyb1ji8Ued
         5jrePHQjFbVDSeGsGmZuSVmqSw7ZLqUI4TBl4fmDI26/6LND0wUXvFT/JOj9wbvfZrS2
         eOf/NFbLzMnfA2cT5a5PNb9TQdpJ+5o6rapZqgDH5NFda37Um9PtukqBomoLwMFm+fWr
         dLwGrPqurEUaufkm9jQFmwW99aLhKj03HpRDiDgL4eMVE/IqtyQvZwygWqrZgqXar9se
         Br28Za6oLQRcW+PiMdMfHKXJtrMGM0o7S5gvcviKNM1X00XO1C5rm89Dt8CCPgAl/brz
         zEOg==
X-Gm-Message-State: AOAM532rM6XrFd/CvebrahQe04NfN2h3utXX6eLxN9Dy5034jHDvG2NW
        WtC0EC6rG1qdh79RUMkM5+s4Gg==
X-Google-Smtp-Source: ABdhPJwNPEuQGPuUKafLFY6BOPL7XAGUMQSuJ4iSnQhGE8ipN7KmDgFHPouXkuKoMRKhX9Xkl9ueqA==
X-Received: by 2002:a5d:4b81:: with SMTP id b1mr23299713wrt.243.1618066333816;
        Sat, 10 Apr 2021 07:52:13 -0700 (PDT)
Received: from debian-brgl.home (lfbn-nic-1-149-6.w2-15.abo.wanadoo.fr. [2.15.231.6])
        by smtp.gmail.com with ESMTPSA id a15sm9167083wrr.53.2021.04.10.07.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Apr 2021 07:52:13 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [libgpiod][RFC 3/6] core: implement line_info objects
Date:   Sat, 10 Apr 2021 16:51:54 +0200
Message-Id: <20210410145157.30718-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210410145157.30718-1-brgl@bgdev.pl>
References: <20210410145157.30718-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Implement an opaque object storing a snapshot of a GPIO line's status
info and add functions for accessing its fields.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 include/gpiod.h    | 119 ++++++++++---
 lib/Makefile.am    |   2 +-
 lib/core.c         |  63 ++-----
 lib/helpers.c      |  16 +-
 lib/info.c         | 170 ++++++++++++++++++
 lib/internal.h     |   6 +
 tests/gpiod-test.h |   2 +
 tests/tests-chip.c |   8 +-
 tests/tests-line.c | 425 ++++++++++++++++++++++++++++++++++++---------
 tools/gpioinfo.c   |  42 ++---
 10 files changed, 672 insertions(+), 181 deletions(-)
 create mode 100644 lib/info.c

diff --git a/include/gpiod.h b/include/gpiod.h
index a4ce01f..7da9ff4 100644
--- a/include/gpiod.h
+++ b/include/gpiod.h
@@ -35,6 +35,7 @@ extern "C" {
 
 struct gpiod_chip;
 struct gpiod_line;
+struct gpiod_line_info;
 struct gpiod_line_bulk;
 
 /**
@@ -110,6 +111,17 @@ const char *gpiod_chip_get_label(struct gpiod_chip *chip);
  */
 unsigned int gpiod_chip_get_num_lines(struct gpiod_chip *chip);
 
+/**
+ * @brief Get the current snapshot of information about the line at given
+ *        offset.
+ * @param chip The GPIO chip object.
+ * @param offset The offset of the GPIO line.
+ * @return New GPIO line info object that must be freed using
+ *         ::gpiod_line_info_free or NULL if an error occurred.
+ */
+struct gpiod_line_info *gpiod_chip_get_line_info(struct gpiod_chip *chip,
+						 unsigned int offset);
+
 /**
  * @brief Get the handle to the GPIO line at given offset.
  * @param chip The GPIO chip object.
@@ -286,6 +298,20 @@ enum {
 	/**< The internal pull-down bias is enabled. */
 };
 
+/**
+ * @brief Possible edge detection settings.
+ */
+enum {
+	GPIOD_LINE_EDGE_NONE = 1,
+	/**< Line edge detection is disabled. */
+	GPIOD_LINE_EDGE_RISING,
+	/**< Line detects rising edge events. */
+	GPIOD_LINE_EDGE_FALLING,
+	/**< Line detect falling edge events. */
+	GPIOD_LINE_EDGE_BOTH,
+	/**< Line detects both rising and falling edge events. */
+};
+
 /**
  * @brief Read the GPIO line offset.
  * @param line GPIO line object.
@@ -293,64 +319,111 @@ enum {
  */
 unsigned int gpiod_line_offset(struct gpiod_line *line);
 
+/**
+ * @brief Increase the reference count for this line info object.
+ * @param info GPIO line info object.
+ * @return Passed reference to the line info object.
+ */
+struct gpiod_line_info *
+gpiod_line_info_ref(struct gpiod_line_info *info);
+
+/**
+ * @brief Decrease the reference count on this line info object. If it reaches
+ *        0, then free all associated resources.
+ * @param info GPIO line info object.
+ */
+void gpiod_line_info_unref(struct gpiod_line_info *info);
+
+/**
+ * @brief Get the hardware offset of the line.
+ * @param info GPIO line info object.
+ * @return Offset of the line within the parent chip.
+ */
+unsigned int gpiod_line_info_get_offset(struct gpiod_line_info *info);
+
 /**
  * @brief Read the GPIO line name.
- * @param line GPIO line object.
+ * @param info GPIO line info object.
  * @return Name of the GPIO line as it is represented in the kernel. This
  *         routine returns a pointer to a null-terminated string or NULL if
  *         the line is unnamed.
  */
-const char *gpiod_line_name(struct gpiod_line *line);
+const char *gpiod_line_get_name(struct gpiod_line_info *info);
+
+/**
+ * @brief Check if the line is currently in use.
+ * @param info GPIO line object.
+ * @return True if the line is in use, false otherwise.
+ *
+ * The user space can't know exactly why a line is busy. It may have been
+ * requested by another process or hogged by the kernel. It only matters that
+ * the line is used and we can't request it.
+ */
+bool gpiod_line_is_used(struct gpiod_line_info *info);
 
 /**
  * @brief Read the GPIO line consumer name.
- * @param line GPIO line object.
+ * @param info GPIO line info object.
  * @return Name of the GPIO consumer name as it is represented in the
  *         kernel. This routine returns a pointer to a null-terminated string
  *         or NULL if the line is not used.
  */
-const char *gpiod_line_consumer(struct gpiod_line *line);
+const char *gpiod_line_get_consumer(struct gpiod_line_info *info);
 
 /**
  * @brief Read the GPIO line direction setting.
- * @param line GPIO line object.
+ * @param info GPIO line info object.
  * @return Returns GPIOD_LINE_DIRECTION_INPUT or GPIOD_LINE_DIRECTION_OUTPUT.
  */
-int gpiod_line_direction(struct gpiod_line *line);
+int gpiod_line_get_direction(struct gpiod_line_info *info);
 
 /**
  * @brief Check if the signal of this line is inverted.
- * @param line GPIO line object.
+ * @param info GPIO line object.
  * @return True if this line is "active-low", false otherwise.
  */
-bool gpiod_line_is_active_low(struct gpiod_line *line);
+bool gpiod_line_is_active_low(struct gpiod_line_info *info);
 
 /**
  * @brief Read the GPIO line bias setting.
- * @param line GPIO line object.
+ * @param info GPIO line object.
  * @return Returns GPIOD_LINE_BIAS_PULL_UP, GPIOD_LINE_BIAS_PULL_DOWN,
  *         GPIOD_LINE_BIAS_DISABLE or GPIOD_LINE_BIAS_UNKNOWN.
  */
-int gpiod_line_bias(struct gpiod_line *line);
-
-/**
- * @brief Check if the line is currently in use.
- * @param line GPIO line object.
- * @return True if the line is in use, false otherwise.
- *
- * The user space can't know exactly why a line is busy. It may have been
- * requested by another process or hogged by the kernel. It only matters that
- * the line is used and we can't request it.
- */
-bool gpiod_line_is_used(struct gpiod_line *line);
+int gpiod_line_get_bias(struct gpiod_line_info *info);
 
 /**
  * @brief Read the GPIO line drive setting.
- * @param line GPIO line object.
+ * @param info GPIO line info object.
  * @return Returns GPIOD_LINE_DRIVE_PUSH_PULL, GPIOD_LINE_DRIVE_OPEN_DRAIN or
  *         GPIOD_LINE_DRIVE_OPEN_SOURCE.
  */
-int gpiod_line_drive(struct gpiod_line *line);
+int gpiod_line_get_drive(struct gpiod_line_info *info);
+
+/**
+ * @brief Read the current edge detection setting of this line.
+ * @param info GPIO line info object.
+ * @return Returns GPIOD_LINE_EDGE_NONE, GPIOD_LINE_EDGE_RISING,
+ *         GPIOD_LINE_EDGE_FALLING or GPIOD_LINE_EDGE_BOTH.
+ */
+int gpiod_line_get_edge_detection(struct gpiod_line_info *info);
+
+/**
+ * @brief Check if this line is debounced (either by hardware or by the kernel
+ *        software debouncer).
+ * @param info GPIO line info object.
+ * @return True if the line is debounced, false otherwise.
+ */
+bool gpiod_line_is_debounced(struct gpiod_line_info *info);
+
+/**
+ * @brief Read the current debounce period in microseconds.
+ * @param info GPIO line info object.
+ * @return Current debounce period in microseconds, 0 if the line is not
+ *         debounced.
+ */
+unsigned long
+gpiod_line_get_debounce_period(struct gpiod_line_info *info);
 
 /**
  * @brief Get the handle to the GPIO chip controlling this line.
diff --git a/lib/Makefile.am b/lib/Makefile.am
index 5c7f353..c5d6070 100644
--- a/lib/Makefile.am
+++ b/lib/Makefile.am
@@ -2,7 +2,7 @@
 # SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 lib_LTLIBRARIES = libgpiod.la
-libgpiod_la_SOURCES = core.c helpers.c internal.c internal.h misc.c uapi/gpio.h
+libgpiod_la_SOURCES = core.c helpers.c internal.c internal.h info.c misc.c uapi/gpio.h
 libgpiod_la_CFLAGS = -Wall -Wextra -g -std=gnu89
 libgpiod_la_CFLAGS += -fvisibility=hidden -I$(top_srcdir)/include/
 libgpiod_la_CFLAGS += -include $(top_builddir)/config.h
diff --git a/lib/core.c b/lib/core.c
index 0f3937b..526dcaa 100644
--- a/lib/core.c
+++ b/lib/core.c
@@ -180,6 +180,22 @@ GPIOD_API void gpiod_line_bulk_foreach_line(struct gpiod_line_bulk *bulk,
 	     (index) < (bulk)->num_lines;				\
 	     (index)++, (line) = (bulk)->lines[(index)])
 
+GPIOD_API struct gpiod_line_info *
+gpiod_chip_get_line_info(struct gpiod_chip *chip, unsigned int offset)
+{
+	struct gpio_v2_line_info infobuf;
+	int ret;
+
+	memset(&infobuf, 0, sizeof(infobuf));
+	infobuf.offset = offset;
+
+	ret = ioctl(chip->fd, GPIO_V2_GET_LINEINFO_IOCTL, &infobuf);
+	if (ret < 0)
+		return NULL;
+
+	return gpiod_line_info_from_kernel(&infobuf);
+}
+
 GPIOD_API bool gpiod_is_gpiochip_device(const char *path)
 {
 	char *realname, *sysfsp, devpath[64];
@@ -449,53 +465,6 @@ GPIOD_API unsigned int gpiod_line_offset(struct gpiod_line *line)
 	return line->offset;
 }
 
-GPIOD_API const char *gpiod_line_name(struct gpiod_line *line)
-{
-	return line->name[0] == '\0' ? NULL : line->name;
-}
-
-GPIOD_API const char *gpiod_line_consumer(struct gpiod_line *line)
-{
-	return line->consumer[0] == '\0' ? NULL : line->consumer;
-}
-
-GPIOD_API int gpiod_line_direction(struct gpiod_line *line)
-{
-	return line->direction;
-}
-
-GPIOD_API bool gpiod_line_is_active_low(struct gpiod_line *line)
-{
-	return line->active_low;
-}
-
-GPIOD_API int gpiod_line_bias(struct gpiod_line *line)
-{
-	if (line->info_flags & GPIOLINE_FLAG_BIAS_DISABLE)
-		return GPIOD_LINE_BIAS_DISABLED;
-	if (line->info_flags & GPIOLINE_FLAG_BIAS_PULL_UP)
-		return GPIOD_LINE_BIAS_PULL_UP;
-	if (line->info_flags & GPIOLINE_FLAG_BIAS_PULL_DOWN)
-		return GPIOD_LINE_BIAS_PULL_DOWN;
-
-	return GPIOD_LINE_BIAS_UNKNOWN;
-}
-
-GPIOD_API bool gpiod_line_is_used(struct gpiod_line *line)
-{
-	return line->info_flags & GPIOLINE_FLAG_KERNEL;
-}
-
-GPIOD_API int gpiod_line_drive(struct gpiod_line *line)
-{
-	if (line->info_flags & GPIOLINE_FLAG_OPEN_DRAIN)
-		return GPIOD_LINE_DRIVE_OPEN_DRAIN;
-	if (line->info_flags & GPIOLINE_FLAG_OPEN_SOURCE)
-		return GPIOD_LINE_DRIVE_OPEN_SOURCE;
-
-	return GPIOD_LINE_DRIVE_PUSH_PULL;
-}
-
 static int line_info_v2_to_info_flags(struct gpio_v2_line_info *info)
 {
 	int iflags = 0;
diff --git a/lib/helpers.c b/lib/helpers.c
index fb53518..6e15dcf 100644
--- a/lib/helpers.c
+++ b/lib/helpers.c
@@ -65,19 +65,23 @@ gpiod_chip_get_all_lines(struct gpiod_chip *chip)
 GPIOD_API int gpiod_chip_find_line(struct gpiod_chip *chip, const char *name)
 {
 	unsigned int offset, num_lines;
-	struct gpiod_line *line;
+	struct gpiod_line_info *info;
 	const char *tmp;
 
 	num_lines = gpiod_chip_get_num_lines(chip);
 
 	for (offset = 0; offset < num_lines; offset++) {
-		line = gpiod_chip_get_line(chip, offset);
-		if (!line)
+		info = gpiod_chip_get_line_info(chip, offset);
+		if (!info)
 			return -1;
 
-		tmp = gpiod_line_name(line);
-		if (tmp && strcmp(tmp, name) == 0)
-			return gpiod_line_offset(line);
+		tmp = gpiod_line_get_name(info);
+		if (tmp && strcmp(tmp, name) == 0) {
+			gpiod_line_info_unref(info);
+			return offset;
+		}
+
+		gpiod_line_info_unref(info);
 	}
 
 	errno = ENOENT;
diff --git a/lib/info.c b/lib/info.c
new file mode 100644
index 0000000..5f7c463
--- /dev/null
+++ b/lib/info.c
@@ -0,0 +1,170 @@
+// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-FileCopyrightText: 2021 Bartosz Golaszewski <brgl@bgdev.pl>
+
+#include <gpiod.h>
+#include <string.h>
+
+#include "internal.h"
+#include "uapi/gpio.h"
+
+struct gpiod_line_info {
+	struct gpiod_refcount refcount;
+	unsigned int offset;
+	char name[GPIO_MAX_NAME_SIZE];
+	bool used;
+	char consumer[GPIO_MAX_NAME_SIZE];
+	int direction;
+	bool active_low;
+	int bias;
+	int drive;
+	int edge;
+	bool debounced;
+	unsigned long debounce_period;
+};
+
+GPIOD_API struct gpiod_line_info *
+gpiod_line_info_ref(struct gpiod_line_info *info)
+{
+	gpiod_refcount_ref(&info->refcount);
+	return info;
+}
+
+static void line_info_release(struct gpiod_refcount *refcount)
+{
+	struct gpiod_line_info *info;
+
+	info = gpiod_container_of(refcount, struct gpiod_line_info, refcount);
+
+	free(info);
+}
+
+GPIOD_API void gpiod_line_info_unref(struct gpiod_line_info *info)
+{
+	gpiod_refcount_unref(&info->refcount);
+}
+
+GPIOD_API unsigned int gpiod_line_info_get_offset(struct gpiod_line_info *info)
+{
+	return info->offset;
+}
+
+GPIOD_API const char *gpiod_line_get_name(struct gpiod_line_info *info)
+{
+	return info->name[0] == '\0' ? NULL : info->name;
+}
+
+GPIOD_API bool gpiod_line_is_used(struct gpiod_line_info *info)
+{
+	return info->used;
+}
+
+GPIOD_API const char *gpiod_line_get_consumer(struct gpiod_line_info *info)
+{
+	return info->consumer[0] == '\0' ? NULL : info->consumer;
+}
+
+GPIOD_API int gpiod_line_get_direction(struct gpiod_line_info *info)
+{
+	return info->direction;
+}
+
+GPIOD_API bool gpiod_line_is_active_low(struct gpiod_line_info *info)
+{
+	return info->active_low;
+}
+
+GPIOD_API int gpiod_line_get_bias(struct gpiod_line_info *info)
+{
+	return info->bias;
+}
+
+GPIOD_API int gpiod_line_get_drive(struct gpiod_line_info *info)
+{
+	return info->drive;
+}
+
+GPIOD_API int gpiod_line_get_edge_detection(struct gpiod_line_info *info)
+{
+	return info->edge;
+}
+
+GPIOD_API bool gpiod_line_is_debounced(struct gpiod_line_info *info)
+{
+	return info->debounced;
+}
+
+GPIOD_API unsigned long
+gpiod_line_get_debounce_period(struct gpiod_line_info *info)
+{
+	return info->debounce_period;
+}
+
+struct gpiod_line_info *
+gpiod_line_info_from_kernel(struct gpio_v2_line_info *infobuf)
+{
+	struct gpio_v2_line_attribute *attr;
+	struct gpiod_line_info *info;
+	unsigned int i;
+
+	info = malloc(sizeof(*info));
+	if (!info)
+		return NULL;
+
+	memset(info, 0, sizeof(*info));
+
+	gpiod_refcount_init(&info->refcount, line_info_release);
+	info->offset = infobuf->offset;
+	strncpy(info->name, infobuf->name, GPIO_MAX_NAME_SIZE);
+
+	info->used = !!(infobuf->flags & GPIO_V2_LINE_FLAG_USED);
+	strncpy(info->consumer, infobuf->consumer, GPIO_MAX_NAME_SIZE);
+
+	if (infobuf->flags & GPIO_V2_LINE_FLAG_OUTPUT)
+		info->direction = GPIOD_LINE_DIRECTION_OUTPUT;
+	else
+		info->direction = GPIOD_LINE_DIRECTION_INPUT;
+
+	if (infobuf->flags & GPIO_V2_LINE_FLAG_ACTIVE_LOW)
+		info->active_low = true;
+
+	if (infobuf->flags & GPIO_V2_LINE_FLAG_BIAS_PULL_UP)
+		info->bias = GPIOD_LINE_BIAS_PULL_UP;
+	else if (infobuf->flags & GPIO_V2_LINE_FLAG_BIAS_PULL_DOWN)
+		info->bias = GPIOD_LINE_BIAS_PULL_DOWN;
+	else if (infobuf->flags & GPIO_V2_LINE_FLAG_BIAS_DISABLED)
+		info->bias = GPIOD_LINE_BIAS_DISABLED;
+	else
+		info->bias = GPIOD_LINE_BIAS_UNKNOWN;
+
+	if (infobuf->flags & GPIO_V2_LINE_FLAG_OPEN_DRAIN)
+		info->drive = GPIOD_LINE_DRIVE_OPEN_DRAIN;
+	else if (infobuf->flags & GPIO_V2_LINE_FLAG_OPEN_SOURCE)
+		info->drive = GPIOD_LINE_DRIVE_OPEN_SOURCE;
+	else
+		info->drive = GPIOD_LINE_DRIVE_PUSH_PULL;
+
+	if ((infobuf->flags & GPIO_V2_LINE_FLAG_EDGE_RISING) &&
+	    (infobuf->flags & GPIO_V2_LINE_FLAG_EDGE_FALLING))
+		info->edge = GPIOD_LINE_EDGE_BOTH;
+	else if (infobuf->flags & GPIO_V2_LINE_FLAG_EDGE_RISING)
+		info->edge = GPIOD_LINE_EDGE_RISING;
+	else if (infobuf->flags & GPIO_V2_LINE_FLAG_EDGE_FALLING)
+		info->edge = GPIOD_LINE_EDGE_FALLING;
+	else
+		info->edge = GPIOD_LINE_EDGE_NONE;
+
+	/*
+	 * We assume that the kernel returns correct configuration and that no
+	 * attributes repeat.
+	 */
+	for (i = 0; i < infobuf->num_attrs; i++) {
+		attr = &infobuf->attrs[i];
+
+		if (attr->id == GPIO_V2_LINE_ATTR_ID_DEBOUNCE) {
+			info->debounced = true;
+			info->debounce_period = attr->debounce_period_us;
+		}
+	}
+
+	return info;
+}
diff --git a/lib/internal.h b/lib/internal.h
index a652879..2d1627d 100644
--- a/lib/internal.h
+++ b/lib/internal.h
@@ -4,8 +4,11 @@
 #ifndef __LIBGPIOD_GPIOD_INTERNAL_H__
 #define __LIBGPIOD_GPIOD_INTERNAL_H__
 
+#include <gpiod.h>
 #include <stddef.h>
 
+#include "uapi/gpio.h"
+
 /* For internal library use only. */
 
 #define GPIOD_API __attribute__((visibility("default")))
@@ -27,4 +30,7 @@ void gpiod_refcount_init(struct gpiod_refcount *refcount,
 void gpiod_refcount_ref(struct gpiod_refcount *refcount);
 void gpiod_refcount_unref(struct gpiod_refcount *refcount);
 
+struct gpiod_line_info *
+gpiod_line_info_from_kernel(struct gpio_v2_line_info *infobuf);
+
 #endif /* __LIBGPIOD_GPIOD_INTERNAL_H__ */
diff --git a/tests/gpiod-test.h b/tests/gpiod-test.h
index a093f83..6b93a96 100644
--- a/tests/gpiod-test.h
+++ b/tests/gpiod-test.h
@@ -21,9 +21,11 @@
  */
 typedef struct gpiod_chip gpiod_chip_struct;
 typedef struct gpiod_line_bulk gpiod_line_bulk_struct;
+typedef struct gpiod_line_info gpiod_line_info_struct;
 
 G_DEFINE_AUTOPTR_CLEANUP_FUNC(gpiod_chip_struct, gpiod_chip_unref);
 G_DEFINE_AUTOPTR_CLEANUP_FUNC(gpiod_line_bulk_struct, gpiod_line_bulk_free);
+G_DEFINE_AUTOPTR_CLEANUP_FUNC(gpiod_line_info_struct, gpiod_line_info_unref);
 
 /* These are private definitions and should not be used directly. */
 typedef void (*_gpiod_test_func)(void);
diff --git a/tests/tests-chip.c b/tests/tests-chip.c
index 46fb8d2..cad440a 100644
--- a/tests/tests-chip.c
+++ b/tests/tests-chip.c
@@ -195,8 +195,8 @@ GPIOD_TEST_CASE(get_all_lines, 0, { 4 })
 
 GPIOD_TEST_CASE(find_line_good, GPIOD_TEST_FLAG_NAMED_LINES, { 8, 8, 8 })
 {
+	g_autoptr(gpiod_line_info_struct) info = NULL;
 	g_autoptr(gpiod_chip_struct) chip = NULL;
-	struct gpiod_line *line;
 	int offset;
 
 	chip = gpiod_chip_open(gpiod_test_chip_path(1));
@@ -207,11 +207,11 @@ GPIOD_TEST_CASE(find_line_good, GPIOD_TEST_FLAG_NAMED_LINES, { 8, 8, 8 })
 	g_assert_cmpint(offset, ==, 4);
 	gpiod_test_return_if_failed();
 
-	line = gpiod_chip_get_line(chip, 4);
-	g_assert_nonnull(line);
+	info = gpiod_chip_get_line_info(chip, 4);
+	g_assert_nonnull(info);
 	gpiod_test_return_if_failed();
 
-	g_assert_cmpstr(gpiod_line_name(line), ==, "gpio-mockup-B-4");
+	g_assert_cmpstr(gpiod_line_get_name(info), ==, "gpio-mockup-B-4");
 }
 
 GPIOD_TEST_CASE(find_line_unique_not_found,
diff --git a/tests/tests-line.c b/tests/tests-line.c
index 3985990..5fa1fd5 100644
--- a/tests/tests-line.c
+++ b/tests/tests-line.c
@@ -58,8 +58,43 @@ GPIOD_TEST_CASE(request_already_requested, 0, { 8 })
 	g_assert_cmpint(errno, ==, EBUSY);
 }
 
+GPIOD_TEST_CASE(line_name, GPIOD_TEST_FLAG_NAMED_LINES, { 8 })
+{
+	g_autoptr(gpiod_line_info_struct) info = NULL;
+	g_autoptr(gpiod_chip_struct) chip = NULL;
+
+	chip = gpiod_chip_open(gpiod_test_chip_path(0));
+	g_assert_nonnull(chip);
+	gpiod_test_return_if_failed();
+
+	info = gpiod_chip_get_line_info(chip, 2);
+	g_assert_nonnull(info);
+	gpiod_test_return_if_failed();
+
+	g_assert_nonnull(gpiod_line_get_name(info));
+	g_assert_cmpstr(gpiod_line_get_name(info), ==, "gpio-mockup-A-2");
+}
+
+GPIOD_TEST_CASE(line_name_unnamed, 0, { 8 })
+{
+	g_autoptr(gpiod_line_info_struct) info = NULL;
+	g_autoptr(gpiod_chip_struct) chip = NULL;
+
+	chip = gpiod_chip_open(gpiod_test_chip_path(0));
+	g_assert_nonnull(chip);
+	gpiod_test_return_if_failed();
+
+	info = gpiod_chip_get_line_info(chip, 2);
+	g_assert_nonnull(info);
+	gpiod_test_return_if_failed();
+
+	g_assert_null(gpiod_line_get_name(info));
+}
+
 GPIOD_TEST_CASE(consumer, 0, { 8 })
 {
+	g_autoptr(gpiod_line_info_struct) info_before = NULL;
+	g_autoptr(gpiod_line_info_struct) info_after = NULL;
 	g_autoptr(gpiod_chip_struct) chip = NULL;
 	struct gpiod_line *line;
 	gint ret;
@@ -72,15 +107,25 @@ GPIOD_TEST_CASE(consumer, 0, { 8 })
 	g_assert_nonnull(line);
 	gpiod_test_return_if_failed();
 
-	g_assert_null(gpiod_line_consumer(line));
+	info_before = gpiod_chip_get_line_info(chip, 0);
+	g_assert_nonnull(info_before);
+	gpiod_test_return_if_failed();
+	g_assert_null(gpiod_line_get_consumer(info_before));
 
 	ret = gpiod_line_request_input(line, GPIOD_TEST_CONSUMER);
 	g_assert_cmpint(ret, ==, 0);
-	g_assert_cmpstr(gpiod_line_consumer(line), ==, GPIOD_TEST_CONSUMER);
+
+	info_after = gpiod_chip_get_line_info(chip, 0);
+	g_assert_nonnull(info_after);
+	gpiod_test_return_if_failed();
+	g_assert_cmpstr(gpiod_line_get_consumer(info_after),
+			==, GPIOD_TEST_CONSUMER);
 }
 
 GPIOD_TEST_CASE(consumer_long_string, 0, { 8 })
 {
+	g_autoptr(gpiod_line_info_struct) info_before = NULL;
+	g_autoptr(gpiod_line_info_struct) info_after = NULL;
 	g_autoptr(gpiod_chip_struct) chip = NULL;
 	struct gpiod_line *line;
 	gint ret;
@@ -93,15 +138,22 @@ GPIOD_TEST_CASE(consumer_long_string, 0, { 8 })
 	g_assert_nonnull(line);
 	gpiod_test_return_if_failed();
 
-	g_assert_null(gpiod_line_consumer(line));
+	info_before = gpiod_chip_get_line_info(chip, 0);
+	g_assert_nonnull(info_before);
+	gpiod_test_return_if_failed();
+	g_assert_null(gpiod_line_get_consumer(info_before));
 
 	ret = gpiod_line_request_input(line,
 			"consumer string over 32 characters long");
 	g_assert_cmpint(ret, ==, 0);
 	gpiod_test_return_if_failed();
-	g_assert_cmpstr(gpiod_line_consumer(line), ==,
+
+	info_after = gpiod_chip_get_line_info(chip, 0);
+	g_assert_nonnull(info_after);
+	gpiod_test_return_if_failed();
+	g_assert_cmpstr(gpiod_line_get_consumer(info_after), ==,
 			"consumer string over 32 charact");
-	g_assert_cmpuint(strlen(gpiod_line_consumer(line)), ==, 31);
+	g_assert_cmpuint(strlen(gpiod_line_get_consumer(info_after)), ==, 31);
 }
 
 GPIOD_TEST_CASE(request_bulk_output, 0, { 8, 8 })
@@ -336,9 +388,6 @@ GPIOD_TEST_CASE(set_config_bulk_null_values, 0, { 8 })
 	ret = gpiod_line_request_bulk_output(bulk, GPIOD_TEST_CONSUMER, 0);
 	g_assert_cmpint(ret, ==, 0);
 	gpiod_test_return_if_failed();
-	g_assert_false(gpiod_line_is_active_low(line0));
-	g_assert_false(gpiod_line_is_active_low(line1));
-	g_assert_false(gpiod_line_is_active_low(line2));
 
 	g_assert_cmpint(gpiod_test_chip_get_value(0, 0), ==, 0);
 	g_assert_cmpint(gpiod_test_chip_get_value(0, 1), ==, 0);
@@ -348,9 +397,7 @@ GPIOD_TEST_CASE(set_config_bulk_null_values, 0, { 8 })
 			GPIOD_LINE_REQUEST_DIRECTION_OUTPUT,
 			GPIOD_LINE_REQUEST_FLAG_ACTIVE_LOW, NULL);
 	g_assert_cmpint(ret, ==, 0);
-	g_assert_true(gpiod_line_is_active_low(line0));
-	g_assert_true(gpiod_line_is_active_low(line1));
-	g_assert_true(gpiod_line_is_active_low(line2));
+
 	g_assert_cmpint(gpiod_test_chip_get_value(0, 0), ==, 1);
 	g_assert_cmpint(gpiod_test_chip_get_value(0, 1), ==, 1);
 	g_assert_cmpint(gpiod_test_chip_get_value(0, 2), ==, 1);
@@ -358,9 +405,7 @@ GPIOD_TEST_CASE(set_config_bulk_null_values, 0, { 8 })
 	ret = gpiod_line_set_config_bulk(bulk,
 			GPIOD_LINE_REQUEST_DIRECTION_OUTPUT, 0, NULL);
 	g_assert_cmpint(ret, ==, 0);
-	g_assert_false(gpiod_line_is_active_low(line0));
-	g_assert_false(gpiod_line_is_active_low(line1));
-	g_assert_false(gpiod_line_is_active_low(line2));
+
 	g_assert_cmpint(gpiod_test_chip_get_value(0, 0), ==, 0);
 	g_assert_cmpint(gpiod_test_chip_get_value(0, 1), ==, 0);
 	g_assert_cmpint(gpiod_test_chip_get_value(0, 2), ==, 0);
@@ -368,6 +413,9 @@ GPIOD_TEST_CASE(set_config_bulk_null_values, 0, { 8 })
 
 GPIOD_TEST_CASE(set_flags_active_state, 0, { 8 })
 {
+	g_autoptr(gpiod_line_info_struct) info0 = NULL;
+	g_autoptr(gpiod_line_info_struct) info1 = NULL;
+	g_autoptr(gpiod_line_info_struct) info2 = NULL;
 	g_autoptr(gpiod_chip_struct) chip = NULL;
 	struct gpiod_line *line;
 	gint ret;
@@ -383,22 +431,41 @@ GPIOD_TEST_CASE(set_flags_active_state, 0, { 8 })
 	ret = gpiod_line_request_output(line, GPIOD_TEST_CONSUMER, 1);
 	g_assert_cmpint(ret, ==, 0);
 	gpiod_test_return_if_failed();
-	g_assert_false(gpiod_line_is_active_low(line));
+
+	info0 = gpiod_chip_get_line_info(chip, 2);
+	g_assert_nonnull(info0);
+	gpiod_test_return_if_failed();
+	g_assert_false(gpiod_line_is_active_low(info0));
+
 	g_assert_cmpint(gpiod_test_chip_get_value(0, 2), ==, 1);
 
 	ret = gpiod_line_set_flags(line, GPIOD_LINE_REQUEST_FLAG_ACTIVE_LOW);
 	g_assert_cmpint(ret, ==, 0);
-	g_assert_true(gpiod_line_is_active_low(line));
+
+	info1 = gpiod_chip_get_line_info(chip, 2);
+	g_assert_nonnull(info1);
+	gpiod_test_return_if_failed();
+	g_assert_true(gpiod_line_is_active_low(info1));
+
 	g_assert_cmpint(gpiod_test_chip_get_value(0, 2), ==, 0);
 
 	ret = gpiod_line_set_flags(line, 0);
 	g_assert_cmpint(ret, ==, 0);
-	g_assert_false(gpiod_line_is_active_low(line));
+
+	info2 = gpiod_chip_get_line_info(chip, 2);
+	g_assert_nonnull(info2);
+	gpiod_test_return_if_failed();
+	g_assert_false(gpiod_line_is_active_low(info2));
+
 	g_assert_cmpint(gpiod_test_chip_get_value(0, 2), ==, 1);
 }
 
 GPIOD_TEST_CASE(set_flags_bias, 0, { 8 })
 {
+	g_autoptr(gpiod_line_info_struct) info0 = NULL;
+	g_autoptr(gpiod_line_info_struct) info1 = NULL;
+	g_autoptr(gpiod_line_info_struct) info2 = NULL;
+	g_autoptr(gpiod_line_info_struct) info3 = NULL;
 	g_autoptr(gpiod_chip_struct) chip = NULL;
 	struct gpiod_line *line;
 	gint ret;
@@ -414,28 +481,50 @@ GPIOD_TEST_CASE(set_flags_bias, 0, { 8 })
 	ret = gpiod_line_request_input(line, GPIOD_TEST_CONSUMER);
 	g_assert_cmpint(ret, ==, 0);
 	gpiod_test_return_if_failed();
-	g_assert_cmpint(gpiod_line_bias(line), ==, GPIOD_LINE_BIAS_UNKNOWN);
+
+	info0 = gpiod_chip_get_line_info(chip, 2);
+	g_assert_nonnull(info0);
+	gpiod_test_return_if_failed();
+	g_assert_cmpint(gpiod_line_get_bias(info0), ==,
+			GPIOD_LINE_BIAS_UNKNOWN);
 
 	ret = gpiod_line_set_flags(line,
 		GPIOD_LINE_REQUEST_FLAG_BIAS_DISABLED);
 	g_assert_cmpint(ret, ==, 0);
-	g_assert_cmpint(gpiod_line_bias(line), ==, GPIOD_LINE_BIAS_DISABLED);
+
+	info1 = gpiod_chip_get_line_info(chip, 2);
+	g_assert_nonnull(info1);
+	gpiod_test_return_if_failed();
+	g_assert_cmpint(gpiod_line_get_bias(info1), ==,
+			GPIOD_LINE_BIAS_DISABLED);
 
 	ret = gpiod_line_set_flags(line,
 		GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_UP);
 	g_assert_cmpint(ret, ==, 0);
-	g_assert_cmpint(gpiod_line_bias(line), ==, GPIOD_LINE_BIAS_PULL_UP);
 	g_assert_cmpint(gpiod_test_chip_get_value(0, 2), ==, 1);
 
+	info2 = gpiod_chip_get_line_info(chip, 2);
+	g_assert_nonnull(info2);
+	gpiod_test_return_if_failed();
+	g_assert_cmpint(gpiod_line_get_bias(info2), ==,
+			GPIOD_LINE_BIAS_PULL_UP);
+
 	ret = gpiod_line_set_flags(line,
 		GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_DOWN);
 	g_assert_cmpint(ret, ==, 0);
-	g_assert_cmpint(gpiod_line_bias(line), ==, GPIOD_LINE_BIAS_PULL_DOWN);
 	g_assert_cmpint(gpiod_test_chip_get_value(0, 2), ==, 0);
+
+	info3 = gpiod_chip_get_line_info(chip, 2);
+	g_assert_nonnull(info3);
+	gpiod_test_return_if_failed();
+	g_assert_cmpint(gpiod_line_get_bias(info3), ==, GPIOD_LINE_BIAS_PULL_DOWN);
 }
 
 GPIOD_TEST_CASE(set_flags_drive, 0, { 8 })
 {
+	g_autoptr(gpiod_line_info_struct) info0 = NULL;
+	g_autoptr(gpiod_line_info_struct) info1 = NULL;
+	g_autoptr(gpiod_line_info_struct) info2 = NULL;
 	g_autoptr(gpiod_chip_struct) chip = NULL;
 	struct gpiod_line *line;
 	gint ret;
@@ -451,23 +540,39 @@ GPIOD_TEST_CASE(set_flags_drive, 0, { 8 })
 	ret = gpiod_line_request_output(line, GPIOD_TEST_CONSUMER, 0);
 	g_assert_cmpint(ret, ==, 0);
 	gpiod_test_return_if_failed();
-	g_assert_cmpint(gpiod_line_drive(line), ==, GPIOD_LINE_DRIVE_PUSH_PULL);
+
+	info0 = gpiod_chip_get_line_info(chip, 2);
+	g_assert_nonnull(info0);
+	gpiod_test_return_if_failed();
+	g_assert_cmpint(gpiod_line_get_drive(info0), ==,
+			GPIOD_LINE_DRIVE_PUSH_PULL);
 
 	ret = gpiod_line_set_flags(line,
 		GPIOD_LINE_REQUEST_FLAG_OPEN_DRAIN);
 	g_assert_cmpint(ret, ==, 0);
-	g_assert_cmpint(gpiod_line_drive(line), ==,
+
+	info1 = gpiod_chip_get_line_info(chip, 2);
+	g_assert_nonnull(info1);
+	gpiod_test_return_if_failed();
+	g_assert_cmpint(gpiod_line_get_drive(info1), ==,
 			GPIOD_LINE_DRIVE_OPEN_DRAIN);
 
 	ret = gpiod_line_set_flags(line,
 		GPIOD_LINE_REQUEST_FLAG_OPEN_SOURCE);
 	g_assert_cmpint(ret, ==, 0);
-	g_assert_cmpint(gpiod_line_drive(line), ==,
+
+	info2 = gpiod_chip_get_line_info(chip, 2);
+	g_assert_nonnull(info2);
+	gpiod_test_return_if_failed();
+	g_assert_cmpint(gpiod_line_get_drive(info2), ==,
 			GPIOD_LINE_DRIVE_OPEN_SOURCE);
 }
 
 GPIOD_TEST_CASE(set_direction, 0, { 8 })
 {
+	g_autoptr(gpiod_line_info_struct) info0 = NULL;
+	g_autoptr(gpiod_line_info_struct) info1 = NULL;
+	g_autoptr(gpiod_line_info_struct) info2 = NULL;
 	g_autoptr(gpiod_chip_struct) chip = NULL;
 	struct gpiod_line *line;
 	gint ret;
@@ -483,24 +588,49 @@ GPIOD_TEST_CASE(set_direction, 0, { 8 })
 	ret = gpiod_line_request_output(line, GPIOD_TEST_CONSUMER, 0);
 	g_assert_cmpint(ret, ==, 0);
 	gpiod_test_return_if_failed();
-	g_assert_cmpint(gpiod_line_direction(line), ==,
-			GPIOD_LINE_DIRECTION_OUTPUT);
 	g_assert_cmpint(gpiod_test_chip_get_value(0, 2), ==, 0);
 
+	info0 = gpiod_chip_get_line_info(chip, 2);
+	g_assert_nonnull(info0);
+	gpiod_test_return_if_failed();
+	g_assert_cmpint(gpiod_line_get_direction(info0), ==,
+			GPIOD_LINE_DIRECTION_OUTPUT);
+
 	ret = gpiod_line_set_direction_input(line);
 	g_assert_cmpint(ret, ==, 0);
-	g_assert_cmpint(gpiod_line_direction(line), ==,
+
+	info1 = gpiod_chip_get_line_info(chip, 2);
+	g_assert_nonnull(info1);
+	gpiod_test_return_if_failed();
+	g_assert_cmpint(gpiod_line_get_direction(info1), ==,
 			GPIOD_LINE_DIRECTION_INPUT);
 
 	ret = gpiod_line_set_direction_output(line, 1);
 	g_assert_cmpint(ret, ==, 0);
-	g_assert_cmpint(gpiod_line_direction(line), ==,
+	g_assert_cmpint(gpiod_test_chip_get_value(0, 2), ==, 1);
+
+	info2 = gpiod_chip_get_line_info(chip, 2);
+	g_assert_nonnull(info2);
+	gpiod_test_return_if_failed();
+	g_assert_cmpint(gpiod_line_get_direction(info2), ==,
 			GPIOD_LINE_DIRECTION_OUTPUT);
 	g_assert_cmpint(gpiod_test_chip_get_value(0, 2), ==, 1);
 }
 
 GPIOD_TEST_CASE(set_direction_bulk, 0, { 8 })
 {
+	g_autoptr(gpiod_line_info_struct) info0_0 = NULL;
+	g_autoptr(gpiod_line_info_struct) info0_1 = NULL;
+	g_autoptr(gpiod_line_info_struct) info0_2 = NULL;
+	g_autoptr(gpiod_line_info_struct) info1_0 = NULL;
+	g_autoptr(gpiod_line_info_struct) info1_1 = NULL;
+	g_autoptr(gpiod_line_info_struct) info1_2 = NULL;
+	g_autoptr(gpiod_line_info_struct) info2_0 = NULL;
+	g_autoptr(gpiod_line_info_struct) info2_1 = NULL;
+	g_autoptr(gpiod_line_info_struct) info2_2 = NULL;
+	g_autoptr(gpiod_line_info_struct) info3_0 = NULL;
+	g_autoptr(gpiod_line_info_struct) info3_1 = NULL;
+	g_autoptr(gpiod_line_info_struct) info3_2 = NULL;
 	g_autoptr(gpiod_line_bulk_struct) bulk = NULL;
 	g_autoptr(gpiod_chip_struct) chip = NULL;
 	struct gpiod_line *line0, *line1, *line2;
@@ -536,23 +666,42 @@ GPIOD_TEST_CASE(set_direction_bulk, 0, { 8 })
 			GPIOD_TEST_CONSUMER, values);
 	g_assert_cmpint(ret, ==, 0);
 	gpiod_test_return_if_failed();
-	g_assert_cmpint(gpiod_line_direction(line0), ==,
+
+	info0_0 = gpiod_chip_get_line_info(chip, 0);
+	info0_1 = gpiod_chip_get_line_info(chip, 1);
+	info0_2 = gpiod_chip_get_line_info(chip, 2);
+	g_assert_nonnull(info0_0);
+	g_assert_nonnull(info0_1);
+	g_assert_nonnull(info0_2);
+	gpiod_test_return_if_failed();
+
+	g_assert_cmpint(gpiod_line_get_direction(info0_0), ==,
 			GPIOD_LINE_DIRECTION_OUTPUT);
-	g_assert_cmpint(gpiod_line_direction(line1), ==,
+	g_assert_cmpint(gpiod_line_get_direction(info0_1), ==,
 			GPIOD_LINE_DIRECTION_OUTPUT);
-	g_assert_cmpint(gpiod_line_direction(line2), ==,
+	g_assert_cmpint(gpiod_line_get_direction(info0_2), ==,
 			GPIOD_LINE_DIRECTION_OUTPUT);
+
 	g_assert_cmpint(gpiod_test_chip_get_value(0, 0), ==, 0);
 	g_assert_cmpint(gpiod_test_chip_get_value(0, 1), ==, 1);
 	g_assert_cmpint(gpiod_test_chip_get_value(0, 2), ==, 1);
 
 	ret = gpiod_line_set_direction_input_bulk(bulk);
 	g_assert_cmpint(ret, ==, 0);
-	g_assert_cmpint(gpiod_line_direction(line0), ==,
+
+	info1_0 = gpiod_chip_get_line_info(chip, 0);
+	info1_1 = gpiod_chip_get_line_info(chip, 1);
+	info1_2 = gpiod_chip_get_line_info(chip, 2);
+	g_assert_nonnull(info1_0);
+	g_assert_nonnull(info1_1);
+	g_assert_nonnull(info1_2);
+	gpiod_test_return_if_failed();
+
+	g_assert_cmpint(gpiod_line_get_direction(info1_0), ==,
 			GPIOD_LINE_DIRECTION_INPUT);
-	g_assert_cmpint(gpiod_line_direction(line1), ==,
+	g_assert_cmpint(gpiod_line_get_direction(info1_1), ==,
 			GPIOD_LINE_DIRECTION_INPUT);
-	g_assert_cmpint(gpiod_line_direction(line2), ==,
+	g_assert_cmpint(gpiod_line_get_direction(info1_2), ==,
 			GPIOD_LINE_DIRECTION_INPUT);
 
 	values[0] = 2;
@@ -561,24 +710,44 @@ GPIOD_TEST_CASE(set_direction_bulk, 0, { 8 })
 
 	ret = gpiod_line_set_direction_output_bulk(bulk, values);
 	g_assert_cmpint(ret, ==, 0);
-	g_assert_cmpint(gpiod_line_direction(line0), ==,
+
+	info2_0 = gpiod_chip_get_line_info(chip, 0);
+	info2_1 = gpiod_chip_get_line_info(chip, 1);
+	info2_2 = gpiod_chip_get_line_info(chip, 2);
+	g_assert_nonnull(info2_0);
+	g_assert_nonnull(info2_1);
+	g_assert_nonnull(info2_2);
+	gpiod_test_return_if_failed();
+
+	g_assert_cmpint(gpiod_line_get_direction(info2_0), ==,
 			GPIOD_LINE_DIRECTION_OUTPUT);
-	g_assert_cmpint(gpiod_line_direction(line1), ==,
+	g_assert_cmpint(gpiod_line_get_direction(info2_1), ==,
 			GPIOD_LINE_DIRECTION_OUTPUT);
-	g_assert_cmpint(gpiod_line_direction(line2), ==,
+	g_assert_cmpint(gpiod_line_get_direction(info2_2), ==,
 			GPIOD_LINE_DIRECTION_OUTPUT);
+
 	g_assert_cmpint(gpiod_test_chip_get_value(0, 0), ==, 1);
 	g_assert_cmpint(gpiod_test_chip_get_value(0, 1), ==, 1);
 	g_assert_cmpint(gpiod_test_chip_get_value(0, 2), ==, 0);
 
 	ret = gpiod_line_set_direction_output_bulk(bulk, NULL);
 	g_assert_cmpint(ret, ==, 0);
-	g_assert_cmpint(gpiod_line_direction(line0), ==,
+
+	info3_0 = gpiod_chip_get_line_info(chip, 0);
+	info3_1 = gpiod_chip_get_line_info(chip, 1);
+	info3_2 = gpiod_chip_get_line_info(chip, 2);
+	g_assert_nonnull(info3_0);
+	g_assert_nonnull(info3_1);
+	g_assert_nonnull(info3_2);
+	gpiod_test_return_if_failed();
+
+	g_assert_cmpint(gpiod_line_get_direction(info3_0), ==,
 			GPIOD_LINE_DIRECTION_OUTPUT);
-	g_assert_cmpint(gpiod_line_direction(line1), ==,
+	g_assert_cmpint(gpiod_line_get_direction(info3_1), ==,
 			GPIOD_LINE_DIRECTION_OUTPUT);
-	g_assert_cmpint(gpiod_line_direction(line2), ==,
+	g_assert_cmpint(gpiod_line_get_direction(info3_2), ==,
 			GPIOD_LINE_DIRECTION_OUTPUT);
+
 	g_assert_cmpint(gpiod_test_chip_get_value(0, 0), ==, 0);
 	g_assert_cmpint(gpiod_test_chip_get_value(0, 1), ==, 0);
 	g_assert_cmpint(gpiod_test_chip_get_value(0, 2), ==, 0);
@@ -658,6 +827,8 @@ GPIOD_TEST_CASE(output_value_caching, 0, { 8 })
 
 GPIOD_TEST_CASE(direction, 0, { 8 })
 {
+	g_autoptr(gpiod_line_info_struct) info0 = NULL;
+	g_autoptr(gpiod_line_info_struct) info1 = NULL;
 	g_autoptr(gpiod_chip_struct) chip = NULL;
 	struct gpiod_line *line;
 	gint ret;
@@ -673,7 +844,12 @@ GPIOD_TEST_CASE(direction, 0, { 8 })
 	ret = gpiod_line_request_output(line, GPIOD_TEST_CONSUMER, 1);
 	g_assert_cmpint(ret, ==, 0);
 	gpiod_test_return_if_failed();
-	g_assert_cmpint(gpiod_line_direction(line), ==,
+
+	info0 = gpiod_chip_get_line_info(chip, 5);
+	g_assert_nonnull(info0);
+	gpiod_test_return_if_failed();
+
+	g_assert_cmpint(gpiod_line_get_direction(info0), ==,
 			GPIOD_LINE_DIRECTION_OUTPUT);
 	g_assert_cmpint(gpiod_test_chip_get_value(0, 5), ==, 1);
 
@@ -681,12 +857,21 @@ GPIOD_TEST_CASE(direction, 0, { 8 })
 
 	ret = gpiod_line_request_input(line, GPIOD_TEST_CONSUMER);
 	g_assert_cmpint(ret, ==, 0);
-	g_assert_cmpint(gpiod_line_direction(line), ==,
+
+	info1 = gpiod_chip_get_line_info(chip, 5);
+	g_assert_nonnull(info1);
+	gpiod_test_return_if_failed();
+
+	g_assert_cmpint(gpiod_line_get_direction(info1), ==,
 			GPIOD_LINE_DIRECTION_INPUT);
 }
 
 GPIOD_TEST_CASE(active_state, 0, { 8 })
 {
+	g_autoptr(gpiod_line_info_struct) info0 = NULL;
+	g_autoptr(gpiod_line_info_struct) info1 = NULL;
+	g_autoptr(gpiod_line_info_struct) info2 = NULL;
+	g_autoptr(gpiod_line_info_struct) info3 = NULL;
 	g_autoptr(gpiod_chip_struct) chip = NULL;
 	struct gpiod_line *line;
 	gint ret;
@@ -703,7 +888,11 @@ GPIOD_TEST_CASE(active_state, 0, { 8 })
 	g_assert_cmpint(ret, ==, 0);
 	gpiod_test_return_if_failed();
 
-	g_assert_false(gpiod_line_is_active_low(line));
+	info0 = gpiod_chip_get_line_info(chip, 5);
+	g_assert_nonnull(info0);
+	gpiod_test_return_if_failed();
+
+	g_assert_false(gpiod_line_is_active_low(info0));
 
 	gpiod_line_release(line);
 
@@ -712,7 +901,11 @@ GPIOD_TEST_CASE(active_state, 0, { 8 })
 	g_assert_cmpint(ret, ==, 0);
 	gpiod_test_return_if_failed();
 
-	g_assert_cmpint(gpiod_line_direction(line), ==,
+	info1 = gpiod_chip_get_line_info(chip, 5);
+	g_assert_nonnull(info1);
+	gpiod_test_return_if_failed();
+
+	g_assert_cmpint(gpiod_line_get_direction(info1), ==,
 			GPIOD_LINE_DIRECTION_INPUT);
 
 	gpiod_line_release(line);
@@ -722,7 +915,11 @@ GPIOD_TEST_CASE(active_state, 0, { 8 })
 	g_assert_cmpint(ret, ==, 0);
 	gpiod_test_return_if_failed();
 
-	g_assert_cmpint(gpiod_line_direction(line), ==,
+	info2 = gpiod_chip_get_line_info(chip, 5);
+	g_assert_nonnull(info2);
+	gpiod_test_return_if_failed();
+
+	g_assert_cmpint(gpiod_line_get_direction(info2), ==,
 			GPIOD_LINE_DIRECTION_OUTPUT);
 	g_assert_cmpint(gpiod_test_chip_get_value(0, 5), ==, 1);
 
@@ -733,7 +930,11 @@ GPIOD_TEST_CASE(active_state, 0, { 8 })
 	g_assert_cmpint(ret, ==, 0);
 	gpiod_test_return_if_failed();
 
-	g_assert_cmpint(gpiod_line_direction(line), ==,
+	info3 = gpiod_chip_get_line_info(chip, 5);
+	g_assert_nonnull(info3);
+	gpiod_test_return_if_failed();
+
+	g_assert_cmpint(gpiod_line_get_direction(info3), ==,
 			GPIOD_LINE_DIRECTION_OUTPUT);
 	g_assert_cmpint(gpiod_test_chip_get_value(0, 5), ==, 0);
 
@@ -741,6 +942,9 @@ GPIOD_TEST_CASE(active_state, 0, { 8 })
 
 GPIOD_TEST_CASE(misc_flags, 0, { 8 })
 {
+	g_autoptr(gpiod_line_info_struct) info0 = NULL;
+	g_autoptr(gpiod_line_info_struct) info1 = NULL;
+	g_autoptr(gpiod_line_info_struct) info2 = NULL;
 	g_autoptr(gpiod_chip_struct) chip = NULL;
 	struct gpiod_line_request_config config;
 	struct gpiod_line *line;
@@ -754,9 +958,15 @@ GPIOD_TEST_CASE(misc_flags, 0, { 8 })
 	g_assert_nonnull(line);
 	gpiod_test_return_if_failed();
 
-	g_assert_false(gpiod_line_is_used(line));
-	g_assert_cmpint(gpiod_line_drive(line), ==, GPIOD_LINE_DRIVE_PUSH_PULL);
-	g_assert_cmpint(gpiod_line_bias(line), ==, GPIOD_LINE_BIAS_UNKNOWN);
+	info0 = gpiod_chip_get_line_info(chip, 2);
+	g_assert_nonnull(info0);
+	gpiod_test_return_if_failed();
+
+	g_assert_false(gpiod_line_is_used(info0));
+	g_assert_cmpint(gpiod_line_get_drive(info0), ==,
+			GPIOD_LINE_DRIVE_PUSH_PULL);
+	g_assert_cmpint(gpiod_line_get_bias(info0), ==,
+			GPIOD_LINE_BIAS_UNKNOWN);
 
 	config.request_type = GPIOD_LINE_REQUEST_DIRECTION_OUTPUT;
 	config.consumer = GPIOD_TEST_CONSUMER;
@@ -766,11 +976,16 @@ GPIOD_TEST_CASE(misc_flags, 0, { 8 })
 	g_assert_cmpint(ret, ==, 0);
 	gpiod_test_return_if_failed();
 
-	g_assert_true(gpiod_line_is_used(line));
-	g_assert_cmpint(gpiod_line_drive(line), ==,
+	info1 = gpiod_chip_get_line_info(chip, 2);
+	g_assert_nonnull(info1);
+	gpiod_test_return_if_failed();
+
+	g_assert_true(gpiod_line_is_used(info1));
+	g_assert_cmpint(gpiod_line_get_drive(info1), ==,
 			GPIOD_LINE_DRIVE_OPEN_DRAIN);
-	g_assert_cmpint(gpiod_line_bias(line), ==, GPIOD_LINE_BIAS_UNKNOWN);
-	g_assert_cmpint(gpiod_line_direction(line), ==,
+	g_assert_cmpint(gpiod_line_get_bias(info1), ==,
+			GPIOD_LINE_BIAS_UNKNOWN);
+	g_assert_cmpint(gpiod_line_get_direction(info1), ==,
 			GPIOD_LINE_DIRECTION_OUTPUT);
 
 	gpiod_line_release(line);
@@ -781,11 +996,16 @@ GPIOD_TEST_CASE(misc_flags, 0, { 8 })
 	g_assert_cmpint(ret, ==, 0);
 	gpiod_test_return_if_failed();
 
-	g_assert_true(gpiod_line_is_used(line));
-	g_assert_cmpint(gpiod_line_drive(line), ==,
+	info2 = gpiod_chip_get_line_info(chip, 2);
+	g_assert_nonnull(info2);
+	gpiod_test_return_if_failed();
+
+	g_assert_true(gpiod_line_is_used(info2));
+	g_assert_cmpint(gpiod_line_get_drive(info2), ==,
 			GPIOD_LINE_DRIVE_OPEN_SOURCE);
-	g_assert_cmpint(gpiod_line_bias(line), ==, GPIOD_LINE_BIAS_UNKNOWN);
-	g_assert_cmpint(gpiod_line_direction(line), ==,
+	g_assert_cmpint(gpiod_line_get_bias(info2), ==,
+			GPIOD_LINE_BIAS_UNKNOWN);
+	g_assert_cmpint(gpiod_line_get_direction(info2), ==,
 			GPIOD_LINE_DIRECTION_OUTPUT);
 
 	gpiod_line_release(line);
@@ -793,6 +1013,10 @@ GPIOD_TEST_CASE(misc_flags, 0, { 8 })
 
 GPIOD_TEST_CASE(misc_flags_work_together, 0, { 8 })
 {
+	g_autoptr(gpiod_line_info_struct) info0 = NULL;
+	g_autoptr(gpiod_line_info_struct) info1 = NULL;
+	g_autoptr(gpiod_line_info_struct) info2 = NULL;
+	g_autoptr(gpiod_line_info_struct) info3 = NULL;
 	g_autoptr(gpiod_chip_struct) chip = NULL;
 	struct gpiod_line_request_config config;
 	struct gpiod_line *line;
@@ -820,12 +1044,16 @@ GPIOD_TEST_CASE(misc_flags_work_together, 0, { 8 })
 	g_assert_cmpint(ret, ==, 0);
 	gpiod_test_return_if_failed();
 
-	g_assert_true(gpiod_line_is_used(line));
-	g_assert_cmpint(gpiod_line_drive(line), ==,
+	info0 = gpiod_chip_get_line_info(chip, 2);
+	g_assert_nonnull(info0);
+	gpiod_test_return_if_failed();
+
+	g_assert_true(gpiod_line_is_used(info0));
+	g_assert_cmpint(gpiod_line_get_drive(info0), ==,
 			GPIOD_LINE_DRIVE_OPEN_DRAIN);
-	g_assert_cmpint(gpiod_line_bias(line), ==, GPIOD_LINE_BIAS_UNKNOWN);
-	g_assert_true(gpiod_line_is_active_low(line));
-	g_assert_cmpint(gpiod_line_direction(line), ==,
+	g_assert_cmpint(gpiod_line_get_bias(info0), ==, GPIOD_LINE_BIAS_UNKNOWN);
+	g_assert_true(gpiod_line_is_active_low(info0));
+	g_assert_cmpint(gpiod_line_get_direction(info0), ==,
 			GPIOD_LINE_DIRECTION_OUTPUT);
 
 	gpiod_line_release(line);
@@ -837,11 +1065,16 @@ GPIOD_TEST_CASE(misc_flags_work_together, 0, { 8 })
 	g_assert_cmpint(ret, ==, 0);
 	gpiod_test_return_if_failed();
 
-	g_assert_true(gpiod_line_is_used(line));
-	g_assert_cmpint(gpiod_line_drive(line), ==,
+	info1 = gpiod_chip_get_line_info(chip, 2);
+	g_assert_nonnull(info1);
+	gpiod_test_return_if_failed();
+
+	g_assert_true(gpiod_line_is_used(info1));
+	g_assert_cmpint(gpiod_line_get_drive(info1), ==,
 			GPIOD_LINE_DRIVE_OPEN_SOURCE);
-	g_assert_cmpint(gpiod_line_bias(line), ==, GPIOD_LINE_BIAS_UNKNOWN);
-	g_assert_true(gpiod_line_is_active_low(line));
+	g_assert_cmpint(gpiod_line_get_bias(info1), ==,
+			GPIOD_LINE_BIAS_UNKNOWN);
+	g_assert_true(gpiod_line_is_active_low(info1));
 
 	gpiod_line_release(line);
 
@@ -858,11 +1091,17 @@ GPIOD_TEST_CASE(misc_flags_work_together, 0, { 8 })
 	g_assert_cmpint(ret, ==, 0);
 	gpiod_test_return_if_failed();
 
-	g_assert_true(gpiod_line_is_used(line));
-	g_assert_cmpint(gpiod_line_drive(line), ==, GPIOD_LINE_DRIVE_PUSH_PULL);
-	g_assert_cmpint(gpiod_line_bias(line), ==, GPIOD_LINE_BIAS_PULL_DOWN);
-	g_assert_true(gpiod_line_is_active_low(line));
-	g_assert_cmpint(gpiod_line_direction(line), ==,
+	info2 = gpiod_chip_get_line_info(chip, 2);
+	g_assert_nonnull(info2);
+	gpiod_test_return_if_failed();
+
+	g_assert_true(gpiod_line_is_used(info2));
+	g_assert_cmpint(gpiod_line_get_drive(info2), ==,
+			GPIOD_LINE_DRIVE_PUSH_PULL);
+	g_assert_cmpint(gpiod_line_get_bias(info2), ==,
+			GPIOD_LINE_BIAS_PULL_DOWN);
+	g_assert_true(gpiod_line_is_active_low(info2));
+	g_assert_cmpint(gpiod_line_get_direction(info2), ==,
 			GPIOD_LINE_DIRECTION_INPUT);
 
 	ret = gpiod_line_get_value(line);
@@ -877,11 +1116,17 @@ GPIOD_TEST_CASE(misc_flags_work_together, 0, { 8 })
 	g_assert_cmpint(ret, ==, 0);
 	gpiod_test_return_if_failed();
 
-	g_assert_true(gpiod_line_is_used(line));
-	g_assert_cmpint(gpiod_line_drive(line), ==, GPIOD_LINE_DRIVE_PUSH_PULL);
-	g_assert_cmpint(gpiod_line_bias(line), ==, GPIOD_LINE_BIAS_PULL_UP);
-	g_assert_true(gpiod_line_is_active_low(line));
-	g_assert_cmpint(gpiod_line_direction(line), ==,
+	info3 = gpiod_chip_get_line_info(chip, 2);
+	g_assert_nonnull(info3);
+	gpiod_test_return_if_failed();
+
+	g_assert_true(gpiod_line_is_used(info3));
+	g_assert_cmpint(gpiod_line_get_drive(info3), ==,
+			GPIOD_LINE_DRIVE_PUSH_PULL);
+	g_assert_cmpint(gpiod_line_get_bias(info3), ==,
+			GPIOD_LINE_BIAS_PULL_UP);
+	g_assert_true(gpiod_line_is_active_low(info3));
+	g_assert_cmpint(gpiod_line_get_direction(info3), ==,
 			GPIOD_LINE_DIRECTION_INPUT);
 
 	ret = gpiod_line_get_value(line);
@@ -1018,6 +1263,8 @@ GPIOD_TEST_CASE(release_one_use_another, 0, { 8 })
 
 GPIOD_TEST_CASE(null_consumer, 0, { 8 })
 {
+	g_autoptr(gpiod_line_info_struct) info0 = NULL;
+	g_autoptr(gpiod_line_info_struct) info1 = NULL;
 	g_autoptr(gpiod_chip_struct) chip = NULL;
 	struct gpiod_line_request_config config;
 	struct gpiod_line *line;
@@ -1038,7 +1285,11 @@ GPIOD_TEST_CASE(null_consumer, 0, { 8 })
 	ret = gpiod_line_request(line, &config, 0);
 	g_assert_cmpint(ret, ==, 0);
 	gpiod_test_return_if_failed();
-	g_assert_cmpstr(gpiod_line_consumer(line), ==, "?");
+
+	info0 = gpiod_chip_get_line_info(chip, 2);
+	g_assert_nonnull(info0);
+	gpiod_test_return_if_failed();
+	g_assert_cmpstr(gpiod_line_get_consumer(info0), ==, "?");
 
 	gpiod_line_release(line);
 
@@ -1050,11 +1301,17 @@ GPIOD_TEST_CASE(null_consumer, 0, { 8 })
 
 	ret = gpiod_line_request(line, &config, 0);
 	g_assert_cmpint(ret, ==, 0);
-	g_assert_cmpstr(gpiod_line_consumer(line), ==, "?");
+
+	info1 = gpiod_chip_get_line_info(chip, 2);
+	g_assert_nonnull(info1);
+	gpiod_test_return_if_failed();
+	g_assert_cmpstr(gpiod_line_get_consumer(info1), ==, "?");
 }
 
 GPIOD_TEST_CASE(empty_consumer, 0, { 8 })
 {
+	g_autoptr(gpiod_line_info_struct) info0 = NULL;
+	g_autoptr(gpiod_line_info_struct) info1 = NULL;
 	g_autoptr(gpiod_chip_struct) chip = NULL;
 	struct gpiod_line_request_config config;
 	struct gpiod_line *line;
@@ -1075,7 +1332,11 @@ GPIOD_TEST_CASE(empty_consumer, 0, { 8 })
 	ret = gpiod_line_request(line, &config, 0);
 	g_assert_cmpint(ret, ==, 0);
 	gpiod_test_return_if_failed();
-	g_assert_cmpstr(gpiod_line_consumer(line), ==, "?");
+
+	info0 = gpiod_chip_get_line_info(chip, 2);
+	g_assert_nonnull(info0);
+	gpiod_test_return_if_failed();
+	g_assert_cmpstr(gpiod_line_get_consumer(info0), ==, "?");
 
 	gpiod_line_release(line);
 
@@ -1087,5 +1348,9 @@ GPIOD_TEST_CASE(empty_consumer, 0, { 8 })
 
 	ret = gpiod_line_request(line, &config, 0);
 	g_assert_cmpint(ret, ==, 0);
-	g_assert_cmpstr(gpiod_line_consumer(line), ==, "?");
+
+	info1 = gpiod_chip_get_line_info(chip, 2);
+	g_assert_nonnull(info1);
+	gpiod_test_return_if_failed();
+	g_assert_cmpstr(gpiod_line_get_consumer(info1), ==, "?");
 }
diff --git a/tools/gpioinfo.c b/tools/gpioinfo.c
index 3d89111..7901036 100644
--- a/tools/gpioinfo.c
+++ b/tools/gpioinfo.c
@@ -11,36 +11,36 @@
 
 #include "tools-common.h"
 
-typedef bool (*is_set_func)(struct gpiod_line *);
+typedef bool (*is_set_func)(struct gpiod_line_info *);
 
 struct flag {
 	const char *name;
 	is_set_func is_set;
 };
 
-static bool line_bias_is_pullup(struct gpiod_line *line)
+static bool line_bias_is_pullup(struct gpiod_line_info *info)
 {
-	return gpiod_line_bias(line) == GPIOD_LINE_BIAS_PULL_UP;
+	return gpiod_line_get_bias(info) == GPIOD_LINE_BIAS_PULL_UP;
 }
 
-static bool line_bias_is_pulldown(struct gpiod_line *line)
+static bool line_bias_is_pulldown(struct gpiod_line_info *info)
 {
-	return gpiod_line_bias(line) == GPIOD_LINE_BIAS_PULL_DOWN;
+	return gpiod_line_get_bias(info) == GPIOD_LINE_BIAS_PULL_DOWN;
 }
 
-static bool line_bias_is_disabled(struct gpiod_line *line)
+static bool line_bias_is_disabled(struct gpiod_line_info *info)
 {
-	return gpiod_line_bias(line) == GPIOD_LINE_BIAS_DISABLED;
+	return gpiod_line_get_bias(info) == GPIOD_LINE_BIAS_DISABLED;
 }
 
-static bool line_drive_is_open_drain(struct gpiod_line *line)
+static bool line_drive_is_open_drain(struct gpiod_line_info *info)
 {
-	return gpiod_line_drive(line) == GPIOD_LINE_DRIVE_OPEN_DRAIN;
+	return gpiod_line_get_drive(info) == GPIOD_LINE_DRIVE_OPEN_DRAIN;
 }
 
-static bool line_drive_is_open_source(struct gpiod_line *line)
+static bool line_drive_is_open_source(struct gpiod_line_info *info)
 {
-	return gpiod_line_drive(line) == GPIOD_LINE_DRIVE_OPEN_SOURCE;
+	return gpiod_line_get_drive(info) == GPIOD_LINE_DRIVE_OPEN_SOURCE;
 }
 
 static const struct flag flags[] = {
@@ -124,8 +124,8 @@ static PRINTF(3, 4) void prinfo(bool *of,
 static void list_lines(struct gpiod_chip *chip)
 {
 	bool flag_printed, of, active_low;
+	struct gpiod_line_info *info;
 	const char *name, *consumer;
-	struct gpiod_line *line;
 	unsigned int i, offset;
 	int direction;
 
@@ -133,14 +133,14 @@ static void list_lines(struct gpiod_chip *chip)
 	       gpiod_chip_get_name(chip), gpiod_chip_get_num_lines(chip));
 
 	for (offset = 0; offset < gpiod_chip_get_num_lines(chip); offset++) {
-		line = gpiod_chip_get_line(chip, offset);
-		if (!line)
+		info = gpiod_chip_get_line_info(chip, offset);
+		if (!info)
 			die_perror("unable to retrieve the line object from chip");
 
-		name = gpiod_line_name(line);
-		consumer = gpiod_line_consumer(line);
-		direction = gpiod_line_direction(line);
-		active_low = gpiod_line_is_active_low(line);
+		name = gpiod_line_get_name(info);
+		consumer = gpiod_line_get_consumer(info);
+		direction = gpiod_line_get_direction(info);
+		active_low = gpiod_line_is_active_low(info);
 
 		of = false;
 
@@ -152,7 +152,7 @@ static void list_lines(struct gpiod_chip *chip)
 		     : prinfo(&of, 12, "unnamed");
 		printf(" ");
 
-		if (!gpiod_line_is_used(line))
+		if (!gpiod_line_is_used(info))
 			prinfo(&of, 12, "unused");
 		else
 			consumer ? prinfo(&of, 12, "\"%s\"", consumer)
@@ -167,7 +167,7 @@ static void list_lines(struct gpiod_chip *chip)
 
 		flag_printed = false;
 		for (i = 0; i < ARRAY_SIZE(flags); i++) {
-			if (flags[i].is_set(line)) {
+			if (flags[i].is_set(info)) {
 				if (flag_printed)
 					printf(" ");
 				else
@@ -180,6 +180,8 @@ static void list_lines(struct gpiod_chip *chip)
 			printf("]");
 
 		printf("\n");
+
+		gpiod_line_info_unref(info);
 	}
 }
 
-- 
2.30.1

