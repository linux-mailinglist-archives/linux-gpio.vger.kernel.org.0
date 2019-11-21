Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 535C7104797
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Nov 2019 01:36:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726548AbfKUAgX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 20 Nov 2019 19:36:23 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:39289 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726044AbfKUAgX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Nov 2019 19:36:23 -0500
Received: by mail-pf1-f195.google.com with SMTP id x28so682072pfo.6
        for <linux-gpio@vger.kernel.org>; Wed, 20 Nov 2019 16:36:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=g3VIwfDFFneyuMhtYBlS4bEv5/DtQNr4Sh3MR5iqeUw=;
        b=UR4YiWwSlUbaqrWbfGb/j8YTwUv602+THCd2REO0quYsAHPYMWoPtO2tvXh8y8IF7S
         RJrHH6F8bhrxuBx7krnI+qeC2P56cy0lKNVC1+d3JF6OqOEzqLxN8yPckv/tmYsZywDd
         9W+iZ+DBXCmzyDaowLyzHJIr5DZJ49q24C94GzJcMvYTfbZPfr9hfH3BoYuQen46RdBZ
         h2T639mZwh78zuGWUQvQvNCR+9U7JHZa+q/TcnzRFdrqxwreuyzl04d7Gwe2IlciPgYp
         iEL2nYY5kFboMb5sICy7tI+MJL1EMFQ2mpOA02okoWzCqUXTCnePp7LJTM+i3rcoQHUe
         vPWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=g3VIwfDFFneyuMhtYBlS4bEv5/DtQNr4Sh3MR5iqeUw=;
        b=nJA75lXGYZLQ+SyrrkGo/tBTmGsLVL7K/LgEA8PY1QrVNxgPgwH8WH8rnFx6RQtM1a
         DxdcEAvxZz6Ha/kDRYLQyFVgkRvaSvbUoJOyF3mZK+NUVUb9NllMlVV9KyppUO2K0Aaf
         BVlIILbV5zNLzQkuyw3bVrb0rzC4NCRcw50/rvrF377u/fH04aHnYGF4qG9ZfWBoWc7l
         cX7f8iMMe51sb6MlYGbLQcInOaNMHVJGy648SU3R9UaYPgjdMbQXNap1jNzlcLajy52Y
         X33y6eXf5LnsDPTJo4NF+/jKqosrrl+cgnwHawpTZaJw0wY8DGHC7LHxzFbKh6tHXiwr
         +R6g==
X-Gm-Message-State: APjAAAWK0y3RidUQ8Mk/5ijsgf5USgQfDe6uXyJq1uNWikO2q9ND0EKl
        IgWNnwaTkh/MpR3YLXycS+41VvirPps=
X-Google-Smtp-Source: APXvYqyM0ywzI+0K2STshDo7ZG/ac6gLibUl8xi+C79xpvTaEpYjKIPfrI5ZkocoBApnvHCLirlnQg==
X-Received: by 2002:a63:9554:: with SMTP id t20mr621584pgn.369.1574296580206;
        Wed, 20 Nov 2019 16:36:20 -0800 (PST)
Received: from sol.lan (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id s1sm420756pgk.9.2019.11.20.16.36.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2019 16:36:19 -0800 (PST)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod] [PATCH v2 01/14] core: add support for bias flags
Date:   Thu, 21 Nov 2019 08:35:43 +0800
Message-Id: <20191121003556.9020-2-warthog618@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191121003556.9020-1-warthog618@gmail.com>
References: <20191121003556.9020-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Extend the libgpiod API to support the bias flags recently added to the
kernel GPIO uAPI.  The core change is the addition of
GPIOD_LINE_REQUEST_FLAG_BIAS_DISABLE, GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_UP
and GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_DOWN flags to be passed into
line_request functions, and the addition of gpiod_line_bias to return the
bias state of lines.

Variants of the ctxless functions that accept an active_low flag
are added to also accept other flags. The variant names add a "_ext"
suffix to the name of the original function.

