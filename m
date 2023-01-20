Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 561D067516D
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Jan 2023 10:45:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230053AbjATJp2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 20 Jan 2023 04:45:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229624AbjATJp1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Jan 2023 04:45:27 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A9167AF19
        for <linux-gpio@vger.kernel.org>; Fri, 20 Jan 2023 01:45:26 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id f19-20020a1c6a13000000b003db0ef4dedcso5407099wmc.4
        for <linux-gpio@vger.kernel.org>; Fri, 20 Jan 2023 01:45:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GbwaYrtx3NfHAMCcGzfdHbsuKlNjskyOHHyz7pViyMc=;
        b=dfA8ZtMpzZG0AOi7dMrKBPJ7wZaDCm1/IQWelxOUc3AKPBRAKrHX8fdovYxVMWNs9R
         grSUANHt0EyYpZS96u8EMpHeKGJEJqXA4UquqcRko3x/6oOxGQjPCkTUPh4sJlrppwxV
         oDJza9AFmKf0eDgrLwu/TNwZCF8T1nj0xRrkz7RzH8QhgMsc+77psXtLCjvwTBvzUV/F
         1P7VBCd85uEIBgrbaOaYSI+4nFRuV1M+XMvNEYUFAyDQRQ3wU8Q/o9NmWeWlZhTs/JQe
         a/yPqCcq23B5eDC7PZ0EchsXOrBCoATTl4HGN/Sh082+EZAaxy0vpeOvlEAQxblZSe8T
         SN9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GbwaYrtx3NfHAMCcGzfdHbsuKlNjskyOHHyz7pViyMc=;
        b=1tJQ4KW7xXKNn6+hfN433hahcHOn3we0g4a6c9oDPZVl7/4EdlurPtSderJ2qXP9Jm
         CoHzygBWkgfV/hjv2MXXii73EEQKml2M0CiuOMbFrI5gXp+siTN1UJ24ktVSTNY5QxZZ
         TjjatxojGHF7Uk3DpXiXo9gwViZJEXFo7AnCvgujLC0Zb9ATTOsP9aTMqDRL0wPMCGI4
         +4UcVcJ1m4DFioewEDqhufTEa0fFNyALx3kp1LPoPB24M9CQLcJSzMrUXRsej7yNfjhB
         f1axhfFRuw/p7QlcozyiEkO1Ns32R2wNWpDMCbSJshmNeen7b0quAawo4YkloKql3KJw
         /9yw==
X-Gm-Message-State: AFqh2kr8Ry2CIWEGZyKHIhDcsURyc2MjWDZ974WW73zX7+XkUz/0+hF9
        h/fbbWQbpBu3R9Aa+N6tBd0XlbI0ahlfr8+5
X-Google-Smtp-Source: AMrXdXtOK4cHW0Nt3RZx6Al9rcXr/MGiyyIFGYNrT0LwYiAB3/lwD2wcFUVtUgg1whhSkld2nK7qKw==
X-Received: by 2002:a05:600c:35ce:b0:3db:1caf:1020 with SMTP id r14-20020a05600c35ce00b003db1caf1020mr6625256wmq.35.1674207924674;
        Fri, 20 Jan 2023 01:45:24 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:580c:7b02:3ffd:b2e])
        by smtp.gmail.com with ESMTPSA id v17-20020a05600c445100b003d9e74dd9b2sm1800485wmn.9.2023.01.20.01.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 01:45:24 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][PATCH v2 3/8] core: provide gpiod_line_config_set_output_values()
Date:   Fri, 20 Jan 2023 10:45:10 +0100
Message-Id: <20230120094515.40464-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230120094515.40464-1-brgl@bgdev.pl>
References: <20230120094515.40464-1-brgl@bgdev.pl>
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
 include/gpiod.h            | 25 ++++++++++++++
 lib/line-config.c          | 60 +++++++++++++++++++++++++++++++---
 tests/gpiod-test-helpers.h | 10 ++++++
 tests/tests-line-config.c  | 67 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 158 insertions(+), 4 deletions(-)

diff --git a/include/gpiod.h b/include/gpiod.h
index fea2076..a895dae 100644
--- a/include/gpiod.h
+++ b/include/gpiod.h
@@ -785,6 +785,31 @@ struct gpiod_line_settings *
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
+ * Each value must be associated with the line identified by the corresponding
+ * entry in the offset array filled by
+ * ::gpiod_line_request_get_requested_offsets.
+ */
+int gpiod_line_config_set_output_values(struct gpiod_line_config *config,
+					const enum gpiod_line_value *values,
+					size_t num_values);
+
 /**
  * @brief Get the number of configured line offsets.
  * @param config Line config object.
diff --git a/lib/line-config.c b/lib/line-config.c
index 877e7ef..fef62de 100644
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
@@ -206,6 +245,13 @@ static bool has_at_least_one_output_direction(struct gpiod_line_config *config)
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
@@ -227,8 +273,14 @@ static void set_kernel_output_values(uint64_t *mask, uint64_t *vals,
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
index a1a587d..78c4d6b 100644
--- a/tests/tests-line-config.c
+++ b/tests/tests-line-config.c
@@ -280,3 +280,70 @@ GPIOD_TEST_CASE(get_more_offsets_than_configured)
 	g_assert_cmpuint(retrieved[2], ==, 2);
 	g_assert_cmpuint(retrieved[3], ==, 3);
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

