Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F8B94CB9FE
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Mar 2022 10:18:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231426AbiCCJTe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 3 Mar 2022 04:19:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229613AbiCCJTc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Mar 2022 04:19:32 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE1C016A5B5
        for <linux-gpio@vger.kernel.org>; Thu,  3 Mar 2022 01:18:43 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id n33-20020a05600c3ba100b003832caf7f3aso2226454wms.0
        for <linux-gpio@vger.kernel.org>; Thu, 03 Mar 2022 01:18:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3Lo9dsLYDuSDlG86/H6463yK+b0CVyYkZQEUJ4HeCM4=;
        b=5CIu6PU+YWFHWvKWGuFCFuKJkJqVyJTuqgNA3cPhdYPveHGHWR04VT40fYm08062ek
         hUM2PqZA5e1PD8GRZaSdNNmUWrhNkLKoxU465X6q3vSBkuIl8E7AwR3ziLk/DQJ3uBuO
         A/WxB1YsuViT9rUbAinvbZl0pbGYKKBYD/R33S5q7kNlvrV57ijTS0F+2tu67LDk8HzX
         xsTPoLi/UhLMB8KMwuTe38B/knN2xyYp6e1xzJT5RQZ7qpqLwhulbs47ph2meTC5Inxl
         j4wM79nULG2b+Mwuu96JIeC/UDeg+0+HVrDbXbO9oSbzIwsYWC5JkcFUOWZTq1XDyoKD
         Hx6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3Lo9dsLYDuSDlG86/H6463yK+b0CVyYkZQEUJ4HeCM4=;
        b=o1IQh6q8OgI6nDPSu7zGaCgEhNJr8nB7cu4sW3VHYQapwCkSvUiFXvg0t43klZGWyb
         0g6PabO2LvjPBRUpOkf+sFLMXAjBPyzJd/4K7JKf46NDxmtzKdUaaTzCIzObGNPK98KA
         ZauMK9b5LbpHqGxjKu9Ofg/958F7kG4nWdd3Vyy3QrSlrfUrUHXYAHoaRBeEEe5+2waI
         atYlWEI9QAakJjlOtOtKKefxrQWUFU8bGNbsaB4W14cyPHPd05Zr6MFSKRIq7B9yXR21
         D1mLM9F3FvmrhiVJ4hIzMkvsT5T2AdlnE8tqPKlWnRMTD+R8V+RlitEnm5u8lt3FVqaN
         QXqg==
X-Gm-Message-State: AOAM530alQIJEHFBPt+qULzbXPvFLAzU52k65hrDXvZCeO617xBSq4fR
        zg+U4iHBRGwwIsbpJ/WxCqCWVryW0V6vAw==
X-Google-Smtp-Source: ABdhPJzNPBYHZ+DrJYP1MtGnrpU5zUt7ExA9ej43do1qPCNdpBfrwvtMIIseO/79awZzBmhXzwplXQ==
X-Received: by 2002:a1c:6a08:0:b0:388:73a2:1548 with SMTP id f8-20020a1c6a08000000b0038873a21548mr1101201wmc.163.1646299121224;
        Thu, 03 Mar 2022 01:18:41 -0800 (PST)
Received: from debian-brgl.home ([2a01:cb1d:334:ac00:7d50:ff5:f5c1:e225])
        by smtp.gmail.com with ESMTPSA id x13-20020adfec0d000000b001e31279cc38sm1527286wrn.11.2022.03.03.01.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Mar 2022 01:18:40 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [libgpiod v2][PATCH v3 2/3] line-config: expose the override logic to users
Date:   Thu,  3 Mar 2022 10:18:35 +0100
Message-Id: <20220303091836.168223-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20220303091836.168223-1-brgl@bgdev.pl>
References: <20220303091836.168223-1-brgl@bgdev.pl>
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

We also complete the API by providing functions that allow to retrieve
the overridden offsets and their corresponding property types.

This way the caller can fully inspect the line_config and high-level
language bindings can provide stringification methods.

While at it: we fix a couple bugs in the implementation of struct
line_config and add new constructors that take a variable list of
arguments.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 include/gpiod.h   | 591 +++++++++++++++++++++----------
 lib/line-config.c | 871 +++++++++++++++++++++++++++++++---------------
 tools/gpioget.c   |   6 +-
 tools/gpiomon.c   |   6 +-
 tools/gpioset.c   |   9 +-
 5 files changed, 1012 insertions(+), 471 deletions(-)

