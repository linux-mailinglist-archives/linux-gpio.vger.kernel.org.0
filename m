Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1363539B621
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Jun 2021 11:41:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229964AbhFDJnH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 4 Jun 2021 05:43:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229962AbhFDJnH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Jun 2021 05:43:07 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81A77C06174A
        for <linux-gpio@vger.kernel.org>; Fri,  4 Jun 2021 02:41:05 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id a11so6748355wrt.13
        for <linux-gpio@vger.kernel.org>; Fri, 04 Jun 2021 02:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4miMf6LAVTuBIJUm3eqPqmwgj71vaCWP5BmaXvgMRbs=;
        b=P4t4XL2gcYr1MpD2V0wOjhUc+eUrORxETbdkGtExHvumgczAFPOpFsJYuFfzLH8k1S
         TPxVwSRLvZUOhq5UAQ7nSBepdKcW9Gmk906hqHRwh91NxbuAP6s9Qt419wISortL8qU0
         0rQbsbNPUTFYCCVpPVWnAOtciRwkIlWlqHq3Z2GctIgAx/ne/xTy5jvyU9ZY2hxgD6YU
         balFR02UaQoji+JFGZ6ywGMVtYHl/eSB3leXAoxe6lkkjsIxrjILs9c/UDkkBKK43B+A
         xG3Ss9/9IPRuEPxXCb+Ak4uDuuEAc/lzMCiBsaiFApDfRf1+LWIGFqINclBINi71h6J8
         6rjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4miMf6LAVTuBIJUm3eqPqmwgj71vaCWP5BmaXvgMRbs=;
        b=TvwitT3DcljK7IIxfz7b76SUFS7bcwpuuJ3SiuB2jmELn9DtyQaCS7I0Q6BbQHM6Kd
         cjocxdikU4JiWnt3x5rplXwlTZeNuO6EEvHPb09Mfxjx8rk8qphbBeGPrd1uaER+XqHG
         SpXUs3NnX1BO1f+2jAYs/DCOUIHQlxlc3gIuFK7dbFMFHzNsKwNo3zNbzziAR0bCtYGj
         yf6modkZvFoxHchR1oNYo2aSvlGjTTlzt/5uaVblZBl0tdL/0bT6rwvSipzTumuG8UUd
         QHzcWs+kV1Cgejik7599MwHInx7f5nWIQUVeBL+xayhbamF+Srqq0WXu5zhFevDSfdg0
         krXQ==
X-Gm-Message-State: AOAM530Wvbl4PPwwJr5mwAFwkkZfQOjdvQ6zXohXDvRoCvpknkJaWv69
        clae/uAeikGWRy6863mphi6cjw==
X-Google-Smtp-Source: ABdhPJz5vpEHNK8q2e3lC99TMLscBIwFMCHDEDL3zBluP2wm/lwbeynKS4Ygx6oSXHl67gckELCd+A==
X-Received: by 2002:a5d:48ce:: with SMTP id p14mr2984657wrs.170.1622799662485;
        Fri, 04 Jun 2021 02:41:02 -0700 (PDT)
Received: from debian-brgl.home (lfbn-nic-1-149-6.w2-15.abo.wanadoo.fr. [2.15.231.6])
        by smtp.gmail.com with ESMTPSA id z3sm6469860wrl.13.2021.06.04.02.41.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 02:41:02 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [libgpiod][PATCH v3] core: implement v2.0 API
Date:   Fri,  4 Jun 2021 11:41:00 +0200
Message-Id: <20210604094100.30075-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This is the bulk of changes for the core C library.

The documentation has been extended to document the lifetime management
of objects explictly.

The concept of attributes has been removed - instead the translation from
configuration options to kernel request happens at the time of the line
request call and can only fail at this stage - the config mutators no
longer return any value.

If the caller has passed a config that is too complicated, the request
function will set errno to E2BIG which stands for: "Argument list too
long". If the caller has passed an invalid value to any of the line config
mutators, the error will be returned at the time of making the request.

The direction and edge options have been split from the former
request_type.

The objects are no longer reference counted and no longer can be the
responsibility for their lifetime shared.

There are many other minor tweaks everywhere.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
Hi Kent,

this is another iteration of the new API. This time there are no big
changes, mostly just documentation and naming-convention tweaks.

I will push it out to a semi-official next/libgpiod-v2.0 branch and any
follow-up changes will be squashed into the v2.0 API there.

 include/gpiod.h            | 1279 +++++++++++++++++++-----------------
 lib/Makefile.am            |   13 +-
 lib/chip.c                 |  216 ++++++
 lib/core.c                 | 1240 ----------------------------------
 lib/edge-event.c           |  184 ++++++
 lib/helpers.c              |  302 ---------
 lib/info-event.c           |   83 +++
 lib/internal.c             |   58 ++
 lib/internal.h             |   28 +
 lib/line-config.c          |  674 +++++++++++++++++++
 lib/line-info.c            |  164 +++++
 lib/line-request.c         |  192 ++++++
 lib/misc.c                 |   63 ++
 lib/request-config.c       |   78 +++
 tools/gpio-tools-test.bats |   12 +-
 tools/gpiodetect.c         |   13 +-
 tools/gpiofind.c           |    3 +-
 tools/gpioget.c            |   66 +-
 tools/gpioinfo.c           |   60 +-
 tools/gpiomon.c            |  133 ++--
 tools/gpioset.c            |   75 ++-
 tools/tools-common.c       |    8 +-
 tools/tools-common.h       |    2 +-
 23 files changed, 2640 insertions(+), 2306 deletions(-)
 create mode 100644 lib/chip.c
 delete mode 100644 lib/core.c
 create mode 100644 lib/edge-event.c
 delete mode 100644 lib/helpers.c
 create mode 100644 lib/info-event.c
 create mode 100644 lib/internal.c
 create mode 100644 lib/line-config.c
 create mode 100644 lib/line-info.c
 create mode 100644 lib/line-request.c
 create mode 100644 lib/request-config.c

diff --git a/include/gpiod.h b/include/gpiod.h
index a4ce01f..f4055c4 100644
--- a/include/gpiod.h
+++ b/include/gpiod.h
@@ -1,12 +1,12 @@
 /* SPDX-License-Identifier: LGPL-2.1-or-later */
 /* SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com> */
+/* SPDX-FileCopyrightText: 2021 Bartosz Golaszewski <brgl@bgdev.pl> */
 
 #ifndef __LIBGPIOD_GPIOD_H__
 #define __LIBGPIOD_GPIOD_H__
 
 #include <stdbool.h>
