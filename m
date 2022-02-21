Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9AD34BDC3D
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Feb 2022 18:41:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379353AbiBUPl1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Feb 2022 10:41:27 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:59118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235639AbiBUPl0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Feb 2022 10:41:26 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 733DE220F0
        for <linux-gpio@vger.kernel.org>; Mon, 21 Feb 2022 07:41:00 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id u1so27768022wrg.11
        for <linux-gpio@vger.kernel.org>; Mon, 21 Feb 2022 07:41:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6qfA8SE8AP/RhToWp2RyfFXMydodMW99o/eOdDh/qqA=;
        b=z+niMIvykiy6h6VXJkSZExv2J8XBqROZc+JnPT2/0kS6ixpkfzvNgsLTghGXNwNHL+
         fLw2XydG+zVjImcbcTC4Mb1sS9Vv/SsJWUiL19AakVIyP65sZTWDEKYgvRAjjBIolasE
         Oc89FPc23ujCm7MGd4sdBgvJwMbf6l/eIQc0tYGWO8sWHDx5TN3dOXBZf/xsszS5wgtN
         zWcuPlMAdF9ymEk8hN9Awc1UcsF1FYM298Xx6Uvv//0fQANbn2G+UedF4oi6lt3RHOf5
         9K2E0FsVpN5hkJEUv6/J4A2tuf7gBnXPF39nMOg9LHaEkKaKUpmFSMMRIqEx554ZIEdx
         u/ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6qfA8SE8AP/RhToWp2RyfFXMydodMW99o/eOdDh/qqA=;
        b=B151t3tceH/B19XQ9D1cTIsydCstDizbl7g+TqPIBuzQ9rafehAOHgIASy9BC9UlRA
         4Qal7fFiVylXFkdAouXTh50PJvVt1ys+odWDwqXzK7p0X3+L5kjK7ayusQ5Uwwb7V0UN
         5JY6XqL5HhLorN5P4KDdQSsLO0Z/jg42bmFhHsZJrD8JEQyIRLDcCCntSQgURRjz3Pqv
         f2nehu8VyOYheAcqwz+M6pbmp4eCHPfro4Hw32dvm8FipXCbxZQw8Pgkg/yLgLK90pzk
         Da6XB2PLsYh0ecxkcrFIHVHSlnyrXHoLQqnH3rUMFTZU6h61YGqt7/gS/gril9CUwEiN
         FuIg==
X-Gm-Message-State: AOAM5317pURXHV2XcjF/VuKBBcZfO9kS2STElPsOyxLNLbAqp2y3+WGO
        DgeQhwBK7rXA+sVdDjyLze2CIQ==
X-Google-Smtp-Source: ABdhPJxYS34FdFuta6/2+AFSX/MA9LVk+MNBZvgClq3TMfHHCrMtRAbowvFfOeLiLg6HyTBg2E84Vg==
X-Received: by 2002:a5d:4245:0:b0:1e3:5af:153c with SMTP id s5-20020a5d4245000000b001e305af153cmr16724159wrr.381.1645458058480;
        Mon, 21 Feb 2022 07:40:58 -0800 (PST)
Received: from debian-brgl.home ([2a01:cb1d:334:ac00:7d50:ff5:f5c1:e225])
        by smtp.gmail.com with ESMTPSA id f18sm13770099wre.66.2022.02.21.07.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 07:40:58 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [libgpiod v2][PATCH v2 1/2] line-config: expose the override logic to users
Date:   Mon, 21 Feb 2022 16:40:54 +0100
Message-Id: <20220221154055.654819-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20220221154055.654819-1-brgl@bgdev.pl>
References: <20220221154055.654819-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

We've already added getters for line-config but without exposing some
parts of the internal logic of the object, the user can't really get
the full picture and inspect the contents. This patch reworks the
accessors further by providing access to the underlying override
mechanism.

For every setting, we expose a getter and setter for the default value
as well as a set of four functions for setting, getting, clearing and
checking per-offset overrides.

An override can initially have the same value as the defaults but will
retain the overridden value should the defaults change.

We also complete the API by providing functions that allow to identify
offsets for which at least one setting is overriden.

This way the caller can fully inspect the line_config and high-level
language bindings can provide stringification methods.

While at it: we fix a couple bugs in the implementation of struct
line_config.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 include/gpiod.h   | 509 ++++++++++++++++++++-----------
 lib/line-config.c | 752 +++++++++++++++++++++++++++++-----------------
 tools/gpioget.c   |   6 +-
 tools/gpiomon.c   |   6 +-
 tools/gpioset.c   |   9 +-
 5 files changed, 821 insertions(+), 461 deletions(-)

diff --git a/include/gpiod.h b/include/gpiod.h
index 074e395..f8747e7 100644
--- a/include/gpiod.h
+++ b/include/gpiod.h
@@ -450,12 +450,37 @@ gpiod_info_event_get_line_info(struct gpiod_info_event *event);
  *
  * The line-config object stores the configuration for lines that can be used
  * in two cases: when making a line request and when reconfiguring a set of
- * already requested lines. The mutators for the line request don't return
- * errors. If the set of options is too complex to be translated into kernel
- * uAPI structures - the error will be returned at the time of the request or
- * reconfiguration. If an invalid value was passed to any of the getters - the
- * default value will be silently used instead. Each option can be set
- * globally, for a single line offset or for multiple line offsets.
+ * already requested lines.
+ *
+ * A new line-config object is instantiated containing a set of sane defaults
+ * for all supported configuration settings. Those defaults can be modified by
+ * the caller. Default values can be overridden by applying different values
+ * for specific line offsets. When making a request or reconfiguring an
+ * existing one, the overridden settings for specific offsets will be taken
+ * into account first and for every other offset and setting the defaults will
+ * be used.
+ *
+ * For every setting there are two mutators (one setting the default and one
+ * for the per-offset override), two getters (one for reading the global
+ * default and one for retrieving the effective value for given offset), a
+ * function for testing if a setting is overridden for given offset and finally
+ * a function for clearing the overrides (per offset).
+ *
+ * The mutators don't return errors. If the set of options is too complex to
+ * be translated into kernel uAPI structures - the error will be returned at
+ * the time of the request or reconfiguration. If an invalid value was passed
+ * to any of the mutators - the default value will be silently used instead.
+ *
+ * Operating on offsets in struct line_config has no effect on real GPIOs. It
+ * only manipulates the object in memory and is only applied to the hardware
+ * at the time of the request or reconfiguration.
+ *
+ * Overrides set for offsets that don't end up being requested are silently
+ * ignored both in ::gpiod_chip_request_lines as well as in
+ * ::gpiod_line_request_reconfigure_lines.
+ *
+ * In cases where all requested lines are using the global defaults, the
+ * offsets can be entirely ignored when preparing the line configuration.
  */
 
 /**
@@ -480,329 +505,424 @@ void gpiod_line_config_free(struct gpiod_line_config *config);
 void gpiod_line_config_reset(struct gpiod_line_config *config);
 
 /**
- * @brief Set the direction of all lines.
+ * @brief Set the default direction setting.
  * @param config Line config object.
  * @param direction New direction.
  */
-void gpiod_line_config_set_direction(struct gpiod_line_config *config,
-				     int direction);
+void gpiod_line_config_set_direction_default(struct gpiod_line_config *config,
+					     int direction);
 
 /**
- * @brief Set the direction for a single line at given offset.
+ * @brief Set the direction override at given offset.
  * @param config Line config object.
  * @param direction New direction.
- * @param offset Offset of the line for which to set the direction.
+ * @param offset Offset of the line for which to set the override.
  */
-void gpiod_line_config_set_direction_offset(struct gpiod_line_config *config,
-					    int direction, unsigned int offset);
+void gpiod_line_config_set_direction_override(struct gpiod_line_config *config,
+					      int direction,
+					      unsigned int offset);
 
 /**
- * @brief Set the direction for a subset of lines.
+ * @brief Clear the direction override at given offset.
  * @param config Line config object.
- * @param direction New direction.
- * @param num_offsets Number of offsets in the array.
- * @param offsets Array of line offsets for which to set the direction.
+ * @param offset Offset of the line for which to clear the override.
+ * @note Does nothing if no override is set for this line.
  */
-void gpiod_line_config_set_direction_subset(struct gpiod_line_config *config,
-					    int direction,
-					    unsigned int num_offsets,
-					    const unsigned int *offsets);
+void
+gpiod_line_config_clear_direction_override(struct gpiod_line_config *config,
+					   unsigned int offset);
+
+/**
+ * @brief Check if the direction setting is overridden at given offset.
+ * @param config Line config object.
+ * @param offset Offset of the line for which to check the override.
+ * @return True if direction is overridden at this offset, false otherwise.
+ */
+bool gpiod_line_config_direction_is_overridden(struct gpiod_line_config *config,
+					       unsigned int offset);
 
 /**
- * @brief Get the direction setting for a given line.
+ * @brief Get the default direction setting.
+ * @param config Line config object.
+ * @return Direction setting that would have been used for any non-overridden
+ *         offset.
+ */
+int gpiod_line_config_get_direction_default(struct gpiod_line_config *config);
+
+/**
+ * @brief Get the direction setting for a given offset.
  * @param config Line config object.
  * @param offset Line offset for which to read the direction setting.
  * @return Direction setting that would have been used for given offset if the
  *         config object was used in a request at the time of the call.
- * @note If an offset is used for which no config was provided, the function
- *       will return the global default value.
  */