Based on initial work by Drew Fustini <drew@pdp7.com>.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 include/gpiod.h | 183 ++++++++++++++++++++++++++++++++++++++++++++++++
 lib/core.c      |  32 ++++++---
 lib/ctxless.c   | 114 +++++++++++++++++++++++++++---
 3 files changed, 311 insertions(+), 18 deletions(-)

diff --git a/include/gpiod.h b/include/gpiod.h
index 6dfa18a..cdf0435 100644
--- a/include/gpiod.h
+++ b/include/gpiod.h
@@ -84,6 +84,22 @@ struct gpiod_line_bulk;
  * the need to use the gpiod_* structures or to keep track of resources.
  */
 
+/**
+ * @brief Miscellaneous GPIO flags.
+ */
+enum {
+	GPIOD_CTXLESS_FLAG_OPEN_DRAIN		= GPIOD_BIT(0),
+	/**< The line is an open-drain port. */
+	GPIOD_CTXLESS_FLAG_OPEN_SOURCE		= GPIOD_BIT(1),
+	/**< The line is an open-source port. */
+	GPIOD_CTXLESS_FLAG_BIAS_DISABLE		= GPIOD_BIT(2),
+	/**< The line has neither either pull-up nor pull-down resistor */
+	GPIOD_CTXLESS_FLAG_BIAS_PULL_DOWN	= GPIOD_BIT(3),
+	/**< The line has pull-down resistor enabled */
+	GPIOD_CTXLESS_FLAG_BIAS_PULL_UP		= GPIOD_BIT(4),
+	/**< The line has pull-up resistor enabled */
+};
+
 /**
  * @brief Read current value from a single GPIO line.
  * @param device Name, path, number or label of the gpiochip.
@@ -95,6 +111,19 @@ struct gpiod_line_bulk;
 int gpiod_ctxless_get_value(const char *device, unsigned int offset,
 			    bool active_low, const char *consumer) GPIOD_API;
 
+/**
+ * @brief Read current value from a single GPIO line.
+ * @param device Name, path, number or label of the gpiochip.
+ * @param offset Offset of the GPIO line.
+ * @param active_low The active state of this line - true if low.
+ * @param consumer Name of the consumer.
+ * @param flags The flags for the line.
+ * @return 0 or 1 (GPIO value) if the operation succeeds, -1 on error.
+ */
+int gpiod_ctxless_get_value_ext(const char *device, unsigned int offset,
+				bool active_low, const char *consumer,
+				int flags) GPIOD_API;
+
 /**
  * @brief Read current values from a set of GPIO lines.
  * @param device Name, path, number or label of the gpiochip.
@@ -110,6 +139,23 @@ int gpiod_ctxless_get_value_multiple(const char *device,
 				     unsigned int num_lines, bool active_low,
 				     const char *consumer) GPIOD_API;
 
+/**
+ * @brief Read current values from a set of GPIO lines.
+ * @param device Name, path, number or label of the gpiochip.
+ * @param offsets Array of offsets of lines whose values should be read.
+ * @param values Buffer in which the values will be stored.
+ * @param num_lines Number of lines, must be > 0.
+ * @param active_low The active state of this line - true if low.
+ * @param consumer Name of the consumer.
+ * @param flags The flags for the lines.
+ * @return 0 if the operation succeeds, -1 on error.
+ */
+int gpiod_ctxless_get_value_multiple_ext(const char *device,
+					 const unsigned int *offsets,
+					 int *values, unsigned int num_lines,
+					 bool active_low, const char *consumer,
+					 int flags) GPIOD_API;
+
 /**
  * @brief Simple set value callback signature.
  */
@@ -133,6 +179,26 @@ int gpiod_ctxless_set_value(const char *device, unsigned int offset, int value,
 			    gpiod_ctxless_set_value_cb cb,
 			    void *data) GPIOD_API;
 
