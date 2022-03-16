Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4C6A4DA7AF
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Mar 2022 03:05:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350647AbiCPCGi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Mar 2022 22:06:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234143AbiCPCGh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Mar 2022 22:06:37 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDBC25E743
        for <linux-gpio@vger.kernel.org>; Tue, 15 Mar 2022 19:05:23 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id v4so1008562pjh.2
        for <linux-gpio@vger.kernel.org>; Tue, 15 Mar 2022 19:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eZU8aX2kba0+2CModmHm41+QR7TtCrdNLf+bklOz2oM=;
        b=O68KPX//cNaDYtn26jt97/dTlyV+KUOkuaSZBkM7pMmLz/jLWnZmvrE4GKg+bHpDxS
         SequY1BPPNS+WhQyKjBKUyd6whZPZTCZFQbuzEheNVcOCf/2P3mOT4YjEl+aisGGt6Td
         L04NL5BPAVz8RiPHDrCD/Hst4XPBq+jqCifIvLQ4FykMimlLgUeu6PiGvmBIabLA1x9+
         //wQV18GGcw4BbkAuCfMrsvm3fEp6HtMsJoLkRokJG7UO8r83Caqs4i+u2S3wG98Fe8o
         k88QXv029SWwdEgSUqrMw2yUz/SroG+EEKUWz7+c8TonoFuWcNMjSUoZZOV+LRJzps+t
         v88g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eZU8aX2kba0+2CModmHm41+QR7TtCrdNLf+bklOz2oM=;
        b=jcFO7CqicywfTzZbcKg9+c7l5gnmBzVymARNz1c7Nrm9uH2L+o388kyVyqKq/mMq8f
         JfSuEnkI9MGUF5saCSV/Nn+3sSx/UKn2Ana0D2ffE1WUSzYmH/2CvPrQ4YpBJii6E6GT
         43sATNr1VBmXFAsVFcoCTPOint8cgg1vJ6szhOeWfFq1iWUZUUoXkE2io9wkqpmvII8M
         yifmEGjfI8Fy0ZinPMIsn+b0TfUFbqmDQj5t0F28DhGynJKZ+U+HHhYGnPbYrTvTg7Tf
         KfsdD0+wUdImhDTgmYNw6sKkUXkK9CZ460uVrKMj37b8iNBuGAmLQEa7XKe41mRGGC79
         KxGA==
X-Gm-Message-State: AOAM533zDDG8kEUdUQqBqVjLwIdif+mShGpEMoZZ8RB4Nw8hOnckSEDP
        RyA7KEr2lsQ0+3eZvnQ0pO0xnba6I38Z/w==
X-Google-Smtp-Source: ABdhPJwPU3KW9plyrUnzIpdJV+MvCREMOuIzAoz57LaN/StM0pGfzdUCjaqZ91hDHgw2rki+Nwj6sg==
X-Received: by 2002:a17:902:d2d1:b0:151:ef69:c27d with SMTP id n17-20020a170902d2d100b00151ef69c27dmr30788189plc.34.1647396322815;
        Tue, 15 Mar 2022 19:05:22 -0700 (PDT)
Received: from sol.home.arpa ([124.148.64.37])
        by smtp.gmail.com with ESMTPSA id u5-20020a056a00158500b004f745148736sm436885pfk.179.2022.03.15.19.05.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Mar 2022 19:05:22 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, brgl@bgdev.pl
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod v2][PATCH 3/3] core: rename uAPI related variables and functions to uapi.
Date:   Wed, 16 Mar 2022 10:04:41 +0800
Message-Id: <20220316020441.30001-4-warthog618@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220316020441.30001-1-warthog618@gmail.com>
References: <20220316020441.30001-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Rename variables using the "buf" suffix to a "uapi_" prefix to identify
them as being uAPI types.
Similarly, rename the corresponding uAPI conversion functions from
"kernel" to "uapi".

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 lib/chip-info.c      |  2 +-
 lib/chip.c           | 24 ++++++++++++------------
 lib/info-event.c     | 18 +++++++++---------
 lib/internal.h       | 20 ++++++++++----------
 lib/line-config.c    | 24 ++++++++++++------------
 lib/line-info.c      |  2 +-
 lib/line-request.c   | 38 +++++++++++++++++++-------------------
 lib/request-config.c | 12 ++++++------
 8 files changed, 70 insertions(+), 70 deletions(-)

diff --git a/lib/chip-info.c b/lib/chip-info.c
index 1ab9b5e..584c9d4 100644
--- a/lib/chip-info.c
+++ b/lib/chip-info.c
@@ -37,7 +37,7 @@ GPIOD_API size_t gpiod_chip_info_get_num_lines(struct gpiod_chip_info *info)
 }
 
 struct gpiod_chip_info *
