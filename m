Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 29B5763D5CF
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Nov 2022 13:43:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235032AbiK3Mm4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Nov 2022 07:42:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235022AbiK3Mmt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Nov 2022 07:42:49 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5ED219C0C
        for <linux-gpio@vger.kernel.org>; Wed, 30 Nov 2022 04:42:38 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id z4so26922664wrr.3
        for <linux-gpio@vger.kernel.org>; Wed, 30 Nov 2022 04:42:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zTbaZVLlKl2cQdcKxhm5A065jniA+VJPi/PgjuwdeeE=;
        b=GPAQOGOHF/vspn/rpc2FYbFyJzHzZ0nI9xck6ZB7fZNusePJn8FgJVmbUMvIuoUOp/
         vzPcYbnA51kwJeNQAuv27hIO0/YJcTpKjsjrIHQmz35adnj8JewVSwqb1rzqaBzsWRMO
         J7WuTgFbve5FNXmQcOvyG/b5hnOS5XgY7JE/pFV52olhZ5dKY7B9l3KLdQRSjlZaZnce
         YBa8iqFaU20bkyhxrB8+Rphjh9vV2XZkqH8/VXqJsXi/32P0jP7S4BJoAII1pwRB9lwD
         exVB0CsuyijZpuYcpieJGiTMknux9dxGTSp/bcv7bN92KiB+35ZEUmNgvp7lvdkRl1jK
         mi2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zTbaZVLlKl2cQdcKxhm5A065jniA+VJPi/PgjuwdeeE=;
        b=WL+wJpNB04Sbq5+jcPFUCO8roy4lsM50wgmIipNqgBVwZWqauNjeXjdsNcPL4c1ypH
         TN7gynsgvXxOKUdPVgERZjSlYI288lc24/O1QzVNoTmF6cSTKI+8hifO/Igg5MWXpbgG
         Nw3gQCiHWNx9SGJJOxUJo7ulZEabrQEeQxVAealCUVpZORgKsKdVsUMUKuNU7wMreHO8
         K6t3QiW9rYz/yvr/uzqowTLQ1puGsfezJQXZ0WO0q7O5CTO4ohs1u1ce8fAPht1r+Z0e
         vIpnJfh19YNTq4MQPXjEXG3CYTRACUoQB7/WtcdVURhoiQIicJsKWDb2eCKuGA62JHjd
         EriQ==
X-Gm-Message-State: ANoB5pltSiEr92aJg16mVd5AaKH6ahIhCot5/xclBvN21hJuTCdkNUZA
        T19PKFd22SKh6mxsKDeGhKsDKQ==
X-Google-Smtp-Source: AA0mqf7jfpf/Q/B11l3ldN14m6zG5ptwY1wkXNLl1nz1Dw6cosKX1krJ0EC1+aPYT+kFAQ3Q5frrdQ==
X-Received: by 2002:a5d:5045:0:b0:242:199a:e067 with SMTP id h5-20020a5d5045000000b00242199ae067mr8344425wrt.148.1669812156946;
        Wed, 30 Nov 2022 04:42:36 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:458c:6db9:e033:a468])
        by smtp.gmail.com with ESMTPSA id z2-20020a5d4402000000b00226dba960b4sm1514985wrq.3.2022.11.30.04.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 04:42:36 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][PATCH 02/11] treewide: apply formatting changes with clang-format
Date:   Wed, 30 Nov 2022 13:42:22 +0100
Message-Id: <20221130124231.1054001-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221130124231.1054001-1-brgl@bgdev.pl>
References: <20221130124231.1054001-1-brgl@bgdev.pl>
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

Use linux kernel's .clang-format file to automatically improve the coding
style of libgpiod's C code base. We don't import the file into the
repository as it's not perfect and certain converted fragments were
rolled back because they looked better before the conversion.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 lib/edge-event.c             |  8 +++---
 lib/internal.c               |  4 +--
 lib/internal.h               |  3 ++-
 lib/line-config.c            | 39 +++++++++++++--------------
 lib/line-settings.c          |  5 ++--
 tests/gpiod-test-sim.c       | 41 +++++++++++++++++-----------
 tests/gpiosim/gpiosim.c      | 18 +++++--------
 tests/gpiosim/gpiosim.h      |  6 ++---
 tests/tests-chip-info.c      |  1 -
 tests/tests-edge-event.c     | 52 +++++++++++++++---------------------
 tests/tests-info-event.c     |  2 +-
 tests/tests-line-config.c    |  2 +-
 tests/tests-line-info.c      | 23 ++++++++--------
 tests/tests-line-request.c   | 33 ++++++++++++-----------
 tests/tests-line-settings.c  | 16 +++++------
 tests/tests-request-config.c | 12 ++++-----
 tools/gpiodetect.c           |  3 +--
 tools/gpioinfo.c             | 12 ++++-----
 tools/gpiomon.c              | 11 ++++----
 tools/gpionotify.c           | 10 +++----
 tools/gpioset.c              | 48 +++++++++++++++------------------
 tools/tools-common.c         | 34 +++++++++++------------
 tools/tools-common.h         |  3 ++-
 23 files changed, 182 insertions(+), 204 deletions(-)

