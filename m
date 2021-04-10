Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7FAA35AE8E
	for <lists+linux-gpio@lfdr.de>; Sat, 10 Apr 2021 16:52:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234795AbhDJOwl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 10 Apr 2021 10:52:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234708AbhDJOwl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 10 Apr 2021 10:52:41 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03440C06138A
        for <linux-gpio@vger.kernel.org>; Sat, 10 Apr 2021 07:52:26 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id p6so1700107wrn.9
        for <linux-gpio@vger.kernel.org>; Sat, 10 Apr 2021 07:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uRxou3cGxODn/AvoMcbrrHcXKajEQoIt07U2hsewcvo=;
        b=M+8R1DjfV2RnEeG/ILJVqhbJir2f961ofddYX1wQGiyx+cqLS2JU3RqFhronn/JaOF
         1itL6Gt2q6CWYhMBZEpXy5DO3Mb6Kzhzb6S2vyp0WDxih9O5F6Kqt+4cTlcl7oK3BBvq
         bUzWEPkVGw+duPYk0yBJ0vWqQ2TyS2oH1ArSzXdrxLFlbXORKIS2HOiqO+Ge+/Xf7P+7
         JDq17Bz5Wmsmw9Ax2VkREPN+0z0+OOk9lYbIrYOSLAlbGWBHBbpydBSN6YdUd4qsqZ9O
         3ngYj2N2ViAkW+7stbwHuvpc9YXis3zLoVJMjORXTZlEz/loL1kwtirsCilj1vXl3bOF
         afCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uRxou3cGxODn/AvoMcbrrHcXKajEQoIt07U2hsewcvo=;
        b=fbMMG8KUytAAWWSKUPD4/FZj7pM8mPYRnkUbnloxaN6bvkEzym6a5RwQz7gKC3kZm7
         j5pFR0IWQ14nUpiIGp4PLFrdKQRx23FKdNaSKqqIGlwBTV/WqpoY3td8KRs3tf+jqtlO
         72WMdcX3hbkRImMbMTDRv2jTH6ym5LjqL40qpeK+hDBPhsuBoTvlj/0O5MvsYX49jWiN
         7nNY6FmBsDOEsM20wK/bjMRdmunOR7sMngPPOf+Q8212pmussOsJegciWVtBo/d852fA
         +xmjGe6FjQMlqeBKJfECqnE+FI+mueAy2CFgqaeQVOkwBEY5MXRdfwbScTognHx5y/Hk
         rg+Q==
X-Gm-Message-State: AOAM532REnx+aANMwwn5Je2CobgjUXNkRFO7kxEJO/Z+Jrttq3hO/kr8
        0rKcOAzPrq9npzpKVKkuBd5nskNbYFTCBw==
X-Google-Smtp-Source: ABdhPJxhoDRTM9dqubnZYki857WzLag/r9cFIDd3zyXQa3mc1Qz79oFudW9cgF1tPCImCtci0JGd6A==
X-Received: by 2002:a5d:540c:: with SMTP id g12mr6431248wrv.158.1618066343511;
        Sat, 10 Apr 2021 07:52:23 -0700 (PDT)
Received: from debian-brgl.home (lfbn-nic-1-149-6.w2-15.abo.wanadoo.fr. [2.15.231.6])
        by smtp.gmail.com with ESMTPSA id a15sm9167083wrr.53.2021.04.10.07.52.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Apr 2021 07:52:23 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [libgpiod][RFC 5/6] core: rework line requests
Date:   Sat, 10 Apr 2021 16:51:56 +0200
Message-Id: <20210410145157.30718-6-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210410145157.30718-1-brgl@bgdev.pl>
References: <20210410145157.30718-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This introduces the bulk of changes for the v2 API in libgpiod. All
objects become opaque. The API supports all features exposed by the
v2 of the kernel uAPI.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 include/gpiod.h            | 1023 ++++++++++++++------------------
 lib/Makefile.am            |    9 +-
 lib/attr.c                 |  232 ++++++++
 lib/chip.c                 |  183 ++++++
 lib/config.c               |  158 +++++
 lib/core.c                 | 1131 ------------------------------------
 lib/event.c                |   44 +-
 lib/handle.c               |  144 +++++
 lib/helpers.c              |  306 ----------
 lib/info.c                 |    1 +
 lib/internal.c             |  101 ++++
 lib/internal.h             |   14 +
 lib/mask.c                 |   43 ++
 lib/misc.c                 |   75 +++
 lib/request.c              |  118 ++++
 tests/tests-event.c        |   58 +-
 tools/gpio-tools-test.bats |   12 +-
 tools/gpiodetect.c         |   11 +-
 tools/gpiofind.c           |    1 +
 tools/gpioget.c            |   57 +-
 tools/gpioinfo.c           |   12 +-
 tools/gpiomon.c            |  113 ++--
 tools/gpioset.c            |   85 ++-
 tools/tools-common.c       |    8 +-
 tools/tools-common.h       |    2 +-
 25 files changed, 1722 insertions(+), 2219 deletions(-)
 create mode 100644 lib/attr.c
 create mode 100644 lib/chip.c
 create mode 100644 lib/config.c
 delete mode 100644 lib/core.c
 create mode 100644 lib/handle.c
 delete mode 100644 lib/helpers.c
 create mode 100644 lib/mask.c
 create mode 100644 lib/request.c

diff --git a/include/gpiod.h b/include/gpiod.h
index e99233b..8831d4c 100644
--- a/include/gpiod.h
+++ b/include/gpiod.h
@@ -1,11 +1,11 @@
 /* SPDX-License-Identifier: LGPL-2.1-or-later */
 /* SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com> */
+/* SPDX-FileCopyrightText: 2021 Bartosz Golaszewski <brgl@bgdev.pl> */
 
 #ifndef __LIBGPIOD_GPIOD_H__
 #define __LIBGPIOD_GPIOD_H__
 
 #include <stdbool.h>
-#include <stdlib.h>
 #include <stdint.h>
 
 #ifdef __cplusplus
@@ -29,48 +29,32 @@ extern "C" {
  * errno to one of the error values defined in errno.h upon failure. The way
  * of notifying the caller that an error occurred varies between functions,
  * but in general a function that returns an int, returns -1 on error, while
- * a function returning a pointer bails out on error condition by returning
+ * a function returning a pointer indicates an error condition by returning
  * a NULL pointer.
+ *
+ * <p>In general libgpiod functions are not NULL-aware and it's expected that
+ * users pass valid pointers to objects as arguments.
+ *
+ * <p>Almost all opaque objects are reference counted. The associated resources
+ * are released when the reference count reaches 0.
  */
 
 struct gpiod_chip;
-struct gpiod_line;
 struct gpiod_line_info;
-struct gpiod_line_bulk;
+struct gpiod_line_attr;
+struct gpiod_line_config;
+struct gpiod_request_config;
+struct gpiod_request_handle;
 struct gpiod_line_event;
 struct gpiod_line_event_buffer;
 
 /**
- * @defgroup common Common helper macros
- * @{
- *
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
+ * @defgroup chips GPIO chips
  * @{
  *
- * Functions and data structures dealing with GPIO chips.
+ * Functions and data structures for manipulating GPIO chips.
  */
 
-/**
- * @brief Check if the file pointed to by path is a GPIO chip character device.
- * @param path Path to check.
- * @return True if the file exists and is a GPIO chip character device or a
- *         symbolic link to it.
- */
-bool gpiod_is_gpiochip_device(const char *path);
-
 /**
  * @brief Open a gpiochip by path.
  * @param path Path to the gpiochip device file.
@@ -80,7 +64,7 @@ struct gpiod_chip *gpiod_chip_open(const char *path);
 
 /**
  * @brief Increase the refcount on this GPIO object.
- * @param chip The GPIO chip object.
+ * @param chip GPIO chip object.
  * @return Passed reference to the GPIO chip.
  */
 struct gpiod_chip *gpiod_chip_ref(struct gpiod_chip *chip);
@@ -88,27 +72,27 @@ struct gpiod_chip *gpiod_chip_ref(struct gpiod_chip *chip);
 /**
  * @brief Decrease the refcount on this GPIO object. If the refcount reaches 0,
  *        close the chip device and free all associated resources.
- * @param chip The GPIO chip object.
+ * @param chip GPIO chip object.
  */
 void gpiod_chip_unref(struct gpiod_chip *chip);
 
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
@@ -116,143 +100,34 @@ unsigned int gpiod_chip_get_num_lines(struct gpiod_chip *chip);
 /**
  * @brief Get the current snapshot of information about the line at given
  *        offset.
- * @param chip The GPIO chip object.
+ * @param chip GPIO chip object.
  * @param offset The offset of the GPIO line.
- * @return New GPIO line info object that must be freed using
- *         ::gpiod_line_info_free or NULL if an error occurred.
+ * @return New GPIO line info object or NULL if an error occurred.
  */
 struct gpiod_line_info *gpiod_chip_get_line_info(struct gpiod_chip *chip,
 						 unsigned int offset);
 
-/**
- * @brief Get the handle to the GPIO line at given offset.
- * @param chip The GPIO chip object.
- * @param offset The offset of the GPIO line.
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
 /**
  * @brief Map a GPIO line's name to its offset within the chip.
- * @param chip The GPIO chip object.
+ * @param chip GPIO chip object.
  * @param name Name of the GPIO line to map.
- * @return Offset of the line within the chip or -1 if a line with given name
- *         is not exposed by the chip.
+ * @return Offset of the line within the chip or -1 on error.
+ * @note If a line with given name is not exposed by the chip, the function
+ *       sets errno to ENOENT.
  */
 int gpiod_chip_find_line(struct gpiod_chip *chip, const char *name);
 
 /**
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
- */
-
-/**
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
- */
-void gpiod_line_bulk_free(struct gpiod_line_bulk *bulk);
-
-/**
- * @brief Add a single line to a GPIO bulk object.
- * @param bulk Line bulk object.
- * @param line Line to add.
- * @return 0 on success, -1 on error.
- * @note The line is added at the next free bulk index.
- *
- * The function can fail if this bulk already holds its maximum amount of
- * lines or if the added line is associated with a different chip than all
- * the other lines already held by this object.
- */
-int gpiod_line_bulk_add_line(struct gpiod_line_bulk *bulk,
-			     struct gpiod_line *line);
-
-/**
- * @brief Retrieve the line handle from a line bulk object at given index.
- * @param bulk Line bulk object.
- * @param index Index of the line to retrieve.
- * @return Line handle at given index or NULL if index is greater or equal to
- *         the number of lines this bulk can hold.
- */
-struct gpiod_line *
-gpiod_line_bulk_get_line(struct gpiod_line_bulk *bulk, unsigned int index);
-
-/**
- * @brief Retrieve the number of GPIO lines held by this line bulk object.
- * @param bulk Line bulk object.
- * @return Number of lines held by this line bulk.
- */
-unsigned int gpiod_line_bulk_num_lines(struct gpiod_line_bulk *bulk);
-
-/**
- * @brief Values returned by the callback passed to
- *        ::gpiod_line_bulk_foreach_line.
+ * @brief Request a set of lines for exclusive usage.
+ * @param chip GPIO chip object.
+ * @param req_cfg Request config object.
+ * @param line_cfg Line config object.
+ * @return New request handle object or NULL if an error occurred.
  */
-enum {
-	/**< Continue the loop. */
-	GPIOD_LINE_BULK_CB_NEXT = 0,
-	/**< Stop the loop. */
-	GPIOD_LINE_BULK_CB_STOP,
-};
-
-/**
- * @brief Signature of the callback passed to ::gpiod_line_bulk_foreach_line.
- *
- * Takes the current line and additional user data as arguments.
- */
-typedef int (*gpiod_line_bulk_foreach_cb)(struct gpiod_line *, void *);
-
-/**
- * @brief Iterate over all lines held by this bulk object.
- * @param bulk Bulk object to iterate over.
- * @param func Callback to be called for each line.
- * @param data User data pointer that is passed to the callback.
- */
-void gpiod_line_bulk_foreach_line(struct gpiod_line_bulk *bulk,
-				  gpiod_line_bulk_foreach_cb func,
-				  void *data);
+struct gpiod_request_handle *
+gpiod_chip_request_lines(struct gpiod_chip *chip,
+			 struct gpiod_request_config *req_cfg,
+			 struct gpiod_line_config *line_cfg);
 
 /**
  * @}
@@ -314,13 +189,6 @@ enum {
 	/**< Line detects both rising and falling edge events. */
 };
 
-/**
- * @brief Read the GPIO line offset.
- * @param line GPIO line object.
- * @return Line offset.
- */
-unsigned int gpiod_line_offset(struct gpiod_line *line);
-
 /**
  * @brief Increase the reference count for this line info object.
  * @param info GPIO line info object.
@@ -428,485 +296,460 @@ unsigned long
 gpiod_line_get_debounce_period(struct gpiod_line_info *info);
 
 /**
- * @brief Get the handle to the GPIO chip controlling this line.
- * @param line The GPIO line object.
- * @return Pointer to the GPIO chip handle controlling this line.
+ * @}
+ *
+ * @defgroup line_mask Line mask bitmaps
+ * @{
+ */
+
+/**
+ * @brief Bitmask used to store values of lines in a single request (up to 64
+ *        lines) as well as to specify on which lines in a request to act when
+ *        reading/setting values or applying configuration options.
+ */
+typedef uint64_t gpiod_line_mask;
+
+/**
+ * @brief Set all bits in the mask.
+ * @param mask The GPIO line mask.
+ */
+void gpiod_line_mask_fill(gpiod_line_mask *mask);
+
+/**
+ * @brief Clear all bits in the mask.
+ * @param mask The GPIO line mask.
+ */
+void gpiod_line_mask_zero(gpiod_line_mask *mask);
+
+/**
+ * @brief Test a single bit.
+ * @param mask The GPIO line mask.
+ * @param offset Offset of the bit to test.
+ * @return True if the bit is set, false otherwise.
+ */
+bool gpiod_line_mask_test_bit(gpiod_line_mask mask, unsigned int offset);
+
+/**
+ * @brief Set a single bit.
+ * @param mask The GPIO line mask.
+ * @param offset Offset of the bit to set.
+ */
+void gpiod_line_mask_set_bit(gpiod_line_mask *mask, unsigned int offset);
+
+/**
+ * @brief Clear a single bit.
+ * @param mask The GPIO line mask.
+ * @param offset Offset of the bit to clear.
+ */
+void gpiod_line_mask_clear_bit(gpiod_line_mask *mask, unsigned int offset);
+
+/**
+ * @brief Set or clear a single bit depending on a boolean value.
+ * @param mask The GPIO line mask.
+ * @param offset Offset of the bit to assign.
+ * @param value Boolean value to indicate the value of the bit.
  */
