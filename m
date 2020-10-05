Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BEBF28308F
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Oct 2020 09:04:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725940AbgJEHEF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Oct 2020 03:04:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725870AbgJEHEF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Oct 2020 03:04:05 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF0A0C0613CE;
        Mon,  5 Oct 2020 00:04:03 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id g29so5421503pgl.2;
        Mon, 05 Oct 2020 00:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PQGTlJUFworxK3zjl/47Yk1dMPQiOEByLqsfnesnAPE=;
        b=JJVSAvOzNTuYbfSrbRi1x7jovZSl60GM6sU2GyNZm65Gmaskp/eRwkCkogsZcqKZDH
         Bm2o9AH2exqYwOuLvIRqLYRPLPSTpkcZS/OSDHmTOATSKu3qv3M89OC1JZ4YCaNXLzSe
         9Wd554ZW3kGXfdHuVfeA/GpNq97MoIY25x4HBvk2n7JmsD0//x0TUWhn/HtqBS9s6HDi
         ThoiFVC/nnkpSqlhRuXo33Ud7v40IZpbPczMPCL1FuNCKvf6xHISHyaYTrOKm9lqL6Z/
         38KW4JckZ9rLsPAGtYwj7geI/alzbc7G/Bna2aYFIEt0k7HVkVfBYiyKRw7W851s/9dR
         jQVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PQGTlJUFworxK3zjl/47Yk1dMPQiOEByLqsfnesnAPE=;
        b=D4mByXkzAueZ3b9rUi2KjapZHkcZTevvGS6o/IUigZkszfpDXn9aQp7ME+2MEStayl
         TmjDwu4wBuou7lhckrMwccQ3rLX21L8d39HdiVsOLk/4jSzwmzg2c4SZAGOt/Hd+87VQ
         nxZ3eM/ONQdma+duJ9Cp/oHLbz0H/pMM+oFCbG6qO51SD91cJ8+zf5DRxdwqDtIQHGbk
         7mTZWihilv4aLUXMfA/7aGVfNb0xnzlUZGQSzWH9aBKckvmhg8YIZIeg5rbTr4pktjSR
         39WbQd3E3qJEkopb4WmtEaEjzA5vR6yETsdcqq6HObUoS+s3wofLxKPPsV0DWpDA8cJX
         Gukw==
X-Gm-Message-State: AOAM533OT96EwrDEVXIKrGIAXTKNNvt1WcLq+relO323PcKk57Ajx3po
        SY8CIvIu08I61I13fKxDcuZgUQBAMGl6Xw==
X-Google-Smtp-Source: ABdhPJyjr9oZnyhJlgZA08cGBTQ4MReveQqWZaD3czfkb5n/Pqdm0FpSzoRolW/KrGVSq4drib96ZQ==
X-Received: by 2002:aa7:8e9a:0:b029:13e:d13d:a050 with SMTP id a26-20020aa78e9a0000b029013ed13da050mr15876397pfr.22.1601881442661;
        Mon, 05 Oct 2020 00:04:02 -0700 (PDT)
Received: from sol.lan (106-69-166-86.dyn.iinet.net.au. [106.69.166.86])
        by smtp.gmail.com with ESMTPSA id 78sm6868764pfz.211.2020.10.05.00.03.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2020 00:04:02 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH 3/5] gpio: uapi: kernel-doc formatting improvements
Date:   Mon,  5 Oct 2020 15:03:27 +0800
Message-Id: <20201005070329.21055-4-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201005070329.21055-1-warthog618@gmail.com>
References: <20201005070329.21055-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add kernel-doc formatting to all references to structs, enums, fields
and constants, and move deprecation warnings into the Note section of
the deprecated struct.

Replace 'OR:ed' with 'added', as the former looks odd.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---

The replacement of 'OR:ed' should strictly be in a separate patch, as 
it isn't a formatting change, but as the same lines containing them were
being changed anyway it feels like overkill?

 include/uapi/linux/gpio.h | 93 ++++++++++++++++++++-------------------
 1 file changed, 47 insertions(+), 46 deletions(-)