diff --git a/lib/edge-event.c b/lib/edge-event.c
index ad8a7d1..fbbe4a8 100644
--- a/lib/edge-event.c
+++ b/lib/edge-event.c
@@ -131,7 +131,7 @@ gpiod_edge_event_buffer_free(struct gpiod_edge_event_buffer *buffer)
 
 GPIOD_API struct gpiod_edge_event *
 gpiod_edge_event_buffer_get_event(struct gpiod_edge_event_buffer *buffer,
-				   unsigned long index)
+				  unsigned long index)
 {
 	if (index >= buffer->num_events) {
 		errno = EINVAL;
@@ -179,9 +179,9 @@ int gpiod_edge_event_buffer_read_fd(int fd,
 		event = &buffer->events[i];
 
 		event->line_offset = curr->offset;
-		event->event_type = curr->id == GPIO_V2_LINE_EVENT_RISING_EDGE
-					? GPIOD_EDGE_EVENT_RISING_EDGE
-					: GPIOD_EDGE_EVENT_FALLING_EDGE;
+		event->event_type = curr->id == GPIO_V2_LINE_EVENT_RISING_EDGE ?
+					    GPIOD_EDGE_EVENT_RISING_EDGE :
+					    GPIOD_EDGE_EVENT_FALLING_EDGE;
 		event->timestamp = curr->timestamp_ns;
 		event->global_seqno = curr->seqno;
 		event->line_seqno = curr->line_seqno;
diff --git a/lib/internal.c b/lib/internal.c
index ef87ecd..5d79ff7 100644
--- a/lib/internal.c
+++ b/lib/internal.c
@@ -29,8 +29,8 @@ bool gpiod_check_gpiochip_device(const char *path, bool set_errno)
 	 * Is it a symbolic link? We have to resolve it before checking
 	 * the rest.
 	 */
-	realname = S_ISLNK(statbuf.st_mode) ? realpath(path, NULL)
-					    : strdup(path);
+	realname = S_ISLNK(statbuf.st_mode) ? realpath(path, NULL) :
+					      strdup(path);
 	if (realname == NULL)
 		goto out;
 
diff --git a/lib/internal.h b/lib/internal.h
index eef70aa..6646647 100644
--- a/lib/internal.h
+++ b/lib/internal.h
@@ -27,7 +27,8 @@ int gpiod_line_config_to_uapi(struct gpiod_line_config *config,
 			      struct gpio_v2_line_request *uapi_cfg);
 struct gpiod_line_request *
 gpiod_line_request_from_uapi(struct gpio_v2_line_request *uapi_req);
-int gpiod_edge_event_buffer_read_fd(int fd, struct gpiod_edge_event_buffer *buffer,
+int gpiod_edge_event_buffer_read_fd(int fd,
+				    struct gpiod_edge_event_buffer *buffer,
 				    size_t max_events);
 struct gpiod_info_event *
 gpiod_info_event_from_uapi(struct gpio_v2_line_info_changed *uapi_evt);
diff --git a/lib/line-config.c b/lib/line-config.c
index 48ea618..436f4e8 100644
--- a/lib/line-config.c
+++ b/lib/line-config.c
@@ -63,8 +63,8 @@ GPIOD_API void gpiod_line_config_reset(struct gpiod_line_config *config)
 	memset(config, 0, sizeof(*config));
 }
 
-static struct per_line_config *
-find_config(struct gpiod_line_config *config, unsigned int offset)
+static struct per_line_config *find_config(struct gpiod_line_config *config,
+					   unsigned int offset)
 {
 	struct per_line_config *per_line;
 	size_t i;
@@ -79,11 +79,9 @@ find_config(struct gpiod_line_config *config, unsigned int offset)
 	return &config->line_configs[config->num_configs++];
 }
 
-GPIOD_API int
-gpiod_line_config_add_line_settings(struct gpiod_line_config *config,
-				    const unsigned int *offsets,
-				    size_t num_offsets,
-				    struct gpiod_line_settings *settings)
+GPIOD_API int gpiod_line_config_add_line_settings(
+	struct gpiod_line_config *config, const unsigned int *offsets,
+	size_t num_offsets, struct gpiod_line_settings *settings)
 {
 	struct per_line_config *per_line;
 	struct settings_node *node;
@@ -139,10 +137,9 @@ gpiod_line_config_get_line_settings(struct gpiod_line_config *config,
 	return NULL;
 }
 
-GPIOD_API int
-gpiod_line_config_get_offsets(struct gpiod_line_config *config,
-			      size_t *num_offsets,
-			      unsigned int **offsets)
+GPIOD_API int gpiod_line_config_get_offsets(struct gpiod_line_config *config,
+					    size_t *num_offsets,
+					    unsigned int **offsets)
 {
 	unsigned int *offs;
 	size_t i;
@@ -182,7 +179,7 @@ static bool has_at_least_one_output_direction(struct gpiod_line_config *config)
 
 	for (i = 0; i < config->num_configs; i++) {
 		if (gpiod_line_settings_get_direction(
-				config->line_configs[i].node->settings) ==
+			    config->line_configs[i].node->settings) ==
 		    GPIOD_LINE_DIRECTION_OUTPUT)
 			return true;
 	}
@@ -204,15 +201,15 @@ static void set_kernel_output_values(uint64_t *mask, uint64_t *vals,
 		per_line = &config->line_configs[i];
 
 		if (gpiod_line_settings_get_direction(
-				per_line->node->settings) !=
+			    per_line->node->settings) !=
 		    GPIOD_LINE_DIRECTION_OUTPUT)
 			continue;
 
 		gpiod_line_mask_set_bit(mask, i);
 		value = gpiod_line_settings_get_output_value(
-						per_line->node->settings);
-		gpiod_line_mask_assign_bit(vals, i,
-				value == GPIOD_LINE_VALUE_ACTIVE ? 1 : 0);
+			per_line->node->settings);
+		gpiod_line_mask_assign_bit(
+			vals, i, value == GPIOD_LINE_VALUE_ACTIVE ? 1 : 0);
 	}
 }
 
@@ -299,18 +296,18 @@ static uint64_t make_kernel_flags(struct gpiod_line_settings *settings)
 	switch (gpiod_line_settings_get_edge_detection(settings)) {
 	case GPIOD_LINE_EDGE_FALLING:
 		flags |= (GPIO_V2_LINE_FLAG_EDGE_FALLING |
-			   GPIO_V2_LINE_FLAG_INPUT);
+			  GPIO_V2_LINE_FLAG_INPUT);
 		flags &= ~GPIOD_LINE_DIRECTION_OUTPUT;
 		break;
 	case GPIOD_LINE_EDGE_RISING:
 		flags |= (GPIO_V2_LINE_FLAG_EDGE_RISING |
-			   GPIO_V2_LINE_FLAG_INPUT);
+			  GPIO_V2_LINE_FLAG_INPUT);
 		flags &= ~GPIOD_LINE_DIRECTION_OUTPUT;
 		break;
 	case GPIOD_LINE_EDGE_BOTH:
 		flags |= (GPIO_V2_LINE_FLAG_EDGE_FALLING |
-			   GPIO_V2_LINE_FLAG_EDGE_RISING |
-			   GPIO_V2_LINE_FLAG_INPUT);
+			  GPIO_V2_LINE_FLAG_EDGE_RISING |
+			  GPIO_V2_LINE_FLAG_INPUT);
 		flags &= ~GPIOD_LINE_DIRECTION_OUTPUT;
 		break;
 	default:
@@ -360,7 +357,7 @@ static uint64_t make_kernel_flags(struct gpiod_line_settings *settings)
 }
 
 static bool settings_equal(struct gpiod_line_settings *left,
-			 struct gpiod_line_settings *right)
+			   struct gpiod_line_settings *right)
 {
 	if (gpiod_line_settings_get_direction(left) !=
 	    gpiod_line_settings_get_direction(right))
diff --git a/lib/line-settings.c b/lib/line-settings.c
index f245b20..dcd0f6b 100644
--- a/lib/line-settings.c
+++ b/lib/line-settings.c
@@ -114,9 +114,8 @@ gpiod_line_settings_get_edge_detection(struct gpiod_line_settings *settings)
 	return settings->edge_detection;
 }
 
