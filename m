Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7544810479D
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Nov 2019 01:36:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726704AbfKUAgh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 20 Nov 2019 19:36:37 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:43778 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726573AbfKUAgg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Nov 2019 19:36:36 -0500
Received: by mail-pg1-f194.google.com with SMTP id b1so610225pgq.10
        for <linux-gpio@vger.kernel.org>; Wed, 20 Nov 2019 16:36:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RP7X0RojUFvuKrRD9e7EPNN8SLHYfigr/JUjG05aRds=;
        b=eHBp0uvWsPYvgOLidPa09HbP41DhIzFS9QUErD5yqVgqp0bB32ick6I2boXC0974o1
         VYcfUE60OuO44ewDwRpDt0mzJRy6Ac/bGsQ/jMfKPWcP5H8KMEbczfunqAhPYgPXbJ37
         7AzX9EewiUNFJjaSXGygHo3Vw2dinZweyalFmXwTu30cgfCF324rnVPmp0j8brPQqUqQ
         fUEf38J5fQ9Ns2rCAYVp6pQqcp0EOOmV2/Rp+wLHSEG4d0s/stY4dXYJh+5/scJ3DbwM
         gSSEa1wGRY/1IZJuQHjbNo5G5QTjYRtTGFh6KJShGWQjASsC6n2VS3I5r0EZkp4OS1Sh
         2+CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RP7X0RojUFvuKrRD9e7EPNN8SLHYfigr/JUjG05aRds=;
        b=X7vQYW4yiuBoHjxtfgFx5FZRrdyvYR52GalX7qcTpnO5Ke/jwnFhde293Bl0KwoLqy
         iW5lX/CBPmJWsRC385/79oQQTVdUGclx/EOhGPKv8VjOtrJblM/RBd6mdagp4QD+A7WO
         CRmN+93OsH+PVIZQPPA6Mj5K2xUsdIjW5ocuDqjlAoabu/EN8B1DOu8xs+YlaVxLTnz0
         gnBNhpS5BEcpKl5kPmQBg0gXhrryiwxP20qMEsUDjj9OJkndNe20nr7L0c5rguNOK0rU
         dWh4vAqO8XOZLVjgfJlBpWCmLnGCmP0+edrz1zJJRUWGNeVLzj5kqQU4RiCnqdyT3dOA
         R6oA==
X-Gm-Message-State: APjAAAUXS1puV0PrcTUJeN5uCbjpXReZ5P17zJwN9KBEz3kOAz4yeXs1
        mlBeFepuciS8CRvF1Z0Bv4s+cVIvcjw=
X-Google-Smtp-Source: APXvYqwJonOmA8mzE+hMND/lmnG7AsNhF17WzJDyTZeV2ovDAYel+c3D8yakmWWJ1RKLhOhIv+1Yhg==
X-Received: by 2002:a63:2341:: with SMTP id u1mr6214601pgm.231.1574296595336;
        Wed, 20 Nov 2019 16:36:35 -0800 (PST)
Received: from sol.lan (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id s1sm420756pgk.9.2019.11.20.16.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2019 16:36:34 -0800 (PST)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH v2 07/14] core: add support for SET_CONFIG
Date:   Thu, 21 Nov 2019 08:35:49 +0800
Message-Id: <20191121003556.9020-8-warthog618@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191121003556.9020-1-warthog618@gmail.com>
References: <20191121003556.9020-1-warthog618@gmail.com>
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
 lib/core.c      | 188 +++++++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 308 insertions(+), 3 deletions(-)

diff --git a/include/gpiod.h b/include/gpiod.h
index cdf0435..f86c70e 100644
--- a/include/gpiod.h
+++ b/include/gpiod.h
@@ -1251,6 +1251,15 @@ void gpiod_line_release_bulk(struct gpiod_line_bulk *bulk) GPIOD_API;
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
@@ -1301,6 +1310,7 @@ int gpiod_line_set_value(struct gpiod_line *line, int value) GPIOD_API;
  * @brief Set the values of a set of GPIO lines.
  * @param bulk Set of GPIO lines to reserve.
  * @param values An array holding line_bulk->num_lines new values for lines.
+ *               A NULL pointer is interpreted as a logical low for all lines.
  * @return 0 is the operation succeeds. In case of an error this routine
  *         returns -1 and sets the last error number.
  *
@@ -1310,6 +1320,119 @@ int gpiod_line_set_value(struct gpiod_line *line, int value) GPIOD_API;
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
index ece3b13..9511a22 100644
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
 	bool needs_update;
 
@@ -457,6 +473,20 @@ static bool line_bulk_all_requested(struct gpiod_line_bulk *bulk)
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
@@ -471,6 +501,27 @@ static bool line_bulk_all_free(struct gpiod_line_bulk *bulk)
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
@@ -495,7 +546,7 @@ static int line_request_values(struct gpiod_line_bulk *bulk,
 			       const struct gpiod_line_request_config *config,
 			       const int *default_vals)
 {
-	struct gpiod_line *line, **lineptr;
+	struct gpiod_line *line;
 	struct line_fd_handle *line_fd;
 	struct gpiohandle_request req;
 	unsigned int i;
@@ -524,7 +575,6 @@ static int line_request_values(struct gpiod_line_bulk *bulk,
 	else if (config->request_type == GPIOD_LINE_REQUEST_DIRECTION_OUTPUT)
 		req.flags |= GPIOHANDLE_REQUEST_OUTPUT;
 
-
 	gpiod_line_bulk_foreach_line_off(bulk, line, i) {
 		req.lineoffsets[i] = gpiod_line_offset(line);
 		if (config->request_type ==
@@ -548,8 +598,12 @@ static int line_request_values(struct gpiod_line_bulk *bulk,
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
 		line_maybe_update(line);
 	}
@@ -590,6 +644,7 @@ static int line_request_event_single(struct gpiod_line *line,
 		return -1;
 
 	line->state = LINE_REQUESTED_EVENTS;
+	line->req_flags = config->flags;
 	line_set_fd(line, line_fd);
 	line_maybe_update(line);
 
@@ -688,6 +743,11 @@ bool gpiod_line_is_requested(struct gpiod_line *line)
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
@@ -768,9 +828,131 @@ int gpiod_line_set_value_bulk(struct gpiod_line_bulk *bulk, const int *values)
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
+	if (line->needs_update) {
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

