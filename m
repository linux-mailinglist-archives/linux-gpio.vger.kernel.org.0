Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DAE1465FFCC
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Jan 2023 12:51:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229564AbjAFLvh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Jan 2023 06:51:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbjAFLvg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Jan 2023 06:51:36 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23C5A43E53
        for <linux-gpio@vger.kernel.org>; Fri,  6 Jan 2023 03:51:33 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id fm16-20020a05600c0c1000b003d96fb976efso3353596wmb.3
        for <linux-gpio@vger.kernel.org>; Fri, 06 Jan 2023 03:51:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l1gxwFzwX+ZOVa/WfB10si7tzd81pxnUq0Rb4yGBMpc=;
        b=yuZ6WFS6gI4RwXt+xb6URWGnjHRU1BI0ybTbW1vyHNK4JTTJkxrRwAshK+uLmVQkYf
         19OAOSbpHakHxcPu2BNGr7t/fCYwpeIJufRGmdbguK7syho+gPBgA3dDeyZOo5BLCWWo
         IesMgPDyZTg7IwOp6/W36dLhbFpce3V/cX3TOCV5VyZBnI2SOphyCcgW8dgO2MXBCQtI
         F4EgD3O92kC+jEIPSEmY5mg/DrAwIUxanuUxr6msUiND86GXI/CDHpRVgHPdwteO5yc5
         LORfS7Rkd4NrkWi8hGw1tmMw5BicWKi4NNLEoW/Nvq2R5UvSlnb5BxlejK+v7mXfXPNk
         rZ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l1gxwFzwX+ZOVa/WfB10si7tzd81pxnUq0Rb4yGBMpc=;
        b=kN3lRBXzdMD05CsacfXf8Y3DMsa02nECR+2ikYUBpFkLKcKnRvmtP0yxvH99RnZGb8
         YEcWzHSE1o/LUCQdM/2T86ac+2gAeHfZeznUUwtSINpqPU7uCArGJigy4awaiuYsLo92
         hJVAnj0PhHYVrOQgNkZGkkFKpmPtLVTej1eQPYnhwKdLuls43VYZG1LKmZ8gguxQ7axz
         lPukBCkJvTa+9zsCmhy9W2/of7iknEDD8pLpw6fTwvE2Cro3xtqNRzPJkvAWrvv+2xEB
         +YTjMHsEh0pzJ0UN6zE31NVh2KhfSgmWvEEmiJb1VsdyQ8tG9SGHdIEwW7OuEDu92uG6
         9cQw==
X-Gm-Message-State: AFqh2kpgLFaiIQDWc9C3M6Rjwo+ZKOSI6tHxU9ncjekQUxVX6v33Djli
        NL4RIf3ykXJ9fMoR5XfoVOaj5g==
X-Google-Smtp-Source: AMrXdXuAyPCe3W+uVU1aFC/7xl/oL7gHeoBU6MdHzBcUOe0qVPwLn0ULn/7uuEinZuRIOsRSmSp78A==
X-Received: by 2002:a1c:6a16:0:b0:3c6:f732:bf6f with SMTP id f22-20020a1c6a16000000b003c6f732bf6fmr38526413wmc.13.1673005891542;
        Fri, 06 Jan 2023 03:51:31 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:86fd:399:3851:d474])
        by smtp.gmail.com with ESMTPSA id g12-20020a05600c310c00b003c70191f267sm6399716wmo.39.2023.01.06.03.51.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jan 2023 03:51:31 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][PATCH] core: make the library NULL-aware
Date:   Fri,  6 Jan 2023 12:51:29 +0100
Message-Id: <20230106115129.393007-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Currently we almost never check the validity of pointers passed to the
core C API routines. While we cannot know if a non-NULL pointer points
to an actual object, we can at least verify that it is not NULL before
dereferencing it.

Conceptually we can think of two categories of pointers in libgpiod:

First, there are the objects we manipulate using the API. These are
normally the first arguments in any given method and they are only
instantiated inside the library and never dereferenced by the user.

They should always be valid, so passing a NULL pointer here should
always lead to a crash. Currently it will take the form of a segfault
at the moment of dereference but with this change, we make the user
program abort() with the stack trace pointing right at the offender.