-GPIOD_API int
-gpiod_line_settings_set_bias(struct gpiod_line_settings *settings,
-			     enum gpiod_line_bias bias)
+GPIOD_API int gpiod_line_settings_set_bias(struct gpiod_line_settings *settings,
+					   enum gpiod_line_bias bias)
 {
 	switch (bias) {
 	case GPIOD_LINE_BIAS_AS_IS:
diff --git a/tests/gpiod-test-sim.c b/tests/gpiod-test-sim.c
index fe5db38..fe9f822 100644
--- a/tests/gpiod-test-sim.c
+++ b/tests/gpiod-test-sim.c
@@ -193,35 +193,44 @@ static void g_gpiosim_chip_class_init(GPIOSimChipClass *chip_class)
 	class->dispose = g_gpiosim_chip_dispose;
 	class->finalize = g_gpiosim_chip_finalize;
 
-	g_object_class_install_property(class, G_GPIOSIM_CHIP_PROP_DEV_PATH,
+	g_object_class_install_property(
+		class, G_GPIOSIM_CHIP_PROP_DEV_PATH,
 		g_param_spec_string("dev-path", "Device path",
-			"Character device filesystem path.", NULL,
-			G_PARAM_READABLE));
+				    "Character device filesystem path.", NULL,
+				    G_PARAM_READABLE));
 
-	g_object_class_install_property(class, G_GPIOSIM_CHIP_PROP_NAME,
-		g_param_spec_string("name", "Chip name",
+	g_object_class_install_property(
+		class, G_GPIOSIM_CHIP_PROP_NAME,
+		g_param_spec_string(
+			"name", "Chip name",
 			"Name of this chip device as set by the kernel.", NULL,
 			G_PARAM_READABLE));
 
-	g_object_class_install_property(class, G_GPIOSIM_CHIP_PROP_NUM_LINES,
+	g_object_class_install_property(
+		class, G_GPIOSIM_CHIP_PROP_NUM_LINES,
 		g_param_spec_uint("num-lines", "Number of lines",
-			"Number of lines this simulated chip exposes.",
-			1, G_MAXUINT, 1,
-			G_PARAM_WRITABLE | G_PARAM_CONSTRUCT_ONLY));
+				  "Number of lines this simulated chip exposes.",
+				  1, G_MAXUINT, 1,
+				  G_PARAM_WRITABLE | G_PARAM_CONSTRUCT_ONLY));
 
-	g_object_class_install_property(class, G_GPIOSIM_CHIP_PROP_LABEL,
+	g_object_class_install_property(
+		class, G_GPIOSIM_CHIP_PROP_LABEL,
 		g_param_spec_string("label", "Chip label",
-			"Label of this simulated chip.", NULL,
-			G_PARAM_WRITABLE | G_PARAM_CONSTRUCT_ONLY));
+				    "Label of this simulated chip.", NULL,
+				    G_PARAM_WRITABLE | G_PARAM_CONSTRUCT_ONLY));
 
-	g_object_class_install_property(class, G_GPIOSIM_CHIP_PROP_LINE_NAMES,
-		g_param_spec_variant("line-names", "Line names",
+	g_object_class_install_property(
+		class, G_GPIOSIM_CHIP_PROP_LINE_NAMES,
+		g_param_spec_variant(
+			"line-names", "Line names",
 			"List of names of the lines exposed by this chip",
 			(GVariantType *)"a(us)", NULL,
 			G_PARAM_WRITABLE | G_PARAM_CONSTRUCT_ONLY));
 
-	g_object_class_install_property(class, G_GPIOSIM_CHIP_PROP_HOGS,
-		g_param_spec_variant("hogs", "Line hogs",
+	g_object_class_install_property(
+		class, G_GPIOSIM_CHIP_PROP_HOGS,
+		g_param_spec_variant(
+			"hogs", "Line hogs",
 			"List of hogged lines and their directions.",
 			(GVariantType *)"a(usi)", NULL,
 			G_PARAM_WRITABLE | G_PARAM_CONSTRUCT_ONLY));
diff --git a/tests/gpiosim/gpiosim.c b/tests/gpiosim/gpiosim.c
index 5a8ec88..9e6c635 100644
--- a/tests/gpiosim/gpiosim.c
+++ b/tests/gpiosim/gpiosim.c
@@ -213,8 +213,7 @@ static void list_del(struct list_head *entry)
 	((type *)(__mptr - offsetof(type, member))); \
 })
 
-#define list_entry(ptr, type, member) \
-	container_of(ptr, type, member)
+#define list_entry(ptr, type, member) container_of(ptr, type, member)
 
 #define list_first_entry(ptr, type, member) \
 	list_entry((ptr)->next, type, member)
@@ -222,8 +221,7 @@ static void list_del(struct list_head *entry)
 #define list_next_entry(pos, member) \
 	list_entry((pos)->member.next, typeof(*(pos)), member)
 
-#define list_entry_is_head(pos, head, member) \
-	(&pos->member == (head))
+#define list_entry_is_head(pos, head, member) (&pos->member == (head))
 
 #define list_for_each_entry(pos, head, member) \
 	for (pos = list_first_entry(head, typeof(*pos), member); \
@@ -334,9 +332,9 @@ again:
 				goto out_unref_module;
 			}
 
-			ret = kmod_module_probe_insert_module(module,
-						KMOD_PROBE_IGNORE_LOADED,
-						NULL, NULL, NULL, NULL);
+			ret = kmod_module_probe_insert_module(
+				module, KMOD_PROBE_IGNORE_LOADED, NULL, NULL,
+				NULL, NULL);
 			if (ret)
 				goto out_unref_module;
 
@@ -577,8 +575,7 @@ static void dev_release(struct refcount *ref)
 	free(dev);
 }
 
-GPIOSIM_API struct gpiosim_dev *
-gpiosim_dev_new(struct gpiosim_ctx *ctx)
+GPIOSIM_API struct gpiosim_dev *gpiosim_dev_new(struct gpiosim_ctx *ctx)
 {
 	int configfs_fd, ret, id;
 	struct gpiosim_dev *dev;
@@ -855,8 +852,7 @@ static void bank_release(struct refcount *ref)
 	free(bank);
 }
 
-GPIOSIM_API struct gpiosim_bank*
-gpiosim_bank_new(struct gpiosim_dev *dev)
+GPIOSIM_API struct gpiosim_bank *gpiosim_bank_new(struct gpiosim_dev *dev)
 {
 	struct gpiosim_bank *bank;
 	int configfs_fd, id;
diff --git a/tests/gpiosim/gpiosim.h b/tests/gpiosim/gpiosim.h
index 80d437e..ab26900 100644
--- a/tests/gpiosim/gpiosim.h
+++ b/tests/gpiosim/gpiosim.h
@@ -37,8 +37,7 @@ struct gpiosim_ctx *gpiosim_ctx_new(void);
 struct gpiosim_ctx *gpiosim_ctx_ref(struct gpiosim_ctx *ctx);
 void gpiosim_ctx_unref(struct gpiosim_ctx *ctx);
 
-struct gpiosim_dev *
-gpiosim_dev_new(struct gpiosim_ctx *ctx);
+struct gpiosim_dev *gpiosim_dev_new(struct gpiosim_ctx *ctx);
 struct gpiosim_dev *gpiosim_dev_ref(struct gpiosim_dev *dev);
 void gpiosim_dev_unref(struct gpiosim_dev *dev);
 struct gpiosim_ctx *gpiosim_dev_get_ctx(struct gpiosim_dev *dev);
@@ -48,8 +47,7 @@ int gpiosim_dev_enable(struct gpiosim_dev *dev);
 int gpiosim_dev_disable(struct gpiosim_dev *dev);
 bool gpiosim_dev_is_live(struct gpiosim_dev *dev);
 
-struct gpiosim_bank*
-gpiosim_bank_new(struct gpiosim_dev *dev);
+struct gpiosim_bank *gpiosim_bank_new(struct gpiosim_dev *dev);
 struct gpiosim_bank *gpiosim_bank_ref(struct gpiosim_bank *bank);
 void gpiosim_bank_unref(struct gpiosim_bank *bank);
 struct gpiosim_dev *gpiosim_bank_get_dev(struct gpiosim_bank *bank);
diff --git a/tests/tests-chip-info.c b/tests/tests-chip-info.c
index 85477c6..c43cfbe 100644
--- a/tests/tests-chip-info.c
+++ b/tests/tests-chip-info.c
@@ -48,4 +48,3 @@ GPIOD_TEST_CASE(get_num_lines)
 
 	g_assert_cmpuint(gpiod_chip_info_get_num_lines(info), ==, 16);
 }
-
diff --git a/tests/tests-edge-event.c b/tests/tests-edge-event.c
index 66fe075..5eb275c 100644
--- a/tests/tests-edge-event.c
+++ b/tests/tests-edge-event.c
@@ -116,8 +116,7 @@ GPIOD_TEST_CASE(read_both_events)
 	line_cfg = gpiod_test_create_line_config_or_fail();
 	buffer = gpiod_test_create_edge_event_buffer_or_fail(64);
 
-	gpiod_line_settings_set_direction(settings,
-					  GPIOD_LINE_DIRECTION_INPUT);
+	gpiod_line_settings_set_direction(settings, GPIOD_LINE_DIRECTION_INPUT);
 	gpiod_line_settings_set_edge_detection(settings, GPIOD_LINE_EDGE_BOTH);
 
 	gpiod_test_line_config_add_line_settings_or_fail(line_cfg, &offset, 1,
@@ -144,8 +143,8 @@ GPIOD_TEST_CASE(read_both_events)
 	g_assert_nonnull(event);
 	gpiod_test_join_thread_and_return_if_failed(thread);
 
-	g_assert_cmpint(gpiod_edge_event_get_event_type(event),
-			==, GPIOD_EDGE_EVENT_RISING_EDGE);
+	g_assert_cmpint(gpiod_edge_event_get_event_type(event), ==,
+			GPIOD_EDGE_EVENT_RISING_EDGE);
 	g_assert_cmpuint(gpiod_edge_event_get_line_offset(event), ==, 2);
 	ts_rising = gpiod_edge_event_get_timestamp_ns(event);
 
@@ -164,8 +163,8 @@ GPIOD_TEST_CASE(read_both_events)
 	g_assert_nonnull(event);
 	gpiod_test_join_thread_and_return_if_failed(thread);
 
-	g_assert_cmpint(gpiod_edge_event_get_event_type(event),
-			==, GPIOD_EDGE_EVENT_FALLING_EDGE);
+	g_assert_cmpint(gpiod_edge_event_get_event_type(event), ==,
+			GPIOD_EDGE_EVENT_FALLING_EDGE);
 	g_assert_cmpuint(gpiod_edge_event_get_line_offset(event), ==, 2);
 	ts_falling = gpiod_edge_event_get_timestamp_ns(event);
 
@@ -193,8 +192,7 @@ GPIOD_TEST_CASE(read_rising_edge_event)
 	line_cfg = gpiod_test_create_line_config_or_fail();
 	buffer = gpiod_test_create_edge_event_buffer_or_fail(64);
 
-	gpiod_line_settings_set_direction(settings,
-					  GPIOD_LINE_DIRECTION_INPUT);
+	gpiod_line_settings_set_direction(settings, GPIOD_LINE_DIRECTION_INPUT);
 	gpiod_line_settings_set_edge_detection(settings,
 					       GPIOD_LINE_EDGE_RISING);
 
@@ -222,8 +220,8 @@ GPIOD_TEST_CASE(read_rising_edge_event)
 	g_assert_nonnull(event);
 	gpiod_test_join_thread_and_return_if_failed(thread);
 
-	g_assert_cmpint(gpiod_edge_event_get_event_type(event),
-			==, GPIOD_EDGE_EVENT_RISING_EDGE);
+	g_assert_cmpint(gpiod_edge_event_get_event_type(event), ==,
+			GPIOD_EDGE_EVENT_RISING_EDGE);
 	g_assert_cmpuint(gpiod_edge_event_get_line_offset(event), ==, 2);
 
 	/* Second event. */
@@ -253,8 +251,7 @@ GPIOD_TEST_CASE(read_falling_edge_event)
 	line_cfg = gpiod_test_create_line_config_or_fail();
 	buffer = gpiod_test_create_edge_event_buffer_or_fail(64);
 
-	gpiod_line_settings_set_direction(settings,
-					  GPIOD_LINE_DIRECTION_INPUT);
+	gpiod_line_settings_set_direction(settings, GPIOD_LINE_DIRECTION_INPUT);
 	gpiod_line_settings_set_edge_detection(settings,
 					       GPIOD_LINE_EDGE_FALLING);
 
@@ -282,8 +279,8 @@ GPIOD_TEST_CASE(read_falling_edge_event)
 	g_assert_nonnull(event);
 	gpiod_test_join_thread_and_return_if_failed(thread);
 
-	g_assert_cmpint(gpiod_edge_event_get_event_type(event),
-			==, GPIOD_EDGE_EVENT_FALLING_EDGE);
+	g_assert_cmpint(gpiod_edge_event_get_event_type(event), ==,
+			GPIOD_EDGE_EVENT_FALLING_EDGE);
 	g_assert_cmpuint(gpiod_edge_event_get_line_offset(event), ==, 2);
 
 	/* No more events. */
@@ -315,8 +312,7 @@ GPIOD_TEST_CASE(read_rising_edge_event_polled)
 	line_cfg = gpiod_test_create_line_config_or_fail();
 	buffer = gpiod_test_create_edge_event_buffer_or_fail(64);
 
-	gpiod_line_settings_set_direction(settings,
-					  GPIOD_LINE_DIRECTION_INPUT);
+	gpiod_line_settings_set_direction(settings, GPIOD_LINE_DIRECTION_INPUT);
 	gpiod_line_settings_set_edge_detection(settings,
 					       GPIOD_LINE_EDGE_RISING);
 
@@ -353,8 +349,8 @@ GPIOD_TEST_CASE(read_rising_edge_event_polled)
 	g_assert_nonnull(event);
 	gpiod_test_join_thread_and_return_if_failed(thread);
 
-	g_assert_cmpint(gpiod_edge_event_get_event_type(event),
-			==, GPIOD_EDGE_EVENT_RISING_EDGE);
+	g_assert_cmpint(gpiod_edge_event_get_event_type(event), ==,
+			GPIOD_EDGE_EVENT_RISING_EDGE);
 	g_assert_cmpuint(gpiod_edge_event_get_line_offset(event), ==, 2);
 
 	/* Second event. */
@@ -389,8 +385,7 @@ GPIOD_TEST_CASE(read_both_events_blocking)
 	line_cfg = gpiod_test_create_line_config_or_fail();
 	buffer = gpiod_test_create_edge_event_buffer_or_fail(64);
 
-	gpiod_line_settings_set_direction(settings,
-					  GPIOD_LINE_DIRECTION_INPUT);
+	gpiod_line_settings_set_direction(settings, GPIOD_LINE_DIRECTION_INPUT);
 	gpiod_line_settings_set_edge_detection(settings, GPIOD_LINE_EDGE_BOTH);
 
 	gpiod_test_line_config_add_line_settings_or_fail(line_cfg, &offset, 1,
@@ -413,8 +408,8 @@ GPIOD_TEST_CASE(read_both_events_blocking)
 	g_assert_nonnull(event);
 	gpiod_test_join_thread_and_return_if_failed(thread);
 
-	g_assert_cmpint(gpiod_edge_event_get_event_type(event),
-			==, GPIOD_EDGE_EVENT_RISING_EDGE);
+	g_assert_cmpint(gpiod_edge_event_get_event_type(event), ==,
+			GPIOD_EDGE_EVENT_RISING_EDGE);
 	g_assert_cmpuint(gpiod_edge_event_get_line_offset(event), ==, 2);
 
 	/* Second event. */
@@ -428,8 +423,8 @@ GPIOD_TEST_CASE(read_both_events_blocking)
 	g_assert_nonnull(event);
 	gpiod_test_join_thread_and_return_if_failed(thread);
 
-	g_assert_cmpint(gpiod_edge_event_get_event_type(event),
-			==, GPIOD_EDGE_EVENT_FALLING_EDGE);
+	g_assert_cmpint(gpiod_edge_event_get_event_type(event), ==,
+			GPIOD_EDGE_EVENT_FALLING_EDGE);
 	g_assert_cmpuint(gpiod_edge_event_get_line_offset(event), ==, 2);
 
 	g_thread_join(thread);
@@ -469,8 +464,7 @@ GPIOD_TEST_CASE(seqno)
 	line_cfg = gpiod_test_create_line_config_or_fail();
 	buffer = gpiod_test_create_edge_event_buffer_or_fail(64);
 
-	gpiod_line_settings_set_direction(settings,
-					  GPIOD_LINE_DIRECTION_INPUT);
+	gpiod_line_settings_set_direction(settings, GPIOD_LINE_DIRECTION_INPUT);
 	gpiod_line_settings_set_edge_detection(settings, GPIOD_LINE_EDGE_BOTH);
 
 	gpiod_test_line_config_add_line_settings_or_fail(line_cfg, offsets, 2,
@@ -541,8 +535,7 @@ GPIOD_TEST_CASE(event_copy)
 	line_cfg = gpiod_test_create_line_config_or_fail();
 	buffer = gpiod_test_create_edge_event_buffer_or_fail(64);
 
-	gpiod_line_settings_set_direction(settings,
-					  GPIOD_LINE_DIRECTION_INPUT);
+	gpiod_line_settings_set_direction(settings, GPIOD_LINE_DIRECTION_INPUT);
 	gpiod_line_settings_set_edge_detection(settings, GPIOD_LINE_EDGE_BOTH);
 
 	gpiod_test_line_config_add_line_settings_or_fail(line_cfg, &offset, 1,
@@ -587,8 +580,7 @@ GPIOD_TEST_CASE(reading_more_events_than_the_queue_contains_doesnt_block)
 	line_cfg = gpiod_test_create_line_config_or_fail();
 	buffer = gpiod_test_create_edge_event_buffer_or_fail(64);
 
-	gpiod_line_settings_set_direction(settings,
-					  GPIOD_LINE_DIRECTION_INPUT);
+	gpiod_line_settings_set_direction(settings, GPIOD_LINE_DIRECTION_INPUT);
 	gpiod_line_settings_set_edge_detection(settings, GPIOD_LINE_EDGE_BOTH);
 
 	gpiod_test_line_config_add_line_settings_or_fail(line_cfg, &offset, 1,
diff --git a/tests/tests-info-event.c b/tests/tests-info-event.c
index a960ba9..a0cf5b6 100644
--- a/tests/tests-info-event.c
+++ b/tests/tests-info-event.c
@@ -199,7 +199,7 @@ GPIOD_TEST_CASE(request_reconfigure_release_events)
 }
 
 GPIOD_TEST_CASE(chip_fd_can_be_polled)
-{\
+{
 	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
 	g_autoptr(struct_gpiod_chip) chip = NULL;
 	g_autoptr(struct_gpiod_line_info) info = NULL;
diff --git a/tests/tests-line-config.c b/tests/tests-line-config.c
index 27cc228..5dc9022 100644
--- a/tests/tests-line-config.c
+++ b/tests/tests-line-config.c
@@ -110,7 +110,7 @@ GPIOD_TEST_CASE(too_many_attrs)
 							 settings);
 
 	gpiod_line_settings_set_event_clock(settings,
-					     GPIOD_LINE_EVENT_CLOCK_REALTIME);
+					    GPIOD_LINE_EVENT_CLOCK_REALTIME);
 	offset = 7;
 	gpiod_test_line_config_add_line_settings_or_fail(line_cfg, &offset, 1,
 							 settings);
diff --git a/tests/tests-line-info.c b/tests/tests-line-info.c
index 8ec1b1b..4751db2 100644
--- a/tests/tests-line-info.c
+++ b/tests/tests-line-info.c
@@ -66,11 +66,9 @@ GPIOD_TEST_CASE(line_info_basic_properties)
 	g_autoptr(struct_gpiod_line_info) info4 = NULL;
 	g_autoptr(struct_gpiod_line_info) info6 = NULL;
 
-	sim = g_gpiosim_chip_new(
-			"num-lines", 8,
-			"line-names", gpiod_test_package_line_names(names),
-			"hogs", gpiod_test_package_hogs(hogs),
-			NULL);
+	sim = g_gpiosim_chip_new("num-lines", 8, "line-names",
+				 gpiod_test_package_line_names(names), "hogs",
+				 gpiod_test_package_hogs(hogs), NULL);
 
 	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
 	info4 = gpiod_test_get_line_info_or_fail(chip, 4);
@@ -137,8 +135,7 @@ GPIOD_TEST_CASE(direction_settings)
 	offset = 1;
 	gpiod_test_line_config_add_line_settings_or_fail(line_cfg, &offset, 1,
 							 settings);
-	gpiod_line_settings_set_direction(settings,
-					  GPIOD_LINE_DIRECTION_AS_IS);
+	gpiod_line_settings_set_direction(settings, GPIOD_LINE_DIRECTION_AS_IS);
 	offset = 2;
 	gpiod_test_line_config_add_line_settings_or_fail(line_cfg, &offset, 1,
 							 settings);
@@ -202,7 +199,8 @@ GPIOD_TEST_CASE(edge_detection_settings)
 	offset = 0;
 	gpiod_test_line_config_add_line_settings_or_fail(line_cfg, &offset, 1,
 							 settings);
-	gpiod_line_settings_set_edge_detection(settings, GPIOD_LINE_EDGE_RISING);
+	gpiod_line_settings_set_edge_detection(settings,
+					       GPIOD_LINE_EDGE_RISING);
 	offset = 1;
 	gpiod_test_line_config_add_line_settings_or_fail(line_cfg, &offset, 1,
 							 settings);
@@ -249,7 +247,8 @@ GPIOD_TEST_CASE(bias_settings)
 	settings = gpiod_test_create_line_settings_or_fail();
 	line_cfg = gpiod_test_create_line_config_or_fail();
 
-	gpiod_line_settings_set_direction(settings,GPIOD_LINE_DIRECTION_OUTPUT);
+	gpiod_line_settings_set_direction(settings,
+					  GPIOD_LINE_DIRECTION_OUTPUT);
 	offset = 0;
 	gpiod_test_line_config_add_line_settings_or_fail(line_cfg, &offset, 1,
 							 settings);
@@ -349,8 +348,8 @@ GPIOD_TEST_CASE(debounce_period)
 	request = gpiod_test_request_lines_or_fail(chip, NULL, line_cfg);
 	info = gpiod_test_get_line_info_or_fail(chip, 5);
 
-	g_assert_cmpuint(gpiod_line_info_get_debounce_period_us(info),
-			 ==, 1000);
+	g_assert_cmpuint(gpiod_line_info_get_debounce_period_us(info), ==,
+			 1000);
 }
 
 GPIOD_TEST_CASE(event_clock)
@@ -391,7 +390,7 @@ GPIOD_TEST_CASE(event_clock)
 	}
 
 	gpiod_test_return_if_failed();
-	
+
 	info0 = gpiod_test_get_line_info_or_fail(chip, 0);
 	info1 = gpiod_test_get_line_info_or_fail(chip, 1);
 	info2 = gpiod_test_get_line_info_or_fail(chip, 2);
diff --git a/tests/tests-line-request.c b/tests/tests-line-request.c
index 6cf85ab..2c2af01 100644
--- a/tests/tests-line-request.c
+++ b/tests/tests-line-request.c
@@ -156,8 +156,8 @@ GPIOD_TEST_CASE(default_output_value)
 	request = gpiod_test_request_lines_or_fail(chip, NULL, line_cfg);
 
 	for (i = 0; i < 4; i++)
-		g_assert_cmpint(g_gpiosim_chip_get_value(sim, offsets[i]),
-				==, GPIOD_LINE_VALUE_ACTIVE);
+		g_assert_cmpint(g_gpiosim_chip_get_value(sim, offsets[i]), ==,
+				GPIOD_LINE_VALUE_ACTIVE);
 
 	g_assert_cmpint(g_gpiosim_chip_get_value(sim, 2), ==,
 			GPIOD_LINE_VALUE_INACTIVE);
@@ -189,7 +189,8 @@ GPIOD_TEST_CASE(read_all_values)
 
 	for (i = 0; i < 5; i++)
 		g_gpiosim_chip_set_pull(sim, offsets[i],
-			pulls[i] ? G_GPIOSIM_PULL_UP : G_GPIOSIM_PULL_DOWN);
+					pulls[i] ? G_GPIOSIM_PULL_UP :
+						   G_GPIOSIM_PULL_DOWN);
 
 	ret = gpiod_line_request_get_values(request, values);
 	g_assert_cmpint(ret, ==, 0);
@@ -224,7 +225,8 @@ GPIOD_TEST_CASE(request_multiple_values_but_read_one)
 
 	for (i = 0; i < 5; i++)
 		g_gpiosim_chip_set_pull(sim, offsets[i],
-			pulls[i] ? G_GPIOSIM_PULL_UP : G_GPIOSIM_PULL_DOWN);
+					pulls[i] ? G_GPIOSIM_PULL_UP :
+						   G_GPIOSIM_PULL_DOWN);
 
 	ret = gpiod_line_request_get_value(request, 5);
 	g_assert_cmpint(ret, ==, 1);
@@ -265,8 +267,8 @@ GPIOD_TEST_CASE(set_all_values)
 	gpiod_test_return_if_failed();
 
 	for (i = 0; i < 5; i++)
-		g_assert_cmpint(g_gpiosim_chip_get_value(sim, offsets[i]),
-				==, values[i]);
+		g_assert_cmpint(g_gpiosim_chip_get_value(sim, offsets[i]), ==,
+				values[i]);
 }
 
 GPIOD_TEST_CASE(set_values_subset_of_lines)
@@ -297,17 +299,17 @@ GPIOD_TEST_CASE(set_values_subset_of_lines)
 
 	request = gpiod_test_request_lines_or_fail(chip, NULL, line_cfg);
 
-	ret = gpiod_line_request_set_values_subset(request, 3,
-						   offsets_to_set, values);
+	ret = gpiod_line_request_set_values_subset(request, 3, offsets_to_set,
+						   values);
 	g_assert_cmpint(ret, ==, 0);
 	gpiod_test_return_if_failed();
 
-	g_assert_cmpint(g_gpiosim_chip_get_value(sim, 0),
-			==, GPIOD_LINE_VALUE_ACTIVE);
-	g_assert_cmpint(g_gpiosim_chip_get_value(sim, 1),
-			==, GPIOD_LINE_VALUE_INACTIVE);
-	g_assert_cmpint(g_gpiosim_chip_get_value(sim, 3),
-			==, GPIOD_LINE_VALUE_ACTIVE);
+	g_assert_cmpint(g_gpiosim_chip_get_value(sim, 0), ==,
+			GPIOD_LINE_VALUE_ACTIVE);
+	g_assert_cmpint(g_gpiosim_chip_get_value(sim, 1), ==,
+			GPIOD_LINE_VALUE_INACTIVE);
+	g_assert_cmpint(g_gpiosim_chip_get_value(sim, 3), ==,
+			GPIOD_LINE_VALUE_ACTIVE);
 }
 
 GPIOD_TEST_CASE(set_line_after_requesting)
