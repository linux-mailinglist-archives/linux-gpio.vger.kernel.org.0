Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F4C23E2B4F
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Aug 2021 15:27:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236885AbhHFN1k (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Aug 2021 09:27:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344012AbhHFN1j (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Aug 2021 09:27:39 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23D96C06179A
        for <linux-gpio@vger.kernel.org>; Fri,  6 Aug 2021 06:27:23 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id b13so11096202wrs.3
        for <linux-gpio@vger.kernel.org>; Fri, 06 Aug 2021 06:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7bej4esUzfs7BDSkpfXOekMMi7jzFDuTSD7crJqy3kw=;
        b=TA4neuko79BOfNvSegnPwxbP39yj5bzyEawu+I1l4ZbcQiUQ4Z0HNDmUyb6UCV5y55
         /vFGYtZkXpyIMN0YIHijbg+qhxfoXxgr54OW2LEDJEWWOIXUh4z4/yWSvwx+AgUzr4dj
         9CVUAuDVvbY8ON8B2Q07mIzWHsCU83cv4fWlBid01FOlBy7Oia10tg32wwsVYvPvItka
         LDqCnkFx+0ht0GDs0zwgv8Dkvehzkt3+3xWqcSZpnNE9kQA8Y1tvSa07MZmdbflQko03
         BwVHhzLMcXOaXujMfrjKrK5howNPhD9nmd+myLiFyo86EcOiPxvgr9zhTPMKW7buiZ6b
         bL8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7bej4esUzfs7BDSkpfXOekMMi7jzFDuTSD7crJqy3kw=;
        b=KBX+Y6CvlFeK8y05hzoZa4y8uCZ6F/rNDYa6bf5c+AWT18zmiMz4ChdaYOZEal+evw
         406KU8l3aVaPShAoifCupdfDvBMOF4gTIMsNQEvfqikxGtHSKFgN7hR8p8p0FETLRUAB
         bUsee2/PjW+3RtCDYy4MmZDWVAFrAFa+GUJGD4o8oCgM5eMzcWQcTjJzKXODiL+XGGj0
         QTYfdsU/NEn9HckRICSgy6bSjP4MoNbT4dXVdG/2pAgoMgSkaH25BoUgEI4ZWLEi0W9i
         3gdQQnNvlAVSfbmtxXP2LwSyPxuHcz6cQS31eY8Rs5tR7Kl/GFAn0ftXwwuI2x8zkwbG
         3msQ==
X-Gm-Message-State: AOAM531riW+/eCI/ILTJds0mZ9cT3vWVCRMGu/tCdkYMyf8vYsfA43Hl
        w0U56x419tnYovivE/MOiSzCHI1H4/d5rQ==
X-Google-Smtp-Source: ABdhPJxMsrC7kEN32JqeJUtXLHD9NuVamLu+HQZF+yKbs7hU0UwZ5lL5MQUkaz/xyMDv3/14cNmAuQ==
X-Received: by 2002:adf:f109:: with SMTP id r9mr10739763wro.370.1628256441467;
        Fri, 06 Aug 2021 06:27:21 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:334:ac00:7d50:ff5:f5c1:e225])
        by smtp.gmail.com with ESMTPSA id j2sm9797702wrd.14.2021.08.06.06.27.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Aug 2021 06:27:21 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Helmut Grohne <helmut.grohne@intenta.de>,
        Ben Hutchings <ben.hutchings@essensium.com>
Cc:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH] core: extend config objects
Date:   Fri,  6 Aug 2021 15:27:19 +0200
Message-Id: <20210806132719.23469-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Kent suggested that we may want to add getters for the config objects in
his reviews under the C++ patches. Indeed when working on Python bindings
I noticed it would be useful for implementing __str__ and __repr__
callbacks. In C++ too we could use them for overloading stream operators.

This extends the config objects with getters. They are straightforward for
the request config but for the line config, they allow to only read
per-offset values that would be used if the object was used in a request
at this moment. We also add getters for the output values: both taking
the line offset as argument as well as ones that take the index and allow
to iterate over all configured output values.

The sanitization of input for the getters has subsequently been changed
so that we never return invalid values. The input values are verified
immediately and if an invalid value is passed, it's silently replaced
by the default value for given setting.

This patch also adds the reset function for the line config object - it
can be used to reset all stored configuration if - for example - the
config has become too complex.

As this patch will be squashed into the big v2 patch anyway, I allowed
myself to include some additional changes: some variable renames and
other minor tweaks.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 include/gpiod.h      | 189 +++++++++++++++++++++++-
 lib/line-config.c    | 340 ++++++++++++++++++++++++++++++++++---------
 lib/request-config.c |  42 +++++-
 3 files changed, 487 insertions(+), 84 deletions(-)