The second category would be pointers to objects that are logically
parameters of methods i.e. not their first argument. Example is:
gpiod_chip_request_lines(chip, req_cfg, line_cfg) (whose logical OOP
version would be: chip->request_lines(req_cfg, line_cfg)). Here we
accept a NULL req_cfg but we'll segfault on a NULL line_cfg. For
consistency: don't crash here but instead return -1 and set errno
to EINVAL. Same everywhere else.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 lib/chip-info.c           |  7 +++++++
 lib/chip.c                | 34 +++++++++++++++++++++++++++++++
 lib/edge-event.c          | 24 ++++++++++++++++++++++
 lib/info-event.c          |  7 +++++++
 lib/internal.c            |  5 +++++
 lib/line-config.c         | 22 ++++++++++++++++++++
 lib/line-info.c           | 27 ++++++++++++++++++++++++
 lib/line-request.c        | 43 +++++++++++++++++++++++++++++++++++++++
 lib/line-settings.c       | 37 +++++++++++++++++++++++++++++++++
 lib/request-config.c      | 17 ++++++++++++++--
 tests/tests-chip.c        | 22 ++++++++++++++++++++
 tests/tests-edge-event.c  | 28 +++++++++++++++++++++++++
 tests/tests-line-config.c | 33 ++++++++++++++++++++++++++++++
 tests/tests-misc.c        |  6 ++++++
 14 files changed, 310 insertions(+), 2 deletions(-)

diff --git a/lib/chip-info.c b/lib/chip-info.c
index ab1512b..87fd9e7 100644
--- a/lib/chip-info.c
+++ b/lib/chip-info.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: LGPL-2.1-or-later
 // SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
+#include <assert.h>
 #include <gpiod.h>
 #include <stdlib.h>
 #include <string.h>
@@ -20,16 +21,22 @@ GPIOD_API void gpiod_chip_info_free(struct gpiod_chip_info *info)
 
 GPIOD_API const char *gpiod_chip_info_get_name(struct gpiod_chip_info *info)
 {
+	assert(info);
+
 	return info->name;
 }
 
 GPIOD_API const char *gpiod_chip_info_get_label(struct gpiod_chip_info *info)
 {
+	assert(info);
+
 	return info->label;
 }
 
 GPIOD_API size_t gpiod_chip_info_get_num_lines(struct gpiod_chip_info *info)
 {
+	assert(info);
+
 	return info->num_lines;
 }
 
diff --git a/lib/chip.c b/lib/chip.c
index 6f12214..507c79d 100644
--- a/lib/chip.c
+++ b/lib/chip.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: LGPL-2.1-or-later
 // SPDX-FileCopyrightText: 2021 Bartosz Golaszewski <brgl@bgdev.pl>
 
+#include <assert.h>
 #include <errno.h>
 #include <fcntl.h>
 #include <gpiod.h>
@@ -21,6 +22,11 @@ GPIOD_API struct gpiod_chip *gpiod_chip_open(const char *path)
 	struct gpiod_chip *chip;
 	int fd;
 
+	if (!path) {
+		errno = EINVAL;
+		return NULL;
+	}
+
 	if (!gpiod_check_gpiochip_device(path, true))
 		return NULL;
 
@@ -78,6 +84,8 @@ GPIOD_API struct gpiod_chip_info *gpiod_chip_get_info(struct gpiod_chip *chip)
 	struct gpiochip_info info;
 	int ret;
 
+	assert(chip);
+
 	ret = read_chip_info(chip->fd, &info);
 	if (ret < 0)
 		return NULL;
@@ -87,6 +95,8 @@ GPIOD_API struct gpiod_chip_info *gpiod_chip_get_info(struct gpiod_chip *chip)
 
 GPIOD_API const char *gpiod_chip_get_path(struct gpiod_chip *chip)
 {
+	assert(chip);
+
 	return chip->path;
 }
 
@@ -114,6 +124,8 @@ chip_get_line_info(struct gpiod_chip *chip, unsigned int offset, bool watch)
 	struct gpio_v2_line_info info;
 	int ret;
 
+	assert(chip);
+
 	ret = chip_read_line_info(chip->fd, offset, &info, watch);
 	if (ret)
 		return NULL;
@@ -136,23 +148,31 @@ gpiod_chip_watch_line_info(struct gpiod_chip *chip, unsigned int offset)
 GPIOD_API int gpiod_chip_unwatch_line_info(struct gpiod_chip *chip,
 					   unsigned int offset)
 {
+	assert(chip);
+
 	return ioctl(chip->fd, GPIO_GET_LINEINFO_UNWATCH_IOCTL, &offset);
 }
 
 GPIOD_API int gpiod_chip_get_fd(struct gpiod_chip *chip)
 {
+	assert(chip);
+
 	return chip->fd;
 }
 
 GPIOD_API int gpiod_chip_wait_info_event(struct gpiod_chip *chip,
 					 int64_t timeout_ns)
 {
+	assert(chip);
+
 	return gpiod_poll_fd(chip->fd, timeout_ns);
 }
 
 GPIOD_API struct gpiod_info_event *
 gpiod_chip_read_info_event(struct gpiod_chip *chip)
 {
+	assert(chip);
+
 	return gpiod_info_event_read_fd(chip->fd);
 }
 