@@ -358,8 +360,7 @@ GPIOD_TEST_CASE(request_survives_parent_chip)
 
 	gpiod_line_settings_set_direction(settings,
 					  GPIOD_LINE_DIRECTION_OUTPUT);
-	gpiod_line_settings_set_output_value(settings,
-					     GPIOD_LINE_VALUE_ACTIVE);
+	gpiod_line_settings_set_output_value(settings, GPIOD_LINE_VALUE_ACTIVE);
 	gpiod_test_line_config_add_line_settings_or_fail(line_cfg, &offset, 1,
 							 settings);
 
diff --git a/tests/tests-line-settings.c b/tests/tests-line-settings.c
index bdf932d..e6c0277 100644
--- a/tests/tests-line-settings.c
+++ b/tests/tests-line-settings.c
@@ -26,7 +26,7 @@ GPIOD_TEST_CASE(default_config)
 			GPIOD_LINE_DRIVE_PUSH_PULL);
 	g_assert_false(gpiod_line_settings_get_active_low(settings));
 	g_assert_cmpuint(gpiod_line_settings_get_debounce_period_us(settings),
-			==, 0);
+			 ==, 0);
 	g_assert_cmpint(gpiod_line_settings_get_event_clock(settings), ==,
 			GPIOD_LINE_EVENT_CLOCK_MONOTONIC);
 	g_assert_cmpint(gpiod_line_settings_get_output_value(settings), ==,
@@ -110,26 +110,22 @@ GPIOD_TEST_CASE(set_bias)
 
 	settings = gpiod_test_create_line_settings_or_fail();
 
-	ret = gpiod_line_settings_set_bias(settings,
-					   GPIOD_LINE_BIAS_DISABLED);
+	ret = gpiod_line_settings_set_bias(settings, GPIOD_LINE_BIAS_DISABLED);
 	g_assert_cmpint(ret, ==, 0);
 	g_assert_cmpint(gpiod_line_settings_get_bias(settings), ==,
 			GPIOD_LINE_BIAS_DISABLED);
 
-	ret = gpiod_line_settings_set_bias(settings,
-					   GPIOD_LINE_BIAS_AS_IS);
+	ret = gpiod_line_settings_set_bias(settings, GPIOD_LINE_BIAS_AS_IS);
 	g_assert_cmpint(ret, ==, 0);
 	g_assert_cmpint(gpiod_line_settings_get_bias(settings), ==,
 			GPIOD_LINE_BIAS_AS_IS);
 
-	ret = gpiod_line_settings_set_bias(settings,
-					   GPIOD_LINE_BIAS_PULL_DOWN);
+	ret = gpiod_line_settings_set_bias(settings, GPIOD_LINE_BIAS_PULL_DOWN);
 	g_assert_cmpint(ret, ==, 0);
 	g_assert_cmpint(gpiod_line_settings_get_bias(settings), ==,
 			GPIOD_LINE_BIAS_PULL_DOWN);
 
-	ret = gpiod_line_settings_set_bias(settings,
-					   GPIOD_LINE_BIAS_PULL_UP);
+	ret = gpiod_line_settings_set_bias(settings, GPIOD_LINE_BIAS_PULL_UP);
 	g_assert_cmpint(ret, ==, 0);
 	g_assert_cmpint(gpiod_line_settings_get_bias(settings), ==,
 			GPIOD_LINE_BIAS_PULL_UP);
@@ -312,7 +308,7 @@ GPIOD_TEST_CASE(reset_settings)
 			GPIOD_LINE_DRIVE_PUSH_PULL);
 	g_assert_false(gpiod_line_settings_get_active_low(settings));
 	g_assert_cmpuint(gpiod_line_settings_get_debounce_period_us(settings),
-			==, 0);
+			 ==, 0);
 	g_assert_cmpint(gpiod_line_settings_get_event_clock(settings), ==,
 			GPIOD_LINE_EVENT_CLOCK_MONOTONIC);
 	g_assert_cmpint(gpiod_line_settings_get_output_value(settings), ==,
diff --git a/tests/tests-request-config.c b/tests/tests-request-config.c
index f26c05a..71fccde 100644
--- a/tests/tests-request-config.c
+++ b/tests/tests-request-config.c
@@ -16,8 +16,8 @@ GPIOD_TEST_CASE(default_config)
 	config = gpiod_test_create_request_config_or_fail();
 
 	g_assert_null(gpiod_request_config_get_consumer(config));
-	g_assert_cmpuint(gpiod_request_config_get_event_buffer_size(config),
-			 ==, 0);
+	g_assert_cmpuint(gpiod_request_config_get_event_buffer_size(config), ==,
+			 0);
 }
 
 GPIOD_TEST_CASE(set_consumer)