diff --git a/include/gpiod.h b/include/gpiod.h
index 885b472..d186df7 100644
--- a/include/gpiod.h
+++ b/include/gpiod.h
@@ -451,11 +451,11 @@ gpiod_info_event_get_line_info(struct gpiod_info_event *event);
  * The line-config object stores the configuration for lines that can be used
  * in two cases: when making a line request and when reconfiguring a set of
  * already requested lines. The mutators for the line request don't return
- * errors. If the configuration is invalid - the set of options is too complex
- * to be translated into kernel uAPI structures or invalid values have been
- * passed to any of the functions - the error will be returned at the time of
- * the request or reconfiguration. Each option can be set globally, for
- * a single line offset or for multiple line offsets.
+ * errors. If the set of options is too complex to be translated into kernel
+ * uAPI structures - the error will be returned at the time of the request or
+ * reconfiguration. If an invalid value was passed to any of the getters - the
+ * default value will be silently used instead. Each option can be set
+ * globally, for a single line offset or for multiple line offsets.
  */
 
 /**
@@ -470,6 +470,15 @@ struct gpiod_line_config *gpiod_line_config_new(void);
  */
 void gpiod_line_config_free(struct gpiod_line_config *config);
 
+/**
+ * @brief Reset the line config object.
+ * @param config Line config object to free.
+ *
+ * Resets the entire configuration stored in this object. This is useful if
+ * the user wants to reuse the object without reallocating it.
+ */
+void gpiod_line_config_reset(struct gpiod_line_config *config);
+
 /**
  * @brief Set the direction of all lines.
  * @param config Line config object.
@@ -499,6 +508,18 @@ void gpiod_line_config_set_direction_subset(struct gpiod_line_config *config,
 					    unsigned int num_offsets,
 					    const unsigned int *offsets);
 
+/**
+ * @brief Get the direction setting for the line at given offset.
+ * @param config Line config object.
+ * @param offset Line offset for which to read the direction setting.
+ * @return Direction setting that would have been used for given offset if the
+ *         config object was used in a request at the time of the call.
+ * @note If an offset is used for which no config was provided, the function
+ *       will return the global, default value.
+ */
+int gpiod_line_config_get_direction(struct gpiod_line_config *config,
+				    unsigned int offset);
+
 /**
  * @brief Set the edge event detection for all lines.
  * @param config Line config object.
@@ -529,6 +550,19 @@ gpiod_line_config_set_edge_detection_subset(struct gpiod_line_config *config,
 					    int edge, unsigned int num_offsets,
 					    const unsigned int *offsets);
 
+/**
+ * @brief Get the edge event detection setting for the line at given offset.
+ * @param config Line config object.
+ * @param offset Line offset for which to read the edge event detection setting.
+ * @return Edge event detection setting that would have been used for given
+ *         offset if the config object was used in a request at the time of
+ *         the call.
+ * @note If an offset is used for which no config was provided, the function
+ *       will return the global, default value.
+ */
+int gpiod_line_config_get_edge_detection(struct gpiod_line_config *config,
+					 unsigned int offset);
+
 /**
  * @brief Set the bias of all lines.
  * @param config Line config object.
@@ -556,6 +590,18 @@ void gpiod_line_config_set_bias_subset(struct gpiod_line_config *config,
 				       int bias, unsigned int num_offsets,
 				       const unsigned int *offsets);
 
+/**
+ * @brief Get the bias setting for the line at given offset.
+ * @param config Line config object.
+ * @param offset Line offset for which to read the bias setting.
+ * @return Bias setting that would have been used for given offset if the
+ *         config object was used in a request at the time of the call.
+ * @note If an offset is used for which no config was provided, the function
+ *       will return the global, default value.
+ */
+int gpiod_line_config_get_bias(struct gpiod_line_config *config,
+			       unsigned int offset);
+
 /**
  * @brief Set the drive of all lines.
  * @param config Line config object.
@@ -583,6 +629,18 @@ void gpiod_line_config_set_drive_subset(struct gpiod_line_config *config,
 					int drive, unsigned int num_offsets,
 					const unsigned int *offsets);
 
+/**
+ * @brief Get the drive setting for the line at given offset.
+ * @param config Line config object.
+ * @param offset Line offset for which to read the drive setting.
+ * @return Drive setting that would have been used for given offset if the
+ *         config object was used in a request at the time of the call.
+ * @note If an offset is used for which no config was provided, the function
+ *       will return the global, default value.
+ */
+int gpiod_line_config_get_drive(struct gpiod_line_config *config,
+				unsigned int offset);
+
 /**
  * @brief Set all lines as active-low.
  * @param config Line config object.
@@ -607,6 +665,18 @@ void gpiod_line_config_set_active_low_subset(struct gpiod_line_config *config,
 					     unsigned int num_offsets,
 					     const unsigned int *offsets);
 
+/**
+ * @brief Check if the line at given offset was configured as active-low.
+ * @param config Line config object.
+ * @param offset Line offset for which to read the active-low setting.
+ * @return Active-low setting that would have been used for given offset if the
+ *         config object was used in a request at the time of the call.
+ * @note If an offset is used for which no config was provided, the function
+ *       will return the global, default value.
+ */
+bool gpiod_line_config_is_active_low(struct gpiod_line_config *config,
+				     unsigned int offset);
+
 /**
  * @brief Set all lines as active-high.
  * @param config Line config object.
@@ -663,6 +733,19 @@ gpiod_line_config_set_debounce_period_subset(struct gpiod_line_config *config,
 					     unsigned int num_offsets,
 					     const unsigned int *offsets);
 
+/**
+ * @brief Get the debounce period for the line at given offset.
+ * @param config Line config object.
+ * @param offset Line offset for which to read the debounce period.
+ * @return Debounce period that would have been used for given offset if the
+ *         config object was used in a request at the time of the call.
+ * @note If an offset is used for which no config was provided, the function
+ *       will return the global, default value.
+ */
+unsigned long
+gpiod_line_config_get_debounce_period(struct gpiod_line_config *config,
+				      unsigned int offset);
+
 /**
  * @brief Set the event timestamp clock for all lines.
  * @param config Line config object.
@@ -692,6 +775,18 @@ void gpiod_line_config_set_event_clock_subset(struct gpiod_line_config *config,
 					      unsigned int num_offsets,
 					      const unsigned int *offsets);
 
+/**
+ * @brief Get the event clock setting for the line at given offset.
+ * @param config Line config object.
+ * @param offset Line offset for which to read the event clock setting.
+ * @return Event clock setting that would have been used for given offset if
+ *         the config object was used in a request at the time of the call.
+ * @note If an offset is used for which no config was provided, the function
+ *       will return the global, default value.
+ */
+int gpiod_line_config_get_event_clock(struct gpiod_line_config *config,
+				      unsigned int offset);
+
 /**
  * @brief Set the output value for a single offset.
  * @param config Line config object.
@@ -704,16 +799,63 @@ void gpiod_line_config_set_output_value(struct gpiod_line_config *config,
 /**
  * @brief Set the output values for a set of offsets.
  * @param config Line config object.
- * @param num_offsets Number of offsets for which to set values.
+ * @param num_values Number of offsets for which to set values.
  * @param offsets Array of line offsets to set values for.
  * @param values Array of output values associated with the offsets passed in
  *               the previous argument.
  */
 void gpiod_line_config_set_output_values(struct gpiod_line_config *config,
-					 unsigned int num_offsets,
+					 unsigned int num_values,
 					 const unsigned int *offsets,
 					 const int *values);
 
