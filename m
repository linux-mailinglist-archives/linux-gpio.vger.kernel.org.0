Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D12D4D5C9C
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Mar 2022 08:41:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238542AbiCKHmm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Mar 2022 02:42:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346826AbiCKHml (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Mar 2022 02:42:41 -0500
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFE051B7630
        for <linux-gpio@vger.kernel.org>; Thu, 10 Mar 2022 23:41:36 -0800 (PST)
Received: by mail-pf1-x433.google.com with SMTP id t2so4535697pfj.10
        for <linux-gpio@vger.kernel.org>; Thu, 10 Mar 2022 23:41:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bz19wGLenTCorkyLl9TU5NLWKT+n0Ba3CbNWsdiAYiM=;
        b=gy/aIsth8PHrCqX3Oce+r2uyMXNpAPkJZTI+QqIi0CprjJIweyUUpOwetiB4NXIdQz
         ipAVOVp07Gm2gHVSgT1FPbaHkpSxRySYQKDVkT4ATZMgFVDduDP4PFOqCJsEUr/a6XZA
         OT6cfgBweAID58EyT0C4A6YngWEy3zkxeoQ8qoYZ6ZzqZNvZqyFRJaf40ESQyk/ZmauC
         JYk5TlNuJN95xhjOT08wmfa/Ckp04OA6NSNUgT1YJSIr3vrgQvFKt2w2HgFbOxcbbiq6
         6xKfyyIR96ZFA+26N/BDd0TfJhCUr/jMp8LdKpUiAYFr3ptI0qWaJige23az07Tehoc2
         fbaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bz19wGLenTCorkyLl9TU5NLWKT+n0Ba3CbNWsdiAYiM=;
        b=v7YrxWKyb/wX3RaOfSbylVO+Km6nvymRMrxIrnNV6hffdZOKBypkHjtXpgQqYxGsvE
         pmi7tDYplHEuxJw9yKh2S57mc6j1C2o3hNHkY9hDtr+MnFjb7taIIVsurcvJ4Y+BbwZR
         H5Y+SojDRf2438OMzvNmLd6pSzM6g1qo994wMtkXqhv5lH84SgIsLiZr/38oL/V7sxe3
         uh8Lkri/fqLcdKaw+dO8LbumCKrp+G92xoqstaJj1V8NcyRyMIzCGSicGsdKeAIQ3RoJ
         bRLQJn3AgHiT5bPUYh3u3M8AAYt5ozK7NMkSb9pYfpCeN9OuQNWRV66GRac8PrVwuesj
         twAA==
X-Gm-Message-State: AOAM530K9HTJuxqnCzlp9+zUgXdPdocrgLxMDv7OYTzgPKAQc+NEerfB
        cSoTok+Qqrf7vIFuHHZKdq0zPzxpuGce0w==
X-Google-Smtp-Source: ABdhPJybFI+3X7b+yTtItLTWW3qK9AhqQ+yWA9s/YCVLfrUpDAoTHEW11NDGLU1fxQxw/zgYxvILXQ==
X-Received: by 2002:a63:5051:0:b0:374:5fd0:f131 with SMTP id q17-20020a635051000000b003745fd0f131mr7450257pgl.431.1646984493309;
        Thu, 10 Mar 2022 23:41:33 -0800 (PST)
Received: from sol.home.arpa (60-242-155-106.static.tpgi.com.au. [60.242.155.106])
        by smtp.gmail.com with ESMTPSA id m11-20020a17090a3f8b00b001bc299e0aefsm11973981pjc.56.2022.03.10.23.41.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Mar 2022 23:41:32 -0800 (PST)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, brgl@bgdev.pl
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod v2][PATCH 6/6] doc: API documentation tweaks
Date:   Fri, 11 Mar 2022 15:39:26 +0800
Message-Id: <20220311073926.78636-7-warthog618@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220311073926.78636-1-warthog618@gmail.com>
References: <20220311073926.78636-1-warthog618@gmail.com>
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

A collection of tweaks to the API documentation in gpiod.h

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 include/gpiod.h | 702 +++++++++++++++++++++++++-----------------------
 1 file changed, 373 insertions(+), 329 deletions(-)