diff --git a/include/gpiod.h b/include/gpiod.h
index 34fdad6..dc50634 100644
--- a/include/gpiod.h
+++ b/include/gpiod.h
@@ -9,6 +9,7 @@
 #ifndef __LIBGPIOD_GPIOD_H__
 #define __LIBGPIOD_GPIOD_H__
 
+#include <stdarg.h>
 #include <stdbool.h>
 #include <stdint.h>
 
@@ -176,6 +177,8 @@ int gpiod_chip_find_line(struct gpiod_chip *chip, const char *name);
  * @param line_cfg Line config object.
  * @return New line request object or NULL if an error occurred. The request
  *         must be released by the caller using ::gpiod_line_request_release.
+ * @note Line configuration overrides set for offsets that don't end up being
+ *       requested are silently ignored.
  */
 struct gpiod_line_request *
 gpiod_chip_request_lines(struct gpiod_chip *chip,
@@ -458,13 +461,65 @@ gpiod_info_event_get_line_info(struct gpiod_info_event *event);
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
+ * default and one for retrieving the effective value for the line at given
+ * offset), a function for testing if a setting is overridden for the line at
+ * given offset and finally a function for clearing the overrides (per offset).
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
+ */
+
+/**
+ * @brief List of properties that can be stored in a line_config object.
+ *
+ * Used when setting the defaults with ::gpiod_line_config_new_defaults and
+ * when retrieving the overrides.
  */
+enum {
+	GPIOD_LINE_CONFIG_PROP_END = 0,
+	/**< Delimiter. */
+	GPIOD_LINE_CONFIG_PROP_DIRECTION,
+	/**< Line direction. */
+	GPIOD_LINE_CONFIG_PROP_EDGE,
+	/**< Edge detection. */
+	GPIOD_LINE_CONFIG_PROP_BIAS,
+	/**< Bias. */
+	GPIOD_LINE_CONFIG_PROP_DRIVE,
+	/**< Drive. */
+	GPIOD_LINE_CONFIG_PROP_ACTIVE_LOW,
+	/**< Active-low setting. */
+	GPIOD_LINE_CONFIG_PROP_DEBOUNCE_PERIOD,
+	/** Debounce period. */
+	GPIOD_LINE_CONFIG_PROP_EVENT_CLOCK,
+	/**< Event clock type. */
+	GPIOD_LINE_CONFIG_PROP_OUTPUT_VALUE,
+	/**< Output value. */
+};
 
 /**
  * @brief Create a new line config object.
@@ -472,6 +527,26 @@ gpiod_info_event_get_line_info(struct gpiod_info_event *event);
  */
 struct gpiod_line_config *gpiod_line_config_new(void);
 
+/**
+ * @brief Create a new line config object with a set of default properties.
+ * @param first First property type.
+ * @return New line config object or NULL on error.
+ *
+ * The list of arguments consists of a number of type->value pairs and must
+ * end with ::GPIOD_LINE_CONFIG_PROP_END.
+ */
+struct gpiod_line_config *gpiod_line_config_new_defaults(int first, ...);
+
+/**
+ * @brief Variant of ::gpiod_line_config_new_defaults taking va_list as
+ *        argument.
+ * @param first First property type.
+ * @param va List of variadic arguments.
+ * @return New line config object or NULL on error.
+ */
+struct gpiod_line_config *
+gpiod_line_config_new_defaults_va(int first, va_list va);
+
 /**
  * @brief Free the line config object and release all associated resources.
  * @param config Line config object to free.
@@ -488,329 +563,428 @@ void gpiod_line_config_free(struct gpiod_line_config *config);
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
+ */
+void
+gpiod_line_config_clear_direction_override(struct gpiod_line_config *config,
+					   unsigned int offset);
+
+/**
+ * @brief Check if the direction setting is overridden at given offset.
+ * @param config Line config object.
+ * @param offset Offset of the line for which to check the override.
+ * @return True if direction is overridden at this offset, false otherwise.
  */
