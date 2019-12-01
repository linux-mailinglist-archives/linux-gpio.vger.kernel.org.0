Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 50E4B10E03C
	for <lists+linux-gpio@lfdr.de>; Sun,  1 Dec 2019 04:25:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727280AbfLADZF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 30 Nov 2019 22:25:05 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:37733 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727012AbfLADZE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 30 Nov 2019 22:25:04 -0500
Received: by mail-pj1-f67.google.com with SMTP id ep17so729940pjb.4
        for <linux-gpio@vger.kernel.org>; Sat, 30 Nov 2019 19:25:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=l9ppFfAs67QcqEQsKDnr99fRKKkvYKRIj56Lr35smPk=;
        b=FXUhSBf+BZo5skGoTZHkM3tuuUecE/eKP9fDEl/HicfXmt9dhXZZ5jV0Q+VAdVTIUE
         5GUHSmQgrLQHSrCddpSNpAzZFySusAHHG5JOCRaYLIftlFd8QmNaY3AHxLZbQKPO1bBy
         JfzTkxnCE6c4hu9TnyCyL+1U7nMUAYkDhqTfvhpZatlWllQOCGMAn+EOjH0y7y1oNO+9
         1IOKH0lXFdsO6dXZVTRaREPEzZ3pNsaK2d/MfSF7qHHCzSccgw2FD62qe5NtKr8Y/sCK
         6bM3eKIdB0Kqq2z+REWeyXY22cxt7YbGQz4aGJNxjjvYv75dQwUcyG4Ze5t0Hnr7chFK
         Gg3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=l9ppFfAs67QcqEQsKDnr99fRKKkvYKRIj56Lr35smPk=;
        b=r1bwsXGro4Vs02bcb/lHfQbZOE2/EpKArGl5U3/YTFoSZTd06ClY8MeUWXBugSWylU
         8LiLGmfqOr5kK1sUCuZtpdu9cI0nbULwYTIymNVhMtUJOXStfl3ELKddJ8c0xvbAlL3y
         7L3fUuV8Oni9P571bsYfwfnupHOQSz1j3c+CbjxBp+2W/P27whjwJgzLiLfgJsljZ2ta
         pOQvvKpO1luPeCh7jB12cLqo+XjpHAbxZK+Gdy3YG+qCwUp+YvXFZpqYsAYkAHHBrbva
         7zDhXBpheMyC2d2K0WemnfLxtrL/DxXK+wtgZAxcHsMXVsqr0ST3VgUA8Us40AzSml6O
         PCUg==
X-Gm-Message-State: APjAAAW8F/1d4SyYwKqptt+sUax40BDbpLyumEjssCwVl2nXSTO1O4Dp
        yIeJa1UuhbPO24nfMavSepgSuB5K
X-Google-Smtp-Source: APXvYqyeHbE58/SomfnZ7/Nt7Yq9NK6JkNE7Ptf5BL7NyWgjtfNwUDW53Xk1Gh2u6092NTpIXTQLfw==
X-Received: by 2002:a17:902:70cb:: with SMTP id l11mr16616714plt.216.1575170703563;
        Sat, 30 Nov 2019 19:25:03 -0800 (PST)
Received: from sol.lan (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id z1sm30307655pfk.61.2019.11.30.19.25.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Nov 2019 19:25:03 -0800 (PST)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH v4 07/20] core: add support for SET_CONFIG
Date:   Sun,  1 Dec 2019 11:23:54 +0800
Message-Id: <20191201032407.23589-8-warthog618@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191201032407.23589-1-warthog618@gmail.com>
References: <20191201032407.23589-1-warthog618@gmail.com>
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

Documented the fields of gpiod_line to better identify the purpose of
each where the field name alone is not sufficiently clear, and to
indicate which flags are applicable to each field.

Implementation includes a few helper functions that serve to keep the
code tidier and are consistent with similar helper functions already
present.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 include/gpiod.h | 113 ++++++++++++++++++++++++++++++
 lib/core.c      | 182 +++++++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 293 insertions(+), 2 deletions(-)

diff --git a/include/gpiod.h b/include/gpiod.h
index 86c3ea9..41527d3 100644
--- a/include/gpiod.h
+++ b/include/gpiod.h
@@ -1305,6 +1305,119 @@ int gpiod_line_set_value(struct gpiod_line *line, int value) GPIOD_API;
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
+ *                  GPIOD_LINE_REQUEST_DIRECTION_AS_IS,
+ *                  GPIOD_LINE_REQUEST_DIRECTION_INPUT, or
+ *                  GPIOD_LINE_REQUEST_DIRECTION_OUTPUT.
+ * @param flags Replacement flags.
+ * @param value The new output value for the line when direction is
+ *              GPIOD_LINE_REQUEST_DIRECTION_OUTPUT.
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
+ *                  GPIOD_LINE_REQUEST_DIRECTION_AS_IS,
+ *                  GPIOD_LINE_REQUEST_DIRECTION_INPUT, or
+ *                  GPIOD_LINE_REQUEST_DIRECTION_OUTPUT.
+ * @param flags Replacement flags.
+ * @param values An array holding line_bulk->num_lines new logical values
+ *               for lines when direction is
+ *               GPIOD_LINE_REQUEST_DIRECTION_OUTPUT.
+ *               A NULL pointer is interpreted as a logical low for all lines.
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
+int gpiod_line_set_direction_input_bulk(struct gpiod_line_bulk *bulk
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
+ * @param values An array holding line_bulk->num_lines new logical values
+ *               for lines.  A NULL pointer is interpreted as a logical low
+ *               for all lines.
+ * @return 0 is the operation succeeds. In case of an error this routine
+ *         returns -1 and sets the last error number.
+ *
+ * If the lines were not previously requested together, the behavior is
+ * undefined.
+ */
+int gpiod_line_set_direction_output_bulk(struct gpiod_line_bulk *bulk,
+					 const int *values) GPIOD_API;
+
 /**
  * @}
  *
diff --git a/lib/core.c b/lib/core.c
index 0465de9..8966e7d 100644
--- a/lib/core.c
+++ b/lib/core.c
@@ -34,10 +34,26 @@ struct line_fd_handle {
 
 struct gpiod_line {
 	unsigned int offset;
+
+	/* The GPIOD_LINE_DIRECTION */
 	int direction;
+
+	/* The GPIOD_LINE_ACTIVE_STATE */
 	int active_state;
+
+	/* The logical value last written to the line. */
+	int output_value;
+
+	/* The GPIOLINE_FLAGs returned by GPIO_GET_LINEINFO_IOCTL */
 	__u32 info_flags;
 
+	/* The GPIOD_LINE_REQUEST_FLAGs provided to request the line. */
+	__u32 req_flags;
+
+	/*
+	 * Indicator of LINE_FREE, LINE_REQUESTED_VALUES or
+	 *  LINE_REQUESTED_EVENTS
+	 */
 	int state;
 
 	struct gpiod_chip *chip;
@@ -445,6 +461,20 @@ static bool line_bulk_all_requested(struct gpiod_line_bulk *bulk)
 	return true;
 }
 
