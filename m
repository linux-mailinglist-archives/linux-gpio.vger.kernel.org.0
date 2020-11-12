Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27C1B2B037B
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Nov 2020 12:07:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727223AbgKLLH2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Nov 2020 06:07:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726061AbgKLLGx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Nov 2020 06:06:53 -0500
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9529FC0613D6
        for <linux-gpio@vger.kernel.org>; Thu, 12 Nov 2020 03:06:51 -0800 (PST)
Received: by mail-wr1-x444.google.com with SMTP id p8so5555060wrx.5
        for <linux-gpio@vger.kernel.org>; Thu, 12 Nov 2020 03:06:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MdVtEBjx9WEhlFncnkIMTMU4fydCXUBVHtcIUVtxKOQ=;
        b=KiXEkAHG9mnB1LhRgFmxzQ1PCyToZu0M0mqaGoxxENLBMiWd44L1Qr8Ll1CIE0SASH
         m4JkZL63d0JtF/nwd0+NC4LWYHRlhfgQlrhHO5vtsg6FNR+XzwXbvRMXxPQElqLP1g35
         zXVIc3pva5zAU6ffPsRug6o9SWTxHDZ+W3wzkDZEy2dJtgN1nz+7ZnXJpfdM3Y26nGAP
         1kFcAVr7HuewcX18okCRc4BmBIgN87/wt0gcdOlqIHS5rMkXKH0dUEr1XWu/OojCNfeR
         35vSBT3a4MQ6RqqMHsPNwM68cA8TNZLGqBYt+9ZhuQVCDvU3w1vZpzL9lox08bBRmCUW
         uoqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MdVtEBjx9WEhlFncnkIMTMU4fydCXUBVHtcIUVtxKOQ=;
        b=AEgW2IzY6yV25VDkbGu1cX0LECdo/h4Mqk7Yq9rnJ8rrnH53XvNOVeXrGKcgjf3tcs
         S3ITPHW6Ig8qxLmQMKDwJiiHjr7rjKHFGvFoUUep1ZoO9KqEThM6ipSaBA9Un/cmsp0x
         Kv/Kxynue73uMKToYWdKFUw+gBUq5tPTNnhoqgwDDRUjkduaULbH5A6f02clWEAeogWv
         +qugSKdtlq/bUIlOnRhavQmvai7CXQB/Pn3yokmmGDfQu9tbTMj8ZzGIX7LQpfLvpuyk
         ICoL+311VpxW7bdJ8njcPlgFCJ65A4XbpbPxVSPlQN8S0FTIugFB1qojuzrXf2iqzA7D
         oRsg==
X-Gm-Message-State: AOAM531mqP8EIEv5HS9UKrCCrymzAFavGYSWiUXOSD/Oywto/tqhFez5
        sIpLcpFSrWfPhTyNqXWRw05elQ==
X-Google-Smtp-Source: ABdhPJzJuCvqhUOxZiRfbqIpZxj/PFELgAcxiiTZUhGK3fxgl7S62fw6gBsXeQhy9apPHsAoEGyIUw==
X-Received: by 2002:a5d:6050:: with SMTP id j16mr37784234wrt.158.1605179209806;
        Thu, 12 Nov 2020 03:06:49 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-190-206.w2-15.abo.wanadoo.fr. [2.15.39.206])
        by smtp.gmail.com with ESMTPSA id q12sm5082413wrx.86.2020.11.12.03.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2020 03:06:49 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [libgpiod][PATCH 2/2] ctxless: drop all context-less interfaces
Date:   Thu, 12 Nov 2020 12:06:42 +0100
Message-Id: <20201112110642.14903-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201112110642.14903-1-brgl@bgdev.pl>
References: <20201112110642.14903-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

The context-less family of functions seems to be largely unused.
Drop this part of the codebase and convert tools to using the regular
low-level API.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 include/gpiod.h            | 406 ---------------------------------
 lib/Makefile.am            |   2 +-
 lib/ctxless.c              | 456 -------------------------------------
 tests/Makefile.am          |   1 -
 tests/tests-ctxless.c      | 375 ------------------------------
 tools/gpio-tools-test.bats |  12 +-
 tools/gpiofind.c           |  25 +-
 tools/gpioget.c            |  36 ++-
 tools/gpiomon.c            | 177 +++++++-------
 tools/gpioset.c            |  42 +++-
 tools/tools-common.c       |   6 +-
 11 files changed, 169 insertions(+), 1369 deletions(-)
 delete mode 100644 lib/ctxless.c
 delete mode 100644 tests/tests-ctxless.c

diff --git a/include/gpiod.h b/include/gpiod.h
index 7610eb1..97427b9 100644
--- a/include/gpiod.h
+++ b/include/gpiod.h
@@ -74,412 +74,6 @@ struct gpiod_line_bulk_iter;
  */
 #define GPIOD_BIT(nr)		(1UL << (nr))
 