+/**
+ * @brief Set value of a single GPIO line.
+ * @param device Name, path, number or label of the gpiochip.
+ * @param offset The offset of the GPIO line.
+ * @param value New value (0 or 1).
+ * @param active_low The active state of this line - true if low.
+ * @param consumer Name of the consumer.
+ * @param cb Optional callback function that will be called right after setting
+ *           the value. Users can use this, for example, to pause the execution
+ *           after toggling a GPIO.
+ * @param data Optional user data that will be passed to the callback function.
+ * @param flags The flags for the line.
+ * @return 0 if the operation succeeds, -1 on error.
+ */
+int gpiod_ctxless_set_value_ext(const char *device, unsigned int offset,
+				int value, bool active_low,
+				const char *consumer,
+				gpiod_ctxless_set_value_cb cb,
+				void *data, int flags) GPIOD_API;
+
 /**
  * @brief Set values of multiple GPIO lines.
  * @param device Name, path, number or label of the gpiochip.
@@ -153,6 +219,29 @@ int gpiod_ctxless_set_value_multiple(const char *device,
 				     gpiod_ctxless_set_value_cb cb,
 				     void *data) GPIOD_API;
 
+/**
+ * @brief Set values of multiple GPIO lines.
+ * @param device Name, path, number or label of the gpiochip.
+ * @param offsets Array of offsets of lines the values of which should be set.
+ * @param values Array of integers containing new values.
+ * @param num_lines Number of lines, must be > 0.
+ * @param active_low The active state of this line - true if low.
+ * @param consumer Name of the consumer.
+ * @param cb Optional callback function that will be called right after setting
+ *           all values. Works the same as in ::gpiod_ctxless_set_value.
+ * @param data Optional user data that will be passed to the callback function.
+ * @param flags The flags for the lines.
+ * @return 0 if the operation succeeds, -1 on error.
+ */
+int gpiod_ctxless_set_value_multiple_ext(const char *device,
+					 const unsigned int *offsets,
+					 const int *values,
+					 unsigned int num_lines,
+					 bool active_low,
+					 const char *consumer,
+					 gpiod_ctxless_set_value_cb cb,
+					 void *data, int flags) GPIOD_API;
+
 /**
  * @brief Event types that the ctxless event monitor can wait for.
  */
@@ -327,6 +416,31 @@ int gpiod_ctxless_event_monitor(const char *device, int event_type,
 				gpiod_ctxless_event_handle_cb event_cb,
 				void *data) GPIOD_API;
 
