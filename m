Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD8C566A566
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Jan 2023 22:52:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230463AbjAMVwc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Jan 2023 16:52:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230482AbjAMVw3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Jan 2023 16:52:29 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1137989BF2
        for <linux-gpio@vger.kernel.org>; Fri, 13 Jan 2023 13:52:27 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id m3so16121833wmq.0
        for <linux-gpio@vger.kernel.org>; Fri, 13 Jan 2023 13:52:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M0MI4lw5cWdwPbslfrt2Bdc0oat3npjZrM1m0HACgPI=;
        b=MfnDgV40sOhf8kxOivxKpTWoEGYsoTJrGKdLGB9a7Rd4z2ELHXmZ/C+d/0WFwCeBt6
         drDfY8GIF9JsqzUqm0H/HR6uy48zKUFooHZUqDJ8DfEqJa27uGs8w/RpjLsq0SCFYNOa
         +egwcaO+Z1r6gT90Q2B1Q80773ggik1Yy/AZRmJqvfpPd+Lvan0PnhNpPPQ7+En4LBlp
         fMBLIbCHCjtmdrrqTmwm7NNPAPtHBZ4vGAs6bVMZKZXzzh8pH3FmdntUDw++tGRABClh
         ZjaDn4TMSfb5AB7KADlOzdSPzgZoPelqPKw17jb5w5QCeSRhsMxTq2IzkoCF/FYEYpA6
         unZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M0MI4lw5cWdwPbslfrt2Bdc0oat3npjZrM1m0HACgPI=;
        b=tDrfhL8y2oDVfnim7FzmJmqAyim8iTK/ETPKdbbD7NZRNEz60FFO7JulsDpDyOx+dF
         fLxHolrxERv57v/udv0jacLdstaNJhKx7zbZ8W5Gnp4v0Pg5xxIGC0WUHcGjguzwZF7v
         2MrMxf6EZs7A8rDKxUjHwmSM0heDv+gqtm7yoNegNzFxYc5Uhs+wyLXat07rJhQT3nK8
         iofiusyMwpKwE6RHnX2KDcXYgY+0HZ76ipny87+oluJBv504DiRAiyGvROSzvP8pRyj8
         +Tz9TbbyyrT+iMwiwn1bw9kAg2za1PdOATr4Ag355LKNrlhzvhzTwQXyqocPB2tKmNEa
         bRMA==
X-Gm-Message-State: AFqh2kr4S9Rnz3qsvKiBHAVIdmLR4SAAeavxRJeYtWf0Q6q0e4WkPZto
        PCovGd7KaZZidN7kE3cgpJxhRw==
X-Google-Smtp-Source: AMrXdXumZqhm1kku2PmguPO53Ew+lsN/3fCAGpbcV+RyAo3MicZhyX8uEef+AQeRclE9QfsKiX7+kQ==
X-Received: by 2002:a05:600c:1603:b0:3d1:c895:930c with SMTP id m3-20020a05600c160300b003d1c895930cmr59446218wmn.35.1673646746414;
        Fri, 13 Jan 2023 13:52:26 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ba79:38ad:100f:e9ee])
        by smtp.gmail.com with ESMTPSA id g12-20020a05600c310c00b003c70191f267sm33179234wmo.39.2023.01.13.13.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 13:52:25 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][PATCH 10/16] core: provide gpiod_line_config_set_output_values()
Date:   Fri, 13 Jan 2023 22:52:04 +0100
Message-Id: <20230113215210.616812-11-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230113215210.616812-1-brgl@bgdev.pl>
References: <20230113215210.616812-1-brgl@bgdev.pl>
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

Currently if user wants to use the same settings for a set of requested
lines with the exception of the output value - they need to go through
hoops by updating the line settings object and adding it one by one to
the line config. Provide a helper function that allows to set a global
list of output values that override the settings. For details on the
interface: see documentation in this commit.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 include/gpiod.h            | 27 +++++++++++++++
 lib/line-config.c          | 60 +++++++++++++++++++++++++++++++---
 tests/gpiod-test-helpers.h | 10 ++++++
 tests/tests-line-config.c  | 67 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 160 insertions(+), 4 deletions(-)

diff --git a/include/gpiod.h b/include/gpiod.h
index 8cede47..c552135 100644
--- a/include/gpiod.h
+++ b/include/gpiod.h
@@ -785,6 +785,33 @@ struct gpiod_line_settings *
 gpiod_line_config_get_line_settings(struct gpiod_line_config *config,
 				    unsigned int offset);
 