-/**
- * @}
- *
- * @defgroup high_level High-level API
- * @{
- *
- * Simple high-level routines for straightforward GPIO manipulation without
- * the need to use the gpiod_* structures or to keep track of resources.
- */
-
-/**
- * @brief Miscellaneous GPIO flags.
- */
-enum {
-	GPIOD_CTXLESS_FLAG_OPEN_DRAIN		= GPIOD_BIT(0),
-	/**< The line is an open-drain port. */
-	GPIOD_CTXLESS_FLAG_OPEN_SOURCE		= GPIOD_BIT(1),
-	/**< The line is an open-source port. */
-	GPIOD_CTXLESS_FLAG_BIAS_DISABLE		= GPIOD_BIT(2),
-	/**< The line has neither either pull-up nor pull-down resistor */
-	GPIOD_CTXLESS_FLAG_BIAS_PULL_DOWN	= GPIOD_BIT(3),
-	/**< The line has pull-down resistor enabled */
-	GPIOD_CTXLESS_FLAG_BIAS_PULL_UP		= GPIOD_BIT(4),
-	/**< The line has pull-up resistor enabled */
-};
-
-/**
- * @brief Read current value from a single GPIO line.
- * @param device Name, path, number or label of the gpiochip.
- * @param offset Offset of the GPIO line.
- * @param active_low The active state of this line - true if low.
- * @param consumer Name of the consumer.
- * @return 0 or 1 (GPIO value) if the operation succeeds, -1 on error.
- */
-int gpiod_ctxless_get_value(const char *device, unsigned int offset,
-			    bool active_low, const char *consumer) GPIOD_API;
-
-/**
- * @brief Read current value from a single GPIO line.
- * @param device Name, path, number or label of the gpiochip.
- * @param offset Offset of the GPIO line.
- * @param active_low The active state of this line - true if low.
- * @param consumer Name of the consumer.
- * @param flags The flags for the line.
- * @return 0 or 1 (GPIO value) if the operation succeeds, -1 on error.
- */
-int gpiod_ctxless_get_value_ext(const char *device, unsigned int offset,
-				bool active_low, const char *consumer,
-				int flags) GPIOD_API;
-
-/**
- * @brief Read current values from a set of GPIO lines.
- * @param device Name, path, number or label of the gpiochip.
- * @param offsets Array of offsets of lines whose values should be read.
- * @param values Buffer in which the values will be stored.
- * @param num_lines Number of lines, must be > 0.
- * @param active_low The active state of the lines - true if low.
- * @param consumer Name of the consumer.
- * @return 0 if the operation succeeds, -1 on error.
- */
-int gpiod_ctxless_get_value_multiple(const char *device,
-				     const unsigned int *offsets, int *values,
-				     unsigned int num_lines, bool active_low,
-				     const char *consumer) GPIOD_API;
-
-/**
- * @brief Read current values from a set of GPIO lines.
- * @param device Name, path, number or label of the gpiochip.
- * @param offsets Array of offsets of lines whose values should be read.
- * @param values Buffer in which the values will be stored.
- * @param num_lines Number of lines, must be > 0.
- * @param active_low The active state of this line - true if low.
- * @param consumer Name of the consumer.
- * @param flags The flags for the lines.
- * @return 0 if the operation succeeds, -1 on error.
- */
-int gpiod_ctxless_get_value_multiple_ext(const char *device,
-					 const unsigned int *offsets,
-					 int *values, unsigned int num_lines,
-					 bool active_low, const char *consumer,
-					 int flags) GPIOD_API;
-
-/**
- * @brief Simple set value callback signature.
- */
-typedef void (*gpiod_ctxless_set_value_cb)(void *);
-
-/**
- * @brief Set value of a single GPIO line.
- * @param device Name, path, number or label of the gpiochip.
- * @param offset The offset of the GPIO line.
- * @param value New value (0 or 1).
- * @param active_low The active state of this line - true if low.
- * @param consumer Name of the consumer.
- * @param cb Optional callback function that will be called right after setting
- *           the value. Users can use this, for example, to pause the execution
- *           after toggling a GPIO.
- * @param data Optional user data that will be passed to the callback function.
- * @return 0 if the operation succeeds, -1 on error.
- */
-int gpiod_ctxless_set_value(const char *device, unsigned int offset, int value,
-			    bool active_low, const char *consumer,
-			    gpiod_ctxless_set_value_cb cb,
-			    void *data) GPIOD_API;
-
-/**
- * @brief Set value of a single GPIO line.
- * @param device Name, path, number or label of the gpiochip.
- * @param offset The offset of the GPIO line.
- * @param value New value (0 or 1).
- * @param active_low The active state of this line - true if low.
- * @param consumer Name of the consumer.
- * @param cb Optional callback function that will be called right after setting
- *           the value. Users can use this, for example, to pause the execution
- *           after toggling a GPIO.
- * @param data Optional user data that will be passed to the callback function.
- * @param flags The flags for the line.
- * @return 0 if the operation succeeds, -1 on error.
- */
-int gpiod_ctxless_set_value_ext(const char *device, unsigned int offset,
-				int value, bool active_low,
-				const char *consumer,
-				gpiod_ctxless_set_value_cb cb,
-				void *data, int flags) GPIOD_API;
-
-/**
- * @brief Set values of multiple GPIO lines.
- * @param device Name, path, number or label of the gpiochip.
- * @param offsets Array of offsets of lines the values of which should be set.
- * @param values Array of integers containing new values.
- * @param num_lines Number of lines, must be > 0.
- * @param active_low The active state of the lines - true if low.
- * @param consumer Name of the consumer.
- * @param cb Optional callback function that will be called right after setting
- *           all values. Works the same as in ::gpiod_ctxless_set_value.
- * @param data Optional user data that will be passed to the callback function.
- * @return 0 if the operation succeeds, -1 on error.
- */
-int gpiod_ctxless_set_value_multiple(const char *device,
-				     const unsigned int *offsets,
-				     const int *values, unsigned int num_lines,
-				     bool active_low, const char *consumer,
-				     gpiod_ctxless_set_value_cb cb,
-				     void *data) GPIOD_API;
-
-/**
- * @brief Set values of multiple GPIO lines.
- * @param device Name, path, number or label of the gpiochip.
- * @param offsets Array of offsets of lines the values of which should be set.
- * @param values Array of integers containing new values.
- * @param num_lines Number of lines, must be > 0.
- * @param active_low The active state of this line - true if low.
- * @param consumer Name of the consumer.
- * @param cb Optional callback function that will be called right after setting
- *           all values. Works the same as in ::gpiod_ctxless_set_value.
- * @param data Optional user data that will be passed to the callback function.
- * @param flags The flags for the lines.
- * @return 0 if the operation succeeds, -1 on error.
- */
-int gpiod_ctxless_set_value_multiple_ext(const char *device,
-					 const unsigned int *offsets,
-					 const int *values,
-					 unsigned int num_lines,
-					 bool active_low,
-					 const char *consumer,
-					 gpiod_ctxless_set_value_cb cb,
-					 void *data, int flags) GPIOD_API;
-
-/**
- * @brief Event types that the ctxless event monitor can wait for.
- */
-enum {
-	/**< Wait for rising edge events only. */
-	GPIOD_CTXLESS_EVENT_RISING_EDGE = 1,
-	/**< Wait for falling edge events only. */
-	GPIOD_CTXLESS_EVENT_FALLING_EDGE,
-	/**< Wait for both types of events. */
-	GPIOD_CTXLESS_EVENT_BOTH_EDGES,
-};
-
-/**
- * @brief Event types that can be passed to the ctxless event callback.
- */
-enum {
-	GPIOD_CTXLESS_EVENT_CB_TIMEOUT = 1,
-	/**< Waiting for events timed out. */
-	GPIOD_CTXLESS_EVENT_CB_RISING_EDGE,
-	/**< Rising edge event occured. */
-	GPIOD_CTXLESS_EVENT_CB_FALLING_EDGE,
-	/**< Falling edge event occured. */
-};
-
-/**
- * @brief Return status values that the ctxless event callback can return.
- */
-enum {
-	GPIOD_CTXLESS_EVENT_CB_RET_ERR = -1,
-	/**< Stop processing events and indicate an error. */
-	GPIOD_CTXLESS_EVENT_CB_RET_OK = 0,
-	/**< Continue processing events. */
-	GPIOD_CTXLESS_EVENT_CB_RET_STOP = 1,
-	/**< Stop processing events. */
-};
-
-/**
- * @brief Simple event callback signature.
- *
- * The callback function takes the following arguments: event type (int),
- * GPIO line offset (unsigned int), event timestamp (const struct timespec *)
- * and a pointer to user data (void *).
- *
- * This callback is called by the ctxless event loop functions for each GPIO
- * event. If the callback returns ::GPIOD_CTXLESS_EVENT_CB_RET_ERR, it should
- * also set errno.
- */
-typedef int (*gpiod_ctxless_event_handle_cb)(int, unsigned int,
-					     const struct timespec *, void *);
-
-/**
- * @brief Return status values that the ctxless event poll callback can return.
- *
- * Positive value returned from the polling callback indicates the number of
- * events that occurred on the set of monitored lines.
- */
-enum {
-	GPIOD_CTXLESS_EVENT_POLL_RET_STOP = -2,
-	/**< The event loop should stop processing events. */
-	GPIOD_CTXLESS_EVENT_POLL_RET_ERR = -1,
-	/**< Polling error occurred (the polling function should set errno). */
-	GPIOD_CTXLESS_EVENT_POLL_RET_TIMEOUT = 0,
-	/**< Poll timed out. */
-};
-
-/**
- * @brief Helper structure for the ctxless event loop poll callback.
- */
-struct gpiod_ctxless_event_poll_fd {
-	int fd;
-	/**< File descriptor number. */
-	bool event;
-	/**< Indicates whether an event occurred on this file descriptor. */
-};
-
-/**
- * @brief Simple event poll callback signature.
- *
- * The poll callback function takes the following arguments: number of lines
- * (unsigned int), an array of file descriptors on which input events should
- * be monitored (struct gpiod_ctxless_event_poll_fd *), poll timeout
- * (const struct timespec *) and a pointer to user data (void *).
- *
- * The callback should poll for input events on the set of descriptors and
- * return an appropriate value that can be interpreted by the event loop
- * routine.
- */
-typedef int (*gpiod_ctxless_event_poll_cb)(unsigned int,
-				struct gpiod_ctxless_event_poll_fd *,
-				const struct timespec *, void *);
-
-/**
- * @brief Wait for events on a single GPIO line.
- * @param device Name, path, number or label of the gpiochip.
- * @param event_type Type of events to listen for.
- * @param offset GPIO line offset to monitor.
- * @param active_low The active state of this line - true if low.
- * @param consumer Name of the consumer.
- * @param timeout Maximum wait time for each iteration.
- * @param poll_cb Callback function to call when waiting for events.
- * @param event_cb Callback function to call for each line event.
- * @param data User data passed to the callback.
- * @return 0 if no errors were encountered, -1 if an error occurred.
- * @note The way the ctxless event loop works is described in detail in
- *       ::gpiod_ctxless_event_monitor_multiple - this is just a wrapper aound
- *       this routine which calls it for a single GPIO line.
- */
-int gpiod_ctxless_event_monitor(const char *device, int event_type,
-				unsigned int offset, bool active_low,
-				const char *consumer,
-				const struct timespec *timeout,
-				gpiod_ctxless_event_poll_cb poll_cb,
-				gpiod_ctxless_event_handle_cb event_cb,
-				void *data) GPIOD_API;
-
-/**
- * @brief Wait for events on a single GPIO line.
- * @param device Name, path, number or label of the gpiochip.
- * @param event_type Type of events to listen for.
- * @param offset GPIO line offset to monitor.
- * @param active_low The active state of this line - true if low.
- * @param consumer Name of the consumer.
- * @param timeout Maximum wait time for each iteration.
- * @param poll_cb Callback function to call when waiting for events.
- * @param event_cb Callback function to call for each line event.
- * @param data User data passed to the callback.
- * @param flags The flags for the line.
- * @return 0 if no errors were encountered, -1 if an error occurred.
- * @note The way the ctxless event loop works is described in detail in
- *       ::gpiod_ctxless_event_monitor_multiple - this is just a wrapper aound
- *       this routine which calls it for a single GPIO line.
- */
-int gpiod_ctxless_event_monitor_ext(const char *device, int event_type,
-				    unsigned int offset, bool active_low,
-				    const char *consumer,
-				    const struct timespec *timeout,
-				    gpiod_ctxless_event_poll_cb poll_cb,
-				    gpiod_ctxless_event_handle_cb event_cb,
-				    void *data, int flags) GPIOD_API;
-
-/**
- * @brief Wait for events on multiple GPIO lines.
- * @param device Name, path, number or label of the gpiochip.
- * @param event_type Type of events to listen for.
- * @param offsets Array of GPIO line offsets to monitor.
- * @param num_lines Number of lines to monitor.
- * @param active_low The active state of this line - true if low.
- * @param consumer Name of the consumer.
- * @param timeout Maximum wait time for each iteration.
- * @param poll_cb Callback function to call when waiting for events. Can
- *                be NULL.
- * @param event_cb Callback function to call on event occurrence.
- * @param data User data passed to the callback.
- * @return 0 no errors were encountered, -1 if an error occurred.
- * @note The poll callback can be NULL in which case the routine will fall
- *       back to a basic, ppoll() based callback.
- *
- * Internally this routine opens the GPIO chip, requests the set of lines for
- * the type of events specified in the event_type parameter and calls the
- * polling callback in a loop. The role of the polling callback is to detect
- * input events on a set of file descriptors and notify the caller about the
- * fds ready for reading.
- *
- * The ctxless event loop then reads each queued event from marked descriptors
- * and calls the event callback. Both callbacks can stop the loop at any
- * point.
- *
- * The poll_cb argument can be NULL in which case the function falls back to
- * a default, ppoll() based callback.
- */
-int gpiod_ctxless_event_monitor_multiple(
-			const char *device, int event_type,
-			const unsigned int *offsets,
-			unsigned int num_lines, bool active_low,
-			const char *consumer, const struct timespec *timeout,
-			gpiod_ctxless_event_poll_cb poll_cb,
-			gpiod_ctxless_event_handle_cb event_cb,
-			void *data) GPIOD_API;
-
-/**
- * @brief Wait for events on multiple GPIO lines.
- * @param device Name, path, number or label of the gpiochip.
- * @param event_type Type of events to listen for.
- * @param offsets Array of GPIO line offsets to monitor.
- * @param num_lines Number of lines to monitor.
- * @param active_low The active state of this line - true if low.
- * @param consumer Name of the consumer.
- * @param timeout Maximum wait time for each iteration.
- * @param poll_cb Callback function to call when waiting for events. Can
- *                be NULL.
- * @param event_cb Callback function to call on event occurrence.
- * @param data User data passed to the callback.
- * @param flags The flags for the lines.
- * @return 0 no errors were encountered, -1 if an error occurred.
- * @note The poll callback can be NULL in which case the routine will fall
- *       back to a basic, ppoll() based callback.
- *
- * Internally this routine opens the GPIO chip, requests the set of lines for
- * the type of events specified in the event_type parameter and calls the
- * polling callback in a loop. The role of the polling callback is to detect
- * input events on a set of file descriptors and notify the caller about the
- * fds ready for reading.
- *
- * The ctxless event loop then reads each queued event from marked descriptors
- * and calls the event callback. Both callbacks can stop the loop at any
- * point.
- *
- * The poll_cb argument can be NULL in which case the function falls back to
- * a default, ppoll() based callback.
- */
-int gpiod_ctxless_event_monitor_multiple_ext(
-			const char *device, int event_type,
-			const unsigned int *offsets,
-			unsigned int num_lines, bool active_low,
-			const char *consumer, const struct timespec *timeout,
-			gpiod_ctxless_event_poll_cb poll_cb,
-			gpiod_ctxless_event_handle_cb event_cb,
-			void *data, int flags) GPIOD_API;
-
-
-/**
- * @brief Determine the chip name and line offset of a line with given name.
- * @param name The name of the GPIO line to lookup.
- * @param chipname Buffer in which the name of the GPIO chip will be stored.
- * @param chipname_size Size of the chip name buffer.
- * @param offset Pointer to an integer in which the line offset will be stored.
- * @return -1 on error, 0 if the line with given name doesn't exist and 1 if
- *         the line was found. In the first two cases the contents of chipname
- *         and offset remain unchanged.
- * @note The chip name is truncated if the buffer can't hold its entire size.
- * @attention GPIO line names are not unique in the linux kernel, neither
- *            globally nor within a single chip. This function finds the first
- *            line with given name.
- */
-int gpiod_ctxless_find_line(const char *name, char *chipname,
-			    size_t chipname_size,
-			    unsigned int *offset) GPIOD_API;
-
 /**
  * @}
  *
diff --git a/lib/Makefile.am b/lib/Makefile.am
index 53ef771..c5277ce 100644
--- a/lib/Makefile.am
+++ b/lib/Makefile.am
@@ -7,7 +7,7 @@
 #
 
 lib_LTLIBRARIES = libgpiod.la
-libgpiod_la_SOURCES = core.c ctxless.c helpers.c iter.c misc.c
+libgpiod_la_SOURCES = core.c helpers.c iter.c misc.c
 libgpiod_la_CFLAGS = -Wall -Wextra -g -std=gnu89
 libgpiod_la_CFLAGS += -fvisibility=hidden -I$(top_srcdir)/include/
 libgpiod_la_CFLAGS += -include $(top_builddir)/config.h
diff --git a/lib/ctxless.c b/lib/ctxless.c
deleted file mode 100644
index 091d788..0000000
--- a/lib/ctxless.c
+++ /dev/null
@@ -1,456 +0,0 @@
-// SPDX-License-Identifier: LGPL-2.1-or-later
-/*
- * This file is part of libgpiod.
- *
- * Copyright (C) 2017-2018 Bartosz Golaszewski <bartekgola@gmail.com>
- */
-
-/* Implementation of the high-level API. */
-
-
-#include <errno.h>
-#include <gpiod.h>
-#include <poll.h>
-#include <stdio.h>
-#include <string.h>
-
-static int ctxless_flags_to_line_request_flags(bool active_low, int flags)
-{
-	int req_flags = 0;
-
-	if (active_low)
-		req_flags |= GPIOD_LINE_REQUEST_FLAG_ACTIVE_LOW;
-	if (flags & GPIOD_CTXLESS_FLAG_OPEN_DRAIN)
-		req_flags |= GPIOD_LINE_REQUEST_FLAG_OPEN_DRAIN;
-	if (flags & GPIOD_CTXLESS_FLAG_OPEN_SOURCE)
-		req_flags |= GPIOD_LINE_REQUEST_FLAG_OPEN_SOURCE;
-	if (flags & GPIOD_CTXLESS_FLAG_BIAS_DISABLE)
-		req_flags |= GPIOD_LINE_REQUEST_FLAG_BIAS_DISABLE;
-	if (flags & GPIOD_CTXLESS_FLAG_BIAS_PULL_UP)
-		req_flags |= GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_UP;
-	if (flags & GPIOD_CTXLESS_FLAG_BIAS_PULL_DOWN)
-		req_flags |= GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_DOWN;
-
-	return req_flags;
-}
-
-int gpiod_ctxless_get_value(const char *device, unsigned int offset,
-			    bool active_low, const char *consumer)
-{
-	int value, rv;
-
-	rv = gpiod_ctxless_get_value_multiple(device, &offset, &value,
-					      1, active_low, consumer);
-	if (rv < 0)
-		return rv;
-
-	return value;
-}
-
-int gpiod_ctxless_get_value_ext(const char *device, unsigned int offset,
-				bool active_low, const char *consumer,
-				int flags)
-{
-	int value, rv;
-
-	rv = gpiod_ctxless_get_value_multiple_ext(device, &offset, &value, 1,
-						  active_low, consumer, flags);
-	if (rv < 0)
-		return rv;
-
-	return value;
-}
-
-int gpiod_ctxless_get_value_multiple(const char *device,
-				     const unsigned int *offsets, int *values,
-				     unsigned int num_lines, bool active_low,
-				     const char *consumer)
-{
-	int rv;
-
-	rv = gpiod_ctxless_get_value_multiple_ext(device, offsets, values,
-						  num_lines, active_low,
-						  consumer, 0);
-	return rv;
-}
-
-int gpiod_ctxless_get_value_multiple_ext(const char *device,
-					 const unsigned int *offsets,
-					 int *values, unsigned int num_lines,
-					 bool active_low,
-					 const char *consumer, int flags)
-{
-	struct gpiod_line_bulk *bulk;
-	struct gpiod_chip *chip;
-	struct gpiod_line *line;
-	unsigned int i;
-	int rv, req_flags;
-
-	if (!num_lines || num_lines > GPIOD_LINE_BULK_MAX_LINES) {
-		errno = EINVAL;
-		return -1;
-	}
-
-	chip = gpiod_chip_open_lookup(device);
-	if (!chip)
-		return -1;
-
-	bulk = gpiod_line_bulk_new(num_lines);
-	if (!bulk) {
-		gpiod_chip_close(chip);
-		return -1;
-	}
-
-	for (i = 0; i < num_lines; i++) {
-		line = gpiod_chip_get_line(chip, offsets[i]);
-		if (!line) {
-			gpiod_line_bulk_free(bulk);
-			gpiod_chip_close(chip);
-			return -1;
-		}
-
-		gpiod_line_bulk_add_line(bulk, line);
-	}
-
-	req_flags = ctxless_flags_to_line_request_flags(active_low, flags);
-	rv = gpiod_line_request_bulk_input_flags(bulk, consumer, req_flags);
-	if (rv < 0) {
-		gpiod_line_bulk_free(bulk);
-		gpiod_chip_close(chip);
-		return -1;
-	}
-
-	memset(values, 0, sizeof(*values) * num_lines);
-	rv = gpiod_line_get_value_bulk(bulk, values);
-
-	gpiod_line_bulk_free(bulk);
-	gpiod_chip_close(chip);
-
-	return rv;
-}
-
-int gpiod_ctxless_set_value(const char *device, unsigned int offset, int value,
-			    bool active_low, const char *consumer,
-			    gpiod_ctxless_set_value_cb cb, void *data)
-{
-	return gpiod_ctxless_set_value_multiple(device, &offset, &value, 1,
-						active_low, consumer, cb, data);
-}
-
-int gpiod_ctxless_set_value_ext(const char *device, unsigned int offset,
-				int value, bool active_low,
-				const char *consumer,
-				gpiod_ctxless_set_value_cb cb,
-				void *data, int flags)
-{
-	return gpiod_ctxless_set_value_multiple_ext(device, &offset, &value,
-						    1, active_low, consumer,
-						    cb, data, flags);
-}
-
-int gpiod_ctxless_set_value_multiple(const char *device,
-				     const unsigned int *offsets,
-				     const int *values, unsigned int num_lines,
-				     bool active_low, const char *consumer,
-				     gpiod_ctxless_set_value_cb cb, void *data)
-{
-	return gpiod_ctxless_set_value_multiple_ext(device, offsets, values,
-						    num_lines, active_low,
-						    consumer, cb, data, 0);
-}
-
-int gpiod_ctxless_set_value_multiple_ext(
-			const char *device, const unsigned int *offsets,
-			const int *values, unsigned int num_lines,
-			bool active_low, const char *consumer,
-			gpiod_ctxless_set_value_cb cb, void *data, int flags)
-{
-	struct gpiod_line_bulk *bulk;
-	struct gpiod_chip *chip;
-	struct gpiod_line *line;
-	unsigned int i;
-	int rv, req_flags;
-
-	if (!num_lines || num_lines > GPIOD_LINE_BULK_MAX_LINES) {
-		errno = EINVAL;
-		return -1;
-	}
-
-	chip = gpiod_chip_open_lookup(device);
-	if (!chip)
-		return -1;
-
-	bulk = gpiod_line_bulk_new(num_lines);
-	if (!bulk) {
-		gpiod_chip_close(chip);
-		return -1;
-	}
-
-	for (i = 0; i < num_lines; i++) {
-		line = gpiod_chip_get_line(chip, offsets[i]);
-		if (!line) {
-			gpiod_line_bulk_free(bulk);
-			gpiod_chip_close(chip);
-			return -1;
-		}
-
-		gpiod_line_bulk_add_line(bulk, line);
-	}
-
-	req_flags = ctxless_flags_to_line_request_flags(active_low, flags);
-	rv = gpiod_line_request_bulk_output_flags(bulk, consumer,
-						  req_flags, values);
-	if (rv < 0) {
-		gpiod_line_bulk_free(bulk);
-		gpiod_chip_close(chip);
-		return -1;
-	}
-
-	if (cb)
-		cb(data);
-
-	gpiod_line_bulk_free(bulk);
-	gpiod_chip_close(chip);
-
-	return 0;
-}
-
-static int basic_event_poll(unsigned int num_lines,
-			    struct gpiod_ctxless_event_poll_fd *fds,
-			    const struct timespec *timeout,
-			    void *data GPIOD_UNUSED)
-{
-	struct pollfd poll_fds[GPIOD_LINE_BULK_MAX_LINES];
-	unsigned int i;
-	int rv, ret;
-
-	if (!num_lines || num_lines > GPIOD_LINE_BULK_MAX_LINES)
-		return GPIOD_CTXLESS_EVENT_POLL_RET_ERR;
-
-	memset(poll_fds, 0, sizeof(poll_fds));
-
-	for (i = 0; i < num_lines; i++) {
-		poll_fds[i].fd = fds[i].fd;
-		poll_fds[i].events = POLLIN | POLLPRI;
-	}
-
-	rv = ppoll(poll_fds, num_lines, timeout, NULL);
-	if (rv < 0) {
-		if (errno == EINTR)
-			return GPIOD_CTXLESS_EVENT_POLL_RET_TIMEOUT;
-		else
-			return GPIOD_CTXLESS_EVENT_POLL_RET_ERR;
-	} else if (rv == 0) {
-		return GPIOD_CTXLESS_EVENT_POLL_RET_TIMEOUT;
-	}
-
-	ret = rv;
-	for (i = 0; i < num_lines; i++) {
-		if (poll_fds[i].revents) {
-			fds[i].event = true;
-			if (!--rv)
-				break;
-		}
-	}
-
-	return ret;
-}
-
-int gpiod_ctxless_event_monitor(const char *device, int event_type,
-				unsigned int offset, bool active_low,
-				const char *consumer,
-				const struct timespec *timeout,
-				gpiod_ctxless_event_poll_cb poll_cb,
-				gpiod_ctxless_event_handle_cb event_cb,
-				void *data)
-{
-	return gpiod_ctxless_event_monitor_multiple(device, event_type,
-						    &offset, 1, active_low,
-						    consumer, timeout,
-						    poll_cb, event_cb, data);
-}
-
-int gpiod_ctxless_event_monitor_ext(const char *device, int event_type,
-				    unsigned int offset, bool active_low,
-				    const char *consumer,
-				    const struct timespec *timeout,
-				    gpiod_ctxless_event_poll_cb poll_cb,
-				    gpiod_ctxless_event_handle_cb event_cb,
-				    void *data, int flags)
-{
-	return gpiod_ctxless_event_monitor_multiple_ext(
-			device, event_type, &offset, 1, active_low,
-			consumer, timeout, poll_cb, event_cb, data, flags);
-}
-
-int gpiod_ctxless_event_monitor_multiple(
-			const char *device, int event_type,
-			const unsigned int *offsets,
-			unsigned int num_lines, bool active_low,
-			const char *consumer,
-			const struct timespec *timeout,
-			gpiod_ctxless_event_poll_cb poll_cb,
-			gpiod_ctxless_event_handle_cb event_cb,
-			void *data)
-{
-	return gpiod_ctxless_event_monitor_multiple_ext(
-			device, event_type, offsets,
-			num_lines, active_low, consumer, timeout,
-			poll_cb, event_cb, data, 0);
-}
-
-int gpiod_ctxless_event_monitor_multiple_ext(
-			const char *device, int event_type,
-			const unsigned int *offsets,
-			unsigned int num_lines, bool active_low,
-			const char *consumer, const struct timespec *timeout,
-			gpiod_ctxless_event_poll_cb poll_cb,
-			gpiod_ctxless_event_handle_cb event_cb,
-			void *data, int flags)
-{
-	struct gpiod_ctxless_event_poll_fd fds[GPIOD_LINE_BULK_MAX_LINES];
-	struct gpiod_line_request_config conf;
-	struct gpiod_line_event event;
-	struct gpiod_line_bulk *bulk;
-	int rv, ret, evtype, cnt;
-	struct gpiod_chip *chip;
-	struct gpiod_line *line;
-	unsigned int i;
-
-	if (!num_lines || num_lines > GPIOD_LINE_BULK_MAX_LINES) {
-		errno = EINVAL;
-		return -1;
-	}
-
-	if (!poll_cb)
-		poll_cb = basic_event_poll;
-
-	chip = gpiod_chip_open_lookup(device);
-	if (!chip)
-		return -1;
-
-	bulk = gpiod_line_bulk_new(num_lines);
-	if (!bulk) {
-		gpiod_chip_close(chip);
-		return -1;
-	}
-
-	for (i = 0; i < num_lines; i++) {
-		line = gpiod_chip_get_line(chip, offsets[i]);
-		if (!line) {
-			ret = -1;
-			goto out;
-		}
-
-		gpiod_line_bulk_add_line(bulk, line);
-	}
-
-	conf.flags = ctxless_flags_to_line_request_flags(active_low, flags);
-	conf.consumer = consumer;
-
-	if (event_type == GPIOD_CTXLESS_EVENT_RISING_EDGE) {
-		conf.request_type = GPIOD_LINE_REQUEST_EVENT_RISING_EDGE;
-	} else if (event_type == GPIOD_CTXLESS_EVENT_FALLING_EDGE) {
-		conf.request_type = GPIOD_LINE_REQUEST_EVENT_FALLING_EDGE;
-	} else if (event_type == GPIOD_CTXLESS_EVENT_BOTH_EDGES) {
-		conf.request_type = GPIOD_LINE_REQUEST_EVENT_BOTH_EDGES;
-	} else {
-		errno = -EINVAL;
-		ret = -1;
-		goto out;
-	}
-
-	rv = gpiod_line_request_bulk(bulk, &conf, NULL);
-	if (rv) {
-		ret = -1;
-		goto out;
-	}
-
-	memset(fds, 0, sizeof(fds));
-	for (i = 0; i < num_lines; i++) {
-		line = gpiod_line_bulk_get_line(bulk, i);
-		fds[i].fd = gpiod_line_event_get_fd(line);
-	}
-
-	for (;;) {
-		for (i = 0; i < num_lines; i++)
-			fds[i].event = false;
-
-		cnt = poll_cb(num_lines, fds, timeout, data);
-		if (cnt == GPIOD_CTXLESS_EVENT_POLL_RET_ERR) {
-			ret = -1;
-			goto out;
-		} else if (cnt == GPIOD_CTXLESS_EVENT_POLL_RET_TIMEOUT) {
-			rv = event_cb(GPIOD_CTXLESS_EVENT_CB_TIMEOUT,
-				      0, &event.ts, data);
-			if (rv == GPIOD_CTXLESS_EVENT_CB_RET_ERR) {
-				ret = -1;
-				goto out;
-			} else if (rv == GPIOD_CTXLESS_EVENT_CB_RET_STOP) {
-				ret = 0;
-				goto out;
-			}
-		} else if (cnt == GPIOD_CTXLESS_EVENT_POLL_RET_STOP) {
-			ret = 0;
-			goto out;
-		}
-
-		for (i = 0; i < num_lines; i++) {
-			if (!fds[i].event)
-				continue;
-
-			line = gpiod_line_bulk_get_line(bulk, i);
-			rv = gpiod_line_event_read(line, &event);
-			if (rv < 0) {
-				ret = rv;
-				goto out;
-			}
-
-			if (event.event_type == GPIOD_LINE_EVENT_RISING_EDGE)
-				evtype = GPIOD_CTXLESS_EVENT_CB_RISING_EDGE;
-			else
-				evtype = GPIOD_CTXLESS_EVENT_CB_FALLING_EDGE;
-
-			rv = event_cb(evtype, gpiod_line_offset(line),
-				      &event.ts, data);
-			if (rv == GPIOD_CTXLESS_EVENT_CB_RET_ERR) {
-				ret = -1;
-				goto out;
-			} else if (rv == GPIOD_CTXLESS_EVENT_CB_RET_STOP) {
-				ret = 0;
-				goto out;
-			}
-
-			if (!--cnt)
-				break;
-		}
-	}
-
-out:
-	gpiod_line_bulk_free(bulk);
-	gpiod_chip_close(chip);
-
-	return ret;
-}
-
-int gpiod_ctxless_find_line(const char *name, char *chipname,
-			    size_t chipname_size, unsigned int *offset)
-{
-	struct gpiod_chip *chip;
-	struct gpiod_line *line;
-
-	line = gpiod_line_find(name);
-	if (!line) {
-		if (errno == ENOENT)
-			return 0;
-		else
-			return -1;
-	}
-
-	chip = gpiod_line_get_chip(line);
-	snprintf(chipname, chipname_size, "%s", gpiod_chip_name(chip));
-	*offset = gpiod_line_offset(line);
-	gpiod_chip_close(chip);
-
-	return 1;
-}
diff --git a/tests/Makefile.am b/tests/Makefile.am
index 4a3befd..5c7edb6 100644
--- a/tests/Makefile.am
+++ b/tests/Makefile.am
@@ -24,7 +24,6 @@ gpiod_test_SOURCES =			\
 		gpiod-test.h		\
 		tests-bulk.c		\
 		tests-chip.c		\