-gpiod_chip_info_from_kernel(struct gpiochip_info *uapi_info)
+gpiod_chip_info_from_uapi(struct gpiochip_info *uapi_info)
 {
 	struct gpiod_chip_info *info;
 
diff --git a/lib/chip.c b/lib/chip.c
index b1435e2..edb2dfd 100644
--- a/lib/chip.c
+++ b/lib/chip.c
@@ -82,7 +82,7 @@ GPIOD_API struct gpiod_chip_info *gpiod_chip_get_info(struct gpiod_chip *chip)
 	if (ret < 0)
 		return NULL;
 
-	return gpiod_chip_info_from_kernel(&info);
+	return gpiod_chip_info_from_uapi(&info);
 }
 
 GPIOD_API const char *gpiod_chip_get_path(struct gpiod_chip *chip)
@@ -118,7 +118,7 @@ chip_get_line_info(struct gpiod_chip *chip, unsigned int offset, bool watch)
 	if (ret)
 		return NULL;
 
-	return gpiod_line_info_from_kernel(&info);
+	return gpiod_line_info_from_uapi(&info);
 }
 
 GPIOD_API struct gpiod_line_info *
@@ -202,34 +202,34 @@ gpiod_chip_request_lines(struct gpiod_chip *chip,
 			 struct gpiod_request_config *req_cfg,
 			 struct gpiod_line_config *line_cfg)
 {
-	struct gpio_v2_line_request reqbuf;
+	struct gpio_v2_line_request uapi_req;
 	struct gpiod_line_request *request;
 	int ret;
 
-	memset(&reqbuf, 0, sizeof(reqbuf));
+	memset(&uapi_req, 0, sizeof(uapi_req));
 
-	ret = gpiod_request_config_to_kernel(req_cfg, &reqbuf);
+	ret = gpiod_request_config_to_uapi(req_cfg, &uapi_req);
 	if (ret)
 		return NULL;
 
-	ret = gpiod_line_config_to_kernel(line_cfg, &reqbuf.config,
-					  reqbuf.num_lines, reqbuf.offsets);
+	ret = gpiod_line_config_to_uapi(line_cfg, &uapi_req.config,
+					uapi_req.num_lines, uapi_req.offsets);
 	if (ret)
 		return NULL;
 
-	ret = ioctl(chip->fd, GPIO_V2_GET_LINE_IOCTL, &reqbuf);
+	ret = ioctl(chip->fd, GPIO_V2_GET_LINE_IOCTL, &uapi_req);
 	if (ret < 0)
 		return NULL;
 
-	ret = set_fd_noblock(reqbuf.fd);
+	ret = set_fd_noblock(uapi_req.fd);
 	if (ret) {
-		close(reqbuf.fd);
+		close(uapi_req.fd);
 		return NULL;
 	}
 
-	request = gpiod_line_request_from_kernel(&reqbuf);
+	request = gpiod_line_request_from_uapi(&uapi_req);
 	if (!request) {
-		close(reqbuf.fd);
+		close(uapi_req.fd);
 		return NULL;
 	}
 
diff --git a/lib/info-event.c b/lib/info-event.c
index 1776d82..4abed57 100644
--- a/lib/info-event.c
+++ b/lib/info-event.c
@@ -15,7 +15,7 @@ struct gpiod_info_event {
 };
 
 struct gpiod_info_event *
-gpiod_info_event_from_kernel(struct gpio_v2_line_info_changed *evbuf)
+gpiod_info_event_from_uapi(struct gpio_v2_line_info_changed *uapi_evt)
 {
 	struct gpiod_info_event *event;
 
@@ -24,9 +24,9 @@ gpiod_info_event_from_kernel(struct gpio_v2_line_info_changed *evbuf)
 		return NULL;
 
 	memset(event, 0, sizeof(*event));
-	event->timestamp = evbuf->timestamp_ns;
+	event->timestamp = uapi_evt->timestamp_ns;
 
-	switch (evbuf->event_type) {
+	switch (uapi_evt->event_type) {
 	case GPIOLINE_CHANGED_REQUESTED:
 		event->event_type = GPIOD_INFO_EVENT_LINE_REQUESTED;
 		break;
@@ -43,7 +43,7 @@ gpiod_info_event_from_kernel(struct gpio_v2_line_info_changed *evbuf)
 		return NULL;
 	}
 
-	event->info = gpiod_line_info_from_kernel(&evbuf->info);
+	event->info = gpiod_line_info_from_uapi(&uapi_evt->info);
 	if (!event->info) {
 		free(event);
 		return NULL;
@@ -80,18 +80,18 @@ gpiod_info_event_get_line_info(struct gpiod_info_event *event)
 
 struct gpiod_info_event *gpiod_info_event_read_fd(int fd)
 {
-	struct gpio_v2_line_info_changed evbuf;
+	struct gpio_v2_line_info_changed uapi_evt;
 	ssize_t rd;
 
-	memset(&evbuf, 0, sizeof(evbuf));
+	memset(&uapi_evt, 0, sizeof(uapi_evt));
 
-	rd = read(fd, &evbuf, sizeof(evbuf));
+	rd = read(fd, &uapi_evt, sizeof(uapi_evt));
 	if (rd < 0) {
 		return NULL;
-	} else if ((unsigned int)rd < sizeof(evbuf)) {
+	} else if ((unsigned int)rd < sizeof(uapi_evt)) {
 		errno = EIO;
 		return NULL;
 	}
 
-	return gpiod_info_event_from_kernel(&evbuf);
+	return gpiod_info_event_from_uapi(&uapi_evt);
 }
diff --git a/lib/internal.h b/lib/internal.h
index ffef578..c87df91 100644
--- a/lib/internal.h
+++ b/lib/internal.h
@@ -19,21 +19,21 @@
 #define GPIOD_BIT(nr)	(1UL << (nr))
 
 struct gpiod_chip_info *
-gpiod_chip_info_from_kernel(struct gpiochip_info *infobuf);
+gpiod_chip_info_from_uapi(struct gpiochip_info *uapi_info);
 struct gpiod_line_info *
-gpiod_line_info_from_kernel(struct gpio_v2_line_info *infobuf);
-int gpiod_request_config_to_kernel(struct gpiod_request_config *config,
-				   struct gpio_v2_line_request *reqbuf);
-int gpiod_line_config_to_kernel(struct gpiod_line_config *config,
-				struct gpio_v2_line_config *cfgbuf,
-				unsigned int num_lines,
-				const unsigned int *offsets);
+gpiod_line_info_from_uapi(struct gpio_v2_line_info *uapi_info);
+int gpiod_request_config_to_uapi(struct gpiod_request_config *config,
+				 struct gpio_v2_line_request *uapi_req);
+int gpiod_line_config_to_uapi(struct gpiod_line_config *config,
+			      struct gpio_v2_line_config *uapi_cfg,
+			      unsigned int num_lines,
+			      const unsigned int *offsets);
 struct gpiod_line_request *
-gpiod_line_request_from_kernel(struct gpio_v2_line_request *reqbuf);
+gpiod_line_request_from_uapi(struct gpio_v2_line_request *uapi_req);
 int gpiod_edge_event_buffer_read_fd(int fd, struct gpiod_edge_event_buffer *buffer,
 				    size_t max_events);
 struct gpiod_info_event *
-gpiod_info_event_from_kernel(struct gpio_v2_line_info_changed *evbuf);
+gpiod_info_event_from_uapi(struct gpio_v2_line_info_changed *uapi_evt);
 struct gpiod_info_event *gpiod_info_event_read_fd(int fd);
 
 int gpiod_poll_fd(int fd, uint64_t timeout);
diff --git a/lib/line-config.c b/lib/line-config.c
index b7e154f..f9cd6ac 100644
--- a/lib/line-config.c
+++ b/lib/line-config.c
@@ -1062,7 +1062,7 @@ static void set_kernel_attr_mask(uint64_t *out, const uint64_t *in,
 }
 
 static int process_overrides(struct gpiod_line_config *config,
-			     struct gpio_v2_line_config *cfgbuf,
+			     struct gpio_v2_line_config *uapi_cfg,
 			     unsigned int *attr_idx,
 			     unsigned int num_lines,
 			     const unsigned int *offsets,
@@ -1113,7 +1113,7 @@ static int process_overrides(struct gpiod_line_config *config,
 			}
 		}
 
-		attr = &cfgbuf->attrs[(*attr_idx)++];
+		attr = &uapi_cfg->attrs[(*attr_idx)++];
 
 		set_kernel_attr_mask(&mask, &marked,
 				     num_lines, offsets, config);
@@ -1142,10 +1142,10 @@ static bool has_at_least_one_output_direction(struct gpiod_line_config *config)
 	return false;
 }
 
-int gpiod_line_config_to_kernel(struct gpiod_line_config *config,
-				struct gpio_v2_line_config *cfgbuf,
-				unsigned int num_lines,
-				const unsigned int *offsets)
+int gpiod_line_config_to_uapi(struct gpiod_line_config *config,
+			      struct gpio_v2_line_config *uapi_cfg,
+			      unsigned int num_lines,
+			      const unsigned int *offsets)
 {
 	struct gpio_v2_line_config_attribute *attr;
 	unsigned int attr_idx = 0;
@@ -1160,7 +1160,7 @@ int gpiod_line_config_to_kernel(struct gpiod_line_config *config,
 	 * If so, let's take one attribute for the default values.
 	 */
 	if (has_at_least_one_output_direction(config)) {
-		attr = &cfgbuf->attrs[attr_idx++];
+		attr = &uapi_cfg->attrs[attr_idx++];
 		attr->attr.id = GPIO_V2_LINE_ATTR_ID_OUTPUT_VALUES;
 
 		set_kernel_output_values(&mask, &values, config,
@@ -1173,7 +1173,7 @@ int gpiod_line_config_to_kernel(struct gpiod_line_config *config,
 
 	/* If we have a default debounce period - use another attribute. */
 	if (config->defaults.debounce_period_us) {
-		attr = &cfgbuf->attrs[attr_idx++];
+		attr = &uapi_cfg->attrs[attr_idx++];
 		attr->attr.id = GPIO_V2_LINE_ATTR_ID_DEBOUNCE;
 		attr->attr.debounce_period_us =
 				config->defaults.debounce_period_us;
@@ -1193,22 +1193,22 @@ int gpiod_line_config_to_kernel(struct gpiod_line_config *config,
 	 * further processing.
 	 */
 
-	ret = process_overrides(config, cfgbuf, &attr_idx, num_lines, offsets,
+	ret = process_overrides(config, uapi_cfg, &attr_idx, num_lines, offsets,
 				base_config_flags_are_equal,
 				override_config_flags_are_equal,
 				set_base_config_flags);
 	if (ret)
 		return -1;
 
-	ret = process_overrides(config, cfgbuf, &attr_idx, num_lines, offsets,
+	ret = process_overrides(config, uapi_cfg, &attr_idx, num_lines, offsets,
 				base_debounce_period_is_equal,
 				override_config_debounce_period_is_equal,
 				set_base_config_debounce_period);
 	if (ret)
 		return -1;
 
-	cfgbuf->flags = make_kernel_flags(&config->defaults);
-	cfgbuf->num_attrs = attr_idx;
+	uapi_cfg->flags = make_kernel_flags(&config->defaults);
+	uapi_cfg->num_attrs = attr_idx;
 
 	return 0;
 
diff --git a/lib/line-info.c b/lib/line-info.c
index 0724120..65eca48 100644
--- a/lib/line-info.c
+++ b/lib/line-info.c
@@ -106,7 +106,7 @@ gpiod_line_info_get_debounce_period_us(struct gpiod_line_info *info)
 }
 
 struct gpiod_line_info *
-gpiod_line_info_from_kernel(struct gpio_v2_line_info *uapi_info)
+gpiod_line_info_from_uapi(struct gpio_v2_line_info *uapi_info)
 {
 	struct gpio_v2_line_attribute *attr;
 	struct gpiod_line_info *info;
diff --git a/lib/line-request.c b/lib/line-request.c
index 31e82f8..33f7f67 100644
--- a/lib/line-request.c
+++ b/lib/line-request.c
@@ -17,7 +17,7 @@ struct gpiod_line_request {
 };
 
 struct gpiod_line_request *
-gpiod_line_request_from_kernel(struct gpio_v2_line_request *reqbuf)
+gpiod_line_request_from_uapi(struct gpio_v2_line_request *uapi_req)
 {
 	struct gpiod_line_request *request;
 
@@ -26,9 +26,9 @@ gpiod_line_request_from_kernel(struct gpio_v2_line_request *reqbuf)
 		return NULL;
 
 	memset(request, 0, sizeof(*request));
-	request->fd = reqbuf->fd;
-	request->num_lines = reqbuf->num_lines;
-	memcpy(request->offsets, reqbuf->offsets,
+	request->fd = uapi_req->fd;
+	request->num_lines = uapi_req->num_lines;
+	memcpy(request->offsets, uapi_req->offsets,
 	       sizeof(*request->offsets) * request->num_lines);
 
 	return request;
@@ -88,12 +88,12 @@ gpiod_line_request_get_values_subset(struct gpiod_line_request *request,
 				     size_t num_values,
 				     const unsigned int *offsets, int *values)
 {
-	struct gpio_v2_line_values buf;
+	struct gpio_v2_line_values uapi_values;
 	uint64_t mask = 0, bits = 0;
 	size_t i;
 	int bit, ret;
 
-	buf.bits = 0;
+	uapi_values.bits = 0;
 
 	for (i = 0; i < num_values; i++) {
 		bit = offset_to_bit(request, offsets[i]);
@@ -105,13 +105,13 @@ gpiod_line_request_get_values_subset(struct gpiod_line_request *request,
 		gpiod_line_mask_set_bit(&mask, bit);
 	}
 
-	buf.mask = mask;
+	uapi_values.mask = mask;
 
-	ret = ioctl(request->fd, GPIO_V2_LINE_GET_VALUES_IOCTL, &buf);
+	ret = ioctl(request->fd, GPIO_V2_LINE_GET_VALUES_IOCTL, &uapi_values);
 	if (ret)
 		return -1;
 
-	bits = buf.bits;
+	bits = uapi_values.bits;
 	memset(values, 0, sizeof(*values) * num_values);
 
 	for (i = 0; i < num_values; i++) {
@@ -142,7 +142,7 @@ gpiod_line_request_set_values_subset(struct gpiod_line_request *request,
 				     const unsigned int *offsets,
 				     const int *values)
 {
-	struct gpio_v2_line_values buf;
+	struct gpio_v2_line_values uapi_values;
 	uint64_t mask = 0, bits = 0;
 	size_t i;
 	int bit;
@@ -158,11 +158,11 @@ gpiod_line_request_set_values_subset(struct gpiod_line_request *request,
 		gpiod_line_mask_assign_bit(&bits, bit, values[i]);
 	}
 
-	memset(&buf, 0, sizeof(buf));
-	buf.mask = mask;
-	buf.bits = bits;
+	memset(&uapi_values, 0, sizeof(uapi_values));
+	uapi_values.mask = mask;
+	uapi_values.bits = bits;
 
-	return ioctl(request->fd, GPIO_V2_LINE_SET_VALUES_IOCTL, &buf);
+	return ioctl(request->fd, GPIO_V2_LINE_SET_VALUES_IOCTL, &uapi_values);
 }
 
 GPIOD_API int gpiod_line_request_set_values(struct gpiod_line_request *request,
@@ -176,17 +176,17 @@ GPIOD_API int
 gpiod_line_request_reconfigure_lines(struct gpiod_line_request *request,
 				     struct gpiod_line_config *config)
 {
-	struct gpio_v2_line_config cfgbuf;
+	struct gpio_v2_line_config uapi_cfg;
 	int ret;
 
-	memset(&cfgbuf, 0, sizeof(cfgbuf));
+	memset(&uapi_cfg, 0, sizeof(uapi_cfg));
 
-	ret = gpiod_line_config_to_kernel(config, &cfgbuf,
-					  request->num_lines, request->offsets);
+	ret = gpiod_line_config_to_uapi(config, &uapi_cfg,
+					request->num_lines, request->offsets);
 	if (ret)
 		return ret;
 
-	ret = ioctl(request->fd, GPIO_V2_LINE_SET_CONFIG_IOCTL, &cfgbuf);
+	ret = ioctl(request->fd, GPIO_V2_LINE_SET_CONFIG_IOCTL, &uapi_cfg);
 	if (ret)
 		return ret;
 
diff --git a/lib/request-config.c b/lib/request-config.c
index d22af80..3a84106 100644
--- a/lib/request-config.c
+++ b/lib/request-config.c
@@ -91,8 +91,8 @@ gpiod_request_config_get_event_buffer_size(struct gpiod_request_config *config)
 	return config->event_buffer_size;
 }
 
-int gpiod_request_config_to_kernel(struct gpiod_request_config *config,
-				   struct gpio_v2_line_request *reqbuf)
+int gpiod_request_config_to_uapi(struct gpiod_request_config *config,
+				 struct gpio_v2_line_request *uapi_req)
 {
 	size_t i;
 
@@ -102,11 +102,11 @@ int gpiod_request_config_to_kernel(struct gpiod_request_config *config,
 	}
 
 	for (i = 0; i < config->num_offsets; i++)
-		reqbuf->offsets[i] = config->offsets[i];
+		uapi_req->offsets[i] = config->offsets[i];
 
-	reqbuf->num_lines = config->num_offsets;
-	strcpy(reqbuf->consumer, config->consumer);
-	reqbuf->event_buffer_size = config->event_buffer_size;
+	uapi_req->num_lines = config->num_offsets;
+	strcpy(uapi_req->consumer, config->consumer);
+	uapi_req->event_buffer_size = config->event_buffer_size;
 
 	return 0;
 }
-- 
2.35.1