+/**
+ * @brief Set output values for a number of lines.
+ * @param config Line config object.
+ * @param values Buffer containing the output values.
+ * @param num_values Number of values in the buffer.
+ * @return 0 on success, -1 on error.
+ *
+ * This is a helper that allows users to set multiple (potentially different)
+ * output values at once while using the same line settings object. Instead of
+ * modifying the output value in the settings object and calling
+ * ::gpiod_line_config_add_line_settings multiple times, we can specify the
+ * settings, add them for a set of offsets and then call this function to
+ * set the output values.
+ *
+ * Values set by this function override whatever values were specified in the
+ * regular line settings.
+ *
+ * The order of the output values in the array corresponds with the order in
+ * which offsets were added by ::gpiod_line_config_add_line_settings. For
+ * example calling add_settings([1, 3]) and add_settings([2, 4]) and then
+ * calling this function with the following logicall values : [0, 1, 0, 1]
+ * will result in the following offset->value mapping: 1->0, 2->0, 3->1, 4->1.
+ */
+int gpiod_line_config_set_output_values(struct gpiod_line_config *config,
+					const enum gpiod_line_value *values,
+					size_t num_values);
+
 /**
  * @brief Get the number of configured line offsets.
  * @param config Line config object.
diff --git a/lib/line-config.c b/lib/line-config.c
index b00e5e6..901eb02 100644
--- a/lib/line-config.c
+++ b/lib/line-config.c
@@ -25,6 +25,8 @@ struct per_line_config {
 struct gpiod_line_config {
 	struct per_line_config line_configs[LINES_MAX];
 	size_t num_configs;
+	enum gpiod_line_value output_values[LINES_MAX];
+	size_t num_output_values;
 	struct settings_node *sref_list;
 };
 
@@ -136,23 +138,60 @@ GPIOD_API struct gpiod_line_settings *
 gpiod_line_config_get_line_settings(struct gpiod_line_config *config,
 				    unsigned int offset)
 {
+	struct gpiod_line_settings *settings;
 	struct per_line_config *per_line;
 	size_t i;
+	int ret;
 
 	assert(config);
 
 	for (i = 0; i < config->num_configs; i++) {
 		per_line = &config->line_configs[i];
 
-		if (per_line->offset == offset)
-			return gpiod_line_settings_copy(
+		if (per_line->offset == offset) {
+			settings = gpiod_line_settings_copy(
 					per_line->node->settings);
+			if (!settings)
+				return NULL;
+
+			/*
+			 * If a global output value was set for this line - use
+			 * it and override the one stored in settings.
+			 */
+			if (config->num_output_values > i) {
+				ret = gpiod_line_settings_set_output_value(
+						settings,
+						config->output_values[i]);
+				if (ret) {
+					gpiod_line_settings_free(settings);
+					return NULL;
+				}
+			}
+
+			return settings;
+		}
 	}
 
 	errno = ENOENT;
 	return NULL;
 }
 
+GPIOD_API int
+gpiod_line_config_set_output_values(struct gpiod_line_config *config,
+				    const enum gpiod_line_value *values,
+				    size_t num_values)
+{
+	if (num_values > LINES_MAX) {
+		errno = EINVAL;
+		return -1;
+	}
+
+	memcpy(config->output_values, values, num_values * sizeof(*values));
+	config->num_output_values = num_values;
+
+	return 0;
+}
+
 GPIOD_API size_t
 gpiod_line_config_get_num_configured_offsets(struct gpiod_line_config *config)
 {
@@ -209,6 +248,13 @@ static bool has_at_least_one_output_direction(struct gpiod_line_config *config)
 	return false;
 }
 
+static void set_output_value(uint64_t *vals, size_t bit,
+			     enum gpiod_line_value value)
+{
+	gpiod_line_mask_assign_bit(vals, bit,
+				   value == GPIOD_LINE_VALUE_ACTIVE ? 1 : 0);
+}
+
 static void set_kernel_output_values(uint64_t *mask, uint64_t *vals,
 				     struct gpiod_line_config *config)
 {
@@ -230,8 +276,14 @@ static void set_kernel_output_values(uint64_t *mask, uint64_t *vals,
 		gpiod_line_mask_set_bit(mask, i);
 		value = gpiod_line_settings_get_output_value(
 			per_line->node->settings);
-		gpiod_line_mask_assign_bit(
-			vals, i, value == GPIOD_LINE_VALUE_ACTIVE ? 1 : 0);
+		set_output_value(vals, i, value);
+	}
+
+	/* "Global" output values override the ones from per-line settings. */
+	for (i = 0; i < config->num_output_values; i++) {
+		gpiod_line_mask_set_bit(mask, i);
+		value = config->output_values[i];
+		set_output_value(vals, i, value);
 	}
 }
 