-		tests-ctxless.c		\
 		tests-event.c		\
 		tests-iter.c		\
 		tests-line.c		\
diff --git a/tests/tests-ctxless.c b/tests/tests-ctxless.c
deleted file mode 100644
index 76b9a7c..0000000
--- a/tests/tests-ctxless.c
+++ /dev/null
@@ -1,375 +0,0 @@
-// SPDX-License-Identifier: LGPL-2.1-or-later
-/*
- * This file is part of libgpiod.
- *
- * Copyright (C) 2019 Bartosz Golaszewski <bgolaszewski@baylibre.com>
- */
-
-#include <errno.h>
-
-#include "gpiod-test.h"
-
-#define GPIOD_TEST_GROUP "ctxless"
-
-GPIOD_TEST_CASE(get_value, 0, { 8 })
-{
-	gint ret;
-
-	ret = gpiod_ctxless_get_value(gpiod_test_chip_name(0), 3,
-				      false, GPIOD_TEST_CONSUMER);
-	g_assert_cmpint(ret, ==, 0);
-
-	gpiod_test_chip_set_pull(0, 3, 1);
-
-	ret = gpiod_ctxless_get_value(gpiod_test_chip_name(0), 3,
-				      false, GPIOD_TEST_CONSUMER);
-	g_assert_cmpint(ret, ==, 1);
-}
-
-GPIOD_TEST_CASE(get_value_ext, 0, { 8 })
-{
-	gint ret;
-
-	ret = gpiod_ctxless_get_value_ext(gpiod_test_chip_name(0), 3,
-				false, GPIOD_TEST_CONSUMER,
-				GPIOD_CTXLESS_FLAG_BIAS_PULL_DOWN);
-	g_assert_cmpint(ret, ==, 0);
-
-	ret = gpiod_ctxless_get_value_ext(gpiod_test_chip_name(0), 3,
-				false, GPIOD_TEST_CONSUMER,
-				GPIOD_CTXLESS_FLAG_BIAS_PULL_UP);
-	g_assert_cmpint(ret, ==, 1);
-
-	ret = gpiod_ctxless_get_value_ext(gpiod_test_chip_name(0), 3,
-				true, GPIOD_TEST_CONSUMER
-				, GPIOD_CTXLESS_FLAG_BIAS_PULL_DOWN);
-	g_assert_cmpint(ret, ==, 1);
-
-	ret = gpiod_ctxless_get_value_ext(gpiod_test_chip_name(0), 3,
-				true, GPIOD_TEST_CONSUMER,
-				GPIOD_CTXLESS_FLAG_BIAS_PULL_UP);
-	g_assert_cmpint(ret, ==, 0);
-}
-
-static void set_value_check_hi(gpointer data G_GNUC_UNUSED)
-{
-	g_assert_cmpint(gpiod_test_chip_get_value(0, 3), ==, 1);
-}
-
-static void set_value_check_lo(gpointer data G_GNUC_UNUSED)
-{
-	g_assert_cmpint(gpiod_test_chip_get_value(0, 3), ==, 0);
-}
-
-GPIOD_TEST_CASE(set_value, 0, { 8 })
-{
-	gint ret;
-
-	gpiod_test_chip_set_pull(0, 3, 0);
-
-	ret = gpiod_ctxless_set_value(gpiod_test_chip_name(0), 3, 1,
-				      false, GPIOD_TEST_CONSUMER,
-				      set_value_check_hi, NULL);
-	gpiod_test_return_if_failed();
-	g_assert_cmpint(ret, ==, 0);
-
-	g_assert_cmpint(gpiod_test_chip_get_value(0, 3), ==, 0);
-}
-
-GPIOD_TEST_CASE(set_value_ext, 0, { 8 })
-{
-	gint ret;
-
-	gpiod_test_chip_set_pull(0, 3, 0);
-
-	ret = gpiod_ctxless_set_value_ext(gpiod_test_chip_name(0), 3, 1,
-			false, GPIOD_TEST_CONSUMER,
-			set_value_check_hi, NULL, 0);
-	gpiod_test_return_if_failed();
-	g_assert_cmpint(ret, ==, 0);
-	g_assert_cmpint(gpiod_test_chip_get_value(0, 3), ==, 0);
-
-	/* test drive flags by checking that sets are caught by emulation */
-	ret = gpiod_ctxless_set_value_ext(gpiod_test_chip_name(0), 3, 1,
-			false, GPIOD_TEST_CONSUMER, set_value_check_lo,
-			NULL, GPIOD_CTXLESS_FLAG_OPEN_DRAIN);
-	gpiod_test_return_if_failed();
-	g_assert_cmpint(ret, ==, 0);
-	g_assert_cmpint(gpiod_test_chip_get_value(0, 3), ==, 0);
-
-	gpiod_test_chip_set_pull(0, 3, 1);
-	ret = gpiod_ctxless_set_value_ext(gpiod_test_chip_name(0), 3, 0,
-			false, GPIOD_TEST_CONSUMER, set_value_check_hi,
-			NULL, GPIOD_CTXLESS_FLAG_OPEN_SOURCE);
-	gpiod_test_return_if_failed();
-	g_assert_cmpint(ret, ==, 0);
-	g_assert_cmpint(gpiod_test_chip_get_value(0, 3), ==, 1);
-}
-
-static const guint get_value_multiple_offsets[] = {
-	1, 3, 4, 5, 6, 7, 8, 9, 13, 14
-};
-
-static const gint get_value_multiple_expected[] = {
-	1, 1, 1, 0, 0, 0, 1, 0, 1, 1
-};
-
-GPIOD_TEST_CASE(get_value_multiple, 0, { 16 })
-{
-	gint ret, values[10];
-	guint i;
-
-	for (i = 0; i < G_N_ELEMENTS(get_value_multiple_offsets); i++)
-		gpiod_test_chip_set_pull(0, get_value_multiple_offsets[i],
-					 get_value_multiple_expected[i]);
-
-	ret = gpiod_ctxless_get_value_multiple(gpiod_test_chip_name(0),
-					       get_value_multiple_offsets,
-					       values, 10, false,
-					       GPIOD_TEST_CONSUMER);
-	g_assert_cmpint(ret, ==, 0);
-
-	for (i = 0; i < G_N_ELEMENTS(get_value_multiple_offsets); i++)
-		g_assert_cmpint(values[i], ==, get_value_multiple_expected[i]);
-}
-
-static const guint set_value_multiple_offsets[] = {
-	0, 1, 2, 3, 4, 5, 6, 12, 13, 15
-};
-
-static const gint set_value_multiple_values[] = {
-	1, 1, 1, 0, 0, 1, 0, 1, 0, 0
-};
-
-static void set_value_multiple_check(gpointer data G_GNUC_UNUSED)
-{
-	guint i, offset;
-	gint val, exp;
-
-	for (i = 0; i < G_N_ELEMENTS(set_value_multiple_values); i++) {
-		offset = set_value_multiple_offsets[i];
-		exp = set_value_multiple_values[i];
-		val = gpiod_test_chip_get_value(0, offset);
-
-		g_assert_cmpint(val, ==, exp);
-	}
-}
-
-GPIOD_TEST_CASE(set_value_multiple, 0, { 16 })
-{
-	gint values[10], ret;
-	guint i;
-
-	for (i = 0; i < G_N_ELEMENTS(set_value_multiple_offsets); i++)
-		values[i] = set_value_multiple_values[i];
-
-	ret = gpiod_ctxless_set_value_multiple(gpiod_test_chip_name(0),
-			set_value_multiple_offsets, values, 10, false,
-			GPIOD_TEST_CONSUMER, set_value_multiple_check, NULL);
-	gpiod_test_return_if_failed();
-	g_assert_cmpint(ret, ==, 0);
-}
-
-GPIOD_TEST_CASE(get_value_multiple_max_lines, 0, { 128 })
-{
-	gint values[GPIOD_LINE_BULK_MAX_LINES + 1], ret;
-	guint offsets[GPIOD_LINE_BULK_MAX_LINES + 1];
-
-	ret = gpiod_ctxless_get_value_multiple(gpiod_test_chip_name(0),
-					       offsets, values,
-					       GPIOD_LINE_BULK_MAX_LINES + 1,
-					       false, GPIOD_TEST_CONSUMER);
-	g_assert_cmpint(ret, ==, -1);
-	g_assert_cmpint(errno, ==, EINVAL);
-}
-
-GPIOD_TEST_CASE(set_value_multiple_max_lines, 0, { 128 })
-{
-	gint values[GPIOD_LINE_BULK_MAX_LINES + 1], ret;
-	guint offsets[GPIOD_LINE_BULK_MAX_LINES + 1];
-
-	ret = gpiod_ctxless_set_value_multiple(gpiod_test_chip_name(0),
-				offsets, values, GPIOD_LINE_BULK_MAX_LINES + 1,
-				false, GPIOD_TEST_CONSUMER, NULL, NULL);
-	g_assert_cmpint(ret, ==, -1);
-	g_assert_cmpint(errno, ==, EINVAL);
-}
-
-struct ctxless_event_data {
-	gboolean got_rising_edge;
-	gboolean got_falling_edge;
-	guint offset;
-	guint count;
-};
-
-static int ctxless_event_cb(gint evtype, guint offset,
-			    const struct timespec *ts G_GNUC_UNUSED,
-			    gpointer data)
-{
-	struct ctxless_event_data *evdata = data;
-
-	if (evtype == GPIOD_CTXLESS_EVENT_CB_RISING_EDGE)
-		evdata->got_rising_edge = TRUE;
-	else if (evtype == GPIOD_CTXLESS_EVENT_CB_FALLING_EDGE)
-		evdata->got_falling_edge = TRUE;
-
-	evdata->offset = offset;
-
-	return ++evdata->count == 2 ? GPIOD_CTXLESS_EVENT_CB_RET_STOP
-				    : GPIOD_CTXLESS_EVENT_CB_RET_OK;
-}
-
-GPIOD_TEST_CASE(event_monitor, 0, { 8 })
-{
-	g_autoptr(GpiodTestEventThread) ev_thread = NULL;
-	struct ctxless_event_data evdata = { false, false, 0, 0 };
-	struct timespec ts = { 1, 0 };
-	gint ret;
-
-	ev_thread = gpiod_test_start_event_thread(0, 3, 100);
-
-	ret = gpiod_ctxless_event_monitor(gpiod_test_chip_name(0),
-					  GPIOD_CTXLESS_EVENT_BOTH_EDGES,
-					  3, false, GPIOD_TEST_CONSUMER, &ts,
-					  NULL, ctxless_event_cb, &evdata);
-	g_assert_cmpint(ret, ==, 0);
-	g_assert_true(evdata.got_rising_edge);
-	g_assert_true(evdata.got_falling_edge);
-	g_assert_cmpuint(evdata.count, ==, 2);
-	g_assert_cmpuint(evdata.offset, ==, 3);
-}
-
-GPIOD_TEST_CASE(event_monitor_single_event_type, 0, { 8 })
-{
-	g_autoptr(GpiodTestEventThread) ev_thread = NULL;
-	struct ctxless_event_data evdata = { false, false, 0, 0 };
-	struct timespec ts = { 1, 0 };
-	gint ret;
-
-	ev_thread = gpiod_test_start_event_thread(0, 3, 100);
-
-	ret = gpiod_ctxless_event_monitor(gpiod_test_chip_name(0),
-					  GPIOD_CTXLESS_EVENT_FALLING_EDGE,
-					  3, false, GPIOD_TEST_CONSUMER, &ts,
-					  NULL, ctxless_event_cb, &evdata);
-	g_assert_cmpint(ret, ==, 0);
-	g_assert_false(evdata.got_rising_edge);
-	g_assert_true(evdata.got_falling_edge);
-	g_assert_cmpuint(evdata.count, ==, 2);
-	g_assert_cmpuint(evdata.offset, ==, 3);
-}
-
-GPIOD_TEST_CASE(event_monitor_multiple, 0, { 8 })
-{
-	g_autoptr(GpiodTestEventThread) ev_thread = NULL;
-	struct ctxless_event_data evdata = { false, false, 0, 0 };
-	struct timespec ts = { 1, 0 };
-	guint offsets[4];
-	gint ret;
-
-	offsets[0] = 2;
-	offsets[1] = 3;
-	offsets[2] = 5;
-	offsets[3] = 6;
-
-	ev_thread = gpiod_test_start_event_thread(0, 3, 100);
-
-	ret = gpiod_ctxless_event_monitor_multiple(gpiod_test_chip_name(0),
-		GPIOD_CTXLESS_EVENT_BOTH_EDGES, offsets, 4, false,
-		GPIOD_TEST_CONSUMER, &ts, NULL, ctxless_event_cb, &evdata);
-	g_assert_cmpint(ret, ==, 0);
-	g_assert_true(evdata.got_rising_edge);
-	g_assert_true(evdata.got_falling_edge);
-	g_assert_cmpuint(evdata.count, ==, 2);
-	g_assert_cmpuint(evdata.offset, ==, 3);
-}
-
-static int error_event_cb(gint evtype G_GNUC_UNUSED,
-			  guint offset G_GNUC_UNUSED,
-			  const struct timespec *ts G_GNUC_UNUSED,
-			  gpointer data G_GNUC_UNUSED)
-{
-	errno = ENOTBLK;
-
-	return GPIOD_CTXLESS_EVENT_CB_RET_ERR;
-}
-
-GPIOD_TEST_CASE(event_monitor_indicate_error, 0, { 8 })
-{
-	g_autoptr(GpiodTestEventThread) ev_thread = NULL;
-	struct timespec ts = { 1, 0 };
-	gint ret;
-
-	ev_thread = gpiod_test_start_event_thread(0, 3, 100);
-
-	ret = gpiod_ctxless_event_monitor(gpiod_test_chip_name(0),
-					  GPIOD_CTXLESS_EVENT_BOTH_EDGES,
-					  3, false, GPIOD_TEST_CONSUMER, &ts,
-					  NULL, error_event_cb, NULL);
-	g_assert_cmpint(ret, ==, -1);
-	g_assert_cmpint(errno, ==, ENOTBLK);
-}
-
-static int error_event_cb_timeout(gint evtype,
-				  guint offset G_GNUC_UNUSED,
-				  const struct timespec *ts G_GNUC_UNUSED,
-				  gpointer data G_GNUC_UNUSED)
-{
-	errno = ENOTBLK;
-
-	g_assert_cmpint(evtype, ==, GPIOD_CTXLESS_EVENT_CB_TIMEOUT);
-
-	return GPIOD_CTXLESS_EVENT_CB_RET_ERR;
-}
-
-GPIOD_TEST_CASE(event_monitor_indicate_error_timeout, 0, { 8 })
-{
-	struct timespec ts = { 0, 100000 };
-	gint ret;
-
-	ret = gpiod_ctxless_event_monitor(gpiod_test_chip_name(0),
-					  GPIOD_CTXLESS_EVENT_BOTH_EDGES,
-					  3, false, GPIOD_TEST_CONSUMER, &ts,
-					  NULL, error_event_cb_timeout, NULL);
-	g_assert_cmpint(ret, ==, -1);
-	g_assert_cmpint(errno, ==, ENOTBLK);
-}
-
-GPIOD_TEST_CASE(find_line, GPIOD_TEST_FLAG_NAMED_LINES, { 8, 16, 16, 8 })
-{
-	gchar chip[32];
-	guint offset;
-	gint ret;
-
-	ret = gpiod_ctxless_find_line("gpio-mockup-C-14", chip,
-				      sizeof(chip), &offset);
-	g_assert_cmpint(ret, ==, 1);
-	g_assert_cmpuint(offset, ==, 14);
-	g_assert_cmpstr(chip, ==, gpiod_test_chip_name(2));
-}
-
-GPIOD_TEST_CASE(find_line_truncated,
-		GPIOD_TEST_FLAG_NAMED_LINES, { 8, 16, 16, 8 })
-{
-	gchar chip[6];
-	guint offset;
-	gint ret;
-
-	ret = gpiod_ctxless_find_line("gpio-mockup-C-14", chip,
-				      sizeof(chip), &offset);
-	g_assert_cmpint(ret, ==, 1);
-	g_assert_cmpuint(offset, ==, 14);
-	g_assert_cmpstr(chip, ==, "gpioc");
-}
-
-GPIOD_TEST_CASE(find_line_not_found,
-		GPIOD_TEST_FLAG_NAMED_LINES, { 8, 16, 16, 8 })
-{
-	gchar chip[32];
-	guint offset;
-	gint ret;
-
-	ret = gpiod_ctxless_find_line("nonexistent", chip,
-				      sizeof(chip), &offset);
-	g_assert_cmpint(ret, ==, 0);
-}
diff --git a/tools/gpio-tools-test.bats b/tools/gpio-tools-test.bats
index b756c43..ec39046 100755
--- a/tools/gpio-tools-test.bats
+++ b/tools/gpio-tools-test.bats
@@ -375,7 +375,7 @@ teardown() {
 	run_tool gpioget "$(gpio_mockup_chip_name 1)" 0 1 2 3 4
 
 	test "$status" -eq "1"
-	output_regex_match ".*error reading GPIO values"
+	output_regex_match ".*unable to retrieve GPIO lines from chip"
 }
 
 @test "gpioget: same line twice" {
@@ -384,7 +384,7 @@ teardown() {
 	run_tool gpioget "$(gpio_mockup_chip_name 1)" 0 0
 
 	test "$status" -eq "1"
-	output_regex_match ".*error reading GPIO values.*"
+	output_regex_match ".*unable to request lines.*"
 }
 
 @test "gpioget: invalid bias" {
@@ -583,7 +583,7 @@ teardown() {
 	run_tool gpioset "$(gpio_mockup_chip_name 1)" 0=1 1=1 2=1 3=1 4=1 5=1
 
 	test "$status" -eq "1"
-	output_regex_match ".*error setting the GPIO line values"
+	output_regex_match ".*unable to retrieve GPIO lines from chip"
 }
 
 @test "gpioset: use --sec without --mode=time" {
@@ -664,7 +664,7 @@ teardown() {
 	run_tool gpioset "$(gpio_mockup_chip_name 1)" 0=1 0=1
 
 	test "$status" -eq "1"
-	output_regex_match ".*error setting the GPIO line values.*"
+	output_regex_match ".*unable to request lines.*"
 }
 
 #
@@ -884,7 +884,7 @@ teardown() {
 	run_tool gpiomon "$(gpio_mockup_chip_name 1)" 0 0
 
 	test "$status" -eq "1"
-	output_regex_match ".*error waiting for events.*"
+	output_regex_match ".*unable to request GPIO lines for events"
 }
 
 @test "gpiomon: no arguments" {
@@ -909,7 +909,7 @@ teardown() {
 	run_tool gpiomon "$(gpio_mockup_chip_name 0)" 5
 
 	test "$status" -eq "1"
-	output_regex_match ".*error waiting for events"
+	output_regex_match ".*unable to retrieve GPIO lines from chip"
 }
 
 @test "gpiomon: invalid bias" {
diff --git a/tools/gpiofind.c b/tools/gpiofind.c
index 931ac40..2138ebf 100644
--- a/tools/gpiofind.c
+++ b/tools/gpiofind.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2017-2018 Bartosz Golaszewski <bartekgola@gmail.com>
  */
 
+#include <errno.h>
 #include <getopt.h>
 #include <gpiod.h>
 #include <stdio.h>
@@ -33,9 +34,9 @@ static void print_help(void)
 
 int main(int argc, char **argv)
 {
-	unsigned int offset;
-	int optc, opti, rv;
-	char chip[32];
+	int optc, opti, ret = EXIT_SUCCESS;
+	struct gpiod_chip *chip;
+	struct gpiod_line *line;
 
 	for (;;) {
 		optc = getopt_long(argc, argv, shortopts, longopts, &opti);
@@ -62,13 +63,19 @@ int main(int argc, char **argv)
 	if (argc != 1)
 		die("exactly one GPIO line name must be specified");
 
-	rv = gpiod_ctxless_find_line(argv[0], chip, sizeof(chip), &offset);
-	if (rv < 0)
+	line = gpiod_line_find(argv[0]);
+	if (!line) {
+		if (errno == ENOENT)
+			return EXIT_FAILURE;
+
 		die_perror("error performing the line lookup");
-	else if (rv == 0)
-		return EXIT_FAILURE;
+	}
+
+	chip = gpiod_line_get_chip(line);
+
+	printf("%s %u\n", gpiod_chip_name(chip), gpiod_line_offset(line));
 
-	printf("%s %u\n", chip, offset);
+	gpiod_chip_close(chip);
 
-	return EXIT_SUCCESS;
+	return ret;
 }
diff --git a/tools/gpioget.c b/tools/gpioget.c
index 815507d..11a9c9f 100644
--- a/tools/gpioget.c
+++ b/tools/gpioget.c
@@ -42,10 +42,11 @@ static void print_help(void)
 
 int main(int argc, char **argv)
 {
+	struct gpiod_line_request_config config;
+	int *values, optc, opti, rv, flags = 0;
 	unsigned int *offsets, i, num_lines;
-	int *values, optc, opti, rv;
-	bool active_low = false;
-	int flags = 0;
+	struct gpiod_line_bulk *lines;
+	struct gpiod_chip *chip;
 	char *device, *end;
 
 	for (;;) {
@@ -61,10 +62,10 @@ int main(int argc, char **argv)
 			print_version();
 			return EXIT_SUCCESS;
 		case 'l':
-			active_low = true;
+			flags |= GPIOD_LINE_REQUEST_FLAG_ACTIVE_LOW;
 			break;
 		case 'B':
-			flags = bias_flags(optarg);
+			flags |= bias_flags(optarg);
 			break;
 		case '?':
 			die("try %s --help", get_progname());
@@ -96,9 +97,25 @@ int main(int argc, char **argv)
 			die("invalid GPIO offset: %s", argv[i + 1]);
 	}
 
-	rv = gpiod_ctxless_get_value_multiple_ext(device, offsets, values,
-						  num_lines, active_low,
-						  "gpioget", flags);
+	chip = gpiod_chip_open_lookup(device);
+	if (!chip)
+		die_perror("unable to open %s", device);
+
+	lines = gpiod_chip_get_lines(chip, offsets, num_lines);
+	if (!lines)
+		die_perror("unable to retrieve GPIO lines from chip");
+
+	memset(&config, 0, sizeof(config));
+
+	config.consumer = "gpioget";
+	config.request_type = GPIOD_LINE_REQUEST_DIRECTION_INPUT;
+	config.flags = flags;
+
+	rv = gpiod_line_request_bulk(lines, &config, NULL);
+	if (rv)
+		die_perror("unable to request lines");
+
+	rv = gpiod_line_get_value_bulk(lines, values);
 	if (rv < 0)
 		die_perror("error reading GPIO values");
 
@@ -109,6 +126,9 @@ int main(int argc, char **argv)
 	}
 	printf("\n");
 
+	gpiod_line_release_bulk(lines);
+	gpiod_chip_close(chip);
+	gpiod_line_bulk_free(lines);
 	free(values);
 	free(offsets);
 
diff --git a/tools/gpiomon.c b/tools/gpiomon.c
index 213efaa..09d1ffd 100644
--- a/tools/gpiomon.c
+++ b/tools/gpiomon.c
@@ -10,6 +10,7 @@
 #include <gpiod.h>
 #include <limits.h>
 #include <poll.h>
+#include <signal.h>
 #include <stdio.h>
 #include <string.h>
 #include <unistd.h>
@@ -63,13 +64,8 @@ static void print_help(void)
 
 struct mon_ctx {
 	unsigned int offset;
-	unsigned int events_wanted;
-	unsigned int events_done;
-
 	bool silent;
 	char *fmt;
-
-	int sigfd;
 };
 
 static void event_print_custom(unsigned int offset,
@@ -96,7 +92,7 @@ static void event_print_custom(unsigned int offset,
 			printf("%u", offset);
 			break;
 		case 'e':
-			if (event_type == GPIOD_CTXLESS_EVENT_CB_RISING_EDGE)
+			if (event_type == GPIOD_LINE_EVENT_RISING_EDGE)
 				fputc('1', stdout);
 			else
 				fputc('0', stdout);
@@ -132,7 +128,7 @@ static void event_print_human_readable(unsigned int offset,
 {
 	char *evname;
 
-	if (event_type == GPIOD_CTXLESS_EVENT_CB_RISING_EDGE)
+	if (event_type == GPIOD_LINE_EVENT_RISING_EDGE)
 		evname = " RISING EDGE";
 	else
 		evname = "FALLING EDGE";
@@ -141,52 +137,8 @@ static void event_print_human_readable(unsigned int offset,
 	       evname, offset, ts->tv_sec, ts->tv_nsec);
 }
 
-static int poll_callback(unsigned int num_lines,
-			 struct gpiod_ctxless_event_poll_fd *fds,
-			 const struct timespec *timeout, void *data)
-{
-	struct pollfd pfds[GPIOD_LINE_BULK_MAX_LINES + 1];
-	struct mon_ctx *ctx = data;
-	int cnt, ts, rv;
-	unsigned int i;
-
-	for (i = 0; i < num_lines; i++) {
-		pfds[i].fd = fds[i].fd;
-		pfds[i].events = POLLIN | POLLPRI;
-	}
-
-	pfds[i].fd = ctx->sigfd;
-	pfds[i].events = POLLIN | POLLPRI;
-
-	ts = timeout->tv_sec * 1000 + timeout->tv_nsec / 1000000;
-
-	cnt = poll(pfds, num_lines + 1, ts);
-	if (cnt < 0)
-		return GPIOD_CTXLESS_EVENT_POLL_RET_ERR;
-	else if (cnt == 0)
-		return GPIOD_CTXLESS_EVENT_POLL_RET_TIMEOUT;
-
-	rv = cnt;
-	for (i = 0; i < num_lines; i++) {
-		if (pfds[i].revents) {
-			fds[i].event = true;
-			if (!--cnt)
-				return rv;
-		}
-	}
-
-	/*
-	 * If we're here, then there's a signal pending. No need to read it,
-	 * we know we should quit now.
-	 */
-	close(ctx->sigfd);
-
-	return GPIOD_CTXLESS_EVENT_POLL_RET_STOP;
-}
-
-static void handle_event(struct mon_ctx *ctx, int event_type,
-			 unsigned int line_offset,
-			 const struct timespec *timestamp)
+static void handle_event(unsigned int line_offset, unsigned int event_type,
+			 struct timespec *timestamp, struct mon_ctx *ctx)
 {
 	if (!ctx->silent) {
 		if (ctx->fmt)
@@ -196,43 +148,35 @@ static void handle_event(struct mon_ctx *ctx, int event_type,
 			event_print_human_readable(line_offset,
 						   timestamp, event_type);
 	}
-
-	ctx->events_done++;
 }
 
-static int event_callback(int event_type, unsigned int line_offset,
-			  const struct timespec *timestamp, void *data)
+static void handle_signal(int signum GPIOD_UNUSED)
 {
-	struct mon_ctx *ctx = data;
-
-	switch (event_type) {
-	case GPIOD_CTXLESS_EVENT_CB_RISING_EDGE:
-	case GPIOD_CTXLESS_EVENT_CB_FALLING_EDGE:
-		handle_event(ctx, event_type, line_offset, timestamp);
-		break;
-	default:
-		/*
-		 * REVISIT: This happening would indicate a problem in the
-		 * library.
-		 */
-		return GPIOD_CTXLESS_EVENT_CB_RET_OK;
-	}
-
-	if (ctx->events_wanted && ctx->events_done >= ctx->events_wanted)
-		return GPIOD_CTXLESS_EVENT_CB_RET_STOP;
-
-	return GPIOD_CTXLESS_EVENT_CB_RET_OK;
+	exit(EXIT_SUCCESS);
 }
 
 int main(int argc, char **argv)
 {
-	unsigned int offsets[GPIOD_LINE_BULK_MAX_LINES], num_lines = 0, offset;
-	bool active_low = false, watch_rising = false, watch_falling = false;
+	unsigned int offsets[GPIOD_LINE_BULK_MAX_LINES], num_lines = 0, offset,
+		     events_wanted = 0, events_done = 0, x;
+	bool watch_rising = false, watch_falling = false;
 	int flags = 0;
 	struct timespec timeout = { 10, 0 };
-	int optc, opti, rv, i, event_type;
+	int optc, opti, rv, i, y, event_type;
 	struct mon_ctx ctx;
+	struct gpiod_chip *chip;
+	struct gpiod_line_bulk *lines, *evlines;
 	char *end;
+	struct gpiod_line_request_config config;
+	struct gpiod_line *line;
+	struct gpiod_line_event events[16];
+
+	/*
+	 * FIXME: use signalfd once the API has been converted to using a single file
+	 * descriptor as provided by uAPI v2.
+	 */
+	signal(SIGINT, handle_signal);
+	signal(SIGTERM, handle_signal);
 
 	memset(&ctx, 0, sizeof(ctx));
 
@@ -249,13 +193,13 @@ int main(int argc, char **argv)
 			print_version();
 			return EXIT_SUCCESS;
 		case 'l':
-			active_low = true;
+			flags |= GPIOD_LINE_REQUEST_FLAG_ACTIVE_LOW;
 			break;
 		case 'B':
-			flags = bias_flags(optarg);
+			flags |= bias_flags(optarg);
 			break;
 		case 'n':
-			ctx.events_wanted = strtoul(optarg, &end, 10);
+			events_wanted = strtoul(optarg, &end, 10);
 			if (*end != '\0')
 				die("invalid number: %s", optarg);
 			break;
@@ -285,11 +229,11 @@ int main(int argc, char **argv)
 	argv += optind;
 
 	if (watch_rising && !watch_falling)
-		event_type = GPIOD_CTXLESS_EVENT_RISING_EDGE;
+		event_type = GPIOD_LINE_REQUEST_EVENT_RISING_EDGE;
 	else if (watch_falling && !watch_rising)
-		event_type = GPIOD_CTXLESS_EVENT_FALLING_EDGE;
+		event_type = GPIOD_LINE_REQUEST_EVENT_FALLING_EDGE;
 	else
-		event_type = GPIOD_CTXLESS_EVENT_BOTH_EDGES;
+		event_type = GPIOD_LINE_REQUEST_EVENT_BOTH_EDGES;
 
 	if (argc < 1)
 		die("gpiochip must be specified");
@@ -306,15 +250,64 @@ int main(int argc, char **argv)
 		num_lines++;
 	}
 
-	ctx.sigfd = make_signalfd();
+	chip = gpiod_chip_open_lookup(argv[0]);
+	if (!chip)
+		die_perror("unable to open %s", argv[0]);
+
+	lines = gpiod_chip_get_lines(chip, offsets, num_lines);
+	if (!lines)
+		die_perror("unable to retrieve GPIO lines from chip");
 
-	rv = gpiod_ctxless_event_monitor_multiple_ext(
-				argv[0], event_type, offsets,
-				num_lines, active_low, "gpiomon",
-				&timeout, poll_callback,
-				event_callback, &ctx, flags);
+	memset(&config, 0, sizeof(config));
+
+	config.consumer = "gpiomon";
+	config.request_type = event_type;
+	config.flags = flags;
+
+	rv = gpiod_line_request_bulk(lines, &config, NULL);
 	if (rv)
-		die_perror("error waiting for events");
+		die_perror("unable to request GPIO lines for events");
+
+	evlines = gpiod_line_bulk_new(num_lines);
+	if (!evlines)
+		die("out of memory");
+
+	for (;;) {
+		gpiod_line_bulk_clear(evlines);
+		rv = gpiod_line_event_wait_bulk(lines, &timeout, evlines);
+		if (rv < 0)
+			die_perror("error waiting for events");
+		if (rv == 0)
+			continue;
+
+		num_lines = gpiod_line_bulk_num_lines(evlines);
+
+		for (x = 0; x < num_lines; x++) {
+			line = gpiod_line_bulk_get_line(evlines, x);
+
+			rv = gpiod_line_event_read_multiple(line, events,
+							    ARRAY_SIZE(events));
+			if (rv < 0)
+				die_perror("error reading line events");
+
+			for (y = 0; y < rv; y++) {
+				handle_event(gpiod_line_offset(line),
+					     events[y].event_type,
+					     &events[y].ts, &ctx);
+				events_done++;
+
+				if (events_wanted &&
+				    events_done >= events_wanted)
+					goto done;
+			}
+		}
+	}
+
+done:
+	gpiod_line_release_bulk(lines);
+	gpiod_line_bulk_free(lines);
+	gpiod_line_bulk_free(evlines);
+	gpiod_chip_close(chip);
 
 	return EXIT_SUCCESS;
 }
diff --git a/tools/gpioset.c b/tools/gpioset.c
index fb6d51e..82dfa71 100644
--- a/tools/gpioset.c
+++ b/tools/gpioset.c
@@ -142,7 +142,7 @@ enum {
 struct mode_mapping {
 	int id;
 	const char *name;
-	gpiod_ctxless_set_value_cb callback;
+	void (*callback)(void *);
 };
 
 static const struct mode_mapping modes[] = {
@@ -182,9 +182,9 @@ static const struct mode_mapping *parse_mode(const char *mode)
 static int drive_flags(const char *option)
 {
 	if (strcmp(option, "open-drain") == 0)
-		return GPIOD_CTXLESS_FLAG_OPEN_DRAIN;
+		return GPIOD_LINE_REQUEST_FLAG_OPEN_DRAIN;
 	if (strcmp(option, "open-source") == 0)
-		return GPIOD_CTXLESS_FLAG_OPEN_SOURCE;
+		return GPIOD_LINE_REQUEST_FLAG_OPEN_SOURCE;
 	if (strcmp(option, "push-pull") != 0)
 		die("invalid drive: %s", option);
 	return 0;
@@ -193,10 +193,12 @@ static int drive_flags(const char *option)
 int main(int argc, char **argv)
 {
 	const struct mode_mapping *mode = &modes[MODE_EXIT];
-	unsigned int *offsets, num_lines, i;
+	struct gpiod_line_request_config config;
 	int *values, rv, optc, opti, flags = 0;
+	unsigned int *offsets, num_lines, i;
+	struct gpiod_line_bulk *lines;
 	struct callback_data cbdata;
-	bool active_low = false;
+	struct gpiod_chip *chip;
 	char *device, *end;
 
 	memset(&cbdata, 0, sizeof(cbdata));
@@ -214,7 +216,7 @@ int main(int argc, char **argv)
 			print_version();
 			return EXIT_SUCCESS;
 		case 'l':
-			active_low = true;
+			flags |= GPIOD_LINE_REQUEST_FLAG_ACTIVE_LOW;
 			break;
 		case 'B':
 			flags |= bias_flags(optarg);
@@ -286,13 +288,29 @@ int main(int argc, char **argv)
 			die("invalid offset: %s", argv[i + 1]);
 	}
 
-	rv = gpiod_ctxless_set_value_multiple_ext(
-				device, offsets, values,
-				num_lines, active_low, "gpioset",
-				mode->callback, &cbdata, flags);
-	if (rv < 0)
-		die_perror("error setting the GPIO line values");
+	chip = gpiod_chip_open_lookup(device);
+	if (!chip)
+		die_perror("unable to open %s", device);
+
+	lines = gpiod_chip_get_lines(chip, offsets, num_lines);
+	if (!lines)
+		die_perror("unable to retrieve GPIO lines from chip");
+
+	memset(&config, 0, sizeof(config));
+
+	config.consumer = "gpioset";
+	config.request_type = GPIOD_LINE_REQUEST_DIRECTION_OUTPUT;
+	config.flags = flags;
+
+	rv = gpiod_line_request_bulk(lines, &config, values);
+	if (rv)
+		die_perror("unable to request lines");
+
+	mode->callback(&cbdata);
 
+	gpiod_line_release_bulk(lines);
+	gpiod_chip_close(chip);
+	gpiod_line_bulk_free(lines);
 	free(offsets);
 	free(values);
 
diff --git a/tools/tools-common.c b/tools/tools-common.c
index 12bde20..af05102 100644
--- a/tools/tools-common.c
+++ b/tools/tools-common.c
@@ -63,11 +63,11 @@ void print_version(void)
 int bias_flags(const char *option)
 {
 	if (strcmp(option, "pull-down") == 0)
-		return GPIOD_CTXLESS_FLAG_BIAS_PULL_DOWN;
+		return GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_DOWN;
 	if (strcmp(option, "pull-up") == 0)
-		return GPIOD_CTXLESS_FLAG_BIAS_PULL_UP;
+		return GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_UP;
 	if (strcmp(option, "disable") == 0)
-		return GPIOD_CTXLESS_FLAG_BIAS_DISABLE;
+		return GPIOD_LINE_REQUEST_FLAG_BIAS_DISABLE;
 	if (strcmp(option, "as-is") != 0)
 		die("invalid bias: %s", option);
 	return 0;
-- 
2.29.1