-int gpiod_line_config_get_direction(struct gpiod_line_config *config,
-				    unsigned int offset);
+int gpiod_line_config_get_direction_offset(struct gpiod_line_config *config,
+					   unsigned int offset);
 
 /**
- * @brief Set the edge event detection for all lines.
+ * @brief Set the default edge event detection.
  * @param config Line config object.
  * @param edge Type of edge events to detect.
  */
-void gpiod_line_config_set_edge_detection(struct gpiod_line_config *config,
-					  int edge);
+void
+gpiod_line_config_set_edge_detection_default(struct gpiod_line_config *config,
+					     int edge);
 
 /**
- * @brief Set the edge event detection for a single line at given offset.
+ * @brief Set the edge detection override at given offset.
  * @param config Line config object.
- * @param edge Type of edge events to detect.
- * @param offset Offset of the line for which to set the edge detection.
+ * @param edge New edge detection setting.
+ * @param offset Offset of the line for which to set the override.
  */
 void
-gpiod_line_config_set_edge_detection_offset(struct gpiod_line_config *config,
-					    int edge, unsigned int offset);
+gpiod_line_config_set_edge_detection_override(struct gpiod_line_config *config,
+					      int edge, unsigned int offset);
 
 /**
- * @brief Set the edge event detection for a subset of lines.
+ * @brief Clear the edge detection override at given offset.
  * @param config Line config object.
- * @param edge Type of edge events to detect.
- * @param num_offsets Number of offsets in the array.
- * @param offsets Array of line offsets for which to set the edge detection.
+ * @param offset Offset of the line for which to clear the override.
+ * @note Does nothing if no override is set for this line.
  */
 void
-gpiod_line_config_set_edge_detection_subset(struct gpiod_line_config *config,
-					    int edge, unsigned int num_offsets,
-					    const unsigned int *offsets);
+gpiod_line_config_clear_edge_detection_override(
+			struct gpiod_line_config *config, unsigned int offset);
+
+/**
+ * @brief Check if the edge detection setting is overridden at given offset.
+ * @param config Line config object.
+ * @param offset Offset of the line for which to check the override.
+ * @return True if edge detection is overridden at this offset, false otherwise.
+ */
+bool
+gpiod_line_config_edge_detection_is_overridden(struct gpiod_line_config *config,
+					       unsigned int offset);
 
 /**
- * @brief Get the edge event detection setting for a given line.
+ * @brief Get the default edge detection setting.
+ * @param config Line config object.
+ * @return Edge detection setting that would have been used for any offset not
+ *         assigned its own direction value.
+ */
+int
+gpiod_line_config_get_edge_detection_default(struct gpiod_line_config *config);
+
+/**
+ * @brief Get the edge event detection setting for a given offset.
  * @param config Line config object.
  * @param offset Line offset for which to read the edge event detection setting.
  * @return Edge event detection setting that would have been used for given
  *         offset if the config object was used in a request at the time of
  *         the call.
- * @note If an offset is used for which no config was provided, the function
- *       will return the global default value.
  */
-int gpiod_line_config_get_edge_detection(struct gpiod_line_config *config,
-					 unsigned int offset);
+int
+gpiod_line_config_get_edge_detection_offset(struct gpiod_line_config *config,
+					    unsigned int offset);
 
 /**
- * @brief Set the bias of all lines.
+ * @brief Set the default bias setting.
  * @param config Line config object.
  * @param bias New bias.
  */
-void gpiod_line_config_set_bias(struct gpiod_line_config *config, int bias);
+void gpiod_line_config_set_bias_default(struct gpiod_line_config *config,
+					int bias);
 
 /**
- * @brief Set the bias for a single line at given offset.
+ * @brief Set the bias override at given offset.
  * @param config Line config object.
- * @param bias New bias.
- * @param offset Offset of the line for which to set the bias.
+ * @param bias New bias setting.
+ * @param offset Offset of the line for which to set the override.
  */
-void gpiod_line_config_set_bias_offset(struct gpiod_line_config *config,
-				       int bias, unsigned int offset);
+void gpiod_line_config_set_bias_override(struct gpiod_line_config *config,
+					 int bias, unsigned int offset);
 
 /**
- * @brief Set the bias for a subset of lines.
+ * @brief Clear the bias override at given offset.
  * @param config Line config object.
- * @param bias New bias.
- * @param num_offsets Number of offsets in the array.
- * @param offsets Array of line offsets for which to set the bias.
+ * @param offset Offset of the line for which to clear the override.
+ * @note Does nothing if no override is set for this line.
+ */
+void gpiod_line_config_clear_bias_override(struct gpiod_line_config *config,
+					   unsigned int offset);
+
+/**
+ * @brief Check if the bias setting is overridden at given offset.
+ * @param config Line config object.
+ * @param offset Offset of the line for which to check the override.
+ * @return True if bias is overridden at this offset, false otherwise.
+ */
+bool gpiod_line_config_bias_is_overridden(struct gpiod_line_config *config,
+					  unsigned int offset);
+/**
+ * @brief Get the default bias setting.
+ * @param config Line config object.
+ * @return Bias setting that would have been used for any offset not assigned
+ *         its own direction value.
  */
-void gpiod_line_config_set_bias_subset(struct gpiod_line_config *config,
-				       int bias, unsigned int num_offsets,
-				       const unsigned int *offsets);
+int gpiod_line_config_get_bias_default(struct gpiod_line_config *config);
 
 /**
- * @brief Get the bias setting for a given line.
+ * @brief Get the bias setting for a given offset.
  * @param config Line config object.
  * @param offset Line offset for which to read the bias setting.
  * @return Bias setting that would have been used for given offset if the
  *         config object was used in a request at the time of the call.
- * @note If an offset is used for which no config was provided, the function
- *       will return the global default value.
  */