@@ -27,8 +27,8 @@ GPIOD_TEST_CASE(set_consumer)
 	config = gpiod_test_create_request_config_or_fail();
 
 	gpiod_request_config_set_consumer(config, "foobar");
-	g_assert_cmpstr(gpiod_request_config_get_consumer(config),
-			==, "foobar");
+	g_assert_cmpstr(gpiod_request_config_get_consumer(config), ==,
+			"foobar");
 }
 
 GPIOD_TEST_CASE(set_event_buffer_size)
@@ -38,6 +38,6 @@ GPIOD_TEST_CASE(set_event_buffer_size)
 	config = gpiod_test_create_request_config_or_fail();
 
 	gpiod_request_config_set_event_buffer_size(config, 128);
-	g_assert_cmpuint(gpiod_request_config_get_event_buffer_size(config),
-			 ==, 128);
+	g_assert_cmpuint(gpiod_request_config_get_event_buffer_size(config), ==,
+			 128);
 }
diff --git a/tools/gpiodetect.c b/tools/gpiodetect.c
index 671ed6a..f0211da 100644
--- a/tools/gpiodetect.c
+++ b/tools/gpiodetect.c
@@ -74,8 +74,7 @@ static int print_chip_info(const char *path)
 	if (!info)
 		die_perror("unable to read info for '%s'", path);
 