-#include <stdlib.h>
-#include <time.h>
+#include <stdint.h>
 
 #ifdef __cplusplus
 extern "C" {
@@ -25,220 +25,159 @@ extern "C" {
  * <p>The API is logically split into several parts such as: GPIO chip & line
  * operators, GPIO events handling etc.
  *
- * <p>General note on error handling: all routines exported by libgpiod  set
- * errno to one of the error values defined in errno.h upon failure. The way
- * of notifying the caller that an error occurred varies between functions,
- * but in general a function that returns an int, returns -1 on error, while
- * a function returning a pointer bails out on error condition by returning
- * a NULL pointer.
+ * <p>General note on error handling: all routines exported by libgpiod that
+ * can fail, set errno to one of the error values defined in errno.h upon
+ * failure. The way of notifying the caller that an error occurred varies
+ * between functions, but in general a function that returns an int, returns -1
+ * on error, while a function returning a pointer indicates an error condition
+ * by returning a NULL pointer. It's not practical to list all possible error
+ * codes for every function as they propagate errors from the underlying libc
+ * functions.
+ *
+ * <p>In general libgpiod functions are not NULL-aware and it's expected that
+ * users pass valid pointers to objects as arguments. Exceptions to this rule
+ * are documented.
+ *
+ * <p>When a function returns a pointer to an opaque, libgpiod-specific object,
+ * the caller is tasked with its lifetime management except where explicitly
+ * documented. Returned const char * pointers must not be freed by the caller
+ * as they are managed by the containing objects.
  */
 
 struct gpiod_chip;
-struct gpiod_line;
-struct gpiod_line_bulk;
+struct gpiod_line_info;
+struct gpiod_line_config;
+struct gpiod_request_config;
+struct gpiod_line_request;
+struct gpiod_info_event;
+struct gpiod_edge_event;
+struct gpiod_edge_event_buffer;
 
 /**
- * @defgroup common Common helper macros
+ * @defgroup chips GPIO chips
  * @{
  *
- * Commonly used utility macros.
- */
-
-/**
- * @brief Shift 1 by given offset.
- * @param nr Bit position.
- * @return 1 shifted by nr.
- */
-#define GPIOD_BIT(nr)		(1UL << (nr))
-
-/**
- * @}
- *
- * @defgroup chips GPIO chip operations
- * @{
+ * Functions and data structures for GPIO chip operations.
  *
- * Functions and data structures dealing with GPIO chips.
- */
-
-/**
- * @brief Check if the file pointed to by path is a GPIO chip character device.
- * @param path Path to check.
- * @return True if the file exists and is a GPIO chip character device or a
- *         symbolic link to it.
+ * A GPIO chip object is associated with an open file descriptor to the GPIO
+ * character device. It exposes basic information about the chip and allows
+ * callers to retrieve information about each line, watch lines for state
+ * changes and make line requests.
  */
-bool gpiod_is_gpiochip_device(const char *path);
 
 /**
- * @brief Open a gpiochip by path.
+ * @brief Open a GPIO chip by path.
  * @param path Path to the gpiochip device file.
- * @return GPIO chip handle or NULL if an error occurred.
+ * @return GPIO chip request or NULL if an error occurred.
  */
 struct gpiod_chip *gpiod_chip_open(const char *path);
 
 /**
- * @brief Increase the refcount on this GPIO object.
- * @param chip The GPIO chip object.
- * @return Passed reference to the GPIO chip.
+ * @brief Close a GPIO chip and release all associated resources.
+ * @param chip Chip to close.
  */
-struct gpiod_chip *gpiod_chip_ref(struct gpiod_chip *chip);
-
-/**
- * @brief Decrease the refcount on this GPIO object. If the refcount reaches 0,
- *        close the chip device and free all associated resources.
- * @param chip The GPIO chip object.
- */
-void gpiod_chip_unref(struct gpiod_chip *chip);
+void gpiod_chip_close(struct gpiod_chip *chip);
 
 /**
  * @brief Get the GPIO chip name as represented in the kernel.
- * @param chip The GPIO chip object.
+ * @param chip GPIO chip object.
  * @return Pointer to a human-readable string containing the chip name.
  */
 const char *gpiod_chip_get_name(struct gpiod_chip *chip);
 
 /**
  * @brief Get the GPIO chip label as represented in the kernel.
- * @param chip The GPIO chip object.
+ * @param chip GPIO chip object.
  * @return Pointer to a human-readable string containing the chip label.
  */
 const char *gpiod_chip_get_label(struct gpiod_chip *chip);
 
 /**
  * @brief Get the number of GPIO lines exposed by this chip.
- * @param chip The GPIO chip object.
+ * @param chip GPIO chip object.
  * @return Number of GPIO lines.
  */
 unsigned int gpiod_chip_get_num_lines(struct gpiod_chip *chip);
 
 /**
- * @brief Get the handle to the GPIO line at given offset.
- * @param chip The GPIO chip object.
+ * @brief Get the current snapshot of information about the line at given
+ *        offset.
+ * @param chip GPIO chip object.
  * @param offset The offset of the GPIO line.
- * @return Pointer to the GPIO line handle or NULL if an error occured.
- */
-struct gpiod_line *
-gpiod_chip_get_line(struct gpiod_chip *chip, unsigned int offset);
-
-/**
- * @brief Retrieve a set of lines and store them in a line bulk object.
- * @param chip The GPIO chip object.
- * @param offsets Array of offsets of lines to retrieve.
- * @param num_offsets Number of lines to retrieve.
- * @return New line bulk object or NULL on error.
- */
-struct gpiod_line_bulk *
-gpiod_chip_get_lines(struct gpiod_chip *chip, unsigned int *offsets,
-		     unsigned int num_offsets);
-
-/**
- * @brief Retrieve all lines exposed by a chip and store them in a bulk object.
- * @param chip The GPIO chip object.
- * @return New line bulk object or NULL on error.
- */
-struct gpiod_line_bulk *
-gpiod_chip_get_all_lines(struct gpiod_chip *chip);
-
-/**
- * @brief Map a GPIO line's name to its offset within the chip.
- * @param chip The GPIO chip object.
- * @param name Name of the GPIO line to map.
- * @return Offset of the line within the chip or -1 if a line with given name
- *         is not exposed by the chip.
- */
-int gpiod_chip_find_line(struct gpiod_chip *chip, const char *name);
-
-/**
- * @}
- *
- * @defgroup lines GPIO line operations
- * @{
- *
- * Functions and data structures dealing with GPIO lines.
- *
- * @defgroup line_bulk Operating on multiple lines
- * @{
- *
- * Convenience data structures and helper functions for storing and operating
- * on multiple lines at once.
+ * @return New GPIO line info object or NULL if an error occurred. The returned
+ *         object must be freed by the caller using ::gpiod_line_info_free.
  */
+struct gpiod_line_info *gpiod_chip_get_line_info(struct gpiod_chip *chip,
+						 unsigned int offset);
 
 /**
- * @brief Allocate and initialize a new line bulk object.
- * @param max_lines Maximum number of lines this object can hold.
- * @return New line bulk object or NULL on error.
- */
-struct gpiod_line_bulk *gpiod_line_bulk_new(unsigned int max_lines);
-
-/**
- * @brief Reset a bulk object. Remove all lines and set size to 0.
- * @param bulk Bulk object to reset.
- */
-void gpiod_line_bulk_reset(struct gpiod_line_bulk *bulk);
-
-/**
- * @brief Release all resources allocated for this bulk object.
- * @param bulk Bulk object to free.
+ * @brief Get the current snapshot of information about the line at given
+ *        offset and start watching it for future changes.
+ * @param chip GPIO chip object.
+ * @param offset The offset of the GPIO line.
+ * @return New GPIO line info object or NULL if an error occurred. The returned
+ *         object must be freed by the caller using ::gpiod_line_info_free.
  */
-void gpiod_line_bulk_free(struct gpiod_line_bulk *bulk);
+struct gpiod_line_info *gpiod_chip_watch_line_info(struct gpiod_chip *chip,
+						   unsigned int offset);
 
 /**
- * @brief Add a single line to a GPIO bulk object.
- * @param bulk Line bulk object.
- * @param line Line to add.
- * @return 0 on success, -1 on error.
- * @note The line is added at the next free bulk index.
- *
- * The function can fail if this bulk already holds its maximum amount of
- * lines or if the added line is associated with a different chip than all
- * the other lines already held by this object.
+ * @brief Stop watching the line at given offset for status changes.
+ * @param chip GPIO chip object.
+ * @param offset The offset of the GPIO line.
+ * @return 0 on success, -1 on failure.
  */
-int gpiod_line_bulk_add_line(struct gpiod_line_bulk *bulk,
-			     struct gpiod_line *line);
+int gpiod_chip_unwatch_line_info(struct gpiod_chip *chip, unsigned int offset);
 
 /**
- * @brief Retrieve the line handle from a line bulk object at given index.
- * @param bulk Line bulk object.
- * @param index Index of the line to retrieve.
- * @return Line handle at given index or NULL if index is greater or equal to
- *         the number of lines this bulk can hold.
+ * @brief Get the file descriptor associated with this chip.
+ * @param chip GPIO chip object.
+ * @return File descriptor number. This function never fails. The returned file
+ *         descriptor must not be closed by the caller.
  */
-struct gpiod_line *
-gpiod_line_bulk_get_line(struct gpiod_line_bulk *bulk, unsigned int index);
+int gpiod_chip_get_fd(struct gpiod_chip *chip);
 
 /**
- * @brief Retrieve the number of GPIO lines held by this line bulk object.
- * @param bulk Line bulk object.
- * @return Number of lines held by this line bulk.
+ * @brief Wait for line status events on any of the lines associated with
+ *        this chip.
+ * @param chip GPIO chip object.
+ * @param timeout Wait time limit in nanoseconds.
+ * @return 0 if wait timed out, -1 if an error occurred, 1 if an event is
+ *         pending.
  */
-unsigned int gpiod_line_bulk_num_lines(struct gpiod_line_bulk *bulk);
+int gpiod_chip_info_event_wait(struct gpiod_chip *chip, uint64_t timeout);
 
 /**
- * @brief Values returned by the callback passed to
- *        ::gpiod_line_bulk_foreach_line.
+ * @brief Read a single line status change event from this chip.
+ * @param chip GPIO chip object.
+ * @return Newly read watch event object or NULL on error. The event must be
+ *         freed by the caller using ::gpiod_info_event_free.
+ * @note If no events are pending, this function will block.
  */
-enum {
-	/**< Continue the loop. */
-	GPIOD_LINE_BULK_CB_NEXT = 0,
-	/**< Stop the loop. */
-	GPIOD_LINE_BULK_CB_STOP,
-};
+struct gpiod_info_event *gpiod_chip_info_event_read(struct gpiod_chip *chip);
 
 /**
- * @brief Signature of the callback passed to ::gpiod_line_bulk_foreach_line.
- *
- * Takes the current line and additional user data as arguments.
+ * @brief Map a GPIO line's name to its offset within the chip.
+ * @param chip GPIO chip object.
+ * @param name Name of the GPIO line to map.
+ * @return Offset of the line within the chip or -1 on error.
+ * @note If a line with given name is not exposed by the chip, the function
+ *       sets errno to ENOENT.
  */
-typedef int (*gpiod_line_bulk_foreach_cb)(struct gpiod_line *, void *);
+int gpiod_chip_find_line(struct gpiod_chip *chip, const char *name);
 
 /**
- * @brief Iterate over all lines held by this bulk object.
- * @param bulk Bulk object to iterate over.
- * @param func Callback to be called for each line.
- * @param data User data pointer that is passed to the callback.
+ * @brief Request a set of lines for exclusive usage.
+ * @param chip GPIO chip object.
+ * @param req_cfg Request config object.
+ * @param line_cfg Line config object.
+ * @return New line request object or NULL if an error occurred. The request
+ *         must be released by the caller using ::gpiod_line_request_release.
  */
-void gpiod_line_bulk_foreach_line(struct gpiod_line_bulk *bulk,
-				  gpiod_line_bulk_foreach_cb func,
-				  void *data);
+struct gpiod_line_request *
+gpiod_chip_request_lines(struct gpiod_chip *chip,
+			 struct gpiod_request_config *req_cfg,
+			 struct gpiod_line_config *line_cfg);
 
 /**
  * @}
@@ -248,6 +187,9 @@ void gpiod_line_bulk_foreach_line(struct gpiod_line_bulk *bulk,
  *
  * Definitions and functions for retrieving kernel information about both
  * requested and free lines.
+ *
+ * Line info object contains an immutable snapshot of the line's state at the
+ * time when it was created.
  */
 
 /**
@@ -287,562 +229,692 @@ enum {
 };
 
 /**
- * @brief Read the GPIO line offset.
- * @param line GPIO line object.
- * @return Line offset.
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
+/**
+ * @brief Free a line info object and release all associated resources.
+ * @param info GPIO line info object to free.
+ */
+void gpiod_line_info_free(struct gpiod_line_info *info);
+
+/**
+ * @brief Get the hardware offset of the line.
+ * @param info GPIO line info object.
+ * @return Offset of the line within the parent chip.
  */
-unsigned int gpiod_line_offset(struct gpiod_line *line);
+unsigned int gpiod_line_info_get_offset(struct gpiod_line_info *info);
 
 /**
  * @brief Read the GPIO line name.
- * @param line GPIO line object.
+ * @param info GPIO line info object.
  * @return Name of the GPIO line as it is represented in the kernel. This
  *         routine returns a pointer to a null-terminated string or NULL if
  *         the line is unnamed.
  */
-const char *gpiod_line_name(struct gpiod_line *line);
+const char *gpiod_line_info_get_name(struct gpiod_line_info *info);
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
+bool gpiod_line_info_is_used(struct gpiod_line_info *info);
 
 /**
  * @brief Read the GPIO line consumer name.
- * @param line GPIO line object.
+ * @param info GPIO line info object.
  * @return Name of the GPIO consumer name as it is represented in the
  *         kernel. This routine returns a pointer to a null-terminated string
  *         or NULL if the line is not used.
  */
-const char *gpiod_line_consumer(struct gpiod_line *line);
+const char *gpiod_line_info_get_consumer(struct gpiod_line_info *info);
 
 /**
  * @brief Read the GPIO line direction setting.
- * @param line GPIO line object.
+ * @param info GPIO line info object.
  * @return Returns GPIOD_LINE_DIRECTION_INPUT or GPIOD_LINE_DIRECTION_OUTPUT.
  */
-int gpiod_line_direction(struct gpiod_line *line);
+int gpiod_line_info_get_direction(struct gpiod_line_info *info);
 
 /**
  * @brief Check if the signal of this line is inverted.
- * @param line GPIO line object.
+ * @param info GPIO line object.
  * @return True if this line is "active-low", false otherwise.
  */
-bool gpiod_line_is_active_low(struct gpiod_line *line);
+bool gpiod_line_info_is_active_low(struct gpiod_line_info *info);
 
 /**
  * @brief Read the GPIO line bias setting.
- * @param line GPIO line object.
+ * @param info GPIO line object.
  * @return Returns GPIOD_LINE_BIAS_PULL_UP, GPIOD_LINE_BIAS_PULL_DOWN,
  *         GPIOD_LINE_BIAS_DISABLE or GPIOD_LINE_BIAS_UNKNOWN.
  */
-int gpiod_line_bias(struct gpiod_line *line);
+int gpiod_line_info_get_bias(struct gpiod_line_info *info);
 
 /**
- * @brief Check if the line is currently in use.
- * @param line GPIO line object.
- * @return True if the line is in use, false otherwise.
+ * @brief Read the GPIO line drive setting.
+ * @param info GPIO line info object.
+ * @return Returns GPIOD_LINE_DRIVE_PUSH_PULL, GPIOD_LINE_DRIVE_OPEN_DRAIN or
+ *         GPIOD_LINE_DRIVE_OPEN_SOURCE.
+ */
+int gpiod_line_info_get_drive(struct gpiod_line_info *info);
+
+/**
+ * @brief Read the current edge detection setting of this line.
+ * @param info GPIO line info object.
+ * @return Returns GPIOD_LINE_EDGE_NONE, GPIOD_LINE_EDGE_RISING,
+ *         GPIOD_LINE_EDGE_FALLING or GPIOD_LINE_EDGE_BOTH.
+ */
+int gpiod_line_info_get_edge_detection(struct gpiod_line_info *info);
+
+/**
+ * @brief Check if this line is debounced (either by hardware or by the kernel
+ *        software debouncer).
+ * @param info GPIO line info object.
+ * @return True if the line is debounced, false otherwise.
+ */
+bool gpiod_line_info_is_debounced(struct gpiod_line_info *info);
+
+/**
+ * @brief Read the current debounce period in microseconds.
+ * @param info GPIO line info object.
+ * @return Current debounce period in microseconds, 0 if the line is not
+ *         debounced.
+ */
+unsigned long
+gpiod_line_info_get_debounce_period(struct gpiod_line_info *info);
+
+/**
+ * @}
  *
- * The user space can't know exactly why a line is busy. It may have been
- * requested by another process or hogged by the kernel. It only matters that
- * the line is used and we can't request it.
+ * @defgroup line_watch Line status watch events
+ * @{
+ *
+ * Accessors for the info event objects allowing to monitor changes in GPIO
+ * line state.
+ *
+ * Callers can be notified about changes in line's state using the interfaces
+ * exposed by GPIO chips. Each info event contains information about the event
+ * itself (timestamp, type) as well as a snapshot of line's state in the form
+ * of a line-info object.
  */
-bool gpiod_line_is_used(struct gpiod_line *line);
 
 /**
- * @brief Read the GPIO line drive setting.
- * @param line GPIO line object.
- * @return Returns GPIOD_LINE_DRIVE_PUSH_PULL, GPIOD_LINE_DRIVE_OPEN_DRAIN or
- *         GPIOD_LINE_DRIVE_OPEN_SOURCE.
+ * @brief Possible line status change event types.
+ */
+enum {
+	GPIOD_INFO_EVENT_LINE_REQUESTED = 1,
+	/**< Line has been requested. */
+	GPIOD_INFO_EVENT_LINE_RELEASED,
+	/**< Previously requested line has been released. */
+	GPIOD_INFO_EVENT_LINE_CONFIG_CHANGED,
+	/**< Line configuration has changed. */
+};
+
+/**
+ * @brief Free the info event object and release all associated resources.
+ * @param event Info event to free.
+ */
+void gpiod_info_event_free(struct gpiod_info_event *event);
+
+/**
+ * @brief Get the event type of this status change event.
+ * @param event Line status watch event.
+ * @return One of ::GPIOD_INFO_EVENT_LINE_REQUESTED,
+ *         ::GPIOD_INFO_EVENT_LINE_RELEASED or
+ *         ::GPIOD_INFO_EVENT_LINE_CONFIG_CHANGED.
+ */
+int gpiod_info_event_get_event_type(struct gpiod_info_event *event);
+
+/**
+ * @brief Get the timestamp of the event.
+ * @param event Line status watch event.
+ * @return Timestamp in nanoseconds.
  */
-int gpiod_line_drive(struct gpiod_line *line);
+uint64_t gpiod_info_event_get_timestamp(struct gpiod_info_event *event);
 
 /**
- * @brief Get the handle to the GPIO chip controlling this line.
- * @param line The GPIO line object.
- * @return Pointer to the GPIO chip handle controlling this line.
+ * @brief Get the pointer to the line-info object associated with this event.
+ * @param event Line info event object.
+ * @return Returns a pointer to the line-info object associated with this event
+ *         whose lifetime is tied to the event object. It must not be freed by
+ *         the caller.
  */
-struct gpiod_chip *gpiod_line_get_chip(struct gpiod_line *line);
+struct gpiod_line_info *
+gpiod_info_event_peek_line_info(struct gpiod_info_event *event);
+
+/**
+ * @brief Get a copy of the line-info object associated with this event.
+ * @param event Line info event object.
+ * @return Returns a copy of the line-info object associated with this event or
+ *         NULL on error. The lifetime of the returned object must be managed
+ *         by the caller and the line-info object must be freed using
+ *         ::gpiod_line_info_free.
+ */
+struct gpiod_line_info *
+gpiod_info_event_get_line_info(struct gpiod_info_event *event);
 
 /**
  * @}
  *
- * @defgroup line_request Line requests
+ * @defgroup line_config Line configuration objects
  * @{
  *
- * Interface for requesting GPIO lines from userspace for both values and
- * events.
+ * Functions for manipulating line configuration objects.
+ *
+ * The line-config object stores the configuration for lines that can be used
+ * in two cases: when making a line request and when reconfiguring a set of
+ * already requested lines. The mutators for the line request don't return
+ * errors. If the configuration is invalid - the set of options is too complex
+ * to be translated into kernel uAPI structures or invalid values have been
+ * passed to any of the functions - the error will be returned at the time of
+ * the request or reconfiguration.
  */
 
 /**
- * @brief Available types of requests.
+ * @brief Available direction settings.
  */
 enum {
-	GPIOD_LINE_REQUEST_DIRECTION_AS_IS = 1,
+	GPIOD_LINE_CONFIG_DIRECTION_AS_IS = 1,
 	/**< Request the line(s), but don't change current direction. */
-	GPIOD_LINE_REQUEST_DIRECTION_INPUT,
+	GPIOD_LINE_CONFIG_DIRECTION_INPUT,
 	/**< Request the line(s) for reading the GPIO line state. */
-	GPIOD_LINE_REQUEST_DIRECTION_OUTPUT,
+	GPIOD_LINE_CONFIG_DIRECTION_OUTPUT,
 	/**< Request the line(s) for setting the GPIO line state. */
-	GPIOD_LINE_REQUEST_EVENT_FALLING_EDGE,
+};
+
+/**
+ * @brief Available drive settings for line requests.
+ */
+enum {
+	GPIOD_LINE_CONFIG_DRIVE_PUSH_PULL = 1,
+	/**< Drive setting should be set to push-pull (the default). */
+	GPIOD_LINE_CONFIG_DRIVE_OPEN_DRAIN,
+	/**< Line output should be set to open-drain. */
+	GPIOD_LINE_CONFIG_DRIVE_OPEN_SOURCE,
+	/**< Line output should be set to open-source. */
+};
+
+/**
+ * @brief Available internal bias settings for line requests.
+ */
+enum {
+	GPIOD_LINE_CONFIG_BIAS_DISABLED = 1,
+	/**< The internal bias should be disabled (the default). */
+	GPIOD_LINE_CONFIG_BIAS_PULL_UP,
+	/**< The internal pull-up bias is enabled. */
+	GPIOD_LINE_CONFIG_BIAS_PULL_DOWN,
+	/**< The internal pull-down bias is enabled. */
+};
+
+/**
+ * @brief Available edge event detection settings.
+ */
+enum {
+	GPIOD_LINE_CONFIG_EDGE_FALLING = 1,
 	/**< Only watch falling edge events. */
-	GPIOD_LINE_REQUEST_EVENT_RISING_EDGE,
+	GPIOD_LINE_CONFIG_EDGE_RISING,
 	/**< Only watch rising edge events. */
-	GPIOD_LINE_REQUEST_EVENT_BOTH_EDGES,
+	GPIOD_LINE_CONFIG_EDGE_BOTH,
 	/**< Monitor both types of events. */
 };
 
 /**
- * @brief Miscellaneous GPIO request flags.
+ * @brief Available clock types used for event timestamps.
  */
 enum {
-	GPIOD_LINE_REQUEST_FLAG_OPEN_DRAIN	= GPIOD_BIT(0),
-	/**< The line is an open-drain port. */
-	GPIOD_LINE_REQUEST_FLAG_OPEN_SOURCE	= GPIOD_BIT(1),
-	/**< The line is an open-source port. */
-	GPIOD_LINE_REQUEST_FLAG_ACTIVE_LOW	= GPIOD_BIT(2),
-	/**< The active state of the line is low (high is the default). */
-	GPIOD_LINE_REQUEST_FLAG_BIAS_DISABLED	= GPIOD_BIT(3),
-	/**< The line has neither either pull-up nor pull-down resistor. */
-	GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_DOWN	= GPIOD_BIT(4),
-	/**< The line has pull-down resistor enabled. */
-	GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_UP	= GPIOD_BIT(5),
-	/**< The line has pull-up resistor enabled. */
+	GPIOD_LINE_CONFIG_CLOCK_MONOTONIC = 1,
+	/**< Use the monotonic clock. */
+	GPIOD_LINE_CONFIG_CLOCK_REALTIME,
+	/**< Use the realtime clock. */
 };
 
 /**
- * @brief Structure holding configuration of a line request.
+ * @brief Create a new line config object.
+ * @return New line config object or NULL on error.
  */
-struct gpiod_line_request_config {
-	const char *consumer;
-	/**< Name of the consumer. */
-	int request_type;
-	/**< Request type. */
-	int flags;
-	/**< Other configuration flags. */
-};
+struct gpiod_line_config *gpiod_line_config_new(void);
 
 /**
- * @brief Reserve a single line.
- * @param line GPIO line object.
- * @param config Request options.
- * @param default_val Initial line value - only relevant if we're setting
- *                    the direction to output.
- * @return 0 if the line was properly reserved. In case of an error this
- *         routine returns -1 and sets the last error number.
- *
- * If this routine succeeds, the caller takes ownership of the GPIO line until
- * it's released.
+ * @brief Free the line config object and release all associated resources.
+ * @param config Line config object to free.
  */
-int gpiod_line_request(struct gpiod_line *line,
-		       const struct gpiod_line_request_config *config,
-		       int default_val);
+void gpiod_line_config_free(struct gpiod_line_config *config);
 
 /**
- * @brief Reserve a single line, set the direction to input.
- * @param line GPIO line object.
- * @param consumer Name of the consumer.
- * @return 0 if the line was properly reserved, -1 on failure.
+ * @brief Set the direction of all lines.
+ * @param config Line config object.
+ * @param direction New direction.
  */
-int gpiod_line_request_input(struct gpiod_line *line, const char *consumer);
+void gpiod_line_config_set_direction(struct gpiod_line_config *config,
+				     int direction);
 
 /**
- * @brief Reserve a single line, set the direction to output.
- * @param line GPIO line object.
- * @param consumer Name of the consumer.
- * @param default_val Initial line value.
- * @return 0 if the line was properly reserved, -1 on failure.
+ * @brief Set the direction for a single line at given offset.
+ * @param config Line config object.
+ * @param direction New direction.
+ * @param offset Offset of the line for which to set the direction.
  */
-int gpiod_line_request_output(struct gpiod_line *line,
-			      const char *consumer, int default_val);
+void gpiod_line_config_set_direction_offset(struct gpiod_line_config *config,
+					    int direction, unsigned int offset);
 
 /**
- * @brief Request rising edge event notifications on a single line.
- * @param line GPIO line object.
- * @param consumer Name of the consumer.
- * @return 0 if the operation succeeds, -1 on failure.
+ * @brief Set the direction for a subset of lines.
+ * @param config Line config object.
+ * @param direction New direction.
+ * @param num_offsets Number of offsets in the array.
+ * @param offsets Array of line offsets for which to set the direction.
  */
-int gpiod_line_request_rising_edge_events(struct gpiod_line *line,
-					  const char *consumer);
+void gpiod_line_config_set_direction_subset(struct gpiod_line_config *config,
+					    int direction,
+					    unsigned int num_offsets,
+					    const unsigned int *offsets);
 
 /**
- * @brief Request falling edge event notifications on a single line.
- * @param line GPIO line object.
- * @param consumer Name of the consumer.
- * @return 0 if the operation succeeds, -1 on failure.
+ * @brief Set the edge event detection for all lines.
+ * @param config Line config object.
+ * @param edge Type of edge events to detect.
  */
-int gpiod_line_request_falling_edge_events(struct gpiod_line *line,
-					   const char *consumer);
+void gpiod_line_config_set_edge_detection(struct gpiod_line_config *config,
+					  int edge);
 
 /**
- * @brief Request all event type notifications on a single line.
- * @param line GPIO line object.
- * @param consumer Name of the consumer.
- * @return 0 if the operation succeeds, -1 on failure.
+ * @brief Set the edge event detection for a single line at given offset.
+ * @param config Line config object.
+ * @param edge Type of edge events to detect.
+ * @param offset Offset of the line for which to set the edge detection.
  */
-int gpiod_line_request_both_edges_events(struct gpiod_line *line,
-					 const char *consumer);
+void
+gpiod_line_config_set_edge_detection_offset(struct gpiod_line_config *config,
+					    int edge, unsigned int offset);
 
 /**
- * @brief Reserve a single line, set the direction to input.
- * @param line GPIO line object.
- * @param consumer Name of the consumer.
- * @param flags Additional request flags.
- * @return 0 if the line was properly reserved, -1 on failure.
+ * @brief Set the edge event detection for a subset of lines.
+ * @param config Line config object.
+ * @param edge Type of edge events to detect.
+ * @param num_offsets Number of offsets in the array.
+ * @param offsets Array of line offsets for which to set the edge detection.
  */
-int gpiod_line_request_input_flags(struct gpiod_line *line,
-				   const char *consumer, int flags);
+void
+gpiod_line_config_set_edge_detection_subset(struct gpiod_line_config *config,
+					    int edge, unsigned int num_offsets,
+					    const unsigned int *offsets);
 
 /**
- * @brief Reserve a single line, set the direction to output.
- * @param line GPIO line object.
- * @param consumer Name of the consumer.
- * @param flags Additional request flags.
- * @param default_val Initial line value.
- * @return 0 if the line was properly reserved, -1 on failure.
+ * @brief Set the drive of all lines.
+ * @param config Line config object.
+ * @param drive New drive.
  */
-int gpiod_line_request_output_flags(struct gpiod_line *line,
-				    const char *consumer, int flags,
-				    int default_val);
+void gpiod_line_config_set_drive(struct gpiod_line_config *config, int drive);
 
 /**
- * @brief Request rising edge event notifications on a single line.
- * @param line GPIO line object.
- * @param consumer Name of the consumer.
- * @param flags Additional request flags.
- * @return 0 if the operation succeeds, -1 on failure.
+ * @brief Set the drive for a single line at given offset.
+ * @param config Line config object.
+ * @param drive New drive.
+ * @param offset Offset of the line for which to set the drive.
  */
-int gpiod_line_request_rising_edge_events_flags(struct gpiod_line *line,
-						const char *consumer,
-						int flags);
+void gpiod_line_config_set_drive_offset(struct gpiod_line_config *config,
+					int drive, unsigned int offset);
 
 /**
- * @brief Request falling edge event notifications on a single line.
- * @param line GPIO line object.
- * @param consumer Name of the consumer.
- * @param flags Additional request flags.
- * @return 0 if the operation succeeds, -1 on failure.
+ * @brief Set the drive for a subset of lines.
+ * @param config Line config object.
+ * @param drive New drive.
+ * @param num_offsets Number of offsets in the array.
+ * @param offsets Array of line offsets for which to set the drive.
  */
-int gpiod_line_request_falling_edge_events_flags(struct gpiod_line *line,
-						 const char *consumer,
-						 int flags);
+void gpiod_line_config_set_drive_subset(struct gpiod_line_config *config,
+					int drive, unsigned int num_offsets,
+					const unsigned int *offsets);
 
 /**
- * @brief Request all event type notifications on a single line.
- * @param line GPIO line object.
- * @param consumer Name of the consumer.
- * @param flags Additional request flags.
- * @return 0 if the operation succeeds, -1 on failure.
+ * @brief Set the bias of all lines.
+ * @param config Line config object.
+ * @param bias New bias.
  */
-int gpiod_line_request_both_edges_events_flags(struct gpiod_line *line,
-					       const char *consumer,
-					       int flags);
+void gpiod_line_config_set_bias(struct gpiod_line_config *config, int bias);
 
 /**
- * @brief Reserve a set of GPIO lines.
- * @param bulk Set of GPIO lines to reserve.
- * @param config Request options.
- * @param default_vals Initial line values - only relevant if we're setting
- *                     the direction to output.
- * @return 0 if all lines were properly requested. In case of an error
- *         this routine returns -1 and sets the last error number.
- *
- * If this routine succeeds, the caller takes ownership of the GPIO lines
- * until they're released. All the requested lines must be provided by the
- * same gpiochip.
+ * @brief Set the bias for a single line at given offset.
+ * @param config Line config object.
+ * @param bias New bias.
+ * @param offset Offset of the line for which to set the bias.
  */
-int gpiod_line_request_bulk(struct gpiod_line_bulk *bulk,
-			    const struct gpiod_line_request_config *config,
-			    const int *default_vals);
+void gpiod_line_config_set_bias_offset(struct gpiod_line_config *config,
+				       int bias, unsigned int offset);
 
 /**
- * @brief Reserve a set of GPIO lines, set the direction to input.
- * @param bulk Set of GPIO lines to reserve.
- * @param consumer Name of the consumer.
- * @return 0 if the lines were properly reserved, -1 on failure.
+ * @brief Set the bias for a subset of lines.
+ * @param config Line config object.
+ * @param bias New bias.
+ * @param num_offsets Number of offsets in the array.
+ * @param offsets Array of line offsets for which to set the bias.
  */
-int gpiod_line_request_bulk_input(struct gpiod_line_bulk *bulk,
-				  const char *consumer);
+void gpiod_line_config_set_bias_subset(struct gpiod_line_config *config,
+				       int bias, unsigned int num_offsets,
+				       const unsigned int *offsets);
 
 /**
- * @brief Reserve a set of GPIO lines, set the direction to output.
- * @param bulk Set of GPIO lines to reserve.
- * @param consumer Name of the consumer.
- * @param default_vals Initial line values.
- * @return 0 if the lines were properly reserved, -1 on failure.
+ * @brief Set all lines as active-low.
+ * @param config Line config object.
  */
-int gpiod_line_request_bulk_output(struct gpiod_line_bulk *bulk,
-				   const char *consumer,
-				   const int *default_vals);
+void gpiod_line_config_set_active_low(struct gpiod_line_config *config);
 
 /**
- * @brief Request rising edge event notifications on a set of lines.
- * @param bulk Set of GPIO lines to request.
- * @param consumer Name of the consumer.
- * @return 0 if the operation succeeds, -1 on failure.
+ * @brief Set a single line as active-low.
+ * @param config Line config object.
+ * @param offset Offset of the line for which to set the active setting.
  */
-int gpiod_line_request_bulk_rising_edge_events(struct gpiod_line_bulk *bulk,
-					       const char *consumer);
+void gpiod_line_config_set_active_low_offset(struct gpiod_line_config *config,
+					     unsigned int offset);
 
 /**
- * @brief Request falling edge event notifications on a set of lines.
- * @param bulk Set of GPIO lines to request.
- * @param consumer Name of the consumer.
- * @return 0 if the operation succeeds, -1 on failure.
+ * @brief Set a subset of lines as active-low.
+ * @param config Line config object.
+ * @param num_offsets Number of offsets in the array.
+ * @param offsets Array of line offsets for which to set the active setting.
  */
-int gpiod_line_request_bulk_falling_edge_events(struct gpiod_line_bulk *bulk,
-						const char *consumer);
+void gpiod_line_config_set_active_low_subset(struct gpiod_line_config *config,
+					     unsigned int num_offsets,
+					     const unsigned int *offsets);
 
 /**
- * @brief Request all event type notifications on a set of lines.
- * @param bulk Set of GPIO lines to request.
- * @param consumer Name of the consumer.
- * @return 0 if the operation succeeds, -1 on failure.
+ * @brief Set all lines as active-high.
+ * @param config Line config object.
  */
-int gpiod_line_request_bulk_both_edges_events(struct gpiod_line_bulk *bulk,
-					      const char *consumer);
+void gpiod_line_config_set_active_high(struct gpiod_line_config *config);
 
 /**
- * @brief Reserve a set of GPIO lines, set the direction to input.
- * @param bulk Set of GPIO lines to reserve.
- * @param consumer Name of the consumer.
- * @param flags Additional request flags.
- * @return 0 if the lines were properly reserved, -1 on failure.
+ * @brief Set a single line as active-high.
+ * @param config Line config object.
+ * @param offset Offset of the line for which to set the active setting.
  */
-int gpiod_line_request_bulk_input_flags(struct gpiod_line_bulk *bulk,
-					const char *consumer, int flags);
+void gpiod_line_config_set_active_high_offset(struct gpiod_line_config *config,
+					      unsigned int offset);
 
 /**
- * @brief Reserve a set of GPIO lines, set the direction to output.
- * @param bulk Set of GPIO lines to reserve.
- * @param consumer Name of the consumer.
- * @param flags Additional request flags.
- * @param default_vals Initial line values.
- * @return 0 if the lines were properly reserved, -1 on failure.
+ * @brief Set a subset of lines as active-high.
+ * @param config Line config object.
+ * @param num_offsets Number of offsets in the array.
+ * @param offsets Array of line offsets for which to set the active setting.
  */
-int gpiod_line_request_bulk_output_flags(struct gpiod_line_bulk *bulk,
-					 const char *consumer, int flags,
-					 const int *default_vals);
+void gpiod_line_config_set_active_high_subset(struct gpiod_line_config *config,
+					      unsigned int num_offsets,
+					      const unsigned int *offsets);
 
 /**
- * @brief Request rising edge event notifications on a set of lines.
- * @param bulk Set of GPIO lines to request.
- * @param consumer Name of the consumer.
- * @param flags Additional request flags.
- * @return 0 if the operation succeeds, -1 on failure.
+ * @brief Set the debounce period for all lines.
+ * @param config Line config object.
+ * @param period New debounce period. Disables debouncing if 0.
  */
-int gpiod_line_request_bulk_rising_edge_events_flags(
-					struct gpiod_line_bulk *bulk,
-					const char *consumer, int flags);
+void gpiod_line_config_set_debounce_period(struct gpiod_line_config *config,
+					   unsigned int period);
 
 /**
- * @brief Request falling edge event notifications on a set of lines.
- * @param bulk Set of GPIO lines to request.
- * @param consumer Name of the consumer.
- * @param flags Additional request flags.
- * @return 0 if the operation succeeds, -1 on failure.
+ * @brief Set the debounce period for a single line at given offset.
+ * @param config Line config object.
+ * @param period New debounce period. Disables debouncing if 0.
+ * @param offset Offset of the line for which to set the debounce period.
  */
-int gpiod_line_request_bulk_falling_edge_events_flags(
-					struct gpiod_line_bulk *bulk,
-					const char *consumer, int flags);
+void
+gpiod_line_config_set_debounce_period_offset(struct gpiod_line_config *config,
+					     unsigned int period,
+					     unsigned int offset);
 
 /**
- * @brief Request all event type notifications on a set of lines.
- * @param bulk Set of GPIO lines to request.
- * @param consumer Name of the consumer.
- * @param flags Additional request flags.
- * @return 0 if the operation succeeds, -1 on failure.
+ * @brief Set the debounce period for a subset of lines.
+ * @param config Line config object.
+ * @param period New debounce period. Disables debouncing if 0.
+ * @param num_offsets Number of offsets in the array.
+ * @param offsets Array of line offsets for which to set the debounce period.
  */
-int gpiod_line_request_bulk_both_edges_events_flags(
-					struct gpiod_line_bulk *bulk,
-					const char *consumer, int flags);
+void
+gpiod_line_config_set_debounce_period_subset(struct gpiod_line_config *config,
+					     unsigned int period,
+					     unsigned int num_offsets,
+					     const unsigned int *offsets);
 
 /**
- * @brief Release a previously reserved line.
- * @param line GPIO line object.
+ * @brief Set the event timestamp clock for all lines.
+ * @param config Line config object.
+ * @param clock New clock to use.
  */
-void gpiod_line_release(struct gpiod_line *line);
+void gpiod_line_config_set_event_clock(struct gpiod_line_config *config,
+				       int clock);
 
 /**
- * @brief Release a set of previously reserved lines.
- * @param bulk Set of GPIO lines to release.
- *
- * If the lines were not previously requested together, the behavior is
- * undefined.
+ * @brief Set the event clock for a single line at given offset.
+ * @param config Line config object.
+ * @param clock New event clock to use.
+ * @param offset Offset of the line for which to set the event clock type.
+ */
+void gpiod_line_config_set_event_clock_offset(struct gpiod_line_config *config,
+					      int clock, unsigned int offset);
+
+/**
+ * @brief Set the event clock for a subset of lines.
+ * @param config Line config object.
+ * @param clock New event clock to use.
+ * @param num_offsets Number of offsets in the array.
+ * @param offsets Array of line offsets for which to set the event clock type.
  */
-void gpiod_line_release_bulk(struct gpiod_line_bulk *bulk);
+void gpiod_line_config_set_event_clock_subset(struct gpiod_line_config *config,
+					      int clock,
+					      unsigned int num_offsets,
+					      const unsigned int *offsets);
+
+/**
+ * @brief Set the output value for a single offset.
+ * @param config Line config object.
+ * @param offset Offset of the line.
+ * @param value Output value to set.
+ */
+void gpiod_line_config_set_output_value(struct gpiod_line_config *config,
+					unsigned int offset, int value);
+
+/**
+ * @brief Set the output values for a set of offsets.
+ * @param config Line config object.
+ * @param num_offsets Number of offsets for which to set values.
+ * @param offsets Array of line offsets to set values for.
+ * @param values Array of output values associated with the offsets passed in
+ *               the previous argument.
+ */
+void gpiod_line_config_set_output_values(struct gpiod_line_config *config,
+					 unsigned int num_offsets,
+					 const unsigned int *offsets,
+					 const int *values);
 
 /**
  * @}
  *
- * @defgroup line_value Reading & setting line values
+ * @defgroup request_config Request configuration objects
  * @{
  *
- * Functions allowing to read and set GPIO line values for single lines and
- * in bulk.
+ * Functions for manipulating request configuration objects.
+ *
+ * Request config object is used to pass a set of options to the kernel at the
+ * time of the line request. Similarly to the line-config - the mutators don't
+ * return error values. If the values are invalid, in general they are silently
+ * adjusted to acceptable ranges.
  */
 
 /**
- * @brief Read current value of a single GPIO line.
- * @param line GPIO line object.
- * @return 0 or 1 if the operation succeeds. On error this routine returns -1
- *         and sets the last error number.
+ * @brief Create a new request config object.
+ * @return New request config object or NULL on error.
  */
-int gpiod_line_get_value(struct gpiod_line *line);
+struct gpiod_request_config *gpiod_request_config_new(void);
 
 /**
- * @brief Read current values of a set of GPIO lines.
- * @param bulk Set of GPIO lines to reserve.
- * @param values An array big enough to hold line_bulk->num_lines values.
- * @return 0 is the operation succeeds. In case of an error this routine
- *         returns -1 and sets the last error number.
- *
- * If succeeds, this routine fills the values array with a set of values in
- * the same order, the lines are added to line_bulk. If the lines were not
- * previously requested together, the behavior is undefined.
+ * @brief Free the request config object and release all associated resources.
+ * @param config Line config object.
  */
-int gpiod_line_get_value_bulk(struct gpiod_line_bulk *bulk, int *values);
+void gpiod_request_config_free(struct gpiod_request_config *config);
 
 /**
- * @brief Set the value of a single GPIO line.
- * @param line GPIO line object.
- * @param value New value.
- * @return 0 is the operation succeeds. In case of an error this routine
- *         returns -1 and sets the last error number.
+ * @brief Set the consumer string.
+ * @param config Request config object.
+ * @param consumer Consumer name.
+ * @note If the consumer string is too long, it will be truncated to the max
+ *       accepted length.
  */
-int gpiod_line_set_value(struct gpiod_line *line, int value);
+void gpiod_request_config_set_consumer(struct gpiod_request_config *config,
+				       const char *consumer);
 
 /**
- * @brief Set the values of a set of GPIO lines.
- * @param bulk Set of GPIO lines to reserve.
- * @param values An array holding line_bulk->num_lines new values for lines.
- *               A NULL pointer is interpreted as a logical low for all lines.
- * @return 0 is the operation succeeds. In case of an error this routine
- *         returns -1 and sets the last error number.
- *
- * If the lines were not previously requested together, the behavior is
- * undefined.
+ * @brief Set line offsets for this request.
+ * @param config Request config object.
+ * @param num_offsets Number of offsets.
+ * @param offsets Array of line offsets.
+ * @note If too many offsets were specified, the offsets above the limit
+ *       accepted by the kernel (64 lines) are silently dropped.
  */
-int gpiod_line_set_value_bulk(struct gpiod_line_bulk *bulk, const int *values);
+void gpiod_request_config_set_offsets(struct gpiod_request_config *config,
+				      unsigned int num_offsets,
+				      unsigned int *offsets);
+
+/**
+ * @brief Set the size of the kernel event buffer.
+ * @param config Request config object.
+ * @param event_buffer_size New event buffer size.
+ * @note The kernel may adjust the value if it's too high. If set to 0, the
+ *       default value will be used.
+ */
+void
+gpiod_request_config_set_event_buffer_size(struct gpiod_request_config *config,
+					   unsigned int event_buffer_size);
 
 /**
  * @}
  *
- * @defgroup line_config Setting line configuration
+ * @defgroup request_request Line request operations
  * @{
  *
- * Functions allowing modification of config options of GPIO lines requested
- * from user-space.
- */
-
-/**
- * @brief Update the configuration of a single GPIO line.
- * @param line GPIO line object.
- * @param direction Updated direction which may be one of
- *                  GPIOD_LINE_REQUEST_DIRECTION_AS_IS,
- *                  GPIOD_LINE_REQUEST_DIRECTION_INPUT, or
- *                  GPIOD_LINE_REQUEST_DIRECTION_OUTPUT.
- * @param flags Replacement flags.
- * @param value The new output value for the line when direction is
- *              GPIOD_LINE_REQUEST_DIRECTION_OUTPUT.
- * @return 0 is the operation succeeds. In case of an error this routine
- *         returns -1 and sets the last error number.
- */
-int gpiod_line_set_config(struct gpiod_line *line, int direction,
-			  int flags, int value);
-
-/**
- * @brief Update the configuration of a set of GPIO lines.
- * @param bulk Set of GPIO lines.
- * @param direction Updated direction which may be one of
- *                  GPIOD_LINE_REQUEST_DIRECTION_AS_IS,
- *                  GPIOD_LINE_REQUEST_DIRECTION_INPUT, or
- *                  GPIOD_LINE_REQUEST_DIRECTION_OUTPUT.
- * @param flags Replacement flags.
- * @param values An array holding line_bulk->num_lines new logical values
- *               for lines when direction is
- *               GPIOD_LINE_REQUEST_DIRECTION_OUTPUT.
- *               A NULL pointer is interpreted as a logical low for all lines.
- * @return 0 is the operation succeeds. In case of an error this routine
- *         returns -1 and sets the last error number.
- *
- * If the lines were not previously requested together, the behavior is
- * undefined.
+ * Functions allowing interaction with a set of requested lines.
  */
-int gpiod_line_set_config_bulk(struct gpiod_line_bulk *bulk,
-			       int direction, int flags, const int *values);
 
+/**
+ * @brief Release the requested lines and free all associated resources.
+ * @param request Line request object to release.
+ */
+void gpiod_line_request_release(struct gpiod_line_request *request);
 
 /**
- * @brief Update the configuration flags of a single GPIO line.
- * @param line GPIO line object.
- * @param flags Replacement flags.
- * @return 0 is the operation succeeds. In case of an error this routine
- *         returns -1 and sets the last error number.
+ * @brief Read the value of a single line associated with this request.
+ * @param request Line request object.
+ * @param offset Offset of the line of which the value should be read.
+ * @return Returns 1 or 0 on success and -1 on error.
  */
-int gpiod_line_set_flags(struct gpiod_line *line, int flags);
+int gpiod_line_request_get_value(struct gpiod_line_request *request,
+				 unsigned int offset);
 
 /**
- * @brief Update the configuration flags of a set of GPIO lines.
- * @param bulk Set of GPIO lines.
- * @param flags Replacement flags.
- * @return 0 is the operation succeeds. In case of an error this routine
- *         returns -1 and sets the last error number.
- *
- * If the lines were not previously requested together, the behavior is
- * undefined.
+ * @brief Read values of lines associated with this request.
+ * @param request GPIO line request.
+ * @param num_lines Number of lines for which to read values.
+ * @param offsets Array of offsets corresponding with the lines associated with
+ *                this request for which to read values.
+ * @param values Array in which the values will be stored.
+ * @return 0 on success, -1 on failure.
  */
-int gpiod_line_set_flags_bulk(struct gpiod_line_bulk *bulk, int flags);
+int gpiod_line_request_get_values(struct gpiod_line_request *request,
+				  unsigned num_lines,
+				  const unsigned int *offsets, int *values);
 
 /**
- * @brief Set the direction of a single GPIO line to input.
- * @param line GPIO line object.
- * @return 0 is the operation succeeds. In case of an error this routine
- *         returns -1 and sets the last error number.
+ * @brief Set the value of a single line associated with this request.
+ * @param request Line request object.
+ * @param offset Offset of the line of which the value should be set.
+ * @param value Value to set.
  */
-int gpiod_line_set_direction_input(struct gpiod_line *line);
+int gpiod_line_request_set_value(struct gpiod_line_request *request,
+				 unsigned int offset, int value);
 
 /**
- * @brief Set the direction of a set of GPIO lines to input.
- * @param bulk Set of GPIO lines.
- * @return 0 is the operation succeeds. In case of an error this routine
- *         returns -1 and sets the last error number.
- *
- * If the lines were not previously requested together, the behavior is
- * undefined.
+ * @brief Set values of lines associated with this line request.
+ * @param request GPIO line request.
+ * @param num_lines Number of lines for which to set values.
+ * @param offsets Array of offsets corresponding with the lines associated with
+ *                this request for which to set values.
+ * @param values Array of values to set. The members of this array must
+ *               correspond with the offsets in the previous argument.
+ * @return 0 on success, -1 on failure.
  */
-int
-gpiod_line_set_direction_input_bulk(struct gpiod_line_bulk *bulk);
+int gpiod_line_request_set_values(struct gpiod_line_request *request,
+				  unsigned int num_lines,
+				  const unsigned int *offsets,
+				  const int *values);
 
 /**
- * @brief Set the direction of a single GPIO line to output.
- * @param line GPIO line object.
- * @param value The logical value output on the line.
- * @return 0 is the operation succeeds. In case of an error this routine
- *         returns -1 and sets the last error number.
+ * @brief Update the configuration of lines associated with this line request.
+ * @param request GPIO line request.
+ * @param config New line config to apply.
+ * @return 0 on success, -1 on failure.
  */
-int gpiod_line_set_direction_output(struct gpiod_line *line, int value);
+int gpiod_line_request_reconfigure_lines(struct gpiod_line_request *request,
+					 struct gpiod_line_config *config);
 
 /**
- * @brief Set the direction of a set of GPIO lines to output.
- * @param bulk Set of GPIO lines.
- * @param values An array holding line_bulk->num_lines new logical values
- *               for lines.  A NULL pointer is interpreted as a logical low
- *               for all lines.
- * @return 0 is the operation succeeds. In case of an error this routine
- *         returns -1 and sets the last error number.
- *
- * If the lines were not previously requested together, the behavior is
- * undefined.
+ * @brief Get the file descriptor associated with this line request.
+ * @param request GPIO line request.
+ * @return Number of the file descriptor associated with this request. This
+ *         function never fails.
  */
-int gpiod_line_set_direction_output_bulk(struct gpiod_line_bulk *bulk,
-					 const int *values);
+int gpiod_line_request_get_fd(struct gpiod_line_request *request);
+
+/**
+ * @brief Wait for edge events on any of the lines associated with this request.
+ * @param request GPIO line request.
+ * @param timeout Wait time limit in nanoseconds.
+ * @return 0 if wait timed out, -1 if an error occurred, 1 if an event is
+ *         pending.
+ */
+int gpiod_line_request_edge_event_wait(struct gpiod_line_request *request,
+				       uint64_t timeout);
+
+/**
+ * @brief Read a number of edge events from a line request.
+ * @param request GPIO line request.
+ * @param buffer Line event buffer.
+ * @param max_events Maximum number of events to read.
+ * @return On success returns the number of events read from the file
+ *         descriptor, on failure return -1.
+ * @note This function will block if no event was queued for this line.
+ */
+int gpiod_line_request_edge_event_read(struct gpiod_line_request *request,
+				       struct gpiod_edge_event_buffer *buffer,
+				       unsigned int max_events);
 
 /**
  * @}
  *
- * @defgroup line_event Line events handling
+ * @defgroup edge_event Line edge events handling
  * @{
  *
- * Structures and functions allowing to poll lines for events and read them,
- * both for individual lines as well as in bulk. Also contains functions for
- * retrieving the associated file descriptors and operate on them for easy
- * integration with standard unix interfaces.
+ * Functions and data types for handling edge events.
+ *
+ * An edge event object contains information about a single line event. It
+ * contains the event type, timestamp and the offset of the line on which the
+ * event occurred as well as two seqential numbers (global for all lines
+ * associated with the parent chip and local for this line only).
+ *
+ * For performance and to limit the number of memory allocations when a lot of
+ * events are being read, edge events are stored in an edge-event buffer object.
  */
 
 /**
@@ -856,102 +928,117 @@ enum {
 };
 
 /**
- * @brief Structure holding event info.
+ * @brief Free the edge event object.
+ * @param event Edge event object to free.
+ * @note Must not be used with events stored in the buffer and retrieved using
+ *       ::gpiod_edge_event_buffer_peek_event.
  */
-struct gpiod_line_event {
-	struct timespec ts;
-	/**< Best estimate of time of event occurrence. */
-	int event_type;
-	/**< Type of the event that occurred. */
-	int offset;
-	/**< Offset of line on which the event occurred. */
-};
+void gpiod_edge_event_free(struct gpiod_edge_event *event);
 
 /**
- * @brief Wait for an event on a single line.
- * @param line GPIO line object.
- * @param timeout Wait time limit.
- * @return 0 if wait timed out, -1 if an error occurred, 1 if an event
- *         occurred.
+ * @brief Get the event type.
+ * @param event GPIO edge event.
+ * @return The event type (::GPIOD_LINE_EVENT_RISING_EDGE or
+ *         ::GPIOD_LINE_EVENT_FALLING_EDGE).
  */
-int gpiod_line_event_wait(struct gpiod_line *line,
-			  const struct timespec *timeout);
+int gpiod_edge_event_get_event_type(struct gpiod_edge_event *event);
 
 /**
- * @brief Wait for events on a set of lines.
- * @param bulk Set of GPIO lines to monitor.
- * @param timeout Wait time limit.
- * @param event_bulk Bulk object in which to store the line handles on which
- *                   events occurred. Can be NULL.
- * @return 0 if wait timed out, -1 if an error occurred, 1 if at least one
- *         event occurred.
+ * @brief Get the timestamp of the event.
+ * @param event GPIO edge event.
+ * @return Timestamp in nanoseconds.
  */
-int gpiod_line_event_wait_bulk(struct gpiod_line_bulk *bulk,
-			       const struct timespec *timeout,
-			       struct gpiod_line_bulk *event_bulk);
+uint64_t gpiod_edge_event_get_timestamp(struct gpiod_edge_event *event);
 
 /**
- * @brief Read next pending event from the GPIO line.
- * @param line GPIO line object.
- * @param event Buffer to which the event data will be copied.
- * @return 0 if the event was read correctly, -1 on error.
- * @note This function will block if no event was queued for this line.
+ * @brief Get the hardware offset of the line on which the event was triggered.
+ * @param event GPIO edge event.
+ * @return Line offset.
  */
-int gpiod_line_event_read(struct gpiod_line *line,
-			  struct gpiod_line_event *event);
+unsigned int gpiod_edge_event_get_line_offset(struct gpiod_edge_event *event);
 
 /**
- * @brief Read up to a certain number of events from the GPIO line.
- * @param line GPIO line object.
- * @param events Buffer to which the event data will be copied. Must hold at
- *               least the amount of events specified in num_events.
- * @param num_events Specifies how many events can be stored in the buffer.
- * @return On success returns the number of events stored in the buffer, on
- *         failure -1 is returned.
+ * @brief Get the global sequence number of this event.
+ * @param event GPIO edge event.
+ * @return Sequence number of the event relative to all lines in the associated
+ *         line request.
  */
-int gpiod_line_event_read_multiple(struct gpiod_line *line,
-				   struct gpiod_line_event *events,
-				   unsigned int num_events);
+unsigned int gpiod_edge_event_get_global_seqno(struct gpiod_edge_event *event);
 
 /**
- * @brief Get the event file descriptor.
- * @param line GPIO line object.
- * @return Number of the event file descriptor or -1 if the user tries to
- *         retrieve the descriptor from a line that wasn't configured for
- *         event monitoring.
- *
- * Users may want to poll the event file descriptor on their own. This routine
- * allows to access it.
+ * @brief Get the event sequence number specific to this line.
+ * @param event GPIO edge event.
+ * @return Sequence number of the event relative to this line within the
+ *         lifetime of the associated line request.
+ */
+unsigned int gpiod_edge_event_get_line_seqno(struct gpiod_edge_event *event);
+
+/**
+ * @brief Create a new edge event buffer.
+ * @param capacity Number of events this buffer can store (min = 1, max = 1024).
+ * @return New edge event buffer or NULL on error.
+ * @note If capacity equals 0, it will be set to a default value of 64. If
+ *       capacity is larger than 1024, it will be limited to 1024.
  */
-int gpiod_line_event_get_fd(struct gpiod_line *line);
+struct gpiod_edge_event_buffer *
+gpiod_edge_event_buffer_new(unsigned int capacity);
 
 /**
- * @brief Read the last GPIO event directly from a file descriptor.
+ * @brief Free the edge event buffer and release all associated resources.
+ * @param buffer Edge event buffer to free.
+ */
+void gpiod_edge_event_buffer_free(struct gpiod_edge_event_buffer *buffer);
+
+/**
+ * @brief Get a pointer to an event stored in the buffer.
+ * @param buffer Line event buffer.
+ * @param index Index of the event in the buffer.
+ * @return Pointer to an event stored in the buffer. The lifetime of this
+ *         event is tied to the buffer object. Users must not call event
+ *         reference counting functions on pointers retrieved using this
+ *         function.
+ */
+struct gpiod_edge_event *
+gpiod_edge_event_buffer_peek_event(struct gpiod_edge_event_buffer *buffer,
+				   unsigned long index);
+
+/**
+ * @brief Get a copy of an edge event.
+ * @param buffer Line event buffer.
+ * @param index Index of the event in the buffer.
+ * @return Returns a copy of the edge event stored in this buffer. The event's
+ *         lifetime is managed by the caller. The event must be released using
+ *         ::gpiod_edge_event_free.
+ */
+struct gpiod_edge_event *
+gpiod_edge_event_buffer_get_event(struct gpiod_edge_event_buffer *buffer,
+				  unsigned long index);
+
+/**
+ * @brief Get the number of events this buffers stores.
+ * @param buffer Line event buffer.
+ * @return Number of events stored in this buffer.
+ */
+unsigned int
+gpiod_edge_event_buffer_num_events(struct gpiod_edge_event_buffer *buffer);
+
+/**
+ * @brief Read GPIO edge events directly from a file descriptor.
  * @param fd File descriptor.
- * @param event Buffer in which the event data will be stored.
- * @return 0 if the event was read correctly, -1 on error.
+ * @param buffer Line event buffer.
+ * @param max_events Maximum number of events to read.
+ * @return On success returns the number of events read from the file
+ *         descriptor, on failure return -1.
  *
  * Users who directly poll the file descriptor for incoming events can also
  * directly read the event data from it using this routine. This function
  * translates the kernel representation of the event to the libgpiod format.
  */
-int gpiod_line_event_read_fd(int fd, struct gpiod_line_event *event);
+int gpiod_edge_event_buffer_read_fd(int fd,
+				    struct gpiod_edge_event_buffer *buffer,
+				    unsigned int max_events);
 
 /**
- * @brief Read up to a certain number of events directly from a file descriptor.
- * @param fd File descriptor.
- * @param events Buffer to which the event data will be copied. Must hold at
- *               least the amount of events specified in num_events.
- * @param num_events Specifies how many events can be stored in the buffer.
- * @return On success returns the number of events stored in the buffer, on
- *         failure -1 is returned.
- */
-int gpiod_line_event_read_fd_multiple(int fd, struct gpiod_line_event *events,
-				      unsigned int num_events);
-
-/**
- * @}
- *
  * @}
  *
  * @defgroup misc Stuff that didn't fit anywhere else
@@ -960,6 +1047,14 @@ int gpiod_line_event_read_fd_multiple(int fd, struct gpiod_line_event *events,
  * Various libgpiod-related functions.
  */
 
+/**
+ * @brief Check if the file pointed to by path is a GPIO chip character device.
+ * @param path Path to check.
+ * @return True if the file exists and is a GPIO chip character device or a
+ *         symbolic link to it.
+ */
+bool gpiod_is_gpiochip_device(const char *path);
+
 /**
  * @brief Get the API version of the library as a human-readable string.
  * @return Human-readable string containing the library version.
diff --git a/lib/Makefile.am b/lib/Makefile.am
index 8441584..5423f72 100644
--- a/lib/Makefile.am
+++ b/lib/Makefile.am
@@ -2,7 +2,18 @@
 # SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 lib_LTLIBRARIES = libgpiod.la
-libgpiod_la_SOURCES = core.c helpers.c internal.h misc.c uapi/gpio.h
+libgpiod_la_SOURCES =	chip.c \
+			edge-event.c \
+			info-event.c \
+			internal.h \
+			internal.c \
+			line-config.c \
+			line-info.c \
+			line-request.c \
+			misc.c \
+			request-config.c \
+			uapi/gpio.h
+
 libgpiod_la_CFLAGS = -Wall -Wextra -g -std=gnu89
 libgpiod_la_CFLAGS += -fvisibility=hidden -I$(top_srcdir)/include/
 libgpiod_la_CFLAGS += -include $(top_builddir)/config.h
diff --git a/lib/chip.c b/lib/chip.c
new file mode 100644
index 0000000..9333818
--- /dev/null
+++ b/lib/chip.c
@@ -0,0 +1,216 @@
+// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-FileCopyrightText: 2021 Bartosz Golaszewski <brgl@bgdev.pl>
+
+/* Line attribute data structure and functions. */
+
+#include <errno.h>
+#include <fcntl.h>
+#include <gpiod.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/ioctl.h>
+#include <unistd.h>
+
+#include "internal.h"
+
+struct gpiod_chip {
+	int fd;
+	unsigned int num_lines;
+	char name[32];
+	char label[32];
+};
+
+GPIOD_API struct gpiod_chip *gpiod_chip_open(const char *path)
+{
+	struct gpiochip_info info;
+	struct gpiod_chip *chip;
+	int rv, fd;
+
+	if (!gpiod_is_gpiochip_device(path))
+		return NULL;
+
+	fd = open(path, O_RDWR | O_CLOEXEC);
+	if (fd < 0)
+		return NULL;
+
+	chip = malloc(sizeof(*chip));
+	if (!chip)
+		goto err_close_fd;
+
+	memset(chip, 0, sizeof(*chip));
+	memset(&info, 0, sizeof(info));
+
+	rv = ioctl(fd, GPIO_GET_CHIPINFO_IOCTL, &info);
+	if (rv < 0)
+		goto err_free_chip;
+
+	chip->fd = fd;
+	chip->num_lines = info.lines;
+
+	/*
+	 * GPIO device must have a name - don't bother checking this field. In
+	 * the worst case (would have to be a weird kernel bug) it'll be empty.
+	 */
+	strncpy(chip->name, info.name, sizeof(chip->name));
+
+	/*
+	 * The kernel sets the label of a GPIO device to "unknown" if it
+	 * hasn't been defined in DT, board file etc. On the off-chance that
+	 * we got an empty string, do the same.
+	 */
+	if (info.label[0] == '\0')
+		strncpy(chip->label, "unknown", sizeof(chip->label));
+	else
+		strncpy(chip->label, info.label, sizeof(chip->label));
+
+	return chip;
+
+err_free_chip:
+	free(chip);
+err_close_fd:
+	close(fd);
+
+	return NULL;
+}
+
+GPIOD_API void gpiod_chip_close(struct gpiod_chip *chip)
+{
+	close(chip->fd);
+	free(chip);
+}
+
+GPIOD_API const char *gpiod_chip_get_name(struct gpiod_chip *chip)
+{
+	return chip->name;
+}
+
+GPIOD_API const char *gpiod_chip_get_label(struct gpiod_chip *chip)
+{
+	return chip->label;
+}
+
+GPIOD_API unsigned int gpiod_chip_get_num_lines(struct gpiod_chip *chip)
+{
+	return chip->num_lines;
+}
+
+static int chip_read_line_info(int fd, unsigned int offset,
+			       struct gpio_v2_line_info *infobuf, bool watch)
+{
+	int ret, cmd;
+
+	memset(infobuf, 0, sizeof(*infobuf));
+	infobuf->offset = offset;
+
+	cmd = watch ? GPIO_V2_GET_LINEINFO_WATCH_IOCTL :
+		      GPIO_V2_GET_LINEINFO_IOCTL;
+
+	ret = ioctl(fd, cmd, infobuf);
+	if (ret)
+		return -1;
+
+	return 0;
+}
+
+static struct gpiod_line_info *
+chip_get_line_info(struct gpiod_chip *chip, unsigned int offset, bool watch)
+{
+	struct gpio_v2_line_info infobuf;
+	int ret;
+
+	ret = chip_read_line_info(chip->fd, offset, &infobuf, watch);
+	if (ret)
+		return NULL;
+
+	return gpiod_line_info_from_kernel(&infobuf);
+}
+
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
+GPIOD_API int gpiod_chip_info_event_wait(struct gpiod_chip *chip,
+					 uint64_t timeout)
+{
+	return gpiod_poll_fd(chip->fd, timeout);
+}
+
+GPIOD_API struct gpiod_info_event *
+gpiod_chip_info_event_read(struct gpiod_chip *chip)
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
+	return gpiod_info_event_from_kernel(&evbuf);
+}
+
+GPIOD_API int gpiod_chip_find_line(struct gpiod_chip *chip, const char *name)
+{
+	struct gpio_v2_line_info infobuf;
+	unsigned int offset;
+	int ret;
+
+	for (offset = 0; offset < chip->num_lines; offset++) {
+		ret = chip_read_line_info(chip->fd, offset, &infobuf, false);
+		if (ret)
+			return -1;
+
+		if (strcmp(name, infobuf.name) == 0)
+			return offset;
+	}
+
+	errno = ENOENT;
+	return -1;
+}
+
+GPIOD_API struct gpiod_line_request *
+gpiod_chip_request_lines(struct gpiod_chip *chip,
+			 struct gpiod_request_config *req_cfg,
+			 struct gpiod_line_config *line_cfg)
+{
+	struct gpio_v2_line_request reqbuf;
+	int ret;
+
+	memset(&reqbuf, 0, sizeof(reqbuf));
+	gpiod_request_config_to_kernel(req_cfg, &reqbuf);
+
+	ret = gpiod_line_config_to_kernel(line_cfg, &reqbuf.config,
+					  reqbuf.num_lines, reqbuf.offsets);
+	if (ret)
+		return NULL;
+
+	ret = ioctl(chip->fd, GPIO_V2_GET_LINE_IOCTL, &reqbuf);
+	if (ret < 0)
+		return NULL;
+
+	return gpiod_line_request_from_kernel(&reqbuf);
+}
diff --git a/lib/core.c b/lib/core.c
deleted file mode 100644
index 2e7ee4b..0000000
--- a/lib/core.c
+++ /dev/null
@@ -1,1240 +0,0 @@
-// SPDX-License-Identifier: LGPL-2.1-or-later
-// SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
-
-/* Low-level, core library code. */
-
-#include <errno.h>
-#include <fcntl.h>
-#include <gpiod.h>
-#include <limits.h>
-#include <poll.h>
-#include <stdint.h>
-#include <stdio.h>
-#include <string.h>
-#include <sys/ioctl.h>
-#include <sys/stat.h>
-#include <sys/sysmacros.h>
-#include <sys/types.h>
-#include <unistd.h>
-
-#include "internal.h"
-#include "uapi/gpio.h"
-
-#define LINE_REQUEST_MAX_LINES	64
-
-enum {
-	LINE_FREE = 0,
-	LINE_REQUESTED_VALUES,
-	LINE_REQUESTED_EVENTS,
-};
-
-struct line_fd_handle {
-	int fd;
-	int refcount;
-};
-
-struct gpiod_line {
-	unsigned int offset;
-
-	/* The direction of the GPIO line. */
-	int direction;
-
-	/* Is this line active-low?. */
-	bool active_low;
-
-	/* The logical value last written to the line. */
-	int output_value;
-
-	/* The GPIOLINE_FLAGs returned by GPIO_GET_LINEINFO_IOCTL. */
-	__u32 info_flags;
-
-	/* The GPIOD_LINE_REQUEST_FLAGs provided to request the line. */
-	__u32 req_flags;
-
-	/*
-	 * Indicator of LINE_FREE, LINE_REQUESTED_VALUES or
-	 * LINE_REQUESTED_EVENTS.
-	 */
-	int state;
-
-	struct gpiod_chip *chip;
-	struct line_fd_handle *fd_handle;
-
-	char name[32];
-	char consumer[32];
-};
-
-struct gpiod_chip {
-	int refcount;
-
-	struct gpiod_line **lines;
-	unsigned int num_lines;
-
-	int fd;
-
-	char name[32];
-	char label[32];
-};
-
-/*
- * The structure is defined in a way that allows internal users to allocate
- * bulk objects that hold a single line on the stack - that way we can reuse
- * a lot of code between functions that take single lines and those that take
- * bulks as arguments while not unnecessarily allocating memory dynamically.
- */
-struct gpiod_line_bulk {
-	unsigned int num_lines;
-	unsigned int max_lines;
-	struct gpiod_line *lines[1];
-};
-
-#define BULK_SINGLE_LINE_INIT(line) \
-		{ 1, 1, { (line) } }
-
-GPIOD_API struct gpiod_line_bulk *gpiod_line_bulk_new(unsigned int max_lines)
-{
-	struct gpiod_line_bulk *bulk;
-	size_t size;
-
-	if (max_lines == 0) {
-		errno = EINVAL;
-		return NULL;
-	}
-
-	size = sizeof(struct gpiod_line_bulk) +
-	       (max_lines - 1) * sizeof(struct gpiod_line *);
-
-	bulk = malloc(size);
-	if (!bulk)
-		return NULL;
-
-	bulk->max_lines = max_lines;
-	gpiod_line_bulk_reset(bulk);
-
-	return bulk;
-}
-
-GPIOD_API void gpiod_line_bulk_reset(struct gpiod_line_bulk *bulk)
-{
-	bulk->num_lines = 0;
-	memset(bulk->lines, 0, bulk->max_lines * sizeof(struct line *));
-}
-
-GPIOD_API void gpiod_line_bulk_free(struct gpiod_line_bulk *bulk)
-{
-	free(bulk);
-}
-
-GPIOD_API int gpiod_line_bulk_add_line(struct gpiod_line_bulk *bulk,
-				       struct gpiod_line *line)
-{
-	if (bulk->num_lines == bulk->max_lines) {
-		errno = EINVAL;
-		return -1;
-	}
-
-	if (bulk->num_lines != 0) {
-		if (bulk->lines[0]->chip != gpiod_line_get_chip(line)) {
-			errno = EINVAL;
-			return -1;
-		}
-	}
-
-	bulk->lines[bulk->num_lines++] = line;
-
-	return 0;
-}
-
-GPIOD_API struct gpiod_line *
-gpiod_line_bulk_get_line(struct gpiod_line_bulk *bulk, unsigned int index)
-{
-	if (index >= bulk->num_lines) {
-		errno = EINVAL;
-		return NULL;
-	}
-
-	return bulk->lines[index];
-}
-
-GPIOD_API unsigned int gpiod_line_bulk_num_lines(struct gpiod_line_bulk *bulk)
-{
-	return bulk->num_lines;
-}
-
-GPIOD_API void gpiod_line_bulk_foreach_line(struct gpiod_line_bulk *bulk,
-					    gpiod_line_bulk_foreach_cb func,
-					    void *data)
-{
-	unsigned int index;
-	int ret;
-
-	for (index = 0; index < bulk->num_lines; index++) {
-		ret = func(bulk->lines[index], data);
-		if (ret == GPIOD_LINE_BULK_CB_STOP)
-			return;
-	}
-}
-
-#define line_bulk_foreach_line(bulk, line, index)			\
-	for ((index) = 0, (line) = (bulk)->lines[0];			\
-	     (index) < (bulk)->num_lines;				\
-	     (index)++, (line) = (bulk)->lines[(index)])
-
-GPIOD_API bool gpiod_is_gpiochip_device(const char *path)
-{
-	char *realname, *sysfsp, devpath[64];
-	struct stat statbuf;
-	bool ret = false;
-	int rv;
-
-	rv = lstat(path, &statbuf);
-	if (rv)
-		goto out;
-
-	/*
-	 * Is it a symbolic link? We have to resolve it before checking
-	 * the rest.
-	 */
-	realname = S_ISLNK(statbuf.st_mode) ? realpath(path, NULL)
-					    : strdup(path);
-	if (realname == NULL)
-		goto out;
-
-	rv = stat(realname, &statbuf);
-	if (rv)
-		goto out_free_realname;
-
-	/* Is it a character device? */
-	if (!S_ISCHR(statbuf.st_mode)) {
-		/*
-		 * Passing a file descriptor not associated with a character
-		 * device to ioctl() makes it set errno to ENOTTY. Let's do
-		 * the same in order to stay compatible with the versions of
-		 * libgpiod from before the introduction of this routine.
-		 */
-		errno = ENOTTY;
-		goto out_free_realname;
-	}
-
-	/* Is the device associated with the GPIO subsystem? */
-	snprintf(devpath, sizeof(devpath), "/sys/dev/char/%u:%u/subsystem",
-		 major(statbuf.st_rdev), minor(statbuf.st_rdev));
-
-	sysfsp = realpath(devpath, NULL);
-	if (!sysfsp)
-		goto out_free_realname;
-
-	if (strcmp(sysfsp, "/sys/bus/gpio") != 0) {
-		/*
-		 * This is a character device but not the one we're after.
-		 * Before the introduction of this function, we'd fail with
-		 * ENOTTY on the first GPIO ioctl() call for this file
-		 * descriptor. Let's stay compatible here and keep returning
-		 * the same error code.
-		 */
-		errno = ENOTTY;
-		goto out_free_sysfsp;
-	}
-
-	ret = true;
-
-out_free_sysfsp:
-	free(sysfsp);
-out_free_realname:
-	free(realname);
-out:
-	return ret;
-}
-
-GPIOD_API struct gpiod_chip *gpiod_chip_open(const char *path)
-{
-	struct gpiochip_info info;
-	struct gpiod_chip *chip;
-	int rv, fd;
-
-	fd = open(path, O_RDWR | O_CLOEXEC);
-	if (fd < 0)
-		return NULL;
-
-	/*
-	 * We were able to open the file but is it really a gpiochip character
-	 * device?
-	 */
-	if (!gpiod_is_gpiochip_device(path))
-		goto err_close_fd;
-
-	chip = malloc(sizeof(*chip));
-	if (!chip)
-		goto err_close_fd;
-
-	memset(chip, 0, sizeof(*chip));
-	memset(&info, 0, sizeof(info));
-
-	rv = ioctl(fd, GPIO_GET_CHIPINFO_IOCTL, &info);
-	if (rv < 0)
-		goto err_free_chip;
-
-	chip->fd = fd;
-	chip->num_lines = info.lines;
-	chip->refcount = 1;
-
-	/*
-	 * GPIO device must have a name - don't bother checking this field. In
-	 * the worst case (would have to be a weird kernel bug) it'll be empty.
-	 */
-	strncpy(chip->name, info.name, sizeof(chip->name));
-
-	/*
-	 * The kernel sets the label of a GPIO device to "unknown" if it
-	 * hasn't been defined in DT, board file etc. On the off-chance that
-	 * we got an empty string, do the same.
-	 */
-	if (info.label[0] == '\0')
-		strncpy(chip->label, "unknown", sizeof(chip->label));
-	else
-		strncpy(chip->label, info.label, sizeof(chip->label));
-
-	return chip;
-
-err_free_chip:
-	free(chip);
-err_close_fd:
-	close(fd);
-
-	return NULL;
-}
-
-GPIOD_API struct gpiod_chip *gpiod_chip_ref(struct gpiod_chip *chip)
-{
-	chip->refcount++;
-	return chip;
-}
-
-GPIOD_API void gpiod_chip_unref(struct gpiod_chip *chip)
-{
-	struct gpiod_line *line;
-	unsigned int i;
-
-	chip->refcount--;
-	if (chip->refcount > 0)
-		return;
-
-	if (chip->lines) {
-		for (i = 0; i < chip->num_lines; i++) {
-			line = chip->lines[i];
-			if (line) {
-				gpiod_line_release(line);
-				free(line);
-			}
-		}
-
-		free(chip->lines);
-	}
-
-	close(chip->fd);
-	free(chip);
-}
-
-GPIOD_API const char *gpiod_chip_get_name(struct gpiod_chip *chip)
-{
-	return chip->name;
-}
-
-GPIOD_API const char *gpiod_chip_get_label(struct gpiod_chip *chip)
-{
-	return chip->label;
-}
-
-GPIOD_API unsigned int gpiod_chip_get_num_lines(struct gpiod_chip *chip)
-{
-	return chip->num_lines;
-}
-
-static int line_update(struct gpiod_line *line);
-
-GPIOD_API struct gpiod_line *
-gpiod_chip_get_line(struct gpiod_chip *chip, unsigned int offset)
-{
-	struct gpiod_line *line;
-	int rv;
-
-	if (offset >= chip->num_lines) {
-		errno = EINVAL;
-		return NULL;
-	}
-
-	if (!chip->lines) {
-		chip->lines = calloc(chip->num_lines,
-				     sizeof(struct gpiod_line *));
-		if (!chip->lines)
-			return NULL;
-	}
-
-	if (!chip->lines[offset]) {
-		line = malloc(sizeof(*line));
-		if (!line)
-			return NULL;
-
-		memset(line, 0, sizeof(*line));
-
-		line->offset = offset;
-		line->chip = chip;
-
-		chip->lines[offset] = line;
-	} else {
-		line = chip->lines[offset];
-	}
-
-	rv = line_update(line);
-	if (rv < 0)
-		return NULL;
-
-	return line;
-}
-
-static struct line_fd_handle *line_make_fd_handle(int fd)
-{
-	struct line_fd_handle *handle;
-
-	handle = malloc(sizeof(*handle));
-	if (!handle)
-		return NULL;
-
-	handle->fd = fd;
-	handle->refcount = 0;
-
-	return handle;
-}
-
-static void line_fd_incref(struct gpiod_line *line)
-{
-	line->fd_handle->refcount++;
-}
-
-static void line_fd_decref(struct gpiod_line *line)
-{
-	struct line_fd_handle *handle = line->fd_handle;
-
-	handle->refcount--;
-
-	if (handle->refcount == 0) {
-		close(handle->fd);
-		free(handle);
-		line->fd_handle = NULL;
-	}
-}
-
-static void line_set_fd(struct gpiod_line *line, struct line_fd_handle *handle)
-{
-	line->fd_handle = handle;
-	line_fd_incref(line);
-}
-
-static int line_get_fd(struct gpiod_line *line)
-{
-	return line->fd_handle->fd;
-}
-
-GPIOD_API struct gpiod_chip *gpiod_line_get_chip(struct gpiod_line *line)
-{
-	return line->chip;
-}
-
-GPIOD_API unsigned int gpiod_line_offset(struct gpiod_line *line)
-{
-	return line->offset;
-}
-
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
-static int line_info_v2_to_info_flags(struct gpio_v2_line_info *info)
-{
-	int iflags = 0;
-
-	if (info->flags & GPIO_V2_LINE_FLAG_USED)
-		iflags |= GPIOLINE_FLAG_KERNEL;
-
-	if (info->flags & GPIO_V2_LINE_FLAG_OPEN_DRAIN)
-		iflags |= GPIOLINE_FLAG_OPEN_DRAIN;
-	if (info->flags & GPIO_V2_LINE_FLAG_OPEN_SOURCE)
-		iflags |= GPIOLINE_FLAG_OPEN_SOURCE;
-
-	if (info->flags & GPIO_V2_LINE_FLAG_BIAS_DISABLED)
-		iflags |= GPIOLINE_FLAG_BIAS_DISABLE;
-	if (info->flags & GPIO_V2_LINE_FLAG_BIAS_PULL_UP)
-		iflags |= GPIOLINE_FLAG_BIAS_PULL_UP;
-	if (info->flags & GPIO_V2_LINE_FLAG_BIAS_PULL_DOWN)
-		iflags |= GPIOLINE_FLAG_BIAS_PULL_DOWN;
-
-	return iflags;
-}
-
-static int line_update(struct gpiod_line *line)
-{
-	struct gpio_v2_line_info info;
-	int rv;
-
-	memset(&info, 0, sizeof(info));
-	info.offset = line->offset;
-
-	rv = ioctl(line->chip->fd, GPIO_V2_GET_LINEINFO_IOCTL, &info);
-	if (rv < 0)
-		return -1;
-
-	line->direction = info.flags & GPIO_V2_LINE_FLAG_OUTPUT
-						? GPIOD_LINE_DIRECTION_OUTPUT
-						: GPIOD_LINE_DIRECTION_INPUT;
-
-	line->active_low = !!(info.flags & GPIO_V2_LINE_FLAG_ACTIVE_LOW);
-
-	line->info_flags = line_info_v2_to_info_flags(&info);
-
-	strncpy(line->name, info.name, sizeof(line->name));
-	strncpy(line->consumer, info.consumer, sizeof(line->consumer));
-
-	return 0;
-}
-
-static bool line_is_requested(struct gpiod_line *line)
-{
-	return (line->state == LINE_REQUESTED_VALUES ||
-		line->state == LINE_REQUESTED_EVENTS);
-}
-
-static bool line_bulk_all_requested(struct gpiod_line_bulk *bulk)
-{
-	struct gpiod_line *line;
-	unsigned int idx;
-
-	line_bulk_foreach_line(bulk, line, idx) {
-		if (!line_is_requested(line)) {
-			errno = EPERM;
-			return false;
-		}
-	}
-
-	return true;
-}
-
-static bool line_bulk_all_requested_values(struct gpiod_line_bulk *bulk)
-{
-	struct gpiod_line *line;
-	unsigned int idx;
-
-	line_bulk_foreach_line(bulk, line, idx) {
-		if (line->state != LINE_REQUESTED_VALUES) {
-			errno = EPERM;
-			return false;
-		}
-	}
-
-	return true;
-}
-
-static bool line_request_direction_is_valid(int direction)
-{
-	if ((direction == GPIOD_LINE_REQUEST_DIRECTION_AS_IS) ||
-	    (direction == GPIOD_LINE_REQUEST_DIRECTION_INPUT) ||
-	    (direction == GPIOD_LINE_REQUEST_DIRECTION_OUTPUT))
-		return true;
-
-	errno = EINVAL;
-	return false;
-}
-
-static void line_request_type_to_gpio_v2_line_config(int reqtype,
-		struct gpio_v2_line_config *config)
-{
-	if (reqtype == GPIOD_LINE_REQUEST_DIRECTION_AS_IS)
-		return;
-
-	if (reqtype == GPIOD_LINE_REQUEST_DIRECTION_OUTPUT) {
-		config->flags |= GPIO_V2_LINE_FLAG_OUTPUT;
-		return;
-	}
-	config->flags |= GPIO_V2_LINE_FLAG_INPUT;
-
-	if (reqtype == GPIOD_LINE_REQUEST_EVENT_RISING_EDGE)
-		config->flags |= GPIO_V2_LINE_FLAG_EDGE_RISING;
-	else if (reqtype == GPIOD_LINE_REQUEST_EVENT_FALLING_EDGE)
-		config->flags |= GPIO_V2_LINE_FLAG_EDGE_FALLING;
-	else if (reqtype == GPIOD_LINE_REQUEST_EVENT_BOTH_EDGES)
-		config->flags |= (GPIO_V2_LINE_FLAG_EDGE_RISING |
-				  GPIO_V2_LINE_FLAG_EDGE_FALLING);
-}
-
-static void line_request_flag_to_gpio_v2_line_config(int flags,
-		struct gpio_v2_line_config *config)
-{
-	if (flags & GPIOD_LINE_REQUEST_FLAG_ACTIVE_LOW)
-		config->flags |= GPIO_V2_LINE_FLAG_ACTIVE_LOW;
-
-	if (flags & GPIOD_LINE_REQUEST_FLAG_OPEN_DRAIN)
-		config->flags |= GPIO_V2_LINE_FLAG_OPEN_DRAIN;
-	else if (flags & GPIOD_LINE_REQUEST_FLAG_OPEN_SOURCE)
-		config->flags |= GPIO_V2_LINE_FLAG_OPEN_SOURCE;
-
-	if (flags & GPIOD_LINE_REQUEST_FLAG_BIAS_DISABLED)
-		config->flags |= GPIO_V2_LINE_FLAG_BIAS_DISABLED;
-	else if (flags & GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_DOWN)
-		config->flags |= GPIO_V2_LINE_FLAG_BIAS_PULL_DOWN;
-	else if (flags & GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_UP)
-		config->flags |= GPIO_V2_LINE_FLAG_BIAS_PULL_UP;
-}
-
-static void line_request_config_to_gpio_v2_line_config(
-		const struct gpiod_line_request_config *reqcfg,
-		struct gpio_v2_line_config *lc)
-{
-	line_request_type_to_gpio_v2_line_config(reqcfg->request_type, lc);
-	line_request_flag_to_gpio_v2_line_config(reqcfg->flags, lc);
-}
-
-static bool line_request_config_validate(
-		const struct gpiod_line_request_config *config)
-{
-	int bias_flags = 0;
-
-	if ((config->request_type != GPIOD_LINE_REQUEST_DIRECTION_OUTPUT) &&
-	    (config->flags & (GPIOD_LINE_REQUEST_FLAG_OPEN_DRAIN |
-			      GPIOD_LINE_REQUEST_FLAG_OPEN_SOURCE)))
-		return false;
-
-
-	if ((config->flags & GPIOD_LINE_REQUEST_FLAG_OPEN_DRAIN) &&
-	    (config->flags & GPIOD_LINE_REQUEST_FLAG_OPEN_SOURCE)) {
-		return false;
-	}
-
-	if (config->flags & GPIOD_LINE_REQUEST_FLAG_BIAS_DISABLED)
-		bias_flags++;
-	if (config->flags & GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_UP)
-		bias_flags++;
-	if (config->flags & GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_DOWN)
-		bias_flags++;
-	if (bias_flags > 1)
-		return false;
-
-	return true;
-}
-
-static void lines_bitmap_set_bit(__u64 *bits, int nr)
-{
-	*bits |= _BITULL(nr);
-}
-
-static void lines_bitmap_clear_bit(__u64 *bits, int nr)
-{
-	*bits &= ~_BITULL(nr);
-}
-
-static int lines_bitmap_test_bit(__u64 bits, int nr)
-{
-	return !!(bits & _BITULL(nr));
-}
-
-static void lines_bitmap_assign_bit(__u64 *bits, int nr, bool value)
-{
-	if (value)
-		lines_bitmap_set_bit(bits, nr);
-	else
-		lines_bitmap_clear_bit(bits, nr);
-}
-
-static int line_request_values(struct gpiod_line_bulk *bulk,
-			       const struct gpiod_line_request_config *config,
-			       const int *vals)
-{
-	struct gpiod_line *line;
-	struct line_fd_handle *line_fd;
-	struct gpio_v2_line_request req;
-	unsigned int i;
-	int rv, fd;
-
-	if (!line_request_config_validate(config)) {
-		errno = EINVAL;
-		return -1;
-	}
-
-	memset(&req, 0, sizeof(req));
-
-	req.num_lines = gpiod_line_bulk_num_lines(bulk);
-	line_request_config_to_gpio_v2_line_config(config, &req.config);
-
-	line_bulk_foreach_line(bulk, line, i)
-		req.offsets[i] = gpiod_line_offset(line);
-
-	if (config->request_type == GPIOD_LINE_REQUEST_DIRECTION_OUTPUT &&
-	    vals) {
-		req.config.num_attrs = 1;
-		req.config.attrs[0].attr.id = GPIO_V2_LINE_ATTR_ID_OUTPUT_VALUES;
-		line_bulk_foreach_line(bulk, line, i) {
-			lines_bitmap_assign_bit(
-				&req.config.attrs[0].mask, i, 1);
-			lines_bitmap_assign_bit(
-				&req.config.attrs[0].attr.values,
-				i, vals[i]);
-		}
-	}
-
-	if (config->consumer)
-		strncpy(req.consumer, config->consumer,
-			sizeof(req.consumer) - 1);
-
-	line = gpiod_line_bulk_get_line(bulk, 0);
-	fd = line->chip->fd;
-
-	rv = ioctl(fd, GPIO_V2_GET_LINE_IOCTL, &req);
-	if (rv < 0)
-		return -1;
-
-	line_fd = line_make_fd_handle(req.fd);
-	if (!line_fd)
-		return -1;
-
-	line_bulk_foreach_line(bulk, line, i) {
-		line->state = LINE_REQUESTED_VALUES;
-		line->req_flags = config->flags;
-		if (config->request_type == GPIOD_LINE_REQUEST_DIRECTION_OUTPUT)
-			line->output_value = lines_bitmap_test_bit(
-				req.config.attrs[0].attr.values, i);
-		line_set_fd(line, line_fd);
-
-		rv = line_update(line);
-		if (rv) {
-			gpiod_line_release_bulk(bulk);
-			return rv;
-		}
-	}
-
-	return 0;
-}
-
-static int line_request_event_single(struct gpiod_line *line,
-			const struct gpiod_line_request_config *config)
-{
-	struct line_fd_handle *line_fd;
-	struct gpio_v2_line_request req;
-	int rv;
-
-	memset(&req, 0, sizeof(req));
-
-	if (config->consumer)
-		strncpy(req.consumer, config->consumer,
-			sizeof(req.consumer) - 1);
-
-	req.offsets[0] = gpiod_line_offset(line);
-	req.num_lines = 1;
-	line_request_config_to_gpio_v2_line_config(config, &req.config);
-
-	rv = ioctl(line->chip->fd, GPIO_V2_GET_LINE_IOCTL, &req);
-	if (rv < 0)
-		return -1;
-
-	line_fd = line_make_fd_handle(req.fd);
-	if (!line_fd)
-		return -1;
-
-	line->state = LINE_REQUESTED_EVENTS;
-	line->req_flags = config->flags;
-	line_set_fd(line, line_fd);
-
-	rv = line_update(line);
-	if (rv) {
-		gpiod_line_release(line);
-		return rv;
-	}
-
-	return 0;
-}
-
-static int line_request_events(struct gpiod_line_bulk *bulk,
-			       const struct gpiod_line_request_config *config)
-{
-	struct gpiod_line *line;
-	unsigned int off;
-	int rv, rev;
-
-	line_bulk_foreach_line(bulk, line, off) {
-		rv = line_request_event_single(line, config);
-		if (rv) {
-			for (rev = off - 1; rev >= 0; rev--) {
-				line = gpiod_line_bulk_get_line(bulk, rev);
-				gpiod_line_release(line);
-			}
-
-			return -1;
-		}
-	}
-
-	return 0;
-}
-
-GPIOD_API int gpiod_line_request(struct gpiod_line *line,
-				 const struct gpiod_line_request_config *config,
-				 int default_val)
-{
-	struct gpiod_line_bulk bulk = BULK_SINGLE_LINE_INIT(line);
-
-	return gpiod_line_request_bulk(&bulk, config, &default_val);
-}
-
-static bool line_request_is_direction(int request)
-{
-	return request == GPIOD_LINE_REQUEST_DIRECTION_AS_IS ||
-	       request == GPIOD_LINE_REQUEST_DIRECTION_INPUT ||
-	       request == GPIOD_LINE_REQUEST_DIRECTION_OUTPUT;
-}
-
-static bool line_request_is_events(int request)
-{
-	return request == GPIOD_LINE_REQUEST_EVENT_FALLING_EDGE ||
-	       request == GPIOD_LINE_REQUEST_EVENT_RISING_EDGE ||
-	       request == GPIOD_LINE_REQUEST_EVENT_BOTH_EDGES;
-}
-
-GPIOD_API int
-gpiod_line_request_bulk(struct gpiod_line_bulk *bulk,
-			const struct gpiod_line_request_config *config,
-			const int *vals)
-{
-	if (line_request_is_direction(config->request_type))
-		return line_request_values(bulk, config, vals);
-	else if (line_request_is_events(config->request_type))
-		return line_request_events(bulk, config);
-
-	errno = EINVAL;
-	return -1;
-}
-
-GPIOD_API void gpiod_line_release(struct gpiod_line *line)
-{
-	struct gpiod_line_bulk bulk = BULK_SINGLE_LINE_INIT(line);
-
-	gpiod_line_release_bulk(&bulk);
-}
-
-GPIOD_API void gpiod_line_release_bulk(struct gpiod_line_bulk *bulk)
-{
-	struct gpiod_line *line;
-	unsigned int idx;
-
-	line_bulk_foreach_line(bulk, line, idx) {
-		if (line->state != LINE_FREE) {
-			line_fd_decref(line);
-			line->state = LINE_FREE;
-		}
-	}
-}
-
-GPIOD_API int gpiod_line_get_value(struct gpiod_line *line)
-{
-	struct gpiod_line_bulk bulk = BULK_SINGLE_LINE_INIT(line);
-	int rv, value;
-
-	rv = gpiod_line_get_value_bulk(&bulk, &value);
-	if (rv < 0)
-		return -1;
-
-	return value;
-}
-
-GPIOD_API int gpiod_line_get_value_bulk(struct gpiod_line_bulk *bulk,
-					int *values)
-{
-	struct gpio_v2_line_values lv;
-	struct gpiod_line *line;
-	unsigned int i;
-	int rv, fd;
-
-	if (!line_bulk_all_requested(bulk))
-		return -1;
-
-	line = gpiod_line_bulk_get_line(bulk, 0);
-
-	memset(&lv, 0, sizeof(lv));
-
-	if (line->state == LINE_REQUESTED_VALUES) {
-		for (i = 0; i < gpiod_line_bulk_num_lines(bulk); i++)
-			lines_bitmap_set_bit(&lv.mask, i);
-
-		fd = line_get_fd(line);
-
-		rv = ioctl(fd, GPIO_V2_LINE_GET_VALUES_IOCTL, &lv);
-		if (rv < 0)
-			return -1;
-
-		for (i = 0; i < gpiod_line_bulk_num_lines(bulk); i++)
-			values[i] = lines_bitmap_test_bit(lv.bits, i);
-
-	} else if (line->state == LINE_REQUESTED_EVENTS) {
-		lines_bitmap_set_bit(&lv.mask, 0);
-		for (i = 0; i < gpiod_line_bulk_num_lines(bulk); i++) {
-			line = gpiod_line_bulk_get_line(bulk, i);
-
-			fd = line_get_fd(line);
-			rv = ioctl(fd, GPIO_V2_LINE_GET_VALUES_IOCTL, &lv);
-			if (rv < 0)
-				return -1;
-			values[i] = lines_bitmap_test_bit(lv.bits, 0);
-		}
-	} else {
-		errno = EINVAL;
-		return -1;
-	}
-	return 0;
-}
-
-GPIOD_API int gpiod_line_set_value(struct gpiod_line *line, int value)
-{
-	struct gpiod_line_bulk bulk = BULK_SINGLE_LINE_INIT(line);
-
-	return gpiod_line_set_value_bulk(&bulk, &value);
-}
-
-GPIOD_API int gpiod_line_set_value_bulk(struct gpiod_line_bulk *bulk,
-					const int *values)
-{
-	struct gpio_v2_line_values lv;
-	struct gpiod_line *line;
-	unsigned int i;
-	int rv, fd;
-
-	if (!line_bulk_all_requested(bulk))
-		return -1;
-
-	memset(&lv, 0, sizeof(lv));
-
-	for (i = 0; i < gpiod_line_bulk_num_lines(bulk); i++) {
-		lines_bitmap_set_bit(&lv.mask, i);
-		lines_bitmap_assign_bit(&lv.bits, i, values && values[i]);
-	}
-
-	line = gpiod_line_bulk_get_line(bulk, 0);
-	fd = line_get_fd(line);
-
-	rv = ioctl(fd, GPIO_V2_LINE_SET_VALUES_IOCTL, &lv);
-	if (rv < 0)
-		return -1;
-
-	line_bulk_foreach_line(bulk, line, i)
-		line->output_value = lines_bitmap_test_bit(lv.bits, i);
-
-	return 0;
-}
-
-GPIOD_API int gpiod_line_set_config(struct gpiod_line *line, int direction,
-				    int flags, int value)
-{
-	struct gpiod_line_bulk bulk = BULK_SINGLE_LINE_INIT(line);
-
-	return gpiod_line_set_config_bulk(&bulk, direction, flags, &value);
-}
-
-GPIOD_API int gpiod_line_set_config_bulk(struct gpiod_line_bulk *bulk,
-					 int direction, int flags,
-					 const int *values)
-{
-	struct gpio_v2_line_config hcfg;
-	struct gpiod_line *line;
-	unsigned int i;
-	int rv, fd;
-
-	if (!line_bulk_all_requested_values(bulk))
-		return -1;
-
-	if (!line_request_direction_is_valid(direction))
-		return -1;
-
-	memset(&hcfg, 0, sizeof(hcfg));
-
-	line_request_flag_to_gpio_v2_line_config(flags, &hcfg);
-	line_request_type_to_gpio_v2_line_config(direction, &hcfg);
-	if (direction == GPIOD_LINE_REQUEST_DIRECTION_OUTPUT && values) {
-		hcfg.num_attrs = 1;
-		hcfg.attrs[0].attr.id = GPIO_V2_LINE_ATTR_ID_OUTPUT_VALUES;
-		for (i = 0; i < gpiod_line_bulk_num_lines(bulk); i++) {
-			lines_bitmap_assign_bit(&hcfg.attrs[0].mask, i, 1);
-			lines_bitmap_assign_bit(
-				&hcfg.attrs[0].attr.values, i, values[i]);
-		}
-	}
-
-	line = gpiod_line_bulk_get_line(bulk, 0);
-	fd = line_get_fd(line);
-
-	rv = ioctl(fd, GPIO_V2_LINE_SET_CONFIG_IOCTL, &hcfg);
-	if (rv < 0)
-		return -1;
-
-	line_bulk_foreach_line(bulk, line, i) {
-		line->req_flags = flags;
-		if (direction == GPIOD_LINE_REQUEST_DIRECTION_OUTPUT)
-			line->output_value = lines_bitmap_test_bit(
-				hcfg.attrs[0].attr.values, i);
-
-		rv = line_update(line);
-		if (rv < 0)
-			return rv;
-	}
-	return 0;
-}
-
-GPIOD_API int gpiod_line_set_flags(struct gpiod_line *line, int flags)
-{
-	struct gpiod_line_bulk bulk = BULK_SINGLE_LINE_INIT(line);
-
-	return gpiod_line_set_flags_bulk(&bulk, flags);
-}
-
-GPIOD_API int gpiod_line_set_flags_bulk(struct gpiod_line_bulk *bulk, int flags)
-{
-	struct gpiod_line *line;
-	int values[LINE_REQUEST_MAX_LINES];
-	unsigned int i;
-	int direction;
-
-	line = gpiod_line_bulk_get_line(bulk, 0);
-	if (line->direction == GPIOD_LINE_DIRECTION_OUTPUT) {
-		line_bulk_foreach_line(bulk, line, i)
-			values[i] = line->output_value;
-
-		direction = GPIOD_LINE_REQUEST_DIRECTION_OUTPUT;
-	} else {
-		direction = GPIOD_LINE_REQUEST_DIRECTION_INPUT;
-	}
-
-	return gpiod_line_set_config_bulk(bulk, direction,
-					  flags, values);
-}
-
-GPIOD_API int gpiod_line_set_direction_input(struct gpiod_line *line)
-{
-	return gpiod_line_set_config(line, GPIOD_LINE_REQUEST_DIRECTION_INPUT,
-				     line->req_flags, 0);
-}
-
-GPIOD_API int gpiod_line_set_direction_input_bulk(struct gpiod_line_bulk *bulk)
-{
-	struct gpiod_line *line;
-
-	line = gpiod_line_bulk_get_line(bulk, 0);
-	return gpiod_line_set_config_bulk(bulk,
-					  GPIOD_LINE_REQUEST_DIRECTION_INPUT,
-					  line->req_flags, NULL);
-}
-
-GPIOD_API int gpiod_line_set_direction_output(struct gpiod_line *line,
-					      int value)
-{
-	return gpiod_line_set_config(line, GPIOD_LINE_REQUEST_DIRECTION_OUTPUT,
-				     line->req_flags, value);
-}
-
-GPIOD_API int gpiod_line_set_direction_output_bulk(struct gpiod_line_bulk *bulk,
-						   const int *values)
-{
-	struct gpiod_line *line;
-
-	line = gpiod_line_bulk_get_line(bulk, 0);
-	return gpiod_line_set_config_bulk(bulk,
-					  GPIOD_LINE_REQUEST_DIRECTION_OUTPUT,
-					  line->req_flags, values);
-}
-
-GPIOD_API int gpiod_line_event_wait(struct gpiod_line *line,
-				    const struct timespec *timeout)
-{
-	struct gpiod_line_bulk bulk = BULK_SINGLE_LINE_INIT(line);
-
-	return gpiod_line_event_wait_bulk(&bulk, timeout, NULL);
-}
-
-GPIOD_API int gpiod_line_event_wait_bulk(struct gpiod_line_bulk *bulk,
-					 const struct timespec *timeout,
-					 struct gpiod_line_bulk *event_bulk)
-{
-	struct pollfd fds[LINE_REQUEST_MAX_LINES];
-	unsigned int off, num_lines;
-	struct gpiod_line *line;
-	int rv;
-
-	if (!line_bulk_all_requested(bulk))
-		return -1;
-
-	memset(fds, 0, sizeof(fds));
-	num_lines = gpiod_line_bulk_num_lines(bulk);
-
-	line_bulk_foreach_line(bulk, line, off) {
-		fds[off].fd = line_get_fd(line);
-		fds[off].events = POLLIN | POLLPRI;
-	}
-
-	rv = ppoll(fds, num_lines, timeout, NULL);
-	if (rv < 0)
-		return -1;
-	else if (rv == 0)
-		return 0;
-
-	for (off = 0; off < num_lines; off++) {
-		if (fds[off].revents) {
-			if (fds[off].revents & POLLNVAL) {
-				errno = EINVAL;
-				return -1;
-			}
-
-			if (event_bulk) {
-				line = gpiod_line_bulk_get_line(bulk, off);
-				rv = gpiod_line_bulk_add_line(event_bulk, line);
-				if (rv)
-					return -1;
-			}
-
-			if (!--rv)
-				break;
-		}
-	}
-
-	return 1;
-}
-
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
-GPIOD_API int gpiod_line_event_get_fd(struct gpiod_line *line)
-{
-	if (line->state != LINE_REQUESTED_EVENTS) {
-		errno = EPERM;
-		return -1;
-	}
-
-	return line_get_fd(line);
-}
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
diff --git a/lib/edge-event.c b/lib/edge-event.c
new file mode 100644
index 0000000..b3c982f
--- /dev/null
+++ b/lib/edge-event.c
@@ -0,0 +1,184 @@
+// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-FileCopyrightText: 2021 Bartosz Golaszewski <brgl@bgdev.pl>
+
+#include <errno.h>
+#include <gpiod.h>
+#include <stdlib.h>
+#include <string.h>
+#include <unistd.h>
+
+#include "internal.h"
+
+/* As defined in the kernel. */
+#define EVENT_BUFFER_MAX_CAPACITY (GPIO_V2_LINES_MAX * 16)
+
+struct gpiod_edge_event {
+	int event_type;
+	uint64_t timestamp;
+	unsigned int line_offset;
+	unsigned int global_seqno;
+	unsigned int line_seqno;
+};
+
+struct gpiod_edge_event_buffer {
+	unsigned int capacity;
+	unsigned int num_events;
+	struct gpiod_edge_event *events;
+	struct gpio_v2_line_event *event_data;
+};
+
+GPIOD_API void gpiod_edge_event_free(struct gpiod_edge_event *event)
+{
+	free(event);
+}
+
+GPIOD_API int gpiod_edge_event_get_event_type(struct gpiod_edge_event *event)
+{
+	return event->event_type;
+}
+
+GPIOD_API uint64_t
+gpiod_edge_event_get_timestamp(struct gpiod_edge_event *event)
+{
+	return event->timestamp;
+}
+
+GPIOD_API unsigned int
+gpiod_edge_event_get_line_offset(struct gpiod_edge_event *event)
+{
+	return event->line_offset;
+}
+
+GPIOD_API unsigned int
+gpiod_edge_event_get_global_seqno(struct gpiod_edge_event *event)
+{
+	return event->global_seqno;
+}
+
+GPIOD_API unsigned int
+gpiod_edge_event_get_line_seqno(struct gpiod_edge_event *event)
+{
+	return event->line_seqno;
+}
+
+GPIOD_API struct gpiod_edge_event_buffer *
+gpiod_edge_event_buffer_new(unsigned int capacity)
+{
+	struct gpiod_edge_event_buffer *buf;
+
+	if (capacity == 0)
+		capacity = 64;
+	if (capacity > EVENT_BUFFER_MAX_CAPACITY)
+		capacity = EVENT_BUFFER_MAX_CAPACITY;
+
+	buf = malloc(sizeof(*buf));
+	if (!buf)
+		return NULL;
+
+	memset(buf, 0, sizeof(*buf));
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
+GPIOD_API void
+gpiod_edge_event_buffer_free(struct gpiod_edge_event_buffer *buffer)
+{
+	free(buffer->events);
+	free(buffer->event_data);
+	free(buffer);
+}
+
+GPIOD_API struct gpiod_edge_event *
+gpiod_edge_event_buffer_peek_event(struct gpiod_edge_event_buffer *buffer,
+				   unsigned long index)
+{
+	if (index >= buffer->num_events) {
+		errno = EINVAL;
+		return NULL;
+	}
+
+	return &buffer->events[index];
+}
+
+GPIOD_API struct gpiod_edge_event *
+gpiod_edge_event_buffer_get_event(struct gpiod_edge_event_buffer *buffer,
+				   unsigned long index)
+{
+	struct gpiod_edge_event *event;
+
+	if (index >= buffer->num_events) {
+		errno = EINVAL;
+		return NULL;
+	}
+
+	event = malloc(sizeof(*event));
+	if (!event)
+		return NULL;
+
+	memcpy(event, &buffer->events[index], sizeof(*event));
+
+	return event;
+}
+
+GPIOD_API unsigned int
+gpiod_edge_event_buffer_num_events(struct gpiod_edge_event_buffer *buffer)
+{
+	return buffer->num_events;
+}
+
+GPIOD_API int
+gpiod_edge_event_buffer_read_fd(int fd, struct gpiod_edge_event_buffer *buffer,
+				unsigned int max_events)
+{
+	struct gpio_v2_line_event *curr;
+	struct gpiod_edge_event *event;
+	unsigned int i;
+	ssize_t rd;
+
+	memset(buffer->event_data, 0,
+	       sizeof(*buffer->event_data) * buffer->capacity);
+	memset(buffer->events, 0, sizeof(*buffer->events) * buffer->capacity);
+
+	if (max_events > buffer->capacity)
+		max_events = buffer->capacity;
+
+	rd = read(fd, buffer->event_data,
+		  max_events * sizeof(*buffer->event_data));
+	if (rd < 0) {
+		return -1;
+	} else if ((unsigned int)rd < sizeof(*buffer->event_data)) {
+		errno = EIO;
+		return -1;
+	}
+
+	buffer->num_events = rd / sizeof(*buffer->event_data);
+
+	for (i = 0; i < buffer->num_events; i++) {
+		curr = &buffer->event_data[i];
+		event = &buffer->events[i];
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
diff --git a/lib/helpers.c b/lib/helpers.c
deleted file mode 100644
index fb53518..0000000
--- a/lib/helpers.c
+++ /dev/null
@@ -1,302 +0,0 @@
-// SPDX-License-Identifier: LGPL-2.1-or-later
-// SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
-
-/*
- * More specific variants of the core API and misc functions that don't need
- * access to neither the internal library data structures nor the kernel UAPI.
- */
-
-#include <errno.h>
-#include <gpiod.h>
-#include <stdio.h>
-#include <string.h>
-
-#include "internal.h"
-
-GPIOD_API struct gpiod_line_bulk *
-gpiod_chip_get_lines(struct gpiod_chip *chip,
-		     unsigned int *offsets, unsigned int num_offsets)
-{
-	struct gpiod_line_bulk *bulk;
-	struct gpiod_line *line;
-	unsigned int i;
-
-	bulk = gpiod_line_bulk_new(num_offsets);
-	if (!bulk)
-		return NULL;
-
-	for (i = 0; i < num_offsets; i++) {
-		line = gpiod_chip_get_line(chip, offsets[i]);
-		if (!line) {
-			gpiod_line_bulk_free(bulk);
-			return NULL;
-		}
-
-		gpiod_line_bulk_add_line(bulk, line);
-	}
-
-	return bulk;
-}
-
-GPIOD_API struct gpiod_line_bulk *
-gpiod_chip_get_all_lines(struct gpiod_chip *chip)
-{
-	struct gpiod_line_bulk *bulk;
-	struct gpiod_line *line;
-	unsigned int offset;
-
-	bulk = gpiod_line_bulk_new(gpiod_chip_get_num_lines(chip));
-	if (!bulk)
-		return NULL;
-
-	for (offset = 0; offset < gpiod_chip_get_num_lines(chip); offset++) {
-		line = gpiod_chip_get_line(chip, offset);
-		if (!line) {
-			gpiod_line_bulk_free(bulk);
-			return NULL;
-		}
-
-		gpiod_line_bulk_add_line(bulk, line);
-	}
-
-	return bulk;
-}
-
-GPIOD_API int gpiod_chip_find_line(struct gpiod_chip *chip, const char *name)
-{
-	unsigned int offset, num_lines;
-	struct gpiod_line *line;
-	const char *tmp;
-
-	num_lines = gpiod_chip_get_num_lines(chip);
-
-	for (offset = 0; offset < num_lines; offset++) {
-		line = gpiod_chip_get_line(chip, offset);
-		if (!line)
-			return -1;
-
-		tmp = gpiod_line_name(line);
-		if (tmp && strcmp(tmp, name) == 0)
-			return gpiod_line_offset(line);
-	}
-
-	errno = ENOENT;
-	return -1;
-}
-
-GPIOD_API int gpiod_line_request_input(struct gpiod_line *line,
-				       const char *consumer)
-{
-	struct gpiod_line_request_config config = {
-		.consumer = consumer,
-		.request_type = GPIOD_LINE_REQUEST_DIRECTION_INPUT,
-	};
-
-	return gpiod_line_request(line, &config, 0);
-}
-
-GPIOD_API int gpiod_line_request_output(struct gpiod_line *line,
-					const char *consumer, int default_val)
-{
-	struct gpiod_line_request_config config = {
-		.consumer = consumer,
-		.request_type = GPIOD_LINE_REQUEST_DIRECTION_OUTPUT,
-	};
-
-	return gpiod_line_request(line, &config, default_val);
-}
-
-GPIOD_API int gpiod_line_request_input_flags(struct gpiod_line *line,
-					     const char *consumer, int flags)
-{
-	struct gpiod_line_request_config config = {
-		.consumer = consumer,
-		.request_type = GPIOD_LINE_REQUEST_DIRECTION_INPUT,
-		.flags = flags,
-	};
-
-	return gpiod_line_request(line, &config, 0);
-}
-
-GPIOD_API int gpiod_line_request_output_flags(struct gpiod_line *line,
-					      const char *consumer, int flags,
-					      int default_val)
-{
-	struct gpiod_line_request_config config = {
-		.consumer = consumer,
-		.request_type = GPIOD_LINE_REQUEST_DIRECTION_OUTPUT,
-		.flags = flags,
-	};
-
-	return gpiod_line_request(line, &config, default_val);
-}
-
-static int line_event_request_type(struct gpiod_line *line,
-				   const char *consumer, int flags, int type)
-{
-	struct gpiod_line_request_config config = {
-		.consumer = consumer,
-		.request_type = type,
-		.flags = flags,
-	};
-
-	return gpiod_line_request(line, &config, 0);
-}
-
-GPIOD_API int gpiod_line_request_rising_edge_events(struct gpiod_line *line,
-						    const char *consumer)
-{
-	return line_event_request_type(line, consumer, 0,
-				       GPIOD_LINE_REQUEST_EVENT_RISING_EDGE);
-}
-
-GPIOD_API int gpiod_line_request_falling_edge_events(struct gpiod_line *line,
-						     const char *consumer)
-{
-	return line_event_request_type(line, consumer, 0,
-				       GPIOD_LINE_REQUEST_EVENT_FALLING_EDGE);
-}
-
-GPIOD_API int gpiod_line_request_both_edges_events(struct gpiod_line *line,
-						   const char *consumer)
-{
-	return line_event_request_type(line, consumer, 0,
-				       GPIOD_LINE_REQUEST_EVENT_BOTH_EDGES);
-}
-
-GPIOD_API int
-gpiod_line_request_rising_edge_events_flags(struct gpiod_line *line,
-					    const char *consumer,
-					    int flags)
-{
-	return line_event_request_type(line, consumer, flags,
-				       GPIOD_LINE_REQUEST_EVENT_RISING_EDGE);
-}
-
-GPIOD_API int
-gpiod_line_request_falling_edge_events_flags(struct gpiod_line *line,
-					     const char *consumer,
-					     int flags)
-{
-	return line_event_request_type(line, consumer, flags,
-				       GPIOD_LINE_REQUEST_EVENT_FALLING_EDGE);
-}
-
-GPIOD_API int
-gpiod_line_request_both_edges_events_flags(struct gpiod_line *line,
-					   const char *consumer, int flags)
-{
-	return line_event_request_type(line, consumer, flags,
-				       GPIOD_LINE_REQUEST_EVENT_BOTH_EDGES);
-}
-
-GPIOD_API int gpiod_line_request_bulk_input(struct gpiod_line_bulk *bulk,
-					    const char *consumer)
-{
-	struct gpiod_line_request_config config = {
-		.consumer = consumer,
-		.request_type = GPIOD_LINE_REQUEST_DIRECTION_INPUT,
-	};
-
-	return gpiod_line_request_bulk(bulk, &config, 0);
-}
-
-GPIOD_API int gpiod_line_request_bulk_output(struct gpiod_line_bulk *bulk,
-					     const char *consumer,
-					     const int *default_vals)
-{
-	struct gpiod_line_request_config config = {
-		.consumer = consumer,
-		.request_type = GPIOD_LINE_REQUEST_DIRECTION_OUTPUT,
-	};
-
-	return gpiod_line_request_bulk(bulk, &config, default_vals);
-}
-
-static int line_event_request_type_bulk(struct gpiod_line_bulk *bulk,
-					const char *consumer,
-					int flags, int type)
-{
-	struct gpiod_line_request_config config = {
-		.consumer = consumer,
-		.request_type = type,
-		.flags = flags,
-	};
-
-	return gpiod_line_request_bulk(bulk, &config, 0);
-}
-
-GPIOD_API int
-gpiod_line_request_bulk_rising_edge_events(struct gpiod_line_bulk *bulk,
-					   const char *consumer)
-{
-	return line_event_request_type_bulk(bulk, consumer, 0,
-					GPIOD_LINE_REQUEST_EVENT_RISING_EDGE);
-}
-
-GPIOD_API int
-gpiod_line_request_bulk_falling_edge_events(struct gpiod_line_bulk *bulk,
-					    const char *consumer)
-{
-	return line_event_request_type_bulk(bulk, consumer, 0,
-					GPIOD_LINE_REQUEST_EVENT_FALLING_EDGE);
-}
-
-GPIOD_API int
-gpiod_line_request_bulk_both_edges_events(struct gpiod_line_bulk *bulk,
-					  const char *consumer)
-{
-	return line_event_request_type_bulk(bulk, consumer, 0,
-					GPIOD_LINE_REQUEST_EVENT_BOTH_EDGES);
-}
-
-GPIOD_API int gpiod_line_request_bulk_input_flags(struct gpiod_line_bulk *bulk,
-						  const char *consumer,
-						  int flags)
-{
-	struct gpiod_line_request_config config = {
-		.consumer = consumer,
-		.request_type = GPIOD_LINE_REQUEST_DIRECTION_INPUT,
-		.flags = flags,
-	};
-
-	return gpiod_line_request_bulk(bulk, &config, 0);
-}
-
-GPIOD_API int gpiod_line_request_bulk_output_flags(struct gpiod_line_bulk *bulk,
-						   const char *consumer,
-						   int flags,
-						   const int *default_vals)
-{
-	struct gpiod_line_request_config config = {
-		.consumer = consumer,
-		.request_type = GPIOD_LINE_REQUEST_DIRECTION_OUTPUT,
-		.flags = flags,
-	};
-
-	return gpiod_line_request_bulk(bulk, &config, default_vals);
-}
-
-GPIOD_API int gpiod_line_request_bulk_rising_edge_events_flags(
-					struct gpiod_line_bulk *bulk,
-					const char *consumer, int flags)
-{
-	return line_event_request_type_bulk(bulk, consumer, flags,
-					GPIOD_LINE_REQUEST_EVENT_RISING_EDGE);
-}
-
-GPIOD_API int gpiod_line_request_bulk_falling_edge_events_flags(
-					struct gpiod_line_bulk *bulk,
-					const char *consumer, int flags)
-{
-	return line_event_request_type_bulk(bulk, consumer, flags,
-					GPIOD_LINE_REQUEST_EVENT_FALLING_EDGE);
-}
-
-GPIOD_API int gpiod_line_request_bulk_both_edges_events_flags(
-					struct gpiod_line_bulk *bulk,
-					const char *consumer, int flags)
-{
-	return line_event_request_type_bulk(bulk, consumer, flags,
-					GPIOD_LINE_REQUEST_EVENT_BOTH_EDGES);
-}
diff --git a/lib/info-event.c b/lib/info-event.c
new file mode 100644
index 0000000..1fe6b0a
--- /dev/null
+++ b/lib/info-event.c
@@ -0,0 +1,83 @@
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
+struct gpiod_info_event {
+	int event_type;
+	uint64_t timestamp;
+	struct gpiod_line_info *info;
+};
+
+struct gpiod_info_event *
+gpiod_info_event_from_kernel(struct gpio_v2_line_info_changed *evbuf)
+{
+	struct gpiod_info_event *event;
+
+	event = malloc(sizeof(*event));
+	if (!event)
+		return NULL;
+
+	memset(event, 0, sizeof(*event));
+	event->timestamp = evbuf->timestamp_ns;
+
+	switch (evbuf->event_type) {
+	case GPIOLINE_CHANGED_REQUESTED:
+		event->event_type = GPIOD_INFO_EVENT_LINE_REQUESTED;
+		break;
+	case GPIOLINE_CHANGED_RELEASED:
+		event->event_type = GPIOD_INFO_EVENT_LINE_RELEASED;
+		break;
+	case GPIOLINE_CHANGED_CONFIG:
+		event->event_type = GPIOD_INFO_EVENT_LINE_CONFIG_CHANGED;
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
+GPIOD_API void gpiod_info_event_free(struct gpiod_info_event *event)
+{
+	gpiod_line_info_free(event->info);
+	free(event);
+}
+
+GPIOD_API int gpiod_info_event_get_event_type(struct gpiod_info_event *event)
+{
+	return event->event_type;
+}
+
+GPIOD_API uint64_t
+gpiod_info_event_get_timestamp(struct gpiod_info_event *event)
+{
+	return event->timestamp;
+}
+
+GPIOD_API struct gpiod_line_info *
+gpiod_info_event_peek_line_info(struct gpiod_info_event *event)
+{
+	return event->info;
+}
+
+GPIOD_API struct gpiod_line_info *
+gpiod_info_event_get_line_info(struct gpiod_info_event *event)
+{
+	return gpiod_line_info_copy(event->info);
+}
diff --git a/lib/internal.c b/lib/internal.c
new file mode 100644
index 0000000..25530d7
--- /dev/null
+++ b/lib/internal.c
@@ -0,0 +1,58 @@
+// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-FileCopyrightText: 2021 Bartosz Golaszewski <brgl@bgdev.pl>
+
+#include <errno.h>
+#include <poll.h>
+#include <string.h>
+
+#include "internal.h"
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
+
+void gpiod_line_mask_zero(uint64_t *mask)
+{
+	*mask = 0ULL;
+}
+
+void gpiod_line_mask_fill(uint64_t *mask)
+{
+	*mask = UINT64_MAX;
+}
+
+bool gpiod_line_mask_test_bit(uint64_t *mask, int nr)
+{
+	return *mask & (1ULL << nr);
+}
+
+void gpiod_line_mask_set_bit(uint64_t *mask, unsigned int nr)
+{
+	*mask |= (1ULL << nr);
+}
+
+void gpiod_line_mask_assign_bit(uint64_t *mask, unsigned int nr, bool value)
+{
+	if (value)
+		gpiod_line_mask_set_bit(mask, nr);
+	else
+		*mask &= ~(1ULL << nr);
+}
diff --git a/lib/internal.h b/lib/internal.h
index 8b3f69a..7730f77 100644
--- a/lib/internal.h
+++ b/lib/internal.h
@@ -4,8 +4,36 @@
 #ifndef __LIBGPIOD_GPIOD_INTERNAL_H__
 #define __LIBGPIOD_GPIOD_INTERNAL_H__
 
+#include <gpiod.h>
+#include <stddef.h>
+#include <stdint.h>
+
+#include "uapi/gpio.h"
+
 /* For internal library use only. */
 
 #define GPIOD_API __attribute__((visibility("default")))
 
+struct gpiod_line_info *
+gpiod_line_info_from_kernel(struct gpio_v2_line_info *infobuf);
+struct gpiod_line_info *gpiod_line_info_copy(struct gpiod_line_info *info);
+void gpiod_request_config_to_kernel(struct gpiod_request_config *config,
+				    struct gpio_v2_line_request *reqbuf);
+int gpiod_line_config_to_kernel(struct gpiod_line_config *config,
+				struct gpio_v2_line_config *cfgbuf,
+				unsigned int num_lines,
+				const unsigned int *offsets);
+struct gpiod_line_request *
+gpiod_line_request_from_kernel(struct gpio_v2_line_request *reqbuf);
+struct gpiod_info_event *
+gpiod_info_event_from_kernel(struct gpio_v2_line_info_changed *evbuf);
+
+int gpiod_poll_fd(int fd, uint64_t timeout);
+
+void gpiod_line_mask_zero(uint64_t *mask);
+void gpiod_line_mask_fill(uint64_t *mask);
+bool gpiod_line_mask_test_bit(uint64_t *mask, int nr);
+void gpiod_line_mask_set_bit(uint64_t *mask, unsigned int nr);
+void gpiod_line_mask_assign_bit(uint64_t *mask, unsigned int nr, bool value);
+
 #endif /* __LIBGPIOD_GPIOD_INTERNAL_H__ */
diff --git a/lib/line-config.c b/lib/line-config.c
new file mode 100644
index 0000000..75a20d9
--- /dev/null
+++ b/lib/line-config.c
@@ -0,0 +1,674 @@
+// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-FileCopyrightText: 2021 Bartosz Golaszewski <brgl@bgdev.pl>
+
+/* Line configuration data structure and functions. */
+
+#include <errno.h>
+#include <gpiod.h>
+#include <stdlib.h>
+#include <string.h>
+
+#include "internal.h"
+
+struct base_config {
+	int direction;
+	int edge;
+	int drive;
+	int bias;
+	bool active_low;
+	int clock;
+	unsigned int debounce_period;
+};
+
+struct secondary_config {
+	struct base_config config;
+	unsigned int debounce_period;
+	/* Offsets are sorted and duplicates are removed. */
+	unsigned int offsets[GPIO_V2_LINES_MAX];
+	unsigned int num_offsets;
+};
+
+struct output_value {
+	unsigned int offset;
+	int value;
+};
+
+struct gpiod_line_config {
+	bool too_complex;
+	struct base_config primary;
+	struct secondary_config secondary[GPIO_V2_LINE_NUM_ATTRS_MAX];
+	unsigned int num_secondary;
+	struct output_value output_values[GPIO_V2_LINES_MAX];
+	unsigned int num_output_values;
+	/*
+	 * Used to temporarily store sorted offsets when looking for existing
+	 * configuration
+	 */
+	unsigned int sorted_offsets[GPIO_V2_LINES_MAX];
+	unsigned int num_sorted_offsets;
+};
+
+GPIOD_API struct gpiod_line_config *gpiod_line_config_new(void)
+{
+	struct gpiod_line_config *config;
+
+	config = malloc(sizeof(*config));
+	if (!config)
+		return NULL;
+
+	memset(config, 0, sizeof(*config));
+
+	return config;
+}
+
+GPIOD_API void gpiod_line_config_free(struct gpiod_line_config *config)
+{
+	free(config);
+}
+
+static int offset_compare(const void *a_ptr, const void *b_ptr)
+{
+	unsigned int a = *((unsigned int *)a_ptr);
+	unsigned int b = *((unsigned int *)b_ptr);
+
+	return a - b;
+}
+
+static void sanitize_offsets(struct gpiod_line_config *config,
+			     unsigned int num_offsets,
+			     const unsigned int *offsets)
+{
+	unsigned int i, count, *sorted = config->sorted_offsets;
+
+	if (num_offsets == 0 || num_offsets == 1)
+		return;
+
+	count = num_offsets > GPIO_V2_LINES_MAX ? GPIO_V2_LINES_MAX
+						: num_offsets;
+	config->num_sorted_offsets = num_offsets;
+
+	memcpy(config->sorted_offsets, offsets, count);
+	qsort(sorted, count, sizeof(*sorted), offset_compare);
+
+	for (i = 0; i < (count - 1); i++) {
+		if (sorted[i] == sorted[i + 1]) {
+			if (i < (count - 2))
+				memmove(sorted + i + 1, sorted + i + 2,
+					sizeof(*sorted) * num_offsets - i);
+			config->num_sorted_offsets--;
+		}
+	}
+}
+
+static struct secondary_config *
+find_matching_secondary_config(struct gpiod_line_config *config)
+{
+	unsigned int i, *offsets, num_offsets;
+	struct secondary_config *secondary;
+
+	offsets = config->sorted_offsets;
+	num_offsets = config->num_sorted_offsets;
+
+	for (i = 0; i < config->num_secondary; i++) {
+		secondary = &config->secondary[i];
+
+		if (num_offsets != secondary->num_offsets)
+			continue;
+
+		if (memcmp(secondary->offsets, offsets,
+			   sizeof(*offsets) * num_offsets) == 0)
+			return secondary;
+	}
+
+	return NULL;
+}
+
+static struct secondary_config *
+get_secondary_config(struct gpiod_line_config *config,
+		     unsigned int num_offsets, const unsigned int *offsets)
+{
+	struct secondary_config *secondary;
+
+	if (config->too_complex)
+		return NULL;
+
+	sanitize_offsets(config, num_offsets, offsets);
+	secondary = find_matching_secondary_config(config);
+	if (!secondary) {
+		if (config->num_secondary == GPIO_V2_LINE_NUM_ATTRS_MAX) {
+			config->too_complex = true;
+			return NULL;
+		}
+
+		secondary = &config->secondary[config->num_secondary++];
+	}
+
+	return secondary;
+}
+
+GPIOD_API void
+gpiod_line_config_set_direction(struct gpiod_line_config *config, int direction)
+{
+	config->primary.direction = direction;
+}
+
+GPIOD_API void
+gpiod_line_config_set_direction_offset(struct gpiod_line_config *config,
+				       int direction, unsigned int offset)
+{
+	gpiod_line_config_set_direction_subset(config, direction, 1, &offset);
+}
+
+GPIOD_API void
+gpiod_line_config_set_direction_subset(struct gpiod_line_config *config,
+				       int direction, unsigned int num_offsets,
+				       const unsigned int *offsets)
+{
+	struct secondary_config *secondary;
+
+	secondary = get_secondary_config(config, num_offsets, offsets);
+	if (!secondary)
+		return;
+
+	secondary->config.direction = direction;
+}
+
+GPIOD_API void
+gpiod_line_config_set_edge_detection(struct gpiod_line_config *config, int edge)
+{
+	config->primary.edge = edge;
+}
+
+GPIOD_API void
+gpiod_line_config_set_edge_detection_offset(struct gpiod_line_config *config,
+					    int edge, unsigned int offset)
+{
+	gpiod_line_config_set_edge_detection_subset(config, edge, 1, &offset);
+}
+
+GPIOD_API void
+gpiod_line_config_set_edge_detection_subset(struct gpiod_line_config *config,
+					    int edge, unsigned int num_offsets,
+					    const unsigned int *offsets)
+{
+	struct secondary_config *secondary;
+
+	secondary = get_secondary_config(config, num_offsets, offsets);
+	if (!secondary)
+		return;
+
+	secondary->config.edge = edge;
+}
+
+GPIOD_API void
+gpiod_line_config_set_drive(struct gpiod_line_config *config, int drive)
+{
+	config->primary.drive = drive;
+}
+
+GPIOD_API void
+gpiod_line_config_set_drive_offset(struct gpiod_line_config *config,
+				   int drive, unsigned int offset)
+{
+	gpiod_line_config_set_drive_subset(config, drive, 1, &offset);
+}
+
+GPIOD_API void
+gpiod_line_config_set_drive_subset(struct gpiod_line_config *config,
+				   int drive, unsigned int num_offsets,
+				   const unsigned int *offsets)
+{
+	struct secondary_config *secondary;
+
+	secondary = get_secondary_config(config, num_offsets, offsets);
+	if (!secondary)
+		return;
+
+	secondary->config.drive = drive;
+}
+
+GPIOD_API void
+gpiod_line_config_set_bias(struct gpiod_line_config *config, int bias)
+{
+	config->primary.bias = bias;
+}
+
+GPIOD_API void
+gpiod_line_config_set_bias_offset(struct gpiod_line_config *config,
+				  int bias, unsigned int offset)
+{
+	gpiod_line_config_set_bias_subset(config, bias, 1, &offset);
+}
+
+GPIOD_API void
+gpiod_line_config_set_bias_subset(struct gpiod_line_config *config,
+				  int bias, unsigned int num_offsets,
+				  const unsigned int *offsets)
+{
+	struct secondary_config *secondary;
+
+	secondary = get_secondary_config(config, num_offsets, offsets);
+	if (!secondary)
+		return;
+
+	secondary->config.bias = bias;
+}
+
+GPIOD_API void
+gpiod_line_config_set_active_low(struct gpiod_line_config *config)
+{
+	config->primary.active_low = true;
+}
+
+GPIOD_API void
+gpiod_line_config_set_active_low_offset(struct gpiod_line_config *config,
+					unsigned int offset)
+{
+	gpiod_line_config_set_active_low_subset(config, 1, &offset);
+}
+
+GPIOD_API void
+gpiod_line_config_set_active_low_subset(struct gpiod_line_config *config,
+					unsigned int num_offsets,
+					const unsigned int *offsets)
+{
+	struct secondary_config *secondary;
+
+	secondary = get_secondary_config(config, num_offsets, offsets);
+	if (!secondary)
+		return;
+
+	secondary->config.active_low = true;
+}
+
+GPIOD_API void
+gpiod_line_config_set_active_high(struct gpiod_line_config *config)
+{
+	config->primary.active_low = false;
+}
+
+GPIOD_API void
+gpiod_line_config_set_active_high_offset(struct gpiod_line_config *config,
+					 unsigned int offset)
+{
+	gpiod_line_config_set_active_high_subset(config, 1, &offset);
+}
+
+GPIOD_API void
+gpiod_line_config_set_active_high_subset(struct gpiod_line_config *config,
+					 unsigned int num_offsets,
+					 const unsigned int *offsets)
+{
+	struct secondary_config *secondary;
+
+	secondary = get_secondary_config(config, num_offsets, offsets);
+	if (!secondary)
+		return;
+
+	secondary->config.active_low = false;
+}
+
+GPIOD_API void
+gpiod_line_config_set_debounce_period(struct gpiod_line_config *config,
+				      unsigned int period)
+{
+	config->primary.debounce_period = period;
+}
+
+GPIOD_API void
+gpiod_line_config_set_debounce_period_offset(struct gpiod_line_config *config,
+					     unsigned int period,
+					     unsigned int offset)
+{
+	gpiod_line_config_set_debounce_period_subset(config, period,
+						     1, &offset);
+}
+
+GPIOD_API void
+gpiod_line_config_set_debounce_period_subset(struct gpiod_line_config *config,
+					     unsigned int period,
+					     unsigned int num_offsets,
+					     const unsigned int *offsets)
+{
+	struct secondary_config *secondary;
+
+	secondary = get_secondary_config(config, num_offsets, offsets);
+	if (!secondary)
+		return;
+
+	secondary->config.debounce_period = period;
+}
+
+GPIOD_API void
+gpiod_line_config_set_event_clock(struct gpiod_line_config *config, int clock)
+{
+	config->primary.clock = clock;
+}
+
+GPIOD_API void
+gpiod_line_config_set_event_clock_offset(struct gpiod_line_config *config,
+					 int clock, unsigned int offset)
+{
+	gpiod_line_config_set_event_clock_subset(config, clock, 1, &offset);
+}
+
+GPIOD_API void
+gpiod_line_config_set_event_clock_subset(struct gpiod_line_config *config,
+					 int clock, unsigned int num_offsets,
+					 const unsigned int *offsets)
+{
+	struct secondary_config *secondary;
+
+	secondary = get_secondary_config(config, num_offsets, offsets);
+	if (!secondary)
+		return;
+
+	secondary->config.clock = clock;
+}
+
+GPIOD_API void
+gpiod_line_config_set_output_value(struct gpiod_line_config *config,
+				   unsigned int offset, int value)
+{
+	gpiod_line_config_set_output_values(config, 1, &offset, &value);
+}
+
+static int output_value_find_offset(struct gpiod_line_config *config,
+				    unsigned int offset)
+{
+	unsigned int i;
+
+	for (i = 0; i < config->num_output_values; i++) {
+		if (config->output_values[i].offset == offset)
+			return i;
+	}
+
+	return -1;
+}
+
+static void set_output_value(struct gpiod_line_config *config, unsigned int idx,
+			     unsigned int offset, int value, bool inc)
+{
+	config->output_values[idx].offset = offset;
+	config->output_values[idx].value = value;
+
+	if (inc)
+		config->num_output_values++;
+}
+
+GPIOD_API void
+gpiod_line_config_set_output_values(struct gpiod_line_config *config,
+				    unsigned int num_values,
+				    const unsigned int *offsets,
+				    const int *values)
+{
+	unsigned int i;
+	int pos;
+
+	if (config->too_complex)
+		return;
+
+	for (i = 0; i < num_values; i++) {
+		pos = output_value_find_offset(config, offsets[i]);
+		if (pos < 0) {
+			if (config->num_output_values == GPIO_V2_LINES_MAX) {
+				/* Too many output values specified. */
+				config->too_complex = true;
+				return;
+			}
+
+			/* Add new output value. */
+			set_output_value(config, config->num_output_values,
+					 offsets[i], values[i], true);
+		} else {
+			/* Overwrite old value for this offset. */
+			set_output_value(config, pos,
+					 offsets[i], values[i], false);
+		}
+	}
+}
+
+static int gpiod_make_kernel_flags(uint64_t *flags, struct base_config *config)
+{
+	*flags = 0;
+
+	switch (config->direction) {
+	case GPIOD_LINE_CONFIG_DIRECTION_INPUT:
+		*flags |= GPIO_V2_LINE_FLAG_INPUT;
+		break;
+	case GPIOD_LINE_CONFIG_DIRECTION_OUTPUT:
+		*flags |= GPIO_V2_LINE_FLAG_OUTPUT;
+		break;
+	case GPIOD_LINE_CONFIG_DIRECTION_AS_IS:
+	case 0:
+		break;
+	default:
+		goto err_inval;
+	}
+
+	switch (config->edge) {
+	case GPIOD_LINE_CONFIG_EDGE_FALLING:
+		*flags |= (GPIO_V2_LINE_FLAG_EDGE_FALLING |
+			   GPIO_V2_LINE_FLAG_INPUT);
+		*flags &= ~GPIOD_LINE_CONFIG_DIRECTION_OUTPUT;
+		break;
+	case GPIOD_LINE_CONFIG_EDGE_RISING:
+		*flags |= (GPIO_V2_LINE_FLAG_EDGE_RISING |
+			   GPIO_V2_LINE_FLAG_INPUT);
+		*flags &= ~GPIOD_LINE_CONFIG_DIRECTION_OUTPUT;
+		break;
+	case GPIOD_LINE_CONFIG_EDGE_BOTH:
+		*flags |= (GPIO_V2_LINE_FLAG_EDGE_FALLING |
+			   GPIO_V2_LINE_FLAG_EDGE_RISING |
+			   GPIO_V2_LINE_FLAG_INPUT);
+		*flags &= ~GPIOD_LINE_CONFIG_DIRECTION_OUTPUT;
+		break;
+	case 0:
+		break;
+	default:
+		goto err_inval;
+	}
+
+	switch (config->drive) {
+	case GPIOD_LINE_CONFIG_DRIVE_OPEN_DRAIN:
+		*flags |= GPIO_V2_LINE_FLAG_OPEN_DRAIN;
+		break;
+	case GPIOD_LINE_CONFIG_DRIVE_OPEN_SOURCE:
+		*flags |= GPIO_V2_LINE_FLAG_OPEN_SOURCE;
+		break;
+	case 0:
+		break;
+	default:
+		goto err_inval;
+	}
+
+	switch (config->bias) {
+	case GPIOD_LINE_CONFIG_BIAS_DISABLED:
+		*flags |= GPIO_V2_LINE_FLAG_BIAS_DISABLED;
+		break;
+	case GPIOD_LINE_CONFIG_BIAS_PULL_UP:
+		*flags |= GPIO_V2_LINE_FLAG_BIAS_PULL_UP;
+		break;
+	case GPIOD_LINE_CONFIG_BIAS_PULL_DOWN:
+		*flags |= GPIO_V2_LINE_FLAG_BIAS_PULL_DOWN;
+		break;
+	case 0:
+		break;
+	default:
+		goto err_inval;
+	}
+
+	if (config->active_low)
+		*flags |= GPIO_V2_LINE_FLAG_ACTIVE_LOW;
+
+	switch (config->clock) {
+	case GPIOD_LINE_CONFIG_CLOCK_REALTIME:
+		*flags |= GPIO_V2_LINE_FLAG_EVENT_CLOCK_REALTIME;
+		break;
+	case GPIOD_LINE_CONFIG_CLOCK_MONOTONIC:
+	case 0:
+		break;
+	default:
+		goto err_inval;
+	}
+
+	return 0;
+
+err_inval:
+	errno = EINVAL;
+	return -1;
+}
+
+static int find_bitmap_index(unsigned int needle, unsigned int num_lines,
+			     const unsigned int *haystack)
+{
+	unsigned int i;
+
+	for (i = 0; i < num_lines; i++) {
+		if (needle == haystack[i])
+			return i;
+	}
+
+	return -1;
+}
+
+static int set_kernel_output_values(uint64_t *mask, uint64_t *vals,
+				    struct gpiod_line_config *config,
+				    unsigned int num_lines,
+				    const unsigned int *offsets)
+{
+	struct output_value *outval;
+	unsigned int i;
+	int idx;
+
+	gpiod_line_mask_zero(mask);
+	gpiod_line_mask_zero(vals);
+
+	for (i = 0; i < config->num_output_values; i++) {
+		outval = &config->output_values[i];
+
+		idx = find_bitmap_index(outval->offset, num_lines, offsets);
+		if (idx < 0) {
+			errno = EINVAL;
+			return -1;
+		}
+
+		gpiod_line_mask_set_bit(mask, idx);
+		gpiod_line_mask_assign_bit(vals, idx, !!outval->value);
+	}
+
+	return 0;
+}
+
+static int set_secondary_mask(uint64_t *mask,
+			      struct secondary_config *sec_cfg,
+			      unsigned int num_lines,
+			      const unsigned int *offsets)
+{
+	unsigned int i;
+	int idx;
+
+	gpiod_line_mask_zero(mask);
+
+	for (i = 0; i < sec_cfg->num_offsets; i++) {
+		idx = find_bitmap_index(sec_cfg->offsets[i],
+					num_lines, offsets);
+		if (idx < 0) {
+			errno = EINVAL;
+			return -1;
+		}
+
+		gpiod_line_mask_set_bit(mask, idx);
+	}
+
+	return 0;
+}
+
+int gpiod_line_config_to_kernel(struct gpiod_line_config *config,
+				struct gpio_v2_line_config *cfgbuf,
+				unsigned int num_lines,
+				const unsigned int *offsets)
+{
+	struct gpio_v2_line_config_attribute *attr;
+	struct secondary_config *sec_cfg;
+	unsigned int attr_idx = 0, i;
+	uint64_t mask, values, flags;
+	int ret;
+
+	if (!config) {
+		cfgbuf->flags = GPIO_V2_LINE_FLAG_INPUT;
+		return 0;
+	}
+
+	if (config->too_complex)
+		goto err_2big;
+
+	if (config->num_output_values) {
+		if (config->num_output_values > num_lines)
+			goto err_2big;
+
+		attr = &cfgbuf->attrs[attr_idx++];
+		attr->attr.id = GPIO_V2_LINE_ATTR_ID_OUTPUT_VALUES;
+
+		ret = set_kernel_output_values(&mask, &values, config,
+					       num_lines, offsets);
+		if (ret)
+			return ret;
+
+		attr->attr.values = values;
+		attr->mask = mask;
+	}
+
+	if (config->primary.debounce_period) {
+		attr = &cfgbuf->attrs[attr_idx++];
+		attr->attr.id = GPIO_V2_LINE_ATTR_ID_DEBOUNCE;
+		attr->attr.debounce_period_us = config->primary.debounce_period;
+		gpiod_line_mask_fill(&mask);
+		attr->mask = mask;
+	}
+
+	for (i = 0; i < config->num_secondary; i++, attr_idx++) {
+		if (attr_idx == GPIO_V2_LINE_NUM_ATTRS_MAX)
+			goto err_2big;
+
+		sec_cfg = &config->secondary[i];
+		attr = &cfgbuf->attrs[attr_idx];
+
+		if (sec_cfg->num_offsets > num_lines)
+			goto err_2big;
+
+		if (sec_cfg->debounce_period) {
+			attr->attr.id = GPIO_V2_LINE_ATTR_ID_DEBOUNCE;
+			attr->attr.debounce_period_us =
+					sec_cfg->debounce_period;
+		} else {
+			attr->attr.id = GPIO_V2_LINE_ATTR_ID_FLAGS;
+
+			ret = gpiod_make_kernel_flags(&flags, &sec_cfg->config);
+			if (ret)
+				return -1;
+
+			attr->attr.flags = flags;
+		}
+
+		ret = set_secondary_mask(&mask, sec_cfg, num_lines, offsets);
+		if (ret)
+			return -1;
+
+		attr->mask = mask;
+	}
+
+	ret = gpiod_make_kernel_flags(&flags, &config->primary);
+	if (ret)
+		return -1;
+
+	cfgbuf->flags = flags;
+	cfgbuf->num_attrs = attr_idx;
+
+	return 0;
+
+err_2big:
+	config->too_complex = true;
+	errno = E2BIG;
+	return -1;
+}
diff --git a/lib/line-info.c b/lib/line-info.c
new file mode 100644
index 0000000..06318d9
--- /dev/null
+++ b/lib/line-info.c
@@ -0,0 +1,164 @@
+// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-FileCopyrightText: 2021 Bartosz Golaszewski <brgl@bgdev.pl>
+
+#include <gpiod.h>
+#include <stdlib.h>
+#include <string.h>
+
+#include "internal.h"
+
+struct gpiod_line_info {
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
+GPIOD_API void gpiod_line_info_free(struct gpiod_line_info *info)
+{
+	free(info);
+}
+
+GPIOD_API unsigned int gpiod_line_info_get_offset(struct gpiod_line_info *info)
+{
+	return info->offset;
+}
+
+GPIOD_API const char *gpiod_line_info_get_name(struct gpiod_line_info *info)
+{
+	return info->name[0] == '\0' ? NULL : info->name;
+}
+
+GPIOD_API bool gpiod_line_info_is_used(struct gpiod_line_info *info)
+{
+	return info->used;
+}
+
+GPIOD_API const char *gpiod_line_info_get_consumer(struct gpiod_line_info *info)
+{
+	return info->consumer[0] == '\0' ? NULL : info->consumer;
+}
+
+GPIOD_API int gpiod_line_info_get_direction(struct gpiod_line_info *info)
+{
+	return info->direction;
+}
+
+GPIOD_API bool gpiod_line_info_is_active_low(struct gpiod_line_info *info)
+{
+	return info->active_low;
+}
+
+GPIOD_API int gpiod_line_info_get_bias(struct gpiod_line_info *info)
+{
+	return info->bias;
+}
+
+GPIOD_API int gpiod_line_info_get_drive(struct gpiod_line_info *info)
+{
+	return info->drive;
+}
+
+GPIOD_API int gpiod_line_info_get_edge_detection(struct gpiod_line_info *info)
+{
+	return info->edge;
+}
+
+GPIOD_API bool gpiod_line_info_is_debounced(struct gpiod_line_info *info)
+{
+	return info->debounced;
+}
+
+GPIOD_API unsigned long
+gpiod_line_info_get_debounce_period(struct gpiod_line_info *info)
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
+
+struct gpiod_line_info *gpiod_line_info_copy(struct gpiod_line_info *info)
+{
+	struct gpiod_line_info *new_info;
+
+	new_info = malloc(sizeof(*new_info));
+	if (!new_info)
+		return NULL;
+
+	memcpy(new_info, info, sizeof(*new_info));
+	return new_info;
+}
diff --git a/lib/line-request.c b/lib/line-request.c
new file mode 100644
index 0000000..1c88df6
--- /dev/null
+++ b/lib/line-request.c
@@ -0,0 +1,192 @@
+// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-FileCopyrightText: 2021 Bartosz Golaszewski <brgl@bgdev.pl>
+
+/* Line attribute data structure and functions. */
+
+#include <errno.h>
+#include <gpiod.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/ioctl.h>
+#include <unistd.h>
+
+#include "internal.h"
+
+struct gpiod_line_request {
+	unsigned int offsets[GPIO_V2_LINES_MAX];
+	unsigned int num_lines;
+	int fd;
+};
+
+struct gpiod_line_request *
+gpiod_line_request_from_kernel(struct gpio_v2_line_request *reqbuf)
+{
+	struct gpiod_line_request *request;
+
+	request = malloc(sizeof(*request));
+	if (!request)
+		return NULL;
+
+	memset(request, 0, sizeof(*request));
+	request->fd = reqbuf->fd;
+	request->num_lines = reqbuf->num_lines;
+	memcpy(request->offsets, reqbuf->offsets,
+	       sizeof(*request->offsets) * request->num_lines);
+
+	return request;
+}
+
+GPIOD_API void gpiod_line_request_release(struct gpiod_line_request *request)
+{
+	close(request->fd);
+	free(request);
+}
+
+GPIOD_API int gpiod_line_request_get_value(struct gpiod_line_request *request,
+					   unsigned int offset)
+{
+	unsigned int ret;
+	int val;
+
+	ret = gpiod_line_request_get_values(request, 1, &offset, &val);
+	if (ret)
+		return -1;
+
+	return val;
+}
+
+static int offset_to_bit(struct gpiod_line_request *request,
+			 unsigned int offset)
+{
+	unsigned int i;
+
+	for (i = 0; i < request->num_lines; i++) {
+		if (offset == request->offsets[i])
+			return i;
+	}
+
+	return -1;
+}
+
+GPIOD_API int gpiod_line_request_get_values(struct gpiod_line_request *request,
+					    unsigned num_lines,
+					    const unsigned int *offsets,
+					    int *values)
+{
+	struct gpio_v2_line_values buf;
+	uint64_t mask = 0, bits = 0;
+	unsigned int i, j, off;
+	int bit, ret;
+
+	buf.bits = 0;
+
+	for (i = 0; i < num_lines; i++) {
+		bit = offset_to_bit(request, offsets[i]);
+		if (bit < 0) {
+			errno = EINVAL;
+			return -1;
+		}
+
+		gpiod_line_mask_set_bit(&mask, bit);
+	}
+
+	buf.mask = mask;
+
+	ret = ioctl(request->fd, GPIO_V2_LINE_GET_VALUES_IOCTL, &buf);
+	if (ret)
+		return -1;
+
+	bits = buf.bits;
+	memset(values, 0, sizeof(*values) * num_lines);
+
+	for (i = 0; i < num_lines; i++) {
+		if (!gpiod_line_mask_test_bit(&mask, i))
+			continue;
+
+		off = request->offsets[i];
+
+		for (j = 0; j < num_lines; j++) {
+			if (off != offsets[j])
+				continue;
+
+			values[j] = gpiod_line_mask_test_bit(&bits, i) ? 1 : 0;
+		}
+	}
+
+	return 0;
+}
+
+GPIOD_API int gpiod_line_request_set_value(struct gpiod_line_request *request,
+					   unsigned int offset, int value)
+{
+	return gpiod_line_request_set_values(request, 1, &offset, &value);
+}
+
+GPIOD_API int gpiod_line_request_set_values(struct gpiod_line_request *request,
+					    unsigned int num_lines,
+					    const unsigned int *offsets,
+					    const int *values)
+{
+	struct gpio_v2_line_values buf;
+	uint64_t mask = 0, bits = 0;
+	unsigned int i;
+	int bit;
+
+	for (i = 0; i < num_lines; i++) {
+		bit = offset_to_bit(request, offsets[i]);
+		if (bit < 0) {
+			errno = EINVAL;
+			return -1;
+		}
+
+		gpiod_line_mask_set_bit(&mask, bit);
+		gpiod_line_mask_assign_bit(&bits, bit, values[i]);
+	}
+
+	memset(&buf, 0, sizeof(buf));
+	buf.mask = mask;
+	buf.bits = bits;
+
+	return ioctl(request->fd, GPIO_V2_LINE_SET_VALUES_IOCTL, &buf);
+}
+
+GPIOD_API int
+gpiod_line_request_reconfigure_lines(struct gpiod_line_request *request,
+				     struct gpiod_line_config *config)
+{
+	struct gpio_v2_line_config cfgbuf;
+	int ret;
+
+	memset(&cfgbuf, 0, sizeof(cfgbuf));
+
+	ret = gpiod_line_config_to_kernel(config, &cfgbuf,
+					  request->num_lines, request->offsets);
+	if (ret)
+		return ret;
+
+	ret = ioctl(request->fd, GPIO_V2_LINE_GET_VALUES_IOCTL, &cfgbuf);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+GPIOD_API int gpiod_line_request_get_fd(struct gpiod_line_request *request)
+{
+	return request->fd;
+}
+
+GPIOD_API int
+gpiod_line_request_edge_event_wait(struct gpiod_line_request *request,
+				   uint64_t timeout)
+{
+	return gpiod_poll_fd(request->fd, timeout);
+}
+
+GPIOD_API int
+gpiod_line_request_edge_event_read(struct gpiod_line_request *request,
+				   struct gpiod_edge_event_buffer *buffer,
+				   unsigned int max_events)
+{
+	return gpiod_edge_event_buffer_read_fd(request->fd, buffer, max_events);
+}
diff --git a/lib/misc.c b/lib/misc.c
index 984405b..87f8036 100644
--- a/lib/misc.c
+++ b/lib/misc.c
@@ -3,10 +3,73 @@
 
 /* Misc code that didn't fit anywhere else. */
 
+#include <errno.h>
 #include <gpiod.h>
+#include <stdint.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/stat.h>
+#include <sys/sysmacros.h>
+#include <sys/types.h>
+#include <unistd.h>
 
 #include "internal.h"
 
+GPIOD_API bool gpiod_is_gpiochip_device(const char *path)
+{
+	char *realname, *sysfsp, devpath[64];
+	struct stat statbuf;
+	bool ret = false;
+	int rv;
+
+	rv = lstat(path, &statbuf);
+	if (rv)
+		goto out;
+
+	/*
+	 * Is it a symbolic link? We have to resolve it before checking
+	 * the rest.
+	 */
+	realname = S_ISLNK(statbuf.st_mode) ? realpath(path, NULL)
+					    : strdup(path);
+	if (realname == NULL)
+		goto out;
+
+	rv = stat(realname, &statbuf);
+	if (rv)
+		goto out_free_realname;
+
+	/* Is it a character device? */
+	if (!S_ISCHR(statbuf.st_mode)) {
+		errno = ENOTTY;
+		goto out_free_realname;
+	}
+
+	/* Is the device associated with the GPIO subsystem? */
+	snprintf(devpath, sizeof(devpath), "/sys/dev/char/%u:%u/subsystem",
+		 major(statbuf.st_rdev), minor(statbuf.st_rdev));
+
+	sysfsp = realpath(devpath, NULL);
+	if (!sysfsp)
+		goto out_free_realname;
+
+	if (strcmp(sysfsp, "/sys/bus/gpio") != 0) {
+		/* This is a character device but not the one we're after. */
+		errno = ENODEV;
+		goto out_free_sysfsp;
+	}
+
+	ret = true;
+
+out_free_sysfsp:
+	free(sysfsp);
+out_free_realname:
+	free(realname);
+out:
+	return ret;
+}
+
 GPIOD_API const char *gpiod_version_string(void)
 {
 	return GPIOD_VERSION_STR;
diff --git a/lib/request-config.c b/lib/request-config.c
new file mode 100644
index 0000000..ff8e99f
--- /dev/null
+++ b/lib/request-config.c
@@ -0,0 +1,78 @@
+// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-FileCopyrightText: 2021 Bartosz Golaszewski <brgl@bgdev.pl>
+
+/* Line configuration data structure and functions. */
+
+#include <errno.h>
+#include <gpiod.h>
+#include <stdlib.h>
+#include <string.h>
+
+#include "internal.h"
+
+struct gpiod_request_config {
+	char consumer[GPIO_MAX_NAME_SIZE];
+	unsigned int offsets[GPIO_V2_LINES_MAX];
+	unsigned int num_lines;
+	unsigned int event_buffer_size;
+};
+
+GPIOD_API struct gpiod_request_config *gpiod_request_config_new(void)
+{
+	struct gpiod_request_config *config;
+
+	config = malloc(sizeof(*config));
+	if (!config)
+		return NULL;
+
+	memset(config, 0, sizeof(*config));
+
+	return config;
+}
+
+GPIOD_API void gpiod_request_config_free(struct gpiod_request_config *config)
+{
+	free(config);
+}
+
+GPIOD_API void
+gpiod_request_config_set_consumer(struct gpiod_request_config *config,
+				  const char *consumer)
+{
+	strncpy(config->consumer, consumer, GPIO_MAX_NAME_SIZE - 1);
+	config->consumer[GPIO_MAX_NAME_SIZE - 1] = '\0';
+}
+
+GPIOD_API void
+gpiod_request_config_set_offsets(struct gpiod_request_config *config,
+				 unsigned int num_lines,
+				 unsigned int *offsets)
+{
+	unsigned int i;
+
+	config->num_lines = num_lines > GPIO_V2_LINES_MAX ? GPIO_V2_LINES_MAX
+							  : num_lines;
+
+	for (i = 0; i < config->num_lines; i++)
+		config->offsets[i] = offsets[i];
+}
+
+GPIOD_API void
+gpiod_request_config_set_event_buffer_size(struct gpiod_request_config *config,
+					   unsigned int event_buffer_size)
+{
+	config->event_buffer_size = event_buffer_size;
+}
+
+void gpiod_request_config_to_kernel(struct gpiod_request_config *config,
+				    struct gpio_v2_line_request *reqbuf)
+{
+	unsigned int i;
+
+	for (i = 0; i < config->num_lines; i++)
+		reqbuf->offsets[i] = config->offsets[i];
+
+	reqbuf->num_lines = config->num_lines;
+	strcpy(reqbuf->consumer, config->consumer);
+	reqbuf->event_buffer_size = config->event_buffer_size;
+}
diff --git a/tools/gpio-tools-test.bats b/tools/gpio-tools-test.bats
index a5b97e1..e1b79b4 100755
--- a/tools/gpio-tools-test.bats
+++ b/tools/gpio-tools-test.bats
@@ -370,7 +370,7 @@ teardown() {
 	run_tool gpioget "$(gpio_mockup_chip_name 1)" 0 1 2 3 4
 
 	test "$status" -eq "1"
-	output_regex_match ".*unable to retrieve GPIO lines from chip"
+	output_regex_match ".*unable to request lines.*"
 }
 
 @test "gpioget: same line twice" {
@@ -379,7 +379,7 @@ teardown() {
 	run_tool gpioget "$(gpio_mockup_chip_name 1)" 0 0
 
 	test "$status" -eq "1"
-	output_regex_match ".*unable to request lines.*"
+	output_regex_match ".*unable to request lines"
 }
 
 @test "gpioget: invalid bias" {
@@ -578,7 +578,7 @@ teardown() {
 	run_tool gpioset "$(gpio_mockup_chip_name 1)" 0=1 1=1 2=1 3=1 4=1 5=1
 
 	test "$status" -eq "1"
-	output_regex_match ".*unable to retrieve GPIO lines from chip"
+	output_regex_match ".*unable to request lines.*"
 }
 
 @test "gpioset: use --sec without --mode=time" {
@@ -667,7 +667,7 @@ teardown() {
 	run_tool gpioset "$(gpio_mockup_chip_name 1)" 0=1 0=1
 
 	test "$status" -eq "1"
-	output_regex_match ".*unable to request lines.*"
+	output_regex_match ".*unable to request lines"
 }
 
 #
@@ -887,7 +887,7 @@ teardown() {
 	run_tool gpiomon "$(gpio_mockup_chip_name 1)" 0 0
 
 	test "$status" -eq "1"
-	output_regex_match ".*unable to request GPIO lines for events"
+	output_regex_match ".*unable to request lines"
 }
 
 @test "gpiomon: no arguments" {
@@ -912,7 +912,7 @@ teardown() {
 	run_tool gpiomon "$(gpio_mockup_chip_name 0)" 5
 
 	test "$status" -eq "1"
-	output_regex_match ".*unable to retrieve GPIO lines from chip"
+	output_regex_match ".*unable to request lines"
 }
 
 @test "gpiomon: invalid bias" {
diff --git a/tools/gpiodetect.c b/tools/gpiodetect.c
index 10706e2..9047091 100644
--- a/tools/gpiodetect.c
+++ b/tools/gpiodetect.c
@@ -6,6 +6,7 @@
 #include <getopt.h>
 #include <gpiod.h>
 #include <stdio.h>
+#include <stdlib.h>
 #include <string.h>
 
 #include "tools-common.h"
@@ -66,21 +67,15 @@ int main(int argc, char **argv)
 
 	for (i = 0; i < num_chips; i++) {
 		chip = chip_open_by_name(entries[i]->d_name);
-		if (!chip) {
-			if (errno == EACCES)
-				printf("%s Permission denied\n",
-				       entries[i]->d_name);
-			else
-				die_perror("unable to open %s",
-					   entries[i]->d_name);
-		}
+		if (!chip)
+			die_perror("unable to open %s", entries[i]->d_name);
 
 		printf("%s [%s] (%u lines)\n",
 		       gpiod_chip_get_name(chip),
 		       gpiod_chip_get_label(chip),
 		       gpiod_chip_get_num_lines(chip));
 
-		gpiod_chip_unref(chip);
+		gpiod_chip_close(chip);
 		free(entries[i]);
 	}
 
diff --git a/tools/gpiofind.c b/tools/gpiofind.c
index 32b7852..910cb8b 100644
--- a/tools/gpiofind.c
+++ b/tools/gpiofind.c
@@ -6,6 +6,7 @@
 #include <getopt.h>
 #include <gpiod.h>
 #include <stdio.h>
+#include <stdlib.h>
 #include <string.h>
 
 #include "tools-common.h"
@@ -77,7 +78,7 @@ int main(int argc, char **argv)
 		if (offset >= 0) {
 			printf("%s %u\n",
 			       gpiod_chip_get_name(chip), offset);
-			gpiod_chip_unref(chip);
+			gpiod_chip_close(chip);
 			return EXIT_SUCCESS;
 		}
 	}
diff --git a/tools/gpioget.c b/tools/gpioget.c
index 51cecb6..e0c630d 100644
--- a/tools/gpioget.c
+++ b/tools/gpioget.c
@@ -5,6 +5,7 @@
 #include <gpiod.h>
 #include <limits.h>
 #include <stdio.h>
+#include <stdlib.h>
 #include <string.h>
 
 #include "tools-common.h"
@@ -40,12 +41,14 @@ static void print_help(void)
 
 int main(int argc, char **argv)
 {
-	int request_type = GPIOD_LINE_REQUEST_DIRECTION_INPUT;
-	struct gpiod_line_request_config config;
-	int *values, optc, opti, rv, flags = 0;
+	int direction = GPIOD_LINE_CONFIG_DIRECTION_INPUT;
+	int optc, opti, bias = 0, ret, *values;
+	struct gpiod_request_config *req_cfg;
 	unsigned int *offsets, i, num_lines;
-	struct gpiod_line_bulk *lines;
+	struct gpiod_line_request *request;
+	struct gpiod_line_config *line_cfg;
 	struct gpiod_chip *chip;
+	bool active_low = false;
 	char *device, *end;
 
 	for (;;) {
@@ -61,13 +64,13 @@ int main(int argc, char **argv)
 			print_version();
 			return EXIT_SUCCESS;
 		case 'l':
-			flags |= GPIOD_LINE_REQUEST_FLAG_ACTIVE_LOW;
+			active_low = true;
 			break;
 		case 'n':
-			request_type = GPIOD_LINE_REQUEST_DIRECTION_AS_IS;
+			direction = GPIOD_LINE_CONFIG_DIRECTION_AS_IS;
 			break;
 		case 'B':
-			flags |= bias_flags(optarg);
+			bias = parse_bias(optarg);
 			break;
 		case '?':
 			die("try %s --help", get_progname());
@@ -88,9 +91,9 @@ int main(int argc, char **argv)
 	device = argv[0];
 	num_lines = argc - 1;
 
-	values = malloc(sizeof(*values) * num_lines);
-	offsets = malloc(sizeof(*offsets) * num_lines);
-	if (!values || !offsets)
+	offsets = calloc(num_lines, sizeof(*offsets));
+	values = calloc(num_lines, sizeof(*values));
+	if (!offsets || ! values)
 		die("out of memory");
 
 	for (i = 0; i < num_lines; i++) {
@@ -103,23 +106,33 @@ int main(int argc, char **argv)
 	if (!chip)
 		die_perror("unable to open %s", device);
 
-	lines = gpiod_chip_get_lines(chip, offsets, num_lines);
-	if (!lines)
-		die_perror("unable to retrieve GPIO lines from chip");
+	line_cfg = gpiod_line_config_new();
+	if (!line_cfg)
+		die_perror("unable to allocate the line config structure");
 
-	memset(&config, 0, sizeof(config));
+	gpiod_line_config_set_direction(line_cfg, direction);
 
-	config.consumer = "gpioget";
-	config.request_type = request_type;
-	config.flags = flags;
+	if (bias)
+		gpiod_line_config_set_bias(line_cfg, bias);
 
-	rv = gpiod_line_request_bulk(lines, &config, NULL);
-	if (rv)
+	if (active_low)
+		gpiod_line_config_set_active_low(line_cfg);
+
+	req_cfg = gpiod_request_config_new();
+	if (!req_cfg)
+		die_perror("unable to allocate the request config structure");
+
+	gpiod_request_config_set_consumer(req_cfg, "gpioget");
+	gpiod_request_config_set_offsets(req_cfg, num_lines, offsets);
+
+	request = gpiod_chip_request_lines(chip, req_cfg, line_cfg);
+	if (!request)
 		die_perror("unable to request lines");
 
-	rv = gpiod_line_get_value_bulk(lines, values);
-	if (rv < 0)
-		die_perror("error reading GPIO values");
+	ret = gpiod_line_request_get_values(request, num_lines,
+					    offsets, values);
+	if (ret)
+		die_perror("unable to read GPIO line values");
 
 	for (i = 0; i < num_lines; i++) {
 		printf("%d", values[i]);
@@ -128,11 +141,12 @@ int main(int argc, char **argv)
 	}
 	printf("\n");
 
-	gpiod_line_release_bulk(lines);
-	gpiod_chip_unref(chip);
-	gpiod_line_bulk_free(lines);
-	free(values);
+	gpiod_line_request_release(request);
+	gpiod_request_config_free(req_cfg);
+	gpiod_line_config_free(line_cfg);
+	gpiod_chip_close(chip);
 	free(offsets);
+	free(values);
 
 	return EXIT_SUCCESS;
 }
diff --git a/tools/gpioinfo.c b/tools/gpioinfo.c
index 3d89111..cd2b9e4 100644
--- a/tools/gpioinfo.c
+++ b/tools/gpioinfo.c
@@ -7,46 +7,47 @@
 #include <gpiod.h>
 #include <stdarg.h>
 #include <stdio.h>
+#include <stdlib.h>
 #include <string.h>
 
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
+	return gpiod_line_info_get_bias(info) == GPIOD_LINE_BIAS_PULL_UP;
 }
 
-static bool line_bias_is_pulldown(struct gpiod_line *line)
+static bool line_bias_is_pulldown(struct gpiod_line_info *info)
 {
-	return gpiod_line_bias(line) == GPIOD_LINE_BIAS_PULL_DOWN;
+	return gpiod_line_info_get_bias(info) == GPIOD_LINE_BIAS_PULL_DOWN;
 }
 
-static bool line_bias_is_disabled(struct gpiod_line *line)
+static bool line_bias_is_disabled(struct gpiod_line_info *info)
 {
-	return gpiod_line_bias(line) == GPIOD_LINE_BIAS_DISABLED;
+	return gpiod_line_info_get_bias(info) == GPIOD_LINE_BIAS_DISABLED;
 }
 
-static bool line_drive_is_open_drain(struct gpiod_line *line)
+static bool line_drive_is_open_drain(struct gpiod_line_info *info)
 {
-	return gpiod_line_drive(line) == GPIOD_LINE_DRIVE_OPEN_DRAIN;
+	return gpiod_line_info_get_drive(info) == GPIOD_LINE_DRIVE_OPEN_DRAIN;
 }
 
-static bool line_drive_is_open_source(struct gpiod_line *line)
+static bool line_drive_is_open_source(struct gpiod_line_info *info)
 {
-	return gpiod_line_drive(line) == GPIOD_LINE_DRIVE_OPEN_SOURCE;
+	return gpiod_line_info_get_drive(info) == GPIOD_LINE_DRIVE_OPEN_SOURCE;
 }
 
 static const struct flag flags[] = {
 	{
 		.name = "used",
-		.is_set = gpiod_line_is_used,
+		.is_set = gpiod_line_info_is_used,
 	},
 	{
 		.name = "open-drain",
@@ -124,8 +125,8 @@ static PRINTF(3, 4) void prinfo(bool *of,
 static void list_lines(struct gpiod_chip *chip)
 {
 	bool flag_printed, of, active_low;
+	struct gpiod_line_info *info;
 	const char *name, *consumer;
-	struct gpiod_line *line;
 	unsigned int i, offset;
 	int direction;
 
@@ -133,14 +134,14 @@ static void list_lines(struct gpiod_chip *chip)
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
+		name = gpiod_line_info_get_name(info);
+		consumer = gpiod_line_info_get_consumer(info);
+		direction = gpiod_line_info_get_direction(info);
+		active_low = gpiod_line_info_is_active_low(info);
 
 		of = false;
 
@@ -152,7 +153,7 @@ static void list_lines(struct gpiod_chip *chip)
 		     : prinfo(&of, 12, "unnamed");
 		printf(" ");
 
-		if (!gpiod_line_is_used(line))
+		if (!gpiod_line_info_is_used(info))
 			prinfo(&of, 12, "unused");
 		else
 			consumer ? prinfo(&of, 12, "\"%s\"", consumer)
@@ -167,7 +168,7 @@ static void list_lines(struct gpiod_chip *chip)
 
 		flag_printed = false;
 		for (i = 0; i < ARRAY_SIZE(flags); i++) {
-			if (flags[i].is_set(line)) {
+			if (flags[i].is_set(info)) {
 				if (flag_printed)
 					printf(" ");
 				else
@@ -180,6 +181,8 @@ static void list_lines(struct gpiod_chip *chip)
 			printf("]");
 
 		printf("\n");
+
+		gpiod_line_info_free(info);
 	}
 }
 
@@ -219,18 +222,13 @@ int main(int argc, char **argv)
 
 		for (i = 0; i < num_chips; i++) {
 			chip = chip_open_by_name(entries[i]->d_name);
-			if (!chip) {
-				if (errno == EACCES)
-					printf("%s Permission denied\n",
-					       entries[i]->d_name);
-				else
-					die_perror("unable to open %s",
-						   entries[i]->d_name);
-			}
+			if (!chip)
+				die_perror("unable to open %s",
+					   entries[i]->d_name);
 
 			list_lines(chip);
 
-			gpiod_chip_unref(chip);
+			gpiod_chip_close(chip);
 		}
 	} else {
 		for (i = 0; i < argc; i++) {
@@ -240,7 +238,7 @@ int main(int argc, char **argv)
 
 			list_lines(chip);
 
-			gpiod_chip_unref(chip);
+			gpiod_chip_close(chip);
 		}
 	}
 
diff --git a/tools/gpiomon.c b/tools/gpiomon.c
index dda9f6f..8f07596 100644
--- a/tools/gpiomon.c
+++ b/tools/gpiomon.c
@@ -8,11 +8,14 @@
 #include <poll.h>
 #include <signal.h>
 #include <stdio.h>
+#include <stdlib.h>
 #include <string.h>
 #include <unistd.h>
 
 #include "tools-common.h"
 
+#define EVENT_BUF_SIZE 32
+
 static const struct option longopts[] = {
 	{ "help",		no_argument,		NULL,	'h' },
 	{ "version",		no_argument,		NULL,	'v' },
@@ -64,10 +67,8 @@ struct mon_ctx {
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
 
@@ -94,10 +95,10 @@ static void event_print_custom(unsigned int offset,
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
@@ -119,8 +120,7 @@ end:
 }
 
 static void event_print_human_readable(unsigned int offset,
-				       const struct timespec *ts,
-				       int event_type)
+				       uint64_t timeout, int event_type)
 {
 	char *evname;
 
@@ -130,11 +130,11 @@ static void event_print_human_readable(unsigned int offset,
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
@@ -153,19 +153,19 @@ static void handle_signal(int signum UNUSED)
 
 int main(int argc, char **argv)
 {
-	unsigned int offsets[64], num_lines = 0, offset,
-		     events_wanted = 0, events_done = 0, x;
-	bool watch_rising = false, watch_falling = false;
-	int flags = 0;
-	struct timespec timeout = { 10, 0 };
-	int optc, opti, rv, i, y, event_type;
-	struct mon_ctx ctx;
+	unsigned int offsets[64], num_lines = 0, offset, events_wanted = 0,
+		     events_done = 0;
+	bool watch_rising = false, watch_falling = false, active_low = false;
+	struct gpiod_edge_event_buffer *event_buffer;
+	int optc, opti, ret, i, edge, bias = 0;
+	uint64_t timeout = 10 * 1000000000LLU;
+	struct gpiod_request_config *req_cfg;
+	struct gpiod_line_request *request;
+	struct gpiod_line_config *line_cfg;
+	struct gpiod_edge_event *event;
 	struct gpiod_chip *chip;
-	struct gpiod_line_bulk *lines, *evlines;
+	struct mon_ctx ctx;
 	char *end;
-	struct gpiod_line_request_config config;
-	struct gpiod_line *line;
-	struct gpiod_line_event events[16];
 
 	/*
 	 * FIXME: use signalfd once the API has been converted to using a single file
@@ -189,10 +189,10 @@ int main(int argc, char **argv)
 			print_version();
 			return EXIT_SUCCESS;
 		case 'l':
-			flags |= GPIOD_LINE_REQUEST_FLAG_ACTIVE_LOW;
+			active_low = true;
 			break;
 		case 'B':
-			flags |= bias_flags(optarg);
+			bias = parse_bias(optarg);
 			break;
 		case 'n':
 			events_wanted = strtoul(optarg, &end, 10);
@@ -225,11 +225,11 @@ int main(int argc, char **argv)
 	argv += optind;
 
 	if (watch_rising && !watch_falling)
-		event_type = GPIOD_LINE_REQUEST_EVENT_RISING_EDGE;
+		edge = GPIOD_LINE_CONFIG_EDGE_RISING;
 	else if (watch_falling && !watch_rising)
-		event_type = GPIOD_LINE_REQUEST_EVENT_FALLING_EDGE;
+		edge = GPIOD_LINE_CONFIG_EDGE_FALLING;
 	else
-		event_type = GPIOD_LINE_REQUEST_EVENT_BOTH_EDGES;
+		edge = GPIOD_LINE_CONFIG_EDGE_BOTH;
 
 	if (argc < 1)
 		die("gpiochip must be specified");
@@ -253,60 +253,67 @@ int main(int argc, char **argv)
 	if (!chip)
 		die_perror("unable to open %s", argv[0]);
 
-	lines = gpiod_chip_get_lines(chip, offsets, num_lines);
-	if (!lines)
-		die_perror("unable to retrieve GPIO lines from chip");
+	line_cfg = gpiod_line_config_new();
+	if (!line_cfg)
+		die_perror("unable to allocate the line config structure");
+
+	if (bias)
+		gpiod_line_config_set_bias(line_cfg, bias);
+	if (active_low)
+		gpiod_line_config_set_active_low(line_cfg);
+	gpiod_line_config_set_edge_detection(line_cfg, edge);
 
-	memset(&config, 0, sizeof(config));
+	req_cfg = gpiod_request_config_new();
+	if (!req_cfg)
+		die_perror("unable to allocate the request config structure");
 
-	config.consumer = "gpiomon";
-	config.request_type = event_type;
-	config.flags = flags;
+	gpiod_request_config_set_consumer(req_cfg, "gpiomon");
+	gpiod_request_config_set_offsets(req_cfg, num_lines, offsets);
 
-	rv = gpiod_line_request_bulk(lines, &config, NULL);
-	if (rv)
-		die_perror("unable to request GPIO lines for events");
+	request = gpiod_chip_request_lines(chip, req_cfg, line_cfg);
+	if (!request)
+		die_perror("unable to request lines");
 
-	evlines = gpiod_line_bulk_new(num_lines);
-	if (!evlines)
-		die("out of memory");
+	event_buffer = gpiod_edge_event_buffer_new(EVENT_BUF_SIZE);
+	if (!event_buffer)
+		die_perror("unable to allocate the line event buffer");
 
 	for (;;) {
-		gpiod_line_bulk_reset(evlines);
-		rv = gpiod_line_event_wait_bulk(lines, &timeout, evlines);
-		if (rv < 0)
+		ret = gpiod_line_request_edge_event_wait(request, timeout);
+		if (ret < 0)
 			die_perror("error waiting for events");
-		if (rv == 0)
+		if (ret == 0)
 			continue;
 
-		num_lines = gpiod_line_bulk_num_lines(evlines);
+		ret = gpiod_line_request_edge_event_read(request, event_buffer,
+							 EVENT_BUF_SIZE);
+		if (ret < 0)
+			die_perror("error reading line events");
 
-		for (x = 0; x < num_lines; x++) {
-			line = gpiod_line_bulk_get_line(evlines, x);
+		for (i = 0; i < ret; i++) {
+			event = gpiod_edge_event_buffer_peek_event(event_buffer,
+								   i);
+			if (!event)
+				die_perror("unable to retrieve the event from the buffer");
 
-			rv = gpiod_line_event_read_multiple(line, events,
-							    ARRAY_SIZE(events));
-			if (rv < 0)
-				die_perror("error reading line events");
+			handle_event(gpiod_edge_event_get_line_offset(event),
+				     gpiod_edge_event_get_event_type(event),
+				     gpiod_edge_event_get_timestamp(event),
+				     &ctx);
 
-			for (y = 0; y < rv; y++) {
-				handle_event(gpiod_line_offset(line),
-					     events[y].event_type,
-					     &events[y].ts, &ctx);
-				events_done++;
+			events_done++;
 
-				if (events_wanted &&
-				    events_done >= events_wanted)
-					goto done;
-			}
+			if (events_wanted && events_done >= events_wanted)
+				goto done;
 		}
 	}
 
 done:
-	gpiod_line_release_bulk(lines);
-	gpiod_line_bulk_free(lines);
-	gpiod_line_bulk_free(evlines);
-	gpiod_chip_unref(chip);
+	gpiod_edge_event_buffer_free(event_buffer);
+	gpiod_line_request_release(request);
+	gpiod_request_config_free(req_cfg);
+	gpiod_line_config_free(line_cfg);
+	gpiod_chip_close(chip);
 
 	return EXIT_SUCCESS;
 }
diff --git a/tools/gpioset.c b/tools/gpioset.c
index 7882b53..bf90087 100644
--- a/tools/gpioset.c
+++ b/tools/gpioset.c
@@ -7,6 +7,7 @@
 #include <limits.h>
 #include <poll.h>
 #include <stdio.h>
+#include <stdlib.h>
 #include <string.h>
 #include <sys/select.h>
 #include <unistd.h>
@@ -175,12 +176,12 @@ static const struct mode_mapping *parse_mode(const char *mode)
 	return NULL;
 }
 
-static int drive_flags(const char *option)
+static int parse_drive(const char *option)
 {
 	if (strcmp(option, "open-drain") == 0)
-		return GPIOD_LINE_REQUEST_FLAG_OPEN_DRAIN;
+		return GPIOD_LINE_CONFIG_DRIVE_OPEN_DRAIN;
 	if (strcmp(option, "open-source") == 0)
-		return GPIOD_LINE_REQUEST_FLAG_OPEN_SOURCE;
+		return GPIOD_LINE_CONFIG_DRIVE_OPEN_SOURCE;
 	if (strcmp(option, "push-pull") != 0)
 		die("invalid drive: %s", option);
 	return 0;
@@ -189,12 +190,14 @@ static int drive_flags(const char *option)
 int main(int argc, char **argv)
 {
 	const struct mode_mapping *mode = &modes[MODE_EXIT];
-	struct gpiod_line_request_config config;
-	int *values, rv, optc, opti, flags = 0;
+	int ret, optc, opti, bias = 0, drive = 0, *values;
+	struct gpiod_request_config *req_cfg;
 	unsigned int *offsets, num_lines, i;
-	struct gpiod_line_bulk *lines;
+	struct gpiod_line_request *request;
+	struct gpiod_line_config *line_cfg;
 	struct callback_data cbdata;
 	struct gpiod_chip *chip;
+	bool active_low = false;
 	char *device, *end;
 
 	memset(&cbdata, 0, sizeof(cbdata));
@@ -212,13 +215,13 @@ int main(int argc, char **argv)
 			print_version();
 			return EXIT_SUCCESS;
 		case 'l':
-			flags |= GPIOD_LINE_REQUEST_FLAG_ACTIVE_LOW;
+			active_low = true;
 			break;
 		case 'B':
-			flags |= bias_flags(optarg);
+			bias = parse_bias(optarg);
 			break;
 		case 'D':
-			flags |= drive_flags(optarg);
+			drive = parse_drive(optarg);
 			break;
 		case 'm':
 			mode = parse_mode(optarg);
@@ -267,14 +270,14 @@ int main(int argc, char **argv)
 
 	num_lines = argc - 1;
 
-	offsets = malloc(sizeof(*offsets) * num_lines);
-	values = malloc(sizeof(*values) * num_lines);
-	if (!values || !offsets)
+	offsets = calloc(num_lines, sizeof(*offsets));
+	values = calloc(num_lines, sizeof(*values));
+	if (!offsets)
 		die("out of memory");
 
 	for (i = 0; i < num_lines; i++) {
-		rv = sscanf(argv[i + 1], "%u=%d", &offsets[i], &values[i]);
-		if (rv != 2)
+		ret = sscanf(argv[i + 1], "%u=%d", &offsets[i], &values[i]);
+		if (ret != 2)
 			die("invalid offset<->value mapping: %s", argv[i + 1]);
 
 		if (values[i] != 0 && values[i] != 1)
@@ -288,28 +291,40 @@ int main(int argc, char **argv)
 	if (!chip)
 		die_perror("unable to open %s", device);
 
-	lines = gpiod_chip_get_lines(chip, offsets, num_lines);
-	if (!lines)
-		die_perror("unable to retrieve GPIO lines from chip");
-
-	memset(&config, 0, sizeof(config));
-
-	config.consumer = "gpioset";
-	config.request_type = GPIOD_LINE_REQUEST_DIRECTION_OUTPUT;
-	config.flags = flags;
-
-	rv = gpiod_line_request_bulk(lines, &config, values);
-	if (rv)
+	line_cfg = gpiod_line_config_new();
+	if (!line_cfg)
+		die_perror("unable to allocate the line config structure");
+
+	if (bias)
+		gpiod_line_config_set_bias(line_cfg, bias);
+	if (drive)
+		gpiod_line_config_set_drive(line_cfg, drive);
+	if (active_low)
+		gpiod_line_config_set_active_low(line_cfg);
+	gpiod_line_config_set_direction(line_cfg,
+					GPIOD_LINE_CONFIG_DIRECTION_OUTPUT);
+	gpiod_line_config_set_output_values(line_cfg, num_lines,
+					    offsets, values);
+
+	req_cfg = gpiod_request_config_new();
+	if (!req_cfg)
+		die_perror("unable to allocate the request config structure");
+
+	gpiod_request_config_set_consumer(req_cfg, "gpioset");
+	gpiod_request_config_set_offsets(req_cfg, num_lines, offsets);
+
+	request = gpiod_chip_request_lines(chip, req_cfg, line_cfg);
+	if (!request)
 		die_perror("unable to request lines");
 
 	if (mode->callback)
 		mode->callback(&cbdata);
 
-	gpiod_line_release_bulk(lines);
-	gpiod_chip_unref(chip);
-	gpiod_line_bulk_free(lines);
+	gpiod_line_request_release(request);
+	gpiod_request_config_free(req_cfg);
+	gpiod_line_config_free(line_cfg);
+	gpiod_chip_close(chip);
 	free(offsets);
-	free(values);
 
 	return EXIT_SUCCESS;
 }
diff --git a/tools/tools-common.c b/tools/tools-common.c
index 80087ee..36724d5 100644
--- a/tools/tools-common.c
+++ b/tools/tools-common.c
@@ -57,14 +57,14 @@ void print_version(void)
 	printf("There is NO WARRANTY, to the extent permitted by law.\n");
 }
 
-int bias_flags(const char *option)
+int parse_bias(const char *option)
 {
 	if (strcmp(option, "pull-down") == 0)
-		return GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_DOWN;
+		return GPIOD_LINE_CONFIG_BIAS_PULL_DOWN;
 	if (strcmp(option, "pull-up") == 0)
-		return GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_UP;
+		return GPIOD_LINE_CONFIG_BIAS_PULL_UP;
 	if (strcmp(option, "disable") == 0)
-		return GPIOD_LINE_REQUEST_FLAG_BIAS_DISABLED;
+		return GPIOD_LINE_CONFIG_BIAS_DISABLED;
 	if (strcmp(option, "as-is") != 0)
 		die("invalid bias: %s", option);
 	return 0;
diff --git a/tools/tools-common.h b/tools/tools-common.h
index 5d5b505..f059440 100644
--- a/tools/tools-common.h
+++ b/tools/tools-common.h
@@ -25,7 +25,7 @@ const char *get_progname(void);
 void die(const char *fmt, ...) NORETURN PRINTF(1, 2);
 void die_perror(const char *fmt, ...) NORETURN PRINTF(1, 2);
 void print_version(void);
-int bias_flags(const char *option);
+int parse_bias(const char *option);
 void print_bias_help(void);
 int make_signalfd(void);
 int chip_dir_filter(const struct dirent *entry);
-- 
2.30.1

