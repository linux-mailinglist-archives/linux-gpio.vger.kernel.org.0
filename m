Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FA91280D7D
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Oct 2020 08:32:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725985AbgJBGcF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Oct 2020 02:32:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725968AbgJBGcF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Oct 2020 02:32:05 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6861EC0613D0
        for <linux-gpio@vger.kernel.org>; Thu,  1 Oct 2020 23:32:05 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id e18so189433pgd.4
        for <linux-gpio@vger.kernel.org>; Thu, 01 Oct 2020 23:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AQgD/wEbDxNRQmGv5dqxMaurGMc+fP/IWVTdVm7n0JQ=;
        b=MzAE6hiekhozrsNlZaHFhloZwkxHmwRfNlgLOrGeKW3+KRW9aTiitw18Xncic+Skd6
         iNI9v2TcW6zcMN1rCmvgKTjEiJdGAmIHtNe5HxXCrt0xAF551lrOw1mNeOk7BtI+X8gY
         maMpdTr1HYL2AqL83197MjO9xf2aOx9+gRj75ASyTruBPdRVwGDSnwoER8iFdUK8gUmY
         gVAo4CPsGuIueHu2gDhLPjYz8bLhVmEuaT+W4HJDVQCqa2IkWRK8PGAYpGqCxgdiIBWm
         3SDOO5Mts8ld+L3PMofwdp3kHCd1fqXFeMMgkcZM/lKGEzW+6MrLdeGM3VPjKISG62W4
         MkUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AQgD/wEbDxNRQmGv5dqxMaurGMc+fP/IWVTdVm7n0JQ=;
        b=o2ZNKUJ2Tlh8dMGCadFzJxfWpkuUUucI2Czi0syqkPlu+Z48vBnwfD2zxMQlcxFzaD
         psZZqRtdP+f/HP2PK7q5mSeX5mOShAv2nWsimLI5yDEg83XQrGo/THtvEwdBPXcy2+Ud
         Afl7gl9nnUbfiRv+A+xfnJykV4V82SMMhb/qIVDRhnnxDz7RCkDNKs6mTCn5tSdn6Ske
         Fu+9Fs17NzfWzr8HIoTJbOT9PwObOiudm3E0wz1MAfyqqEoTnghmvMe7SlPKtPeegzeb
         XUaopH2PLFAmNJpx9B24PVleUuYfzNqiXl4ljLp7EiYgKMufD3PgQr/qN7LU1xB6uPjI
         Z76Q==
X-Gm-Message-State: AOAM53029LDULZgdTXcmcmvA4nIYqXFIleyU28VKihC9ceqsBA7FhRRd
        3IL3Tyro6ul1fCe+VlPs9tWbBGP8nWN/Ow==
X-Google-Smtp-Source: ABdhPJwg/K8vKq6xor/m/H1t5M5bFmSFuvvTTD39uQCmgHtJ+s4PC3EYEte1Mw1KS2aPXYA1Zq4lMA==
X-Received: by 2002:aa7:989a:0:b029:142:2501:34da with SMTP id r26-20020aa7989a0000b0290142250134damr1035225pfl.51.1601620324215;
        Thu, 01 Oct 2020 23:32:04 -0700 (PDT)
Received: from sol.lan (106-69-171-132.dyn.iinet.net.au. [106.69.171.132])
        by smtp.gmail.com with ESMTPSA id f207sm657388pfa.54.2020.10.01.23.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2020 23:32:03 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH] core: Basic port to uAPI v2
Date:   Fri,  2 Oct 2020 14:31:48 +0800
Message-Id: <20201002063148.32667-1-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Port existing implementation from GPIO uAPI v1 to v2.
The libgpiod external interface remains unchanged, only the internal
implementation switches from uAPI v1 to v2.

This is a minimal port - uAPI v2 features are only used where it
simplifies the implementation, specifically multiple events on a bulk can
now be handled directly by the kernel in a single v2 line request rather
than being emulated by multiple v1 event requests.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 include/gpiod.h |   2 +
 lib/core.c      | 421 ++++++++++++++++++++++++------------------------
 2 files changed, 211 insertions(+), 212 deletions(-)