+/**
+ * @brief Wait for events on a single GPIO line.
+ * @param device Name, path, number or label of the gpiochip.
+ * @param event_type Type of events to listen for.
+ * @param offset GPIO line offset to monitor.
+ * @param active_low The active state of this line - true if low.
+ * @param consumer Name of the consumer.
+ * @param timeout Maximum wait time for each iteration.
+ * @param poll_cb Callback function to call when waiting for events.
+ * @param event_cb Callback function to call for each line event.
+ * @param data User data passed to the callback.
+ * @param flags The flags for the line.
+ * @return 0 if no errors were encountered, -1 if an error occurred.
+ * @note The way the ctxless event loop works is described in detail in
+ *       ::gpiod_ctxless_event_monitor_multiple - this is just a wrapper aound
+ *       this routine which calls it for a single GPIO line.
+ */
+int gpiod_ctxless_event_monitor_ext(const char *device, int event_type,
+				    unsigned int offset, bool active_low,
+				    const char *consumer,
+				    const struct timespec *timeout,
+				    gpiod_ctxless_event_poll_cb poll_cb,
+				    gpiod_ctxless_event_handle_cb event_cb,
+				    void *data, int flags) GPIOD_API;
+
 /**
  * @brief Wait for events on multiple GPIO lines.
  * @param device Name, path, number or label of the gpiochip.
@@ -366,6 +480,47 @@ int gpiod_ctxless_event_monitor_multiple(
 			gpiod_ctxless_event_handle_cb event_cb,
 			void *data) GPIOD_API;
 
+/**
+ * @brief Wait for events on multiple GPIO lines.
+ * @param device Name, path, number or label of the gpiochip.
+ * @param event_type Type of events to listen for.
+ * @param offsets Array of GPIO line offsets to monitor.
+ * @param num_lines Number of lines to monitor.
+ * @param active_low The active state of this line - true if low.
+ * @param consumer Name of the consumer.
+ * @param timeout Maximum wait time for each iteration.
+ * @param poll_cb Callback function to call when waiting for events. Can
+ *                be NULL.
+ * @param event_cb Callback function to call on event occurrence.
+ * @param data User data passed to the callback.
+ * @param flags The flags for the lines.
+ * @return 0 no errors were encountered, -1 if an error occurred.
+ * @note The poll callback can be NULL in which case the routine will fall
+ *       back to a basic, ppoll() based callback.
+ *
+ * Internally this routine opens the GPIO chip, requests the set of lines for
+ * the type of events specified in the event_type parameter and calls the
+ * polling callback in a loop. The role of the polling callback is to detect
+ * input events on a set of file descriptors and notify the caller about the
+ * fds ready for reading.
+ *
+ * The ctxless event loop then reads each queued event from marked descriptors
+ * and calls the event callback. Both callbacks can stop the loop at any
+ * point.
+ *
+ * The poll_cb argument can be NULL in which case the function falls back to
+ * a default, ppoll() based callback.
+ */
+int gpiod_ctxless_event_monitor_multiple_ext(
+			const char *device, int event_type,
+			const unsigned int *offsets,
+			unsigned int num_lines, bool active_low,
+			const char *consumer, const struct timespec *timeout,
+			gpiod_ctxless_event_poll_cb poll_cb,
+			gpiod_ctxless_event_handle_cb event_cb,
+			void *data, int flags) GPIOD_API;
+
+
 /**
  * @brief Determine the chip name and line offset of a line with given name.
  * @param name The name of the GPIO line to lookup.
@@ -658,6 +813,20 @@ enum {
 	/**< The active state of a GPIO is active-low. */
 };
 
+/**
+ * @brief Possible internal bias settings.
+ */
+enum {
+	GPIOD_LINE_BIAS_AS_IS = 1,
+	/**< The internal bias state is unknown. */
+	GPIOD_LINE_BIAS_DISABLE,
+	/**< The internal bias is disabled. */
+	GPIOD_LINE_BIAS_PULL_UP,
+	/**< The internal pull-up bias is enabled. */
+	GPIOD_LINE_BIAS_PULL_DOWN,
+	/**< The internal pull-down bias is enabled. */
+};
+
 /**
  * @brief Read the GPIO line offset.
  * @param line GPIO line object.
@@ -697,6 +866,14 @@ int gpiod_line_direction(struct gpiod_line *line) GPIOD_API;
  */
 int gpiod_line_active_state(struct gpiod_line *line) GPIOD_API;
 
+/**
+ * @brief Read the GPIO line bias setting.
+ * @param line GPIO line object.
+ * @return Returns GPIOD_LINE_BIAS_PULL_UP, GPIOD_LINE_BIAS_PULL_DOWN,
+ *         GPIOD_LINE_BIAS_DISABLE or GPIOD_LINE_BIAS_AS_IS.
+ */
+int gpiod_line_bias(struct gpiod_line *line) GPIOD_API;
+
 /**
  * @brief Check if the line is currently in use.
  * @param line GPIO line object.
@@ -792,6 +969,12 @@ enum {
 	/**< The line is an open-source port. */
 	GPIOD_LINE_REQUEST_FLAG_ACTIVE_LOW	= GPIOD_BIT(2),
 	/**< The active state of the line is low (high is the default). */