+static bool line_bulk_all_requested_values(struct gpiod_line_bulk *bulk)
+{
+	struct gpiod_line *line, **lineptr;
+
+	gpiod_line_bulk_foreach_line(bulk, line, lineptr) {
+		if (line->state != LINE_REQUESTED_VALUES) {
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
@@ -459,6 +489,27 @@ static bool line_bulk_all_free(struct gpiod_line_bulk *bulk)
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
@@ -483,7 +534,7 @@ static int line_request_values(struct gpiod_line_bulk *bulk,
 			       const struct gpiod_line_request_config *config,
 			       const int *default_vals)
 {
-	struct gpiod_line *line, **lineptr;
+	struct gpiod_line *line;
 	struct line_fd_handle *line_fd;
 	struct gpiohandle_request req;
 	unsigned int i;
@@ -536,8 +587,12 @@ static int line_request_values(struct gpiod_line_bulk *bulk,
 	if (!line_fd)
 		return -1;
 
-	gpiod_line_bulk_foreach_line(bulk, line, lineptr) {
+	gpiod_line_bulk_foreach_line_off(bulk, line, i) {
 		line->state = LINE_REQUESTED_VALUES;
+		line->req_flags = config->flags;
+		if (config->request_type ==
+				GPIOD_LINE_REQUEST_DIRECTION_OUTPUT)
+			line->output_value = req.default_values[i];
 		line_set_fd(line, line_fd);
 
 		rv = gpiod_line_update(line);
@@ -583,6 +638,7 @@ static int line_request_event_single(struct gpiod_line *line,
 		return -1;
 
 	line->state = LINE_REQUESTED_EVENTS;
+	line->req_flags = config->flags;
 	line_set_fd(line, line_fd);
 
 	rv = gpiod_line_update(line);
@@ -766,9 +822,131 @@ int gpiod_line_set_value_bulk(struct gpiod_line_bulk *bulk, const int *values)
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
+	gpiod_line_bulk_foreach_line_off(bulk, line, i) {
+		line->req_flags = flags;
+		if (direction == GPIOD_LINE_REQUEST_DIRECTION_OUTPUT)
+			line->output_value = hcfg.default_values[i];
+
+		rv = gpiod_line_update(line);
+		if (rv < 0)
+			return rv;
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
+	if (line->direction == GPIOD_LINE_DIRECTION_OUTPUT) {
+		gpiod_line_bulk_foreach_line_off(bulk, line, i)
+			values[i] = line->output_value;
+
+		direction = GPIOD_LINE_REQUEST_DIRECTION_OUTPUT;
+	} else {
+		direction = GPIOD_LINE_REQUEST_DIRECTION_INPUT;
+	}
+
+	return gpiod_line_set_config_bulk(bulk, direction,
+					  flags, values);
+}
+
+int gpiod_line_set_direction_input(struct gpiod_line *line)
+{
+	return gpiod_line_set_config(line, GPIOD_LINE_REQUEST_DIRECTION_INPUT,
+				     line->req_flags, 0);
+}
+
+int gpiod_line_set_direction_input_bulk(struct gpiod_line_bulk *bulk)
+{
+	struct gpiod_line *line;
+
+	line = gpiod_line_bulk_get_line(bulk, 0);
+	return gpiod_line_set_config_bulk(bulk,
+					  GPIOD_LINE_REQUEST_DIRECTION_INPUT,
+					  line->req_flags, NULL);
+}
+
+int gpiod_line_set_direction_output(struct gpiod_line *line, int value)
+{
+	return gpiod_line_set_config(line, GPIOD_LINE_REQUEST_DIRECTION_OUTPUT,
+				     line->req_flags, value);
+}
+
+int gpiod_line_set_direction_output_bulk(struct gpiod_line_bulk *bulk,
+					 const int *values)
+{
+	struct gpiod_line *line;
+
+	line = gpiod_line_bulk_get_line(bulk, 0);
+	return gpiod_line_set_config_bulk(bulk,
+					  GPIOD_LINE_REQUEST_DIRECTION_OUTPUT,
+					  line->req_flags, values);
+}
+
 int gpiod_line_event_wait(struct gpiod_line *line,
 			  const struct timespec *timeout)
 {
-- 
2.24.0