-struct gpiod_chip *gpiod_line_get_chip(struct gpiod_line *line);
+void gpiod_line_mask_assign_bit(gpiod_line_mask *mask,
+				unsigned int offset, bool value);
 
 /**
  * @}
  *
- * @defgroup line_request Line requests
+ * @defgroup line_config Line and request configuration objects
  * @{
  *
- * Interface for requesting GPIO lines from userspace for both values and
- * events.
+ * Functions for manipulating line attributes and configuration objects.
  */
 
 /**
  * @brief Available types of requests.
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
+	GPIOD_LINE_CONFIG_EVENT_FALLING_EDGE,
 	/**< Only watch falling edge events. */
-	GPIOD_LINE_REQUEST_EVENT_RISING_EDGE,
+	GPIOD_LINE_CONFIG_EVENT_RISING_EDGE,
 	/**< Only watch rising edge events. */
-	GPIOD_LINE_REQUEST_EVENT_BOTH_EDGES,
+	GPIOD_LINE_CONFIG_EVENT_BOTH_EDGES,
 	/**< Monitor both types of events. */
 };
 
 /**
- * @brief Miscellaneous GPIO request flags.
+ * @brief Available drive settings for line requests.
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
+	GPIOD_LINE_CONFIG_DRIVE_PUSH_PULL = 1,
+	/**< Drive setting should be set to push-pull (the default). */
+	GPIOD_LINE_CONFIG_DRIVE_OPEN_DRAIN,
+	/**< Line output should be set to open-drain. */
+	GPIOD_LINE_CONFIG_DRIVE_OPEN_SOURCE,
+	/**< Line output should be set to open-source. */
 };
 
 /**
- * @brief Structure holding configuration of a line request.
+ * @brief Available internal bias settings for line requests.
  */
-struct gpiod_line_request_config {
-	const char *consumer;
-	/**< Name of the consumer. */
-	int request_type;
-	/**< Request type. */
-	int flags;
-	/**< Other configuration flags. */
+enum {
+	GPIOD_LINE_CONFIG_BIAS_DISABLED = 1,
+	/**< The internal bias should be disabled (the default). */
+	GPIOD_LINE_CONFIG_BIAS_PULL_UP,
+	/**< The internal pull-up bias is enabled. */
+	GPIOD_LINE_CONFIG_BIAS_PULL_DOWN,
+	/**< The internal pull-down bias is enabled. */
 };
 
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
+ * @brief Available line attribute types.
  */
-int gpiod_line_request(struct gpiod_line *line,
-		       const struct gpiod_line_request_config *config,
-		       int default_val);
+enum {
+	GPIOD_LINE_ATTR_TYPE_OPTS,
+	/**< The attribute specifies a set of simple line options. */
+	GPIOD_LINE_ATTR_TYPE_OUTPUT_VALUES,
+	/**< The attribute contains output values for a set of GPIO lines. */
+	GPIOD_LINE_ATTR_TYPE_DEBOUNCE,
+	/**< The attribute defines debounce config. */
+};
 
 /**
- * @brief Reserve a single line, set the direction to input.
- * @param line GPIO line object.
- * @param consumer Name of the consumer.
- * @return 0 if the line was properly reserved, -1 on failure.
+ * @brief Create a new line attribute.
+ * @param type Type of this attribute.
+ * @return New line attribute or NULL on error.
  */
-int gpiod_line_request_input(struct gpiod_line *line, const char *consumer);
+struct gpiod_line_attr *gpiod_line_attr_new(int type);
 
 /**
- * @brief Reserve a single line, set the direction to output.
- * @param line GPIO line object.
- * @param consumer Name of the consumer.
- * @param default_val Initial line value.
- * @return 0 if the line was properly reserved, -1 on failure.
+ * @brief Increase the reference count of this object.
+ * @param attr Line attribute object.
+ * @return Passed reference to the line attribute.
  */
-int gpiod_line_request_output(struct gpiod_line *line,
-			      const char *consumer, int default_val);
+struct gpiod_line_attr *gpiod_line_attr_ref(struct gpiod_line_attr *attr);
 
 /**
- * @brief Request rising edge event notifications on a single line.
- * @param line GPIO line object.
- * @param consumer Name of the consumer.
- * @return 0 if the operation succeeds, -1 on failure.
+ * @brief Decrease the reference count to the line attribute. If the refcount
+ *        reaches 0, free all resources associated with this object.
+ * @param attr Line attribute object.
  */
-int gpiod_line_request_rising_edge_events(struct gpiod_line *line,
-					  const char *consumer);
+void gpiod_line_attr_unref(struct gpiod_line_attr *attr);
 
 /**
- * @brief Request falling edge event notifications on a single line.
- * @param line GPIO line object.
- * @param consumer Name of the consumer.
- * @return 0 if the operation succeeds, -1 on failure.
+ * @brief Set the line mask of this attribute.
+ * @param attr Line attribute object.
+ * @param mask New line mask.
+ *
+ * An attribute can be associated with up to 64 lines (the maximum for a single
+ * line request). Each bit in the mask bitmap represents a single line from the
+ * request at the same offset as the bit. If the bit is set, the configuration
+ * specified in this attribute will apply to the associated line.
  */
-int gpiod_line_request_falling_edge_events(struct gpiod_line *line,
-					   const char *consumer);
+void gpiod_line_attr_set_line_mask(struct gpiod_line_attr *attr,
+				   gpiod_line_mask mask);
 
 /**
- * @brief Request all event type notifications on a single line.
- * @param line GPIO line object.
- * @param consumer Name of the consumer.
- * @return 0 if the operation succeeds, -1 on failure.
+ * @brief Set the request type.
+ * @param attr Line attribute object.
+ * @param request_type New request type.
+ * @return 0 on success, -1 on error.
+ * @note Can only be used with attributes of type ::GPIOD_LINE_ATTR_TYPE_OPTS.
  */
-int gpiod_line_request_both_edges_events(struct gpiod_line *line,
-					 const char *consumer);
+int gpiod_line_attr_set_request_type(struct gpiod_line_attr *attr,
+				     int request_type);
 
 /**
- * @brief Reserve a single line, set the direction to input.
- * @param line GPIO line object.
- * @param consumer Name of the consumer.
- * @param flags Additional request flags.
- * @return 0 if the line was properly reserved, -1 on failure.
+ * @brief Set the drive setting.
+ * @param attr Line attribute object.
+ * @param drive New drive setting.
+ * @return 0 on success, -1 on error.
+ * @note Can only be used with attributes of type ::GPIOD_LINE_ATTR_TYPE_OPTS.
  */
-int gpiod_line_request_input_flags(struct gpiod_line *line,
-				   const char *consumer, int flags);
+int gpiod_line_attr_set_drive(struct gpiod_line_attr *attr, int drive);
 
 /**
- * @brief Reserve a single line, set the direction to output.
- * @param line GPIO line object.
- * @param consumer Name of the consumer.
- * @param flags Additional request flags.
- * @param default_val Initial line value.
- * @return 0 if the line was properly reserved, -1 on failure.
+ * @brief Set the bias setting.
+ * @param attr Line attribute object.
+ * @param bias New bias setting.
+ * @return 0 on success, -1 on error.
+ * @note Can only be used with attributes of type ::GPIOD_LINE_ATTR_TYPE_OPTS.
  */
-int gpiod_line_request_output_flags(struct gpiod_line *line,
-				    const char *consumer, int flags,
-				    int default_val);
+int gpiod_line_attr_set_bias(struct gpiod_line_attr *attr, int bias);
 
 /**
- * @brief Request rising edge event notifications on a single line.
- * @param line GPIO line object.
- * @param consumer Name of the consumer.
- * @param flags Additional request flags.
- * @return 0 if the operation succeeds, -1 on failure.
+ * @brief Set the active-low setting.
+ * @param attr Line attribute object.
+ * @param active_low New active-low setting.
+ * @return 0 on success, -1 on error.
+ * @note Can only be used with attributes of type ::GPIOD_LINE_ATTR_TYPE_OPTS.
  */
-int gpiod_line_request_rising_edge_events_flags(struct gpiod_line *line,
-						const char *consumer,
-						int flags);
+int gpiod_line_attr_set_active_low(struct gpiod_line_attr *attr,
+				   bool active_low);
 
 /**
- * @brief Request falling edge event notifications on a single line.
- * @param line GPIO line object.
- * @param consumer Name of the consumer.
- * @param flags Additional request flags.
- * @return 0 if the operation succeeds, -1 on failure.
+ * @brief Set the realtime clock setting.
+ * @param attr Line attribute object.
+ * @param clock_realtime New realtime clock setting.
+ * @return 0 on success, -1 on error.
+ * @note Can only be used with attributes of type ::GPIOD_LINE_ATTR_TYPE_OPTS.
+ *
+ * This option can be used to tell the kernel to get the line event timestamps
+ * from the realtime clock, not the monotonic clock which is the default.
  */
-int gpiod_line_request_falling_edge_events_flags(struct gpiod_line *line,
-						 const char *consumer,
-						 int flags);
+int gpiod_line_attr_set_clock_realtime(struct gpiod_line_attr *attr,
+				       bool clock_realtime);
 
 /**
- * @brief Request all event type notifications on a single line.
- * @param line GPIO line object.
- * @param consumer Name of the consumer.
- * @param flags Additional request flags.
- * @return 0 if the operation succeeds, -1 on failure.
+ * @brief Set the debounce config.
+ * @param attr Line attribute object.
+ * @param debounce Activate or de-activate debouncing.
+ * @param debounce_period New debounce period in microseconds.
+ * @return 0 on success, -1 on error.
+ * @note Can only be used with attributes of type
+ *       ::GPIOD_LINE_ATTR_TYPE_DEBOUNCE.
+ *
  */
-int gpiod_line_request_both_edges_events_flags(struct gpiod_line *line,
-					       const char *consumer,
-					       int flags);
+int gpiod_line_attr_set_debounce(struct gpiod_line_attr *attr, bool debounce,
+				 unsigned long debounce_period);
 
 /**
- * @brief Reserve a set of GPIO lines.
- * @param bulk Set of GPIO lines to reserve.
- * @param config Request options.
- * @param default_vals Initial line values - only relevant if we're setting
- *                     the direction to output.
- * @return 0 if all lines were properly requested. In case of an error
- *         this routine returns -1 and sets the last error number.
+ * @brief Set the output values carried by this attribute.
+ * @param attr Line attribute object.
+ * @param values GPIO line mask specifing the output values.
+ * @return 0 on success
+ * @note Can only be used with attributes of type
+ *       ::GPIOD_LINE_ATTR_TYPE_OUTPUT_VALUES.
  *
- * If this routine succeeds, the caller takes ownership of the GPIO lines
- * until they're released. All the requested lines must be provided by the
- * same gpiochip.
+ * Each bit in the values mask is associated with a line in a request handle.
+ * If the bit is set, the line should be driven high, if the bit is cleared,
+ * the line should be driven low.
  */
-int gpiod_line_request_bulk(struct gpiod_line_bulk *bulk,
-			    const struct gpiod_line_request_config *config,
-			    const int *default_vals);
+int gpiod_line_attr_set_output_values(struct gpiod_line_attr *attr,
+				      gpiod_line_mask values);
 
 /**
- * @brief Reserve a set of GPIO lines, set the direction to input.
- * @param bulk Set of GPIO lines to reserve.
- * @param consumer Name of the consumer.
- * @return 0 if the lines were properly reserved, -1 on failure.
+ * @brief Create a new line config object.
+ * @return New line config object or NULL on error.
  */
-int gpiod_line_request_bulk_input(struct gpiod_line_bulk *bulk,
-				  const char *consumer);
+struct gpiod_line_config *gpiod_line_config_new(void);
 
 /**
- * @brief Reserve a set of GPIO lines, set the direction to output.
- * @param bulk Set of GPIO lines to reserve.
- * @param consumer Name of the consumer.
- * @param default_vals Initial line values.
- * @return 0 if the lines were properly reserved, -1 on failure.
+ * @brief Increase the reference count of this line config object.
+ * @param config Line config object.
+ * @return Passed reference to the line config object.
  */
-int gpiod_line_request_bulk_output(struct gpiod_line_bulk *bulk,
-				   const char *consumer,
-				   const int *default_vals);
+struct gpiod_line_config *
+gpiod_line_config_ref(struct gpiod_line_config *config);
 
 /**
- * @brief Request rising edge event notifications on a set of lines.
- * @param bulk Set of GPIO lines to request.
- * @param consumer Name of the consumer.
- * @return 0 if the operation succeeds, -1 on failure.
+ * @brief Decrease the reference count of this line config object. If the
+ *        reference count reaches 0, free all associated resources.
+ * @param config Line config object.
  */
-int gpiod_line_request_bulk_rising_edge_events(struct gpiod_line_bulk *bulk,
-					       const char *consumer);
+void gpiod_line_config_unref(struct gpiod_line_config *config);
 
 /**
- * @brief Request falling edge event notifications on a set of lines.
- * @param bulk Set of GPIO lines to request.
- * @param consumer Name of the consumer.
- * @return 0 if the operation succeeds, -1 on failure.
+ * @brief Add a new line attribute to this line config.
+ * @param config Line config object.
+ * @param attr Line attribute to add.
+ * @return 0 on success, -1 on failure.
  */
-int gpiod_line_request_bulk_falling_edge_events(struct gpiod_line_bulk *bulk,
-						const char *consumer);
+int gpiod_line_config_add_attribute(struct gpiod_line_config *config,
+				    struct gpiod_line_attr *attr);
 
 /**
- * @brief Request all event type notifications on a set of lines.
- * @param bulk Set of GPIO lines to request.
- * @param consumer Name of the consumer.
- * @return 0 if the operation succeeds, -1 on failure.
+ * @brief Remove all attributes from this config.
+ * @param config Line config.
  */
-int gpiod_line_request_bulk_both_edges_events(struct gpiod_line_bulk *bulk,
-					      const char *consumer);
+void gpiod_line_config_clear_attrs(struct gpiod_line_config *config);
 
 /**
- * @brief Reserve a set of GPIO lines, set the direction to input.
- * @param bulk Set of GPIO lines to reserve.
- * @param consumer Name of the consumer.
- * @param flags Additional request flags.
- * @return 0 if the lines were properly reserved, -1 on failure.
+ * @brief Set the request type.
+ * @param config Line config.
+ * @param request_type New request type.
+ * @return 0 on success, -1 on error.
  */
-int gpiod_line_request_bulk_input_flags(struct gpiod_line_bulk *bulk,
-					const char *consumer, int flags);
+int gpiod_line_config_set_request_type(struct gpiod_line_config *config,
+				       int request_type);
 
 /**
- * @brief Reserve a set of GPIO lines, set the direction to output.
- * @param bulk Set of GPIO lines to reserve.
- * @param consumer Name of the consumer.
- * @param flags Additional request flags.
- * @param default_vals Initial line values.
- * @return 0 if the lines were properly reserved, -1 on failure.
+ * @brief Set the drive setting.
+ * @param config Line config.
+ * @param drive New drive setting.
+ * @return 0 on success, -1 on error.
  */
-int gpiod_line_request_bulk_output_flags(struct gpiod_line_bulk *bulk,
-					 const char *consumer, int flags,
-					 const int *default_vals);
+int gpiod_line_config_set_drive(struct gpiod_line_config *config, int drive);
 
 /**
- * @brief Request rising edge event notifications on a set of lines.
- * @param bulk Set of GPIO lines to request.
- * @param consumer Name of the consumer.
- * @param flags Additional request flags.
- * @return 0 if the operation succeeds, -1 on failure.
+ * @brief Set the bias setting.
+ * @param config Line config.
+ * @param bias New bias setting.
+ * @return 0 on success, -1 on error.
  */
-int gpiod_line_request_bulk_rising_edge_events_flags(
-					struct gpiod_line_bulk *bulk,
-					const char *consumer, int flags);
+int gpiod_line_config_set_bias(struct gpiod_line_config *config, int bias);
 
 /**
- * @brief Request falling edge event notifications on a set of lines.
- * @param bulk Set of GPIO lines to request.
- * @param consumer Name of the consumer.
- * @param flags Additional request flags.
- * @return 0 if the operation succeeds, -1 on failure.
+ * @brief Set the active-low setting.
+ * @param config Line config.
+ * @param active_low New active-low setting.
  */
-int gpiod_line_request_bulk_falling_edge_events_flags(
-					struct gpiod_line_bulk *bulk,
-					const char *consumer, int flags);
+void gpiod_line_config_set_active_low(struct gpiod_line_config *config,
+				      bool active_low);
 
 /**
- * @brief Request all event type notifications on a set of lines.
- * @param bulk Set of GPIO lines to request.
- * @param consumer Name of the consumer.
- * @param flags Additional request flags.
- * @return 0 if the operation succeeds, -1 on failure.
+ * @brief Set the realtime clock setting.
+ * @param config Line config.
+ * @param clock_realtime New realtime clock setting.
+ *
+ * This option can be used to tell the kernel to get the line event timestamps
+ * from the realtime clock, not the monotonic clock which is the default.
  */
-int gpiod_line_request_bulk_both_edges_events_flags(
-					struct gpiod_line_bulk *bulk,
-					const char *consumer, int flags);
+void
+gpiod_line_config_set_event_clock_realtime(struct gpiod_line_config *config,
+					   bool clock_realtime);
 
 /**
- * @brief Release a previously reserved line.
- * @param line GPIO line object.
+ * @brief Create a new request config object.
+ * @return New request config object or NULL on error.
  */
-void gpiod_line_release(struct gpiod_line *line);
+struct gpiod_request_config *gpiod_request_config_new(void);
 
 /**
- * @brief Release a set of previously reserved lines.
- * @param bulk Set of GPIO lines to release.
- *
- * If the lines were not previously requested together, the behavior is
- * undefined.
+ * @brief Increase the reference count of this request config object.
+ * @param config Request config object.
+ * @return Passed reference to this request config.
  */
-void gpiod_line_release_bulk(struct gpiod_line_bulk *bulk);
+struct gpiod_request_config *
+gpiod_request_config_ref(struct gpiod_request_config *config);
 
 /**
- * @}
- *
- * @defgroup line_value Reading & setting line values
- * @{
- *
- * Functions allowing to read and set GPIO line values for single lines and
- * in bulk.
+ * @brief Decrease the reference count of this request config object. If the
+ *        reference count reaches 0, free all associated resources.
+ * @param config Request config object.
  */
+void gpiod_request_config_unref(struct gpiod_request_config *config);
 
 /**
- * @brief Read current value of a single GPIO line.
- * @param line GPIO line object.
- * @return 0 or 1 if the operation succeeds. On error this routine returns -1
- *         and sets the last error number.
+ * @brief Set the consumer string.
+ * @param config Request config object.
+ * @param consumer Consumer name.
+ * @return 0 on success, -1 on failure.
  */
-int gpiod_line_get_value(struct gpiod_line *line);
+int gpiod_request_config_set_consumer(struct gpiod_request_config *config,
+				      const char *consumer);
 
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
+ * @brief Set line offsets for this request.
+ * @param config Request config object.
+ * @param num_lines Number of offsets.
+ * @param offsets Array of line offsets.
+ * @return 0 on success, -1 on failure.
  */
-int gpiod_line_get_value_bulk(struct gpiod_line_bulk *bulk, int *values);
+int gpiod_request_config_set_offsets(struct gpiod_request_config *config,
+				     unsigned int num_lines,
+				     unsigned int *offsets);
 
 /**
- * @brief Set the value of a single GPIO line.
- * @param line GPIO line object.
- * @param value New value.
- * @return 0 is the operation succeeds. In case of an error this routine
- *         returns -1 and sets the last error number.
+ * @brief Set the size of the kernel event buffer.
+ * @param config Request config object.
+ * @param event_buffer_size New event buffer size.
+ * @return 0 on success, -1 on failure.
  */
-int gpiod_line_set_value(struct gpiod_line *line, int value);
+int
+gpiod_request_config_set_event_buffer_size(struct gpiod_request_config *config,
+					   unsigned int event_buffer_size);
 
 /**
- * @brief Set the values of a set of GPIO lines.
- * @param bulk Set of GPIO lines to reserve.
- * @param values An array holding line_bulk->num_lines new values for lines.
- *               A NULL pointer is interpreted as a logical low for all lines.
- * @return 0 is the operation succeeds. In case of an error this routine
- *         returns -1 and sets the last error number.
+ * @}
  *
- * If the lines were not previously requested together, the behavior is
- * undefined.
+ * @defgroup request_handle Line request handle operations
+ * @{
  */
-int gpiod_line_set_value_bulk(struct gpiod_line_bulk *bulk, const int *values);
 
 /**
- * @}
- *
- * @defgroup line_config Setting line configuration
- * @{
- *
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
+ * @brief Increase the reference count of this request handle.
+ * @param handle GPIO request handle.
+ * @return Passed reference to this request handle.
  */
-int gpiod_line_set_config_bulk(struct gpiod_line_bulk *bulk,
-			       int direction, int flags, const int *values);
+struct gpiod_request_handle *
+gpiod_request_handle_ref(struct gpiod_request_handle *handle);
 
+/**
+ * @brief Decrease the reference count of this request handle. If the reference
+ *        count reaches 0, close the associated file descriptor and release
+ *        all allocated resources.
+ * @param handle GPIO request handle.
+ */
+void gpiod_request_handle_unref(struct gpiod_request_handle *handle);
 
 /**
- * @brief Update the configuration flags of a single GPIO line.
- * @param line GPIO line object.
- * @param flags Replacement flags.
- * @return 0 is the operation succeeds. In case of an error this routine
- *         returns -1 and sets the last error number.
+ * @brief Read values of lines associated with this request handle.
+ * @param handle GPIO request handle.
+ * @param values Address of the bitmap to store values in.
+ * @param mask Mask of the lines to read values from.
+ * @return 0 on success, -1 on failure.
+ * @note The bits in the values and mask bitmaps represent the lines associated
+ *       with this request handle at the same offsets. Only values of lines
+ *       for which the relevant bits in mask are set will be read.
  */
-int gpiod_line_set_flags(struct gpiod_line *line, int flags);
+int gpiod_request_handle_get_values(struct gpiod_request_handle *handle,
+				    gpiod_line_mask *values,
+				    gpiod_line_mask mask);
 
 /**
- * @brief Update the configuration flags of a set of GPIO lines.
- * @param bulk Set of GPIO lines.
- * @param flags Replacement flags.
- * @return 0 is the operation succeeds. In case of an error this routine
- *         returns -1 and sets the last error number.
- *
- * If the lines were not previously requested together, the behavior is
- * undefined.
+ * @brief Set values of lines associated with this request handle.
+ * @param handle GPIO request handle.
+ * @param values Mask of line values to set.
+ * @param mask Mask of the lines to set values for.
+ * @return 0 on success, -1 on failure.
+ * @note The bits in the values and mask bitmaps represent the lines associated
+ *       with this request handle at the same offsets. Only values of lines
+ *       for which the relevant bits in mask are set will be modified.
  */
-int gpiod_line_set_flags_bulk(struct gpiod_line_bulk *bulk, int flags);
+int gpiod_request_handle_set_values(struct gpiod_request_handle *handle,
+				    gpiod_line_mask values,
+				    gpiod_line_mask mask);
 
 /**
- * @brief Set the direction of a single GPIO line to input.
- * @param line GPIO line object.
- * @return 0 is the operation succeeds. In case of an error this routine
- *         returns -1 and sets the last error number.
+ * @brief Update the configuration of lines associated with this request handle.
+ * @param handle GPIO request handle.
+ * @param config New line config to apply.
+ * @return 0 on success, -1 on failure.
  */
-int gpiod_line_set_direction_input(struct gpiod_line *line);
+int gpiod_request_handle_set_config(struct gpiod_request_handle *handle,
+				    struct gpiod_line_config *config);
 
 /**
- * @brief Set the direction of a set of GPIO lines to input.
- * @param bulk Set of GPIO lines.
- * @return 0 is the operation succeeds. In case of an error this routine
- *         returns -1 and sets the last error number.
- *
- * If the lines were not previously requested together, the behavior is
- * undefined.
+ * @brief Get the file descriptor associated with this request handle.
+ * @param handle GPIO request handle.
+ * @return Number of the file descriptor associated with this request. This
+ *         function never fails.
  */
-int
-gpiod_line_set_direction_input_bulk(struct gpiod_line_bulk *bulk);
+int gpiod_request_handle_get_fd(struct gpiod_request_handle *handle);
 
 /**
- * @brief Set the direction of a single GPIO line to output.
- * @param line GPIO line object.
- * @param value The logical value output on the line.
- * @return 0 is the operation succeeds. In case of an error this routine
- *         returns -1 and sets the last error number.
+ * @brief Wait for line events on any of the lines associated with this handle.
+ * @param handle GPIO request handle.
+ * @param timeout Wait time limit in nanoseconds.
+ * @return 0 if wait timed out, -1 if an error occurred, 1 if an event is
+ *         pending.
  */
-int gpiod_line_set_direction_output(struct gpiod_line *line, int value);
+int gpiod_request_handle_event_wait(struct gpiod_request_handle *handle,
+				    uint64_t timeout);
 
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
+ * @brief Read a number of line events from a request handle.
+ * @param handle GPIO request handle.
+ * @param buf Line event buffer.
+ * @param max_events Maximum number of events to read.
+ * @return On success returns the number of events read from the file
+ *         descriptor, on failure return -1.
+ * @note This function will block if no event was queued for this line.
  */
-int gpiod_line_set_direction_output_bulk(struct gpiod_line_bulk *bulk,
-					 const int *values);
+int gpiod_request_handle_event_read(struct gpiod_request_handle *handle,
+				    struct gpiod_line_event_buffer *buf,
+				    unsigned int max_events);
 
 /**
  * @}
@@ -930,120 +773,133 @@ enum {
 	/**< Falling edge event. */
 };
 