@@ -164,6 +184,13 @@ GPIOD_API int gpiod_chip_get_line_offset_from_name(struct gpiod_chip *chip,
 	unsigned int offset;
 	int ret;
 
+	assert(chip);
+
+	if (!name) {
+		errno = EINVAL;
+		return -1;
+	}
+
 	ret = read_chip_info(chip->fd, &chinfo);
 	if (ret < 0)
 		return -1;
@@ -190,6 +217,13 @@ gpiod_chip_request_lines(struct gpiod_chip *chip,
 	struct gpiod_line_request *request;
 	int ret;
 
+	assert(chip);
+
+	if (!line_cfg) {
+		errno = EINVAL;
+		return NULL;
+	}
+
 	memset(&uapi_req, 0, sizeof(uapi_req));
 
 	if (req_cfg)
diff --git a/lib/edge-event.c b/lib/edge-event.c
index 9d8ae2b..8ec355f 100644
--- a/lib/edge-event.c
+++ b/lib/edge-event.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: LGPL-2.1-or-later
 // SPDX-FileCopyrightText: 2021 Bartosz Golaszewski <brgl@bgdev.pl>
 
+#include <assert.h>
 #include <errno.h>
 #include <gpiod.h>
 #include <stdlib.h>
@@ -37,6 +38,8 @@ gpiod_edge_event_copy(struct gpiod_edge_event *event)
 {
 	struct gpiod_edge_event *copy;
 
+	assert(event);
+
 	copy = malloc(sizeof(*event));
 	if (!copy)
 		return NULL;
@@ -49,30 +52,40 @@ gpiod_edge_event_copy(struct gpiod_edge_event *event)
 GPIOD_API enum gpiod_edge_event_type
 gpiod_edge_event_get_event_type(struct gpiod_edge_event *event)
 {
+	assert(event);
+
 	return event->event_type;
 }
 
 GPIOD_API uint64_t
 gpiod_edge_event_get_timestamp_ns(struct gpiod_edge_event *event)
 {
+	assert(event);
+
 	return event->timestamp;
 }
 
 GPIOD_API unsigned int
 gpiod_edge_event_get_line_offset(struct gpiod_edge_event *event)
 {
+	assert(event);
+
 	return event->line_offset;
 }
 
 GPIOD_API unsigned long
 gpiod_edge_event_get_global_seqno(struct gpiod_edge_event *event)
 {
+	assert(event);
+
 	return event->global_seqno;
 }
 
 GPIOD_API unsigned long
 gpiod_edge_event_get_line_seqno(struct gpiod_edge_event *event)
 {
+	assert(event);
+
 	return event->line_seqno;
 }
 
@@ -112,6 +125,8 @@ gpiod_edge_event_buffer_new(size_t capacity)
 GPIOD_API size_t
 gpiod_edge_event_buffer_get_capacity(struct gpiod_edge_event_buffer *buffer)
 {
+	assert(buffer);
+
 	return buffer->capacity;
 }
 
@@ -130,6 +145,8 @@ GPIOD_API struct gpiod_edge_event *
 gpiod_edge_event_buffer_get_event(struct gpiod_edge_event_buffer *buffer,
 				  unsigned long index)
 {
+	assert(buffer);
+
 	if (index >= buffer->num_events) {
 		errno = EINVAL;
 		return NULL;
@@ -141,6 +158,8 @@ gpiod_edge_event_buffer_get_event(struct gpiod_edge_event_buffer *buffer,
 GPIOD_API size_t
 gpiod_edge_event_buffer_get_num_events(struct gpiod_edge_event_buffer *buffer)
 {
+	assert(buffer);
+
 	return buffer->num_events;
 }
 
@@ -153,6 +172,11 @@ int gpiod_edge_event_buffer_read_fd(int fd,
 	size_t i;
 	ssize_t rd;
 
+	if (!buffer) {
+		errno = EINVAL;
+		return -1;
+	}
+
 	memset(buffer->event_data, 0,
 	       sizeof(*buffer->event_data) * buffer->capacity);
 	memset(buffer->events, 0, sizeof(*buffer->events) * buffer->capacity);
diff --git a/lib/info-event.c b/lib/info-event.c
index c0d7307..0e3ef9b 100644
--- a/lib/info-event.c
+++ b/lib/info-event.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: LGPL-2.1-or-later
 // SPDX-FileCopyrightText: 2021 Bartosz Golaszewski <brgl@bgdev.pl>
 
+#include <assert.h>
 #include <errno.h>
 #include <stdlib.h>
 #include <string.h>
@@ -64,18 +65,24 @@ GPIOD_API void gpiod_info_event_free(struct gpiod_info_event *event)
 GPIOD_API enum gpiod_info_event_type
 gpiod_info_event_get_event_type(struct gpiod_info_event *event)
 {
+	assert(event);
+
 	return event->event_type;
 }
 
 GPIOD_API uint64_t
 gpiod_info_event_get_timestamp_ns(struct gpiod_info_event *event)
 {
+	assert(event);
+
 	return event->timestamp;
 }
 
 GPIOD_API struct gpiod_line_info *
 gpiod_info_event_get_line_info(struct gpiod_info_event *event)
 {
+	assert(event);
+
 	return event->info;
 }
 
diff --git a/lib/internal.c b/lib/internal.c
index 5d79ff7..d70e247 100644
--- a/lib/internal.c
+++ b/lib/internal.c
@@ -21,6 +21,11 @@ bool gpiod_check_gpiochip_device(const char *path, bool set_errno)
 	bool ret = false;
 	int rv;
 
+	if (!path) {
+		errno = EINVAL;
+		goto out;
+	}
+
 	rv = lstat(path, &statbuf);
 	if (rv)
 		goto out;
diff --git a/lib/line-config.c b/lib/line-config.c
index ce23792..bc10059 100644
--- a/lib/line-config.c
+++ b/lib/line-config.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: LGPL-2.1-or-later
 // SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
+#include <assert.h>
 #include <errno.h>
 #include <gpiod.h>
 #include <stdlib.h>
@@ -53,12 +54,17 @@ static void free_refs(struct gpiod_line_config *config)
 
 GPIOD_API void gpiod_line_config_free(struct gpiod_line_config *config)
 {
+	if (!config)
+		return;
+
 	free_refs(config);
 	free(config);
 }
 
 GPIOD_API void gpiod_line_config_reset(struct gpiod_line_config *config)
 {
+	assert(config);
+
 	free_refs(config);
 	memset(config, 0, sizeof(*config));
 }
@@ -87,6 +93,13 @@ GPIOD_API int gpiod_line_config_add_line_settings(
 	struct settings_node *node;
 	size_t i;
 
+	assert(config);
+
+	if (!offsets || num_offsets == 0) {
+		errno = EINVAL;
+		return -1;
+	}
+
 	if ((config->num_configs + num_offsets) > LINES_MAX) {
 		errno = E2BIG;
 		return -1;
@@ -125,6 +138,8 @@ gpiod_line_config_get_line_settings(struct gpiod_line_config *config,
 	struct per_line_config *per_line;
 	size_t i;
 
+	assert(config);
+
 	for (i = 0; i < config->num_configs; i++) {
 		per_line = &config->line_configs[i];
 
@@ -144,6 +159,13 @@ GPIOD_API int gpiod_line_config_get_offsets(struct gpiod_line_config *config,
 	unsigned int *offs;
 	size_t i;
 
+	assert(config);
+
+	if (!num_offsets || !offsets) {
+		errno = EINVAL;
+		return -1;
+	}
+
 	*num_offsets = config->num_configs;
 	*offsets = NULL;
 
diff --git a/lib/line-info.c b/lib/line-info.c
index 620893e..9f53b04 100644
--- a/lib/line-info.c
+++ b/lib/line-info.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: LGPL-2.1-or-later
 // SPDX-FileCopyrightText: 2021 Bartosz Golaszewski <brgl@bgdev.pl>
 
+#include <assert.h>
 #include <gpiod.h>
 #include <stdlib.h>
 #include <string.h>
@@ -32,6 +33,8 @@ gpiod_line_info_copy(struct gpiod_line_info *info)
 {
 	struct gpiod_line_info *copy;
 
+	assert(info);
+
 	copy = malloc(sizeof(*info));
 	if (!copy)
 		return NULL;
@@ -43,67 +46,91 @@ gpiod_line_info_copy(struct gpiod_line_info *info)
 
 GPIOD_API unsigned int gpiod_line_info_get_offset(struct gpiod_line_info *info)
 {
+	assert(info);
+
 	return info->offset;
 }
 
 GPIOD_API const char *gpiod_line_info_get_name(struct gpiod_line_info *info)
 {
+	assert(info);
+
 	return info->name[0] == '\0' ? NULL : info->name;
 }
 
 GPIOD_API bool gpiod_line_info_is_used(struct gpiod_line_info *info)
 {
+	assert(info);
+
 	return info->used;
 }
 
 GPIOD_API const char *gpiod_line_info_get_consumer(struct gpiod_line_info *info)
 {
+	assert(info);
+
 	return info->consumer[0] == '\0' ? NULL : info->consumer;
 }
 
 GPIOD_API enum gpiod_line_direction
 gpiod_line_info_get_direction(struct gpiod_line_info *info)
 {
+	assert(info);
+
 	return info->direction;
 }
 
 GPIOD_API bool gpiod_line_info_is_active_low(struct gpiod_line_info *info)
 {
+	assert(info);
+
 	return info->active_low;
 }
 
 GPIOD_API enum gpiod_line_bias
 gpiod_line_info_get_bias(struct gpiod_line_info *info)
 {
+	assert(info);
+
 	return info->bias;
 }
 
 GPIOD_API enum gpiod_line_drive
 gpiod_line_info_get_drive(struct gpiod_line_info *info)
 {
+	assert(info);
+
 	return info->drive;
 }
 
 GPIOD_API enum gpiod_line_edge
 gpiod_line_info_get_edge_detection(struct gpiod_line_info *info)
 {
+	assert(info);
+
 	return info->edge;
 }
 
 GPIOD_API enum gpiod_line_clock
 gpiod_line_info_get_event_clock(struct gpiod_line_info *info)
 {
+	assert(info);
+
 	return info->event_clock;
 }
 
 GPIOD_API bool gpiod_line_info_is_debounced(struct gpiod_line_info *info)
 {
+	assert(info);
+
 	return info->debounced;
 }
 
 GPIOD_API unsigned long
 gpiod_line_info_get_debounce_period_us(struct gpiod_line_info *info)
 {
+	assert(info);
+
 	return info->debounce_period_us;
 }
 
diff --git a/lib/line-request.c b/lib/line-request.c
index 58dc3c9..c9ad337 100644
--- a/lib/line-request.c
+++ b/lib/line-request.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: LGPL-2.1-or-later
 // SPDX-FileCopyrightText: 2021 Bartosz Golaszewski <brgl@bgdev.pl>
 
+#include <assert.h>
 #include <errno.h>
 #include <gpiod.h>
 #include <stdlib.h>
@@ -46,6 +47,8 @@ GPIOD_API void gpiod_line_request_release(struct gpiod_line_request *request)
 GPIOD_API size_t
 gpiod_line_request_get_num_lines(struct gpiod_line_request *request)
 {
+	assert(request);
+
 	return request->num_lines;
 }
 
@@ -53,6 +56,11 @@ GPIOD_API void
 gpiod_line_request_get_offsets(struct gpiod_line_request *request,
 			       unsigned int *offsets)
 {
+	assert(request);
+
+	if (!offsets)
+		return;
+
 	memcpy(offsets, request->offsets,
 	       sizeof(*offsets) * request->num_lines);
 }
@@ -64,6 +72,8 @@ gpiod_line_request_get_value(struct gpiod_line_request *request,
 	enum gpiod_line_value val;
 	unsigned int ret;
 
+	assert(request);
+
 	ret = gpiod_line_request_get_values_subset(request, 1, &offset, &val);
 	if (ret)
 		return GPIOD_LINE_VALUE_ERROR;
@@ -76,6 +86,8 @@ static int offset_to_bit(struct gpiod_line_request *request,
 {
 	size_t i;
 
+	assert(request);
+
 	for (i = 0; i < request->num_lines; i++) {
 		if (offset == request->offsets[i])
 			return i;
@@ -95,6 +107,13 @@ gpiod_line_request_get_values_subset(struct gpiod_line_request *request,
 	size_t i;
 	int bit, ret;
 
+	assert(request);
+
+	if (!offsets || !values) {
+		errno = EINVAL;
+		return -1;
+	}
+
 	uapi_values.bits = 0;
 
 	for (i = 0; i < num_values; i++) {
@@ -127,6 +146,8 @@ gpiod_line_request_get_values_subset(struct gpiod_line_request *request,
 GPIOD_API int gpiod_line_request_get_values(struct gpiod_line_request *request,
 					    enum gpiod_line_value *values)
 {
+	assert(request);
+
 	return gpiod_line_request_get_values_subset(request, request->num_lines,
 						    request->offsets, values);
 }
@@ -150,6 +171,13 @@ gpiod_line_request_set_values_subset(struct gpiod_line_request *request,
 	size_t i;
 	int bit;
 
+	assert(request);
+
+	if (!offsets || !values) {
+		errno = EINVAL;
+		return -1;
+	}
+
 	for (i = 0; i < num_values; i++) {
 		bit = offset_to_bit(request, offsets[i]);
 		if (bit < 0) {
@@ -171,6 +199,8 @@ gpiod_line_request_set_values_subset(struct gpiod_line_request *request,
 GPIOD_API int gpiod_line_request_set_values(struct gpiod_line_request *request,
 					    const enum gpiod_line_value *values)
 {
+	assert(request);
+
 	return gpiod_line_request_set_values_subset(request, request->num_lines,
 						    request->offsets, values);
 }
@@ -198,6 +228,13 @@ gpiod_line_request_reconfigure_lines(struct gpiod_line_request *request,
 	struct gpio_v2_line_request uapi_cfg;
 	int ret;
 
+	assert(request);
+
+	if (!config) {
+		errno = EINVAL;
+		return -1;
+	}
+
 	memset(&uapi_cfg, 0, sizeof(uapi_cfg));
 
 	ret = gpiod_line_config_to_uapi(config, &uapi_cfg);
@@ -219,6 +256,8 @@ gpiod_line_request_reconfigure_lines(struct gpiod_line_request *request,
 
 GPIOD_API int gpiod_line_request_get_fd(struct gpiod_line_request *request)
 {
+	assert(request);
+
 	return request->fd;
 }
 
@@ -226,6 +265,8 @@ GPIOD_API int
 gpiod_line_request_wait_edge_events(struct gpiod_line_request *request,
 				    int64_t timeout_ns)
 {
+	assert(request);
+
 	return gpiod_poll_fd(request->fd, timeout_ns);
 }
 
@@ -234,5 +275,7 @@ gpiod_line_request_read_edge_events(struct gpiod_line_request *request,
 				    struct gpiod_edge_event_buffer *buffer,
 				    size_t max_events)
 {
+	assert(request);
+
 	return gpiod_edge_event_buffer_read_fd(request->fd, buffer, max_events);
 }
diff --git a/lib/line-settings.c b/lib/line-settings.c
index 808819c..67f3e2d 100644
--- a/lib/line-settings.c
+++ b/lib/line-settings.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: LGPL-2.1-or-later
 // SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
+#include <assert.h>
 #include <errno.h>
 #include <gpiod.h>
 #include <string.h>
@@ -39,6 +40,8 @@ GPIOD_API void gpiod_line_settings_free(struct gpiod_line_settings *settings)
 
 GPIOD_API void gpiod_line_settings_reset(struct gpiod_line_settings *settings)
 {
+	assert(settings);
+
 	settings->direction = GPIOD_LINE_DIRECTION_AS_IS;
 	settings->edge_detection = GPIOD_LINE_EDGE_NONE;
 	settings->bias = GPIOD_LINE_BIAS_AS_IS;
@@ -52,6 +55,8 @@ GPIOD_API void gpiod_line_settings_reset(struct gpiod_line_settings *settings)
 GPIOD_API struct gpiod_line_settings *
 gpiod_line_settings_copy(struct gpiod_line_settings *settings)
 {
+	assert(settings);
+
 	struct gpiod_line_settings *copy;
 
 	copy = malloc(sizeof(*copy));
@@ -67,6 +72,8 @@ GPIOD_API int
 gpiod_line_settings_set_direction(struct gpiod_line_settings *settings,
 				  enum gpiod_line_direction direction)
 {
+	assert(settings);
+
 	switch (direction) {
 	case GPIOD_LINE_DIRECTION_INPUT:
 	case GPIOD_LINE_DIRECTION_OUTPUT:
@@ -85,6 +92,8 @@ gpiod_line_settings_set_direction(struct gpiod_line_settings *settings,
 GPIOD_API enum gpiod_line_direction
 gpiod_line_settings_get_direction(struct gpiod_line_settings *settings)
 {
+	assert(settings);
+
 	return settings->direction;
 }
 
@@ -92,6 +101,8 @@ GPIOD_API int
 gpiod_line_settings_set_edge_detection(struct gpiod_line_settings *settings,
 				       enum gpiod_line_edge edge)
 {
+	assert(settings);
+
 	switch (edge) {
 	case GPIOD_LINE_EDGE_NONE:
 	case GPIOD_LINE_EDGE_RISING:
@@ -111,12 +122,16 @@ gpiod_line_settings_set_edge_detection(struct gpiod_line_settings *settings,
 GPIOD_API enum gpiod_line_edge
 gpiod_line_settings_get_edge_detection(struct gpiod_line_settings *settings)
 {
+	assert(settings);
+
 	return settings->edge_detection;
 }
 
 GPIOD_API int gpiod_line_settings_set_bias(struct gpiod_line_settings *settings,
 					   enum gpiod_line_bias bias)
 {
+	assert(settings);
+
 	switch (bias) {
 	case GPIOD_LINE_BIAS_AS_IS:
 	case GPIOD_LINE_BIAS_DISABLED:
@@ -136,6 +151,8 @@ GPIOD_API int gpiod_line_settings_set_bias(struct gpiod_line_settings *settings,
 GPIOD_API enum gpiod_line_bias
 gpiod_line_settings_get_bias(struct gpiod_line_settings *settings)
 {
+	assert(settings);
+
 	return settings->bias;
 }
 
@@ -143,6 +160,8 @@ GPIOD_API int
 gpiod_line_settings_set_drive(struct gpiod_line_settings *settings,
 			      enum gpiod_line_drive drive)
 {
+	assert(settings);
+
 	switch (drive) {
 	case GPIOD_LINE_DRIVE_PUSH_PULL:
 	case GPIOD_LINE_DRIVE_OPEN_DRAIN:
@@ -161,6 +180,8 @@ gpiod_line_settings_set_drive(struct gpiod_line_settings *settings,
 GPIOD_API enum gpiod_line_drive
 gpiod_line_settings_get_drive(struct gpiod_line_settings *settings)
 {
+	assert(settings);
+
 	return settings->drive;
 }
 
@@ -168,12 +189,16 @@ GPIOD_API void
 gpiod_line_settings_set_active_low(struct gpiod_line_settings *settings,
 				   bool active_low)
 {
+	assert(settings);
+
 	settings->active_low = active_low;
 }
 
 GPIOD_API bool
 gpiod_line_settings_get_active_low(struct gpiod_line_settings *settings)
 {
+	assert(settings);
+
 	return settings->active_low;
 }
 
@@ -181,12 +206,16 @@ GPIOD_API void
 gpiod_line_settings_set_debounce_period_us(struct gpiod_line_settings *settings,
 					   unsigned long period)
 {
+	assert(settings);
+
 	settings->debounce_period_us = period;
 }
 
 GPIOD_API unsigned long
 gpiod_line_settings_get_debounce_period_us(struct gpiod_line_settings *settings)
 {
+	assert(settings);
+
 	return settings->debounce_period_us;
 }
 
@@ -194,6 +223,8 @@ GPIOD_API int
 gpiod_line_settings_set_event_clock(struct gpiod_line_settings *settings,
 				    enum gpiod_line_clock event_clock)
 {
+	assert(settings);
+
 	switch (event_clock) {
 	case GPIOD_LINE_CLOCK_MONOTONIC:
 	case GPIOD_LINE_CLOCK_REALTIME:
@@ -212,6 +243,8 @@ gpiod_line_settings_set_event_clock(struct gpiod_line_settings *settings,
 GPIOD_API enum gpiod_line_clock
 gpiod_line_settings_get_event_clock(struct gpiod_line_settings *settings)
 {
+	assert(settings);
+
 	return settings->event_clock;
 }
 
@@ -219,6 +252,8 @@ GPIOD_API int
 gpiod_line_settings_set_output_value(struct gpiod_line_settings *settings,
 				     enum gpiod_line_value value)
 {
+	assert(settings);
+
 	switch (value) {
 	case GPIOD_LINE_VALUE_INACTIVE:
 	case GPIOD_LINE_VALUE_ACTIVE:
@@ -236,5 +271,7 @@ gpiod_line_settings_set_output_value(struct gpiod_line_settings *settings,
 GPIOD_API enum gpiod_line_value
 gpiod_line_settings_get_output_value(struct gpiod_line_settings *settings)
 {
+	assert(settings);
+
 	return settings->output_value;
 }
diff --git a/lib/request-config.c b/lib/request-config.c
index 62568bb..da055c5 100644
--- a/lib/request-config.c
+++ b/lib/request-config.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: LGPL-2.1-or-later
 // SPDX-FileCopyrightText: 2021 Bartosz Golaszewski <brgl@bgdev.pl>
 
+#include <assert.h>
 #include <errno.h>
 #include <gpiod.h>
 #include <stdlib.h>
@@ -35,13 +36,21 @@ GPIOD_API void
 gpiod_request_config_set_consumer(struct gpiod_request_config *config,
 				  const char *consumer)
 {
-	strncpy(config->consumer, consumer, GPIO_MAX_NAME_SIZE - 1);
-	config->consumer[GPIO_MAX_NAME_SIZE - 1] = '\0';
+	assert(config);
+
+	if (!consumer) {
+		config->consumer[0] = '\0';
+	} else {
+		strncpy(config->consumer, consumer, GPIO_MAX_NAME_SIZE - 1);
+		config->consumer[GPIO_MAX_NAME_SIZE - 1] = '\0';
+	}
 }
 
 GPIOD_API const char *
 gpiod_request_config_get_consumer(struct gpiod_request_config *config)
 {
+	assert(config);
+
 	return config->consumer[0] == '\0' ? NULL : config->consumer;
 }
 
@@ -49,12 +58,16 @@ GPIOD_API void
 gpiod_request_config_set_event_buffer_size(struct gpiod_request_config *config,
 					   size_t event_buffer_size)
 {
+	assert(config);
+
 	config->event_buffer_size = event_buffer_size;
 }
 
 GPIOD_API size_t
 gpiod_request_config_get_event_buffer_size(struct gpiod_request_config *config)
 {
+	assert(config);
+
 	return config->event_buffer_size;
 }
 
diff --git a/tests/tests-chip.c b/tests/tests-chip.c
index c512908..09ea78d 100644
--- a/tests/tests-chip.c
+++ b/tests/tests-chip.c
@@ -47,6 +47,15 @@ GPIOD_TEST_CASE(open_chip_not_a_gpio_device)
 	gpiod_test_expect_errno(ENODEV);
 }
 
+GPIOD_TEST_CASE(open_chip_null_path)
+{
+	g_autoptr(struct_gpiod_chip) chip = NULL;
+
+	chip = gpiod_chip_open(NULL);
+	g_assert_null(chip);
+	gpiod_test_expect_errno(EINVAL);
+}
+
 GPIOD_TEST_CASE(get_chip_path)
 {
 	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new(NULL);
@@ -145,3 +154,16 @@ GPIOD_TEST_CASE(find_line_duplicate)
 	g_assert_cmpint(gpiod_chip_get_line_offset_from_name(chip, "baz"),
 			==, 2);
 }
+
+GPIOD_TEST_CASE(find_line_null_name)
+{
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new(NULL);
+	g_autoptr(struct_gpiod_chip) chip = NULL;
+	gint ret;
+
+	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
+
+	ret = gpiod_chip_get_line_offset_from_name(chip, NULL);
+	g_assert_cmpint(ret, ==, -1);
+	gpiod_test_expect_errno(EINVAL);
+}
diff --git a/tests/tests-edge-event.c b/tests/tests-edge-event.c
index 237c007..9281dd9 100644
--- a/tests/tests-edge-event.c
+++ b/tests/tests-edge-event.c
@@ -613,3 +613,31 @@ GPIOD_TEST_CASE(reading_more_events_than_the_queue_contains_doesnt_block)
 	g_assert_cmpint(ret, ==, 0);
 	gpiod_test_return_if_failed();
 }
+
+GPIOD_TEST_CASE(null_buffer)
+{
+	static const guint offset = 2;
+
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(struct_gpiod_chip) chip = NULL;
+	g_autoptr(struct_gpiod_line_settings) settings = NULL;
+	g_autoptr(struct_gpiod_line_config) line_cfg = NULL;
+	g_autoptr(struct_gpiod_line_request) request = NULL;
+	gint ret;
+
+	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
+	settings = gpiod_test_create_line_settings_or_fail();
+	line_cfg = gpiod_test_create_line_config_or_fail();
+
+	gpiod_line_settings_set_direction(settings, GPIOD_LINE_DIRECTION_INPUT);
+	gpiod_line_settings_set_edge_detection(settings, GPIOD_LINE_EDGE_BOTH);
+
+	gpiod_test_line_config_add_line_settings_or_fail(line_cfg, &offset, 1,
+							 settings);
+
+	request = gpiod_test_request_lines_or_fail(chip, NULL, line_cfg);
+
+	ret = gpiod_line_request_read_edge_events(request, NULL, 1);
+	g_assert_cmpint(ret, ==, -1);
+	gpiod_test_expect_errno(EINVAL);
+}
diff --git a/tests/tests-line-config.c b/tests/tests-line-config.c
index c615084..4b5b3bd 100644
--- a/tests/tests-line-config.c
+++ b/tests/tests-line-config.c
@@ -134,6 +134,26 @@ GPIOD_TEST_CASE(too_many_attrs)
 	g_assert_cmpint(errno, ==, E2BIG);
 }
 
+GPIOD_TEST_CASE(null_settings)
+{
+	static const guint offsets[] = { 0, 1, 2, 3 };
+
+	g_autoptr(struct_gpiod_line_config) config = NULL;
+	g_autoptr(struct_gpiod_line_settings) settings = NULL;
+
+	config = gpiod_test_create_line_config_or_fail();
+
+	gpiod_test_line_config_add_line_settings_or_fail(config, offsets, 4,
+							 NULL);
+
+	settings = gpiod_line_config_get_line_settings(config, 2);
+	g_assert_nonnull(settings);
+	gpiod_test_return_if_failed();
+
+	g_assert_cmpint(gpiod_line_settings_get_drive(settings), ==,
+			GPIOD_LINE_DIRECTION_AS_IS);
+}
+
 GPIOD_TEST_CASE(reset_config)
 {
 	static const guint offsets[] = { 0, 1, 2, 3 };
@@ -214,3 +234,16 @@ GPIOD_TEST_CASE(get_0_offsets)
 	g_assert_cmpuint(num_offsets, ==, 0);
 	g_assert_null(offsets);
 }
+
+GPIOD_TEST_CASE(get_null_offsets)
+{
+	g_autoptr(struct_gpiod_line_config) config = NULL;
+	g_autofree guint *offsets = NULL;
+	gint ret;
+
+	config = gpiod_test_create_line_config_or_fail();
+
+	ret = gpiod_line_config_get_offsets(config, NULL, &offsets);
+	g_assert_cmpint(ret, ==, -1);
+	gpiod_test_expect_errno(EINVAL);
+}
diff --git a/tests/tests-misc.c b/tests/tests-misc.c
index 0a3587d..45b92f6 100644
--- a/tests/tests-misc.c
+++ b/tests/tests-misc.c
@@ -59,6 +59,12 @@ GPIOD_TEST_CASE(is_gpiochip_link_good)
 	g_assert_cmpint(ret, ==, 0);
 }
 
+GPIOD_TEST_CASE(is_gpiochip_null_path)
+{
+	g_assert_false(gpiod_is_gpiochip_device(NULL));
+	gpiod_test_expect_errno(0);
+}
+
 GPIOD_TEST_CASE(version_string)
 {
 	static const gchar *const pattern = "^[0-9][1-9]?\\.[0-9][1-9]?([\\.0-9]?|\\-devel)$";
-- 
2.37.2

