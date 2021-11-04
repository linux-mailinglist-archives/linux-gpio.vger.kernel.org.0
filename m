Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67555445A88
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Nov 2021 20:23:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230438AbhKDTZj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Nov 2021 15:25:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231391AbhKDTZh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Nov 2021 15:25:37 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8743AC061714
        for <linux-gpio@vger.kernel.org>; Thu,  4 Nov 2021 12:22:58 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id t30so10227834wra.10
        for <linux-gpio@vger.kernel.org>; Thu, 04 Nov 2021 12:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=l5QohYWcF0ikAKm5lNA4fmfoj+/hUG5JkprI1IHv3ek=;
        b=Wbc3+OdjvOVcdN7SJEZd+H475i0Z2LkpwhBK49n8qt3vySBdY1tCr2RPx4XYpPIfAM
         bJj8NdkeO/1QLM5dCe1IbbyOlRnEE5RIcfsLk6/c1PoVoA/q72iAzVSLFL0gUbQIbv2g
         DtErd93tqdQyCjOEMsYJ8OoLI25YdHYAN+3Ttkz2r5Urx3pz7mBRg/PvLFBpLaxGwUjL
         DbLfH23jFXBqQLfox3BWzZUAcNofoWlZtR/ZPavvP6kiIZhE6fh4PI79I9gYg50glJaM
         uwxzZDdiGgE7yEeW1WnskgAlgCT4IZo6w43pF7QNh18dyPmr5LGAU13sH+FtXrXRwE8X
         uKkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=l5QohYWcF0ikAKm5lNA4fmfoj+/hUG5JkprI1IHv3ek=;
        b=mIxYTgG953zZixG/B5jfG+lvHqBHfW5NxEnhg8X9ZzXi0opxz0gueH9ak4udFooza4
         cTYYEYep3SAol7ZcbmwacSeXx4ihyN3X3UXxMeqQob0cnzrx2kXi/esm51bIJvGtQoKV
         RXzpf2MxsgO08/XCIUYnoAkpxADiH49KtV2RiSbzrxK55NZe9UNaDKMEoiGWjl6JhiaZ
         qx/R5Dv+8xbbd5gnq2vVdI3JxnGuMs2k+23uyyWadicCUQpt1lyvoOMi5u90vL6bMZvH
         HU6bzBXVouVq/qspI8yf/ZyuktMMyoKEYfmIlHGMRsNmBf5cjo3Vpxv9EmWvX7V6gza1
         1CLQ==
X-Gm-Message-State: AOAM530TDhI3Sz0jPersAUn6YX5nee7Ll4vHlq5d3fZF0bYgf0e3T2ZB
        PS6qSSCoQTQnl16KPy5hHwn5CQ==
X-Google-Smtp-Source: ABdhPJxoJuWo/OeE2J5QI6CB17yy6eu3mqAdBABwaA9Ld+D1U2lbzG1/WrXX6KLHDlcXt0evPBcRqg==
X-Received: by 2002:adf:9bdb:: with SMTP id e27mr66192228wrc.417.1636053776627;
        Thu, 04 Nov 2021 12:22:56 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:334:ac00:7d50:ff5:f5c1:e225])
        by smtp.gmail.com with ESMTPSA id f3sm9290784wmb.12.2021.11.04.12.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Nov 2021 12:22:56 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Helmut Grohne <helmut.grohne@intenta.de>,
        Ben Hutchings <ben.hutchings@essensium.com>
Cc:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [libgpiod v2][PATCH v4 1/2] line-config: rework the interface some more
Date:   Thu,  4 Nov 2021 20:22:51 +0100
Message-Id: <20211104192252.21883-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20211104192252.21883-1-brgl@bgdev.pl>
References: <20211104192252.21883-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

We've already added getters for line-config but without exposing some
parts of the internal logic of the object, the user can't really get
the full picture and inspect the contents. This patch reworks the
accessors further by providing three flavors of each setter and two
of each getter.