-	printf("%s [%s] (%zu lines)\n",
-	       gpiod_chip_info_get_name(info),
+	printf("%s [%s] (%zu lines)\n", gpiod_chip_info_get_name(info),
 	       gpiod_chip_info_get_label(info),
 	       gpiod_chip_info_get_num_lines(info));
 
diff --git a/tools/gpioinfo.c b/tools/gpioinfo.c
index 592f4a6..1ec7f63 100644
--- a/tools/gpioinfo.c
+++ b/tools/gpioinfo.c
@@ -100,7 +100,7 @@ static int parse_config(int argc, char **argv, struct config *cfg)
  * Does not die on non-unique lines.
  */
 static bool resolve_line(struct line_resolver *resolver,
-			  struct gpiod_line_info *info, int chip_num)
+			 struct gpiod_line_info *info, int chip_num)
 {
 	struct resolved_line *line;
 	bool resolved = false;
@@ -114,8 +114,7 @@ static bool resolve_line(struct line_resolver *resolver,
 		line = &resolver->lines[i];
 
 		/* already resolved by offset? */
-		if (line->resolved &&
-		    (line->offset == offset) &&
+		if (line->resolved && (line->offset == offset) &&
 		    (line->chip_num == chip_num)) {
 			resolved = true;
 		}
@@ -187,9 +186,8 @@ static void list_lines(struct line_resolver *resolver, struct gpiod_chip *chip,
 	if ((chip_num == 0) && (cfg->chip_id && !cfg->by_name))
 		resolve_lines_by_offset(resolver, num_lines);
 
-	for (offset = 0;
-	     ((offset < num_lines) &&
-	      !(resolver->num_lines && resolve_done(resolver)));
+	for (offset = 0; ((offset < num_lines) &&
+			  !(resolver->num_lines && resolve_done(resolver)));
 	     offset++) {
 		info = gpiod_chip_get_line_info(chip, offset);
 		if (!info)
@@ -238,7 +236,7 @@ int main(int argc, char **argv)
 		cfg.by_name = true;
 
 	num_chips = chip_paths(cfg.chip_id, &paths);
-	if (cfg.chip_id  && (num_chips == 0))
+	if (cfg.chip_id && (num_chips == 0))
 		die("cannot find GPIO chip character device '%s'", cfg.chip_id);
 
 	resolver = resolver_init(argc, argv, num_chips, cfg.strict,
diff --git a/tools/gpiomon.c b/tools/gpiomon.c
index dc157df..ba457e4 100644
--- a/tools/gpiomon.c
+++ b/tools/gpiomon.c
@@ -210,7 +210,7 @@ static int parse_config(int argc, char **argv, struct config *cfg)
 		else
 			cfg->event_clock = GPIOD_LINE_EVENT_CLOCK_MONOTONIC;
 	} else if ((cfg->event_clock == GPIOD_LINE_EVENT_CLOCK_REALTIME) &&
-		 (cfg->timestamp_fmt == 0)) {
+		   (cfg->timestamp_fmt == 0)) {
 		cfg->timestamp_fmt = 1;
 	}
 
@@ -234,8 +234,8 @@ static void print_banner(int num_lines, char **lines)
 }
 
 static void event_print_formatted(struct gpiod_edge_event *event,
-			struct line_resolver *resolver, int chip_num,
-			struct config *cfg)
+				  struct line_resolver *resolver, int chip_num,
+				  struct config *cfg)
 {
 	const char *lname, *prev, *curr;
 	unsigned int offset;
@@ -381,8 +381,8 @@ int main(int argc, char **argv)
 		gpiod_line_settings_set_active_low(settings, true);
 
 	if (cfg.debounce_period_us)
-		gpiod_line_settings_set_debounce_period_us(settings,
-					cfg.debounce_period_us);
+		gpiod_line_settings_set_debounce_period_us(
+			settings, cfg.debounce_period_us);
 
 	gpiod_line_settings_set_event_clock(settings, cfg.event_clock);
 	gpiod_line_settings_set_edge_detection(settings, cfg.edges);
@@ -484,4 +484,3 @@ done:
 
 	return EXIT_SUCCESS;
 }
-
diff --git a/tools/gpionotify.c b/tools/gpionotify.c
index 2367495..a0976f7 100644
--- a/tools/gpionotify.c
+++ b/tools/gpionotify.c
@@ -216,7 +216,7 @@ static uint64_t monotonic_to_realtime(uint64_t evtime)
 	clock_gettime(CLOCK_REALTIME, &ts);
 	after = ts.tv_nsec + ((uint64_t)ts.tv_sec) * 1000000000;
 
-	evtime += (after/2 - mono + before/2);
+	evtime += (after / 2 - mono + before / 2);
 
 	return evtime;
 }
@@ -230,7 +230,7 @@ static void event_print_formatted(struct gpiod_info_event *event,
 	unsigned int offset;
 	uint64_t evtime;
 	int evtype;
-	char  fmt;
+	char fmt;
 
 	info = gpiod_info_event_get_line_info(event);
 	evtime = gpiod_info_event_get_timestamp_ns(event);
@@ -310,8 +310,8 @@ end:
 }
 
 static void event_print_human_readable(struct gpiod_info_event *event,
-			struct line_resolver *resolver, int chip_num,
-			struct config *cfg)
+				       struct line_resolver *resolver,
+				       int chip_num, struct config *cfg)
 {
 	struct gpiod_line_info *info;
 	unsigned int offset;
@@ -397,7 +397,7 @@ int main(int argc, char **argv)
 		for (j = 0; j < resolver->num_lines; j++)
 			if ((resolver->lines[j].chip_num == i) &&
 			    !gpiod_chip_watch_line_info(
-					chip, resolver->lines[j].offset))
+				    chip, resolver->lines[j].offset))
 				die_perror("unable to watch line on chip '%s'",
 					   resolver->chips[i].path);
 
diff --git a/tools/gpioset.c b/tools/gpioset.c
index a32c894..698dba3 100644
--- a/tools/gpioset.c
+++ b/tools/gpioset.c
@@ -278,7 +278,6 @@ static bool parse_line_values(int num_lines, char **lvs, char **lines,
 				*value = '\0';
 				value++;
 			}
-
 		}
 
 		if (!value) {
@@ -352,8 +351,8 @@ static void wait_fd(int fd)
  * offset and values are scratch pads for working.
  */
 static void apply_values(struct gpiod_line_request **requests,
-			 struct line_resolver *resolver,
-			 unsigned int *offsets, enum gpiod_line_value *values)
+			 struct line_resolver *resolver, unsigned int *offsets,
+			 enum gpiod_line_value *values)
 {
 	int i;
 
@@ -380,9 +379,10 @@ static void toggle_all_lines(struct line_resolver *resolver)
  * offset and values are scratch pads for working.
  */
 static void toggle_sequence(int toggles, unsigned int *toggle_periods,
-			 struct gpiod_line_request **requests,
-			 struct line_resolver *resolver,
-			 unsigned int *offsets, enum gpiod_line_value *values)
+			    struct gpiod_line_request **requests,
+			    struct line_resolver *resolver,
+			    unsigned int *offsets,
+			    enum gpiod_line_value *values)
 {
 	int i = 0;
 
@@ -537,7 +537,7 @@ static bool valid_lines(struct line_resolver *resolver, int num_lines,
 		}
 	}
 