diff --git a/include/gpiod.h b/include/gpiod.h
index 90535fa..2365630 100644
--- a/include/gpiod.h
+++ b/include/gpiod.h
@@ -25,7 +25,7 @@ extern "C" {
  * <p>The API is logically split into several parts such as: GPIO chip & line
  * operators, GPIO events handling etc.
  *
- * <p>General note on error handling: all routines exported by libgpiod that
+ * <p>General note on error handling: all functions exported by libgpiod that
  * can fail, set errno to one of the error values defined in errno.h upon
  * failure. The way of notifying the caller that an error occurred varies
  * between functions, but in general a function that returns an int, returns -1
@@ -62,105 +62,108 @@ struct gpiod_edge_event_buffer;
  */
 
 /**
- * @brief Open a GPIO chip by path.
+ * @brief Open a chip by path.
  * @param path Path to the gpiochip device file.
  * @return GPIO chip request or NULL if an error occurred.
  */
 struct gpiod_chip *gpiod_chip_open(const char *path);
 
 /**
- * @brief Close a GPIO chip and release all associated resources.
+ * @brief Close the chip and release all associated resources.
  * @param chip Chip to close.
  */
 void gpiod_chip_close(struct gpiod_chip *chip);
 
 /**
- * @brief Get the GPIO chip name as represented in the kernel.
+ * @brief Get the name of the chip as represented in the kernel.
  * @param chip GPIO chip object.
  * @return Pointer to a human-readable string containing the chip name.
  */
 const char *gpiod_chip_get_name(struct gpiod_chip *chip);
 
 /**
- * @brief Get the GPIO chip label as represented in the kernel.
+ * @brief Get the label of the chip as represented in the kernel.
  * @param chip GPIO chip object.
  * @return Pointer to a human-readable string containing the chip label.
  */
 const char *gpiod_chip_get_label(struct gpiod_chip *chip);
 
 /**
- * @brief Get the path used to open this GPIO chip.
+ * @brief Get the path used to open the chip.
  * @param chip GPIO chip object.
  * @return Path to the file passed as argument to ::gpiod_chip_open.
  */
 const char *gpiod_chip_get_path(struct gpiod_chip *chip);
 
 /**
- * @brief Get the number of GPIO lines exposed by this chip.
+ * @brief Get the number of lines exposed by the chip.
  * @param chip GPIO chip object.
  * @return Number of GPIO lines.
  */
 size_t gpiod_chip_get_num_lines(struct gpiod_chip *chip);
 
 /**
- * @brief Get the current snapshot of information about the line at given
- *        offset.
+ * @brief Get a snapshot of information about a line.
  * @param chip GPIO chip object.
  * @param offset The offset of the GPIO line.
  * @return New GPIO line info object or NULL if an error occurred. The returned
- *         object must be freed by the caller using ::gpiod_line_info_free.
+ *	   object must be freed by the caller using ::gpiod_line_info_free.
  */
 struct gpiod_line_info *gpiod_chip_get_line_info(struct gpiod_chip *chip,
 						 unsigned int offset);
 
 /**
- * @brief Get the current snapshot of information about the line at given
- *        offset and start watching it for future changes.
+ * @brief Get a snapshot of the status of a line and start watching it for
+ *	  future changes.
  * @param chip GPIO chip object.
  * @param offset The offset of the GPIO line.
  * @return New GPIO line info object or NULL if an error occurred. The returned
- *         object must be freed by the caller using ::gpiod_line_info_free.
+ *	   object must be freed by the caller using ::gpiod_line_info_free.
+ * @note Line status does not include the line value.  To monitor the line
+ *	 value the line must be requested as an input with edge detection set.
  */
 struct gpiod_line_info *gpiod_chip_watch_line_info(struct gpiod_chip *chip,
 						   unsigned int offset);
 
 /**
- * @brief Stop watching the line at given offset for status changes.
+ * @brief Stop watching a line for status changes.
  * @param chip GPIO chip object.
- * @param offset The offset of the GPIO line.
+ * @param offset The offset of the line to stop watching.
  * @return 0 on success, -1 on failure.
  */
 int gpiod_chip_unwatch_line_info(struct gpiod_chip *chip, unsigned int offset);
 
 /**
- * @brief Get the file descriptor associated with this chip.
+ * @brief Get the file descriptor associated with the chip.
  * @param chip GPIO chip object.
- * @return File descriptor number. This function never fails. The returned file
- *         descriptor must not be closed by the caller.
+ * @return File descriptor number for the chip.
+ *	   This function never fails.
+ *	   The returned file descriptor must not be closed by the caller.
+ *	   Call ::gpiod_chip_close to close the file descriptor.
  */
 int gpiod_chip_get_fd(struct gpiod_chip *chip);
 
 /**
- * @brief Wait for line status events on any of the watched lines exposed by
- *        this chip.
+ * @brief Wait for line status change events on any of the watched lines
+ *	  on the chip.
  * @param chip GPIO chip object.
  * @param timeout_ns Wait time limit in nanoseconds.
  * @return 0 if wait timed out, -1 if an error occurred, 1 if an event is
- *         pending.
+ *	   pending.
  */
 int gpiod_chip_info_event_wait(struct gpiod_chip *chip, uint64_t timeout_ns);
 
 /**
- * @brief Read a single line status change event from this chip.
+ * @brief Read a single line status change event from the chip.
  * @param chip GPIO chip object.
  * @return Newly read watch event object or NULL on error. The event must be
- *         freed by the caller using ::gpiod_info_event_free.
+ *	   freed by the caller using ::gpiod_info_event_free.
  * @note If no events are pending, this function will block.
  */
 struct gpiod_info_event *gpiod_chip_info_event_read(struct gpiod_chip *chip);
 
 /**
- * @brief Map a GPIO line's name to its offset within the chip.
+ * @brief Map a line's name to its offset within the chip.
  * @param chip GPIO chip object.
  * @param name Name of the GPIO line to map.
  * @return Offset of the line within the chip or -1 on error.
@@ -175,9 +178,9 @@ int gpiod_chip_find_line(struct gpiod_chip *chip, const char *name);
  * @param req_cfg Request config object.
  * @param line_cfg Line config object.
  * @return New line request object or NULL if an error occurred. The request
- *         must be released by the caller using ::gpiod_line_request_release.
- * @note Line configuration overrides set for offsets that don't end up being
- *       requested are silently ignored.
+ *	   must be released by the caller using ::gpiod_line_request_release.
+ * @note Line configuration overrides for lines that are not requested are
+ *	 silently ignored.
  */
 struct gpiod_line_request *
 gpiod_chip_request_lines(struct gpiod_chip *chip,
@@ -206,11 +209,11 @@ enum {
  */
 enum {
 	GPIOD_LINE_DIRECTION_AS_IS = 1,
-	/**< Request the line(s), but don't change current direction. */
+	/**< Request the line(s), but don't change direction. */
 	GPIOD_LINE_DIRECTION_INPUT,
-	/**< Direction is input - we're reading the state of a GPIO line. */
+	/**< Direction is input - for reading the value of an externally driven GPIO line. */
 	GPIOD_LINE_DIRECTION_OUTPUT
-	/**< Direction is output - we're driving the GPIO line. */
+	/**< Direction is output - for driving the GPIO line. */
 };
 
 /**
@@ -250,7 +253,7 @@ enum {
 	GPIOD_LINE_EDGE_RISING,
 	/**< Line detects rising edge events. */
 	GPIOD_LINE_EDGE_FALLING,
-	/**< Line detect falling edge events. */
+	/**< Line detects falling edge events. */
 	GPIOD_LINE_EDGE_BOTH
 	/**< Line detects both rising and falling edge events. */
 };
@@ -274,8 +277,17 @@ enum {
  * Functions for retrieving kernel information about both requested and free
  * lines.
  *
- * Line info object contains an immutable snapshot of the line's state at the
- * time when it was created.
+ * Line info object contains an immutable snapshot of a line's status.
+ *
+ * The line info contains all the publicly available information about a
+ * line, which does not include the line value.  The line must be requested
+ * to access the line value.
+ *
+ * Some accessor methods return pointers.  Those pointers refer to internal
+ * fields.  The lifetimes of those fields are tied to the lifetime of the
+ * containing line info object.
+ * Such pointers remain valid until ::gpiod_line_info_free is called on the
+ * containing line info object. They must not be freed by the caller.
  */
 
 /**
@@ -285,108 +297,116 @@ enum {
 void gpiod_line_info_free(struct gpiod_line_info *info);
 
 /**
- * @brief Copy the line info object.
+ * @brief Copy a line info object.
  * @param info Line info to copy.
  * @return Copy of the line info or NULL on error. The returned object must
- *         be freed by the caller using :gpiod_line_info_free.
+ *	   be freed by the caller using :gpiod_line_info_free.
  */
 struct gpiod_line_info *gpiod_line_info_copy(struct gpiod_line_info *info);
 
 /**
- * @brief Get the hardware offset of the line.
+ * @brief Get the offset of the line.
  * @param info GPIO line info object.
  * @return Offset of the line within the parent chip.
+ *
+ * The offset uniquely identifies the line on the chip.
+ * The combination of the chip and offset uniquely identifies the line within
+ * the system.
  */
 unsigned int gpiod_line_info_get_offset(struct gpiod_line_info *info);
 
 /**
- * @brief Read the GPIO line name.
+ * @brief Get the name of the line.
  * @param info GPIO line info object.
- * @return Name of the GPIO line as it is represented in the kernel. This
- *         routine returns a pointer to a null-terminated string or NULL if
- *         the line is unnamed.
+ * @return Name of the GPIO line as it is represented in the kernel.
+ *	   This function returns a pointer to a null-terminated string
+ *	   or NULL if the line is unnamed.
  */
 const char *gpiod_line_info_get_name(struct gpiod_line_info *info);
 
 /**
- * @brief Check if the line is currently in use.
+ * @brief Check if the line is in use.
  * @param info GPIO line object.
  * @return True if the line is in use, false otherwise.
  *
- * The user space can't know exactly why a line is busy. It may have been
- * requested by another process or hogged by the kernel. It only matters that
- * the line is used and we can't request it.
+ * The exact reason a line is busy cannot be determined from user space.
+ * It may have been requested by another process or hogged by the kernel.
+ * It only matters that the line is used and can't be requested until
+ * released by the existing consumer.
  */
 bool gpiod_line_info_is_used(struct gpiod_line_info *info);
 
 /**
- * @brief Read the GPIO line consumer name.
+ * @brief Get the name of the consumer of the line.
  * @param info GPIO line info object.
- * @return Name of the GPIO consumer name as it is represented in the
- *         kernel. This routine returns a pointer to a null-terminated string
- *         or NULL if the line is not used.
+ * @return Name of the GPIO consumer as it is represented in the kernel.
+ *	   This function returns a pointer to a null-terminated string
+ *	   or NULL if the consumer name is not set.
  */
 const char *gpiod_line_info_get_consumer(struct gpiod_line_info *info);
 
 /**
- * @brief Read the GPIO line direction setting.
+ * @brief Get the direction setting of the line.
  * @param info GPIO line info object.
- * @return Returns GPIOD_LINE_DIRECTION_INPUT or GPIOD_LINE_DIRECTION_OUTPUT.
+ * @return Returns ::GPIOD_LINE_DIRECTION_INPUT or
+ *	   ::GPIOD_LINE_DIRECTION_OUTPUT.
  */
 int gpiod_line_info_get_direction(struct gpiod_line_info *info);
 
 /**
- * @brief Check if the signal of this line is inverted.
+ * @brief Check if the logical value of the line is inverted compared to the
+ *	  physical.
  * @param info GPIO line object.
- * @return True if this line is "active-low", false otherwise.
+ * @return True if the line is "active-low", false otherwise.
  */
 bool gpiod_line_info_is_active_low(struct gpiod_line_info *info);
 
 /**
- * @brief Read the GPIO line bias setting.
+ * @brief Get the bias setting of the line.
  * @param info GPIO line object.
- * @return Returns GPIOD_LINE_BIAS_PULL_UP, GPIOD_LINE_BIAS_PULL_DOWN,
- *         GPIOD_LINE_BIAS_DISABLE or GPIOD_LINE_BIAS_UNKNOWN.
+ * @return Returns ::GPIOD_LINE_BIAS_PULL_UP, ::GPIOD_LINE_BIAS_PULL_DOWN,
+ *	   ::GPIOD_LINE_BIAS_DISABLED or ::GPIOD_LINE_BIAS_UNKNOWN.
  */
 int gpiod_line_info_get_bias(struct gpiod_line_info *info);
 
 /**
- * @brief Read the GPIO line drive setting.
+ * @brief Get the drive setting of the line.
  * @param info GPIO line info object.
- * @return Returns GPIOD_LINE_DRIVE_PUSH_PULL, GPIOD_LINE_DRIVE_OPEN_DRAIN or
- *         GPIOD_LINE_DRIVE_OPEN_SOURCE.
+ * @return Returns ::GPIOD_LINE_DRIVE_PUSH_PULL, ::GPIOD_LINE_DRIVE_OPEN_DRAIN
+ *	   or ::GPIOD_LINE_DRIVE_OPEN_SOURCE.
  */
 int gpiod_line_info_get_drive(struct gpiod_line_info *info);
 
 /**
- * @brief Read the current edge detection setting of this line.
+ * @brief Get the edge detection setting of the line.
  * @param info GPIO line info object.
- * @return Returns GPIOD_LINE_EDGE_NONE, GPIOD_LINE_EDGE_RISING,
- *         GPIOD_LINE_EDGE_FALLING or GPIOD_LINE_EDGE_BOTH.
+ * @return Returns ::GPIOD_LINE_EDGE_NONE, ::GPIOD_LINE_EDGE_RISING,
+ *	   ::GPIOD_LINE_EDGE_FALLING or ::GPIOD_LINE_EDGE_BOTH.
  */
 int gpiod_line_info_get_edge_detection(struct gpiod_line_info *info);
 
 /**
- * @brief Read the current event clock setting used for edge event timestamps.
+ * @brief Get the event clock setting used for edge event timestamps for the
+ *	  line.
  * @param info GPIO line info object.
- * @return Returns GPIOD_LINE_EVENT_CLOCK_MONOTONIC or
- *         GPIOD_LINE_EVENT_CLOCK_REALTIME.
+ * @return Returns ::GPIOD_LINE_EVENT_CLOCK_MONOTONIC or
+ *	   ::GPIOD_LINE_EVENT_CLOCK_REALTIME.
  */
 int gpiod_line_info_get_event_clock(struct gpiod_line_info *info);
 
 /**
- * @brief Check if this line is debounced (either by hardware or by the kernel
- *        software debouncer).
+ * @brief Check if the line is debounced (either by hardware or by the kernel
+ *	  software debouncer).
  * @param info GPIO line info object.
  * @return True if the line is debounced, false otherwise.
  */
 bool gpiod_line_info_is_debounced(struct gpiod_line_info *info);
 
 /**
- * @brief Read the current debounce period in microseconds.
+ * @brief Get the debounce period of the line, in microseconds.
  * @param info GPIO line info object.
- * @return Current debounce period in microseconds, 0 if the line is not
- *         debounced.
+ * @return Debounce period in microseconds.
+ *	   0 if the line is not debounced.
  */
 unsigned long
 gpiod_line_info_get_debounce_period_us(struct gpiod_line_info *info);
@@ -398,11 +418,11 @@ gpiod_line_info_get_debounce_period_us(struct gpiod_line_info *info);
  * @{
  *
  * Accessors for the info event objects allowing to monitor changes in GPIO
- * line state.
+ * line status.
  *
- * Callers can be notified about changes in line's state using the interfaces
- * exposed by GPIO chips. Each info event contains information about the event
- * itself (timestamp, type) as well as a snapshot of line's state in the form
+ * Callers are notified about changes in a line's status due to GPIO uAPI
+ * calls. Each info event contains information about the event itself
+ * (timestamp, type) as well as a snapshot of line's status in the form
  * of a line-info object.
  */
 
@@ -425,27 +445,27 @@ enum {
 void gpiod_info_event_free(struct gpiod_info_event *event);
 
 /**
- * @brief Get the event type of this status change event.
+ * @brief Get the event type of the status change event.
  * @param event Line status watch event.
  * @return One of ::GPIOD_INFO_EVENT_LINE_REQUESTED,
- *         ::GPIOD_INFO_EVENT_LINE_RELEASED or
- *         ::GPIOD_INFO_EVENT_LINE_CONFIG_CHANGED.
+ *	   ::GPIOD_INFO_EVENT_LINE_RELEASED or
+ *	   ::GPIOD_INFO_EVENT_LINE_CONFIG_CHANGED.
  */
 int gpiod_info_event_get_event_type(struct gpiod_info_event *event);
 
 /**
  * @brief Get the timestamp of the event.
  * @param event Line status watch event.
- * @return Timestamp in nanoseconds.
+ * @return Timestamp in nanoseconds, read from the monotonic clock.
  */
 uint64_t gpiod_info_event_get_timestamp(struct gpiod_info_event *event);
 
 /**
- * @brief Get the pointer to the line-info object associated with this event.
+ * @brief Get the snapshot of line-info associated with the event.
  * @param event Line info event object.
- * @return Returns a pointer to the line-info object associated with this event
- *         whose lifetime is tied to the event object. It must not be freed by
- *         the caller.
+ * @return Returns a pointer to the line-info object associated with the event
+ *	   whose lifetime is tied to the event object. It must not be freed by
+ *	   the caller.
  */
 struct gpiod_line_info *
 gpiod_info_event_get_line_info(struct gpiod_info_event *event);
@@ -458,39 +478,39 @@ gpiod_info_event_get_line_info(struct gpiod_info_event *event);
  *
  * Functions for manipulating line configuration objects.
  *
- * The line-config object stores the configuration for lines that can be used
- * in two cases: when making a line request and when reconfiguring a set of
- * already requested lines.
+ * The line-config object contains the configuration for lines that can be
+ * used in two cases:
+ *  - when making a line request
+ *  - when reconfiguring a set of already requested lines.
  *
- * A new line-config object is instantiated containing a set of sane defaults
+ * A new line-config object is instantiated with a set of sane defaults
  * for all supported configuration settings. Those defaults can be modified by
  * the caller. Default values can be overridden by applying different values
- * for specific line offsets. When making a request or reconfiguring an
- * existing one, the overridden settings for specific offsets will be taken
- * into account first and for every other offset and setting the defaults will
- * be used.
+ * for specific lines. When making a request or reconfiguring an existing one,
+ * the overridden settings for specific lines take precedance. For lines
+ * without an override the requested default settings are used.
  *
  * For every setting there are two mutators (one setting the default and one
- * for the per-offset override), two getters (one for reading the global
- * default and one for retrieving the effective value for the line at given
- * offset), a function for testing if a setting is overridden for the line at
- * given offset and finally a function for clearing the overrides (per offset).
+ * for the per-line override), two getters (one for reading the global
+ * default and one for retrieving the effective value for the line),
+ * a function for testing if a setting is overridden for the line
+ * and finally a function for clearing the overrides (per line).
  *
  * The mutators don't return errors. If the set of options is too complex to
- * be translated into kernel uAPI structures - the error will be returned at
+ * be translated into kernel uAPI structures then an error will be returned at
  * the time of the request or reconfiguration. If an invalid value was passed
- * to any of the mutators - the default value will be silently used instead.
+ * to any of the mutators then the default value will be silently used instead.
  *
- * Operating on offsets in struct line_config has no effect on real GPIOs. It
- * only manipulates the object in memory and is only applied to the hardware
- * at the time of the request or reconfiguration.
+ * Operating on lines in struct line_config has no immediate effect on real
+ * GPIOs, it only manipulates the config object in memory.  Those changes are
+ * only applied to the hardware at the time of the request or reconfiguration.
  *
- * Overrides set for offsets that don't end up being requested are silently
- * ignored both in ::gpiod_chip_request_lines as well as in
+ * Overrides for lines that don't end up being requested are silently ignored
+ * both in ::gpiod_chip_request_lines as well as in
  * ::gpiod_line_request_reconfigure_lines.
  *
- * In cases where all requested lines are using the global defaults, the
- * offsets can be entirely ignored when preparing the line configuration.
+ * In cases where all requested lines are using the one configuration, the
+ * line overrides can be entirely ignored when preparing the configuration.
  */
 
 /**
@@ -509,13 +529,13 @@ void gpiod_line_config_free(struct gpiod_line_config *config);
  * @brief Reset the line config object.
  * @param config Line config object to free.
  *
- * Resets the entire configuration stored in this object. This is useful if
+ * Resets the entire configuration stored in the object. This is useful if
  * the user wants to reuse the object without reallocating it.
  */
 void gpiod_line_config_reset(struct gpiod_line_config *config);
 
 /**
- * @brief Set the default direction setting.
+ * @brief Set the default line direction.
  * @param config Line config object.
  * @param direction New direction.
  */
@@ -523,30 +543,30 @@ void gpiod_line_config_set_direction_default(struct gpiod_line_config *config,
 					     int direction);
 
 /**
- * @brief Set the direction override at given offset.
+ * @brief Set the direction override for a line.
  * @param config Line config object.
  * @param direction New direction.
- * @param offset Offset of the line for which to set the override.
+ * @param offset The offset of the line for which to set the override.
  */
 void gpiod_line_config_set_direction_override(struct gpiod_line_config *config,
 					      int direction,
 					      unsigned int offset);
 
 /**
- * @brief Clear the direction override at given offset.
+ * @brief Clear the direction override for a line.
  * @param config Line config object.
- * @param offset Offset of the line for which to clear the override.
- * @note Does nothing if no override is set for this line.
+ * @param offset The offset of the line for which to clear the override.
+ * @note Does nothing if no override is set for the line.
  */
 void
 gpiod_line_config_clear_direction_override(struct gpiod_line_config *config,
 					   unsigned int offset);
 
 /**
- * @brief Check if the direction setting is overridden at given offset.
+ * @brief Check if the direction is overridden for a line.
  * @param config Line config object.
- * @param offset Offset of the line for which to check the override.
- * @return True if direction is overridden at this offset, false otherwise.
+ * @param offset The offset of the line to check for the override.
+ * @return True if direction is overridden on the line, false otherwise.
  */
 bool gpiod_line_config_direction_is_overridden(struct gpiod_line_config *config,
 					       unsigned int offset);
@@ -554,18 +574,16 @@ bool gpiod_line_config_direction_is_overridden(struct gpiod_line_config *config,
 /**
  * @brief Get the default direction setting.
  * @param config Line config object.
- * @return Direction setting that would have been used for any non-overridden
- *         offset.
+ * @return Direction setting used for any non-overridden line.
  */
 int gpiod_line_config_get_direction_default(struct gpiod_line_config *config);
 
 /**
- * @brief Get the direction setting for the line at given offset.
+ * @brief Get the direction setting for a line.
  * @param config Line config object.
- * @param offset Offset of the line for which to read the direction setting.
- * @return Direction setting that would have been used for the line at given
- *         offset if the config object was used in a request at the time of the
- *         call.
+ * @param offset The offset of the line for which to read the direction.
+ * @return Direction setting for the line if the config object were used
+ *	   in a request.
  */
 int gpiod_line_config_get_direction_offset(struct gpiod_line_config *config,
 					   unsigned int offset);
@@ -580,30 +598,30 @@ gpiod_line_config_set_edge_detection_default(struct gpiod_line_config *config,
 					     int edge);
 
 /**
- * @brief Set the edge detection override at given offset.
+ * @brief Set the edge detection override for a line.
  * @param config Line config object.
  * @param edge Type of edge events to detect.
- * @param offset Offset of the line for which to set the override.
+ * @param offset The offset of the line for which to set the override.
  */
 void
 gpiod_line_config_set_edge_detection_override(struct gpiod_line_config *config,
 					      int edge, unsigned int offset);
 
 /**
- * @brief Clear the edge detection override at given offset.
+ * @brief Clear the edge detection override for a line.
  * @param config Line config object.
- * @param offset Offset of the line for which to clear the override.
- * @note Does nothing if no override is set for this line.
+ * @param offset The offset of the line for which to clear the override.
+ * @note Does nothing if no override is set for the line.
  */
 void
 gpiod_line_config_clear_edge_detection_override(
 			struct gpiod_line_config *config, unsigned int offset);
 
 /**
- * @brief Check if the edge detection setting is overridden at given offset.
+ * @brief Check if the edge detection setting is overridden for a line.
  * @param config Line config object.
- * @param offset Offset of the line for which to check the override.
- * @return True if edge detection is overridden at this offset, false otherwise.
+ * @param offset The offset of the line to check for the override.
+ * @return True if edge detection is overridden for the line, false otherwise.
  */
 bool
 gpiod_line_config_edge_detection_is_overridden(struct gpiod_line_config *config,
@@ -612,20 +630,18 @@ gpiod_line_config_edge_detection_is_overridden(struct gpiod_line_config *config,
 /**
  * @brief Get the default edge detection setting.
  * @param config Line config object.
- * @return Edge detection setting that would have been used for any offset not
- *         assigned its own direction value.
+ * @return Edge detection setting used for any non-overridden line.
  */
 int
 gpiod_line_config_get_edge_detection_default(struct gpiod_line_config *config);
 
 /**
- * @brief Get the edge event detection setting for a given offset.
+ * @brief Get the edge event detection setting for a line.
  * @param config Line config object.
- * @param offset Offset of the line for which to read the edge event detection
- *               setting.
- * @return Edge event detection setting that would have been used for given
- *         offset if the config object was used in a request at the time of
- *         the call.
+ * @param offset The offset of the line for which to read the edge event detection
+ *		 setting.
+ * @return Edge event detection setting for the line if the config object
+ *	   were used in a request.
  */
 int
 gpiod_line_config_get_edge_detection_offset(struct gpiod_line_config *config,
@@ -640,45 +656,44 @@ void gpiod_line_config_set_bias_default(struct gpiod_line_config *config,
 					int bias);
 
 /**
- * @brief Set the bias override at given offset.
+ * @brief Set the bias override for a line.
  * @param config Line config object.
  * @param bias New bias setting.
- * @param offset Offset of the line for which to set the override.
+ * @param offset The offset of the line for which to set the override.
  */
 void gpiod_line_config_set_bias_override(struct gpiod_line_config *config,
 					 int bias, unsigned int offset);
 
 /**
- * @brief Clear the bias override at given offset.
+ * @brief Clear the bias override for a line.
  * @param config Line config object.
- * @param offset Offset of the line for which to clear the override.
- * @note Does nothing if no override is set for this line.
+ * @param offset The offset of the line for which to clear the override.
+ * @note Does nothing if no override is set for the line.
  */
 void gpiod_line_config_clear_bias_override(struct gpiod_line_config *config,
 					   unsigned int offset);
 
 /**
- * @brief Check if the bias setting is overridden at given offset.
+ * @brief Check if the bias setting is overridden for a line.
  * @param config Line config object.
- * @param offset Offset of the line for which to check the override.
- * @return True if bias is overridden at this offset, false otherwise.
+ * @param offset The offset of the line to check for the override.
+ * @return True if bias is overridden for the line, false otherwise.
  */
 bool gpiod_line_config_bias_is_overridden(struct gpiod_line_config *config,
 					  unsigned int offset);
 /**
  * @brief Get the default bias setting.
  * @param config Line config object.
- * @return Bias setting that would have been used for any offset not assigned
- *         its own direction value.
+ * @return Bias setting used for any non-overridden line.
  */
 int gpiod_line_config_get_bias_default(struct gpiod_line_config *config);
 
 /**
- * @brief Get the bias setting for a given offset.
+ * @brief Get the bias setting for a line.
  * @param config Line config object.
- * @param offset Offset of the line for which to read the bias setting.
- * @return Bias setting that would have been used for the line at given offset
- *         if the config object was used in a request at the time of the call.
+ * @param offset The offset of the line for which to read the bias setting.
+ * @return Bias setting used for the line if the config object were used
+ *	   in a request.
  */
 int gpiod_line_config_get_bias_offset(struct gpiod_line_config *config,
 			       unsigned int offset);
@@ -692,28 +707,28 @@ void gpiod_line_config_set_drive_default(struct gpiod_line_config *config,
 					 int drive);
 
 /**
- * @brief Set the drive override at given offset.
+ * @brief Set the drive override for a line.
  * @param config Line config object.
  * @param drive New drive setting.
- * @param offset Offset of the line for which to set the override.
+ * @param offset The offset of the line for which to set the override.
  */
 void gpiod_line_config_set_drive_override(struct gpiod_line_config *config,
 					  int drive, unsigned int offset);
 
 /**
- * @brief Clear the drive override at given offset.
+ * @brief Clear the drive override for a line.
  * @param config Line config object.
- * @param offset Offset of the line for which to clear the override.
- * @note Does nothing if no override is set for this line.
+ * @param offset The offset of the line for which to clear the override.
+ * @note Does nothing if no override is set for the line.
  */
 void gpiod_line_config_clear_drive_override(struct gpiod_line_config *config,
 					    unsigned int offset);
 
 /**
- * @brief Check if the drive setting is overridden at given offset.
+ * @brief Check if the drive setting is overridden for a line.
  * @param config Line config object.
- * @param offset Offset of the line for which to check the override.
- * @return True if drive is overridden at this offset, false otherwise.
+ * @param offset The offset of the line to check for the override.
+ * @return True if drive is overridden for the line, false otherwise.
  */
 bool gpiod_line_config_drive_is_overridden(struct gpiod_line_config *config,
 					   unsigned int offset);
@@ -721,23 +736,22 @@ bool gpiod_line_config_drive_is_overridden(struct gpiod_line_config *config,
 /**
  * @brief Get the default drive setting.
  * @param config Line config object.
- * @return Drive setting that would have been used for any offset not assigned
- *         its own direction value.
+ * @return Drive setting for any non-overridden line.
  */
 int gpiod_line_config_get_drive_default(struct gpiod_line_config *config);
 
 /**
- * @brief Get the drive setting for a given offset.
+ * @brief Get the drive setting for a line.
  * @param config Line config object.
- * @param offset Offset of the line for which to read the drive setting.
- * @return Drive setting that would have been used for the line at given offset
- *         if the config object was used in a request at the time of the call.
+ * @param offset The offset of the line for which to read the drive setting.
+ * @return Drive setting for the line if the config object were used in a
+ *	   request.
  */
 int gpiod_line_config_get_drive_offset(struct gpiod_line_config *config,
 				       unsigned int offset);
 
 /**
- * @brief Set lines to active-low by default.
+ * @brief Set the default active-low setting.
  * @param config Line config object.
  * @param active_low New active-low setting.
  */
@@ -745,30 +759,30 @@ void gpiod_line_config_set_active_low_default(struct gpiod_line_config *config,
 					      bool active_low);
 
 /**
- * @brief Override the active-low setting at given offset.
+ * @brief Override the active-low setting for a line.
  * @param config Line config object.
  * @param active_low New active-low setting.
- * @param offset Offset of the line for which to set the override.
+ * @param offset The offset of the line for which to set the override.
  */
 void gpiod_line_config_set_active_low_override(struct gpiod_line_config *config,
 					       bool active_low,
 					       unsigned int offset);
 
 /**
- * @brief Clear the active-low override at given offset.
+ * @brief Clear the active-low override for a line.
  * @param config Line config object.
- * @param offset Offset of the line for which to clear the override.
- * @note Does nothing if no override is set for this line.
+ * @param offset The offset of the line for which to clear the override.
+ * @note Does nothing if no override is set for the line.
  */
 void
 gpiod_line_config_clear_active_low_override(struct gpiod_line_config *config,
 					    unsigned int offset);
 
 /**
- * @brief Check if the active-low setting is overridden at given offset.
+ * @brief Check if the active-low setting is overridden for a line.
  * @param config Line config object.
- * @param offset Offset of the line for which to check the override.
- * @return True if active-low is overridden at this offset, false otherwise.
+ * @param offset The offset of the line to check for the override.
+ * @return True if active-low is overridden for the line, false otherwise.
  */
 bool
 gpiod_line_config_active_low_is_overridden(struct gpiod_line_config *config,
@@ -777,18 +791,16 @@ gpiod_line_config_active_low_is_overridden(struct gpiod_line_config *config,
 /**
  * @brief Check if active-low is the default setting.
  * @param config Line config object.
- * @return Active-low setting that would have been used for any offset not
- *         assigned its own value.
+ * @return Active-low setting for any non-overridden line.
  */
 bool gpiod_line_config_get_active_low_default(struct gpiod_line_config *config);
 
 /**
- * @brief Check if the line at given offset was configured as active-low.
+ * @brief Check if a line is configured as active-low.
  * @param config Line config object.
- * @param offset Offset of the line for which to read the active-low setting.
- * @return Active-low setting that would have been used for the line at given
- *         offset if the config object was used in a request at the time of the
- *         call.
+ * @param offset The offset of the line for which to read the active-low setting.
+ * @return Active-low setting for the line if the config object were used in
+ *	   a request.
  */
 bool gpiod_line_config_get_active_low_offset(struct gpiod_line_config *config,
 					     unsigned int offset);
@@ -796,16 +808,19 @@ bool gpiod_line_config_get_active_low_offset(struct gpiod_line_config *config,
 /**
  * @brief Set the default debounce period.
  * @param config Line config object.
- * @param period New debounce period. Disables debouncing if 0.
+ * @param period New debounce period in microseconds. Disables debouncing if 0.
+ * @note Debouncing is only useful on input lines with edge detection.
+ *	 Its purpose is to filter spurious events due to noise during the
+ *	 edge transition.  It has no effect on normal get or set operations.
  */
 void gpiod_line_config_set_debounce_period_us_default(
 		struct gpiod_line_config *config, unsigned long period);
 
 /**
- * @brief Override the debounce period setting at given offset.
+ * @brief Override the debounce period setting for a line.
  * @param config Line config object.
  * @param period New debounce period in microseconds.
- * @param offset Offset of the line for which to set the override.
+ * @param offset The offset of the line for which to set the override.
  */
 void
 gpiod_line_config_set_debounce_period_us_override(
@@ -814,21 +829,21 @@ gpiod_line_config_set_debounce_period_us_override(
 					unsigned int offset);
 
 /**
- * @brief Clear the debounce period override at given offset.
+ * @brief Clear the debounce period override for a line.
  * @param config Line config object.
- * @param offset Offset of the line for which to clear the override.
- * @note Does nothing if no override is set for this line.
+ * @param offset The offset of the line for which to clear the override.
+ * @note Does nothing if no override is set for the line.
  */
 void gpiod_line_config_clear_debounce_period_us_override(
 					struct gpiod_line_config *config,
 					unsigned int offset);
 
 /**
- * @brief Check if the debounce period setting is overridden at given offset.
+ * @brief Check if the debounce period setting is overridden for a line.
  * @param config Line config object.
- * @param offset Offset of the line for which to check the override.
- * @return True if debounce period is overridden at this offset, false
- *         otherwise.
+ * @param offset The offset of the line to check for the override.
+ * @return True if debounce period is overridden for the line, false
+ *	   otherwise.
  */
 bool gpiod_line_config_debounce_period_us_is_overridden(
 					struct gpiod_line_config *config,
@@ -837,19 +852,21 @@ bool gpiod_line_config_debounce_period_us_is_overridden(
 /**
  * @brief Get the default debounce period.
  * @param config Line config object.
- * @return Debounce period that would have been used for any offset not
- *         assigned its own debounce period. 0 if not debouncing is disabled.
+ * @return Debounce period for any non-overridden line.
+ *	   Measured in microseconds.
+ *	   0 if debouncing is disabled.
  */
 unsigned long gpiod_line_config_get_debounce_period_us_default(
 					struct gpiod_line_config *config);
 
 /**
- * @brief Get the debounce period for a given offset.
+ * @brief Get the debounce period for a line.
  * @param config Line config object.
- * @param offset Offset of the line for which to read the debounce period.
- * @return Debounce period that would have been used for the line at given
- *         offset if the config object was used in a request at the time of
- *         the call. 0 if debouncing is disabled.
+ * @param offset The offset of the line for which to read the debounce period.
+ * @return Debounce period for the line if the config object were used in a
+ *	   request.
+ *	   Measured in microseconds.
+ *	   0 if debouncing is disabled.
  */
 unsigned long
 gpiod_line_config_get_debounce_period_us_offset(
@@ -864,31 +881,31 @@ void gpiod_line_config_set_event_clock_default(struct gpiod_line_config *config,
 					       int clock);
 
 /**
- * @brief Override the event clock setting at given offset.
+ * @brief Override the event clock setting for a line.
  * @param config Line config object.
  * @param clock New event clock to use.
- * @param offset Offset of the line for which to set the override.
+ * @param offset The offset of the line for which to set the override.
  */
 void
 gpiod_line_config_set_event_clock_override(struct gpiod_line_config *config,
 					   int clock, unsigned int offset);
 
 /**
- * @brief Clear the event clock override at given offset.
+ * @brief Clear the event clock override for a line.
  * @param config Line config object.
- * @param offset Offset of the line for which to clear the override.
- * @note Does nothing if no override is set for this line.
+ * @param offset The offset of the line for which to clear the override.
+ * @note Does nothing if no override is set for the line.
  */
 void
 gpiod_line_config_clear_event_clock_override(struct gpiod_line_config *config,
 					     unsigned int offset);
 
 /**
- * @brief Check if the event clock setting is overridden at given offset.
+ * @brief Check if the event clock setting is overridden for a line.
  * @param config Line config object.
- * @param offset Offset of the line for which to check the override.
- * @return True if event clock period is overridden at this offset, false
- *         otherwise.
+ * @param offset The offset of the line to check for the override.
+ * @return True if event clock period is overridden for the line, false
+ *	   otherwise.
  */
 bool
 gpiod_line_config_event_clock_is_overridden(struct gpiod_line_config *config,
@@ -897,18 +914,16 @@ gpiod_line_config_event_clock_is_overridden(struct gpiod_line_config *config,
 /**
  * @brief Get the default event clock setting.
  * @param config Line config object.
- * @return Event clock setting that would have been used for any offset not
- *         assigned its own direction value.
+ * @return Event clock setting for any non-overridden line.
  */
 int gpiod_line_config_get_event_clock_default(struct gpiod_line_config *config);
 
 /**
- * @brief Get the event clock setting for a given offset.
+ * @brief Get the event clock setting for a line.
  * @param config Line config object.
- * @param offset Offset of the line for which to read the event clock setting.
- * @return Event clock setting that would have been used for the line at given
- *         offset if the config object was used in a request at the time of the
- *         call.
+ * @param offset The offset of the line for which to read the event clock setting.
+ * @return Event clock setting for the line if the config object were used in a
+ *	   request.
  */
 int gpiod_line_config_get_event_clock_offset(struct gpiod_line_config *config,
 					     unsigned int offset);
@@ -917,15 +932,18 @@ int gpiod_line_config_get_event_clock_offset(struct gpiod_line_config *config,
  * @brief Set the default output value.
  * @param config Line config object.
  * @param value New value.
+ *
+ * The default output value applies to all non-overridden output lines.
+ * It does not apply to input lines or overridden lines.
  */
 void
 gpiod_line_config_set_output_value_default(struct gpiod_line_config *config,
 					   int value);
 
 /**
- * @brief Override the output value for a single offset.
+ * @brief Override the output value for a line.
  * @param config Line config object.
- * @param offset Offset of the line.
+ * @param offset The offset of the line for which to override the output value.
  * @param value Output value to set.
  */
 void
@@ -933,12 +951,13 @@ gpiod_line_config_set_output_value_override(struct gpiod_line_config *config,
 					    unsigned int offset, int value);
 
 /**
- * @brief Override the output values for multiple offsets.
+ * @brief Override the output values for multiple lines.
  * @param config Line config object.
  * @param num_lines Number of lines for which to override values.
- * @param offsets Array of line offsets to override values for.
- * @param values Array of output values associated with the offsets passed in
- *               the previous argument.
+ * @param offsets Array of offsets indentifying the lines for which to override
+ *		  values,  containing \p num_lines entries.
+ * @param values Array of output values corresponding to the lines identified in
+ *		 \p offsets, also containing \p num_lines entries.
  */
 void gpiod_line_config_set_output_values(struct gpiod_line_config *config,
 					 size_t num_lines,
@@ -946,21 +965,20 @@ void gpiod_line_config_set_output_values(struct gpiod_line_config *config,
 					 const int *values);
 
 /**
- * @brief Clear the output value override at given offset.
+ * @brief Clear the output value override for a line.
  * @param config Line config object.
- * @param offset Offset of the line for which to clear the override.
- * @note Does nothing if no override is set for this line.
+ * @param offset The offset of the line for which to clear the override.
+ * @note Does nothing if no override is set for the line.
  */
 void
 gpiod_line_config_clear_output_value_override(struct gpiod_line_config *config,
 					      unsigned int offset);
 
 /**
- * @brief Check if the output value is overridden at given offset.
+ * @brief Check if the output value is overridden for a line.
  * @param config Line config object.
- * @param offset Offset of the line for which to check the override.
- * @return True if output value period is overridden at this offset, false
- *         otherwise.
+ * @param offset The offset of the line to check for the override.
+ * @return True if output value is overridden for the line, false otherwise.
  */
 bool
 gpiod_line_config_output_value_is_overridden(struct gpiod_line_config *config,
@@ -969,18 +987,17 @@ gpiod_line_config_output_value_is_overridden(struct gpiod_line_config *config,
 /**
  * @brief Get the default output value.
  * @param config Line config object.
- * @return Output value that would have been used for any offset not
- *         assigned its own output value.
+ * @return Output value for any non-overridden line.
  */
 int
 gpiod_line_config_get_output_value_default(struct gpiod_line_config *config);
 
 /**
- * @brief Get the output value configured for a given line.
+ * @brief Get the configured output value for a line.
  * @param config Line config object.
  * @param offset Line offset for which to read the value.
- * @return Output value that would have been used for the line at given offset
- *         if the config object was used in a request at the time of the call.
+ * @return Output value for the line if the config object were used in a
+ *	   request.
  */
 int gpiod_line_config_get_output_value_offset(struct gpiod_line_config *config,
 					      unsigned int offset);
@@ -1012,8 +1029,8 @@ enum {
 };
 
 /**
- * @brief Get the total number of overridden settings currently stored by this
- *        line config object.
+ * @brief Get the total number of overridden settings stored in the line config
+ *	  object.
  * @param config Line config object.
  * @return Number of individual overridden settings.
  */
@@ -1021,17 +1038,17 @@ size_t gpiod_line_config_get_num_overrides(struct gpiod_line_config *config);
 
 /**
  * @brief Get the list of overridden offsets and the corresponding types of
- *        overridden settings.
+ *	  overridden settings.
  * @param config Line config object.
- * @param offsets Array to store the overidden offsets. Must hold at least the
- *                number of unsigned integers returned by
- *                ::gpiod_line_config_get_num_overrides.
- * @param props Array to store the types of overridden settings. Must hold at
- *              least the number of integers returned by
- *              ::gpiod_line_config_get_num_overrides.
+ * @param offsets Array to store the overidden offsets. Must be sized to hold
+ *		  the number of unsigned integers returned by
+ *		  ::gpiod_line_config_get_num_overrides.
+ * @param props Array to store the types of overridden settings. Must be sized
+ *		to hold the number of integers returned by
+ *		::gpiod_line_config_get_num_overrides.
  *
- * The overridden offsets are stored in the offsets array with the array index
- * corresponding with the property stored in the props array at the same index.
+ * The overridden (offset, prop) pairs are stored in the \p offsets and
+ * \p props arrays, with the pairs having the same index.
  */
 void
 gpiod_line_config_get_overrides(struct gpiod_line_config *config,
@@ -1045,10 +1062,10 @@ gpiod_line_config_get_overrides(struct gpiod_line_config *config,
  *
  * Functions for manipulating request configuration objects.
  *
- * Request config object is used to pass a set of options to the kernel at the
- * time of the line request. Similarly to the line-config - the mutators don't
- * return error values. If the values are invalid, in general they are silently
- * adjusted to acceptable ranges.
+ * Request config objects are used to pass a set of options to the kernel at
+ * the time of the line request. Similarly to the line-config - the mutators
+ * don't return error values. If the values are invalid, in general they are
+ * silently adjusted to acceptable ranges.
  */
 
 /**
@@ -1064,7 +1081,7 @@ struct gpiod_request_config *gpiod_request_config_new(void);
 void gpiod_request_config_free(struct gpiod_request_config *config);
 
 /**
- * @brief Set the consumer string.
+ * @brief Set the consumer name for the request.
  * @param config Request config object.
  * @param consumer Consumer name.
  * @note If the consumer string is too long, it will be truncated to the max
@@ -1074,57 +1091,60 @@ void gpiod_request_config_set_consumer(struct gpiod_request_config *config,
 				       const char *consumer);
 
 /**
- * @brief Get the consumer string.
+ * @brief Get the consumer name configured in the request config.
  * @param config Request config object.
- * @return Current consumer string stored in this request config.
+ * @return Consumer name stored in the request config.
  */
 const char *
 gpiod_request_config_get_consumer(struct gpiod_request_config *config);
 
 /**
- * @brief Set line offsets for this request.
+ * @brief Set the offsets of the lines to be requested.
  * @param config Request config object.
- * @param num_offsets Number of offsets.
- * @param offsets Array of line offsets.
- * @note If too many offsets were specified, the offsets above the limit
+ * @param num_lines Number of lines, which specifies the size of the offsets
+ *	  array.
+ * @param offsets Array of offsets of the lines.
+ * @note If too many lines were specified, the offsets above the limit
  *       accepted by the kernel (64 lines) are silently dropped.
  */
 void gpiod_request_config_set_offsets(struct gpiod_request_config *config,
-				      size_t num_offsets,
+				      size_t num_lines,
 				      const unsigned int *offsets);
 
 /**
- * @brief Get the number of lines configured in this request config.
+ * @brief Get the number of lines configured in the request config.
  * @param config Request config object.
- * @return Number of lines to be requested by this config.
+ * @return Number of lines to be requested by the config.
  */
 size_t
 gpiod_request_config_get_num_lines(struct gpiod_request_config *config);
 
 /**
- * @brief Get the hardware offsets of lines in this request config.
+ * @brief Get the offsets of lines configured in the request config.
  * @param config Request config object.
- * @param offsets Array to store offsets. Must hold at least the number of
- *                lines returned by ::gpiod_request_config_get_num_offsets.
+ * @param offsets Array to store offsets. Must be sized to hold the number of
+ *		  lines returned by ::gpiod_request_config_get_num_lines.
  */
 void gpiod_request_config_get_offsets(struct gpiod_request_config *config,
-				      unsigned int *offsets);
+				    unsigned int *offsets);
 
 /**
- * @brief Set the size of the kernel event buffer.
+ * @brief Set the size of the kernel event buffer for the request.
  * @param config Request config object.
  * @param event_buffer_size New event buffer size.
  * @note The kernel may adjust the value if it's too high. If set to 0, the
  *       default value will be used.
+ * @note The kernel buffer is distinct from and independent of the user space
+ *	 buffer (::gpiod_edge_event_buffer_new).
  */
 void
 gpiod_request_config_set_event_buffer_size(struct gpiod_request_config *config,
 					   size_t event_buffer_size);
 
 /**
- * @brief Get the edge event buffer size from this request config.
+ * @brief Get the edge event buffer size for the request config.
  * @param config Request config object.
- * @return Current edge event buffer size setting.
+ * @return Edge event buffer size setting from the request config.
  */
 size_t
 gpiod_request_config_get_event_buffer_size(struct gpiod_request_config *config);
@@ -1135,7 +1155,7 @@ gpiod_request_config_get_event_buffer_size(struct gpiod_request_config *config);
  * @defgroup request_request Line request operations
  * @{
  *
- * Functions allowing interaction with a set of requested lines.
+ * Functions allowing interactions with requested lines.
  */
 
 /**
@@ -1145,37 +1165,39 @@ gpiod_request_config_get_event_buffer_size(struct gpiod_request_config *config);
 void gpiod_line_request_release(struct gpiod_line_request *request);
 
 /**
- * @brief Get the number of lines in this request.
+ * @brief Get the number of lines in the request.
  * @param request Line request object.
  * @return Number of requested lines.
  */
 size_t gpiod_line_request_get_num_lines(struct gpiod_line_request *request);
 
 /**
- * @brief Get the hardware offsets of lines in this request.
+ * @brief Get the offsets of the lines in the request.
  * @param request Line request object.
- * @param offsets Array to store offsets. Must hold at least the number of
- *                lines returned by ::gpiod_line_request_get_num_lines.
+ * @param offsets Array to store offsets. Must be sized to hold the number of
+ *		  lines returned by ::gpiod_line_request_get_num_lines.
  */
 void gpiod_line_request_get_offsets(struct gpiod_line_request *request,
 				    unsigned int *offsets);
 
 /**
- * @brief Read the value of a single line associated with this request.
+ * @brief Get the value of a single requested line.
  * @param request Line request object.
- * @param offset Offset of the line of which the value should be read.
+ * @param offset The offset of the line of which the value should be read.
  * @return Returns 1 or 0 on success and -1 on error.
  */
 int gpiod_line_request_get_value(struct gpiod_line_request *request,
 				 unsigned int offset);
 
 /**
- * @brief Read values of a subset of lines associated with this request.
+ * @brief Get the values of a subset of requested lines.
  * @param request GPIO line request.
  * @param num_lines Number of lines for which to read values.
- * @param offsets Array of offsets corresponding with the lines associated with
- *                this request for which to read values.
- * @param values Array in which the values will be stored.
+ * @param offsets Array of offsets identifying the subset of requested lines
+ *		  from which to read values.
+ * @param values Array in which the values will be stored.  Must be sized
+ *		 to hold \p num_lines entries.  Each value is associated with the
+ *		 line identified by the corresponding entry in \p offsets.
  * @return 0 on success, -1 on failure.
  */
 int gpiod_line_request_get_values_subset(struct gpiod_line_request *request,
@@ -1184,35 +1206,38 @@ int gpiod_line_request_get_values_subset(struct gpiod_line_request *request,
 					 int *values);
 
 /**
- * @brief Read values of all lines associated with this request.
+ * @brief Get the values of all requested lines.
  * @param request GPIO line request.
- * @param values Array in which the values will be stored. Must hold at least
- *               the number of lines returned by
- *               ::gpiod_line_request_get_num_lines. The index of each value
- *               will be associated with the offset at the same index in the
- *               offset array returned by ::gpiod_line_request_get_offsets.
+ * @param values Array in which the values will be stored. Must be sized to
+ *		 hold the number of lines returned by
+ *		 ::gpiod_line_request_get_num_lines.
+ *		 Each value is associated with the line identified by the
+ *		 corresponding entry in the offset array returned by
+ *		 ::gpiod_line_request_get_offsets.
  * @return 0 on success, -1 on failure.
  */
 int gpiod_line_request_get_values(struct gpiod_line_request *request,
 				  int *values);
 
 /**
- * @brief Set the value of a single line associated with this request.
+ * @brief Set the value of a single requested line.
  * @param request Line request object.
- * @param offset Offset of the line of which the value should be set.
+ * @param offset The offset of the line for which the value should be set.
  * @param value Value to set.
  */
 int gpiod_line_request_set_value(struct gpiod_line_request *request,
 				 unsigned int offset, int value);
 
 /**
- * @brief Set values of a subset of lines associated with this line request.
+ * @brief Set the values of a subset of requested lines.
  * @param request GPIO line request.
  * @param num_lines Number of lines for which to set values.
- * @param offsets Array of offsets corresponding with the lines associated with
- *                this request for which to set values.
- * @param values Array of values to set. The members of this array must
- *               correspond with the offsets in the previous argument.
+ * @param offsets Array of offsets, containing the number of entries specified
+ *		  by \p num_lines, identifying the requested lines for
+ *		  which to set values.
+ * @param values Array of values to set, containing the number of entries
+ *		 specified by \p num_lines.  Each value is associated with the
+ *		 line identified by the corresponding entry in \p offsets.
  * @return 0 on success, -1 on failure.
  */
 int gpiod_line_request_set_values_subset(struct gpiod_line_request *request,
@@ -1221,42 +1246,51 @@ int gpiod_line_request_set_values_subset(struct gpiod_line_request *request,
 					 const int *values);
 
 /**
- * @brief Set values of all lines associated with this request.
+ * @brief Set the values of all lines associated with a request.
  * @param request GPIO line request.
- * @param values Array containing the values to set. Must hold at least the
- *               number of lines returned by ::gpiod_line_request_get_num_lines.
- *               The index of each value be associated with the offset at the
- *               same index in the offset array returned by
- *               ::gpiod_line_request_get_offsets.
+ * @param values Array containing the values to set. Must be sized to
+ *		 contain the number of lines returned by
+ *		 ::gpiod_line_request_get_num_lines.
+ *		 Each value is associated with the line identified by the
+ *		 corresponding entry in the offset array returned by
+ *		 ::gpiod_line_request_get_offsets.
  */
 int gpiod_line_request_set_values(struct gpiod_line_request *request,
 				  const int *values);
 
 /**
- * @brief Update the configuration of lines associated with this line request.
+ * @brief Update the configuration of lines associated with a line request.
  * @param request GPIO line request.
  * @param config New line config to apply.
  * @return 0 on success, -1 on failure.
- * @note Line configuration overrides set for offsets that don't end up being
- *       requested are silently ignored.
+ * @note The new line configuration completely replaces the old.
+ * @note Any requested lines without overrides are configured to the requested
+ *	 defaults.
+ * @note Any configured overrides for lines that have not been requested
+ *	 are silently ignored.
  */
 int gpiod_line_request_reconfigure_lines(struct gpiod_line_request *request,
 					 struct gpiod_line_config *config);
 
 /**
- * @brief Get the file descriptor associated with this line request.
+ * @brief Get the file descriptor associated with a line request.
  * @param request GPIO line request.
- * @return Number of the file descriptor associated with this request. This
- *         function never fails.
+ * @return The file descriptor associated with the request.
+ *	   This function never fails.
+ *	   The returned file descriptor must not be closed by the caller.
+ *	   Call ::gpiod_line_request_release to close the file.
  */
 int gpiod_line_request_get_fd(struct gpiod_line_request *request);
 
 /**
- * @brief Wait for edge events on any of the lines associated with this request.
+ * @brief Wait for edge events on any of the requested lines.
  * @param request GPIO line request.
  * @param timeout_ns Wait time limit in nanoseconds.
  * @return 0 if wait timed out, -1 if an error occurred, 1 if an event is
- *         pending.
+ *	   pending.
+ *q
+ * Lines must have edge detection set for edge events to be emitted.
+ * By default edge detection is disabled.
  */
 int gpiod_line_request_wait_edge_event(struct gpiod_line_request *request,
 				       uint64_t timeout_ns);
@@ -1264,11 +1298,13 @@ int gpiod_line_request_wait_edge_event(struct gpiod_line_request *request,
 /**
  * @brief Read a number of edge events from a line request.
  * @param request GPIO line request.
- * @param buffer Edge event buffer.
+ * @param buffer Edge event buffer, sized to hold at least \p max_events.
  * @param max_events Maximum number of events to read.
  * @return On success returns the number of events read from the file
- *         descriptor, on failure return -1.
- * @note This function will block if no event was queued for this line.
+ *	   descriptor, on failure return -1.
+ * @note This function will block if no event was queued for the line request.
+ * @note Any exising events in the buffer are overwritten.  This is not an
+ *       append operation.
  */
 int gpiod_line_request_read_edge_event(struct gpiod_line_request *request,
 				       struct gpiod_edge_event_buffer *buffer,
@@ -1282,13 +1318,14 @@ int gpiod_line_request_read_edge_event(struct gpiod_line_request *request,
  *
  * Functions and data types for handling edge events.
  *
- * An edge event object contains information about a single line event. It
- * contains the event type, timestamp and the offset of the line on which the
- * event occurred as well as two seqential numbers (global for all lines
- * associated with the parent chip and local for this line only).
+ * An edge event object contains information about a single line edge event.
+ * It contains the event type, timestamp and the offset of the line on which
+ * the event occurred as well as two sequence numbers (global for all lines
+ * in the associated request and local for this line only).
  *
- * For performance and to limit the number of memory allocations when a lot of
- * events are being read, edge events are stored in an edge-event buffer object.
+ * Edge events are stored into an edge-event buffer object to improve
+ * performance and to limit the number of memory allocations when a large
+ * number of events are being read.
  */
 
 /**
@@ -1311,7 +1348,7 @@ void gpiod_edge_event_free(struct gpiod_edge_event *event);
  * @brief Copy the edge event object.
  * @param event Edge event to copy.
  * @return Copy of the edge event or NULL on error. The returned object must
- *         be freed by the caller using :gpiod_edge_event_free.
+ *	   be freed by the caller using ::gpiod_edge_event_free.
  */
 struct gpiod_edge_event *gpiod_edge_event_copy(struct gpiod_edge_event *event);
 
@@ -1319,7 +1356,7 @@ struct gpiod_edge_event *gpiod_edge_event_copy(struct gpiod_edge_event *event);
  * @brief Get the event type.
  * @param event GPIO edge event.
  * @return The event type (::GPIOD_EDGE_EVENT_RISING_EDGE or
- *         ::GPIOD_EDGE_EVENT_FALLING_EDGE).
+ *	   ::GPIOD_EDGE_EVENT_FALLING_EDGE).
  */
 int gpiod_edge_event_get_event_type(struct gpiod_edge_event *event);
 
@@ -1327,45 +1364,52 @@ int gpiod_edge_event_get_event_type(struct gpiod_edge_event *event);
  * @brief Get the timestamp of the event.
  * @param event GPIO edge event.
  * @return Timestamp in nanoseconds.
+ * @note The source clock for the timestamp depends on the event_clock
+ *	 setting for the line.
  */
 uint64_t gpiod_edge_event_get_timestamp(struct gpiod_edge_event *event);
 
 /**
- * @brief Get the hardware offset of the line on which the event was triggered.
+ * @brief Get the offset of the line which triggered the event.
  * @param event GPIO edge event.
  * @return Line offset.
  */
 unsigned int gpiod_edge_event_get_line_offset(struct gpiod_edge_event *event);
 
 /**
- * @brief Get the global sequence number of this event.
+ * @brief Get the global sequence number of the event.
  * @param event GPIO edge event.
- * @return Sequence number of the event relative to all lines in the associated
- *         line request.
+ * @return Sequence number of the event in the series of events for all lines
+ *	   in the associated line request.
  */
 unsigned long gpiod_edge_event_get_global_seqno(struct gpiod_edge_event *event);
 
 /**
- * @brief Get the event sequence number specific to concerned line.
+ * @brief Get the event sequence number specific to the line.
  * @param event GPIO edge event.
- * @return Sequence number of the event relative to this line within the
- *         lifetime of the associated line request.
+ * @return Sequence number of the event in the series of events only for this
+ *	   line within the lifetime of the associated line request.
  */
 unsigned long gpiod_edge_event_get_line_seqno(struct gpiod_edge_event *event);
 
 /**
  * @brief Create a new edge event buffer.
- * @param capacity Number of events this buffer can store (min = 1, max = 1024).
+ * @param capacity Number of events the buffer can store (min = 1, max = 1024).
  * @return New edge event buffer or NULL on error.
  * @note If capacity equals 0, it will be set to a default value of 64. If
- *       capacity is larger than 1024, it will be limited to 1024.
+ *	 capacity is larger than 1024, it will be limited to 1024.
+ * @note The user space buffer is independent of the kernel buffer
+ *	 (::gpiod_request_config_set_event_buffer_size).  As the user space
+ *	 buffer is filled from the kernel buffer, there is no benefit making
+ *	 the user space buffer larger than the kernel buffer.
+ *	 The default kernel buffer size for each request is 16*num_lines.
  */
 struct gpiod_edge_event_buffer *
 gpiod_edge_event_buffer_new(size_t capacity);
 
 /**
  * @brief Get the capacity (the max number of events that can be stored) of
- *        the event buffer.
+ *	  the event buffer.
  * @param buffer Edge event buffer.
  * @return The capacity of the buffer.
  */
@@ -1379,21 +1423,21 @@ gpiod_edge_event_buffer_get_capacity(struct gpiod_edge_event_buffer *buffer);
 void gpiod_edge_event_buffer_free(struct gpiod_edge_event_buffer *buffer);
 
 /**
- * @brief Get a pointer to an event stored in the buffer.
+ * @brief Get an event stored in the buffer.
  * @param buffer Edge event buffer.
  * @param index Index of the event in the buffer.
- * @return Pointer to an event stored in the buffer. The lifetime of this
- *         event is tied to the buffer object. Users must not free the event
- *         returned by this function.
+ * @return Pointer to an event stored in the buffer. The lifetime of the
+ *	   event is tied to the buffer object. Users must not free the event
+ *	   returned by this function.
  */
 struct gpiod_edge_event *
 gpiod_edge_event_buffer_get_event(struct gpiod_edge_event_buffer *buffer,
 				  unsigned long index);
 
 /**
- * @brief Get the number of events this buffers stores.
+ * @brief Get the number of events a buffer has stored.
  * @param buffer Edge event buffer.
- * @return Number of events stored in this buffer.
+ * @return Number of events stored in the buffer.
  */
 size_t
 gpiod_edge_event_buffer_get_num_events(struct gpiod_edge_event_buffer *buffer);
@@ -1410,8 +1454,8 @@ gpiod_edge_event_buffer_get_num_events(struct gpiod_edge_event_buffer *buffer);
 /**
  * @brief Check if the file pointed to by path is a GPIO chip character device.
  * @param path Path to check.
- * @return True if the file exists and is a GPIO chip character device or a
- *         symbolic link to it.
+ * @return True if the file exists and is either a GPIO chip character device
+ *	   or a symbolic link to one.
  */
 bool gpiod_is_gpiochip_device(const char *path);
 
-- 
2.35.1