+	GPIOD_LINE_REQUEST_FLAG_BIAS_DISABLE	= GPIOD_BIT(3),
+	/**< The line has neither either pull-up nor pull-down resistor */
+	GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_DOWN	= GPIOD_BIT(4),
+	/**< The line has pull-down resistor enabled */
+	GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_UP	= GPIOD_BIT(5),
+	/**< The line has pull-up resistor enabled */
 };
 
 /**
diff --git a/lib/core.c b/lib/core.c
index d79e52e..ece3b13 100644
--- a/lib/core.c
+++ b/lib/core.c
@@ -36,9 +36,7 @@ struct gpiod_line {
 	unsigned int offset;
 	int direction;
 	int active_state;
-	bool used;
-	bool open_source;
-	bool open_drain;
+	__u32 info_flags;
 
 	int state;
 	bool needs_update;
@@ -359,19 +357,31 @@ int gpiod_line_active_state(struct gpiod_line *line)
 	return line->active_state;
 }
 
+int gpiod_line_bias(struct gpiod_line *line)
+{
+	if (line->info_flags & GPIOLINE_FLAG_BIAS_DISABLE)
+		return GPIOD_LINE_BIAS_DISABLE;
+	if (line->info_flags & GPIOLINE_FLAG_BIAS_PULL_UP)
+		return GPIOD_LINE_BIAS_PULL_UP;
+	if (line->info_flags & GPIOLINE_FLAG_BIAS_PULL_DOWN)
+		return GPIOD_LINE_BIAS_PULL_DOWN;
+
+	return GPIOD_LINE_BIAS_AS_IS;
+}
+
 bool gpiod_line_is_used(struct gpiod_line *line)
 {
-	return line->used;
+	return line->info_flags & GPIOLINE_FLAG_KERNEL;
 }
 
 bool gpiod_line_is_open_drain(struct gpiod_line *line)
 {
-	return line->open_drain;
+	return line->info_flags & GPIOLINE_FLAG_OPEN_DRAIN;
 }
 
 bool gpiod_line_is_open_source(struct gpiod_line *line)
 {
-	return line->open_source;
+	return line->info_flags & GPIOLINE_FLAG_OPEN_SOURCE;
 }
 
 bool gpiod_line_needs_update(struct gpiod_line *line)
@@ -398,9 +408,7 @@ int gpiod_line_update(struct gpiod_line *line)
 						? GPIOD_LINE_ACTIVE_STATE_LOW
 						: GPIOD_LINE_ACTIVE_STATE_HIGH;
 
-	line->used = info.flags & GPIOLINE_FLAG_KERNEL;
-	line->open_drain = info.flags & GPIOLINE_FLAG_OPEN_DRAIN;
-	line->open_source = info.flags & GPIOLINE_FLAG_OPEN_SOURCE;
+	line->info_flags = info.flags;
 
 	strncpy(line->name, info.name, sizeof(line->name));
 	strncpy(line->consumer, info.consumer, sizeof(line->consumer));
@@ -473,6 +481,12 @@ static __u32 line_request_flag_to_gpio_handleflag(int flags)
 		hflags |= GPIOHANDLE_REQUEST_OPEN_SOURCE;
 	if (flags & GPIOD_LINE_REQUEST_FLAG_ACTIVE_LOW)
 		hflags |= GPIOHANDLE_REQUEST_ACTIVE_LOW;
+	if (flags & GPIOD_LINE_REQUEST_FLAG_BIAS_DISABLE)
+		hflags |= GPIOHANDLE_REQUEST_BIAS_DISABLE;
+	if (flags & GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_DOWN)
+		hflags |= GPIOHANDLE_REQUEST_BIAS_PULL_DOWN;
+	if (flags & GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_UP)
+		hflags |= GPIOHANDLE_REQUEST_BIAS_PULL_UP;
 
 	return hflags;
 }
diff --git a/lib/ctxless.c b/lib/ctxless.c
index ba85018..014475c 100644
--- a/lib/ctxless.c
+++ b/lib/ctxless.c
@@ -14,6 +14,26 @@
 #include <stdio.h>
 #include <string.h>
 
+static int ctxless_flags_to_line_request_flags(bool active_low, int flags)
+{
+	int req_flags = 0;
+
+	if (active_low)
+		req_flags |= GPIOD_LINE_REQUEST_FLAG_ACTIVE_LOW;
+	if (flags & GPIOD_CTXLESS_FLAG_OPEN_DRAIN)
+		req_flags |= GPIOD_LINE_REQUEST_FLAG_OPEN_DRAIN;
+	if (flags & GPIOD_CTXLESS_FLAG_OPEN_SOURCE)
+		req_flags |= GPIOD_LINE_REQUEST_FLAG_OPEN_SOURCE;
+	if (flags & GPIOD_CTXLESS_FLAG_BIAS_DISABLE)
+		req_flags |= GPIOD_LINE_REQUEST_FLAG_BIAS_DISABLE;
+	if (flags & GPIOD_CTXLESS_FLAG_BIAS_PULL_UP)
+		req_flags |= GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_UP;
+	if (flags & GPIOD_CTXLESS_FLAG_BIAS_PULL_DOWN)
+		req_flags |= GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_DOWN;
+
+	return req_flags;
+}
+
 int gpiod_ctxless_get_value(const char *device, unsigned int offset,
 			    bool active_low, const char *consumer)
 {
@@ -27,16 +47,44 @@ int gpiod_ctxless_get_value(const char *device, unsigned int offset,
 	return value;
 }
 
+int gpiod_ctxless_get_value_ext(const char *device, unsigned int offset,
+				bool active_low, const char *consumer,
+				int flags)
+{
+	int value, rv;
+
+	rv = gpiod_ctxless_get_value_multiple_ext(device, &offset, &value, 1,
+						  active_low, consumer, flags);
+	if (rv < 0)
+		return rv;
+
+	return value;
+}
+
 int gpiod_ctxless_get_value_multiple(const char *device,
 				     const unsigned int *offsets, int *values,
 				     unsigned int num_lines, bool active_low,
 				     const char *consumer)
+{
+	int rv;
+
+	rv = gpiod_ctxless_get_value_multiple_ext(device, offsets, values,
+						  num_lines, active_low,
+						  consumer, 0);
+	return rv;
+}
+
+int gpiod_ctxless_get_value_multiple_ext(const char *device,
+					 const unsigned int *offsets,
+					 int *values, unsigned int num_lines,
+					 bool active_low,
+					 const char *consumer, int flags)
 {
 	struct gpiod_line_bulk bulk;
 	struct gpiod_chip *chip;
 	struct gpiod_line *line;
 	unsigned int i;
-	int rv, flags;
+	int rv, req_flags;
 
 	if (!num_lines || num_lines > GPIOD_LINE_BULK_MAX_LINES) {
 		errno = EINVAL;
@@ -59,9 +107,8 @@ int gpiod_ctxless_get_value_multiple(const char *device,
 		gpiod_line_bulk_add(&bulk, line);
 	}
 
-	flags = active_low ? GPIOD_LINE_REQUEST_FLAG_ACTIVE_LOW : 0;
-
-	rv = gpiod_line_request_bulk_input_flags(&bulk, consumer, flags);
+	req_flags = ctxless_flags_to_line_request_flags(active_low, flags);
+	rv = gpiod_line_request_bulk_input_flags(&bulk, consumer, req_flags);
 	if (rv < 0) {
 		gpiod_chip_close(chip);
 		return -1;
@@ -83,17 +130,39 @@ int gpiod_ctxless_set_value(const char *device, unsigned int offset, int value,
 						active_low, consumer, cb, data);
 }
 
+int gpiod_ctxless_set_value_ext(const char *device, unsigned int offset,
+				int value, bool active_low,
+				const char *consumer,
+				gpiod_ctxless_set_value_cb cb,
+				void *data, int flags)
+{
+	return gpiod_ctxless_set_value_multiple_ext(device, &offset, &value,
+						    1, active_low, consumer,
+						    cb, data, flags);
+}
+
 int gpiod_ctxless_set_value_multiple(const char *device,
 				     const unsigned int *offsets,
 				     const int *values, unsigned int num_lines,
 				     bool active_low, const char *consumer,
 				     gpiod_ctxless_set_value_cb cb, void *data)
+{
+	return gpiod_ctxless_set_value_multiple_ext(device, offsets, values,
+						    num_lines, active_low,
+						    consumer, cb, data, 0);
+}
+
+int gpiod_ctxless_set_value_multiple_ext(
+			const char *device, const unsigned int *offsets,
+			const int *values, unsigned int num_lines,
+			bool active_low, const char *consumer,
+			gpiod_ctxless_set_value_cb cb, void *data, int flags)
 {
 	struct gpiod_line_bulk bulk;
 	struct gpiod_chip *chip;
 	struct gpiod_line *line;
 	unsigned int i;
-	int rv, flags;
+	int rv, req_flags;
 
 	if (!num_lines || num_lines > GPIOD_LINE_BULK_MAX_LINES) {
 		errno = EINVAL;
@@ -116,10 +185,9 @@ int gpiod_ctxless_set_value_multiple(const char *device,
 		gpiod_line_bulk_add(&bulk, line);
 	}
 
-	flags = active_low ? GPIOD_LINE_REQUEST_FLAG_ACTIVE_LOW : 0;
-
+	req_flags = ctxless_flags_to_line_request_flags(active_low, flags);
 	rv = gpiod_line_request_bulk_output_flags(&bulk, consumer,
-						  flags, values);
+						  req_flags, values);
 	if (rv < 0) {
 		gpiod_chip_close(chip);
 		return -1;
@@ -216,6 +284,19 @@ int gpiod_ctxless_event_monitor(const char *device, int event_type,
 						    poll_cb, event_cb, data);
 }
 
+int gpiod_ctxless_event_monitor_ext(const char *device, int event_type,
+				    unsigned int offset, bool active_low,
+				    const char *consumer,
+				    const struct timespec *timeout,
+				    gpiod_ctxless_event_poll_cb poll_cb,
+				    gpiod_ctxless_event_handle_cb event_cb,
+				    void *data, int flags)
+{
+	return gpiod_ctxless_event_monitor_multiple_ext(
+			device, event_type, &offset, 1, active_low,
+			consumer, timeout, poll_cb, event_cb, data, flags);
+}
+
 int gpiod_ctxless_event_monitor_multiple(
 			const char *device, int event_type,
 			const unsigned int *offsets,
@@ -225,6 +306,21 @@ int gpiod_ctxless_event_monitor_multiple(
 			gpiod_ctxless_event_poll_cb poll_cb,
 			gpiod_ctxless_event_handle_cb event_cb,
 			void *data)
+{
+	return gpiod_ctxless_event_monitor_multiple_ext(
+			device, event_type, offsets,
+			num_lines, active_low, consumer, timeout,
+			poll_cb, event_cb, data, 0);
+}
+
+int gpiod_ctxless_event_monitor_multiple_ext(
+			const char *device, int event_type,
+			const unsigned int *offsets,
+			unsigned int num_lines, bool active_low,
+			const char *consumer, const struct timespec *timeout,
+			gpiod_ctxless_event_poll_cb poll_cb,
+			gpiod_ctxless_event_handle_cb event_cb,
+			void *data, int flags)
 {
 	struct gpiod_ctxless_event_poll_fd fds[GPIOD_LINE_BULK_MAX_LINES];
 	struct gpiod_line_request_config conf;
@@ -259,7 +355,7 @@ int gpiod_ctxless_event_monitor_multiple(
 		gpiod_line_bulk_add(&bulk, line);
 	}
 
-	conf.flags = active_low ? GPIOD_LINE_REQUEST_FLAG_ACTIVE_LOW : 0;
+	conf.flags = ctxless_flags_to_line_request_flags(active_low, flags);
 	conf.consumer = consumer;
 
 	if (event_type == GPIOD_CTXLESS_EVENT_RISING_EDGE) {
-- 
2.24.0