+/**
+ * @brief Get the number of line offsets for which this config object stores
+ *        output values.
+ * @param config Line config object.
+ * @return Number of output values currently configured for this object.
+ */
+unsigned int
+gpiod_line_config_num_output_values(struct gpiod_line_config *config);
+
+/**
+ * @brief Get the output value configured for the line at given offset.
+ * @param config Line config object.
+ * @param offset Line offset for which to read the value.
+ * @return 1 or 0 if the value was configured for this line, -1 otherwise.
+ */
+int gpiod_line_config_get_output_value(struct gpiod_line_config *config,
+				       unsigned int offset);
+
+/**
+ * @brief Get the output value mapping (offset -> value) at given index.
+ * @param config Line config object.
+ * @param index Position of the mapping in the internal array.
+ * @param offset Buffer for storing the offset of the line.
+ * @param value Buffer for storing the value mapped for the offset.
+ * @return Returns 0 on success, -1 if the index is out of range.
+ *
+ * This function together with ::gpiod_line_config_num_output_values allows to
+ * iterate over all output value mappings currently held by this object.
+ */
+int gpiod_line_config_get_output_value_index(struct gpiod_line_config *config,
+					     unsigned int index,
+					     unsigned int *offset, int *value);
+
+/**
+ * @brief Get all output value mappings stored in this config object.
+ * @param config Line config object.
+ * @param offsets Buffer in which offsets will be stored.
+ * @param values Buffer in which values will be stored.
+ * @note Both the offsets and values buffers must be able to hold at least the
+ *       number of elements returned by ::gpiod_line_config_num_output_values.
+ *
+ * Each offset in the offsets array corresponds with the value in the values
+ * array at the same index.
+ */
+void gpiod_line_config_get_output_values(struct gpiod_line_config *config,
+					 unsigned int *offsets, int *values);
+
 /**
  * @}
  *
@@ -750,6 +892,14 @@ void gpiod_request_config_free(struct gpiod_request_config *config);
 void gpiod_request_config_set_consumer(struct gpiod_request_config *config,
 				       const char *consumer);
 
+/**
+ * @brief Get the consumer string.
+ * @param config Request config object.
+ * @return Current consumer string stored in this request config.
+ */
+const char *
+gpiod_request_config_get_consumer(struct gpiod_request_config *config);
+
 /**
  * @brief Set line offsets for this request.
  * @param config Request config object.
@@ -762,6 +912,23 @@ void gpiod_request_config_set_offsets(struct gpiod_request_config *config,
 				      unsigned int num_offsets,
 				      const unsigned int *offsets);
 
+/**
+ * @brief Get the number of offsets configured in this request config.
+ * @param config Request config object.
+ * @return Number of line offsets in this request config.
+ */
+unsigned int
+gpiod_request_config_get_num_offsets(struct gpiod_request_config *config);
+
+/**
+ * @brief Get the hardware offsets of lines in this request config.
+ * @param config Request config object.
+ * @param offsets Array to store offsets in. Must hold at least the number of
+ *                lines returned by ::gpiod_request_config_get_num_offsets.
+ */
+void gpiod_request_config_get_offsets(struct gpiod_request_config *config,
+				      unsigned int *offsets);
+
 /**
  * @brief Set the size of the kernel event buffer.
  * @param config Request config object.
@@ -773,6 +940,14 @@ void
 gpiod_request_config_set_event_buffer_size(struct gpiod_request_config *config,
 					   unsigned int event_buffer_size);
 
+/**
+ * @brief Get the edge event buffer size from this request config.
+ * @param config Request config object.
+ * @return Current edge event buffer size setting.
+ */
+unsigned int
+gpiod_request_config_get_event_buffer_size(struct gpiod_request_config *config);
+
 /**
  * @}
  *
diff --git a/lib/line-config.c b/lib/line-config.c
index 6cc4676..c2c9d2f 100644
--- a/lib/line-config.c
+++ b/lib/line-config.c
@@ -47,6 +47,17 @@ struct gpiod_line_config {
 	unsigned int num_sorted_offsets;
 };
 
+static void init_base_config(struct base_config *config)
+{
+	config->direction = GPIOD_LINE_DIRECTION_AS_IS;
+	config->edge = GPIOD_LINE_EDGE_NONE;
+	config->bias = GPIOD_LINE_BIAS_AS_IS;
+	config->drive = GPIOD_LINE_DRIVE_PUSH_PULL;
+	config->active_low = false;
+	config->clock = GPIOD_LINE_EVENT_CLOCK_MONOTONIC;
+	config->debounce_period = 0;
+}
+
 GPIOD_API struct gpiod_line_config *gpiod_line_config_new(void)
 {
 	struct gpiod_line_config *config;
@@ -55,7 +66,7 @@ GPIOD_API struct gpiod_line_config *gpiod_line_config_new(void)
 	if (!config)
 		return NULL;
 
-	memset(config, 0, sizeof(*config));
+	gpiod_line_config_reset(config);
 
 	return config;
 }
@@ -68,6 +79,16 @@ GPIOD_API void gpiod_line_config_free(struct gpiod_line_config *config)
 	free(config);
 }
 
+GPIOD_API void gpiod_line_config_reset(struct gpiod_line_config *config)
+{
+	int i;
+
+	memset(config, 0, sizeof(*config));
+	init_base_config(&config->primary);
+	for (i = 0; i < GPIO_V2_LINE_NUM_ATTRS_MAX; i++)
+		init_base_config(&config->secondary[i].config);
+}
+
 static int offset_compare(const void *a_ptr, const void *b_ptr)
 {
 	unsigned int a = *((unsigned int *)a_ptr);
@@ -148,10 +169,47 @@ get_secondary_config(struct gpiod_line_config *config,
 	return secondary;
 }
 
+static struct base_config *
+get_base_config_for_offset(struct gpiod_line_config *config,
+			   unsigned int offset)
+{
+	struct secondary_config *secondary;
+	unsigned int i, j;
+
+	/*
+	 * We're looking backwards as the settings get overwritten if set
+	 * multiple times.
+	 */
+	for (i = config->num_secondary; i > 0; i--) {
+		secondary = &config->secondary[i - 1];
+
+		for (j = 0; j < secondary->num_offsets; j++) {
+			if (secondary->offsets[j] == offset)
+				return &secondary->config;
+		}
+	}
+
+	return NULL;
+}
+
+static void set_direction(struct base_config *config, int direction)
+{
+	switch (direction) {
+	case GPIOD_LINE_DIRECTION_INPUT:
+	case GPIOD_LINE_DIRECTION_OUTPUT:
+	case GPIOD_LINE_DIRECTION_AS_IS:
+		config->direction = direction;
+		break;
+	default:
+		config->direction = GPIOD_LINE_DIRECTION_AS_IS;
+		break;
+	}
+}
+
 GPIOD_API void
 gpiod_line_config_set_direction(struct gpiod_line_config *config, int direction)
 {
-	config->primary.direction = direction;
+	set_direction(&config->primary, direction);
 }
 
 GPIOD_API void