-void gpiod_line_config_set_direction_subset(struct gpiod_line_config *config,
-					    int direction,
-					    unsigned int num_offsets,
-					    const unsigned int *offsets);
+bool gpiod_line_config_direction_is_overridden(struct gpiod_line_config *config,
+					       unsigned int offset);
 
 /**
- * @brief Get the direction setting for a given line.
+ * @brief Get the default direction setting.
  * @param config Line config object.
- * @param offset Line offset for which to read the direction setting.
- * @return Direction setting that would have been used for given offset if the
- *         config object was used in a request at the time of the call.
- * @note If an offset is used for which no config was provided, the function
- *       will return the global default value.
+ * @return Direction setting that would have been used for any non-overridden
+ *         offset.
  */
-int gpiod_line_config_get_direction(struct gpiod_line_config *config,
-				    unsigned int offset);
+int gpiod_line_config_get_direction_default(struct gpiod_line_config *config);
 
 /**
- * @brief Set the edge event detection for all lines.
+ * @brief Get the direction setting for the line at given offset.
  * @param config Line config object.
- * @param edge Type of edge events to detect.
+ * @param offset Offset of the line for which to read the direction setting.
+ * @return Direction setting that would have been used for the line at given
+ *         offset if the config object was used in a request at the time of the
+ *         call.
  */
-void gpiod_line_config_set_edge_detection(struct gpiod_line_config *config,
-					  int edge);
+int gpiod_line_config_get_direction_offset(struct gpiod_line_config *config,
+					   unsigned int offset);
 
 /**
- * @brief Set the edge event detection for a single line at given offset.
+ * @brief Set the default edge event detection.
  * @param config Line config object.
  * @param edge Type of edge events to detect.
- * @param offset Offset of the line for which to set the edge detection.
  */
 void
-gpiod_line_config_set_edge_detection_offset(struct gpiod_line_config *config,
-					    int edge, unsigned int offset);
+gpiod_line_config_set_edge_detection_default(struct gpiod_line_config *config,
+					     int edge);
 
 /**
- * @brief Set the edge event detection for a subset of lines.
+ * @brief Set the edge detection override at given offset.
  * @param config Line config object.
  * @param edge Type of edge events to detect.
- * @param num_offsets Number of offsets in the array.
- * @param offsets Array of line offsets for which to set the edge detection.
+ * @param offset Offset of the line for which to set the override.
  */
 void
-gpiod_line_config_set_edge_detection_subset(struct gpiod_line_config *config,
-					    int edge, unsigned int num_offsets,
-					    const unsigned int *offsets);
+gpiod_line_config_set_edge_detection_override(struct gpiod_line_config *config,
+					      int edge, unsigned int offset);
 
 /**
- * @brief Get the edge event detection setting for a given line.
+ * @brief Clear the edge detection override at given offset.
  * @param config Line config object.
- * @param offset Line offset for which to read the edge event detection setting.
+ * @param offset Offset of the line for which to clear the override.
+ * @note Does nothing if no override is set for this line.
+ */
+void
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
+
+/**
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
+ * @param config Line config object.
+ * @param offset Offset of the line for which to read the edge event detection
+ *               setting.
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
  */
-void gpiod_line_config_set_bias_subset(struct gpiod_line_config *config,
-				       int bias, unsigned int num_offsets,
-				       const unsigned int *offsets);
+void gpiod_line_config_clear_bias_override(struct gpiod_line_config *config,
+					   unsigned int offset);
 
 /**
- * @brief Get the bias setting for a given line.
+ * @brief Check if the bias setting is overridden at given offset.
  * @param config Line config object.
- * @param offset Line offset for which to read the bias setting.
- * @return Bias setting that would have been used for given offset if the
- *         config object was used in a request at the time of the call.
- * @note If an offset is used for which no config was provided, the function
- *       will return the global default value.
+ * @param offset Offset of the line for which to check the override.
+ * @return True if bias is overridden at this offset, false otherwise.
  */