+/**
+ * @brief Increase the reference count of this line event.
+ * @param event GPIO line event.
+ * @return Passed reference to the event object.
+ * @note Must not be used with events held by the event buffer (retrieved
+ *       using ::gpiod_line_event_buffer_get_event. Only event objects
+ *       created by ::gpiod_line_event_buffer_copy_event are refcounted.
+ */
 struct gpiod_line_event *gpiod_line_event_ref(struct gpiod_line_event *event);
 
+/**
+ * @brief Decrease the reference count of this line event. If the reference
+ *        count reaches zero, free all associated resources.
+ * @param event GPIO line event.
+ */
 void gpiod_line_event_unref(struct gpiod_line_event *event);
 
+/**
+ * @brief Get the event type.
+ * @param event GPIO line event.
+ * @return The event type (::GPIOD_LINE_EVENT_RISING_EDGE or
+ *         ::GPIOD_LINE_EVENT_FALLING_EDGE).
+ */
 int gpiod_line_event_get_event_type(struct gpiod_line_event *event);
 
+/**
+ * @brief Get the timestamp of the event.
+ * @param event GPIO line event.
+ * @return Timestamp in nanoseconds.
+ */
 uint64_t gpiod_line_event_get_timestamp(struct gpiod_line_event *event);
 
+/**
+ * @brief Get the hardware offset of the line on which the event was triggered.
+ * @param event GPIO line event.
+ * @return Line offset.
+ */
 unsigned int gpiod_line_event_get_line_offset(struct gpiod_line_event *event);
 
+/**
+ * @brief Get the global sequence number of this event.
+ * @param event GPIO line event.
+ * @return Sequence number of the event relative to all lines in the associated
+ *         line request.
+ */
 unsigned int gpiod_line_event_get_global_seqno(struct gpiod_line_event *event);
 
+/**
+ * @brief Get the event sequence number specific to this line.
+ * @param event GPIO line event.
+ * @return Sequence number of the event relative to this line within the
+ *         lifetime of the associated line request.
+ */
 unsigned int gpiod_line_event_get_line_seqno(struct gpiod_line_event *event);
 