Up until now, the setters that set the default (fall-back) value for
various line settings didn't state explicitly that the values they set
have a lower priority than the one coming from setters that take offsets
as argument. The docs were vague too and suggested that the last call
counts which is not true.

We therefore expose a setter that explicitly sets the "default" value
and make sure to stress that this will be used only by lines for which
no "specific" override was defined.

We also provide getters that allow to read both the default value as
well as the actual value that would be used for each offset if the
object was passed to a request call at this moment. We also complete
the API by providing functions that allow to identify offsets for
which at least one setting differs from the defaults.

This way the caller can fully inspect the line_config and high-level
language bindings can provide stringification methods.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 include/gpiod.h   | 255 ++++++++++++++++++++++++++++-----------
 lib/line-config.c | 295 ++++++++++++++++++++++++++++++++--------------
 tools/gpioget.c   |   6 +-
 tools/gpiomon.c   |   6 +-
 tools/gpioset.c   |   9 +-
 5 files changed, 404 insertions(+), 167 deletions(-)

diff --git a/include/gpiod.h b/include/gpiod.h
index 2a41fca..ee4a067 100644
--- a/include/gpiod.h
+++ b/include/gpiod.h
@@ -450,12 +450,38 @@ gpiod_info_event_get_line_info(struct gpiod_info_event *event);
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
+ * For every setting, the mutators come in three flavors: one setting the
+ * default value (to which we fallback for every offset not explicitly
+ * overridden), one setting an override for a single offset and one that
+ * overrides settings for a subset of offsets.
+ *
+ * The mutators don't return errors. If the set of options is too complex to
+ * be translated into kernel uAPI structures - the error will be returned at
+ * the time of the request or reconfiguration. If an invalid value was passed
+ * to any of the mutators - the default value will be silently used instead.
+ *
+ * We also expose getters - these come in two flavors for every settings: one
+ * that returns the value that would have been used for given offset if the
+ * request was made at this moment and one that always returns the default
+ * value.
+ *
+ * It's important to not think of the offsets used in the offset->value mapping
+ * as linked to actual hardware offsets of the lines exposed by a GPIO chip as
+ * config objects live separately from any chips and are only analyzed at the
+ * time the request is being made.
+ *
+ * For simple cases the offsets can be entirely ignored when preparing the
+ * line configuration.
  */
 
 /**
@@ -480,12 +506,12 @@ void gpiod_line_config_free(struct gpiod_line_config *config);
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
  * @brief Set the direction for a single line at given offset.
@@ -497,7 +523,7 @@ void gpiod_line_config_set_direction_offset(struct gpiod_line_config *config,
 					    int direction, unsigned int offset);
 
 /**
- * @brief Set the direction for a subset of lines.
+ * @brief Set the direction for a subset of offsets.
  * @param config Line config object.
  * @param direction New direction.
  * @param num_offsets Number of offsets in the array.
@@ -509,24 +535,31 @@ void gpiod_line_config_set_direction_subset(struct gpiod_line_config *config,
 					    const unsigned int *offsets);
 
 /**
- * @brief Get the direction setting for a given line.
+ * @brief Get the default direction setting.
+ * @param config Line config object.
+ * @return Direction setting that would have been used for any offset not
+ *         assigned its own direction value.
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
  * @brief Set the edge event detection for a single line at given offset.
@@ -539,7 +572,7 @@ gpiod_line_config_set_edge_detection_offset(struct gpiod_line_config *config,
 					    int edge, unsigned int offset);
 
 /**
- * @brief Set the edge event detection for a subset of lines.
+ * @brief Set the edge event detection for a subset of offset.
  * @param config Line config object.
  * @param edge Type of edge events to detect.
  * @param num_offsets Number of offsets in the array.
@@ -551,24 +584,33 @@ gpiod_line_config_set_edge_detection_subset(struct gpiod_line_config *config,
 					    const unsigned int *offsets);
 
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
  * @brief Set the bias for a single line at given offset.
@@ -591,23 +633,30 @@ void gpiod_line_config_set_bias_subset(struct gpiod_line_config *config,
 				       const unsigned int *offsets);
 
 /**
- * @brief Get the bias setting for a given line.
+ * @brief Get the default bias setting.
+ * @param config Line config object.
+ * @return Bias setting that would have been used for any offset not assigned
+ *         its own direction value.
+ */
+int gpiod_line_config_get_bias_default(struct gpiod_line_config *config);
+
+/**
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
  * @brief Set the drive for a single line at given offset.
@@ -619,7 +668,7 @@ void gpiod_line_config_set_drive_offset(struct gpiod_line_config *config,
 					int drive, unsigned int offset);
 
 /**
- * @brief Set the drive for a subset of lines.
+ * @brief Set the drive for a subset of offsets.
  * @param config Line config object.
  * @param drive New drive.
  * @param num_offsets Number of offsets in the array.
@@ -630,22 +679,28 @@ void gpiod_line_config_set_drive_subset(struct gpiod_line_config *config,
 					const unsigned int *offsets);
 
 /**
- * @brief Get the drive setting for a given line.
+ * @brief Get the default drive setting.
+ * @param config Line config object.
+ * @return Drive setting that would have been used for any offset not assigned
+ *         its own direction value.
+ */
+int gpiod_line_config_get_drive_default(struct gpiod_line_config *config);
+
+/**
+ * @brief Get the drive setting for a given offset.
  * @param config Line config object.
  * @param offset Line offset for which to read the drive setting.
  * @return Drive setting that would have been used for given offset if the
  *         config object was used in a request at the time of the call.
- * @note If an offset is used for which no config was provided, the function
- *       will return the global default value.
  */
