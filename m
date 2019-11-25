Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9FA5E10900B
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Nov 2019 15:32:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728154AbfKYOc5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 Nov 2019 09:32:57 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:39375 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728026AbfKYOc5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 Nov 2019 09:32:57 -0500
Received: by mail-pg1-f195.google.com with SMTP id b137so4978399pga.6
        for <linux-gpio@vger.kernel.org>; Mon, 25 Nov 2019 06:32:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=c5wnArXo3jICeKKNpOvYyMy141eFcQOYocCtnzhv/BY=;
        b=APzarz9wskz/o3iGVIvyxQadEBTR+t71o/xkBASZEk/2pTDhQYlK6fpBPv9FVs8rg/
         +s0LuNrfRgwUJCMOqUjYjKNI+Ut93E7fSnGm1Czb4KeIfxjiBwB8M6mpGTC+Ht49AHA+
         xooJI+Mtkz+MZ7TSQWVqBzOZxh/dJAFUJWTapP/EuQdUeL4wQPbF4ylYkcdCFkQZSwqO
         ae+Un53w1mUyI3A1Ki60/VWyvLQS33+9jU1ApKm/Ef/zzSQxh3AVvcm0LQYoYjFLzMWf
         OpQhdLLEjGgvjSgIZNIIy4u83Wll+rQTHosjtl9vkuHn+6uj9IKyD2wqE85IC0HlHQNA
         cRmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=c5wnArXo3jICeKKNpOvYyMy141eFcQOYocCtnzhv/BY=;
        b=oLyWf6tDjz1kCTJLob3T2fWRMM/vcYMXap4kkraEUhhoEuxoubf5dLT/gZPW2l1OEb
         Fh1c1Fyg/dKHW/hKZQXUfn40GObDGRTGPOoEkY9fiPGoYlLhtZN5GwHbUG1nlHTd6lDy
         KEljnqto5e9rc4m2qvrwLiDFfDpWLbS71BUtFrhaUGjXCwD0Gf/YgNkJCyW4KgfyHOYH
         4Pow4NJqco3i8nJ0MYhOU7NJRULb+v/OKzRiithDei9I04GcwDPE1Agv2EABZfK+ewsg
         084LIF4VOcjL2aDwHPVEleIIlvZXYDoraSmBDDFUz1jvXuxhcf3RTfsG4iKS38yWjOBr
         /W0w==
X-Gm-Message-State: APjAAAWJ4ZVza9pFWTjYgMjgUphD2M8793LM270w1frgTvEBT2wSqQh3
        K3Nrnplckz5HiZR3qbDJAr+hqGWITOSLwg==
X-Google-Smtp-Source: APXvYqxz3KeheBgSHstsaM7f40/DbzFmViCuJinlW4Xjqm6ZMPeUo2z2bFKiw+DbO2oIJGRD+KpOwQ==
X-Received: by 2002:aa7:91d2:: with SMTP id z18mr12590717pfa.97.1574692375074;
        Mon, 25 Nov 2019 06:32:55 -0800 (PST)
Received: from sol.lan (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id i5sm8642100pfo.52.2019.11.25.06.32.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2019 06:32:54 -0800 (PST)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH v3 07/14] core: add support for SET_CONFIG
Date:   Mon, 25 Nov 2019 22:31:50 +0800
Message-Id: <20191125143157.26154-8-warthog618@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191125143157.26154-1-warthog618@gmail.com>
References: <20191125143157.26154-1-warthog618@gmail.com>
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
 include/gpiod.h | 123 +++++++++++++++++++++++++++++++
 lib/core.c      | 187 +++++++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 307 insertions(+), 3 deletions(-)

diff --git a/include/gpiod.h b/include/gpiod.h
index 86c3ea9..185e2f4 100644
--- a/include/gpiod.h
+++ b/include/gpiod.h
@@ -1246,6 +1246,15 @@ void gpiod_line_release_bulk(struct gpiod_line_bulk *bulk) GPIOD_API;
  */
 bool gpiod_line_is_requested(struct gpiod_line *line) GPIOD_API;
 
+/**
+ * @brief Check if the calling user has ownership of this line for values,
+ * not events.
+ * @param line GPIO line object.
+ * @return True if given line was requested for reading/setting values,
+ *         false otherwise.
+ */
+bool gpiod_line_is_requested_values(struct gpiod_line *line) GPIOD_API;
+
 /**
  * @brief Check if the calling user has neither requested ownership of this
  *        line nor configured any event notifications.
@@ -1296,6 +1305,7 @@ int gpiod_line_set_value(struct gpiod_line *line, int value) GPIOD_API;
  * @brief Set the values of a set of GPIO lines.
  * @param bulk Set of GPIO lines to reserve.
  * @param values An array holding line_bulk->num_lines new values for lines.
+ *               A NULL pointer is interpreted as a logical low for all lines.
  * @return 0 is the operation succeeds. In case of an error this routine
  *         returns -1 and sets the last error number.
  *
@@ -1305,6 +1315,119 @@ int gpiod_line_set_value(struct gpiod_line *line, int value) GPIOD_API;
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
index 0465de9..71bb4fb 100644
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
@@ -512,7 +563,6 @@ static int line_request_values(struct gpiod_line_bulk *bulk,
 	else if (config->request_type == GPIOD_LINE_REQUEST_DIRECTION_OUTPUT)
 		req.flags |= GPIOHANDLE_REQUEST_OUTPUT;
 
-
 	gpiod_line_bulk_foreach_line_off(bulk, line, i) {
 		req.lineoffsets[i] = gpiod_line_offset(line);
 		if (config->request_type ==
@@ -536,8 +586,12 @@ static int line_request_values(struct gpiod_line_bulk *bulk,
 	if (!line_fd)
 		return -1;
 
-	gpiod_line_bulk_foreach_line(bulk, line, lineptr) {
+	gpiod_line_bulk_foreach_line_off(bulk, line, i) {
 		line->state = LINE_REQUESTED_VALUES;
+		line->req_flags = config->flags;
+		if (config->request_type ==
+			GPIOD_LINE_REQUEST_DIRECTION_OUTPUT)
+			line->output_value = req.default_values[i];
 		line_set_fd(line, line_fd);
 
 		rv = gpiod_line_update(line);
@@ -583,6 +637,7 @@ static int line_request_event_single(struct gpiod_line *line,
 		return -1;
 
 	line->state = LINE_REQUESTED_EVENTS;
+	line->req_flags = config->flags;
 	line_set_fd(line, line_fd);
 
 	rv = gpiod_line_update(line);
@@ -686,6 +741,11 @@ bool gpiod_line_is_requested(struct gpiod_line *line)
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
@@ -766,9 +826,130 @@ int gpiod_line_set_value_bulk(struct gpiod_line_bulk *bulk, const int *values)
 	if (rv < 0)
 		return -1;
 
+	gpiod_line_bulk_foreach_line_off(bulk, line, i)
+		line->output_value = data.values[i];
+
 	return 0;
 }
 
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
+		rv = gpiod_line_update(line);
+		if (rv < 0)
+			return rv;
+	}
+	return 0;
+}
+
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
+		gpiod_line_bulk_foreach_line_off(bulk, line, i) {
+			values[i] = line->output_value;
+		}
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