+/**
+ * @brief Create a new line event buffer.
+ * @param capacity Number of events this buffer can store (min = 1, max = 1024).
+ * @return New line event buffer or NULL on error.
+ */
 struct gpiod_line_event_buffer *
 gpiod_line_event_buffer_new(unsigned int capacity);
 
+/**
+ * @brief Increase the reference count of this event buffer.
+ * @param buf Line event buffer.
+ * @return Passed reference to the event buffer.
+ */
 struct gpiod_line_event_buffer *
 gpiod_line_event_buffer_ref(struct gpiod_line_event_buffer *buf);
 
+/**
+ * @brief Decrease the reference count of this event buffer. If the reference
+ *        count reaches 0, free all associated resources.
+ * @param buf Line event buffer.
+ */
 void gpiod_line_event_buffer_unref(struct gpiod_line_event_buffer *buf);
 
+/**
+ * @brief Get a weak reference to an event in the buffer.
+ * @param buf Line event buffer.
+ * @param index Index of the event in the buffer.
+ * @return Pointer to an event stored in the buffer. The lifetime of this
+ *         event is tied to the buffer object. Users must not call event
+ *         reference counting functions on pointers retrieved using this
+ *         function.
+ */
 struct gpiod_line_event *
 gpiod_line_event_buffer_get_event(struct gpiod_line_event_buffer *buf,
 				  unsigned long index);
 
+/**
+ * @brief Get a copy of a line event.
+ * @param buf Line event buffer.
+ * @param index Index of the event in the buffer.
+ * @return Returns a copy of the line event stored in this buffer. The event's
+ *         lifetime is managed by the caller. The event's reference count must
+ *         be decreases using ::gpiod_line_event_unref.
+ */
 struct gpiod_line_event *
 gpiod_line_event_buffer_copy_event(struct gpiod_line_event_buffer *buf,
 				   unsigned long index);
 
 /**
- * @brief Wait for an event on a single line.
- * @param line GPIO line object.
- * @param timeout Wait time limit.
- * @return 0 if wait timed out, -1 if an error occurred, 1 if an event
- *         occurred.
- */
-int gpiod_line_event_wait(struct gpiod_line *line, uint64_t timeout);
-
-/**
- * @brief Wait for events on a set of lines.
- * @param bulk Set of GPIO lines to monitor.
- * @param timeout Wait time limit.
- * @param event_bulk Bulk object in which to store the line handles on which
- *                   events occurred. Can be NULL.
- * @return 0 if wait timed out, -1 if an error occurred, 1 if at least one
- *         event occurred.
- */
-int gpiod_line_event_wait_bulk(struct gpiod_line_bulk *bulk, uint64_t timeout,
-			       struct gpiod_line_bulk *event_bulk);
-
-/**
- * @brief Read next pending event from the GPIO line.
- * @param line GPIO line object.
- * @param event Buffer to which the event data will be copied.
- * @return 0 if the event was read correctly, -1 on error.
- * @note This function will block if no event was queued for this line.
- */
-int gpiod_line_event_read(struct gpiod_line *line,
-			  struct gpiod_line_event_buffer *buf);
-
-/**
- * @brief Read up to a certain number of events from the GPIO line.
- * @param line GPIO line object.
- * @param events Buffer to which the event data will be copied. Must hold at
- *               least the amount of events specified in num_events.
- * @param num_events Specifies how many events can be stored in the buffer.
- * @return On success returns the number of events stored in the buffer, on
- *         failure -1 is returned.
- */
-int gpiod_line_event_read_multiple(struct gpiod_line *line,
-				   struct gpiod_line_event_buffer *buf,
-				   unsigned int num_events);
-
-/**
- * @brief Get the event file descriptor.
- * @param line GPIO line object.
- * @return Number of the event file descriptor or -1 if the user tries to
- *         retrieve the descriptor from a line that wasn't configured for
- *         event monitoring.
- *
- * Users may want to poll the event file descriptor on their own. This routine
- * allows to access it.
+ * @brief Get the number of events this buffers stores.
+ * @param buf Line event buffer.
+ * @return Number of events stored in this buffer.
  */
-int gpiod_line_event_get_fd(struct gpiod_line *line);
+unsigned int
+gpiod_line_event_buffer_num_events(struct gpiod_line_event_buffer *buf);
 
 /**
- * @brief Read the last GPIO event directly from a file descriptor.
+ * @brief Read GPIO line events directly from a file descriptor.
  * @param fd File descriptor.
- * @param event Buffer in which the event data will be stored.
- * @return 0 if the event was read correctly, -1 on error.
+ * @param buf Line event buffer.
+ * @param max_events Maximum number of events to read.
+ * @return On success returns the number of events read from the file
+ *         descriptor, on failure return -1.
  *
  * Users who directly poll the file descriptor for incoming events can also
  * directly read the event data from it using this routine. This function
  * translates the kernel representation of the event to the libgpiod format.
  */