-int gpiod_line_config_get_drive(struct gpiod_line_config *config,
-				unsigned int offset);
+int gpiod_line_config_get_drive_offset(struct gpiod_line_config *config,
+				       unsigned int offset);
 
 /**
- * @brief Set all lines as active-low.
+ * @brief Set lines to active-low by default.
  * @param config Line config object.
  */
-void gpiod_line_config_set_active_low(struct gpiod_line_config *config);
+void gpiod_line_config_set_active_low_default(struct gpiod_line_config *config);
 
 /**
  * @brief Set a single line as active-low.
@@ -665,23 +720,30 @@ void gpiod_line_config_set_active_low_subset(struct gpiod_line_config *config,
 					     unsigned int num_offsets,
 					     const unsigned int *offsets);
 
+/**
+ * @brief Check if active-low is the default setting.
+ * @param config Line config object.
+ * @return Active-low setting that would have been used for any offset not
+ *         assigned its own value.
+ */
+bool gpiod_line_config_get_active_low_default(struct gpiod_line_config *config);
+
 /**
  * @brief Check if the line at given offset was configured as active-low.
  * @param config Line config object.
  * @param offset Line offset for which to read the active-low setting.
  * @return Active-low setting that would have been used for given offset if the
  *         config object was used in a request at the time of the call.
- * @note If an offset is used for which no config was provided, the function
- *       will return the global default value.
  */
-bool gpiod_line_config_get_active_low(struct gpiod_line_config *config,
-				      unsigned int offset);
+bool gpiod_line_config_get_active_low_offset(struct gpiod_line_config *config,
+					     unsigned int offset);
 
 /**
- * @brief Set all lines as active-high.
+ * @brief Set lines to active-high by default.
  * @param config Line config object.
  */
-void gpiod_line_config_set_active_high(struct gpiod_line_config *config);
+void
+gpiod_line_config_set_active_high_default(struct gpiod_line_config *config);
 
 /**
  * @brief Set a single line as active-high.
@@ -702,12 +764,12 @@ void gpiod_line_config_set_active_high_subset(struct gpiod_line_config *config,
 					      const unsigned int *offsets);
 
 /**
- * @brief Set the debounce period for all lines.
+ * @brief Set the default debounce period.
  * @param config Line config object.
  * @param period New debounce period. Disables debouncing if 0.
  */