@@ -172,13 +230,40 @@ gpiod_line_config_set_direction_subset(struct gpiod_line_config *config,
 	if (!secondary)
 		return;
 
-	secondary->config.direction = direction;
+	set_direction(&secondary->config, direction);
+}
+
+GPIOD_API int gpiod_line_config_get_direction(struct gpiod_line_config *config,
+					      unsigned int offset)
+{
+	struct base_config *base;
+
+	base = get_base_config_for_offset(config, offset);
+	if (!base)
+		return config->primary.direction;
+
+	return base->direction;
+}
+
+static void set_edge_detection(struct base_config *config, int edge)
+{
+	switch (edge) {
+	case GPIOD_LINE_EDGE_NONE:
+	case GPIOD_LINE_EDGE_RISING:
+	case GPIOD_LINE_EDGE_FALLING:
+	case GPIOD_LINE_EDGE_BOTH:
+		config->edge = edge;
+		break;
+	default:
+		config->edge = GPIOD_LINE_EDGE_NONE;
+		break;
+	}
 }
 
 GPIOD_API void
 gpiod_line_config_set_edge_detection(struct gpiod_line_config *config, int edge)
 {
-	config->primary.edge = edge;
+	set_edge_detection(&config->primary, edge);
 }
 
 GPIOD_API void