diff --git a/tests/gpiod-test-helpers.h b/tests/gpiod-test-helpers.h
index fb3fd7d..760949e 100644
--- a/tests/gpiod-test-helpers.h
+++ b/tests/gpiod-test-helpers.h
@@ -136,6 +136,16 @@ G_DEFINE_AUTOPTR_CLEANUP_FUNC(struct_gpiod_edge_event_buffer,
 		_settings; \
 	})
 
+#define gpiod_test_line_config_set_output_values_or_fail(_line_cfg, _values, \
+							 _num_values) \
+	do { \
+		gint _ret = gpiod_line_config_set_output_values(_line_cfg, \
+								_values, \
+								_num_values); \
+		g_assert_cmpint(_ret, ==, 0); \
+		gpiod_test_return_if_failed(); \
+	} while (0)
+
 #define gpiod_test_create_request_config_or_fail() \
 	({ \
 		struct gpiod_request_config *_config = \
diff --git a/tests/tests-line-config.c b/tests/tests-line-config.c
index 7f5e4b1..78a4632 100644
--- a/tests/tests-line-config.c
+++ b/tests/tests-line-config.c
@@ -238,3 +238,70 @@ GPIOD_TEST_CASE(get_null_offsets)
 							       NULL, 10);
 	g_assert_cmpuint(num_offsets, ==, 0);
 }
+
+GPIOD_TEST_CASE(set_global_output_values)
+{
+	static const guint offsets[] = { 0, 1, 2, 3 };
+	static const enum gpiod_line_value values[] = {
+		GPIOD_LINE_VALUE_ACTIVE,
+		GPIOD_LINE_VALUE_INACTIVE,
+		GPIOD_LINE_VALUE_ACTIVE,
+		GPIOD_LINE_VALUE_INACTIVE,
+	};
+
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 4, NULL);
+	g_autoptr(struct_gpiod_line_settings) settings = NULL;
+	g_autoptr(struct_gpiod_line_config) config = NULL;
+	g_autoptr(struct_gpiod_line_request) request = NULL;
+	g_autoptr(struct_gpiod_chip) chip = NULL;
+
+	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
+	settings = gpiod_test_create_line_settings_or_fail();
+	config = gpiod_test_create_line_config_or_fail();
+
+	gpiod_line_settings_set_direction(settings,
+					  GPIOD_LINE_DIRECTION_OUTPUT);
+	gpiod_test_line_config_add_line_settings_or_fail(config, offsets, 4,
+							 settings);
+	gpiod_test_line_config_set_output_values_or_fail(config, values, 4);
+
+	request = gpiod_test_request_lines_or_fail(chip, NULL, config);
+
+	g_assert_cmpint(g_gpiosim_chip_get_value(sim, 0), ==,
+			GPIOD_LINE_VALUE_ACTIVE);
+	g_assert_cmpint(g_gpiosim_chip_get_value(sim, 1), ==,
+			GPIOD_LINE_VALUE_INACTIVE);
+	g_assert_cmpint(g_gpiosim_chip_get_value(sim, 2), ==,
+			GPIOD_LINE_VALUE_ACTIVE);
+	g_assert_cmpint(g_gpiosim_chip_get_value(sim, 3), ==,
+			GPIOD_LINE_VALUE_INACTIVE);
+}
+
+GPIOD_TEST_CASE(read_back_global_output_values)
+{
+	static const guint offsets[] = { 0, 1, 2, 3 };
+	static const enum gpiod_line_value values[] = {
+		GPIOD_LINE_VALUE_ACTIVE,
+		GPIOD_LINE_VALUE_INACTIVE,
+		GPIOD_LINE_VALUE_ACTIVE,
+		GPIOD_LINE_VALUE_INACTIVE,
+	};
+
+	g_autoptr(struct_gpiod_line_settings) settings = NULL;
+	g_autoptr(struct_gpiod_line_settings) retrieved = NULL;
+	g_autoptr(struct_gpiod_line_config) config = NULL;
+
+	settings = gpiod_test_create_line_settings_or_fail();
+	config = gpiod_test_create_line_config_or_fail();
+
+	gpiod_line_settings_set_direction(settings,
+					  GPIOD_LINE_DIRECTION_OUTPUT);
+	gpiod_line_settings_set_output_value(settings, GPIOD_LINE_VALUE_ACTIVE);
+	gpiod_test_line_config_add_line_settings_or_fail(config, offsets, 4,
+							 settings);
+	gpiod_test_line_config_set_output_values_or_fail(config, values, 4);
+
+	retrieved = gpiod_test_line_config_get_line_settings_or_fail(config, 1);
+	g_assert_cmpint(gpiod_line_settings_get_output_value(retrieved), ==,
+			GPIOD_LINE_VALUE_INACTIVE);
+}
-- 
2.37.2