-	return  ret;
+	return ret;
 }
 
 static void print_interactive_help(void)
@@ -639,8 +639,7 @@ static char *complete_line_id(const char *text, int state)
 		id = completion_context->lines[idx].id;
 		idx++;
 
-		if ((strncmp(id, text, len) == 0) &&
-		    (!in_line_buffer(id)))
+		if ((strncmp(id, text, len) == 0) && (!in_line_buffer(id)))
 			return strdup(id);
 	}
 
@@ -708,16 +707,14 @@ static char **tab_completion(const char *text, int start, int end)
 	rl_completion_append_character = ' ';
 
 	for (cmd_start = 0;
-	     isspace(rl_line_buffer[cmd_start]) && cmd_start < end;
-	     cmd_start++)
+	     isspace(rl_line_buffer[cmd_start]) && cmd_start < end; cmd_start++)
 		;
 
 	if (cmd_start == start)
 		matches = rl_completion_matches(text, complete_command);
 
 	for (cmd_end = cmd_start + 1;
-	     !isspace(rl_line_buffer[cmd_end]) && cmd_end < end;
-	     cmd_end++)
+	     !isspace(rl_line_buffer[cmd_end]) && cmd_end < end; cmd_end++)
 		;
 
 	len = cmd_end - cmd_start;
@@ -731,7 +728,8 @@ static char **tab_completion(const char *text, int start, int end)
 	}
 
 	if ((len == 3 && strncmp("get ", &rl_line_buffer[cmd_start], 4) == 0) ||
-	    (len == 6 && strncmp("toggle ", &rl_line_buffer[cmd_start], 7) == 0))
+	    (len == 6 &&
+	     strncmp("toggle ", &rl_line_buffer[cmd_start], 7) == 0))
 		matches = rl_completion_matches(text, complete_line_id);
 
 	return matches;