@@ -199,13 +284,41 @@ gpiod_line_config_set_edge_detection_subset(struct gpiod_line_config *config,
 	if (!secondary)
 		return;
 
-	secondary->config.edge = edge;
+	set_edge_detection(&secondary->config, edge);
+}
+
+GPIOD_API int
+gpiod_line_config_get_edge_detection(struct gpiod_line_config *config,
+				     unsigned int offset)
+{
+	struct base_config *base;
+
+	base = get_base_config_for_offset(config, offset);
+	if (!base)
+		return config->primary.edge;
+
+	return base->edge;
+}
+
+static void set_bias(struct base_config *config, int bias)
+{
+	switch (bias) {
+	case GPIOD_LINE_BIAS_AS_IS:
+	case GPIOD_LINE_BIAS_DISABLED:
+	case GPIOD_LINE_BIAS_PULL_UP:
+	case GPIOD_LINE_BIAS_PULL_DOWN:
+		config->bias = bias;
+		break;
+	default:
+		config->bias = GPIOD_LINE_BIAS_AS_IS;
+		break;
+	}
 }
 
 GPIOD_API void
 gpiod_line_config_set_bias(struct gpiod_line_config *config, int bias)
 {
-	config->primary.bias = bias;
+	set_bias(&config->primary, bias);
 }
 
 GPIOD_API void
@@ -226,13 +339,39 @@ gpiod_line_config_set_bias_subset(struct gpiod_line_config *config,
 	if (!secondary)
 		return;
 
-	secondary->config.bias = bias;
+	set_bias(&secondary->config, bias);
+}
+
+GPIOD_API int gpiod_line_config_get_bias(struct gpiod_line_config *config,
+					 unsigned int offset)
+{
+	struct base_config *base;
+
+	base = get_base_config_for_offset(config, offset);
+	if (!base)
+		return config->primary.bias;
+
+	return base->bias;
+}
+
+static void set_drive(struct base_config *config, int drive)
+{
+	switch (drive) {
+	case GPIOD_LINE_DRIVE_PUSH_PULL:
+	case GPIOD_LINE_DRIVE_OPEN_DRAIN:
+	case GPIOD_LINE_DRIVE_OPEN_SOURCE:
+		config->drive = drive;
+		break;
+	default:
+		config->drive = GPIOD_LINE_DRIVE_PUSH_PULL;
+		break;
+	}
 }
 
 GPIOD_API void
 gpiod_line_config_set_drive(struct gpiod_line_config *config, int drive)
 {
-	config->primary.drive = drive;
+	set_drive(&config->primary, drive);
 }
 
 GPIOD_API void