diff --git a/include/uapi/linux/gpio.h b/include/uapi/linux/gpio.h
index 1fdb0e851f83..32dd18f238c3 100644
--- a/include/uapi/linux/gpio.h
+++ b/include/uapi/linux/gpio.h
@@ -110,17 +110,17 @@ enum gpio_v2_line_attr_id {
  * struct gpio_v2_line_attribute - a configurable attribute of a line
  * @id: attribute identifier with value from &enum gpio_v2_line_attr_id
  * @padding: reserved for future use and must be zero filled
- * @flags: if id is GPIO_V2_LINE_ATTR_ID_FLAGS, the flags for the GPIO
- * line, with values from enum gpio_v2_line_flag, such as
- * GPIO_V2_LINE_FLAG_ACTIVE_LOW, GPIO_V2_LINE_FLAG_OUTPUT etc, OR:ed
+ * @flags: if id is %GPIO_V2_LINE_ATTR_ID_FLAGS, the flags for the GPIO
+ * line, with values from &enum gpio_v2_line_flag, such as
+ * %GPIO_V2_LINE_FLAG_ACTIVE_LOW, %GPIO_V2_LINE_FLAG_OUTPUT etc, added
  * together.  This overrides the default flags contained in the &struct
  * gpio_v2_line_config for the associated line.
- * @values: if id is GPIO_V2_LINE_ATTR_ID_OUTPUT_VALUES, a bitmap
+ * @values: if id is %GPIO_V2_LINE_ATTR_ID_OUTPUT_VALUES, a bitmap
  * containing the values to which the lines will be set, with each bit
  * number corresponding to the index into &struct
  * gpio_v2_line_request.offsets.
- * @debounce_period_us: if id is GPIO_V2_LINE_ATTR_ID_DEBOUNCE, the desired
- * debounce period, in microseconds
+ * @debounce_period_us: if id is %GPIO_V2_LINE_ATTR_ID_DEBOUNCE, the
+ * desired debounce period, in microseconds
  */
 struct gpio_v2_line_attribute {
 	__u32 id;
@@ -147,12 +147,12 @@ struct gpio_v2_line_config_attribute {
 
 /**
  * struct gpio_v2_line_config - Configuration for GPIO lines
- * @flags: flags for the GPIO lines, with values from enum
- * gpio_v2_line_flag, such as GPIO_V2_LINE_FLAG_ACTIVE_LOW,
- * GPIO_V2_LINE_FLAG_OUTPUT etc, OR:ed together.  This is the default for
+ * @flags: flags for the GPIO lines, with values from &enum
+ * gpio_v2_line_flag, such as %GPIO_V2_LINE_FLAG_ACTIVE_LOW,
+ * %GPIO_V2_LINE_FLAG_OUTPUT etc, added together.  This is the default for
  * all requested lines but may be overridden for particular lines using
- * attrs.
- * @num_attrs: the number of attributes in attrs
+ * @attrs.
+ * @num_attrs: the number of attributes in @attrs
  * @padding: reserved for future use and must be zero filled
  * @attrs: the configuration attributes associated with the requested
  * lines.  Any attribute should only be associated with a particular line
@@ -175,17 +175,17 @@ struct gpio_v2_line_config {
  * "my-bitbanged-relay"
  * @config: requested configuration for the lines.
  * @num_lines: number of lines requested in this request, i.e. the number
- * of valid fields in the GPIO_V2_LINES_MAX sized arrays, set to 1 to
+ * of valid fields in the %GPIO_V2_LINES_MAX sized arrays, set to 1 to
  * request a single line
  * @event_buffer_size: a suggested minimum number of line events that the
  * kernel should buffer.  This is only relevant if edge detection is
  * enabled in the configuration. Note that this is only a suggested value
  * and the kernel may allocate a larger buffer or cap the size of the
  * buffer. If this field is zero then the buffer size defaults to a minimum
- * of num_lines*16.
+ * of @num_lines * 16.
  * @padding: reserved for future use and must be zero filled
  * @fd: if successful this field will contain a valid anonymous file handle
- * after a GPIO_GET_LINE_IOCTL operation, zero or negative value means
+ * after a %GPIO_GET_LINE_IOCTL operation, zero or negative value means
  * error
  */
 struct gpio_v2_line_request {
@@ -207,11 +207,12 @@ struct gpio_v2_line_request {
  * @consumer: a functional name for the consumer of this GPIO line as set
  * by whatever is using it, will be empty if there is no current user but
  * may also be empty if the consumer doesn't set this up
- * @flags: flags for the GPIO line, such as GPIO_V2_LINE_FLAG_ACTIVE_LOW,
- * GPIO_V2_LINE_FLAG_OUTPUT etc, OR:ed together
  * @offset: the local offset on this GPIO chip, fill this in when
  * requesting the line information from the kernel
- * @num_attrs: the number of attributes in attrs
+ * @num_attrs: the number of attributes in @attrs
+ * @flags: flags for the GPIO lines, with values from &enum
+ * gpio_v2_line_flag, such as %GPIO_V2_LINE_FLAG_ACTIVE_LOW,
+ * %GPIO_V2_LINE_FLAG_OUTPUT etc, added together.
  * @attrs: the configuration attributes associated with the line
  * @padding: reserved for future use
  */
@@ -244,7 +245,7 @@ enum gpio_v2_line_changed_type {
  * of a GPIO line
  * @info: updated line information
  * @timestamp_ns: estimate of time of status change occurrence, in nanoseconds
- * @event_type: the type of change with a value from enum
+ * @event_type: the type of change with a value from &enum
  * gpio_v2_line_changed_type
  * @padding: reserved for future use
  */
@@ -269,10 +270,10 @@ enum gpio_v2_line_event_id {
 /**
  * struct gpio_v2_line_event - The actual event being pushed to userspace
  * @timestamp_ns: best estimate of time of event occurrence, in nanoseconds.
- * The timestamp_ns is read from CLOCK_MONOTONIC and is intended to allow the
- * accurate measurement of the time between events.  It does not provide
+ * The @timestamp_ns is read from %CLOCK_MONOTONIC and is intended to allow
+ * the accurate measurement of the time between events. It does not provide
  * the wall-clock time.
- * @id: event identifier with value from enum gpio_v2_line_event_id
+ * @id: event identifier with value from &enum gpio_v2_line_event_id
  * @offset: the offset of the line that triggered the event
  * @seqno: the sequence number for this event in the sequence of events for
  * all the lines in this line request
@@ -319,8 +320,8 @@ struct gpio_v2_line_event {
  * whatever is using it, will be empty if there is no current user but may
  * also be empty if the consumer doesn't set this up
  *
- * This struct is part of ABI v1 and is deprecated.
- * Use struct gpio_v2_line_info instead.
+ * Note: This struct is part of ABI v1 and is deprecated.
+ * Use &struct gpio_v2_line_info instead.
  */
 struct gpioline_info {
 	__u32 line_offset;
@@ -344,18 +345,18 @@ enum {
  * of a GPIO line
  * @info: updated line information
  * @timestamp: estimate of time of status change occurrence, in nanoseconds
- * @event_type: one of GPIOLINE_CHANGED_REQUESTED, GPIOLINE_CHANGED_RELEASED
- * and GPIOLINE_CHANGED_CONFIG
+ * @event_type: one of %GPIOLINE_CHANGED_REQUESTED,
+ * %GPIOLINE_CHANGED_RELEASED and %GPIOLINE_CHANGED_CONFIG
  * @padding: reserved for future use
  *
- * Note: struct gpioline_info embedded here has 32-bit alignment on its own,
+ * The &struct gpioline_info embedded here has 32-bit alignment on its own,
  * but it works fine with 64-bit alignment too. With its 72 byte size, we can
  * guarantee there are no implicit holes between it and subsequent members.
  * The 20-byte padding at the end makes sure we don't add any implicit padding
  * at the end of the structure on 64-bit architectures.
  *
- * This struct is part of ABI v1 and is deprecated.
- * Use struct gpio_v2_line_info_changed instead.
+ * Note: This struct is part of ABI v1 and is deprecated.
+ * Use &struct gpio_v2_line_info_changed instead.
  */
 struct gpioline_info_changed {
 	struct gpioline_info info;
@@ -379,13 +380,13 @@ struct gpioline_info_changed {
  * @lineoffsets: an array of desired lines, specified by offset index for the
  * associated GPIO device
  * @flags: desired flags for the desired GPIO lines, such as
- * GPIOHANDLE_REQUEST_OUTPUT, GPIOHANDLE_REQUEST_ACTIVE_LOW etc, OR:ed
+ * %GPIOHANDLE_REQUEST_OUTPUT, %GPIOHANDLE_REQUEST_ACTIVE_LOW etc, added
  * together. Note that even if multiple lines are requested, the same flags
  * must be applicable to all of them, if you want lines with individual
  * flags set, request them one by one. It is possible to select
  * a batch of input or output lines, but they must all have the same
  * characteristics, i.e. all inputs or all outputs, all active low etc
- * @default_values: if the GPIOHANDLE_REQUEST_OUTPUT is set for a requested
+ * @default_values: if the %GPIOHANDLE_REQUEST_OUTPUT is set for a requested
  * line, this specifies the default output value, should be 0 (low) or
  * 1 (high), anything else than 0 or 1 will be interpreted as 1 (high)
  * @consumer_label: a desired consumer label for the selected GPIO line(s)
@@ -393,11 +394,11 @@ struct gpioline_info_changed {
  * @lines: number of lines requested in this request, i.e. the number of
  * valid fields in the above arrays, set to 1 to request a single line
  * @fd: if successful this field will contain a valid anonymous file handle
- * after a GPIO_GET_LINEHANDLE_IOCTL operation, zero or negative value
+ * after a %GPIO_GET_LINEHANDLE_IOCTL operation, zero or negative value
  * means error
  *
- * This struct is part of ABI v1 and is deprecated.
- * Use struct gpio_v2_line_request instead.
+ * Note: This struct is part of ABI v1 and is deprecated.
+ * Use &struct gpio_v2_line_request instead.
  */
 struct gpiohandle_request {
 	__u32 lineoffsets[GPIOHANDLES_MAX];
@@ -411,15 +412,15 @@ struct gpiohandle_request {
 /**
  * struct gpiohandle_config - Configuration for a GPIO handle request
  * @flags: updated flags for the requested GPIO lines, such as
- * GPIOHANDLE_REQUEST_OUTPUT, GPIOHANDLE_REQUEST_ACTIVE_LOW etc, OR:ed
+ * %GPIOHANDLE_REQUEST_OUTPUT, %GPIOHANDLE_REQUEST_ACTIVE_LOW etc, added
  * together
- * @default_values: if the GPIOHANDLE_REQUEST_OUTPUT is set in flags,
+ * @default_values: if the %GPIOHANDLE_REQUEST_OUTPUT is set in flags,
  * this specifies the default output value, should be 0 (low) or
  * 1 (high), anything else than 0 or 1 will be interpreted as 1 (high)
  * @padding: reserved for future use and should be zero filled
  *
- * This struct is part of ABI v1 and is deprecated.
- * Use struct gpio_v2_line_config instead.
+ * Note: This struct is part of ABI v1 and is deprecated.
+ * Use &struct gpio_v2_line_config instead.
  */
 struct gpiohandle_config {
 	__u32 flags;
@@ -433,8 +434,8 @@ struct gpiohandle_config {
  * state of a line, when setting the state of lines these should contain
  * the desired target state
  *
- * This struct is part of ABI v1 and is deprecated.
- * Use struct gpio_v2_line_values instead.
+ * Note: This struct is part of ABI v1 and is deprecated.
+ * Use &struct gpio_v2_line_values instead.
  */
 struct gpiohandle_data {
 	__u8 values[GPIOHANDLES_MAX];
@@ -450,17 +451,17 @@ struct gpiohandle_data {
  * @lineoffset: the desired line to subscribe to events from, specified by
  * offset index for the associated GPIO device
  * @handleflags: desired handle flags for the desired GPIO line, such as
- * GPIOHANDLE_REQUEST_ACTIVE_LOW or GPIOHANDLE_REQUEST_OPEN_DRAIN
+ * %GPIOHANDLE_REQUEST_ACTIVE_LOW or %GPIOHANDLE_REQUEST_OPEN_DRAIN
  * @eventflags: desired flags for the desired GPIO event line, such as
- * GPIOEVENT_REQUEST_RISING_EDGE or GPIOEVENT_REQUEST_FALLING_EDGE
+ * %GPIOEVENT_REQUEST_RISING_EDGE or %GPIOEVENT_REQUEST_FALLING_EDGE
  * @consumer_label: a desired consumer label for the selected GPIO line(s)
  * such as "my-listener"
  * @fd: if successful this field will contain a valid anonymous file handle
- * after a GPIO_GET_LINEEVENT_IOCTL operation, zero or negative value
+ * after a %GPIO_GET_LINEEVENT_IOCTL operation, zero or negative value
  * means error
  *
- * This struct is part of ABI v1 and is deprecated.
- * Use struct gpio_v2_line_request instead.
+ * Note: This struct is part of ABI v1 and is deprecated.
+ * Use &struct gpio_v2_line_request instead.
  */
 struct gpioevent_request {
 	__u32 lineoffset;
@@ -481,8 +482,8 @@ struct gpioevent_request {
  * @timestamp: best estimate of time of event occurrence, in nanoseconds
  * @id: event identifier
  *
- * This struct is part of ABI v1 and is deprecated.
- * Use struct gpio_v2_line_event instead.
+ * Note: This struct is part of ABI v1 and is deprecated.
+ * Use &struct gpio_v2_line_event instead.
  */
 struct gpioevent_data {
 	__u64 timestamp;
-- 
2.28.0

