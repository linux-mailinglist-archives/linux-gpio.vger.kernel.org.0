Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2DC57FE066
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Nov 2019 15:45:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727628AbfKOOpT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 15 Nov 2019 09:45:19 -0500
Received: from mail-pg1-f169.google.com ([209.85.215.169]:46653 "EHLO
        mail-pg1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727496AbfKOOpT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 15 Nov 2019 09:45:19 -0500
Received: by mail-pg1-f169.google.com with SMTP id r18so6087705pgu.13
        for <linux-gpio@vger.kernel.org>; Fri, 15 Nov 2019 06:45:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NVrPaEyoEe4sNOMv0b3KHLKiO/GE1MKLycW7wjCPVFI=;
        b=REAWzHHph/6+Byp5hxNGmNI8xdNzbSe8j+yXOkG9dWiNVvj2OsNDgpUtExsq1GpcXH
         aGtevpVhS0rGH7i9Eg/BIcw7TncusTWMhB/CPFrkzgGf/xIaQE1Lbv8gzRptQYN8UnQ0
         Ty2jCfRXlTaWOeEXOEIEWy90tfPcTIo6oxVhP+CKEa7MmPYEzmD4HqV3TrrMJzVtJRDi
         ljdlWUVZjkSGfUgnBF3Mom2pVE1/FdYcOFvpDnQydIUycEpODmn9XAjKa1b7Gjw/Dl5G
         Zh+qbCXwJhh9dwWuBGWhaECi//sl2uT2HiZO4To+0TxT8GLG9TzC9AUt70MLyKZVtdSn
         SKNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NVrPaEyoEe4sNOMv0b3KHLKiO/GE1MKLycW7wjCPVFI=;
        b=aEQxSQ1PlZhhIRZH0bwhsUCP7amotTpjX3nC6JpgKUKSkuKqk8PiqA1AQQtWDMWJjX
         0IgVQFNyPxf1rQRd5dDsN6VWjA/V0otC7QU8JcaQgkO86uCSRjJFxSWMoSCdGlV7e15x
         bsH8R/62d46eY3yTHNjq8w299xRJH80BjAcVB/AbmcFWOkKISKqIcreb8eqf0KosmHCr
         On08r5OEPKTyB3HKvlEb7xJp730Cx/JvXGkBuhXJWt/AZH1diKZDGcphgIU5NScuqaJ5
         1lB+7d65KcOZMBKr3DvJfadV75jyQVbTsHEQiCAG1VZUegtnxBZ3ZhMsDHKryHMUDX27
         vSqA==
X-Gm-Message-State: APjAAAXHgJjIVBGlZdW/5+j2TO79jcETtKcDgi01uamvymsA1fOrCFLk
        9JUBjUNi6lCJzWzaSofitzxp6qfROAU=
X-Google-Smtp-Source: APXvYqz0fvUsXuYeYxC7QyMfcYPjSWkw/ek4ijhbJ0jd59O4AioPmg5IhF7s8HOtGb8WFz0pYWN8fg==
X-Received: by 2002:a65:44ca:: with SMTP id g10mr16883607pgs.104.1573829117404;
        Fri, 15 Nov 2019 06:45:17 -0800 (PST)
Received: from sol.lan (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id y123sm10517726pfg.64.2019.11.15.06.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2019 06:45:16 -0800 (PST)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod] [PATCH 11/19] API: add support for SET_CONFIG
Date:   Fri, 15 Nov 2019 22:43:47 +0800
Message-Id: <20191115144355.975-12-warthog618@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191115144355.975-1-warthog618@gmail.com>
References: <20191115144355.975-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Extend the libgpiod API to support the setting line configuration using the
GPIO GPIOHANDLE_SET_CONFIG_IOCTL uAPI ioctl.

The core change is the addition of gpiod_line_set_config, which provides a
low level wrapper around the ioctl.

Additionally, higher level helper functions, gpiod_line_set_flags,
gpiod_line_set_direction_input, and gpiod_line_set_direction_output provide
slightly simplified APIs for common use cases.

Bulk forms of all functions are also provided.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 include/gpiod.h | 115 ++++++++++++++++++++++++++++
 lib/core.c      | 196 +++++++++++++++++++++++++++++++++++++++++++++---
 2 files changed, 300 insertions(+), 11 deletions(-)

diff --git a/include/gpiod.h b/include/gpiod.h
index 159d745..4053fd2 100644
--- a/include/gpiod.h
+++ b/include/gpiod.h
@@ -1252,6 +1252,14 @@ void gpiod_line_release_bulk(struct gpiod_line_bulk *bulk) GPIOD_API;
  */
 bool gpiod_line_is_requested(struct gpiod_line *line) GPIOD_API;
 
+/**
+ * @brief Check if the calling user has ownership of this line for values,
+ * not events.
+ * @param line GPIO line object.
+ * @return True if given line was requested, false otherwise.
+ */
+bool gpiod_line_is_requested_values(struct gpiod_line *line) GPIOD_API;
+
 /**
  * @brief Check if the calling user has neither requested ownership of this
  *        line nor configured any event notifications.
@@ -1311,6 +1319,113 @@ int gpiod_line_set_value(struct gpiod_line *line, int value) GPIOD_API;
 int gpiod_line_set_value_bulk(struct gpiod_line_bulk *bulk,
 			      const int *values) GPIOD_API;
 
+/**
+ * @}
+ *
+ * @defgroup __line_config__ Setting line configuration
+ * @{
+ */
+
+/**
+ * @brief Update the configuration of a single GPIO line.
+ * @param line GPIO line object.
+ * @param direction Updated direction which may be one of
+ * GPIOD_LINE_REQUEST_DIRECTION_AS_IS, GPIOD_LINE_REQUEST_DIRECTION_INPUT,
+ * or GPIOD_LINE_REQUEST_DIRECTION_OUTPUT.
+ * @param flags Replacement flags.
+ * @param value The new output value for the line when direction is
+ * GPIOD_LINE_REQUEST_DIRECTION_OUTPUT.
+ * @return 0 is the operation succeeds. In case of an error this routine
+ *         returns -1 and sets the last error number.
+ */
+int gpiod_line_set_config(struct gpiod_line *line, int direction,
+			  int flags, int value) GPIOD_API;
+
+/**
+ * @brief Update the configuration of a set of GPIO lines.
+ * @param bulk Set of GPIO lines.
+ * @param direction Updated direction which may be one of
+ * GPIOD_LINE_REQUEST_DIRECTION_AS_IS, GPIOD_LINE_REQUEST_DIRECTION_INPUT,
+ * or GPIOD_LINE_REQUEST_DIRECTION_OUTPUT.
+ * @param flags Replacement flags.
+ * @param values An array holding line_bulk->num_lines new logical values
+ * for lines when direction is GPIOD_LINE_REQUEST_DIRECTION_OUTPUT.
+ * @return 0 is the operation succeeds. In case of an error this routine
+ *         returns -1 and sets the last error number.
+ *
+ * If the lines were not previously requested together, the behavior is
+ * undefined.
+ */
+int gpiod_line_set_config_bulk(struct gpiod_line_bulk *bulk,
+			       int direction, int flags,
+			       const int *values) GPIOD_API;
+
+
+/**
+ * @brief Update the configuration flags of a single GPIO line.
+ * @param line GPIO line object.
+ * @param flags Replacement flags.
+ * @return 0 is the operation succeeds. In case of an error this routine
+ *         returns -1 and sets the last error number.
+ */
+int gpiod_line_set_flags(struct gpiod_line *line, int flags) GPIOD_API;
+
+/**
+ * @brief Update the configuration flags of a set of GPIO lines.
+ * @param bulk Set of GPIO lines.
+ * @param flags Replacement flags.
+ * @return 0 is the operation succeeds. In case of an error this routine
+ *         returns -1 and sets the last error number.
+ *
+ * If the lines were not previously requested together, the behavior is
+ * undefined.
+ */
+int gpiod_line_set_flags_bulk(struct gpiod_line_bulk *bulk,
+			      int flags) GPIOD_API;
+
+/**
+ * @brief Set the direction of a single GPIO line to input.
+ * @param line GPIO line object.
+ * @return 0 is the operation succeeds. In case of an error this routine
+ *         returns -1 and sets the last error number.
+ */
+int gpiod_line_set_direction_input(struct gpiod_line *line) GPIOD_API;
+
+/**
+ * @brief Set the direction of a set of GPIO lines to input.
+ * @param bulk Set of GPIO lines.
+ * @return 0 is the operation succeeds. In case of an error this routine
+ *         returns -1 and sets the last error number.
+ *
+ * If the lines were not previously requested together, the behavior is
+ * undefined.
+ */
+int gpiod_line_set_direction_bulk_input(struct gpiod_line_bulk *bulk
+					) GPIOD_API;
+
+/**
+ * @brief Set the direction of a single GPIO line to output.
+ * @param line GPIO line object.
+ * @param value The logical value output on the line.
+ * @return 0 is the operation succeeds. In case of an error this routine
+ *         returns -1 and sets the last error number.
+ */
+int gpiod_line_set_direction_output(struct gpiod_line *line,
+				    int value) GPIOD_API;
+
+/**
+ * @brief Set the direction of a set of GPIO lines to output.
+ * @param bulk Set of GPIO lines.
+ * @values The logical value to output for each line.
+ * @return 0 is the operation succeeds. In case of an error this routine
+ *         returns -1 and sets the last error number.
+ *
+ * If the lines were not previously requested together, the behavior is
+ * undefined.
+ */
+int gpiod_line_set_direction_bulk_output(struct gpiod_line_bulk *bulk,
+					 const int *values) GPIOD_API;
+
 /**
  * @}
  *
diff --git a/lib/core.c b/lib/core.c
index 9b7d88f..c42cda5 100644
--- a/lib/core.c
+++ b/lib/core.c
@@ -36,10 +36,13 @@ struct gpiod_line {
 	unsigned int offset;
 	int direction;
 	int active_state;
-	__u32 flags;
+	int output_value;
+	__u32 lflags;
+	__u32 cflags;
 
 	int state;
 	bool needs_update;
+	bool as_is;
 
 	struct gpiod_chip *chip;
 	struct line_fd_handle *fd_handle;
@@ -359,11 +362,11 @@ int gpiod_line_active_state(struct gpiod_line *line)
 
 int gpiod_line_bias(struct gpiod_line *line)
 {
-	if (line->flags & GPIOLINE_FLAG_BIAS_DISABLE)
+	if (line->lflags & GPIOLINE_FLAG_BIAS_DISABLE)
 		return GPIOD_LINE_BIAS_DISABLE;
-	if (line->flags & GPIOLINE_FLAG_BIAS_PULL_UP)
+	if (line->lflags & GPIOLINE_FLAG_BIAS_PULL_UP)
 		return GPIOD_LINE_BIAS_PULL_UP;
-	if (line->flags & GPIOLINE_FLAG_BIAS_PULL_DOWN)
+	if (line->lflags & GPIOLINE_FLAG_BIAS_PULL_DOWN)
 		return GPIOD_LINE_BIAS_PULL_DOWN;
 
 	return GPIOD_LINE_BIAS_AS_IS;
@@ -371,17 +374,17 @@ int gpiod_line_bias(struct gpiod_line *line)
 
 bool gpiod_line_is_used(struct gpiod_line *line)
 {
-	return line->flags & GPIOLINE_FLAG_KERNEL;
+	return line->lflags & GPIOLINE_FLAG_KERNEL;
 }
 
 bool gpiod_line_is_open_drain(struct gpiod_line *line)
 {
-	return line->flags & GPIOLINE_FLAG_OPEN_DRAIN;
+	return line->lflags & GPIOLINE_FLAG_OPEN_DRAIN;
 }
 
 bool gpiod_line_is_open_source(struct gpiod_line *line)
 {
-	return line->flags & GPIOLINE_FLAG_OPEN_SOURCE;
+	return line->lflags & GPIOLINE_FLAG_OPEN_SOURCE;
 }
 
 bool gpiod_line_needs_update(struct gpiod_line *line)
@@ -408,7 +411,7 @@ int gpiod_line_update(struct gpiod_line *line)
 						? GPIOD_LINE_ACTIVE_STATE_LOW
 						: GPIOD_LINE_ACTIVE_STATE_HIGH;
 
-	line->flags = info.flags;
+	line->lflags = info.flags;
 
 	strncpy(line->name, info.name, sizeof(line->name));
 	strncpy(line->consumer, info.consumer, sizeof(line->consumer));
@@ -457,6 +460,20 @@ static bool line_bulk_all_requested(struct gpiod_line_bulk *bulk)
 	return true;
 }
 
+static bool line_bulk_all_requested_values(struct gpiod_line_bulk *bulk)
+{
+	struct gpiod_line *line, **lineptr;
+
+	gpiod_line_bulk_foreach_line(bulk, line, lineptr) {
+		if (!gpiod_line_is_requested_values(line)) {
+			errno = EPERM;
+			return false;
+		}
+	}
+
+	return true;
+}
+
 static bool line_bulk_all_free(struct gpiod_line_bulk *bulk)
 {
 	struct gpiod_line *line, **lineptr;
@@ -471,6 +488,27 @@ static bool line_bulk_all_free(struct gpiod_line_bulk *bulk)
 	return true;
 }
 
+static bool line_request_direction_is_valid(int direction)
+{
+	if ((direction == GPIOD_LINE_REQUEST_DIRECTION_AS_IS) ||
+	    (direction == GPIOD_LINE_REQUEST_DIRECTION_INPUT) ||
+	    (direction == GPIOD_LINE_REQUEST_DIRECTION_OUTPUT))
+		return true;
+
+	errno = EINVAL;
+	return false;
+}
+
+static __u32 line_request_direction_to_gpio_handleflag(int direction)
+{
+	if (direction == GPIOD_LINE_REQUEST_DIRECTION_INPUT)
+		return GPIOHANDLE_REQUEST_INPUT;
+	if (direction == GPIOD_LINE_REQUEST_DIRECTION_OUTPUT)
+		return GPIOHANDLE_REQUEST_OUTPUT;
+
+	return 0;
+}
+
 static __u32 line_request_flag_to_gpio_handleflag(int flags)
 {
 	int hflags = 0;
@@ -495,7 +533,7 @@ static int line_request_values(struct gpiod_line_bulk *bulk,
 			       const struct gpiod_line_request_config *config,
 			       const int *default_vals)
 {
-	struct gpiod_line *line, **lineptr;
+	struct gpiod_line *line;
 	struct line_fd_handle *line_fd;
 	struct gpiohandle_request req;
 	unsigned int i;
@@ -524,7 +562,6 @@ static int line_request_values(struct gpiod_line_bulk *bulk,
 	else if (config->request_type == GPIOD_LINE_REQUEST_DIRECTION_OUTPUT)
 		req.flags |= GPIOHANDLE_REQUEST_OUTPUT;
 
-
 	gpiod_line_bulk_foreach_line_off(bulk, line, i) {
 		req.lineoffsets[i] = gpiod_line_offset(line);
 		if (config->request_type ==
@@ -548,8 +585,14 @@ static int line_request_values(struct gpiod_line_bulk *bulk,
 	if (!line_fd)
 		return -1;
 
-	gpiod_line_bulk_foreach_line(bulk, line, lineptr) {
+	gpiod_line_bulk_foreach_line_off(bulk, line, i) {
 		line->state = LINE_REQUESTED_VALUES;
+		line->cflags = config->flags;
+		if (config->request_type ==
+			GPIOD_LINE_REQUEST_DIRECTION_OUTPUT)
+			line->output_value = req.default_values[i];
+		if (config->request_type == GPIOD_LINE_REQUEST_DIRECTION_AS_IS)
+			line->as_is = true;
 		line_set_fd(line, line_fd);
 		line_maybe_update(line);
 	}
@@ -590,6 +633,7 @@ static int line_request_event_single(struct gpiod_line *line,
 		return -1;
 
 	line->state = LINE_REQUESTED_EVENTS;
+	line->cflags = config->flags;
 	line_set_fd(line, line_fd);
 	line_maybe_update(line);
 
@@ -688,6 +732,11 @@ bool gpiod_line_is_requested(struct gpiod_line *line)
 		line->state == LINE_REQUESTED_EVENTS);
 }
 
+bool gpiod_line_is_requested_values(struct gpiod_line *line)
+{
+	return (line->state == LINE_REQUESTED_VALUES);
+}
+
 bool gpiod_line_is_free(struct gpiod_line *line)
 {
 	return line->state == LINE_FREE;
@@ -766,9 +815,134 @@ int gpiod_line_set_value_bulk(struct gpiod_line_bulk *bulk, const int *values)
 	if (rv < 0)
 		return -1;
 
+	gpiod_line_bulk_foreach_line_off(bulk, line, i)
+		line->output_value = data.values[i];
+
+	return 0;
+}
+
+int gpiod_line_set_config(struct gpiod_line *line, int direction,
+			  int flags, int value)
+{
+	struct gpiod_line_bulk bulk;
+
+	gpiod_line_bulk_init(&bulk);
+	gpiod_line_bulk_add(&bulk, line);
+
+	return gpiod_line_set_config_bulk(&bulk, direction, flags, &value);
+}
+
+int gpiod_line_set_config_bulk(struct gpiod_line_bulk *bulk,
+			       int direction, int flags,
+			       const int *values)
+{
+	struct gpiohandle_config hcfg;
+	struct gpiod_line *line;
+	unsigned int i;
+	int rv, fd;
+	bool as_is;
+
+	if (!line_bulk_same_chip(bulk) ||
+	    !line_bulk_all_requested_values(bulk))
+		return -1;
+
+	if (!line_request_direction_is_valid(direction))
+		return -1;
+
+	memset(&hcfg, 0, sizeof(hcfg));
+
+	hcfg.flags = line_request_flag_to_gpio_handleflag(flags);
+	hcfg.flags |= line_request_direction_to_gpio_handleflag(direction);
+	if (direction == GPIOD_LINE_REQUEST_DIRECTION_OUTPUT && values) {
+		for (i = 0; i < gpiod_line_bulk_num_lines(bulk); i++)
+			hcfg.default_values[i] = (uint8_t)!!values[i];
+	}
+
+	line = gpiod_line_bulk_get_line(bulk, 0);
+	fd = line_get_fd(line);
+
+	rv = ioctl(fd, GPIOHANDLE_SET_CONFIG_IOCTL, &hcfg);
+	if (rv < 0)
+		return -1;
+
+	as_is = line->as_is && direction == GPIOD_LINE_REQUEST_DIRECTION_AS_IS;
+	gpiod_line_bulk_foreach_line_off(bulk, line, i) {
+		line->cflags = flags;
+		if (direction == GPIOD_LINE_REQUEST_DIRECTION_OUTPUT)
+			line->output_value = hcfg.default_values[i];
+		line->as_is = as_is;
+		line_maybe_update(line);
+	}
 	return 0;
 }
 
+int gpiod_line_set_flags(struct gpiod_line *line, int flags)
+{
+	struct gpiod_line_bulk bulk;
+
+	gpiod_line_bulk_init(&bulk);
+	gpiod_line_bulk_add(&bulk, line);
+
+	return gpiod_line_set_flags_bulk(&bulk, flags);
+}
+
+int gpiod_line_set_flags_bulk(struct gpiod_line_bulk *bulk, int flags)
+{
+	struct gpiod_line *line;
+	int values[GPIOD_LINE_BULK_MAX_LINES];
+	unsigned int i;
+	int direction;
+
+	line = gpiod_line_bulk_get_line(bulk, 0);
+	if (line->as_is) {
+		errno = EPERM;
+		return -1;
+	}
+	if (line->direction == GPIOD_LINE_DIRECTION_OUTPUT) {
+		gpiod_line_bulk_foreach_line_off(bulk, line, i) {
+			values[i] = line->output_value;
+		}
+		direction = GPIOD_LINE_REQUEST_DIRECTION_OUTPUT;
+	} else
+		direction = GPIOD_LINE_REQUEST_DIRECTION_INPUT;
+
+	return gpiod_line_set_config_bulk(bulk, direction,
+					  flags, values);
+}
+
+int gpiod_line_set_direction_input(struct gpiod_line *line)
+{
+	return gpiod_line_set_config(line, GPIOD_LINE_REQUEST_DIRECTION_INPUT,
+				     line->cflags, 0);
+}
+
+int gpiod_line_set_direction_bulk_input(struct gpiod_line_bulk *bulk)
+{
+	struct gpiod_line *line;
+
+	line = gpiod_line_bulk_get_line(bulk, 0);
+	return gpiod_line_set_config_bulk(bulk,
+					  GPIOD_LINE_REQUEST_DIRECTION_INPUT,
+					  line->cflags, NULL);
+}
+
+int gpiod_line_set_direction_output(struct gpiod_line *line, int value)
+{
+	return gpiod_line_set_config(line, GPIOD_LINE_REQUEST_DIRECTION_OUTPUT,
+				     line->cflags, value);
+}
+
+int gpiod_line_set_direction_bulk_output(struct gpiod_line_bulk *bulk,
+					const int *values)
+{
+	struct gpiod_line *line;
+
+	line = gpiod_line_bulk_get_line(bulk, 0);
+	return gpiod_line_set_config_bulk(bulk,
+					  GPIOD_LINE_REQUEST_DIRECTION_OUTPUT,
+					  line->cflags, values);
+}
+
 int gpiod_line_event_wait(struct gpiod_line *line,
 			  const struct timespec *timeout)
 {
-- 
2.24.0