-int gpiod_line_config_get_bias(struct gpiod_line_config *config,
+int gpiod_line_config_get_bias_offset(struct gpiod_line_config *config,
 			       unsigned int offset);
 
 /**
- * @brief Set the drive of all lines.
+ * @brief Set the default drive setting.
  * @param config Line config object.
  * @param drive New drive.
  */
-void gpiod_line_config_set_drive(struct gpiod_line_config *config, int drive);
+void gpiod_line_config_set_drive_default(struct gpiod_line_config *config,
+					 int drive);
 
 /**
- * @brief Set the drive for a single line at given offset.
+ * @brief Set the drive override at given offset.
  * @param config Line config object.
- * @param drive New drive.
- * @param offset Offset of the line for which to set the drive.
+ * @param drive New drive setting.
+ * @param offset Offset of the line for which to set the override.
  */
-void gpiod_line_config_set_drive_offset(struct gpiod_line_config *config,
-					int drive, unsigned int offset);
+void gpiod_line_config_set_drive_override(struct gpiod_line_config *config,
+					  int drive, unsigned int offset);
 
 /**
- * @brief Set the drive for a subset of lines.
+ * @brief Clear the drive override at given offset.
  * @param config Line config object.
- * @param drive New drive.
- * @param num_offsets Number of offsets in the array.
- * @param offsets Array of line offsets for which to set the drive.
+ * @param offset Offset of the line for which to clear the override.
+ * @note Does nothing if no override is set for this line.
  */
-void gpiod_line_config_set_drive_subset(struct gpiod_line_config *config,
-					int drive, unsigned int num_offsets,
-					const unsigned int *offsets);
+void gpiod_line_config_clear_drive_override(struct gpiod_line_config *config,
+					    unsigned int offset);
 
 /**
- * @brief Get the drive setting for a given line.
+ * @brief Check if the drive setting is overridden at given offset.
  * @param config Line config object.
- * @param offset Line offset for which to read the drive setting.
- * @return Drive setting that would have been used for given offset if the
- *         config object was used in a request at the time of the call.
- * @note If an offset is used for which no config was provided, the function
- *       will return the global default value.
+ * @param offset Offset of the line for which to check the override.
+ * @return True if drive is overridden at this offset, false otherwise.
  */
-int gpiod_line_config_get_drive(struct gpiod_line_config *config,
-				unsigned int offset);
+bool gpiod_line_config_drive_is_overridden(struct gpiod_line_config *config,
+					   unsigned int offset);
 
 /**
- * @brief Set all lines as active-low.
+ * @brief Get the default drive setting.
  * @param config Line config object.
+ * @return Drive setting that would have been used for any offset not assigned
+ *         its own direction value.
  */
-void gpiod_line_config_set_active_low(struct gpiod_line_config *config);
+int gpiod_line_config_get_drive_default(struct gpiod_line_config *config);
 
 /**
- * @brief Set a single line as active-low.
+ * @brief Get the drive setting for a given offset.
  * @param config Line config object.
- * @param offset Offset of the line for which to set the active setting.
+ * @param offset Line offset for which to read the drive setting.
+ * @return Drive setting that would have been used for given offset if the
+ *         config object was used in a request at the time of the call.
  */
-void gpiod_line_config_set_active_low_offset(struct gpiod_line_config *config,
-					     unsigned int offset);
+int gpiod_line_config_get_drive_offset(struct gpiod_line_config *config,
+				       unsigned int offset);
 
 /**
- * @brief Set a subset of lines as active-low.
+ * @brief Set lines to active-low by default.
  * @param config Line config object.
- * @param num_offsets Number of offsets in the array.
- * @param offsets Array of line offsets for which to set the active setting.
+ * @param active_low New active-low setting.
  */
-void gpiod_line_config_set_active_low_subset(struct gpiod_line_config *config,
-					     unsigned int num_offsets,
-					     const unsigned int *offsets);
+void gpiod_line_config_set_active_low_default(struct gpiod_line_config *config,
+					      bool active_low);
 
 /**
- * @brief Check if the line at given offset was configured as active-low.
+ * @brief Override the active-low setting at given offset.
  * @param config Line config object.
- * @param offset Line offset for which to read the active-low setting.
- * @return Active-low setting that would have been used for given offset if the
- *         config object was used in a request at the time of the call.
- * @note If an offset is used for which no config was provided, the function
- *       will return the global default value.
+ * @param active_low New active-low setting.
+ * @param offset Offset of the line for which to set the override.
  */
-bool gpiod_line_config_get_active_low(struct gpiod_line_config *config,
-				      unsigned int offset);
+void gpiod_line_config_set_active_low_override(struct gpiod_line_config *config,
+					       bool active_low,
+					       unsigned int offset);
 
 /**
- * @brief Set all lines as active-high.
+ * @brief Clear the active-low override at given offset.
  * @param config Line config object.
+ * @param offset Offset of the line for which to clear the override.
+ * @note Does nothing if no override is set for this line.
  */
-void gpiod_line_config_set_active_high(struct gpiod_line_config *config);
+void
+gpiod_line_config_clear_active_low_override(struct gpiod_line_config *config,
+					    unsigned int offset);
 
 /**
- * @brief Set a single line as active-high.
+ * @brief Check if the active-low setting is overridden at given offset.
  * @param config Line config object.
- * @param offset Offset of the line for which to set the active setting.
+ * @param offset Offset of the line for which to check the override.
+ * @return True if active-low is overridden at this offset, false otherwise.
  */
-void gpiod_line_config_set_active_high_offset(struct gpiod_line_config *config,
-					      unsigned int offset);
+bool
+gpiod_line_config_active_low_is_overridden(struct gpiod_line_config *config,
+					   unsigned int offset);
 
 /**
- * @brief Set a subset of lines as active-high.
+ * @brief Check if active-low is the default setting.
  * @param config Line config object.
- * @param num_offsets Number of offsets in the array.
- * @param offsets Array of line offsets for which to set the active setting.
+ * @return Active-low setting that would have been used for any offset not
+ *         assigned its own value.
  */
-void gpiod_line_config_set_active_high_subset(struct gpiod_line_config *config,
-					      unsigned int num_offsets,
-					      const unsigned int *offsets);
+bool gpiod_line_config_get_active_low_default(struct gpiod_line_config *config);
 
 /**
- * @brief Set the debounce period for all lines.
+ * @brief Check if the line at given offset was configured as active-low.
  * @param config Line config object.
- * @param period New debounce period. Disables debouncing if 0.
+ * @param offset Line offset for which to read the active-low setting.
+ * @return Active-low setting that would have been used for given offset if the
+ *         config object was used in a request at the time of the call.
  */
-void gpiod_line_config_set_debounce_period_us(struct gpiod_line_config *config,
-					      unsigned long period);
+bool gpiod_line_config_get_active_low_offset(struct gpiod_line_config *config,
+					     unsigned int offset);
 
 /**
- * @brief Set the debounce period for a single line at given offset.
+ * @brief Set the default debounce period.
  * @param config Line config object.
  * @param period New debounce period. Disables debouncing if 0.
- * @param offset Offset of the line for which to set the debounce period.
+ */
+void gpiod_line_config_set_debounce_period_us_default(
+		struct gpiod_line_config *config, unsigned long period);
+
+/**
+ * @brief Override the debounce period setting at given offset.
+ * @param config Line config object.
+ * @param period New debounce period in microseconds.
+ * @param offset Offset of the line for which to set the override.
  */
 void
-gpiod_line_config_set_debounce_period_us_offset(
+gpiod_line_config_set_debounce_period_us_override(
 					struct gpiod_line_config *config,
 					unsigned long period,
 					unsigned int offset);
 
 /**
- * @brief Set the debounce period for a subset of lines.
+ * @brief Clear the debounce period override at given offset.
  * @param config Line config object.
- * @param period New debounce period. Disables debouncing if 0.
- * @param num_offsets Number of offsets in the array.
- * @param offsets Array of line offsets for which to set the debounce period.
+ * @param offset Offset of the line for which to clear the override.
+ * @note Does nothing if no override is set for this line.
  */
-void
-gpiod_line_config_set_debounce_period_us_subset(
+void gpiod_line_config_clear_debounce_period_us_override(
 					struct gpiod_line_config *config,
-					unsigned long period,
-					unsigned int num_offsets,
-					const unsigned int *offsets);
+					unsigned int offset);
+
+/**
+ * @brief Check if the debounce period setting is overridden at given offset.
+ * @param config Line config object.
+ * @param offset Offset of the line for which to check the override.
+ * @return True if debounce period is overridden at this offset, false
+ *         otherwise.
+ */
+bool gpiod_line_config_debounce_period_us_is_overridden(
+					struct gpiod_line_config *config,
+					unsigned int offset);
+
+/**
+ * @brief Get the default debounce period.
+ * @param config Line config object.
+ * @return Debounce period that would have been used for any offset not
+ *         assigned its own debounce period. 0 if not debouncing is disabled.
+ */
+unsigned long gpiod_line_config_get_debounce_period_us_default(
+					struct gpiod_line_config *config);
 
 /**
- * @brief Get the debounce period for a given line.
+ * @brief Get the debounce period for a given offset.
  * @param config Line config object.
  * @param offset Line offset for which to read the debounce period.
  * @return Debounce period that would have been used for given offset if the
- *         config object was used in a request at the time of the call.
- * @note If an offset is used for which no config was provided, the function
- *       will return the global default value.
+ *         config object was used in a request at the time of the call. 0 if
+ *         debouncing is disabled.
  */
 unsigned long
-gpiod_line_config_get_debounce_us_period(struct gpiod_line_config *config,
-					 unsigned int offset);
+gpiod_line_config_get_debounce_period_us_offset(
+			struct gpiod_line_config *config, unsigned int offset);
 
 /**
- * @brief Set the event timestamp clock for all lines.
+ * @brief Set the default event timestamp clock.
  * @param config Line config object.
  * @param clock New clock to use.
  */
-void gpiod_line_config_set_event_clock(struct gpiod_line_config *config,
-				       int clock);
+void gpiod_line_config_set_event_clock_default(struct gpiod_line_config *config,
+					       int clock);
 
 /**
- * @brief Set the event clock for a single line at given offset.
+ * @brief Override the event clock setting at given offset.
  * @param config Line config object.
  * @param clock New event clock to use.
- * @param offset Offset of the line for which to set the event clock type.
+ * @param offset Offset of the line for which to set the override.
  */
-void gpiod_line_config_set_event_clock_offset(struct gpiod_line_config *config,
-					      int clock, unsigned int offset);
+void
+gpiod_line_config_set_event_clock_override(struct gpiod_line_config *config,
+					   int clock, unsigned int offset);
 
 /**
- * @brief Set the event clock for a subset of lines.
+ * @brief Clear the event clock override at given offset.
  * @param config Line config object.
- * @param clock New event clock to use.
- * @param num_offsets Number of offsets in the array.
- * @param offsets Array of line offsets for which to set the event clock type.
+ * @param offset Offset of the line for which to clear the override.
+ * @note Does nothing if no override is set for this line.
+ */
+void
+gpiod_line_config_clear_event_clock_override(struct gpiod_line_config *config,
+					     unsigned int offset);
+
+/**
+ * @brief Check if the event clock setting is overridden at given offset.
+ * @param config Line config object.
+ * @param offset Offset of the line for which to check the override.
+ * @return True if event clock period is overridden at this offset, false
+ *         otherwise.
  */
-void gpiod_line_config_set_event_clock_subset(struct gpiod_line_config *config,
-					      int clock,
-					      unsigned int num_offsets,
-					      const unsigned int *offsets);
+bool
+gpiod_line_config_event_clock_is_overridden(struct gpiod_line_config *config,
+					    unsigned int offset);
 
 /**
- * @brief Get the event clock setting for a given line.
+ * @brief Get the default event clock setting.
+ * @param config Line config object.
+ * @return Event clock setting that would have been used for any offset not
+ *         assigned its own direction value.
+ */
+int gpiod_line_config_get_event_clock_default(struct gpiod_line_config *config);
+
+/**
+ * @brief Get the event clock setting for a given offset.
  * @param config Line config object.
  * @param offset Line offset for which to read the event clock setting.
  * @return Event clock setting that would have been used for given offset if
  *         the config object was used in a request at the time of the call.
- * @note If an offset is used for which no config was provided, the function
- *       will return the global default value.
  */
-int gpiod_line_config_get_event_clock(struct gpiod_line_config *config,
-				      unsigned int offset);
+int gpiod_line_config_get_event_clock_offset(struct gpiod_line_config *config,
+					     unsigned int offset);
+
+/**
+ * @brief Set the default output value.
+ * @param config Line config object.
+ * @param value New value.
+ */
+void
+gpiod_line_config_set_output_value_default(struct gpiod_line_config *config,
+					   int value);
 
 /**
- * @brief Set the output value for a single offset.
+ * @brief Override the output value for a single offset.
  * @param config Line config object.
  * @param offset Offset of the line.
  * @param value Output value to set.
  */
-void gpiod_line_config_set_output_value(struct gpiod_line_config *config,
-					unsigned int offset, int value);
+void
+gpiod_line_config_set_output_value_override(struct gpiod_line_config *config,
+					    unsigned int offset, int value);
 
 /**
- * @brief Set the output values for a set of offsets.
+ * @brief Override the output values for multiple offsets.
  * @param config Line config object.
- * @param num_values Number of offsets for which to set values.
- * @param offsets Array of line offsets to set values for.
+ * @param num_values Number of offsets for which to override values.
+ * @param offsets Array of line offsets to override values for.
  * @param values Array of output values associated with the offsets passed in
  *               the previous argument.
  */
@@ -811,14 +931,65 @@ void gpiod_line_config_set_output_values(struct gpiod_line_config *config,
 					 const unsigned int *offsets,
 					 const int *values);
 
+/**
+ * @brief Clear the output value override at given offset.
+ * @param config Line config object.
+ * @param offset Offset of the line for which to clear the override.
+ * @note Does nothing if no override is set for this line.
+ */
+void
+gpiod_line_config_clear_output_value_override(struct gpiod_line_config *config,
+					      unsigned int offset);
+
+/**
+ * @brief Check if the output value is overridden at given offset.
+ * @param config Line config object.
+ * @param offset Offset of the line for which to check the override.
+ * @return True if output value period is overridden at this offset, false
+ *         otherwise.
+ */
+bool
+gpiod_line_config_output_value_is_overridden(struct gpiod_line_config *config,
+					     unsigned int offset);
+
+/**
+ * @brief Get the default output value.
+ * @param config Line config object.
+ * @return Output value that would have been used for any offset not
+ *         assigned its own output value.
+ */
+int
+gpiod_line_config_get_output_value_default(struct gpiod_line_config *config);
+
 /**
  * @brief Get the output value configured for a given line.
  * @param config Line config object.
  * @param offset Line offset for which to read the value.
- * @return 1 or 0 if the value was configured for this line, -1 otherwise.
+ * @return Output value that would have been used for given offset if the
+ *         config object was used in a request at the time of the call.
  */
-int gpiod_line_config_get_output_value(struct gpiod_line_config *config,
-				       unsigned int offset);
+int gpiod_line_config_get_output_value_offset(struct gpiod_line_config *config,
+					      unsigned int offset);
+
+/**
+ * @brief Get the number of offsets for which this config object contains
+ *        at least one setting that is different from the defaults.
+ * @param config Line config object.
+ * @return Number of offsets with at least one overridden setting.
+ */
+unsigned int
+gpiod_line_config_get_num_overridden_offsets(struct gpiod_line_config *config);
+
+/**
+ * @brief Get the offsets for which this config object contains at least one
+ *        setting that is different from the defaults.
+ * @param config Line config object.
+ * @param offsets Array to store the offsets. Must hold at least the number
+ *                of offsets returned by
+ *                ::gpiod_line_config_get_num_overridden_offsets.
+ */
+void gpiod_line_config_get_overridden_offsets(struct gpiod_line_config *config,
+					      unsigned int *offsets);
 
 /**
  * @}
diff --git a/lib/line-config.c b/lib/line-config.c
index 346d331..2a656ae 100644
--- a/lib/line-config.c
+++ b/lib/line-config.c
@@ -18,6 +18,7 @@ struct base_config {
 	bool active_low : 1;
 	unsigned int clock : 2;
 	unsigned long debounce_period_us;
+	unsigned int value : 1;
 } GPIOD_PACKED;
 
 #define OVERRIDE_FLAG_DIRECTION		GPIOD_BIT(0)
@@ -27,6 +28,7 @@ struct base_config {
 #define OVERRIDE_FLAG_ACTIVE_LOW	GPIOD_BIT(4)
 #define OVERRIDE_FLAG_CLOCK		GPIOD_BIT(5)
 #define OVERRIDE_FLAG_DEBOUNCE_PERIOD	GPIOD_BIT(6)
+#define OVERRIDE_FLAG_OUTPUT_VALUE	GPIOD_BIT(7)
 
 /*
  * Config overriding the defaults for a single line offset. Only flagged
@@ -35,16 +37,13 @@ struct base_config {
 struct override_config {
 	struct base_config base;
 	unsigned int offset;
-	bool value_set : 1;
-	unsigned int value : 1;
-	unsigned int override_flags : 7;
+	unsigned int override_flags : 8;
 } GPIOD_PACKED;
 
 struct gpiod_line_config {
 	bool too_complex;
 	struct base_config defaults;
 	struct override_config overrides[GPIO_V2_LINES_MAX];
-	unsigned int num_overrides;
 };
 
 static void init_base_config(struct base_config *config)
@@ -58,6 +57,17 @@ static void init_base_config(struct base_config *config)
 	config->debounce_period_us = 0;
 }
 
+static void init_override_config(struct override_config *override)
+{
+	override->override_flags = 0;
+	init_base_config(&override->base);
+}
+
+static bool override_used(struct override_config *override)
+{
+	return !!override->override_flags;
+}
+
 GPIOD_API struct gpiod_line_config *gpiod_line_config_new(void)
 {
 	struct gpiod_line_config *config;
@@ -82,8 +92,8 @@ GPIOD_API void gpiod_line_config_reset(struct gpiod_line_config *config)
 
 	memset(config, 0, sizeof(*config));
 	init_base_config(&config->defaults);
-	for (i = 0; i < GPIO_V2_LINE_NUM_ATTRS_MAX; i++)
-		init_base_config(&config->overrides[i].base);
+	for (i = 0; i < GPIO_V2_LINES_MAX; i++)
+		init_override_config(&config->overrides[i]);
 }
 
 static struct override_config *
@@ -92,7 +102,7 @@ get_override_by_offset(struct gpiod_line_config *config, unsigned int offset)
 	struct override_config *override;
 	unsigned int i;
 
-	for (i = 0; i < config->num_overrides; i++) {
+	for (i = 0; i < GPIO_V2_LINES_MAX; i++) {
 		override = &config->overrides[i];
 
 		if (override->offset == offset)
@@ -103,19 +113,24 @@ get_override_by_offset(struct gpiod_line_config *config, unsigned int offset)
 }
 
 static struct override_config *
-get_new_override(struct gpiod_line_config *config, unsigned int offset)
+get_free_override(struct gpiod_line_config *config, unsigned int offset)
 {
 	struct override_config *override;
+	unsigned int i;
 
-	if (config->num_overrides == GPIO_V2_LINES_MAX) {
-		config->too_complex = true;
-		return NULL;
-	}
+	for (i = 0; i < GPIO_V2_LINES_MAX; i++) {
+		override = &config->overrides[i];
 
-	override = &config->overrides[config->num_overrides++];
-	override->offset = offset;
+		if (override->override_flags)
+			continue;
 
-	return override;
+		override->offset = offset;
+		return override;
+	}
+
+	/* No more free overrides. */
+	config->too_complex = true;
+	return NULL;
 }
 
 static struct override_config *
@@ -129,7 +144,7 @@ get_override_config_for_writing(struct gpiod_line_config *config,
 
 	override = get_override_by_offset(config, offset);
 	if (!override) {
-		override = get_new_override(config, offset);
+		override = get_free_override(config, offset);
 		if (!override)
 			return NULL;
 	}
@@ -139,7 +154,7 @@ get_override_config_for_writing(struct gpiod_line_config *config,
 
 static struct base_config *
 get_base_config_for_reading(struct gpiod_line_config *config,
-			   unsigned int offset, unsigned int flag)
+			    unsigned int offset, unsigned int flag)
 {
 	struct override_config *override;
 
@@ -150,6 +165,35 @@ get_base_config_for_reading(struct gpiod_line_config *config,
 	return &config->defaults;
 }
 
+static void clear_override(struct gpiod_line_config *config,
+			   unsigned int offset, int flag)
+{
+	struct override_config *override;
+
+	override = get_override_config_for_writing(config, offset);
+	if (!override)
+		return;
+
+	if (override->override_flags & flag) {
+		override->override_flags &= ~flag;
+
+		if (!override->override_flags)
+			init_override_config(override);
+	}
+}
+
+static bool check_override(struct gpiod_line_config *config,
+			   unsigned int offset, int flag)
+{
+	struct override_config *override;
+
+	override = get_override_config_for_writing(config, offset);
+	if (!override)
+		return false;
+
+	return override->override_flags & flag;
+}
+
 static void set_direction(struct base_config *config, int direction)
 {
 	switch (direction) {
@@ -165,38 +209,49 @@ static void set_direction(struct base_config *config, int direction)
 }
 
 GPIOD_API void
-gpiod_line_config_set_direction(struct gpiod_line_config *config, int direction)
+gpiod_line_config_set_direction_default(struct gpiod_line_config *config,
+					int direction)
 {
 	set_direction(&config->defaults, direction);
 }
 
 GPIOD_API void
-gpiod_line_config_set_direction_offset(struct gpiod_line_config *config,
+gpiod_line_config_set_direction_override(struct gpiod_line_config *config,
 				       int direction, unsigned int offset)
 {
-	gpiod_line_config_set_direction_subset(config, direction, 1, &offset);
+	struct override_config *override;
+
+	override = get_override_config_for_writing(config, offset);
+	if (!override)
+		return;
+
+	set_direction(&override->base, direction);
+	override->override_flags |= OVERRIDE_FLAG_DIRECTION;
 }
 
 GPIOD_API void
-gpiod_line_config_set_direction_subset(struct gpiod_line_config *config,
-				       int direction, unsigned int num_offsets,
-				       const unsigned int *offsets)
+gpiod_line_config_clear_direction_override(struct gpiod_line_config *config,
+					   unsigned int offset)
 {
-	struct override_config *override;
-	unsigned int i;
+	clear_override(config, offset, OVERRIDE_FLAG_DIRECTION);
+}
 
-	for (i = 0; i < num_offsets; i++) {
-		override = get_override_config_for_writing(config, offsets[i]);
-		if (!override)
-			return;
+GPIOD_API bool
+gpiod_line_config_direction_is_overridden(struct gpiod_line_config *config,
+					 unsigned int offset)
+{
+	return check_override(config, offset, OVERRIDE_FLAG_DIRECTION);
+}
 
-		set_direction(&override->base, direction);
-		override->override_flags |= OVERRIDE_FLAG_DIRECTION;
-	}
+GPIOD_API int
+gpiod_line_config_get_direction_default(struct gpiod_line_config *config)
+{
+	return config->defaults.direction;
 }
 
-GPIOD_API int gpiod_line_config_get_direction(struct gpiod_line_config *config,
-					      unsigned int offset)
+GPIOD_API int
+gpiod_line_config_get_direction_offset(struct gpiod_line_config *config,
+				       unsigned int offset)
 {
 	struct base_config *base;
 
@@ -222,39 +277,49 @@ static void set_edge_detection(struct base_config *config, int edge)
 }
 
 GPIOD_API void
-gpiod_line_config_set_edge_detection(struct gpiod_line_config *config, int edge)
+gpiod_line_config_set_edge_detection_default(struct gpiod_line_config *config,
+					     int edge)
 {
 	set_edge_detection(&config->defaults, edge);
 }
 
 GPIOD_API void
-gpiod_line_config_set_edge_detection_offset(struct gpiod_line_config *config,
-					    int edge, unsigned int offset)
+gpiod_line_config_set_edge_detection_override(struct gpiod_line_config *config,
+					      int edge, unsigned int offset)
 {
-	gpiod_line_config_set_edge_detection_subset(config, edge, 1, &offset);
+	struct override_config *override;
+
+	override = get_override_config_for_writing(config, offset);
+	if (!override)
+		return;
+
+	set_edge_detection(&override->base, edge);
+	override->override_flags |= OVERRIDE_FLAG_EDGE;
 }
 
 GPIOD_API void
-gpiod_line_config_set_edge_detection_subset(struct gpiod_line_config *config,
-					    int edge, unsigned int num_offsets,
-					    const unsigned int *offsets)
+gpiod_line_config_clear_edge_detection_override(
+			struct gpiod_line_config *config, unsigned int offset)
 {
-	struct override_config *override;
-	unsigned int i;
+	clear_override(config, offset, OVERRIDE_FLAG_EDGE);
+}
 
-	for (i = 0; i < num_offsets; i++) {
-		override = get_override_config_for_writing(config, offsets[i]);
-		if (!override)
-			return;
+GPIOD_API bool
+gpiod_line_config_edge_detection_is_overridden(struct gpiod_line_config *config,
+					      unsigned int offset)
+{
+	return check_override(config, offset, OVERRIDE_FLAG_EDGE);
+}
 
-		set_edge_detection(&override->base, edge);
-		override->override_flags |= OVERRIDE_FLAG_EDGE;
-	}
+GPIOD_API int
+gpiod_line_config_get_edge_detection_default(struct gpiod_line_config *config)
+{
+	return config->defaults.edge;
 }
 
 GPIOD_API int
-gpiod_line_config_get_edge_detection(struct gpiod_line_config *config,
-				     unsigned int offset)
+gpiod_line_config_get_edge_detection_offset(struct gpiod_line_config *config,
+					    unsigned int offset)
 {
 	struct base_config *base;
 
@@ -279,38 +344,48 @@ static void set_bias(struct base_config *config, int bias)
 }
 
 GPIOD_API void
-gpiod_line_config_set_bias(struct gpiod_line_config *config, int bias)
+gpiod_line_config_set_bias_default(struct gpiod_line_config *config, int bias)
 {
 	set_bias(&config->defaults, bias);
 }
 
 GPIOD_API void
-gpiod_line_config_set_bias_offset(struct gpiod_line_config *config,
+gpiod_line_config_set_bias_override(struct gpiod_line_config *config,
 				  int bias, unsigned int offset)
 {
-	gpiod_line_config_set_bias_subset(config, bias, 1, &offset);
+	struct override_config *override;
+
+	override = get_override_config_for_writing(config, offset);
+	if (!override)
+		return;
+
+	set_bias(&override->base, bias);
+	override->override_flags |= OVERRIDE_FLAG_BIAS;
 }
 
 GPIOD_API void
-gpiod_line_config_set_bias_subset(struct gpiod_line_config *config,
-				  int bias, unsigned int num_offsets,
-				  const unsigned int *offsets)
+gpiod_line_config_clear_bias_override(struct gpiod_line_config *config,
+				      unsigned int offset)
 {
-	struct override_config *override;
-	unsigned int i;
+	clear_override(config, offset, OVERRIDE_FLAG_BIAS);
+}
 
-	for (i = 0; i < num_offsets; i++) {
-		override = get_override_config_for_writing(config, offsets[i]);
-		if (!override)
-			return;
+GPIOD_API bool
+gpiod_line_config_bias_is_overridden(struct gpiod_line_config *config,
+				     unsigned int offset)
+{
+	return check_override(config, offset, OVERRIDE_FLAG_BIAS);
+}
 
-		set_bias(&override->base, bias);
-		override->override_flags |= OVERRIDE_FLAG_BIAS;
-	}
+GPIOD_API int
+gpiod_line_config_get_bias_default(struct gpiod_line_config *config)
+{
+	return config->defaults.bias;
 }
 
-GPIOD_API int gpiod_line_config_get_bias(struct gpiod_line_config *config,
-					 unsigned int offset)
+GPIOD_API int
+gpiod_line_config_get_bias_offset(struct gpiod_line_config *config,
+				  unsigned int offset)
 {
 	struct base_config *base;
 
@@ -334,38 +409,48 @@ static void set_drive(struct base_config *config, int drive)
 }
 
 GPIOD_API void
-gpiod_line_config_set_drive(struct gpiod_line_config *config, int drive)
+gpiod_line_config_set_drive_default(struct gpiod_line_config *config, int drive)
 {
 	set_drive(&config->defaults, drive);
 }
 
 GPIOD_API void
-gpiod_line_config_set_drive_offset(struct gpiod_line_config *config,
-				   int drive, unsigned int offset)
+gpiod_line_config_set_drive_override(struct gpiod_line_config *config,
+				     int drive, unsigned int offset)
 {
-	gpiod_line_config_set_drive_subset(config, drive, 1, &offset);
+	struct override_config *override;
+
+	override = get_override_config_for_writing(config, offset);
+	if (!override)
+		return;
+
+	set_drive(&override->base, drive);
+	override->override_flags |= OVERRIDE_FLAG_DRIVE;
 }
 
 GPIOD_API void
-gpiod_line_config_set_drive_subset(struct gpiod_line_config *config,
-				   int drive, unsigned int num_offsets,
-				   const unsigned int *offsets)
+gpiod_line_config_clear_drive_override(struct gpiod_line_config *config,
+				       unsigned int offset)
 {
-	struct override_config *override;
-	unsigned int i;
+	clear_override(config, offset, OVERRIDE_FLAG_DRIVE);
+}
 
-	for (i = 0; i < num_offsets; i++) {
-		override = get_override_config_for_writing(config, offsets[i]);
-		if (!override)
-			return;
+GPIOD_API bool
+gpiod_line_config_drive_is_overridden(struct gpiod_line_config *config,
+				      unsigned int offset)
+{
+	return check_override(config, offset, OVERRIDE_FLAG_DRIVE);
+}
 
-		set_drive(&override->base, drive);
-		override->override_flags |= OVERRIDE_FLAG_DRIVE;
-	}
+GPIOD_API int
+gpiod_line_config_get_drive_default(struct gpiod_line_config *config)
+{
+	return config->defaults.drive;
 }
 
-GPIOD_API int gpiod_line_config_get_drive(struct gpiod_line_config *config,
-					  unsigned int offset)
+GPIOD_API int
+gpiod_line_config_get_drive_offset(struct gpiod_line_config *config,
+				   unsigned int offset)
 {
 	struct base_config *base;
 
@@ -375,49 +460,50 @@ GPIOD_API int gpiod_line_config_get_drive(struct gpiod_line_config *config,
 }
 
 GPIOD_API void
-gpiod_line_config_set_active_low(struct gpiod_line_config *config)
+gpiod_line_config_set_active_low_default(struct gpiod_line_config *config,
+					 bool active_low)
 {
-	config->defaults.active_low = true;
+	config->defaults.active_low = active_low;
 }
 
 GPIOD_API void
-gpiod_line_config_set_active_low_offset(struct gpiod_line_config *config,
-					unsigned int offset)
-{
-	gpiod_line_config_set_active_low_subset(config, 1, &offset);
-}
-
-static void
-gpiod_line_config_set_active_setting(struct gpiod_line_config *config,
-				     unsigned int num_offsets,
-				     const unsigned int *offsets,
-				     bool active_low)
+gpiod_line_config_set_active_low_override(struct gpiod_line_config *config,
+					  bool active_low,
+					  unsigned int offset)
 {
 	struct override_config *override;
-	unsigned int i;
 
-	for (i = 0; i < num_offsets; i++) {
-		override = get_override_config_for_writing(config, offsets[i]);
-		if (!override)
-			return;
+	override = get_override_config_for_writing(config, offset);
+	if (!override)
+		return;
 
-		override->base.active_low = active_low;
-		override->override_flags |= OVERRIDE_FLAG_ACTIVE_LOW;
-	}
+	override->base.active_low = active_low;
+	override->override_flags |= OVERRIDE_FLAG_ACTIVE_LOW;
 }
 
 GPIOD_API void
-gpiod_line_config_set_active_low_subset(struct gpiod_line_config *config,
-					unsigned int num_offsets,
-					const unsigned int *offsets)
+gpiod_line_config_clear_active_low_override(struct gpiod_line_config *config,
+					    unsigned int offset)
 {
-	gpiod_line_config_set_active_setting(config,
-					     num_offsets, offsets, true);
+	clear_override(config, offset, OVERRIDE_FLAG_ACTIVE_LOW);
 }
 
 GPIOD_API bool
-gpiod_line_config_get_active_low(struct gpiod_line_config *config,
-				 unsigned int offset)
+gpiod_line_config_active_low_is_overridden(struct gpiod_line_config *config,
+					   unsigned int offset)
+{
+	return check_override(config, offset, OVERRIDE_FLAG_ACTIVE_LOW);
+}
+
+GPIOD_API bool
+gpiod_line_config_get_active_low_default(struct gpiod_line_config *config)
+{
+	return config->defaults.active_low;
+}
+
+GPIOD_API bool
+gpiod_line_config_get_active_low_offset(struct gpiod_line_config *config,
+					unsigned int offset)
 {
 	struct base_config *base;
 
@@ -428,69 +514,52 @@ gpiod_line_config_get_active_low(struct gpiod_line_config *config,
 }
 
 GPIOD_API void
-gpiod_line_config_set_active_high(struct gpiod_line_config *config)
+gpiod_line_config_set_debounce_period_us_default(
+		struct gpiod_line_config *config, unsigned long period)
 {
-	config->defaults.active_low = false;
+	config->defaults.debounce_period_us = period;
 }
 
 GPIOD_API void
-gpiod_line_config_set_active_high_offset(struct gpiod_line_config *config,
-					 unsigned int offset)
+gpiod_line_config_set_debounce_period_us_override(
+					struct gpiod_line_config *config,
+					unsigned long period,
+					unsigned int offset)
 {
-	gpiod_line_config_set_active_high_subset(config, 1, &offset);
-}
+	struct override_config *override;
 
-GPIOD_API void
-gpiod_line_config_set_active_high_subset(struct gpiod_line_config *config,
-					 unsigned int num_offsets,
-					 const unsigned int *offsets)
-{
-	gpiod_line_config_set_active_setting(config,
-					     num_offsets, offsets, false);
-}
+	override = get_override_config_for_writing(config, offset);
+	if (!override)
+		return;
 
-GPIOD_API void
-gpiod_line_config_set_debounce_period_us(struct gpiod_line_config *config,
-				      unsigned long period)
-{
-	config->defaults.debounce_period_us = period;
+	override->base.debounce_period_us = period;
+	override->override_flags |= OVERRIDE_FLAG_DEBOUNCE_PERIOD;
 }
 
-GPIOD_API void
-gpiod_line_config_set_debounce_period_us_offset(
+GPIOD_API void gpiod_line_config_clear_debounce_period_us_override(
 					struct gpiod_line_config *config,
-					unsigned long period,
 					unsigned int offset)
 {
-	gpiod_line_config_set_debounce_period_us_subset(config, period,
-						     1, &offset);
+	clear_override(config, offset, OVERRIDE_FLAG_DEBOUNCE_PERIOD);
 }
 
-GPIOD_API void
-gpiod_line_config_set_debounce_period_us_subset(
+GPIOD_API bool gpiod_line_config_debounce_period_us_is_overridden(
 					struct gpiod_line_config *config,
-					unsigned long period,
-					unsigned int num_offsets,
-					const unsigned int *offsets)
+					unsigned int offset)
 {
-	struct override_config *override;
-	unsigned int i, offset;
-
-	for (i = 0; i < num_offsets; i++) {
-		offset = offsets[i];
-
-		override = get_override_config_for_writing(config, offset);
-		if (!override)
-			return;
+	return check_override(config, offset, OVERRIDE_FLAG_DEBOUNCE_PERIOD);
+}
 
-		override->base.debounce_period_us = period;
-		override->override_flags |= OVERRIDE_FLAG_DEBOUNCE_PERIOD;
-	}
+GPIOD_API unsigned long
+gpiod_line_config_get_debounce_period_us_default(
+					struct gpiod_line_config *config)
+{
+	return config->defaults.debounce_period_us;
 }
 
 GPIOD_API unsigned long
-gpiod_line_config_get_debounce_us_period(struct gpiod_line_config *config,
-					 unsigned int offset)
+gpiod_line_config_get_debounce_period_us_offset(
+			struct gpiod_line_config *config, unsigned int offset)
 {
 	struct base_config *base;
 
@@ -514,38 +583,49 @@ static void set_event_clock(struct base_config *config, int clock)
 }
 
 GPIOD_API void
-gpiod_line_config_set_event_clock(struct gpiod_line_config *config, int clock)
+gpiod_line_config_set_event_clock_default(struct gpiod_line_config *config,
+					  int clock)
 {
 	set_event_clock(&config->defaults, clock);
 }
 
 GPIOD_API void
-gpiod_line_config_set_event_clock_offset(struct gpiod_line_config *config,
-					 int clock, unsigned int offset)
+gpiod_line_config_set_event_clock_override(struct gpiod_line_config *config,
+					   int clock, unsigned int offset)
 {
-	gpiod_line_config_set_event_clock_subset(config, clock, 1, &offset);
+	struct override_config *override;
+
+	override = get_override_config_for_writing(config, offset);
+	if (!override)
+		return;
+
+	set_event_clock(&override->base, clock);
+	override->override_flags |= OVERRIDE_FLAG_CLOCK;
 }
 
 GPIOD_API void
-gpiod_line_config_set_event_clock_subset(struct gpiod_line_config *config,
-					 int clock, unsigned int num_offsets,
-					 const unsigned int *offsets)
+gpiod_line_config_clear_event_clock_override(struct gpiod_line_config *config,
+					     unsigned int offset)
 {
-	struct override_config *override;
-	unsigned int i;
+	clear_override(config, offset, OVERRIDE_FLAG_CLOCK);
+}
 
-	for (i = 0; i < num_offsets; i++) {
-		override = get_override_config_for_writing(config, offsets[i]);
-		if (!override)
-			return;
+GPIOD_API bool
+gpiod_line_config_event_clock_is_overridden(struct gpiod_line_config *config,
+					    unsigned int offset)
+{
+	return check_override(config, offset, OVERRIDE_FLAG_CLOCK);
+}
 
-		set_event_clock(&override->base, clock);
-	}
+GPIOD_API int
+gpiod_line_config_get_event_clock_default(struct gpiod_line_config *config)
+{
+	return config->defaults.clock;
 }
 
 GPIOD_API int
-gpiod_line_config_get_event_clock(struct gpiod_line_config *config,
-				  unsigned int offset)
+gpiod_line_config_get_event_clock_offset(struct gpiod_line_config *config,
+					 unsigned int offset)
 {
 	struct base_config *base;
 
@@ -554,17 +634,25 @@ gpiod_line_config_get_event_clock(struct gpiod_line_config *config,
 	return base->clock;
 }
 
-static void set_output_value(struct override_config *override, int value)
+GPIOD_API void
+gpiod_line_config_set_output_value_default(struct gpiod_line_config *config,
+					   int value)
 {
-	override->value = !!value;
-	override->value_set = true;
+	config->defaults.value = value;
 }
 
 GPIOD_API void
-gpiod_line_config_set_output_value(struct gpiod_line_config *config,
-				   unsigned int offset, int value)
+gpiod_line_config_set_output_value_override(struct gpiod_line_config *config,
+					  unsigned int offset, int value)
 {
-	gpiod_line_config_set_output_values(config, 1, &offset, &value);
+	struct override_config *override;
+
+	override = get_override_config_for_writing(config, offset);
+	if (!override)
+		return;
+
+	override->base.value = !!value;
+	override->override_flags |= OVERRIDE_FLAG_OUTPUT_VALUE;
 }
 
 GPIOD_API void
@@ -573,36 +661,103 @@ gpiod_line_config_set_output_values(struct gpiod_line_config *config,
 				    const unsigned int *offsets,
 				    const int *values)
 {
-	struct override_config *override;
-	unsigned int i, offset, val;
+	unsigned int i;
 
-	for (i = 0; i < num_values; i++) {
-		offset = offsets[i];
-		val = values[i];
+	for (i = 0; i < num_values; i++)
+		gpiod_line_config_set_output_value_override(config,
+							    offsets[i],
+							    values[i]);
+}
 
-		override = get_override_by_offset(config, offset);
-		if (!override) {
-			override = get_new_override(config, offset);
-			if (!override)
-				return;
-		}
+GPIOD_API void
+gpiod_line_config_clear_output_value_override(struct gpiod_line_config *config,
+					      unsigned int offset)
+{
+	clear_override(config, offset, OVERRIDE_FLAG_OUTPUT_VALUE);
+}
 
-		set_output_value(override, val);
-	}
+GPIOD_API bool
+gpiod_line_config_output_value_is_overridden(struct gpiod_line_config *config,
+					     unsigned int offset)
+{
+	return check_override(config, offset, OVERRIDE_FLAG_OUTPUT_VALUE);
 }
 
 GPIOD_API int
-gpiod_line_config_get_output_value(struct gpiod_line_config *config,
-				   unsigned int offset)
+gpiod_line_config_get_output_value_default(struct gpiod_line_config *config)
+{
+	return config->defaults.value;
+}
+
+GPIOD_API int
+gpiod_line_config_get_output_value_offset(struct gpiod_line_config *config,
+					  unsigned int offset)
 {
 	struct override_config *override;
 
 	override = get_override_by_offset(config, offset);
-	if (override && override->value_set)
-		return override->value;
+	if (override && (override->override_flags & OVERRIDE_FLAG_OUTPUT_VALUE))
+		return override->base.value;
 
-	errno = ENXIO;
-	return -1;
+	return config->defaults.value;
+}
+
+static bool base_config_flags_are_equal(struct base_config *base,
+					struct override_config *override)
+{
+	if (((override->override_flags & OVERRIDE_FLAG_DIRECTION) &&
+	     base->direction != override->base.direction) ||
+	    ((override->override_flags & OVERRIDE_FLAG_EDGE) &&
+	     base->edge != override->base.edge) ||
+	    ((override->override_flags & OVERRIDE_FLAG_DRIVE) &&
+	     base->drive != override->base.drive) ||
+	    ((override->override_flags & OVERRIDE_FLAG_BIAS) &&
+	     base->bias != override->base.bias) ||
+	    ((override->override_flags & OVERRIDE_FLAG_ACTIVE_LOW) &&
+	     base->active_low != override->base.active_low) ||
+	    ((override->override_flags & OVERRIDE_FLAG_CLOCK) &&
+	     base->clock != override->base.clock))
+		return false;
+
+	return true;
+}
+
+static bool base_debounce_period_is_equal(struct base_config *base,
+					  struct override_config *override)
+{
+	if ((override->override_flags & OVERRIDE_FLAG_DEBOUNCE_PERIOD) &&
+	    base->debounce_period_us != override->base.debounce_period_us)
+		return false;
+
+	return true;
+}
+
+GPIOD_API unsigned int
+gpiod_line_config_get_num_overridden_offsets(struct gpiod_line_config *config)
+{
+	unsigned int i, ret = 0;
+
+	for (i = 0; i < GPIO_V2_LINES_MAX; i++) {
+		if (override_used(&config->overrides[i]))
+			ret++;
+	}
+
+	return ret;
+}
+
+GPIOD_API void
+gpiod_line_config_get_overridden_offsets(struct gpiod_line_config *config,
+					 unsigned int *offsets)
+{
+	struct override_config *override;
+	unsigned int i, j;
+
+	for (i = 0, j = 0; i < GPIO_V2_LINES_MAX; i++) {
+		override = &config->overrides[i];
+
+		if (override_used(override))
+			offsets[j++] = override->offset;
+	}
 }
 
 static uint64_t make_kernel_flags(const struct base_config *config)
@@ -683,10 +838,10 @@ static int find_bitmap_index(unsigned int needle, unsigned int num_lines,
 	return -1;
 }
 
-static int set_kernel_output_values(uint64_t *mask, uint64_t *vals,
-				    struct gpiod_line_config *config,
-				    unsigned int num_lines,
-				    const unsigned int *offsets)
+static void set_kernel_output_values(uint64_t *mask, uint64_t *vals,
+				     struct gpiod_line_config *config,
+				     unsigned int num_lines,
+				     const unsigned int *offsets)
 {
 	struct override_config *override;
 	unsigned int i;
@@ -695,44 +850,69 @@ static int set_kernel_output_values(uint64_t *mask, uint64_t *vals,
 	gpiod_line_mask_zero(mask);
 	gpiod_line_mask_zero(vals);
 
-	for (i = 0; i < config->num_overrides; i++) {
-		override = &config->overrides[i];
+	if (config->defaults.direction == GPIOD_LINE_DIRECTION_OUTPUT) {
+		/*
+		 * Default direction is output - assign the default output
+		 * value to all lines. Overrides that may set some lines to
+		 * input will be handled later and may re-assign the output
+		 * values.
+		 */
+		for (i = 0; i < num_lines; i++) {
+			gpiod_line_mask_set_bit(mask, i);
+			gpiod_line_mask_assign_bit(vals, i,
+						   config->defaults.value);
+		}
+	} else {
+		/*
+		 * Default output value is not output. Iterate over overrides
+		 * and set the default output value for those that override the
+		 * direction to output. Don't touch the ones which override
+		 * the output value.
+		 */
+		for (i = 0; i < GPIO_V2_LINES_MAX; i++) {
+			override = &config->overrides[i];
+
+			if (override->base.direction !=
+			    GPIOD_LINE_DIRECTION_OUTPUT ||
+			    !(override->override_flags &
+			      OVERRIDE_FLAG_DIRECTION) ||
+			    (override->override_flags &
+			     OVERRIDE_FLAG_OUTPUT_VALUE))
+				continue;
 
-		if (override->value_set) {
 			idx = find_bitmap_index(override->offset,
 						num_lines, offsets);
-			if (idx < 0) {
-				errno = EINVAL;
-				return -1;
-			}
+			if (idx < 0)
+				continue;
 
 			gpiod_line_mask_set_bit(mask, idx);
 			gpiod_line_mask_assign_bit(vals, idx,
-						   !!override->value);
+						   !!config->defaults.value);
 		}
 	}
 
-	return 0;
-}
+	/*
+	 * Finally iterate over the overrides again and set the overridden
+	 * output values.
+	 */
+	for (i = 0; i < GPIO_V2_LINES_MAX; i++) {
+		override = &config->overrides[i];
 
-static bool base_config_flags_are_equal(struct base_config *base,
-					struct override_config *override)
-{
-	if (((override->override_flags & OVERRIDE_FLAG_DIRECTION) &&
-	     base->direction != override->base.direction) ||
-	    ((override->override_flags & OVERRIDE_FLAG_EDGE) &&
-	     base->edge != override->base.edge) ||
-	    ((override->override_flags & OVERRIDE_FLAG_DRIVE) &&
-	     base->drive != override->base.drive) ||
-	    ((override->override_flags & OVERRIDE_FLAG_BIAS) &&
-	     base->bias != override->base.bias) ||
-	    ((override->override_flags & OVERRIDE_FLAG_ACTIVE_LOW) &&
-	     base->active_low != override->base.active_low) ||
-	    ((override->override_flags & OVERRIDE_FLAG_CLOCK) &&
-	     base->clock != override->base.clock))
-		return false;
+		if (!(override->override_flags & OVERRIDE_FLAG_OUTPUT_VALUE))
+			continue;
 
-	return true;
+		if (config->defaults.direction != GPIOD_LINE_DIRECTION_OUTPUT &&
+		    (!(override->override_flags & OVERRIDE_FLAG_DIRECTION) ||
+		     override->base.direction != GPIOD_LINE_DIRECTION_OUTPUT))
+			continue;
+
+		idx = find_bitmap_index(override->offset, num_lines, offsets);
+		if (idx < 0)
+			continue;
+
+		gpiod_line_mask_set_bit(mask, idx);
+		gpiod_line_mask_assign_bit(vals, idx, !!override->base.value);
+	}
 }
 
 static bool override_config_flags_are_equal(struct override_config *a,
@@ -771,16 +951,6 @@ static void set_base_config_flags(struct gpio_v2_line_attribute *attr,
 	attr->flags = make_kernel_flags(&base);
 }
 
-static bool base_debounce_period_is_equal(struct base_config *base,
-					  struct override_config *override)
-{
-	if ((override->override_flags & OVERRIDE_FLAG_DEBOUNCE_PERIOD) &&
-	    base->debounce_period_us != override->base.debounce_period_us)
-		return false;
-
-	return true;
-}
-
 static bool override_config_debounce_period_is_equal(struct override_config *a,
 						     struct override_config *b)
 {
@@ -801,36 +971,40 @@ set_base_config_debounce_period(struct gpio_v2_line_attribute *attr,
 	attr->debounce_period_us = override->base.debounce_period_us;
 }
 
-static int set_kernel_attr_mask(uint64_t *out, const uint64_t *in,
-				unsigned int num_lines,
-				const unsigned int *offsets,
-				const struct gpiod_line_config *config)
+static void set_kernel_attr_mask(uint64_t *out, const uint64_t *in,
+				 unsigned int num_lines,
+				 const unsigned int *offsets,
+				 struct gpiod_line_config *config)
 {
+	struct override_config *override;
 	unsigned int i, j;
 	int off;
 
 	gpiod_line_mask_zero(out);
 
-	for (i = 0; i < config->num_overrides; i++) {
-		if (!gpiod_line_mask_test_bit(in, i))
+	for (i = 0; i < GPIO_V2_LINES_MAX; i++) {
+		override = &config->overrides[i];
+
+		if (!override_used(override) ||
+		    !gpiod_line_mask_test_bit(in, i))
 			continue;
 
 		for (j = 0, off = -1; j < num_lines; j++) {
-			if (offsets[j] == config->overrides[i].offset) {
+			if (offsets[j] == override->offset) {
 				off = j;
 				break;
 			}
 		}
 
-		if (off < 0) {
-			errno = EINVAL;
-			return -1;
-		}
+		/*
+		 * Overridden offsets that are not in the list of offsets to
+		 * request (or already requested) are silently ignored.
+		 */
+		if (off < 0)
+			continue;
 
 		gpiod_line_mask_set_bit(out, off);
 	}
-
-	return 0;
 }
 
 static int process_overrides(struct gpiod_line_config *config,
@@ -852,11 +1026,18 @@ static int process_overrides(struct gpiod_line_config *config,
 	struct override_config *current, *next;
 	unsigned int i, j;
 
-	for (i = 0; i < config->num_overrides; i++) {
-		if (gpiod_line_mask_test_bit(&processed, i))
+	for (i = 0; i < GPIO_V2_LINES_MAX; i++) {
+		current = &config->overrides[i];
+
+		if (!override_used(current) ||
+		    gpiod_line_mask_test_bit(&processed, i))
 			continue;
 
-		current = &config->overrides[i];
+		if (*attr_idx == GPIO_V2_LINE_NUM_ATTRS_MAX) {
+			errno = E2BIG;
+			return -1;
+		}
+
 		gpiod_line_mask_set_bit(&processed, i);
 
 		if (defaults_equal_func(&config->defaults, current))
@@ -865,12 +1046,13 @@ static int process_overrides(struct gpiod_line_config *config,
 		marked = 0;
 		gpiod_line_mask_set_bit(&marked, i);
 
-		for (j = i + 1; j < config->num_overrides; j++) {
-			if (gpiod_line_mask_test_bit(&processed, j))
-				continue;
-
+		for (j = i + 1; j < GPIO_V2_LINES_MAX; j++) {
 			next = &config->overrides[j];
 
+			if (!override_used(next) ||
+			    gpiod_line_mask_test_bit(&processed, j))
+				continue;
+
 			if (override_equal_func(current, next)) {
 				gpiod_line_mask_set_bit(&marked, j);
 				gpiod_line_mask_set_bit(&processed, j);
@@ -878,10 +1060,6 @@ static int process_overrides(struct gpiod_line_config *config,
 		}
 
 		attr = &cfgbuf->attrs[(*attr_idx)++];
-		if (*attr_idx == GPIO_V2_LINE_NUM_ATTRS_MAX) {
-			errno = E2BIG;
-			return -1;
-		}
 
 		set_kernel_attr_mask(&mask, &marked,
 				     num_lines, offsets, config);
@@ -892,14 +1070,31 @@ static int process_overrides(struct gpiod_line_config *config,
 	return 0;
 }
 
+static bool has_at_least_one_output_direction(struct gpiod_line_config *config)
+{
+	struct override_config *override;
+	unsigned int i;
+
+	if (config->defaults.direction == GPIOD_LINE_DIRECTION_OUTPUT)
+		return true;
+
+	for (i = 0; i < GPIO_V2_LINES_MAX; i++) {
+		override = &config->overrides[i];
+
+		if (override->base.direction == GPIOD_LINE_DIRECTION_OUTPUT)
+			return true;
+	}
+
+	return false;
+}
+
 int gpiod_line_config_to_kernel(struct gpiod_line_config *config,
 				struct gpio_v2_line_config *cfgbuf,
 				unsigned int num_lines,
 				const unsigned int *offsets)
 {
 	struct gpio_v2_line_config_attribute *attr;
-	struct override_config *override;
-	unsigned int attr_idx = 0, i;
+	unsigned int attr_idx = 0;
 	uint64_t mask, values;
 	int ret;
 
@@ -907,26 +1102,19 @@ int gpiod_line_config_to_kernel(struct gpiod_line_config *config,
 		goto err_2big;
 
 	/*
-	 * First check if we have at least one default output value configured.
+	 * First check if we have at least one line configured in output mode.
 	 * If so, let's take one attribute for the default values.
 	 */
-	for (i = 0; i < config->num_overrides; i++) {
-		override = &config->overrides[i];
-
-		if (override->value_set) {
-			attr = &cfgbuf->attrs[attr_idx++];
-			attr->attr.id = GPIO_V2_LINE_ATTR_ID_OUTPUT_VALUES;
+	if (has_at_least_one_output_direction(config)) {
+		attr = &cfgbuf->attrs[attr_idx++];
+		attr->attr.id = GPIO_V2_LINE_ATTR_ID_OUTPUT_VALUES;
 
-			ret = set_kernel_output_values(&mask, &values, config,
-						       num_lines, offsets);
-			if (ret)
-				return ret;
+		set_kernel_output_values(&mask, &values, config,
+					 num_lines, offsets);
 
-			attr->attr.values = values;
-			attr->mask = mask;
+		attr->attr.values = values;
+		attr->mask = mask;
 
-			break;
-		}
 	}
 
 	/* If we have a default debounce period - use another attribute. */
diff --git a/tools/gpioget.c b/tools/gpioget.c
index 965af3b..112257c 100644
--- a/tools/gpioget.c
+++ b/tools/gpioget.c
@@ -110,13 +110,13 @@ int main(int argc, char **argv)
 	if (!line_cfg)
 		die_perror("unable to allocate the line config structure");
 
-	gpiod_line_config_set_direction(line_cfg, direction);
+	gpiod_line_config_set_direction_default(line_cfg, direction);
 
 	if (bias)
-		gpiod_line_config_set_bias(line_cfg, bias);
+		gpiod_line_config_set_bias_default(line_cfg, bias);
 
 	if (active_low)
-		gpiod_line_config_set_active_low(line_cfg);
+		gpiod_line_config_set_active_low_default(line_cfg, true);
 
 	req_cfg = gpiod_request_config_new();
 	if (!req_cfg)
diff --git a/tools/gpiomon.c b/tools/gpiomon.c
index c09f2f5..31ea294 100644
--- a/tools/gpiomon.c
+++ b/tools/gpiomon.c
@@ -259,10 +259,10 @@ int main(int argc, char **argv)
 		die_perror("unable to allocate the line config structure");
 
 	if (bias)
-		gpiod_line_config_set_bias(line_cfg, bias);
+		gpiod_line_config_set_bias_default(line_cfg, bias);
 	if (active_low)
-		gpiod_line_config_set_active_low(line_cfg);
-	gpiod_line_config_set_edge_detection(line_cfg, edge);
+		gpiod_line_config_set_active_low_default(line_cfg, true);
+	gpiod_line_config_set_edge_detection_default(line_cfg, edge);
 
 	req_cfg = gpiod_request_config_new();
 	if (!req_cfg)
diff --git a/tools/gpioset.c b/tools/gpioset.c
index 55fcfe9..c27525a 100644
--- a/tools/gpioset.c
+++ b/tools/gpioset.c
@@ -296,12 +296,13 @@ int main(int argc, char **argv)
 		die_perror("unable to allocate the line config structure");
 
 	if (bias)
-		gpiod_line_config_set_bias(line_cfg, bias);
+		gpiod_line_config_set_bias_default(line_cfg, bias);
 	if (drive)
-		gpiod_line_config_set_drive(line_cfg, drive);
+		gpiod_line_config_set_drive_default(line_cfg, drive);
 	if (active_low)
-		gpiod_line_config_set_active_low(line_cfg);
-	gpiod_line_config_set_direction(line_cfg, GPIOD_LINE_DIRECTION_OUTPUT);
+		gpiod_line_config_set_active_low_default(line_cfg, true);
+	gpiod_line_config_set_direction_default(line_cfg,
+						GPIOD_LINE_DIRECTION_OUTPUT);
 	gpiod_line_config_set_output_values(line_cfg, num_lines,
 					    offsets, values);
 
-- 
2.30.1