-void gpiod_line_config_set_debounce_period_us(struct gpiod_line_config *config,
-					      unsigned long period);
+void gpiod_line_config_set_debounce_period_us_default(
+		struct gpiod_line_config *config, unsigned long period);
 
 /**
  * @brief Set the debounce period for a single line at given offset.
@@ -722,7 +784,7 @@ gpiod_line_config_set_debounce_period_us_offset(
 					unsigned int offset);
 
 /**
- * @brief Set the debounce period for a subset of lines.
+ * @brief Set the debounce period for a subset of offsets.
  * @param config Line config object.
  * @param period New debounce period. Disables debouncing if 0.
  * @param num_offsets Number of offsets in the array.
@@ -736,25 +798,33 @@ gpiod_line_config_set_debounce_period_us_subset(
 					const unsigned int *offsets);
 
 /**
- * @brief Get the debounce period for a given line.
+ * @brief Get the default debounce period.
+ * @param config Line config object.
+ * @return Debounce period that would have been used for any offset not
+ *         assigned its own debounce period. 0 if not debouncing is disabled.
+ */
+unsigned long gpiod_line_config_get_debounce_period_us_default(
+					struct gpiod_line_config *config);
+
+/**
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
  * @brief Set the event clock for a single line at given offset.
@@ -766,7 +836,7 @@ void gpiod_line_config_set_event_clock_offset(struct gpiod_line_config *config,
 					      int clock, unsigned int offset);
 
 /**
- * @brief Set the event clock for a subset of lines.
+ * @brief Set the event clock for a subset of offsets.
  * @param config Line config object.
  * @param clock New event clock to use.
  * @param num_offsets Number of offsets in the array.
@@ -778,16 +848,31 @@ void gpiod_line_config_set_event_clock_subset(struct gpiod_line_config *config,
 					      const unsigned int *offsets);
 
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
  * @brief Set the output value for a single offset.
@@ -795,8 +880,8 @@ int gpiod_line_config_get_event_clock(struct gpiod_line_config *config,
  * @param offset Offset of the line.
  * @param value Output value to set.
  */