@@ -253,7 +392,19 @@ gpiod_line_config_set_drive_subset(struct gpiod_line_config *config,
 	if (!secondary)
 		return;
 
-	secondary->config.drive = drive;
+	set_drive(&secondary->config, drive);
+}
+
+GPIOD_API int gpiod_line_config_get_drive(struct gpiod_line_config *config,
+					  unsigned int offset)
+{
+	struct base_config *base;
+
+	base = get_base_config_for_offset(config, offset);
+	if (!base)
+		return config->primary.drive;
+
+	return base->drive;
 }
 
 GPIOD_API void
@@ -283,6 +434,18 @@ gpiod_line_config_set_active_low_subset(struct gpiod_line_config *config,
 	secondary->config.active_low = true;
 }
 
+GPIOD_API bool gpiod_line_config_is_active_low(struct gpiod_line_config *config,
+					       unsigned int offset)
+{
+	struct base_config *base;
+
+	base = get_base_config_for_offset(config, offset);
+	if (!base)
+		return config->primary.active_low;
+
+	return base->active_low;
+}
+
 GPIOD_API void
 gpiod_line_config_set_active_high(struct gpiod_line_config *config)
 {
@@ -341,10 +504,36 @@ gpiod_line_config_set_debounce_period_subset(struct gpiod_line_config *config,
 	secondary->config.debounce_period = period;
 }
 
+GPIOD_API unsigned long
+gpiod_line_config_get_debounce_period(struct gpiod_line_config *config,
+				      unsigned int offset)
+{
+	struct base_config *base;
+
+	base = get_base_config_for_offset(config, offset);
+	if (!base)
+		return config->primary.debounce_period;
+
+	return base->debounce_period;
+}
+
+static void set_event_clock(struct base_config *config, int clock)
+{
+	switch (clock) {
+	case GPIOD_LINE_EVENT_CLOCK_MONOTONIC:
+	case GPIOD_LINE_EVENT_CLOCK_REALTIME:
+		config->clock = clock;
+		break;
+	default:
+		config->clock = GPIOD_LINE_EVENT_CLOCK_MONOTONIC;
+		break;
+	}
+}
+
 GPIOD_API void
 gpiod_line_config_set_event_clock(struct gpiod_line_config *config, int clock)
 {
-	config->primary.clock = clock;
+	set_event_clock(&config->primary, clock);
 }
 
 GPIOD_API void
@@ -365,7 +554,7 @@ gpiod_line_config_set_event_clock_subset(struct gpiod_line_config *config,
 	if (!secondary)
 		return;
 
-	secondary->config.clock = clock;
+	set_event_clock(&secondary->config, clock);
 }
 
 GPIOD_API void
@@ -430,98 +619,118 @@ gpiod_line_config_set_output_values(struct gpiod_line_config *config,
 	}
 }
 
