Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F40FFE05B
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Nov 2019 15:44:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727732AbfKOOok (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 15 Nov 2019 09:44:40 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:45505 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727556AbfKOOoj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 15 Nov 2019 09:44:39 -0500
Received: by mail-pf1-f195.google.com with SMTP id z4so6760645pfn.12
        for <linux-gpio@vger.kernel.org>; Fri, 15 Nov 2019 06:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=waCp/q3sNstwWVQ04QXvStovpDKQWWhCzYX0OPeWLCE=;
        b=fmDE8zib/OnVto3Il5b26tL7O1PRjgZSX8tw/OsTvgGJANZfVvrcHEOA/jbI5cYL86
         yK5THM1d5NEDD996HDZvXuoxObv3ZA962/0+APlsdzU5oae8xlQV/csRE6q765wGxa+x
         aeW0NycJ6+rmJYVKohG7OBCZeNLo522kBpolR0J0klXF/aryvKASBxY0td7FVWYRcjkU
         C9z+l7Z56ozZ/k2yCezL/0wtSODhn9S9nRCkSxua1uiGeRuCFI7vGQo8dOpSxyuyYb/K
         J5nfvB5v3QxQD/1M5Jwao15ENQe2wXKkuR+XhPLvDtxgelWd8oUtqOtSt6XUvGwsJknG
         889A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=waCp/q3sNstwWVQ04QXvStovpDKQWWhCzYX0OPeWLCE=;
        b=cEktwgZTd+/pvWgm0JCMm8Hugv9hTn2+aPZqRW+DRD8u/4e2j28aVtEDbucACqP2ud
         i6o/iIeoE1YkYqh0qYRkYkbDdaDnhmmHT7ryCp7H6h4BvPnoqIZNQ4WSJHE/rJuKbJSt
         FxBti4ciO797kGdCSM6IhRWAwoFd7qjfTwMMP5eHR+Ga2RYQyvQ6QLjb+Gk2rILzPojo
         FbggeXChuZNH85XV1YB194XrwsFhNI42WUOH/trJlQ+3dl7zbrHe0T4n/sRzrTI/hnNM
         uKdrvn3oAIU1YgxwUAfZNmX70vdyCEaHo+N8ng4GXu1UdQm9/ptQTYdGraOWqzk0Uvvl
         +4Mg==
X-Gm-Message-State: APjAAAUP9blJe7Wp8IFTF37g5raITtOSvAb/7pP7VOsBoAM8VkGwi+Q7
        8jJ3gXoYGhjxdexRW0kzbW9FG1FJClg=
X-Google-Smtp-Source: APXvYqwrW9E0mRb+xQUogjL4Jmxc+YtdaNZBIowkeRl0Dh5Q11cD8jgYK8SPCx7MF5ZAfVodiKi8zw==
X-Received: by 2002:a63:7b5c:: with SMTP id k28mr17552224pgn.442.1573829078208;
        Fri, 15 Nov 2019 06:44:38 -0800 (PST)
Received: from sol.lan (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id y123sm10517726pfg.64.2019.11.15.06.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2019 06:44:37 -0800 (PST)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod] [PATCH 02/19] API: add support for bias flags
Date:   Fri, 15 Nov 2019 22:43:38 +0800
Message-Id: <20191115144355.975-3-warthog618@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191115144355.975-1-warthog618@gmail.com>
References: <20191115144355.975-1-warthog618@gmail.com>
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

Extended variants of the ctxless functions that accept an active_low flag
are added to also accept other flags. The variant names add a "_ext"
suffix to the name of the original function.

Based on initial work by Drew Fustini <drew@pdp7.com>.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 include/gpiod.h | 184 ++++++++++++++++++++++++++++++++++++++++++++++++
 lib/core.c      |  32 ++++++---
 lib/ctxless.c   | 115 +++++++++++++++++++++++++++---
 3 files changed, 313 insertions(+), 18 deletions(-)

diff --git a/include/gpiod.h b/include/gpiod.h
index 9860ea8..0f01cab 100644
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
+ * @param flags The flags for the line.
+ * @param consumer Name of the consumer.
+ * @return 0 or 1 (GPIO value) if the operation succeeds, -1 on error.
+ */
+int gpiod_ctxless_get_value_ext(const char *device, unsigned int offset,
+				bool active_low, int flags,
+				const char *consumer) GPIOD_API;
+
 /**
  * @brief Read current values from a set of GPIO lines.
  * @param device Name, path, number or label of the gpiochip.
@@ -110,6 +139,24 @@ int gpiod_ctxless_get_value_multiple(const char *device,
 				     unsigned int num_lines, bool active_low,
 				     const char *consumer) GPIOD_API;
 
+/**
+ * @brief Read current values from a set of GPIO lines.
+ * @param device Name, path, number or label of the gpiochip.
+ * @param offsets Array of offsets of lines whose values should be read.
+ * @param values Buffer in which the values will be stored.
+ * @param num_lines Number of lines, must be > 0.
+ * @param active_low The active state of this line - true if low.
+ * @param flags The flags for the lines.
+ * @param consumer Name of the consumer.
+ * @return 0 if the operation succeeds, -1 on error.
+ */
+int gpiod_ctxless_get_value_multiple_ext(const char *device,
+					 const unsigned int *offsets,
+					 int *values,
+					 unsigned int num_lines,
+					 bool active_low, int flags,
+					 const char *consumer) GPIOD_API;
+
 /**
  * @brief Simple set value callback signature.
  */
@@ -133,6 +180,26 @@ int gpiod_ctxless_set_value(const char *device, unsigned int offset, int value,
 			    gpiod_ctxless_set_value_cb cb,
 			    void *data) GPIOD_API;
 
+/**
+ * @brief Set value of a single GPIO line.
+ * @param device Name, path, number or label of the gpiochip.
+ * @param offset The offset of the GPIO line.
+ * @param value New value (0 or 1).
+ * @param active_low The active state of this line - true if low.
+ * @param flags The flags for the line.
+ * @param consumer Name of the consumer.
+ * @param cb Optional callback function that will be called right after setting
+ *           the value. Users can use this, for example, to pause the execution
+ *           after toggling a GPIO.
+ * @param data Optional user data that will be passed to the callback function.
+ * @return 0 if the operation succeeds, -1 on error.
+ */
+int gpiod_ctxless_set_value_ext(const char *device, unsigned int offset,
+				int value, bool active_low, int flags,
+				const char *consumer,
+				gpiod_ctxless_set_value_cb cb,
+				void *data) GPIOD_API;
+
 /**
  * @brief Set values of multiple GPIO lines.
  * @param device Name, path, number or label of the gpiochip.
@@ -153,6 +220,29 @@ int gpiod_ctxless_set_value_multiple(const char *device,
 				     gpiod_ctxless_set_value_cb cb,
 				     void *data) GPIOD_API;
 
+/**
+ * @brief Set values of multiple GPIO lines.
+ * @param device Name, path, number or label of the gpiochip.
+ * @param offsets Array of offsets of lines the values of which should be set.
+ * @param values Array of integers containing new values.
+ * @param num_lines Number of lines, must be > 0.
+ * @param active_low The active state of this line - true if low.
+ * @param flags The flags for the lines.
+ * @param consumer Name of the consumer.
+ * @param cb Optional callback function that will be called right after setting
+ *           all values. Works the same as in ::gpiod_ctxless_set_value.
+ * @param data Optional user data that will be passed to the callback function.
+ * @return 0 if the operation succeeds, -1 on error.
+ */
+int gpiod_ctxless_set_value_multiple_ext(const char *device,
+					 const unsigned int *offsets,
+					 const int *values,
+					 unsigned int num_lines,
+					 bool active_low, int flags,
+					 const char *consumer,
+					 gpiod_ctxless_set_value_cb cb,
+					 void *data) GPIOD_API;
+
 /**
  * @brief Event types that the ctxless event monitor can wait for.
  */
@@ -327,6 +417,31 @@ int gpiod_ctxless_event_monitor(const char *device, int event_type,
 				gpiod_ctxless_event_handle_cb event_cb,
 				void *data) GPIOD_API;
 
+/**
+ * @brief Wait for events on a single GPIO line.
+ * @param device Name, path, number or label of the gpiochip.
+ * @param event_type Type of events to listen for.
+ * @param offset GPIO line offset to monitor.
+ * @param active_low The active state of this line - true if low.
+ * @param flags The flags for the line.
+ * @param consumer Name of the consumer.
+ * @param timeout Maximum wait time for each iteration.
+ * @param poll_cb Callback function to call when waiting for events.
+ * @param event_cb Callback function to call for each line event.
+ * @param data User data passed to the callback.
+ * @return 0 if no errors were encountered, -1 if an error occurred.
+ * @note The way the ctxless event loop works is described in detail in
+ *       ::gpiod_ctxless_event_monitor_multiple - this is just a wrapper aound
+ *       this routine which calls it for a single GPIO line.
+ */
+int gpiod_ctxless_event_monitor_ext(const char *device, int event_type,
+				    unsigned int offset, bool active_low,
+				    int flags, const char *consumer,
+				    const struct timespec *timeout,
+				    gpiod_ctxless_event_poll_cb poll_cb,
+				    gpiod_ctxless_event_handle_cb event_cb,
+				    void *data) GPIOD_API;
+
 /**
  * @brief Wait for events on multiple GPIO lines.
  * @param device Name, path, number or label of the gpiochip.
@@ -366,6 +481,47 @@ int gpiod_ctxless_event_monitor_multiple(
 			gpiod_ctxless_event_handle_cb event_cb,
 			void *data) GPIOD_API;
 
+/**
+ * @brief Wait for events on multiple GPIO lines.
+ * @param device Name, path, number or label of the gpiochip.
+ * @param event_type Type of events to listen for.
+ * @param offsets Array of GPIO line offsets to monitor.
+ * @param num_lines Number of lines to monitor.
+ * @param active_low The active state of this line - true if low.
+ * @param flags The flags for the lines.
+ * @param consumer Name of the consumer.
+ * @param timeout Maximum wait time for each iteration.
+ * @param poll_cb Callback function to call when waiting for events. Can
+ *                be NULL.
+ * @param event_cb Callback function to call on event occurrence.
+ * @param data User data passed to the callback.
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
+			unsigned int num_lines, bool active_low, int flags,
+			const char *consumer, const struct timespec *timeout,
+			gpiod_ctxless_event_poll_cb poll_cb,
+			gpiod_ctxless_event_handle_cb event_cb,
+			void *data) GPIOD_API;
+
+
 /**
  * @brief Determine the chip name and line offset of a line with given name.
  * @param name The name of the GPIO line to lookup.
@@ -658,6 +814,20 @@ enum {
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
@@ -697,6 +867,14 @@ int gpiod_line_direction(struct gpiod_line *line) GPIOD_API;
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
@@ -792,6 +970,12 @@ enum {
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
index f05e595..9b7d88f 100644
--- a/lib/core.c
+++ b/lib/core.c
@@ -36,9 +36,7 @@ struct gpiod_line {
 	unsigned int offset;
 	int direction;
 	int active_state;
-	bool used;
-	bool open_source;
-	bool open_drain;
+	__u32 flags;
 
 	int state;
 	bool needs_update;
@@ -359,19 +357,31 @@ int gpiod_line_active_state(struct gpiod_line *line)
 	return line->active_state;
 }
 
+int gpiod_line_bias(struct gpiod_line *line)
+{
+	if (line->flags & GPIOLINE_FLAG_BIAS_DISABLE)
+		return GPIOD_LINE_BIAS_DISABLE;
+	if (line->flags & GPIOLINE_FLAG_BIAS_PULL_UP)
+		return GPIOD_LINE_BIAS_PULL_UP;
+	if (line->flags & GPIOLINE_FLAG_BIAS_PULL_DOWN)
+		return GPIOD_LINE_BIAS_PULL_DOWN;
+
+	return GPIOD_LINE_BIAS_AS_IS;
+}
+
 bool gpiod_line_is_used(struct gpiod_line *line)
 {
-	return line->used;
+	return line->flags & GPIOLINE_FLAG_KERNEL;
 }
 
 bool gpiod_line_is_open_drain(struct gpiod_line *line)
 {
-	return line->open_drain;
+	return line->flags & GPIOLINE_FLAG_OPEN_DRAIN;
 }
 
 bool gpiod_line_is_open_source(struct gpiod_line *line)
 {
-	return line->open_source;
+	return line->flags & GPIOLINE_FLAG_OPEN_SOURCE;
 }
 
 bool gpiod_line_needs_update(struct gpiod_line *line)
@@ -398,9 +408,7 @@ int gpiod_line_update(struct gpiod_line *line)
 						? GPIOD_LINE_ACTIVE_STATE_LOW
 						: GPIOD_LINE_ACTIVE_STATE_HIGH;
 
-	line->used = info.flags & GPIOLINE_FLAG_KERNEL;
-	line->open_drain = info.flags & GPIOLINE_FLAG_OPEN_DRAIN;
-	line->open_source = info.flags & GPIOLINE_FLAG_OPEN_SOURCE;
+	line->flags = info.flags;
 
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
index ba85018..44f1872 100644
--- a/lib/ctxless.c
+++ b/lib/ctxless.c
@@ -14,6 +14,26 @@
 #include <stdio.h>
 #include <string.h>
 
+static int ctxless_flags_to_line_request_flags(bool active_low, int flags)
+{
+	int lflags = 0;
+
+	if (active_low)
+		lflags |= GPIOD_LINE_REQUEST_FLAG_ACTIVE_LOW;
+	if (flags & GPIOD_CTXLESS_FLAG_OPEN_DRAIN)
+		lflags |= GPIOD_LINE_REQUEST_FLAG_OPEN_DRAIN;
+	if (flags & GPIOD_CTXLESS_FLAG_OPEN_SOURCE)
+		lflags |= GPIOD_LINE_REQUEST_FLAG_OPEN_SOURCE;
+	if (flags & GPIOD_CTXLESS_FLAG_BIAS_DISABLE)
+		lflags |= GPIOD_LINE_REQUEST_FLAG_BIAS_DISABLE;
+	if (flags & GPIOD_CTXLESS_FLAG_BIAS_PULL_UP)
+		lflags |= GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_UP;
+	if (flags & GPIOD_CTXLESS_FLAG_BIAS_PULL_DOWN)
+		lflags |= GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_DOWN;
+
+	return lflags;
+}
+
 int gpiod_ctxless_get_value(const char *device, unsigned int offset,
 			    bool active_low, const char *consumer)
 {
@@ -27,16 +47,45 @@ int gpiod_ctxless_get_value(const char *device, unsigned int offset,
 	return value;
 }
 
+int gpiod_ctxless_get_value_ext(const char *device, unsigned int offset,
+				bool active_low, int flags,
+				const char *consumer)
+{
+	int value, rv;
+
+	rv = gpiod_ctxless_get_value_multiple_ext(device, &offset, &value, 1,
+						  active_low, flags, consumer);
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
+						  num_lines, active_low, 0,
+						  consumer);
+	return rv;
+}
+
+int gpiod_ctxless_get_value_multiple_ext(const char *device,
+					 const unsigned int *offsets,
+					 int *values,
+					 unsigned int num_lines,
+					 bool active_low, int flags,
+					 const char *consumer)
 {
 	struct gpiod_line_bulk bulk;
 	struct gpiod_chip *chip;
 	struct gpiod_line *line;
 	unsigned int i;
-	int rv, flags;
+	int rv, lflags;
 
 	if (!num_lines || num_lines > GPIOD_LINE_BULK_MAX_LINES) {
 		errno = EINVAL;
@@ -59,9 +108,8 @@ int gpiod_ctxless_get_value_multiple(const char *device,
 		gpiod_line_bulk_add(&bulk, line);
 	}
 
-	flags = active_low ? GPIOD_LINE_REQUEST_FLAG_ACTIVE_LOW : 0;
-
-	rv = gpiod_line_request_bulk_input_flags(&bulk, consumer, flags);
+	lflags = ctxless_flags_to_line_request_flags(active_low, flags);
+	rv = gpiod_line_request_bulk_input_flags(&bulk, consumer, lflags);
 	if (rv < 0) {
 		gpiod_chip_close(chip);
 		return -1;
@@ -83,17 +131,39 @@ int gpiod_ctxless_set_value(const char *device, unsigned int offset, int value,
 						active_low, consumer, cb, data);
 }
 
+int gpiod_ctxless_set_value_ext(const char *device, unsigned int offset,
+				int value, bool active_low, int flags,
+				const char *consumer,
+				gpiod_ctxless_set_value_cb cb, void *data)
+{
+	return gpiod_ctxless_set_value_multiple_ext(device, &offset, &value,
+						    1, active_low, flags,
+						    consumer, cb, data);
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
+						    0, consumer, cb, data);
+}
+
+int gpiod_ctxless_set_value_multiple_ext(
+			const char *device,
+			const unsigned int *offsets,
+			const int *values, unsigned int num_lines,
+			bool active_low, int flags, const char *consumer,
+			gpiod_ctxless_set_value_cb cb, void *data)
 {
 	struct gpiod_line_bulk bulk;
 	struct gpiod_chip *chip;
 	struct gpiod_line *line;
 	unsigned int i;
-	int rv, flags;
+	int rv, lflags;
 
 	if (!num_lines || num_lines > GPIOD_LINE_BULK_MAX_LINES) {
 		errno = EINVAL;
@@ -116,10 +186,9 @@ int gpiod_ctxless_set_value_multiple(const char *device,
 		gpiod_line_bulk_add(&bulk, line);
 	}
 
-	flags = active_low ? GPIOD_LINE_REQUEST_FLAG_ACTIVE_LOW : 0;
-
+	lflags = ctxless_flags_to_line_request_flags(active_low, flags);
 	rv = gpiod_line_request_bulk_output_flags(&bulk, consumer,
-						  flags, values);
+						  lflags, values);
 	if (rv < 0) {
 		gpiod_chip_close(chip);
 		return -1;
@@ -216,6 +285,19 @@ int gpiod_ctxless_event_monitor(const char *device, int event_type,
 						    poll_cb, event_cb, data);
 }
 
+int gpiod_ctxless_event_monitor_ext(const char *device, int event_type,
+				    unsigned int offset, bool active_low,
+				    int flags, const char *consumer,
+				    const struct timespec *timeout,
+				    gpiod_ctxless_event_poll_cb poll_cb,
+				    gpiod_ctxless_event_handle_cb event_cb,
+				    void *data)
+{
+	return gpiod_ctxless_event_monitor_multiple_ext(
+			device, event_type, &offset, 1, active_low,
+			flags, consumer, timeout, poll_cb, event_cb, data);
+}
+
 int gpiod_ctxless_event_monitor_multiple(
 			const char *device, int event_type,
 			const unsigned int *offsets,
@@ -225,6 +307,21 @@ int gpiod_ctxless_event_monitor_multiple(
 			gpiod_ctxless_event_poll_cb poll_cb,
 			gpiod_ctxless_event_handle_cb event_cb,
 			void *data)
+{
+	return gpiod_ctxless_event_monitor_multiple_ext(
+			device, event_type, offsets,
+			num_lines, active_low, 0, consumer, timeout,
+			poll_cb, event_cb, data);
+}
+
+int gpiod_ctxless_event_monitor_multiple_ext(
+			const char *device, int event_type,
+			const unsigned int *offsets,
+			unsigned int num_lines, bool active_low, int flags,
+			const char *consumer, const struct timespec *timeout,
+			gpiod_ctxless_event_poll_cb poll_cb,
+			gpiod_ctxless_event_handle_cb event_cb,
+			void *data)
 {
 	struct gpiod_ctxless_event_poll_fd fds[GPIOD_LINE_BULK_MAX_LINES];
 	struct gpiod_line_request_config conf;
@@ -259,7 +356,7 @@ int gpiod_ctxless_event_monitor_multiple(
 		gpiod_line_bulk_add(&bulk, line);
 	}
 
-	conf.flags = active_low ? GPIOD_LINE_REQUEST_FLAG_ACTIVE_LOW : 0;
+	conf.flags = ctxless_flags_to_line_request_flags(active_low, flags);
 	conf.consumer = consumer;
 
 	if (event_type == GPIOD_CTXLESS_EVENT_RISING_EDGE) {
-- 
2.24.0