-void gpiod_line_config_set_output_value(struct gpiod_line_config *config,
-					unsigned int offset, int value);
+void gpiod_line_config_set_output_value_offset(struct gpiod_line_config *config,
+					       unsigned int offset, int value);
 
 /**
  * @brief Set the output values for a set of offsets.
@@ -811,14 +896,44 @@ void gpiod_line_config_set_output_values(struct gpiod_line_config *config,
 					 const unsigned int *offsets,
 					 const int *values);
 
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
index 2ac9f5f..a65aa9e 100644
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
@@ -35,8 +37,6 @@ struct base_config {
 struct override_config {
 	struct base_config base;
 	unsigned int offset;
-	bool value_set : 1;
-	unsigned int value : 1;
 	unsigned int override_flags : 7;
 } GPIOD_PACKED;
 
@@ -165,7 +165,8 @@ static void set_direction(struct base_config *config, int direction)
 }
 
 GPIOD_API void
-gpiod_line_config_set_direction(struct gpiod_line_config *config, int direction)
+gpiod_line_config_set_direction_default(struct gpiod_line_config *config,
+					int direction)
 {
 	set_direction(&config->defaults, direction);
 }
@@ -195,8 +196,15 @@ gpiod_line_config_set_direction_subset(struct gpiod_line_config *config,
 	}
 }
 
-GPIOD_API int gpiod_line_config_get_direction(struct gpiod_line_config *config,
-					      unsigned int offset)
+GPIOD_API int
+gpiod_line_config_get_direction_default(struct gpiod_line_config *config)
+{
+	return config->defaults.direction;
+}
+
+GPIOD_API int
+gpiod_line_config_get_direction_offset(struct gpiod_line_config *config,
+				       unsigned int offset)
 {
 	struct base_config *base;
 
@@ -222,7 +230,8 @@ static void set_edge_detection(struct base_config *config, int edge)
 }
 
 GPIOD_API void
-gpiod_line_config_set_edge_detection(struct gpiod_line_config *config, int edge)
+gpiod_line_config_set_edge_detection_default(struct gpiod_line_config *config,
+					     int edge)
 {
 	set_edge_detection(&config->defaults, edge);
 }
@@ -253,8 +262,14 @@ gpiod_line_config_set_edge_detection_subset(struct gpiod_line_config *config,
 }
 
 GPIOD_API int
-gpiod_line_config_get_edge_detection(struct gpiod_line_config *config,
-				     unsigned int offset)
+gpiod_line_config_get_edge_detection_default(struct gpiod_line_config *config)
+{
+	return config->defaults.edge;
+}
+
+GPIOD_API int
+gpiod_line_config_get_edge_detection_offset(struct gpiod_line_config *config,
+					    unsigned int offset)
 {
 	struct base_config *base;
 
@@ -279,7 +294,7 @@ static void set_bias(struct base_config *config, int bias)
 }
 
 GPIOD_API void
-gpiod_line_config_set_bias(struct gpiod_line_config *config, int bias)
+gpiod_line_config_set_bias_default(struct gpiod_line_config *config, int bias)
 {
 	set_bias(&config->defaults, bias);
 }
@@ -309,8 +324,15 @@ gpiod_line_config_set_bias_subset(struct gpiod_line_config *config,
 	}
 }
 
-GPIOD_API int gpiod_line_config_get_bias(struct gpiod_line_config *config,
-					 unsigned int offset)
+GPIOD_API int
+gpiod_line_config_get_bias_default(struct gpiod_line_config *config)
+{
+	return config->defaults.bias;
+}
+
+GPIOD_API int
+gpiod_line_config_get_bias_offset(struct gpiod_line_config *config,
+				  unsigned int offset)
 {
 	struct base_config *base;
 
@@ -334,7 +356,7 @@ static void set_drive(struct base_config *config, int drive)
 }
 
 GPIOD_API void
-gpiod_line_config_set_drive(struct gpiod_line_config *config, int drive)
+gpiod_line_config_set_drive_default(struct gpiod_line_config *config, int drive)
 {
 	set_drive(&config->defaults, drive);
 }
@@ -364,8 +386,15 @@ gpiod_line_config_set_drive_subset(struct gpiod_line_config *config,
 	}
 }
 
-GPIOD_API int gpiod_line_config_get_drive(struct gpiod_line_config *config,
-					  unsigned int offset)
+GPIOD_API int
+gpiod_line_config_get_drive_default(struct gpiod_line_config *config)
+{
+	return config->defaults.drive;
+}
+
+GPIOD_API int
+gpiod_line_config_get_drive_offset(struct gpiod_line_config *config,
+				   unsigned int offset)
 {
 	struct base_config *base;
 
@@ -375,7 +404,7 @@ GPIOD_API int gpiod_line_config_get_drive(struct gpiod_line_config *config,
 }
 
 GPIOD_API void
-gpiod_line_config_set_active_low(struct gpiod_line_config *config)
+gpiod_line_config_set_active_low_default(struct gpiod_line_config *config)
 {
 	config->defaults.active_low = true;
 }
@@ -416,8 +445,14 @@ gpiod_line_config_set_active_low_subset(struct gpiod_line_config *config,
 }
 
 GPIOD_API bool
-gpiod_line_config_get_active_low(struct gpiod_line_config *config,
-				 unsigned int offset)
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
 
@@ -428,7 +463,7 @@ gpiod_line_config_get_active_low(struct gpiod_line_config *config,
 }
 
 GPIOD_API void
-gpiod_line_config_set_active_high(struct gpiod_line_config *config)
+gpiod_line_config_set_active_high_default(struct gpiod_line_config *config)
 {
 	config->defaults.active_low = false;
 }
@@ -450,8 +485,8 @@ gpiod_line_config_set_active_high_subset(struct gpiod_line_config *config,
 }
 
 GPIOD_API void
-gpiod_line_config_set_debounce_period_us(struct gpiod_line_config *config,
-				      unsigned long period)
+gpiod_line_config_set_debounce_period_us_default(
+		struct gpiod_line_config *config, unsigned long period)
 {
 	config->defaults.debounce_period_us = period;
 }
@@ -489,8 +524,15 @@ gpiod_line_config_set_debounce_period_us_subset(
 }
 
 GPIOD_API unsigned long
-gpiod_line_config_get_debounce_us_period(struct gpiod_line_config *config,
-					 unsigned int offset)
+gpiod_line_config_get_debounce_period_us_default(
+					struct gpiod_line_config *config)
+{
+	return config->defaults.debounce_period_us;
+}
+
+GPIOD_API unsigned long
+gpiod_line_config_get_debounce_period_us_offset(
+			struct gpiod_line_config *config, unsigned int offset)
 {
 	struct base_config *base;
 
@@ -514,7 +556,8 @@ static void set_event_clock(struct base_config *config, int clock)
 }
 
 GPIOD_API void
-gpiod_line_config_set_event_clock(struct gpiod_line_config *config, int clock)
+gpiod_line_config_set_event_clock_default(struct gpiod_line_config *config,
+					  int clock)
 {
 	set_event_clock(&config->defaults, clock);
 }
@@ -544,8 +587,14 @@ gpiod_line_config_set_event_clock_subset(struct gpiod_line_config *config,
 }
 
 GPIOD_API int
-gpiod_line_config_get_event_clock(struct gpiod_line_config *config,
-				  unsigned int offset)
+gpiod_line_config_get_event_clock_default(struct gpiod_line_config *config)
+{
+	return config->defaults.clock;
+}
+
+GPIOD_API int
+gpiod_line_config_get_event_clock_offset(struct gpiod_line_config *config,
+					 unsigned int offset)
 {
 	struct base_config *base;
 
@@ -556,13 +605,20 @@ gpiod_line_config_get_event_clock(struct gpiod_line_config *config,
 
 static void set_output_value(struct override_config *override, int value)
 {
-	override->value = !!value;
-	override->value_set = true;
+	override->base.value = !!value;
+	override->override_flags |= OVERRIDE_FLAG_OUTPUT_VALUE;
+}
+
+GPIOD_API void
+gpiod_line_config_set_output_value_default(struct gpiod_line_config *config,
+					   int value)
+{
+	config->defaults.value = value;
 }
 
 GPIOD_API void
-gpiod_line_config_set_output_value(struct gpiod_line_config *config,
-				   unsigned int offset, int value)
+gpiod_line_config_set_output_value_offset(struct gpiod_line_config *config,
+					  unsigned int offset, int value)
 {
 	gpiod_line_config_set_output_values(config, 1, &offset, &value);
 }
@@ -592,17 +648,101 @@ gpiod_line_config_set_output_values(struct gpiod_line_config *config,
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
+static bool override_differs_from_defaults(struct base_config *base,
+					   struct override_config *override)
+{
+	if (!base_config_flags_are_equal(base, override) ||
+	    !base_debounce_period_is_equal(base, override) ||
+	    ((override->override_flags & OVERRIDE_FLAG_OUTPUT_VALUE) &&
+	     override->base.value != base->value))
+		return true;
+
+	return false;
+}
+
+GPIOD_API unsigned int
+gpiod_line_config_get_num_overridden_offsets(struct gpiod_line_config *config)
+{
+	unsigned int i, ret = 0;
+
+	for (i = 0; i < config->num_overrides; i++) {
+		/*
+		 * Only because we have an internal override taken for given
+		 * offset, doesn't mean it differs from the defaults yet. We
+		 * need to explicitly check it for every override.
+		 */
+		if (override_differs_from_defaults(&config->defaults,
+						   &config->overrides[i]))
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
+	for (i = 0, j = 0; i < config->num_overrides; i++) {
+		override = &config->overrides[i];
+
+		if (!override_differs_from_defaults(&config->defaults,
+						    override))
+			continue;
+
+		offsets[j++] = override->offset;
+	}
 }
 
 static uint64_t make_kernel_flags(const struct base_config *config)