-static int gpiod_make_kernel_flags(uint64_t *flags, struct base_config *config)
+GPIOD_API unsigned int
+gpiod_line_config_num_output_values(struct gpiod_line_config *config)
+{
+	return config->num_output_values;
+}
+
+GPIOD_API int
+gpiod_line_config_get_output_value(struct gpiod_line_config *config,
+				   unsigned int offset)
+{
+	unsigned int i;
+
+	for (i = 0; i < config->num_output_values; i++) {
+		if (config->output_values[i].offset == offset)
+			return config->output_values[i].value;
+	}
+
+	errno = ENXIO;
+	return -1;
+}
+
+GPIOD_API int
+gpiod_line_config_get_output_value_index(struct gpiod_line_config *config,
+					 unsigned int index,
+					 unsigned int *offset, int *value)
+{
+	if (index >= config->num_output_values) {
+		errno = EINVAL;
+		return -1;
+	}
+
+	*offset = config->output_values[index].offset;
+	*value = config->output_values[index].value;
+
+	return 0;
+}
+
+GPIOD_API void
+gpiod_line_config_get_output_values(struct gpiod_line_config *config,
+				    unsigned int *offsets, int *values)
 {
-	*flags = 0;
+	unsigned int i;
+
+	for (i = 0; i < config->num_output_values; i++) {
+		offsets[i] = config->output_values[i].offset;
+		values[i] = config->output_values[i].value;
+	}
+}
+
+static uint64_t gpiod_make_kernel_flags(struct base_config *config)
+{
+	uint64_t flags = 0;
 
 	switch (config->direction) {
 	case GPIOD_LINE_DIRECTION_INPUT:
-		*flags |= GPIO_V2_LINE_FLAG_INPUT;
+		flags |= GPIO_V2_LINE_FLAG_INPUT;
 		break;
 	case GPIOD_LINE_DIRECTION_OUTPUT:
-		*flags |= GPIO_V2_LINE_FLAG_OUTPUT;
-		break;
-	case GPIOD_LINE_DIRECTION_AS_IS:
-	case 0:
+		flags |= GPIO_V2_LINE_FLAG_OUTPUT;
 		break;
-	default:
-		goto err_inval;
 	}
 
 	switch (config->edge) {
 	case GPIOD_LINE_EDGE_FALLING:
-		*flags |= (GPIO_V2_LINE_FLAG_EDGE_FALLING |
+		flags |= (GPIO_V2_LINE_FLAG_EDGE_FALLING |
 			   GPIO_V2_LINE_FLAG_INPUT);
-		*flags &= ~GPIOD_LINE_DIRECTION_OUTPUT;
+		flags &= ~GPIOD_LINE_DIRECTION_OUTPUT;
 		break;
 	case GPIOD_LINE_EDGE_RISING:
-		*flags |= (GPIO_V2_LINE_FLAG_EDGE_RISING |
+		flags |= (GPIO_V2_LINE_FLAG_EDGE_RISING |
 			   GPIO_V2_LINE_FLAG_INPUT);
-		*flags &= ~GPIOD_LINE_DIRECTION_OUTPUT;
+		flags &= ~GPIOD_LINE_DIRECTION_OUTPUT;
 		break;
 	case GPIOD_LINE_EDGE_BOTH:
-		*flags |= (GPIO_V2_LINE_FLAG_EDGE_FALLING |
+		flags |= (GPIO_V2_LINE_FLAG_EDGE_FALLING |
 			   GPIO_V2_LINE_FLAG_EDGE_RISING |
 			   GPIO_V2_LINE_FLAG_INPUT);
-		*flags &= ~GPIOD_LINE_DIRECTION_OUTPUT;
-		break;
-	case GPIOD_LINE_EDGE_NONE:
-	case 0:
+		flags &= ~GPIOD_LINE_DIRECTION_OUTPUT;
 		break;
-	default:
-		goto err_inval;
 	}
 
 	switch (config->drive) {
 	case GPIOD_LINE_DRIVE_OPEN_DRAIN:
-		*flags |= GPIO_V2_LINE_FLAG_OPEN_DRAIN;
+		flags |= GPIO_V2_LINE_FLAG_OPEN_DRAIN;
 		break;
 	case GPIOD_LINE_DRIVE_OPEN_SOURCE:
-		*flags |= GPIO_V2_LINE_FLAG_OPEN_SOURCE;
-		break;
-	case GPIOD_LINE_DRIVE_PUSH_PULL:
-	case 0:
+		flags |= GPIO_V2_LINE_FLAG_OPEN_SOURCE;
 		break;
-	default:
-		goto err_inval;
 	}
 
 	switch (config->bias) {
 	case GPIOD_LINE_BIAS_DISABLED:
-		*flags |= GPIO_V2_LINE_FLAG_BIAS_DISABLED;
+		flags |= GPIO_V2_LINE_FLAG_BIAS_DISABLED;
 		break;
 	case GPIOD_LINE_BIAS_PULL_UP:
-		*flags |= GPIO_V2_LINE_FLAG_BIAS_PULL_UP;
+		flags |= GPIO_V2_LINE_FLAG_BIAS_PULL_UP;
 		break;
 	case GPIOD_LINE_BIAS_PULL_DOWN:
-		*flags |= GPIO_V2_LINE_FLAG_BIAS_PULL_DOWN;
+		flags |= GPIO_V2_LINE_FLAG_BIAS_PULL_DOWN;
 		break;
-	case GPIOD_LINE_BIAS_AS_IS:
-	case 0:
-		break;
-	default:
-		goto err_inval;
 	}
 
 	if (config->active_low)
-		*flags |= GPIO_V2_LINE_FLAG_ACTIVE_LOW;
+		flags |= GPIO_V2_LINE_FLAG_ACTIVE_LOW;
 
 	switch (config->clock) {
 	case GPIOD_LINE_EVENT_CLOCK_REALTIME:
-		*flags |= GPIO_V2_LINE_FLAG_EVENT_CLOCK_REALTIME;
+		flags |= GPIO_V2_LINE_FLAG_EVENT_CLOCK_REALTIME;
 		break;
-	case GPIOD_LINE_EVENT_CLOCK_MONOTONIC:
-	case 0:
-		break;
-	default:
-		goto err_inval;
 	}
 
-	return 0;
-
-err_inval:
-	errno = EINVAL;
-	return -1;
+	return flags;
 }
 
 static int find_bitmap_index(unsigned int needle, unsigned int num_lines,
@@ -597,7 +806,7 @@ int gpiod_line_config_to_kernel(struct gpiod_line_config *config,
 	struct gpio_v2_line_config_attribute *attr;
 	struct secondary_config *sec_cfg;
 	unsigned int attr_idx = 0, i;
-	uint64_t mask, values, flags;
+	uint64_t mask, values;
 	int ret;
 
 	if (!config) {
@@ -649,11 +858,8 @@ int gpiod_line_config_to_kernel(struct gpiod_line_config *config,
 		} else {
 			attr->attr.id = GPIO_V2_LINE_ATTR_ID_FLAGS;
 
-			ret = gpiod_make_kernel_flags(&flags, &sec_cfg->config);
-			if (ret)
-				return -1;
-
-			attr->attr.flags = flags;
+			attr->attr.flags = gpiod_make_kernel_flags(
+							&sec_cfg->config);
 		}
 
 		ret = set_secondary_mask(&mask, sec_cfg, num_lines, offsets);
@@ -663,11 +869,7 @@ int gpiod_line_config_to_kernel(struct gpiod_line_config *config,
 		attr->mask = mask;
 	}
 
-	ret = gpiod_make_kernel_flags(&flags, &config->primary);
-	if (ret)
-		return -1;
-
-	cfgbuf->flags = flags;
+	cfgbuf->flags = gpiod_make_kernel_flags(&config->primary);
 	cfgbuf->num_attrs = attr_idx;
 
 	return 0;
diff --git a/lib/request-config.c b/lib/request-config.c
index a678822..061946b 100644
--- a/lib/request-config.c
+++ b/lib/request-config.c
@@ -13,7 +13,7 @@
 struct gpiod_request_config {
 	char consumer[GPIO_MAX_NAME_SIZE];
 	unsigned int offsets[GPIO_V2_LINES_MAX];
-	unsigned int num_lines;
+	unsigned int num_offsets;
 	unsigned int event_buffer_size;
 };
 
@@ -46,20 +46,40 @@ gpiod_request_config_set_consumer(struct gpiod_request_config *config,
 	config->consumer[GPIO_MAX_NAME_SIZE - 1] = '\0';
 }
 
+GPIOD_API const char *
+gpiod_request_config_get_consumer(struct gpiod_request_config *config)
+{
+		return config->consumer;
+}
+
 GPIOD_API void
 gpiod_request_config_set_offsets(struct gpiod_request_config *config,
-				 unsigned int num_lines,
+				 unsigned int num_offsets,
 				 const unsigned int *offsets)
 {
 	unsigned int i;
 
-	config->num_lines = num_lines > GPIO_V2_LINES_MAX ? GPIO_V2_LINES_MAX
-							  : num_lines;
+	config->num_offsets = num_offsets > GPIO_V2_LINES_MAX ?
+					GPIO_V2_LINES_MAX : num_offsets;
 
-	for (i = 0; i < config->num_lines; i++)
+	for (i = 0; i < config->num_offsets; i++)
 		config->offsets[i] = offsets[i];
 }
 
+GPIOD_API unsigned int
+gpiod_request_config_get_num_offsets(struct gpiod_request_config *config)
+{
+	return config->num_offsets;
+}
+
+GPIOD_API void
+gpiod_request_config_get_offsets(struct gpiod_request_config *config,
+				 unsigned int *offsets)
+{
+	memcpy(offsets, config->offsets,
+	       sizeof(*offsets) * config->num_offsets);
+}
+
 GPIOD_API void
 gpiod_request_config_set_event_buffer_size(struct gpiod_request_config *config,
 					   unsigned int event_buffer_size)
@@ -67,20 +87,26 @@ gpiod_request_config_set_event_buffer_size(struct gpiod_request_config *config,
 	config->event_buffer_size = event_buffer_size;
 }
 
+GPIOD_API unsigned int
+gpiod_request_config_get_event_buffer_size(struct gpiod_request_config *config)
+{
+	return config->event_buffer_size;
+}
+
 int gpiod_request_config_to_kernel(struct gpiod_request_config *config,
 				   struct gpio_v2_line_request *reqbuf)
 {
 	unsigned int i;
 
-	if (config->num_lines == 0) {
+	if (config->num_offsets == 0) {
 		errno = EINVAL;
 		return -1;
 	}
 
-	for (i = 0; i < config->num_lines; i++)
+	for (i = 0; i < config->num_offsets; i++)
 		reqbuf->offsets[i] = config->offsets[i];
 
-	reqbuf->num_lines = config->num_lines;
+	reqbuf->num_lines = config->num_offsets;
 	strcpy(reqbuf->consumer, config->consumer);
 	reqbuf->event_buffer_size = config->event_buffer_size;
 
-- 
2.30.1