diff --git a/include/gpiod.h b/include/gpiod.h
index 3477f9d..a6e34ae 100644
--- a/include/gpiod.h
+++ b/include/gpiod.h
@@ -1485,6 +1485,8 @@ struct gpiod_line_event {
 	/**< Best estimate of time of event occurrence. */
 	int event_type;
 	/**< Type of the event that occurred. */
+	int offset;
+	/**< Offset of line on which the event occurred. */
 };
 
 /**
diff --git a/lib/core.c b/lib/core.c
index b964272..64b5940 100644
--- a/lib/core.c
+++ b/lib/core.c
@@ -403,26 +403,49 @@ bool gpiod_line_needs_update(struct gpiod_line *line GPIOD_UNUSED)
 	return false;
 }
 
+static int line_info_v2_to_info_flags(struct gpio_v2_line_info *info)
+{
+	int iflags = 0;
+
+	if (info->flags & GPIO_V2_LINE_FLAG_USED)
+		iflags |= GPIOLINE_FLAG_KERNEL;
+
+	if (info->flags & GPIO_V2_LINE_FLAG_OPEN_DRAIN)
+		iflags |= GPIOLINE_FLAG_OPEN_DRAIN;
+	if (info->flags & GPIO_V2_LINE_FLAG_OPEN_SOURCE)
+		iflags |= GPIOLINE_FLAG_OPEN_SOURCE;
+
+	if (info->flags & GPIO_V2_LINE_FLAG_BIAS_DISABLED)
+		iflags |= GPIOLINE_FLAG_BIAS_DISABLE;
+	if (info->flags & GPIO_V2_LINE_FLAG_BIAS_PULL_UP)
+		iflags |= GPIOLINE_FLAG_BIAS_PULL_UP;
+	if (info->flags & GPIO_V2_LINE_FLAG_BIAS_PULL_DOWN)
+		iflags |= GPIOLINE_FLAG_BIAS_PULL_DOWN;
+
+	return iflags;
+}
+
 int gpiod_line_update(struct gpiod_line *line)
 {
-	struct gpioline_info info;
+	struct gpio_v2_line_info info;
 	int rv;
 
 	memset(&info, 0, sizeof(info));
-	info.line_offset = line->offset;
+	info.offset = line->offset;
 
-	rv = ioctl(line->chip->fd, GPIO_GET_LINEINFO_IOCTL, &info);
+	rv = ioctl(line->chip->fd, GPIO_V2_GET_LINEINFO_IOCTL, &info);
 	if (rv < 0)
 		return -1;
 
-	line->direction = info.flags & GPIOLINE_FLAG_IS_OUT
+	line->direction = info.flags & GPIO_V2_LINE_FLAG_OUTPUT
 						? GPIOD_LINE_DIRECTION_OUTPUT
 						: GPIOD_LINE_DIRECTION_INPUT;
-	line->active_state = info.flags & GPIOLINE_FLAG_ACTIVE_LOW
+
+	line->active_state = info.flags & GPIO_V2_LINE_FLAG_ACTIVE_LOW
 						? GPIOD_LINE_ACTIVE_STATE_LOW
 						: GPIOD_LINE_ACTIVE_STATE_HIGH;
 
-	line->info_flags = info.flags;
+	line->info_flags = line_info_v2_to_info_flags(&info);
 
 	strncpy(line->name, info.name, sizeof(line->name));
 	strncpy(line->consumer, info.consumer, sizeof(line->consumer));
@@ -508,86 +531,154 @@ static bool line_request_direction_is_valid(int direction)
 	return false;
 }
 
-static __u32 line_request_direction_to_gpio_handleflag(int direction)
+static void line_request_type_to_gpio_v2_line_config(int reqtype,
+		struct gpio_v2_line_config *config)
 {
-	if (direction == GPIOD_LINE_REQUEST_DIRECTION_INPUT)
-		return GPIOHANDLE_REQUEST_INPUT;
-	if (direction == GPIOD_LINE_REQUEST_DIRECTION_OUTPUT)
-		return GPIOHANDLE_REQUEST_OUTPUT;
+	if (reqtype == GPIOD_LINE_REQUEST_DIRECTION_AS_IS)
+		return;
 
-	return 0;
+	if (reqtype == GPIOD_LINE_REQUEST_DIRECTION_OUTPUT) {
+		config->flags |= GPIO_V2_LINE_FLAG_OUTPUT;
+		return;
+	}
+	config->flags |= GPIO_V2_LINE_FLAG_INPUT;
+
+	if (reqtype == GPIOD_LINE_REQUEST_EVENT_RISING_EDGE)
+		config->flags |= GPIO_V2_LINE_FLAG_EDGE_RISING;
+	else if (reqtype == GPIOD_LINE_REQUEST_EVENT_FALLING_EDGE)
+		config->flags |= GPIO_V2_LINE_FLAG_EDGE_FALLING;
+	else if (reqtype == GPIOD_LINE_REQUEST_EVENT_BOTH_EDGES)
+		config->flags |= (GPIO_V2_LINE_FLAG_EDGE_RISING |
+				  GPIO_V2_LINE_FLAG_EDGE_FALLING);
 }
 
-static __u32 line_request_flag_to_gpio_handleflag(int flags)
+static void line_request_flag_to_gpio_v2_line_config(int flags,
+		struct gpio_v2_line_config *config)
 {
-	int hflags = 0;
+	if (flags & GPIOD_LINE_REQUEST_FLAG_ACTIVE_LOW)
+		config->flags |= GPIO_V2_LINE_FLAG_ACTIVE_LOW;
 
 	if (flags & GPIOD_LINE_REQUEST_FLAG_OPEN_DRAIN)
-		hflags |= GPIOHANDLE_REQUEST_OPEN_DRAIN;
-	if (flags & GPIOD_LINE_REQUEST_FLAG_OPEN_SOURCE)
-		hflags |= GPIOHANDLE_REQUEST_OPEN_SOURCE;
-	if (flags & GPIOD_LINE_REQUEST_FLAG_ACTIVE_LOW)
-		hflags |= GPIOHANDLE_REQUEST_ACTIVE_LOW;
+		config->flags |= GPIO_V2_LINE_FLAG_OPEN_DRAIN;
+	else if (flags & GPIOD_LINE_REQUEST_FLAG_OPEN_SOURCE)
+		config->flags |= GPIO_V2_LINE_FLAG_OPEN_SOURCE;
+
 	if (flags & GPIOD_LINE_REQUEST_FLAG_BIAS_DISABLE)
-		hflags |= GPIOHANDLE_REQUEST_BIAS_DISABLE;
-	if (flags & GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_DOWN)
-		hflags |= GPIOHANDLE_REQUEST_BIAS_PULL_DOWN;
-	if (flags & GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_UP)
-		hflags |= GPIOHANDLE_REQUEST_BIAS_PULL_UP;
+		config->flags |= GPIO_V2_LINE_FLAG_BIAS_DISABLED;
+	else if (flags & GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_DOWN)
+		config->flags |= GPIO_V2_LINE_FLAG_BIAS_PULL_DOWN;
+	else if (flags & GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_UP)
+		config->flags |= GPIO_V2_LINE_FLAG_BIAS_PULL_UP;
+}
 
-	return hflags;
+static void line_request_config_to_gpio_v2_line_config(
+		const struct gpiod_line_request_config *reqcfg,
+		struct gpio_v2_line_config *lc)
+{
+	line_request_type_to_gpio_v2_line_config(reqcfg->request_type, lc);
+	line_request_flag_to_gpio_v2_line_config(reqcfg->flags, lc);
 }
 
-static int line_request_values(struct gpiod_line_bulk *bulk,
-			       const struct gpiod_line_request_config *config,
-			       const int *default_vals)
+static bool line_request_config_validate(
+		const struct gpiod_line_request_config *config)
 {
-	struct gpiod_line *line;
-	struct line_fd_handle *line_fd;
-	struct gpiohandle_request req;
-	unsigned int i;
-	int rv, fd;
+	int bias_flags = 0;
 
 	if ((config->request_type != GPIOD_LINE_REQUEST_DIRECTION_OUTPUT) &&
 	    (config->flags & (GPIOD_LINE_REQUEST_FLAG_OPEN_DRAIN |
-			      GPIOD_LINE_REQUEST_FLAG_OPEN_SOURCE))) {
-		errno = EINVAL;
-		return -1;
-	}
+			      GPIOD_LINE_REQUEST_FLAG_OPEN_SOURCE)))
+		return false;
+
 
 	if ((config->flags & GPIOD_LINE_REQUEST_FLAG_OPEN_DRAIN) &&
 	    (config->flags & GPIOD_LINE_REQUEST_FLAG_OPEN_SOURCE)) {
+		return false;
+	}
+
+	if (config->flags & GPIOD_LINE_REQUEST_FLAG_BIAS_DISABLE)
+		bias_flags++;
+	if (config->flags & GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_UP)
+		bias_flags++;
+	if (config->flags & GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_DOWN)
+		bias_flags++;
+	if (bias_flags > 1)
+		return false;
+
+	return true;
+}
+
+static void lines_bitmap_set_bit(__u64 *bits, int nr)
+{
+	*bits |= _BITULL(nr);
+}
+
+static void lines_bitmap_clear_bit(__u64 *bits, int nr)
+{
+	*bits &= ~_BITULL(nr);
+}
+
+static int lines_bitmap_test_bit(__u64 bits, int nr)
+{
+	return !!(bits & _BITULL(nr));
+}
+
+static void lines_bitmap_assign_bit(__u64 *bits, int nr, bool value)
+{
+	if (value)
+		lines_bitmap_set_bit(bits, nr);
+	else
+		lines_bitmap_clear_bit(bits, nr);
+}
+
+static int line_request(struct gpiod_line_bulk *bulk,
+			const struct gpiod_line_request_config *config,
+			const int *vals)
+{
+	struct gpiod_line *line;
+	struct line_fd_handle *line_fd;
+	struct gpio_v2_line_request req;
+	unsigned int i;
+	int rv, fd, state;
+
+	if (!line_request_config_validate(config)) {
 		errno = EINVAL;
 		return -1;
 	}
 
 	memset(&req, 0, sizeof(req));
 
-	req.lines = gpiod_line_bulk_num_lines(bulk);
-	req.flags = line_request_flag_to_gpio_handleflag(config->flags);
-
-	if (config->request_type == GPIOD_LINE_REQUEST_DIRECTION_INPUT)
-		req.flags |= GPIOHANDLE_REQUEST_INPUT;
-	else if (config->request_type == GPIOD_LINE_REQUEST_DIRECTION_OUTPUT)
-		req.flags |= GPIOHANDLE_REQUEST_OUTPUT;
-
+	req.num_lines = gpiod_line_bulk_num_lines(bulk);
+	line_request_config_to_gpio_v2_line_config(config, &req.config);
+	if (req.config.flags & (GPIO_V2_LINE_FLAG_EDGE_RISING |
+				GPIO_V2_LINE_FLAG_EDGE_FALLING))
+		state = LINE_REQUESTED_EVENTS;
+	else
+		state = LINE_REQUESTED_VALUES;
 
-	gpiod_line_bulk_foreach_line_off(bulk, line, i) {
-		req.lineoffsets[i] = gpiod_line_offset(line);
-		if (config->request_type ==
-				GPIOD_LINE_REQUEST_DIRECTION_OUTPUT &&
-		    default_vals)
-			req.default_values[i] = !!default_vals[i];
+	gpiod_line_bulk_foreach_line_off(bulk, line, i)
+		req.offsets[i] = gpiod_line_offset(line);
+
+	if (config->request_type == GPIOD_LINE_REQUEST_DIRECTION_OUTPUT &&
+	    vals) {
+		req.config.num_attrs = 1;
+		req.config.attrs[0].attr.id = GPIO_V2_LINE_ATTR_ID_OUTPUT_VALUES;
+		gpiod_line_bulk_foreach_line_off(bulk, line, i) {
+			lines_bitmap_assign_bit(
+				&req.config.attrs[0].mask, i, 1);
+			lines_bitmap_assign_bit(
+				&req.config.attrs[0].attr.values,
+				i, vals[i]);
+		}
 	}
 
 	if (config->consumer)
-		strncpy(req.consumer_label, config->consumer,
-			sizeof(req.consumer_label) - 1);
+		strncpy(req.consumer, config->consumer,
+			sizeof(req.consumer) - 1);
 
 	line = gpiod_line_bulk_get_line(bulk, 0);
 	fd = line->chip->fd;
 
-	rv = ioctl(fd, GPIO_GET_LINEHANDLE_IOCTL, &req);
+	rv = ioctl(fd, GPIO_V2_GET_LINE_IOCTL, &req);
 	if (rv < 0)
 		return -1;
 
@@ -596,11 +687,11 @@ static int line_request_values(struct gpiod_line_bulk *bulk,
 		return -1;
 
 	gpiod_line_bulk_foreach_line_off(bulk, line, i) {
-		line->state = LINE_REQUESTED_VALUES;
+		line->state = state;
 		line->req_flags = config->flags;
-		if (config->request_type ==
-				GPIOD_LINE_REQUEST_DIRECTION_OUTPUT)
-			line->output_value = req.default_values[i];
+		if (config->request_type == GPIOD_LINE_REQUEST_DIRECTION_OUTPUT)
+			line->output_value = lines_bitmap_test_bit(
+				req.config.attrs[0].attr.values, i);
 		line_set_fd(line, line_fd);
 
 		rv = gpiod_line_update(line);
@@ -613,72 +704,6 @@ static int line_request_values(struct gpiod_line_bulk *bulk,
 	return 0;
 }
 
-static int line_request_event_single(struct gpiod_line *line,
-			const struct gpiod_line_request_config *config)
-{
-	struct line_fd_handle *line_fd;
-	struct gpioevent_request req;
-	int rv;
-
-	memset(&req, 0, sizeof(req));
-
-	if (config->consumer)
-		strncpy(req.consumer_label, config->consumer,
-			sizeof(req.consumer_label) - 1);
-
-	req.lineoffset = gpiod_line_offset(line);
-	req.handleflags = line_request_flag_to_gpio_handleflag(config->flags);
-	req.handleflags |= GPIOHANDLE_REQUEST_INPUT;
-
-	if (config->request_type == GPIOD_LINE_REQUEST_EVENT_RISING_EDGE)
-		req.eventflags |= GPIOEVENT_REQUEST_RISING_EDGE;
-	else if (config->request_type == GPIOD_LINE_REQUEST_EVENT_FALLING_EDGE)
-		req.eventflags |= GPIOEVENT_REQUEST_FALLING_EDGE;
-	else if (config->request_type == GPIOD_LINE_REQUEST_EVENT_BOTH_EDGES)
-		req.eventflags |= GPIOEVENT_REQUEST_BOTH_EDGES;
-
-	rv = ioctl(line->chip->fd, GPIO_GET_LINEEVENT_IOCTL, &req);
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
-	rv = gpiod_line_update(line);
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
-	gpiod_line_bulk_foreach_line_off(bulk, line, off) {
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
 
 int gpiod_line_request(struct gpiod_line *line,
 		       const struct gpiod_line_request_config *config,
@@ -692,34 +717,14 @@ int gpiod_line_request(struct gpiod_line *line,
 	return gpiod_line_request_bulk(&bulk, config, &default_val);
 }
 
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
 int gpiod_line_request_bulk(struct gpiod_line_bulk *bulk,
 			    const struct gpiod_line_request_config *config,
-			    const int *default_vals)
+			    const int *vals)
 {
 	if (!line_bulk_same_chip(bulk) || !line_bulk_all_free(bulk))
 		return -1;
 
-	if (line_request_is_direction(config->request_type))
-		return line_request_values(bulk, config, default_vals);
-	else if (line_request_is_events(config->request_type))
-		return line_request_events(bulk, config);
-
-	errno = EINVAL;
-	return -1;
+	return line_request(bulk, config, vals);
 }
 
 void gpiod_line_release(struct gpiod_line *line)
@@ -772,7 +777,7 @@ int gpiod_line_get_value(struct gpiod_line *line)
 
 int gpiod_line_get_value_bulk(struct gpiod_line_bulk *bulk, int *values)
 {
-	struct gpiohandle_data data;
+	struct gpio_v2_line_values lv;
 	struct gpiod_line *line;
 	unsigned int i;
 	int rv, fd;
@@ -782,32 +787,20 @@ int gpiod_line_get_value_bulk(struct gpiod_line_bulk *bulk, int *values)
 
 	line = gpiod_line_bulk_get_line(bulk, 0);
 
-	if (line->state == LINE_REQUESTED_VALUES) {
-		memset(&data, 0, sizeof(data));
+	memset(&lv, 0, sizeof(lv));
 
-		fd = line_get_fd(line);
+	for (i = 0; i < gpiod_line_bulk_num_lines(bulk); i++)
+		lines_bitmap_set_bit(&lv.mask, i);
 
-		rv = ioctl(fd, GPIOHANDLE_GET_LINE_VALUES_IOCTL, &data);
-		if (rv < 0)
-			return -1;
+	fd = line_get_fd(line);
 
-		for (i = 0; i < gpiod_line_bulk_num_lines(bulk); i++)
-			values[i] = data.values[i];
+	rv = ioctl(fd, GPIO_V2_LINE_GET_VALUES_IOCTL, &lv);
+	if (rv < 0)
+		return -1;
 
-	} else if (line->state == LINE_REQUESTED_EVENTS) {
-		for (i = 0; i < gpiod_line_bulk_num_lines(bulk); i++) {
-			line = gpiod_line_bulk_get_line(bulk, i);
+	for (i = 0; i < gpiod_line_bulk_num_lines(bulk); i++)
+		values[i] = lines_bitmap_test_bit(lv.bits, i);
 
-			fd = line_get_fd(line);
-			rv = ioctl(fd, GPIOHANDLE_GET_LINE_VALUES_IOCTL, &data);
-			if (rv < 0)
-				return -1;
-			values[i] = data.values[0];
-		}
-	} else {
-		errno = EINVAL;
-		return -1;
-	}
 	return 0;
 }
 
@@ -823,7 +816,7 @@ int gpiod_line_set_value(struct gpiod_line *line, int value)
 
 int gpiod_line_set_value_bulk(struct gpiod_line_bulk *bulk, const int *values)
 {
-	struct gpiohandle_data data;
+	struct gpio_v2_line_values lv;
 	struct gpiod_line *line;
 	unsigned int i;
 	int rv, fd;
@@ -831,22 +824,22 @@ int gpiod_line_set_value_bulk(struct gpiod_line_bulk *bulk, const int *values)
 	if (!line_bulk_same_chip(bulk) || !line_bulk_all_requested(bulk))
 		return -1;
 
-	memset(&data, 0, sizeof(data));
+	memset(&lv, 0, sizeof(lv));
 
-	if (values) {
-		for (i = 0; i < gpiod_line_bulk_num_lines(bulk); i++)
-			data.values[i] = (uint8_t)!!values[i];
+	for (i = 0; i < gpiod_line_bulk_num_lines(bulk); i++) {
+		lines_bitmap_set_bit(&lv.mask, i);
+		lines_bitmap_assign_bit(&lv.bits, i, values && values[i]);
 	}
 
 	line = gpiod_line_bulk_get_line(bulk, 0);
 	fd = line_get_fd(line);
 
-	rv = ioctl(fd, GPIOHANDLE_SET_LINE_VALUES_IOCTL, &data);
+	rv = ioctl(fd, GPIO_V2_LINE_SET_VALUES_IOCTL, &lv);
 	if (rv < 0)
 		return -1;
 
 	gpiod_line_bulk_foreach_line_off(bulk, line, i)
-		line->output_value = data.values[i];
+		line->output_value = lines_bitmap_test_bit(lv.bits, i);
 
 	return 0;
 }
@@ -866,7 +859,7 @@ int gpiod_line_set_config_bulk(struct gpiod_line_bulk *bulk,
 			       int direction, int flags,
 			       const int *values)
 {
-	struct gpiohandle_config hcfg;
+	struct gpio_v2_line_config hcfg;
 	struct gpiod_line *line;
 	unsigned int i;
 	int rv, fd;
@@ -880,24 +873,30 @@ int gpiod_line_set_config_bulk(struct gpiod_line_bulk *bulk,
 
 	memset(&hcfg, 0, sizeof(hcfg));
 
-	hcfg.flags = line_request_flag_to_gpio_handleflag(flags);
-	hcfg.flags |= line_request_direction_to_gpio_handleflag(direction);
+	line_request_flag_to_gpio_v2_line_config(flags, &hcfg);
+	line_request_type_to_gpio_v2_line_config(direction, &hcfg);
 	if (direction == GPIOD_LINE_REQUEST_DIRECTION_OUTPUT && values) {
-		for (i = 0; i < gpiod_line_bulk_num_lines(bulk); i++)
-			hcfg.default_values[i] = (uint8_t)!!values[i];
+		hcfg.num_attrs = 1;
+		hcfg.attrs[0].attr.id = GPIO_V2_LINE_ATTR_ID_OUTPUT_VALUES;
+		for (i = 0; i < gpiod_line_bulk_num_lines(bulk); i++) {
+			lines_bitmap_assign_bit(&hcfg.attrs[0].mask, i, 1);
+			lines_bitmap_assign_bit(
+				&hcfg.attrs[0].attr.values, i, values[i]);
+		}
 	}
 
 	line = gpiod_line_bulk_get_line(bulk, 0);
 	fd = line_get_fd(line);
 
-	rv = ioctl(fd, GPIOHANDLE_SET_CONFIG_IOCTL, &hcfg);
+	rv = ioctl(fd, GPIO_V2_LINE_SET_CONFIG_IOCTL, &hcfg);
 	if (rv < 0)
 		return -1;
 
 	gpiod_line_bulk_foreach_line_off(bulk, line, i) {
 		line->req_flags = flags;
 		if (direction == GPIOD_LINE_REQUEST_DIRECTION_OUTPUT)
-			line->output_value = hcfg.default_values[i];
+			line->output_value = lines_bitmap_test_bit(
+				hcfg.attrs[0].attr.values, i);
 
 		rv = gpiod_line_update(line);
 		if (rv < 0)
@@ -985,45 +984,37 @@ int gpiod_line_event_wait_bulk(struct gpiod_line_bulk *bulk,
 			       const struct timespec *timeout,
 			       struct gpiod_line_bulk *event_bulk)
 {
-	struct pollfd fds[GPIOD_LINE_BULK_MAX_LINES];
-	unsigned int off, num_lines;
+	struct pollfd pfd;
 	struct gpiod_line *line;
+	struct gpiod_line_event event;
 	int rv;
 
 	if (!line_bulk_same_chip(bulk) || !line_bulk_all_requested(bulk))
 		return -1;
 
-	memset(fds, 0, sizeof(fds));
-	num_lines = gpiod_line_bulk_num_lines(bulk);
-
-	gpiod_line_bulk_foreach_line_off(bulk, line, off) {
-		fds[off].fd = line_get_fd(line);
-		fds[off].events = POLLIN | POLLPRI;
-	}
+	line = gpiod_line_bulk_get_line(bulk, 0);
+	pfd.fd = line_get_fd(line);
+	pfd.events = POLLIN | POLLPRI;
 
-	rv = ppoll(fds, num_lines, timeout, NULL);
+	rv = ppoll(&pfd, 1, timeout, NULL);
 	if (rv < 0)
 		return -1;
 	else if (rv == 0)
 		return 0;
 
-	if (event_bulk)
-		gpiod_line_bulk_init(event_bulk);
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
-				gpiod_line_bulk_add(event_bulk, line);
-			}
+	if (pfd.revents) {
+		if (pfd.revents & POLLNVAL) {
+			errno = EINVAL;
+			return -1;
+		}
 
-			if (!--rv)
-				break;
+		if (event_bulk) {
+			gpiod_line_bulk_init(event_bulk);
+			rv = gpiod_line_event_read(line, &event);
+			if (rv)
+				return rv;
+			line = gpiod_line_bulk_get_line(bulk, event.offset);
+			gpiod_line_bulk_add(event_bulk, line);
 		}
 	}
 
@@ -1082,8 +1073,13 @@ int gpiod_line_event_read_fd_multiple(int fd, struct gpiod_line_event *events,
 	/*
 	 * 16 is the maximum number of events the kernel can store in the FIFO
 	 * so we can allocate the buffer on the stack.
+	 *
+	 * NOTE: This is no longer strictly true for uAPI v2.  While 16 is
+	 * the default for single line, a request with multiple lines will
+	 * have a larger buffer.  So need to rethink the allocation here,
+	 * or at least the comment above...
 	 */
-	struct gpioevent_data evdata[16], *curr;
+	struct gpio_v2_line_event evdata[16], *curr;
 	struct gpiod_line_event *event;
 	unsigned int events_read, i;
 	ssize_t rd;
@@ -1109,11 +1105,12 @@ int gpiod_line_event_read_fd_multiple(int fd, struct gpiod_line_event *events,
 		curr = &evdata[i];
 		event = &events[i];
 
-		event->event_type = curr->id == GPIOEVENT_EVENT_RISING_EDGE
+		event->offset = curr->offset;
+		event->event_type = curr->id == GPIO_V2_LINE_EVENT_RISING_EDGE
 					? GPIOD_LINE_EVENT_RISING_EDGE
 					: GPIOD_LINE_EVENT_FALLING_EDGE;
-		event->ts.tv_sec = curr->timestamp / 1000000000ULL;
-		event->ts.tv_nsec = curr->timestamp % 1000000000ULL;
+		event->ts.tv_sec = curr->timestamp_ns / 1000000000ULL;
+		event->ts.tv_nsec = curr->timestamp_ns % 1000000000ULL;
 	}
 
 	return i;
-- 
2.28.0