-int gpiod_line_event_read_fd(int fd, struct gpiod_line_event_buffer *buf);
-
-/**
- * @brief Read up to a certain number of events directly from a file descriptor.
- * @param fd File descriptor.
- * @param events Buffer to which the event data will be copied. Must hold at
- *               least the amount of events specified in num_events.
- * @param max_events Specifies the maximum number of events to read.
- * @return On success returns the number of events stored in the buffer, on
- *         failure -1 is returned.
- */
-int gpiod_line_event_read_fd_multiple(int fd,
-				      struct gpiod_line_event_buffer *buf,
-				      unsigned int max_events);
+int gpiod_line_event_buffer_read_fd(int fd, struct gpiod_line_event_buffer *buf,
+				    unsigned int max_events);
 
 /**
- * @}
- *
  * @}
  *
  * @defgroup misc Stuff that didn't fit anywhere else
@@ -1052,6 +908,19 @@ int gpiod_line_event_read_fd_multiple(int fd,
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
+/**
+ * @brief Convert seconds to nanoseconds.
+ * @param sec Number of seconds to convert.
+ * @return The same duration in nanoseconds.
+ */
 uint64_t gpiod_sec_to_nsec(uint64_t sec);
 
 /**
diff --git a/lib/Makefile.am b/lib/Makefile.am
index 0f19eec..8713d52 100644
--- a/lib/Makefile.am
+++ b/lib/Makefile.am
@@ -2,14 +2,19 @@
 # SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 lib_LTLIBRARIES = libgpiod.la
-libgpiod_la_SOURCES =	core.c \
+libgpiod_la_SOURCES =	attr.c \
+			chip.c \
+			config.c \
 			event.c \
-			helpers.c \
+			handle.c \
 			internal.h \
 			internal.c \
 			info.c \
+			mask.c \
 			misc.c \
+			request.c \
 			uapi/gpio.h
+
 libgpiod_la_CFLAGS = -Wall -Wextra -g -std=gnu89
 libgpiod_la_CFLAGS += -fvisibility=hidden -I$(top_srcdir)/include/
 libgpiod_la_CFLAGS += -include $(top_builddir)/config.h
diff --git a/lib/attr.c b/lib/attr.c
new file mode 100644
index 0000000..893f4d9
--- /dev/null
+++ b/lib/attr.c
@@ -0,0 +1,232 @@
+// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-FileCopyrightText: 2021 Bartosz Golaszewski <brgl@bgdev.pl>
+
+/* Line attribute data structure and functions. */
+
+#include <errno.h>
+#include <gpiod.h>
+#include <stdlib.h>
+#include <string.h>
+
+#include "internal.h"
+#include "uapi/gpio.h"
+
+struct line_attr_flags {
+	int request_type;
+	int drive;
+	int bias;
+	bool active_low;
+	bool clock_realtime;
+};
+
+struct line_attr_debounce {
+	bool debounced;
+	unsigned long debounce_period;
+};
+
+struct gpiod_line_attr {
+	struct gpiod_refcount refcount;
+	int type;
+	gpiod_line_mask mask;
+	union {
+		struct line_attr_flags flags;
+		uint64_t values;
+		struct line_attr_debounce debounce;
+	};
+};
+
+static void line_attr_release(struct gpiod_refcount *refcount)
+{
+	struct gpiod_line_attr *attr;
+
+	attr = gpiod_container_of(refcount, struct gpiod_line_attr, refcount);
+
+	free(attr);
+}
+
+GPIOD_API struct gpiod_line_attr *gpiod_line_attr_new(int type)
+{
+	struct gpiod_line_attr *attr;
+
+	switch (type) {
+	case GPIOD_LINE_ATTR_TYPE_OPTS:
+	case GPIOD_LINE_ATTR_TYPE_OUTPUT_VALUES:
+	case GPIOD_LINE_ATTR_TYPE_DEBOUNCE:
+		break;
+	default:
+		errno = EINVAL;
+		return NULL;
+	}
+
+	attr = malloc(sizeof(*attr));
+	if (!attr)
+		return NULL;
+
+	memset(attr, 0, sizeof(*attr));
+	gpiod_refcount_init(&attr->refcount, line_attr_release);
+	attr->type = type;
+
+	return attr;
+}
+
+GPIOD_API struct gpiod_line_attr *
+gpiod_line_attr_ref(struct gpiod_line_attr *attr)
+{
+	gpiod_refcount_ref(&attr->refcount);
+	return attr;
+}
+
+GPIOD_API void gpiod_line_attr_unref(struct gpiod_line_attr *attr)
+{
+	gpiod_refcount_unref(&attr->refcount);
+}
+
+GPIOD_API void gpiod_line_attr_set_line_mask(struct gpiod_line_attr *attr,
+					     gpiod_line_mask mask)
+{
+	attr->mask = mask;
+}
+
+static int line_attr_expect_type(struct gpiod_line_attr *attr, int type)
+{
+	if (attr->type != type) {
+		errno = EINVAL;
+		return -1;
+	}
+
+	return 0;
+}
+
+GPIOD_API int gpiod_line_attr_set_request_type(struct gpiod_line_attr *attr,
+					       int request_type)
+{
+	int ret;
+
+	ret = line_attr_expect_type(attr, GPIOD_LINE_ATTR_TYPE_OPTS);
+	if (ret)
+		return -1;
+
+	ret = gpiod_validate_request_type(request_type);
+	if (ret)
+		return -1;
+
+	attr->flags.request_type = request_type;
+	return 0;
+}
+
+GPIOD_API int gpiod_line_attr_set_drive(struct gpiod_line_attr *attr, int drive)
+{
+	int ret;
+
+	ret = line_attr_expect_type(attr, GPIOD_LINE_ATTR_TYPE_OPTS);
+	if (ret)
+		return -1;
+
+	ret = gpiod_validate_drive(drive);
+	if (ret)
+		return -1;
+
+	attr->flags.drive = drive;
+	return 0;
+}
+
+GPIOD_API int gpiod_line_attr_set_bias(struct gpiod_line_attr *attr, int bias)
+{
+	int ret;
+
+	ret = line_attr_expect_type(attr, GPIOD_LINE_ATTR_TYPE_OPTS);
+	if (ret)
+		return -1;
+
+	ret = gpiod_validate_bias(bias);
+	if (ret)
+		return -1;
+
+	attr->flags.bias = bias;
+	return 0;
+}
+
+GPIOD_API int gpiod_line_attr_set_active_low(struct gpiod_line_attr *attr,
+					     bool active_low)
+{
+	int ret;
+
+	ret = line_attr_expect_type(attr, GPIOD_LINE_ATTR_TYPE_OPTS);
+	if (ret)
+		return -1;
+
+	attr->flags.active_low = active_low;
+	return 0;
+}
+
+GPIOD_API int gpiod_line_attr_set_clock_realtime(struct gpiod_line_attr *attr,
+						 bool clock_realtime)
+{
+	int ret;
+
+	ret = line_attr_expect_type(attr, GPIOD_LINE_ATTR_TYPE_OPTS);
+	if (ret)
+		return -1;
+
+	attr->flags.clock_realtime = clock_realtime;
+	return 0;
+}
+
+GPIOD_API int gpiod_line_attr_set_debounce(struct gpiod_line_attr *attr,
+					   bool debounce,
+					   unsigned long debounce_period)
+{
+	int ret;
+
+	ret = line_attr_expect_type(attr, GPIOD_LINE_ATTR_TYPE_DEBOUNCE);
+	if (ret)
+		return -1;
+
+	attr->debounce.debounced = debounce;
+	if (debounce)
+		attr->debounce.debounce_period = debounce_period;
+
+	return 0;
+}
+
+GPIOD_API int gpiod_line_attr_set_output_values(struct gpiod_line_attr *attr,
+						gpiod_line_mask values)
+{
+	int ret;
+
+	ret = line_attr_expect_type(attr, GPIOD_LINE_ATTR_TYPE_OUTPUT_VALUES);
+	if (ret)
+		return -1;
+
+	attr->values = values;
+	return 0;
+}
+
+void gpiod_line_attr_to_kernel(struct gpiod_line_attr *attr,
+			       struct gpio_v2_line_config_attribute *attrbuf)
+{
+	struct gpio_v2_line_attribute *la = &attrbuf->attr;
+	struct line_attr_flags *flags;
+
+	attrbuf->mask = attr->mask;
+
+	switch (attr->type) {
+	case GPIOD_LINE_ATTR_TYPE_OPTS:
+		la->id = GPIO_V2_LINE_ATTR_ID_FLAGS;
+		flags = &attr->flags;
+		la->flags = gpiod_make_kernel_flags(flags->request_type,
+						    flags->drive,
+						    flags->bias,
+						    flags->active_low,
+						    flags->clock_realtime);
+		break;
+	case GPIOD_LINE_ATTR_TYPE_OUTPUT_VALUES:
+		la->id = GPIO_V2_LINE_ATTR_ID_OUTPUT_VALUES;
+		la->values = attr->values;
+		break;
+	case GPIOD_LINE_ATTR_TYPE_DEBOUNCE:
+		la->id = GPIO_V2_LINE_ATTR_ID_DEBOUNCE;
+		la->debounce_period_us = attr->debounce.debounce_period;
+		break;
+	}
+}
diff --git a/lib/chip.c b/lib/chip.c
new file mode 100644
index 0000000..9bacfe7
--- /dev/null
+++ b/lib/chip.c
@@ -0,0 +1,183 @@
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
+#include "uapi/gpio.h"
+
+struct gpiod_chip {
+	struct gpiod_refcount refcount;
+	int fd;
+	unsigned int num_lines;
+	char name[32];
+	char label[32];
+};
+
+static void chip_release(struct gpiod_refcount *refcount)
+{
+	struct gpiod_chip *chip;
+
+	chip = gpiod_container_of(refcount, struct gpiod_chip, refcount);
+
+	close(chip->fd);
+	free(chip);
+}
+
+GPIOD_API struct gpiod_chip *gpiod_chip_open(const char *path)
+{
+	struct gpiochip_info info;
+	struct gpiod_chip *chip;
+	int rv, fd;
+
+	fd = open(path, O_RDWR | O_CLOEXEC);
+	if (fd < 0)
+		return NULL;
+
+	/*
+	 * We were able to open the file but is it really a gpiochip character
+	 * device?
+	 */
+	if (!gpiod_is_gpiochip_device(path))
+		goto err_close_fd;
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
+	gpiod_refcount_init(&chip->refcount, chip_release);
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
+GPIOD_API struct gpiod_chip *gpiod_chip_ref(struct gpiod_chip *chip)
+{
+	gpiod_refcount_ref(&chip->refcount);
+	return chip;
+}
+
+GPIOD_API void gpiod_chip_unref(struct gpiod_chip *chip)
+{
+	gpiod_refcount_unref(&chip->refcount);
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
+			       struct gpio_v2_line_info *infobuf)
+{
+	int ret;
+
+	memset(infobuf, 0, sizeof(*infobuf));
+	infobuf->offset = offset;
+
+	ret = ioctl(fd, GPIO_V2_GET_LINEINFO_IOCTL, infobuf);
+	if (ret)
+		return -1;
+
+	return 0;
+}
+
+GPIOD_API struct gpiod_line_info *
+gpiod_chip_get_line_info(struct gpiod_chip *chip, unsigned int offset)
+{
+	struct gpio_v2_line_info infobuf;
+	int ret;
+
+	ret = chip_read_line_info(chip->fd, offset, &infobuf);
+	if (ret)
+		return NULL;
+
+	return gpiod_line_info_from_kernel(&infobuf);
+}
+
+GPIOD_API int gpiod_chip_find_line(struct gpiod_chip *chip, const char *name)
+{
+	struct gpio_v2_line_info infobuf;
+	unsigned int offset;
+	int ret;
+
+	for (offset = 0; offset < chip->num_lines; offset++) {
+		ret = chip_read_line_info(chip->fd, offset, &infobuf);
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
+GPIOD_API struct gpiod_request_handle *
+gpiod_chip_request_lines(struct gpiod_chip *chip,
+			 struct gpiod_request_config *req_cfg,
+			 struct gpiod_line_config *line_cfg)
+{
+	struct gpio_v2_line_request reqbuf;
+	int ret;
+
+	memset(&reqbuf, 0, sizeof(reqbuf));
+	gpiod_request_config_to_kernel(req_cfg, &reqbuf);
+	gpiod_line_config_to_kernel(line_cfg, &reqbuf.config);
+
+	ret = ioctl(chip->fd, GPIO_V2_GET_LINE_IOCTL, &reqbuf);
+	if (ret < 0)
+		return NULL;
+
+	return gpiod_request_handle_from_fd(reqbuf.fd);
+}
diff --git a/lib/config.c b/lib/config.c
new file mode 100644
index 0000000..924302e
--- /dev/null
+++ b/lib/config.c
@@ -0,0 +1,158 @@
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
+#include "uapi/gpio.h"
+
+#define LINE_CONFIG_ATTR_MAX 10
+
+struct gpiod_line_config {
+	struct gpiod_refcount refcount;
+	int request_type;
+	int drive;
+	int bias;
+	bool active_low;
+	bool clock_realtime;
+	struct gpiod_line_attr *attrs[LINE_CONFIG_ATTR_MAX];
+	unsigned int num_attrs;
+};
+
+static void line_config_unref_attrs(struct gpiod_line_config *config)
+{
+	unsigned int i;
+
+	for (i = 0; i < config->num_attrs; i++)
+		gpiod_line_attr_unref(config->attrs[i]);
+}
+
+static void line_config_release(struct gpiod_refcount *refcount)
+{
+	struct gpiod_line_config *config;
+
+	config = gpiod_container_of(refcount,
+				    struct gpiod_line_config, refcount);
+
+	line_config_unref_attrs(config);
+	free(config);
+}
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
+	gpiod_refcount_init(&config->refcount, line_config_release);
+
+	return config;
+}
+
+GPIOD_API struct gpiod_line_config *
+gpiod_line_config_ref(struct gpiod_line_config *config)
+{
+	gpiod_refcount_ref(&config->refcount);
+	return config;
+}
+
+GPIOD_API void gpiod_line_config_unref(struct gpiod_line_config *config)
+{
+	gpiod_refcount_unref(&config->refcount);
+}
+
+GPIOD_API int gpiod_line_config_add_attribute(struct gpiod_line_config *config,
+					      struct gpiod_line_attr *attr)
+{
+	if (config->num_attrs == LINE_CONFIG_ATTR_MAX) {
+		errno = EBUSY;
+		return -1;
+	}
+
+	config->attrs[config->num_attrs++] = gpiod_line_attr_ref(attr);
+	return 0;
+}
+
+GPIOD_API void gpiod_line_config_clear_attrs(struct gpiod_line_config *config)
+{
+	line_config_unref_attrs(config);
+	memset(config->attrs, 0, sizeof(config->attrs));
+	config->num_attrs = 0;
+}
+
+GPIOD_API int
+gpiod_line_config_set_request_type(struct gpiod_line_config *config,
+				   int request_type)
+{
+	int ret;
+
+	ret = gpiod_validate_request_type(request_type);
+	if (ret)
+		return -1;
+
+	config->request_type = request_type;
+	return 0;
+}
+
+GPIOD_API int
+gpiod_line_config_set_drive(struct gpiod_line_config *config, int drive)
+{
+	int ret;
+
+	ret = gpiod_validate_drive(drive);
+	if (ret)
+		return -1;
+
+	config->drive = drive;
+	return 0;
+}
+
+GPIOD_API int
+gpiod_line_config_set_bias(struct gpiod_line_config *config, int bias)
+{
+	int ret;
+
+	ret = gpiod_validate_bias(bias);
+	if (ret)
+		return -1;
+
+	config->bias = bias;
+	return 0;
+}
+
+GPIOD_API void
+gpiod_line_config_set_active_low(struct gpiod_line_config *config,
+				 bool active_low)
+{
+	config->active_low = active_low;
+}
+
+GPIOD_API void
+gpiod_line_config_set_event_clock_realtime(struct gpiod_line_config *config,
+					   bool clock_realtime)
+{
+	config->clock_realtime = clock_realtime;
+}
+
+void gpiod_line_config_to_kernel(struct gpiod_line_config *config,
+				 struct gpio_v2_line_config *cfgbuf)
+{
+	unsigned int i;
+
+	cfgbuf->flags = gpiod_make_kernel_flags(config->request_type,
+						config->drive, config->bias,
+						config->active_low,
+						config->clock_realtime);
+
+	cfgbuf->num_attrs = config->num_attrs;
+	for (i = 0; i < config->num_attrs; i++)
+		gpiod_line_attr_to_kernel(config->attrs[i], &cfgbuf->attrs[i]);
+}
diff --git a/lib/core.c b/lib/core.c
deleted file mode 100644
index ed65653..0000000
--- a/lib/core.c
+++ /dev/null
@@ -1,1131 +0,0 @@
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
-#include <time.h>
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
-	struct gpiod_refcount refcount;
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
-GPIOD_API struct gpiod_line_info *
-gpiod_chip_get_line_info(struct gpiod_chip *chip, unsigned int offset)
-{
-	struct gpio_v2_line_info infobuf;
-	int ret;
-
-	memset(&infobuf, 0, sizeof(infobuf));
-	infobuf.offset = offset;
-
-	ret = ioctl(chip->fd, GPIO_V2_GET_LINEINFO_IOCTL, &infobuf);
-	if (ret < 0)
-		return NULL;
-
-	return gpiod_line_info_from_kernel(&infobuf);
-}
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
-static void chip_release(struct gpiod_refcount *refcount)
-{
-	struct gpiod_chip *chip;
-	struct gpiod_line *line;
-	unsigned int i;
-
-	chip = gpiod_container_of(refcount, struct gpiod_chip, refcount);
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
-	gpiod_refcount_init(&chip->refcount, chip_release);
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
-	gpiod_refcount_ref(&chip->refcount);
-	return chip;
-}
-
-GPIOD_API void gpiod_chip_unref(struct gpiod_chip *chip)
-{
-	gpiod_refcount_unref(&chip->refcount);
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
-GPIOD_API int gpiod_line_event_wait(struct gpiod_line *line, uint64_t timeout)
-{
-	struct gpiod_line_bulk bulk = BULK_SINGLE_LINE_INIT(line);
-
-	return gpiod_line_event_wait_bulk(&bulk, timeout, NULL);
-}
-
-GPIOD_API int gpiod_line_event_wait_bulk(struct gpiod_line_bulk *bulk,
-					 uint64_t timeout,
-					 struct gpiod_line_bulk *event_bulk)
-{
-	struct pollfd fds[LINE_REQUEST_MAX_LINES];
-	unsigned int off, num_lines;
-	struct gpiod_line *line;
-	struct timespec ts;
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
-	ts.tv_sec = timeout / 1000000000ULL;
-	ts.tv_nsec = timeout % 1000000000ULL;
-
-	rv = ppoll(fds, num_lines, &ts, NULL);
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
-GPIOD_API int gpiod_line_event_get_fd(struct gpiod_line *line)
-{
-	if (line->state != LINE_REQUESTED_EVENTS) {
-		errno = EPERM;
-		return -1;
-	}
-
-	return line_get_fd(line);
-}
diff --git a/lib/event.c b/lib/event.c
index f4dfce8..03b2781 100644
--- a/lib/event.c
+++ b/lib/event.c
@@ -3,6 +3,7 @@
 
 #include <errno.h>
 #include <gpiod.h>
+#include <stdlib.h>
 #include <string.h>
 #include <unistd.h>
 
@@ -169,48 +170,15 @@ gpiod_line_event_buffer_copy_event(struct gpiod_line_event_buffer *buf,
 	return event;
 }
 
-GPIOD_API int gpiod_line_event_read(struct gpiod_line *line,
-				    struct gpiod_line_event_buffer *buf)
-{
-	int ret;
-
-	ret = gpiod_line_event_read_multiple(line, buf, 1);
-	if (ret < 0)
-		return -1;
-
-	return 0;
-}
-
-GPIOD_API int
-gpiod_line_event_read_multiple(struct gpiod_line *line,
-			       struct gpiod_line_event_buffer *buf,
-			       unsigned int num_events)
-{
-	int fd;
-
-	fd = gpiod_line_event_get_fd(line);
-	if (fd < 0)
-		return -1;
-
-	return gpiod_line_event_read_fd_multiple(fd, buf, num_events);
-}
-
-GPIOD_API int gpiod_line_event_read_fd(int fd,
-				       struct gpiod_line_event_buffer *buf)
+GPIOD_API unsigned int
+gpiod_line_event_buffer_num_events(struct gpiod_line_event_buffer *buf)
 {
-	int ret;
-
-	ret = gpiod_line_event_read_fd_multiple(fd, buf, 1);
-	if (ret < 0)
-		return -1;
-
-	return 0;
+	return buf->num_events;
 }
 
 GPIOD_API int
-gpiod_line_event_read_fd_multiple(int fd,
-				  struct gpiod_line_event_buffer *buf,
-				  unsigned int max_events)
+gpiod_line_event_buffer_read_fd(int fd, struct gpiod_line_event_buffer *buf,
+				unsigned int max_events)
 {
 	struct gpio_v2_line_event *curr;
 	struct gpiod_line_event *event;
diff --git a/lib/handle.c b/lib/handle.c
new file mode 100644
index 0000000..abd08f9
--- /dev/null
+++ b/lib/handle.c
@@ -0,0 +1,144 @@
+// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-FileCopyrightText: 2021 Bartosz Golaszewski <brgl@bgdev.pl>
+
+/* Line attribute data structure and functions. */
+
+#include <errno.h>
+#include <gpiod.h>
+#include <poll.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/ioctl.h>
+#include <unistd.h>
+
+#include "internal.h"
+#include "uapi/gpio.h"
+
+struct gpiod_request_handle {
+	struct gpiod_refcount refcount;
+	int fd;
+};
+
+static void request_handle_release(struct gpiod_refcount *refcount)
+{
+	struct gpiod_request_handle *handle;
+
+	handle = gpiod_container_of(refcount,
+				    struct gpiod_request_handle, refcount);
+
+	close(handle->fd);
+	free(handle);
+}
+
+struct gpiod_request_handle *gpiod_request_handle_from_fd(int fd)
+{
+	struct gpiod_request_handle *handle;
+
+	handle = malloc(sizeof(*handle));
+	if (!handle)
+		return NULL;
+
+	memset(handle, 0, sizeof(*handle));
+	gpiod_refcount_init(&handle->refcount, request_handle_release);
+	handle->fd = fd;
+
+	return handle;
+}
+
+GPIOD_API struct gpiod_request_handle *
+gpiod_request_handle_ref(struct gpiod_request_handle *handle)
+{
+	gpiod_refcount_ref(&handle->refcount);
+	return handle;
+}
+
+GPIOD_API void gpiod_request_handle_unref(struct gpiod_request_handle *handle)
+{
+	gpiod_refcount_unref(&handle->refcount);
+}
+
+GPIOD_API int
+gpiod_request_handle_get_values(struct gpiod_request_handle *handle,
+				gpiod_line_mask *values,
+				gpiod_line_mask mask)
+{
+	struct gpio_v2_line_values valbuf;
+	int ret;
+
+	valbuf.bits = 0;
+	valbuf.mask = mask;
+
+	ret = ioctl(handle->fd, GPIO_V2_LINE_GET_VALUES_IOCTL, &valbuf);
+	if (ret)
+		return -1;
+
+	*values = valbuf.bits;
+
+	return 0;
+}
+
+GPIOD_API int
+gpiod_request_handle_set_values(struct gpiod_request_handle *handle,
+				gpiod_line_mask values,
+				gpiod_line_mask mask)
+{
+	struct gpio_v2_line_values valbuf;
+
+	valbuf.bits = values;
+	valbuf.mask = mask;
+
+	return ioctl(handle->fd, GPIO_V2_LINE_SET_VALUES_IOCTL, &valbuf);
+}
+
+GPIOD_API int
+gpiod_request_handle_set_config(struct gpiod_request_handle *handle,
+				struct gpiod_line_config *config)
+{
+	struct gpio_v2_line_config cfgbuf;
+	int ret;
+
+	gpiod_line_config_to_kernel(config, &cfgbuf);
+
+	ret = ioctl(handle->fd, GPIO_V2_LINE_SET_CONFIG_IOCTL, &cfgbuf);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+GPIOD_API int
+gpiod_request_handle_event_wait(struct gpiod_request_handle *handle,
+				uint64_t timeout)
+{
+	struct timespec ts;
+	struct pollfd pfd;
+	int ret;
+
+	memset(&pfd, 0, sizeof(pfd));
+	pfd.fd = handle->fd;
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
+GPIOD_API int
+gpiod_request_handle_event_read(struct gpiod_request_handle *handle,
+				struct gpiod_line_event_buffer *buf,
+				unsigned int max_events)
+{
+	return gpiod_line_event_buffer_read_fd(handle->fd, buf, max_events);
+}
+
+GPIOD_API int gpiod_request_handle_get_fd(struct gpiod_request_handle *handle)
+{
+	return handle->fd;
+}
diff --git a/lib/helpers.c b/lib/helpers.c
deleted file mode 100644
index 6e15dcf..0000000
--- a/lib/helpers.c
+++ /dev/null
@@ -1,306 +0,0 @@
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
-	struct gpiod_line_info *info;
-	const char *tmp;
-
-	num_lines = gpiod_chip_get_num_lines(chip);
-
-	for (offset = 0; offset < num_lines; offset++) {
-		info = gpiod_chip_get_line_info(chip, offset);
-		if (!info)
-			return -1;
-
-		tmp = gpiod_line_get_name(info);
-		if (tmp && strcmp(tmp, name) == 0) {
-			gpiod_line_info_unref(info);
-			return offset;
-		}
-
-		gpiod_line_info_unref(info);
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
diff --git a/lib/info.c b/lib/info.c
index 5f7c463..ef69309 100644
--- a/lib/info.c
+++ b/lib/info.c
@@ -2,6 +2,7 @@
 // SPDX-FileCopyrightText: 2021 Bartosz Golaszewski <brgl@bgdev.pl>
 
 #include <gpiod.h>
+#include <stdlib.h>
 #include <string.h>
 
 #include "internal.h"
diff --git a/lib/internal.c b/lib/internal.c
index 52b9461..06adcd2 100644
--- a/lib/internal.c
+++ b/lib/internal.c
@@ -1,6 +1,8 @@
 // SPDX-License-Identifier: LGPL-2.1-or-later
 // SPDX-FileCopyrightText: 2021 Bartosz Golaszewski <brgl@bgdev.pl>
 
+#include <errno.h>
+
 #include "internal.h"
 
 void gpiod_refcount_init(struct gpiod_refcount *refcount,
@@ -20,3 +22,102 @@ void gpiod_refcount_unref(struct gpiod_refcount *refcount)
 	if (--refcount->refcnt == 0)
 		refcount->release(refcount);
 }
+
+int gpiod_validate_request_type(int request_type)
+{
+	switch (request_type) {
+	case GPIOD_LINE_CONFIG_DIRECTION_AS_IS:
+	case GPIOD_LINE_CONFIG_DIRECTION_INPUT:
+	case GPIOD_LINE_CONFIG_DIRECTION_OUTPUT:
+	case GPIOD_LINE_CONFIG_EVENT_FALLING_EDGE:
+	case GPIOD_LINE_CONFIG_EVENT_RISING_EDGE:
+	case GPIOD_LINE_CONFIG_EVENT_BOTH_EDGES:
+		return 0;
+	}
+
+	errno = EINVAL;
+	return -1;
+}
+
+int gpiod_validate_drive(int drive)
+{
+	switch (drive) {
+	case GPIOD_LINE_CONFIG_DRIVE_PUSH_PULL:
+	case GPIOD_LINE_CONFIG_DRIVE_OPEN_DRAIN:
+	case GPIOD_LINE_CONFIG_DRIVE_OPEN_SOURCE:
+		return 0;
+	}
+
+	errno = EINVAL;
+	return -1;
+}
+
+int gpiod_validate_bias(int bias)
+{
+	switch (bias) {
+	case GPIOD_LINE_CONFIG_BIAS_DISABLED:
+	case GPIOD_LINE_CONFIG_BIAS_PULL_UP:
+	case GPIOD_LINE_CONFIG_BIAS_PULL_DOWN:
+		return 0;
+	}
+
+	errno = EINVAL;
+	return -1;
+}
+
+uint64_t gpiod_make_kernel_flags(int request_type, int drive, int bias,
+				 bool active_low, bool clock_realtime)
+{
+	uint64_t flags = 0;
+
+	switch (request_type) {
+	case GPIOD_LINE_CONFIG_DIRECTION_INPUT:
+		flags |= GPIO_V2_LINE_FLAG_INPUT;
+		break;
+	case GPIOD_LINE_CONFIG_DIRECTION_OUTPUT:
+		flags |= GPIO_V2_LINE_FLAG_OUTPUT;
+		break;
+	case GPIOD_LINE_CONFIG_EVENT_FALLING_EDGE:
+		flags |= (GPIO_V2_LINE_FLAG_EDGE_FALLING |
+			  GPIO_V2_LINE_FLAG_INPUT);
+		break;
+	case GPIOD_LINE_CONFIG_EVENT_RISING_EDGE:
+		flags |= (GPIO_V2_LINE_FLAG_EDGE_RISING |
+			  GPIO_V2_LINE_FLAG_INPUT);
+		break;
+	case GPIOD_LINE_CONFIG_EVENT_BOTH_EDGES:
+		flags |= (GPIO_V2_LINE_FLAG_EDGE_FALLING |
+			  GPIO_V2_LINE_FLAG_EDGE_RISING |
+			  GPIO_V2_LINE_FLAG_INPUT);
+		break;
+	}
+
+	switch (drive) {
+	case GPIOD_LINE_CONFIG_DRIVE_OPEN_DRAIN:
+		flags |= GPIO_V2_LINE_FLAG_OPEN_DRAIN;
+		break;
+	case GPIOD_LINE_CONFIG_DRIVE_OPEN_SOURCE:
+		flags |= GPIO_V2_LINE_FLAG_OPEN_SOURCE;
+		break;
+	}
+
+	switch (bias) {
+	case GPIOD_LINE_CONFIG_BIAS_DISABLED:
+		flags |= GPIO_V2_LINE_FLAG_BIAS_DISABLED;
+		break;
+	case GPIOD_LINE_CONFIG_BIAS_PULL_UP:
+		flags |= GPIO_V2_LINE_FLAG_BIAS_PULL_UP;
+		break;
+	case GPIOD_LINE_CONFIG_BIAS_PULL_DOWN:
+		flags |= GPIO_V2_LINE_FLAG_BIAS_PULL_DOWN;
+		break;
+	}
+
+	if (active_low)
+		flags |= GPIO_V2_LINE_FLAG_ACTIVE_LOW;
+
+	if (clock_realtime)
+		flags |= GPIO_V2_LINE_FLAG_EVENT_CLOCK_REALTIME;
+
+	return flags;
+}
diff --git a/lib/internal.h b/lib/internal.h
index 2d1627d..2677ee3 100644
--- a/lib/internal.h
+++ b/lib/internal.h
@@ -6,6 +6,7 @@
 
 #include <gpiod.h>
 #include <stddef.h>
+#include <stdint.h>
 
 #include "uapi/gpio.h"
 
@@ -32,5 +33,18 @@ void gpiod_refcount_unref(struct gpiod_refcount *refcount);
 
 struct gpiod_line_info *
 gpiod_line_info_from_kernel(struct gpio_v2_line_info *infobuf);
+void gpiod_request_config_to_kernel(struct gpiod_request_config *config,
+				    struct gpio_v2_line_request *reqbuf);
+void gpiod_line_config_to_kernel(struct gpiod_line_config *config,
+				 struct gpio_v2_line_config *cfgbuf);
+void gpiod_line_attr_to_kernel(struct gpiod_line_attr *attr,
+			       struct gpio_v2_line_config_attribute *attrbuf);
+uint64_t gpiod_make_kernel_flags(int request_type, int drive, int bias,
+				 bool active_low, bool clock_realtime);
+struct gpiod_request_handle *gpiod_request_handle_from_fd(int fd);
+
+int gpiod_validate_request_type(int request_type);
+int gpiod_validate_drive(int drive);
+int gpiod_validate_bias(int bias);
 
 #endif /* __LIBGPIOD_GPIOD_INTERNAL_H__ */
diff --git a/lib/mask.c b/lib/mask.c
new file mode 100644
index 0000000..0b24821
--- /dev/null
+++ b/lib/mask.c
@@ -0,0 +1,43 @@
+// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-FileCopyrightText: 2021 Bartosz Golaszewski <brgl@bgdev.pl>
+
+/* Line mask bitmaps. */
+
+#include "internal.h"
+
+GPIOD_API void gpiod_line_mask_fill(gpiod_line_mask *mask)
+{
+	*mask = UINT64_MAX;
+}
+
+GPIOD_API void gpiod_line_mask_zero(gpiod_line_mask *mask)
+{
+	*mask = 0ULL;
+}
+
+GPIOD_API bool gpiod_line_mask_test_bit(gpiod_line_mask mask,
+					unsigned int offset)
+{
+	return mask & (1ULL << offset);
+}
+
+GPIOD_API void gpiod_line_mask_set_bit(gpiod_line_mask *mask,
+				       unsigned int offset)
+{
+	*mask |= (1ULL << offset);
+}
+
+GPIOD_API void gpiod_line_mask_clear_bit(gpiod_line_mask *mask,
+					 unsigned int offset)
+{
+	*mask &= ~(1ULL << offset);
+}
+
+GPIOD_API void gpiod_line_mask_assign_bit(gpiod_line_mask *mask,
+					  unsigned int offset, bool value)
+{
+	if (value)
+		gpiod_line_mask_set_bit(mask, offset);
+	else
+		gpiod_line_mask_clear_bit(mask, offset);
+}
diff --git a/lib/misc.c b/lib/misc.c
index 67654f9..0b945ef 100644
--- a/lib/misc.c
+++ b/lib/misc.c
@@ -3,10 +3,85 @@
 
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
+		/*
+		 * Passing a file descriptor not associated with a character
+		 * device to ioctl() makes it set errno to ENOTTY. Let's do
+		 * the same in order to stay compatible with the versions of
+		 * libgpiod from before the introduction of this routine.
+		 */
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
+		/*
+		 * This is a character device but not the one we're after.
+		 * Before the introduction of this function, we'd fail with
+		 * ENOTTY on the first GPIO ioctl() call for this file
+		 * descriptor. Let's stay compatible here and keep returning
+		 * the same error code.
+		 */
+		errno = ENOTTY;
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
 GPIOD_API uint64_t gpiod_sec_to_nsec(uint64_t sec)
 {
 	return sec * 1000000000ULL;
diff --git a/lib/request.c b/lib/request.c
new file mode 100644
index 0000000..1b9ae03
--- /dev/null
+++ b/lib/request.c
@@ -0,0 +1,118 @@
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
+#include "uapi/gpio.h"
+
+struct gpiod_request_config {
+	struct gpiod_refcount refcount;
+	char consumer[GPIO_MAX_NAME_SIZE];
+	unsigned int offsets[GPIO_V2_LINES_MAX];
+	unsigned int num_lines;
+	unsigned int event_buffer_size;
+};
+
+static void request_config_release(struct gpiod_refcount *refcount)
+{
+	struct gpiod_request_config *config;
+
+	config = gpiod_container_of(refcount,
+				    struct gpiod_request_config, refcount);
+
+	free(config);
+}
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
+	gpiod_refcount_init(&config->refcount, request_config_release);
+
+	return config;
+}
+
+GPIOD_API struct gpiod_request_config *
+gpiod_request_config_ref(struct gpiod_request_config *config)
+{
+	gpiod_refcount_ref(&config->refcount);
+	return config;
+}
+
+GPIOD_API void gpiod_request_config_unref(struct gpiod_request_config *config)
+{
+	gpiod_refcount_unref(&config->refcount);
+}
+
+GPIOD_API int
+gpiod_request_config_set_consumer(struct gpiod_request_config *config,
+				  const char *consumer)
+{
+	if (strlen(consumer) >= GPIO_MAX_NAME_SIZE) {
+		errno = EINVAL;
+		return -1;
+	}
+
+	strncpy(config->consumer, consumer, GPIO_MAX_NAME_SIZE - 1);
+	config->consumer[GPIO_MAX_NAME_SIZE - 1] = '\0';
+
+	return 0;
+}
+
+GPIOD_API int
+gpiod_request_config_set_offsets(struct gpiod_request_config *config,
+				 unsigned int num_lines,
+				 unsigned int *offsets)
+{
+	unsigned int i;
+
+	if (num_lines > GPIO_V2_LINES_MAX) {
+		errno = EINVAL;
+		return -1;
+	}
+
+	for (i = 0; i < num_lines; i++)
+		config->offsets[i] = offsets[i];
+
+	config->num_lines = num_lines;
+
+	return 0;
+}
+
+GPIOD_API int
+gpiod_request_config_set_event_buffer_size(struct gpiod_request_config *config,
+					   unsigned int event_buffer_size)
+{
+	if (event_buffer_size == 0 ||
+	    event_buffer_size > (GPIO_V2_LINES_MAX * 16)) {
+		errno = EINVAL;
+		return -1;
+	}
+
+	config->event_buffer_size = event_buffer_size;
+	return 0;
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
diff --git a/tests/tests-event.c b/tests/tests-event.c
index cb4aac4..6908b04 100644
--- a/tests/tests-event.c
+++ b/tests/tests-event.c
@@ -36,7 +36,7 @@ GPIOD_TEST_CASE(rising_edge_good, 0, { 8 })
 
 	ev_thread = gpiod_test_start_event_thread(0, 7, 100);
 
-	ret = gpiod_line_event_wait(line, timeout);
+	ret = gpiod_request_handle_event_wait(line, timeout);
 	g_assert_cmpint(ret, ==, 1);
 
 	ret = gpiod_line_event_read(line, event_buf);
@@ -79,7 +79,7 @@ GPIOD_TEST_CASE(falling_edge_good, 0, { 8 })
 
 	ev_thread = gpiod_test_start_event_thread(0, 7, 100);
 
-	ret = gpiod_line_event_wait(line, timeout);
+	ret = gpiod_request_handle_event_wait(line, timeout);
 	g_assert_cmpint(ret, ==, 1);
 
 	ret = gpiod_line_event_read(line, event_buf);
@@ -127,17 +127,17 @@ GPIOD_TEST_CASE(rising_edge_ignore_falling, 0, { 8 })
 
 	ev_thread = gpiod_test_start_event_thread(0, 7, 100);
 
-	ret = gpiod_line_event_wait(line, timeout);
+	ret = gpiod_request_handle_event_wait(line, timeout);
 	g_assert_cmpint(ret, ==, 1);
 	ret = gpiod_line_event_read(line, event_buf0);
 	g_assert_cmpint(ret, ==, 0);
 
-	ret = gpiod_line_event_wait(line, timeout);
+	ret = gpiod_request_handle_event_wait(line, timeout);
 	g_assert_cmpint(ret, ==, 1);
 	ret = gpiod_line_event_read(line, event_buf1);
 	g_assert_cmpint(ret, ==, 0);
 
-	ret = gpiod_line_event_wait(line, timeout);
+	ret = gpiod_request_handle_event_wait(line, timeout);
 	g_assert_cmpint(ret, ==, 1);
 	ret = gpiod_line_event_read(line, event_buf2);
 	g_assert_cmpint(ret, ==, 0);
@@ -186,7 +186,7 @@ GPIOD_TEST_CASE(both_edges, 0, { 8 })
 
 	ev_thread = gpiod_test_start_event_thread(0, 7, 100);
 
-	ret = gpiod_line_event_wait(line, timeout);
+	ret = gpiod_request_handle_event_wait(line, timeout);
 	g_assert_cmpint(ret, ==, 1);
 
 	ret = gpiod_line_event_read(line, event_buf);
@@ -199,7 +199,7 @@ GPIOD_TEST_CASE(both_edges, 0, { 8 })
 	g_assert_cmpint(gpiod_line_event_get_event_type(event), ==,
 			GPIOD_LINE_EVENT_RISING_EDGE);
 
-	ret = gpiod_line_event_wait(line, timeout);
+	ret = gpiod_request_handle_event_wait(line, timeout);
 	g_assert_cmpint(ret, ==, 1);
 
 	ret = gpiod_line_event_read(line, event_buf);
@@ -242,7 +242,7 @@ GPIOD_TEST_CASE(both_edges_active_low, 0, { 8 })
 
 	ev_thread = gpiod_test_start_event_thread(0, 7, 100);
 
-	ret = gpiod_line_event_wait(line, timeout);
+	ret = gpiod_request_handle_event_wait(line, timeout);
 	g_assert_cmpint(ret, ==, 1);
 
 	ret = gpiod_line_event_read(line, event_buf);
@@ -255,7 +255,7 @@ GPIOD_TEST_CASE(both_edges_active_low, 0, { 8 })
 	g_assert_cmpint(gpiod_line_event_get_event_type(event), ==,
 			GPIOD_LINE_EVENT_FALLING_EDGE);
 
-	ret = gpiod_line_event_wait(line, timeout);
+	ret = gpiod_request_handle_event_wait(line, timeout);
 	g_assert_cmpint(ret, ==, 1);
 
 	ret = gpiod_line_event_read(line, event_buf);
@@ -298,7 +298,7 @@ GPIOD_TEST_CASE(both_edges_bias_disable, 0, { 8 })
 
 	ev_thread = gpiod_test_start_event_thread(0, 7, 100);
 
-	ret = gpiod_line_event_wait(line, timeout);
+	ret = gpiod_request_handle_event_wait(line, timeout);
 	g_assert_cmpint(ret, ==, 1);
 
 	ret = gpiod_line_event_read(line, event_buf);
@@ -311,7 +311,7 @@ GPIOD_TEST_CASE(both_edges_bias_disable, 0, { 8 })
 	g_assert_cmpint(gpiod_line_event_get_event_type(event), ==,
 			GPIOD_LINE_EVENT_RISING_EDGE);
 
-	ret = gpiod_line_event_wait(line, timeout);
+	ret = gpiod_request_handle_event_wait(line, timeout);
 	g_assert_cmpint(ret, ==, 1);
 
 	ret = gpiod_line_event_read(line, event_buf);
@@ -354,7 +354,7 @@ GPIOD_TEST_CASE(both_edges_bias_pull_down, 0, { 8 })
 
 	ev_thread = gpiod_test_start_event_thread(0, 7, 100);
 
-	ret = gpiod_line_event_wait(line, timeout);
+	ret = gpiod_request_handle_event_wait(line, timeout);
 	g_assert_cmpint(ret, ==, 1);
 
 	ret = gpiod_line_event_read(line, event_buf);
@@ -367,7 +367,7 @@ GPIOD_TEST_CASE(both_edges_bias_pull_down, 0, { 8 })
 	g_assert_cmpint(gpiod_line_event_get_event_type(event), ==,
 			GPIOD_LINE_EVENT_RISING_EDGE);
 
-	ret = gpiod_line_event_wait(line, timeout);
+	ret = gpiod_request_handle_event_wait(line, timeout);
 	g_assert_cmpint(ret, ==, 1);
 
 	ret = gpiod_line_event_read(line, event_buf);
@@ -410,7 +410,7 @@ GPIOD_TEST_CASE(both_edges_bias_pull_up, 0, { 8 })
 
 	ev_thread = gpiod_test_start_event_thread(0, 7, 100);
 
-	ret = gpiod_line_event_wait(line, timeout);
+	ret = gpiod_request_handle_event_wait(line, timeout);
 	g_assert_cmpint(ret, ==, 1);
 
 	ret = gpiod_line_event_read(line, event_buf);
@@ -423,7 +423,7 @@ GPIOD_TEST_CASE(both_edges_bias_pull_up, 0, { 8 })
 	g_assert_cmpint(gpiod_line_event_get_event_type(event), ==,
 			GPIOD_LINE_EVENT_FALLING_EDGE);
 
-	ret = gpiod_line_event_wait(line, timeout);
+	ret = gpiod_request_handle_event_wait(line, timeout);
 	g_assert_cmpint(ret, ==, 1);
 
 	ret = gpiod_line_event_read(line, event_buf);
@@ -466,7 +466,7 @@ GPIOD_TEST_CASE(falling_edge_active_low, 0, { 8 })
 
 	ev_thread = gpiod_test_start_event_thread(0, 7, 100);
 
-	ret = gpiod_line_event_wait(line, timeout);
+	ret = gpiod_request_handle_event_wait(line, timeout);
 	g_assert_cmpint(ret, ==, 1);
 
 	ret = gpiod_line_event_read(line, event_buf);
@@ -513,7 +513,7 @@ GPIOD_TEST_CASE(get_value, 0, { 8 })
 
 	ev_thread = gpiod_test_start_event_thread(0, 7, 100);
 
-	ret = gpiod_line_event_wait(line, timeout);
+	ret = gpiod_request_handle_event_wait(line, timeout);
 	g_assert_cmpint(ret, ==, 1);
 
 	ret = gpiod_line_event_read(line, event_buf);
@@ -561,7 +561,7 @@ GPIOD_TEST_CASE(get_value_active_low, 0, { 8 })
 
 	ev_thread = gpiod_test_start_event_thread(0, 7, 100);
 
-	ret = gpiod_line_event_wait(line, timeout);
+	ret = gpiod_request_handle_event_wait(line, timeout);
 	g_assert_cmpint(ret, ==, 1);
 
 	ret = gpiod_line_event_read(line, event_buf);
@@ -836,7 +836,7 @@ GPIOD_TEST_CASE(invalid_fd, 0, { 8 })
 	fd = gpiod_line_event_get_fd(line);
 	close(fd);
 
-	ret = gpiod_line_event_wait(line, timeout);
+	ret = gpiod_request_handle_event_wait(line, timeout);
 	g_assert_cmpint(ret, ==, -1);
 	g_assert_cmpint(errno, ==, EINVAL);
 
@@ -890,7 +890,7 @@ GPIOD_TEST_CASE(read_events_individually, 0, { 8 })
 	}
 
 	/* read them individually... */
-	ret = gpiod_line_event_wait(line, timeout);
+	ret = gpiod_request_handle_event_wait(line, timeout);
 	g_assert_cmpint(ret, ==, 1);
 	if (!ret)
 		return;
@@ -905,7 +905,7 @@ GPIOD_TEST_CASE(read_events_individually, 0, { 8 })
 	g_assert_cmpint(gpiod_line_event_get_event_type(event), ==,
 			GPIOD_LINE_EVENT_FALLING_EDGE);
 
-	ret = gpiod_line_event_wait(line, timeout);
+	ret = gpiod_request_handle_event_wait(line, timeout);
 	g_assert_cmpint(ret, ==, 1);
 	if (!ret)
 		return;
@@ -920,7 +920,7 @@ GPIOD_TEST_CASE(read_events_individually, 0, { 8 })
 	g_assert_cmpint(gpiod_line_event_get_event_type(event), ==,
 			GPIOD_LINE_EVENT_RISING_EDGE);
 
-	ret = gpiod_line_event_wait(line, timeout);
+	ret = gpiod_request_handle_event_wait(line, timeout);
 	g_assert_cmpint(ret, ==, 1);
 	if (!ret)
 		return;
@@ -935,7 +935,7 @@ GPIOD_TEST_CASE(read_events_individually, 0, { 8 })
 	g_assert_cmpint(gpiod_line_event_get_event_type(event), ==,
 			GPIOD_LINE_EVENT_FALLING_EDGE);
 
-	ret = gpiod_line_event_wait(line, timeout);
+	ret = gpiod_request_handle_event_wait(line, timeout);
 	g_assert_cmpint(ret, ==, 0);
 }
 
@@ -978,7 +978,7 @@ GPIOD_TEST_CASE(read_multiple_events, 0, { 8 })
 		usleep(10000);
 	}
 
-	ret = gpiod_line_event_wait(line, timeout);
+	ret = gpiod_request_handle_event_wait(line, timeout);
 	g_assert_cmpint(ret, ==, 1);
 	if (!ret)
 		return;
@@ -1001,7 +1001,7 @@ GPIOD_TEST_CASE(read_multiple_events, 0, { 8 })
 	g_assert_cmpint(gpiod_line_event_get_event_type(events[2]), ==,
 			GPIOD_LINE_EVENT_RISING_EDGE);
 
-	ret = gpiod_line_event_wait(line, timeout);
+	ret = gpiod_request_handle_event_wait(line, timeout);
 	g_assert_cmpint(ret, ==, 1);
 	if (!ret)
 		return;
@@ -1031,7 +1031,7 @@ GPIOD_TEST_CASE(read_multiple_events, 0, { 8 })
 	g_assert_cmpint(gpiod_line_event_get_event_type(events[3]), ==,
 			GPIOD_LINE_EVENT_RISING_EDGE);
 
-	ret = gpiod_line_event_wait(line, timeout);
+	ret = gpiod_request_handle_event_wait(line, timeout);
 	g_assert_cmpint(ret, ==, 0);
 }
 
@@ -1067,7 +1067,7 @@ GPIOD_TEST_CASE(read_multiple_events_fd, 0, { 8 })
 		usleep(10000);
 	}
 
-	ret = gpiod_line_event_wait(line, timeout);
+	ret = gpiod_request_handle_event_wait(line, timeout);
 	g_assert_cmpint(ret, ==, 1);
 	if (!ret)
 		return;
@@ -1093,7 +1093,7 @@ GPIOD_TEST_CASE(read_multiple_events_fd, 0, { 8 })
 	g_assert_cmpint(gpiod_line_event_get_event_type(events[2]), ==,
 			GPIOD_LINE_EVENT_RISING_EDGE);
 
-	ret = gpiod_line_event_wait(line, timeout);
+	ret = gpiod_request_handle_event_wait(line, timeout);
 	g_assert_cmpint(ret, ==, 1);
 	if (!ret)
 		return;
@@ -1123,6 +1123,6 @@ GPIOD_TEST_CASE(read_multiple_events_fd, 0, { 8 })
 	g_assert_cmpint(gpiod_line_event_get_event_type(events[3]), ==,
 			GPIOD_LINE_EVENT_RISING_EDGE);
 
-	ret = gpiod_line_event_wait(line, timeout);
+	ret = gpiod_request_handle_event_wait(line, timeout);
 	g_assert_cmpint(ret, ==, 0);
 }
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
index 10706e2..f053afa 100644
--- a/tools/gpiodetect.c
+++ b/tools/gpiodetect.c
@@ -6,6 +6,7 @@
 #include <getopt.h>
 #include <gpiod.h>
 #include <stdio.h>
+#include <stdlib.h>
 #include <string.h>
 
 #include "tools-common.h"
@@ -66,14 +67,8 @@ int main(int argc, char **argv)
 
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
diff --git a/tools/gpiofind.c b/tools/gpiofind.c
index 32b7852..a3df67c 100644
--- a/tools/gpiofind.c
+++ b/tools/gpiofind.c
@@ -6,6 +6,7 @@
 #include <getopt.h>
 #include <gpiod.h>
 #include <stdio.h>
+#include <stdlib.h>
 #include <string.h>
 
 #include "tools-common.h"
diff --git a/tools/gpioget.c b/tools/gpioget.c
index ceeec56..e404589 100644
--- a/tools/gpioget.c
+++ b/tools/gpioget.c
@@ -5,6 +5,7 @@
 #include <gpiod.h>
 #include <limits.h>
 #include <stdio.h>
+#include <stdlib.h>
 #include <string.h>
 
 #include "tools-common.h"
@@ -38,11 +39,14 @@ static void print_help(void)
 
 int main(int argc, char **argv)
 {
-	struct gpiod_line_request_config config;
-	int *values, optc, opti, rv, flags = 0;
+	struct gpiod_request_config *req_cfg;
+	struct gpiod_request_handle *handle;
 	unsigned int *offsets, i, num_lines;
-	struct gpiod_line_bulk *lines;
+	struct gpiod_line_config *line_cfg;
+	gpiod_line_mask values, lines;
+	int optc, opti, bias = 0, ret;
 	struct gpiod_chip *chip;
+	bool active_low = false;
 	char *device, *end;
 
 	for (;;) {
@@ -58,10 +62,10 @@ int main(int argc, char **argv)
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
 		case '?':
 			die("try %s --help", get_progname());
@@ -82,9 +86,8 @@ int main(int argc, char **argv)
 	device = argv[0];
 	num_lines = argc - 1;
 
-	values = malloc(sizeof(*values) * num_lines);
 	offsets = malloc(sizeof(*offsets) * num_lines);
-	if (!values || !offsets)
+	if (!offsets)
 		die("out of memory");
 
 	for (i = 0; i < num_lines; i++) {
@@ -97,35 +100,43 @@ int main(int argc, char **argv)
 	if (!chip)
 		die_perror("unable to open %s", device);
 
-	lines = gpiod_chip_get_lines(chip, offsets, num_lines);
-	if (!lines)
-		die_perror("unable to retrieve GPIO lines from chip");
+	line_cfg = gpiod_line_config_new();
+	if (!line_cfg)
+		die_perror("unable to allocate the line config structure");
 
-	memset(&config, 0, sizeof(config));
+	if (bias)
+		gpiod_line_config_set_bias(line_cfg, bias);
+	gpiod_line_config_set_active_low(line_cfg, active_low);
+	gpiod_line_config_set_request_type(line_cfg,
+					   GPIOD_LINE_CONFIG_DIRECTION_INPUT);
 
-	config.consumer = "gpioget";
-	config.request_type = GPIOD_LINE_REQUEST_DIRECTION_INPUT;
-	config.flags = flags;
+	req_cfg = gpiod_request_config_new();
+	if (!req_cfg)
+		die_perror("unable to allocate the request config structure");
 
-	rv = gpiod_line_request_bulk(lines, &config, NULL);
-	if (rv)
+	gpiod_request_config_set_consumer(req_cfg, "gpioget");
+	gpiod_request_config_set_offsets(req_cfg, num_lines, offsets);
+
+	handle = gpiod_chip_request_lines(chip, req_cfg, line_cfg);
+	if (!handle)
 		die_perror("unable to request lines");
 
-	rv = gpiod_line_get_value_bulk(lines, values);
-	if (rv < 0)
-		die_perror("error reading GPIO values");
+	gpiod_line_mask_fill(&lines);
+	ret = gpiod_request_handle_get_values(handle, &values, lines);
+	if (ret)
+		die_perror("unable to read GPIO line values");
 
 	for (i = 0; i < num_lines; i++) {
-		printf("%d", values[i]);
+		printf("%d", !!gpiod_line_mask_test_bit(values, i));
 		if (i != num_lines - 1)
 			printf(" ");
 	}
 	printf("\n");
 
-	gpiod_line_release_bulk(lines);
+	gpiod_request_handle_unref(handle);
+	gpiod_request_config_unref(req_cfg);
+	gpiod_line_config_unref(line_cfg);
 	gpiod_chip_unref(chip);
-	gpiod_line_bulk_free(lines);
-	free(values);
 	free(offsets);
 
 	return EXIT_SUCCESS;
diff --git a/tools/gpioinfo.c b/tools/gpioinfo.c
index 7901036..fb14d89 100644
--- a/tools/gpioinfo.c
+++ b/tools/gpioinfo.c
@@ -7,6 +7,7 @@
 #include <gpiod.h>
 #include <stdarg.h>
 #include <stdio.h>
+#include <stdlib.h>
 #include <string.h>
 
 #include "tools-common.h"
@@ -221,14 +222,9 @@ int main(int argc, char **argv)
 
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
 
diff --git a/tools/gpiomon.c b/tools/gpiomon.c
index 3e6b715..d426064 100644
--- a/tools/gpiomon.c
+++ b/tools/gpiomon.c
@@ -8,6 +8,7 @@
 #include <poll.h>
 #include <signal.h>
 #include <stdio.h>
+#include <stdlib.h>
 #include <string.h>
 #include <unistd.h>
 
@@ -152,20 +153,19 @@ static void handle_signal(int signum UNUSED)
 
 int main(int argc, char **argv)
 {
-	unsigned int offsets[64], num_lines = 0, offset,
-		     events_wanted = 0, events_done = 0, x;
-	bool watch_rising = false, watch_falling = false;
+	unsigned int offsets[64], num_lines = 0, offset, events_wanted = 0,
+		     events_done = 0;
+	bool watch_rising = false, watch_falling = false, active_low = false;
+	struct gpiod_line_event_buffer *event_buffer;
+	int optc, opti, ret, i, event_type, bias = 0;
 	uint64_t timeout = gpiod_sec_to_nsec(10);
-	int flags = 0;
-	int optc, opti, rv, i, y, event_type;
-	struct mon_ctx ctx;
+	struct gpiod_request_config *req_cfg;
+	struct gpiod_request_handle *handle;
+	struct gpiod_line_config *line_cfg;
+	struct gpiod_line_event *event;
 	struct gpiod_chip *chip;
-	struct gpiod_line_bulk *lines, *evlines;
+	struct mon_ctx ctx;
 	char *end;
-	struct gpiod_line_request_config config;
-	struct gpiod_line *line;
-	struct gpiod_line_event_buffer *event_buffer;
-	struct gpiod_line_event *event;
 
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
+		event_type = GPIOD_LINE_CONFIG_EVENT_RISING_EDGE;
 	else if (watch_falling && !watch_rising)
-		event_type = GPIOD_LINE_REQUEST_EVENT_FALLING_EDGE;
+		event_type = GPIOD_LINE_CONFIG_EVENT_FALLING_EDGE;
 	else
-		event_type = GPIOD_LINE_REQUEST_EVENT_BOTH_EDGES;
+		event_type = GPIOD_LINE_CONFIG_EVENT_BOTH_EDGES;
 
 	if (argc < 1)
 		die("gpiochip must be specified");
@@ -253,70 +253,65 @@ int main(int argc, char **argv)
 	if (!chip)
 		die_perror("unable to open %s", argv[0]);
 
-	lines = gpiod_chip_get_lines(chip, offsets, num_lines);
-	if (!lines)
-		die_perror("unable to retrieve GPIO lines from chip");
+	line_cfg = gpiod_line_config_new();
+	if (!line_cfg)
+		die_perror("unable to allocate the line config structure");
 
-	memset(&config, 0, sizeof(config));
+	if (bias)
+		gpiod_line_config_set_bias(line_cfg, bias);
+	gpiod_line_config_set_active_low(line_cfg, active_low);
+	gpiod_line_config_set_request_type(line_cfg, event_type);
 
-	config.consumer = "gpiomon";
-	config.request_type = event_type;
-	config.flags = flags;
+	req_cfg = gpiod_request_config_new();
+	if (!req_cfg)
+		die_perror("unable to allocate the request config structure");
 
-	rv = gpiod_line_request_bulk(lines, &config, NULL);
-	if (rv)
-		die_perror("unable to request GPIO lines for events");
+	gpiod_request_config_set_consumer(req_cfg, "gpiomon");
+	gpiod_request_config_set_offsets(req_cfg, num_lines, offsets);
 
-	evlines = gpiod_line_bulk_new(num_lines);
-	if (!evlines)
-		die("out of memory");
+	handle = gpiod_chip_request_lines(chip, req_cfg, line_cfg);
+	if (!handle)
+		die_perror("unable to request lines");
 
 	event_buffer = gpiod_line_event_buffer_new(EVENT_BUF_SIZE);
 	if (!event_buffer)
 		die_perror("unable to allocate the line event buffer");
 
 	for (;;) {
-		gpiod_line_bulk_reset(evlines);
-		rv = gpiod_line_event_wait_bulk(lines, timeout, evlines);
-		if (rv < 0)
+		ret = gpiod_request_handle_event_wait(handle, timeout);
+		if (ret < 0)
 			die_perror("error waiting for events");
-		if (rv == 0)
+		if (ret == 0)
 			continue;
 
-		num_lines = gpiod_line_bulk_num_lines(evlines);
-
-		for (x = 0; x < num_lines; x++) {
-			line = gpiod_line_bulk_get_line(evlines, x);
-
-			rv = gpiod_line_event_read_multiple(line, event_buffer,
-							    EVENT_BUF_SIZE);
-			if (rv < 0)
-				die_perror("error reading line events");
+		ret = gpiod_request_handle_event_read(handle, event_buffer,
+						      EVENT_BUF_SIZE);
+		if (ret < 0)
+			die_perror("error reading line events");
 
-			for (y = 0; y < rv; y++) {
-				event = gpiod_line_event_buffer_get_event(
-							event_buffer, y);
-				if (!event)
-					die_perror("unable to retrieve the event");
+		for (i = 0; i < ret; i++) {
+			event  = gpiod_line_event_buffer_get_event(event_buffer,
+								   i);
+			if (!event)
+				die_perror("unable to retrieve the event from the buffer");
 
-				handle_event(gpiod_line_offset(line),
-					gpiod_line_event_get_event_type(event),
-					gpiod_line_event_get_timestamp(event),
-					&ctx);
+			handle_event(gpiod_line_event_get_line_offset(event),
+				     gpiod_line_event_get_event_type(event),
+				     gpiod_line_event_get_timestamp(event),
+				     &ctx);
 
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
+	gpiod_line_event_buffer_unref(event_buffer);
+	gpiod_request_handle_unref(handle);
+	gpiod_request_config_unref(req_cfg);
+	gpiod_line_config_unref(line_cfg);
 	gpiod_chip_unref(chip);
 
 	return EXIT_SUCCESS;
diff --git a/tools/gpioset.c b/tools/gpioset.c
index 7882b53..72f77ae 100644
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
@@ -189,12 +190,16 @@ static int drive_flags(const char *option)
 int main(int argc, char **argv)
 {
 	const struct mode_mapping *mode = &modes[MODE_EXIT];
-	struct gpiod_line_request_config config;
-	int *values, rv, optc, opti, flags = 0;
-	unsigned int *offsets, num_lines, i;
-	struct gpiod_line_bulk *lines;
+	unsigned int *offsets, num_lines, i, val;
+	int ret, optc, opti, bias = 0, drive = 0;
+	struct gpiod_request_config *req_cfg;
+	struct gpiod_request_handle *handle;
+	struct gpiod_line_config *line_cfg;
+	struct gpiod_line_attr *def_vals;
+	gpiod_line_mask values, mask;
 	struct callback_data cbdata;
 	struct gpiod_chip *chip;
+	bool active_low = false;
 	char *device, *end;
 
 	memset(&cbdata, 0, sizeof(cbdata));
@@ -212,13 +217,13 @@ int main(int argc, char **argv)
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
@@ -268,48 +273,74 @@ int main(int argc, char **argv)
 	num_lines = argc - 1;
 
 	offsets = malloc(sizeof(*offsets) * num_lines);
-	values = malloc(sizeof(*values) * num_lines);
-	if (!values || !offsets)
+	if (!offsets)
 		die("out of memory");
 
+	gpiod_line_mask_zero(&values);
+	gpiod_line_mask_zero(&mask);
+
 	for (i = 0; i < num_lines; i++) {
-		rv = sscanf(argv[i + 1], "%u=%d", &offsets[i], &values[i]);
-		if (rv != 2)
+		ret = sscanf(argv[i + 1], "%u=%d", &offsets[i], &val);
+		if (ret != 2)
 			die("invalid offset<->value mapping: %s", argv[i + 1]);
 
-		if (values[i] != 0 && values[i] != 1)
+		if (val != 0 && val != 1)
 			die("value must be 0 or 1: %s", argv[i + 1]);
 
 		if (offsets[i] > INT_MAX)
 			die("invalid offset: %s", argv[i + 1]);
+
+		gpiod_line_mask_assign_bit(&values, i, val);
+		gpiod_line_mask_set_bit(&mask, i);
 	}
 
 	chip = chip_open_lookup(device);
 	if (!chip)
 		die_perror("unable to open %s", device);
 
-	lines = gpiod_chip_get_lines(chip, offsets, num_lines);
-	if (!lines)
-		die_perror("unable to retrieve GPIO lines from chip");
+	def_vals = gpiod_line_attr_new(GPIOD_LINE_ATTR_TYPE_OUTPUT_VALUES);
+	if (!def_vals)
+		die_perror("unable to allocate the line attribute structure");
+
+	gpiod_line_attr_set_output_values(def_vals, values);
+	gpiod_line_attr_set_line_mask(def_vals, mask);
+
+	line_cfg = gpiod_line_config_new();
+	if (!line_cfg)
+		die_perror("unable to allocate the line config structure");
+
+	if (bias)
+		gpiod_line_config_set_bias(line_cfg, bias);
+	if (drive)
+		gpiod_line_config_set_drive(line_cfg, drive);
+	gpiod_line_config_set_active_low(line_cfg, active_low);
+	gpiod_line_config_set_request_type(line_cfg,
+					   GPIOD_LINE_CONFIG_DIRECTION_OUTPUT);
+
+	ret = gpiod_line_config_add_attribute(line_cfg, def_vals);
+	if (ret)
+		die_perror("unable to set line attribute");
 
-	memset(&config, 0, sizeof(config));
+	req_cfg = gpiod_request_config_new();
+	if (!req_cfg)
+		die_perror("unable to allocate the request config structure");
 
-	config.consumer = "gpioset";
-	config.request_type = GPIOD_LINE_REQUEST_DIRECTION_OUTPUT;
-	config.flags = flags;
+	gpiod_request_config_set_consumer(req_cfg, "gpioset");
+	gpiod_request_config_set_offsets(req_cfg, num_lines, offsets);
 
-	rv = gpiod_line_request_bulk(lines, &config, values);
-	if (rv)
+	handle = gpiod_chip_request_lines(chip, req_cfg, line_cfg);
+	if (!handle)
 		die_perror("unable to request lines");
 
 	if (mode->callback)
 		mode->callback(&cbdata);
 
-	gpiod_line_release_bulk(lines);
+	gpiod_request_handle_unref(handle);
+	gpiod_request_config_unref(req_cfg);
+	gpiod_line_config_unref(line_cfg);
+	gpiod_line_attr_unref(def_vals);
 	gpiod_chip_unref(chip);
-	gpiod_line_bulk_free(lines);
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