-int gpiod_line_config_get_bias(struct gpiod_line_config *config,
+bool gpiod_line_config_bias_is_overridden(struct gpiod_line_config *config,
+					  unsigned int offset);
+/**
+ * @brief Get the default bias setting.
+ * @param config Line config object.
+ * @return Bias setting that would have been used for any offset not assigned
+ *         its own direction value.
+ */
+int gpiod_line_config_get_bias_default(struct gpiod_line_config *config);
+
+/**
+ * @brief Get the bias setting for a given offset.
+ * @param config Line config object.
+ * @param offset Offset of the line for which to read the bias setting.
+ * @return Bias setting that would have been used for the line at given offset
+ *         if the config object was used in a request at the time of the call.
+ */
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
+ * @param offset Offset of the line for which to read the drive setting.
+ * @return Drive setting that would have been used for the line at given offset
+ *         if the config object was used in a request at the time of the call.
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
+ * @param offset Offset of the line for which to read the active-low setting.
+ * @return Active-low setting that would have been used for the line at given
+ *         offset if the config object was used in a request at the time of the
+ *         call.
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
- * @param offset Line offset for which to read the debounce period.
- * @return Debounce period that would have been used for given offset if the
- *         config object was used in a request at the time of the call.
- * @note If an offset is used for which no config was provided, the function
- *       will return the global default value.
+ * @param offset Offset of the line for which to read the debounce period.
+ * @return Debounce period that would have been used for the line at given
+ *         offset if the config object was used in a request at the time of
+ *         the call. 0 if debouncing is disabled.
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
+ */
+bool
+gpiod_line_config_event_clock_is_overridden(struct gpiod_line_config *config,
+					    unsigned int offset);
+
+/**
+ * @brief Get the default event clock setting.
+ * @param config Line config object.
+ * @return Event clock setting that would have been used for any offset not
+ *         assigned its own direction value.
  */
-void gpiod_line_config_set_event_clock_subset(struct gpiod_line_config *config,
-					      int clock,
-					      unsigned int num_offsets,
-					      const unsigned int *offsets);
+int gpiod_line_config_get_event_clock_default(struct gpiod_line_config *config);
 
 /**
- * @brief Get the event clock setting for a given line.
+ * @brief Get the event clock setting for a given offset.
  * @param config Line config object.
- * @param offset Line offset for which to read the event clock setting.
- * @return Event clock setting that would have been used for given offset if
- *         the config object was used in a request at the time of the call.
- * @note If an offset is used for which no config was provided, the function
- *       will return the global default value.
+ * @param offset Offset of the line for which to read the event clock setting.
+ * @return Event clock setting that would have been used for the line at given
+ *         offset if the config object was used in a request at the time of the
+ *         call.
  */
-int gpiod_line_config_get_event_clock(struct gpiod_line_config *config,
-				      unsigned int offset);
+int gpiod_line_config_get_event_clock_offset(struct gpiod_line_config *config,
+					     unsigned int offset);
 
 /**
- * @brief Set the output value for a single offset.
+ * @brief Set the default output value.
+ * @param config Line config object.
+ * @param value New value.
+ */
+void
+gpiod_line_config_set_output_value_default(struct gpiod_line_config *config,
+					   int value);
+
+/**
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
@@ -819,14 +993,69 @@ void gpiod_line_config_set_output_values(struct gpiod_line_config *config,
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
+ * @return Output value that would have been used for the line at given offset
+ *         if the config object was used in a request at the time of the call.
  */
-int gpiod_line_config_get_output_value(struct gpiod_line_config *config,
-				       unsigned int offset);
+int gpiod_line_config_get_output_value_offset(struct gpiod_line_config *config,
+					      unsigned int offset);
+
+/**
+ * @brief Get the total number of overridden settings currently stored by this
+ *        line config object.
+ * @param config Line config object.
+ * @return Number of individual overridden settings.
+ */
+unsigned int
+gpiod_line_config_get_num_overrides(struct gpiod_line_config *config);
+
+/**
+ * @brief Get the list of overridden offsets and the corresponding types of
+ *        overridden settings.
+ * @param config Line config object.
+ * @param offsets Array to store the overidden offsets. Must hold at least the
+ *                number of unsigned integers returned by
+ *                ::gpiod_line_config_get_output_value_offset.
+ * @param props Array to store the types of overridden settings. Must hold at
+ *              least the number of integers returned by
+ *              gpiod_line_config_get_output_value_offset.
+ */
+void
+gpiod_line_config_get_overrides(struct gpiod_line_config *config,
+				unsigned int *offsets, int *props);
 
 /**
  * @}
@@ -1028,6 +1257,8 @@ int gpiod_line_request_set_values(struct gpiod_line_request *request,
  * @param request GPIO line request.
  * @param config New line config to apply.
  * @return 0 on success, -1 on failure.
+ * @note Line configuration overrides set for offsets that don't end up being
+ *       requested are silently ignored.
  */
 int gpiod_line_request_reconfigure_lines(struct gpiod_line_request *request,
 					 struct gpiod_line_config *config);
diff --git a/lib/line-config.c b/lib/line-config.c
index 346d331..98f403b 100644
--- a/lib/line-config.c
+++ b/lib/line-config.c
@@ -18,6 +18,7 @@ struct base_config {
 	bool active_low : 1;
 	unsigned int clock : 2;
 	unsigned long debounce_period_us;
+	unsigned int value : 1;
 } GPIOD_PACKED;
 
 #define OVERRIDE_FLAG_DIRECTION		GPIOD_BIT(0)
@@ -27,6 +28,20 @@ struct base_config {
 #define OVERRIDE_FLAG_ACTIVE_LOW	GPIOD_BIT(4)
 #define OVERRIDE_FLAG_CLOCK		GPIOD_BIT(5)
 #define OVERRIDE_FLAG_DEBOUNCE_PERIOD	GPIOD_BIT(6)
+#define OVERRIDE_FLAG_OUTPUT_VALUE	GPIOD_BIT(7)
+
+static const int override_flag_list[] = {
+	OVERRIDE_FLAG_DIRECTION,
+	OVERRIDE_FLAG_EDGE,
+	OVERRIDE_FLAG_BIAS,
+	OVERRIDE_FLAG_DRIVE,
+	OVERRIDE_FLAG_ACTIVE_LOW,
+	OVERRIDE_FLAG_DEBOUNCE_PERIOD,
+	OVERRIDE_FLAG_CLOCK,
+	OVERRIDE_FLAG_OUTPUT_VALUE
+};
+
+#define NUM_OVERRIDE_FLAGS		8
 
 /*
  * Config overriding the defaults for a single line offset. Only flagged
@@ -35,16 +50,13 @@ struct base_config {
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
@@ -58,6 +70,17 @@ static void init_base_config(struct base_config *config)
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
@@ -71,6 +94,72 @@ GPIOD_API struct gpiod_line_config *gpiod_line_config_new(void)
 	return config;
 }
 
+GPIOD_API struct gpiod_line_config *
+gpiod_line_config_new_defaults(int first, ...)
+{
+	struct gpiod_line_config *config;
+	va_list va;
+
+	va_start(va, first);
+	config = gpiod_line_config_new_defaults_va(first, va);
+	va_end(va);
+
+	return config;
+}
+
+GPIOD_API struct gpiod_line_config *
+gpiod_line_config_new_defaults_va(int first, va_list va)
+{
+	struct gpiod_line_config *config;
+	int prop;
+
+	config = gpiod_line_config_new();
+	if (!config)
+		return NULL;
+
+	for (prop = first;
+	     prop != GPIOD_LINE_CONFIG_PROP_END;
+	     prop = va_arg(va, int))
+	{
+		switch (prop) {
+		case GPIOD_LINE_CONFIG_PROP_DIRECTION:
+			gpiod_line_config_set_direction_default(config,
+							va_arg(va, int));
+			break;
+		case GPIOD_LINE_CONFIG_PROP_EDGE:
+			gpiod_line_config_set_edge_detection_default(config,
+							va_arg(va, int));
+			break;
+		case GPIOD_LINE_CONFIG_PROP_BIAS:
+			gpiod_line_config_set_bias_default(config,
+							va_arg(va, int));
+			break;
+		case GPIOD_LINE_CONFIG_PROP_DRIVE:
+			gpiod_line_config_set_drive_default(config,
+							va_arg(va, int));
+			break;
+		case GPIOD_LINE_CONFIG_PROP_ACTIVE_LOW:
+			gpiod_line_config_set_active_low_default(config,
+							(bool)va_arg(va, int));
+			break;
+		case GPIOD_LINE_CONFIG_PROP_DEBOUNCE_PERIOD:
+			gpiod_line_config_set_debounce_period_us_default(config,
+						va_arg(va, unsigned long));
+			break;
+		case GPIOD_LINE_CONFIG_PROP_EVENT_CLOCK:
+			gpiod_line_config_set_event_clock_default(config,
+							va_arg(va, int));
+			break;
+		case GPIOD_LINE_CONFIG_PROP_OUTPUT_VALUE:
+			gpiod_line_config_set_output_value_default(config,
+							va_arg(va, int));
+			break;
+		}
+	}
+
+	return config;
+}
+
 GPIOD_API void gpiod_line_config_free(struct gpiod_line_config *config)
 {
 	free(config);
@@ -82,8 +171,8 @@ GPIOD_API void gpiod_line_config_reset(struct gpiod_line_config *config)
 
 	memset(config, 0, sizeof(*config));
 	init_base_config(&config->defaults);
-	for (i = 0; i < GPIO_V2_LINE_NUM_ATTRS_MAX; i++)
-		init_base_config(&config->overrides[i].base);
+	for (i = 0; i < GPIO_V2_LINES_MAX; i++)
+		init_override_config(&config->overrides[i]);
 }
 
 static struct override_config *
@@ -92,7 +181,7 @@ get_override_by_offset(struct gpiod_line_config *config, unsigned int offset)
 	struct override_config *override;
 	unsigned int i;
 
-	for (i = 0; i < config->num_overrides; i++) {
+	for (i = 0; i < GPIO_V2_LINES_MAX; i++) {
 		override = &config->overrides[i];
 
 		if (override->offset == offset)
@@ -103,19 +192,24 @@ get_override_by_offset(struct gpiod_line_config *config, unsigned int offset)
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
@@ -129,7 +223,7 @@ get_override_config_for_writing(struct gpiod_line_config *config,
 
 	override = get_override_by_offset(config, offset);
 	if (!override) {
-		override = get_new_override(config, offset);
+		override = get_free_override(config, offset);
 		if (!override)
 			return NULL;
 	}
@@ -139,7 +233,7 @@ get_override_config_for_writing(struct gpiod_line_config *config,
 
 static struct base_config *
 get_base_config_for_reading(struct gpiod_line_config *config,
-			   unsigned int offset, unsigned int flag)
+			    unsigned int offset, unsigned int flag)
 {
 	struct override_config *override;
 
@@ -150,6 +244,35 @@ get_base_config_for_reading(struct gpiod_line_config *config,
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
@@ -165,38 +288,49 @@ static void set_direction(struct base_config *config, int direction)
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
 
@@ -222,39 +356,49 @@ static void set_edge_detection(struct base_config *config, int edge)
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
 
@@ -279,38 +423,48 @@ static void set_bias(struct base_config *config, int bias)
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
 
@@ -334,38 +488,48 @@ static void set_drive(struct base_config *config, int drive)
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
 
@@ -375,49 +539,50 @@ GPIOD_API int gpiod_line_config_get_drive(struct gpiod_line_config *config,
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
+{
+	clear_override(config, offset, OVERRIDE_FLAG_ACTIVE_LOW);
+}
+
+GPIOD_API bool
+gpiod_line_config_active_low_is_overridden(struct gpiod_line_config *config,
+					   unsigned int offset)
+{
+	return check_override(config, offset, OVERRIDE_FLAG_ACTIVE_LOW);
+}
+
+GPIOD_API bool
+gpiod_line_config_get_active_low_default(struct gpiod_line_config *config)
 {
-	gpiod_line_config_set_active_setting(config,
-					     num_offsets, offsets, true);
+	return config->defaults.active_low;
 }
 
 GPIOD_API bool
-gpiod_line_config_get_active_low(struct gpiod_line_config *config,
-				 unsigned int offset)
+gpiod_line_config_get_active_low_offset(struct gpiod_line_config *config,
+					unsigned int offset)
 {
 	struct base_config *base;
 
@@ -428,69 +593,52 @@ gpiod_line_config_get_active_low(struct gpiod_line_config *config,
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
 
@@ -514,38 +662,49 @@ static void set_event_clock(struct base_config *config, int clock)
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
 
@@ -554,17 +713,25 @@ gpiod_line_config_get_event_clock(struct gpiod_line_config *config,
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
@@ -573,38 +740,147 @@ gpiod_line_config_set_output_values(struct gpiod_line_config *config,
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
+
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
+gpiod_line_config_get_num_overrides(struct gpiod_line_config *config)
+{
+	struct override_config *override;
+	unsigned int i, j, count = 0;
 
-	errno = ENXIO;
+	for (i = 0; i < GPIO_V2_LINES_MAX; i++) {
+		override = &config->overrides[i];
+
+		if (override_used(override)) {
+			for (j = 0; j < NUM_OVERRIDE_FLAGS; j++) {
+				if (override->override_flags &
+				    override_flag_list[j])
+					count++;
+			}
+		}
+	}
+
+	return count;
+}
+
+static int override_flag_to_prop(int flag)
+{
+	switch (flag) {
+	case OVERRIDE_FLAG_DIRECTION:
+		return GPIOD_LINE_CONFIG_PROP_DIRECTION;
+	case OVERRIDE_FLAG_EDGE:
+		return GPIOD_LINE_CONFIG_PROP_EDGE;
+	case OVERRIDE_FLAG_BIAS:
+		return GPIOD_LINE_CONFIG_PROP_BIAS;
+	case OVERRIDE_FLAG_DRIVE:
+		return GPIOD_LINE_CONFIG_PROP_DRIVE;
+	case OVERRIDE_FLAG_ACTIVE_LOW:
+		return GPIOD_LINE_CONFIG_PROP_ACTIVE_LOW;
+	case OVERRIDE_FLAG_DEBOUNCE_PERIOD:
+		return GPIOD_LINE_CONFIG_PROP_DEBOUNCE_PERIOD;
+	case OVERRIDE_FLAG_CLOCK:
+		return GPIOD_LINE_CONFIG_PROP_EVENT_CLOCK;
+	case OVERRIDE_FLAG_OUTPUT_VALUE:
+		return GPIOD_LINE_CONFIG_PROP_OUTPUT_VALUE;
+	}
+
+	/* Can't happen. */
 	return -1;
 }
 
+GPIOD_API void
+gpiod_line_config_get_overrides(struct gpiod_line_config *config,
+				unsigned int *offsets, int *props)
+{
+	struct override_config *override;
+	unsigned int i, j, count = 0;
+
+	for (i = 0; i < GPIO_V2_LINES_MAX; i++) {
+		override = &config->overrides[i];
+
+		if (override_used(override)) {
+			for (j = 0; j < NUM_OVERRIDE_FLAGS; j++) {
+				if (override->override_flags &
+				    override_flag_list[j]) {
+					offsets[count] = override->offset;
+					props[count] = override_flag_to_prop(
+							override_flag_list[j]);
+					count++;
+				}
+			}
+		}
+	}
+}
+
 static uint64_t make_kernel_flags(const struct base_config *config)
 {
 	uint64_t flags = 0;
@@ -683,10 +959,10 @@ static int find_bitmap_index(unsigned int needle, unsigned int num_lines,
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
@@ -695,44 +971,69 @@ static int set_kernel_output_values(uint64_t *mask, uint64_t *vals,
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
@@ -771,16 +1072,6 @@ static void set_base_config_flags(struct gpio_v2_line_attribute *attr,
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
@@ -801,36 +1092,40 @@ set_base_config_debounce_period(struct gpio_v2_line_attribute *attr,
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
@@ -852,11 +1147,18 @@ static int process_overrides(struct gpiod_line_config *config,
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
@@ -865,12 +1167,13 @@ static int process_overrides(struct gpiod_line_config *config,
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
@@ -878,10 +1181,6 @@ static int process_overrides(struct gpiod_line_config *config,
 		}
 
 		attr = &cfgbuf->attrs[(*attr_idx)++];
-		if (*attr_idx == GPIO_V2_LINE_NUM_ATTRS_MAX) {
-			errno = E2BIG;
-			return -1;
-		}
 
 		set_kernel_attr_mask(&mask, &marked,
 				     num_lines, offsets, config);
@@ -892,14 +1191,31 @@ static int process_overrides(struct gpiod_line_config *config,
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
 
@@ -907,26 +1223,19 @@ int gpiod_line_config_to_kernel(struct gpiod_line_config *config,
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