@@ -693,12 +833,16 @@ static int set_kernel_output_values(uint64_t *mask, uint64_t *vals,
 	int idx;
 
 	gpiod_line_mask_zero(mask);
-	gpiod_line_mask_zero(vals);
+
+	if (config->defaults.value)
+		gpiod_line_mask_fill(vals);
+	else
+		gpiod_line_mask_zero(vals);
 
 	for (i = 0; i < config->num_overrides; i++) {
 		override = &config->overrides[i];
 
-		if (override->value_set) {
+		if (override->override_flags & OVERRIDE_FLAG_OUTPUT_VALUE) {
 			idx = find_bitmap_index(override->offset,
 						num_lines, offsets);
 			if (idx < 0) {
@@ -708,33 +852,13 @@ static int set_kernel_output_values(uint64_t *mask, uint64_t *vals,
 
 			gpiod_line_mask_set_bit(mask, idx);
 			gpiod_line_mask_assign_bit(vals, idx,
-						   !!override->value);
+						   !!override->base.value);
 		}
 	}
 
 	return 0;
 }
 
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
-
-	return true;
-}
-
 static bool override_config_flags_are_equal(struct override_config *a,
 					    struct override_config *b)
 {
@@ -771,16 +895,6 @@ static void set_base_config_flags(struct gpio_v2_line_attribute *attr,
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
@@ -892,14 +1006,26 @@ static int process_overrides(struct gpiod_line_config *config,
 	return 0;
 }
 
+static bool has_overridden_output_values(struct gpiod_line_config *config)
+{
+	unsigned int i;
+
+	for (i = 0; i < config->num_overrides; i++) {
+		if (config->overrides[i].override_flags &
+		    OVERRIDE_FLAG_OUTPUT_VALUE)
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
 
@@ -912,26 +1038,21 @@ int gpiod_line_config_to_kernel(struct gpiod_line_config *config,
 		goto err_2big;
 
 	/*
-	 * First check if we have at least one default output value configured.
-	 * If so, let's take one attribute for the default values.
+	 * First check if we have at least one default output value configured
+	 * or the default output value is 1. If so, let's take one attribute
+	 * for the default values.
 	 */
-	for (i = 0; i < config->num_overrides; i++) {
-		override = &config->overrides[i];
-
-		if (override->value_set) {
-			attr = &cfgbuf->attrs[attr_idx++];
-			attr->attr.id = GPIO_V2_LINE_ATTR_ID_OUTPUT_VALUES;
-
-			ret = set_kernel_output_values(&mask, &values, config,
-						       num_lines, offsets);
-			if (ret)
-				return ret;
+	if (config->defaults.value || has_overridden_output_values(config)) {
+		attr = &cfgbuf->attrs[attr_idx++];
+		attr->attr.id = GPIO_V2_LINE_ATTR_ID_OUTPUT_VALUES;
 
-			attr->attr.values = values;
-			attr->mask = mask;
+		ret = set_kernel_output_values(&mask, &values, config,
+					       num_lines, offsets);
+		if (ret)
+			return ret;
 
-			break;
-		}
+		attr->attr.values = values;
+		attr->mask = mask;
 	}
 
 	/* If we have a default debounce period - use another attribute. */
diff --git a/tools/gpioget.c b/tools/gpioget.c
index 965af3b..5a8597d 100644
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
+		gpiod_line_config_set_active_low_default(line_cfg);
 
 	req_cfg = gpiod_request_config_new();
 	if (!req_cfg)
diff --git a/tools/gpiomon.c b/tools/gpiomon.c
index c09f2f5..5d602d0 100644
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
+		gpiod_line_config_set_active_low_default(line_cfg);
+	gpiod_line_config_set_edge_detection_default(line_cfg, edge);
 
 	req_cfg = gpiod_request_config_new();
 	if (!req_cfg)
diff --git a/tools/gpioset.c b/tools/gpioset.c
index 55fcfe9..2ca03a2 100644
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
+		gpiod_line_config_set_active_low_default(line_cfg);
+	gpiod_line_config_set_direction_default(line_cfg,
+						GPIOD_LINE_DIRECTION_OUTPUT);
 	gpiod_line_config_set_output_values(line_cfg, num_lines,
 					    offsets, values);
 
-- 
2.30.1