@@ -740,9 +738,9 @@ static char **tab_completion(const char *text, int start, int end)
 #define PROMPT "gpioset> "
 
 static void interact(struct gpiod_line_request **requests,
-		    struct line_resolver *resolver,
-		    char **lines, unsigned int *offsets,
-		    enum gpiod_line_value *values, bool unquoted)
+		     struct line_resolver *resolver, char **lines,
+		     unsigned int *offsets, enum gpiod_line_value *values,
+		     bool unquoted)
 {
 	int num_words, num_lines, max_words, period_us, i;
 	char *line, **words, *line_buf;
@@ -788,8 +786,8 @@ static void interact(struct gpiod_line_request **requests,
 				print_all_line_values(resolver, unquoted);
 			else if (parse_line_ids(num_lines, &words[1], lines) &&
 				 valid_lines(resolver, num_lines, lines))
-				print_line_values(resolver, num_lines,
-						  lines, unquoted);
+				print_line_values(resolver, num_lines, lines,
+						  unquoted);
 			goto cmd_ok;
 		}
 		if (strcmp(words[0], "set") == 0) {
@@ -844,8 +842,7 @@ static void interact(struct gpiod_line_request **requests,
 		}
 
 		printf("unknown command: '%s'\n", words[0]);
-		printf("Try the 'help' command\n")
-			;
+		printf("Try the 'help' command\n");
 
 cmd_ok:
 		for (i = 0; isspace(line[i]); i++)
@@ -932,16 +929,16 @@ int main(int argc, char **argv)
 		die_perror("unable to allocate the line config structure");
 
 	for (i = 0; i < resolver->num_chips; i++) {
-		num_lines = get_line_offsets_and_values(resolver, i,
-							offsets, values);
+		num_lines = get_line_offsets_and_values(resolver, i, offsets,
+							values);
 
 		gpiod_line_config_reset(line_cfg);
 		for (j = 0; j < num_lines; j++) {
 			gpiod_line_settings_set_output_value(settings,
 							     values[j]);
 
-			ret = gpiod_line_config_add_line_settings(line_cfg,
-					 &offsets[j], 1, settings);
+			ret = gpiod_line_config_add_line_settings(
+				line_cfg, &offsets[j], 1, settings);
 			if (ret)
 				die_perror("unable to add line settings");
 		}
@@ -1007,4 +1004,3 @@ int main(int argc, char **argv)
 
 	return EXIT_SUCCESS;
 }
-
diff --git a/tools/tools-common.c b/tools/tools-common.c
index 6dbcf57..4477ac8 100644
--- a/tools/tools-common.c
+++ b/tools/tools-common.c
@@ -214,10 +214,10 @@ void print_event_time(uint64_t evtime, int format)
 			tz = "Z";
 		}
 		strftime(tbuf, TIME_BUFFER_SIZE, "%FT%T", &t);
-		printf("%s.%09"PRIu64"%s", tbuf, evtime % 1000000000, tz);
+		printf("%s.%09" PRIu64 "%s", tbuf, evtime % 1000000000, tz);
 	} else {
-		printf("%"PRIu64".%09"PRIu64,
-		       evtime / 1000000000, evtime % 1000000000);
+		printf("%" PRIu64 ".%09" PRIu64, evtime / 1000000000,
+		       evtime % 1000000000);
 	}
 }
 
@@ -380,8 +380,7 @@ static int chip_dir_filter(const struct dirent *entry)
 	if (asprintf(&path, "/dev/%s", entry->d_name) < 0)
 		return 0;
 
-	if ((lstat(path, &sb) == 0) &&
-	    (!S_ISLNK(sb.st_mode)) &&
+	if ((lstat(path, &sb) == 0) && (!S_ISLNK(sb.st_mode)) &&
 	    gpiod_is_gpiochip_device(path))
 		ret = 1;
 
@@ -482,8 +481,7 @@ int all_chip_paths(char ***paths_ptr)
 }
 
 static bool resolve_line(struct line_resolver *resolver,
-			  struct gpiod_line_info *info,
-			  int chip_num)
+			 struct gpiod_line_info *info, int chip_num)
 {
 	struct resolved_line *line;
 	bool resolved = false;
@@ -495,8 +493,7 @@ static bool resolve_line(struct line_resolver *resolver,
 	for (i = 0; i < resolver->num_lines; i++) {
 		line = &resolver->lines[i];
 		/* already resolved by offset? */
-		if (line->resolved &&
-		    (line->offset == offset) &&
+		if (line->resolved && (line->offset == offset) &&
 		    (line->chip_num == chip_num)) {
 			line->info = info;
 			resolver->num_found++;
@@ -548,7 +545,6 @@ bool resolve_lines_by_offset(struct line_resolver *resolver,
 	return used;
 }
 
-
 bool resolve_done(struct line_resolver *resolver)
 {
 	return (!resolver->strict &&
@@ -588,7 +584,8 @@ struct line_resolver *resolver_init(int num_lines, char **lines, int num_chips,
 }
 
 struct line_resolver *resolve_lines(int num_lines, char **lines,
-			const char *chip_id, bool strict, bool by_name)
+				    const char *chip_id, bool strict,
+				    bool by_name)
 {
 	struct gpiod_chip_info *chip_info;
 	struct gpiod_line_info *line_info;
@@ -602,7 +599,7 @@ struct line_resolver *resolve_lines(int num_lines, char **lines,
 		by_name = true;
 
 	num_chips = chip_paths(chip_id, &paths);
-	if (chip_id  && (num_chips == 0))
+	if (chip_id && (num_chips == 0))
 		die("cannot find GPIO chip character device '%s'", chip_id);
 
 	resolver = resolver_init(num_lines, lines, num_chips, strict, by_name);
@@ -666,7 +663,7 @@ void validate_resolution(struct line_resolver *resolver, const char *chip_id)
 	bool valid = true;
 	int i, j;
 
-	for (i = 0 ; i < resolver->num_lines; i++) {
+	for (i = 0; i < resolver->num_lines; i++) {
 		line = &resolver->lines[i];
 		if (line->resolved) {
 			for (j = 0; j < i; j++) {
@@ -712,8 +709,8 @@ void free_line_resolver(struct line_resolver *resolver)
 	free(resolver);
 }
 
-int get_line_offsets_and_values(struct line_resolver *resolver,
-				int chip_num, unsigned int *offsets,
+int get_line_offsets_and_values(struct line_resolver *resolver, int chip_num,
+				unsigned int *offsets,
 				enum gpiod_line_value *values)
 {
 	struct resolved_line *line;
@@ -738,8 +735,8 @@ const char *get_chip_name(struct line_resolver *resolver, int chip_num)
 	return gpiod_chip_info_get_name(resolver->chips[chip_num].info);
 }
 
-const char *get_line_name(struct line_resolver *resolver,
-			  int chip_num, unsigned int offset)
+const char *get_line_name(struct line_resolver *resolver, int chip_num,
+			  unsigned int offset)
 {
 	struct resolved_line *line;
 	int i;
@@ -748,7 +745,8 @@ const char *get_line_name(struct line_resolver *resolver,
 		line = &resolver->lines[i];
 		if (line->info && (line->offset == offset) &&
 		    (line->chip_num == chip_num))
-			return gpiod_line_info_get_name(resolver->lines[i].info);
+			return gpiod_line_info_get_name(
+				resolver->lines[i].info);
 	}
 
 	return 0;
diff --git a/tools/tools-common.h b/tools/tools-common.h
index d467197..efbeeb8 100644
--- a/tools/tools-common.h
+++ b/tools/tools-common.h
@@ -102,7 +102,8 @@ bool chip_path_lookup(const char *id, char **path_ptr);
 int chip_paths(const char *id, char ***paths_ptr);
 int all_chip_paths(char ***paths_ptr);
 struct line_resolver *resolve_lines(int num_lines, char **lines,
-		const char *chip_id, bool strict, bool by_name);
+				    const char *chip_id, bool strict,
+				    bool by_name);
 struct line_resolver *resolver_init(int num_lines, char **lines, int num_chips,
 				    bool strict, bool by_name);
 bool resolve_lines_by_offset(struct line_resolver *resolver,
-- 
2.37.2

