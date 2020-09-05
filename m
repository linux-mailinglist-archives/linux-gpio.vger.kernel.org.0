Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 568E525E81B
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Sep 2020 15:49:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728680AbgIENs7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 5 Sep 2020 09:48:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728622AbgIENh1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 5 Sep 2020 09:37:27 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC279C06124F;
        Sat,  5 Sep 2020 06:37:09 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id o68so6169967pfg.2;
        Sat, 05 Sep 2020 06:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1rVwlHjHNekh14PBFJ9edGeazCsM5cgIewowY8Usnac=;
        b=i4OpYVpgNWoIigVwgQ1biS7dWwErDmwDLUrNk33irVY0xCzGD69cVXljNIrdSgKpbc
         9a6e3Sp0zKxOkq4son4bjAh2qPn0HR6XwOPOGQXuyWqfYPbW7JvDzZ1vCOeprKn2ar3E
         BCz6SkArenZaPj8Iw29dGxn+XxIUXDozkLOkOuDjRGQlzqLNBWi1ECQCPH1RRBA0i/rL
         WWgnG6Vs1jcT8EoL+drsz8d0UIcFAfv4Vv5yCSAHgBTtXMe8PKawab5y02Nrwfm+W32R
         hUAXLMN9VwDHVoDCWJiKCYZUEZiAe7iXIn9JLWgSu/UGdMlDOk5VHNk21dD6xUbeTSGR
         MgUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1rVwlHjHNekh14PBFJ9edGeazCsM5cgIewowY8Usnac=;
        b=pqT7YoEq2DJ0AJ0LflCBDMBHyCGJdjwhvR9MmFhctpzZ+1CT5zZ0jg+WVSY+s/kUcf
         +k7q177QG2AFlbABONWr1d9Z5d1haC9VV+maQEll8wsIicc4qqqV+60mC2NwnBj4nzrY
         8IwdV13tjM3seuIVb+fjhCTuw6+f3EIAKD5R1whwh+IWkN2IFmpdWw4BcKKeQmBPEvpF
         YSXJ1zTiMjPfylee/BIcG6af+EB5NRJRTr6UhFE/RvKJfxHrXVVqzgp35PVr2MDQISOZ
         2o0dYiITQvbHckduP8nTbXgkIjVqLd5JLzO0tD1uIMicpPRq5orKTdG8RRCm30oiLHlm
         E53A==
X-Gm-Message-State: AOAM532FXP3j3EtSSbLoKwZ7C/C737bDW0uR5X72ro8Y0/Ja9L118DQL
        0+VG3YTiE5FNMZaVMc9lVLbaKQHgWV0=
X-Google-Smtp-Source: ABdhPJz+KBGEz/Acz14vJiIfsMePNPzcJ8OniFrHicLGvBjuBSWhqrZtWek00wAou/9iYefgIyietw==
X-Received: by 2002:a63:757:: with SMTP id 84mr10736099pgh.377.1599313024532;
        Sat, 05 Sep 2020 06:37:04 -0700 (PDT)
Received: from sol.lan (106-69-184-100.dyn.iinet.net.au. [106.69.184.100])
        by smtp.gmail.com with ESMTPSA id u3sm7556717pjn.29.2020.09.05.06.37.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2020 06:37:03 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v7 04/20] gpio: uapi: define uAPI v2
Date:   Sat,  5 Sep 2020 21:35:33 +0800
Message-Id: <20200905133549.24606-5-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200905133549.24606-1-warthog618@gmail.com>
References: <20200905133549.24606-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add a new version of the uAPI to address existing 32/64-bit alignment
issues, add support for debounce and event sequence numbers, allow
requested lines with different configurations, and provide some future
proofing by adding padding reserved for future use.

The alignment issue relates to the gpioevent_data, which packs to different
sizes on 32-bit and 64-bit platforms. That creates problems for 32-bit apps
running on 64-bit kernels.  uAPI v2 addresses that particular issue, and
the problem more generally, by adding pad fields that explicitly pad
structs out to 64-bit boundaries, so they will pack to the same size now,
and even if some of the reserved padding is used for __u64 fields in the
future.

The new structs have been analysed with pahole to ensure that they
are sized as expected and contain no implicit padding.

The lack of future proofing in v1 makes it impossible to, for example,
add the debounce feature that is included in v2.
The future proofing is addressed by providing configurable attributes in
line config and reserved padding in all structs for future features.
Specifically, the line request, config, info, info_changed and event
structs receive updated versions and new ioctls.

As the majority of the structs and ioctls were being replaced, it is
opportune to rework some of the other aspects of the uAPI:

v1 has three different flags fields, each with their own separate
bit definitions.  In v2 that is collapsed to one - gpio_v2_line_flag.

The handle and event requests are merged into a single request, the line
request, as the two requests were mostly the same other than the edge
detection provided by event requests.  As a byproduct, the v2 uAPI allows
for multiple lines producing edge events on the same line handle.
This is a new capability as v1 only supports a single line in an event
request.

As a consequence, there are now only two types of file handle to be
concerned with, the chip and the line, and it is clearer which ioctls
apply to which type of handle.

There is also some minor renaming of fields for consistency compared to
their v1 counterparts, e.g. offset rather than lineoffset or line_offset,
and consumer rather than consumer_label.

Additionally, v1 GPIOHANDLES_MAX becomes GPIO_V2_LINES_MAX in v2 for
clarity, and the gpiohandle_data __u8 array becomes a bitmap in
gpio_v2_line_values.

The v2 uAPI is mostly a reorganisation and extension of v1, so userspace
code, particularly libgpiod, should readily port to it.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---

Changes for v7:
 - use _BITULL for flag constants

Changes for v4:
 - clarify bitmap width in GPIO_V2_LINES_MAX description

Changes for v3:
 - relocated commentary into commit description
 - hard limit max requested lines to 64 so bitmaps always fit in a single
   u64.
 - prefix all v2 symbols with GPIO_V2
 - 64-bit flag values to ULL
 - use __aligned_u64 to ensure 64-bit fields are 64-bit aligned
 - support masked get values, as per set values.

Changes for v2:
 - lower case V1 and V2, except in capitalized names
 - hyphenate 32/64-bit
 - rename bitmap field to bits
 - drop PAD_SIZE consts in favour of hard coded numbers
 - sort includes
 - change config flags to __u64
 - increase padding of gpioline_event
 - relocate GPIOLINE_CHANGED enum into v2 section (is common with v1)
 - rework config to collapse direction, drive, bias and edge enums back
   into flags and add optional attributes that can be associated with a
   subset of the requested lines.

Changes for v1 (since the RFC):
 - document the constraints on array sizes to maintain 32/64 alignment
 - add sequence numbers to gpioline_event
 - use bitmap for values instead of array of __u8
 - gpioline_info_v2 contains gpioline_config instead of its composite fields
 - provide constants for all array sizes, especially padding
 - renamed "GPIOLINE_FLAG_V2_KERNEL" to "GPIOLINE_FLAG_V2_USED"
 - renamed "default_values" to "values"
 - made gpioline_direction zero based
 - document clock used in gpioline_event timestamp
 - add event_buffer_size to gpioline_request
 - rename debounce to debounce_period
 - rename lines to num_lines

 include/uapi/linux/gpio.h | 274 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 267 insertions(+), 7 deletions(-)

diff --git a/include/uapi/linux/gpio.h b/include/uapi/linux/gpio.h
index 285cc10355b2..87074886e73d 100644
--- a/include/uapi/linux/gpio.h
+++ b/include/uapi/linux/gpio.h
@@ -11,11 +11,14 @@
 #ifndef _UAPI_GPIO_H_
 #define _UAPI_GPIO_H_
 
+#include <linux/const.h>
 #include <linux/ioctl.h>
 #include <linux/types.h>
 
 /*
  * The maximum size of name and label arrays.
+ *
+ * Must be a multiple of 8 to ensure 32/64-bit alignment of structs.
  */
 #define GPIO_MAX_NAME_SIZE 32
 
@@ -32,6 +35,248 @@ struct gpiochip_info {
 	__u32 lines;
 };
 
+/*
+ * Maximum number of requested lines.
+ *
+ * Must be no greater than 64, as bitmaps are restricted here to 64-bits
+ * for simplicity, and a multiple of 2 to ensure 32/64-bit alignment of
+ * structs.
+ */
+#define GPIO_V2_LINES_MAX 64
+
+/*
+ * The maximum number of configuration attributes associated with a line
+ * request.
+ */
+#define GPIO_V2_LINE_NUM_ATTRS_MAX 10
+
+/**
+ * enum gpio_v2_line_flag - &struct gpio_v2_line_attribute.flags values
+ */
+enum gpio_v2_line_flag {
+	GPIO_V2_LINE_FLAG_USED			= _BITULL(0), /* line not available for request */
+	GPIO_V2_LINE_FLAG_ACTIVE_LOW		= _BITULL(1),
+	GPIO_V2_LINE_FLAG_INPUT			= _BITULL(2),
+	GPIO_V2_LINE_FLAG_OUTPUT		= _BITULL(3),
+	GPIO_V2_LINE_FLAG_EDGE_RISING		= _BITULL(4),
+	GPIO_V2_LINE_FLAG_EDGE_FALLING		= _BITULL(5),
+	GPIO_V2_LINE_FLAG_OPEN_DRAIN		= _BITULL(6),
+	GPIO_V2_LINE_FLAG_OPEN_SOURCE		= _BITULL(7),
+	GPIO_V2_LINE_FLAG_BIAS_PULL_UP		= _BITULL(8),
+	GPIO_V2_LINE_FLAG_BIAS_PULL_DOWN	= _BITULL(9),
+	GPIO_V2_LINE_FLAG_BIAS_DISABLED		= _BITULL(10),
+};
+
+/**
+ * struct gpio_v2_line_values - Values of GPIO lines
+ * @mask: a bitmap identifying the lines to get or set, with each bit
+ * number corresponding to the index into &struct
+ * gpio_v2_line_request.offsets.
+ * @bits: a bitmap containing the value of the lines, set to 1 for active
+ * and 0 for inactive.  Note that this is the logical value, which will be
+ * the opposite of the physical value if the line is configured as active
+ * low.
+ */
+struct gpio_v2_line_values {
+	__aligned_u64 mask;
+	__aligned_u64 bits;
+};
+
+/**
+ * enum gpio_v2_line_attr_id - &struct gpio_v2_line_attribute.id values
+ */
+enum gpio_v2_line_attr_id {
+	GPIO_V2_LINE_ATTR_ID_FLAGS		= 1,
+	GPIO_V2_LINE_ATTR_ID_OUTPUT_VALUES	= 2,
+	GPIO_V2_LINE_ATTR_ID_DEBOUNCE		= 3,
+};
+
+/**
+ * struct gpio_v2_line_attribute - a configurable attribute of a line
+ * @id: attribute identifier with value from &enum gpio_v2_line_attr_id
+ * @padding: reserved for future use and must be zero filled
+ * @flags: if id is GPIO_V2_LINE_ATTR_ID_FLAGS, the flags for the GPIO
+ * line, with values from enum gpio_v2_line_flag, such as
+ * GPIO_V2_LINE_FLAG_ACTIVE_LOW, GPIO_V2_LINE_FLAG_OUTPUT etc, OR:ed
+ * together.  This overrides the default flags contained in the &struct
+ * gpio_v2_line_config for the associated line.
+ * @values: if id is GPIO_V2_LINE_ATTR_ID_OUTPUT_VALUES, a bitmap
+ * containing the values to which the lines will be set, with each bit
+ * number corresponding to the index into &struct
+ * gpio_v2_line_request.offsets.
+ * @debounce_period: if id is GPIO_V2_LINE_ATTR_ID_DEBOUNCE, the desired
+ * debounce period, in microseconds
+ */
+struct gpio_v2_line_attribute {
+	__u32 id;
+	__u32 padding;
+	union {
+		__aligned_u64 flags;
+		__aligned_u64 values;
+		__u32 debounce_period;
+	};
+};
+
+/**
+ * struct gpio_v2_line_config_attribute - a configuration attribute
+ * associated with one or more of the requested lines.
+ * @mask: a bitmap identifying the lines to which the attribute applies,
+ * with each bit number corresponding to the index into &struct
+ * gpio_v2_line_request.offsets.
+ * @attr: the configurable attribute
+ */
+struct gpio_v2_line_config_attribute {
+	__aligned_u64 mask;
+	struct gpio_v2_line_attribute attr;
+};
+
+/**
+ * struct gpio_v2_line_config - Configuration for GPIO lines
+ * @flags: flags for the GPIO lines, with values from enum
+ * gpio_v2_line_flag, such as GPIO_V2_LINE_FLAG_ACTIVE_LOW,
+ * GPIO_V2_LINE_FLAG_OUTPUT etc, OR:ed together.  This is the default for
+ * all requested lines but may be overridden for particular lines using
+ * attrs.
+ * @num_attrs: the number of attributes in attrs
+ * @padding: reserved for future use and must be zero filled
+ * @attrs: the configuration attributes associated with the requested
+ * lines.  Any attribute should only be associated with a particular line
+ * once.  If an attribute is associated with a line multiple times then the
+ * first occurrence (i.e. lowest index) has precedence.
+ */
+struct gpio_v2_line_config {
+	__aligned_u64 flags;
+	__u32 num_attrs;
+	/*
+	 * Pad to fill implicit padding and provide space for future use.
+	 */
+	__u32 padding[5];
+	struct gpio_v2_line_config_attribute attrs[GPIO_V2_LINE_NUM_ATTRS_MAX];
+};
+
+/**
+ * struct gpio_v2_line_request - Information about a request for GPIO lines
+ * @offsets: an array of desired lines, specified by offset index for the
+ * associated GPIO device
+ * @consumer: a desired consumer label for the selected GPIO lines such as
+ * "my-bitbanged-relay"
+ * @config: requested configuration for the lines.
+ * @num_lines: number of lines requested in this request, i.e. the number
+ * of valid fields in the GPIO_V2_LINES_MAX sized arrays, set to 1 to
+ * request a single line
+ * @event_buffer_size: a suggested minimum number of line events that the
+ * kernel should buffer.  This is only relevant if edge detection is
+ * enabled in the configuration. Note that this is only a suggested value
+ * and the kernel may allocate a larger buffer or cap the size of the
+ * buffer. If this field is zero then the buffer size defaults to a minimum
+ * of num_lines*16.
+ * @padding: reserved for future use and must be zero filled
+ * @fd: if successful this field will contain a valid anonymous file handle
+ * after a GPIO_GET_LINE_IOCTL operation, zero or negative value means
+ * error
+ */
+struct gpio_v2_line_request {
+	__u32 offsets[GPIO_V2_LINES_MAX];
+	char consumer[GPIO_MAX_NAME_SIZE];
+	struct gpio_v2_line_config config;
+	__u32 num_lines;
+	__u32 event_buffer_size;
+	/*
+	 * Pad struct to 64-bit boundary and provide space for future use.
+	 */
+	__u32 padding[5];
+	__s32 fd;
+};
+
+/**
+ * struct gpio_v2_line_info - Information about a certain GPIO line
+ * @name: the name of this GPIO line, such as the output pin of the line on
+ * the chip, a rail or a pin header name on a board, as specified by the
+ * gpio chip, may be empty
+ * @consumer: a functional name for the consumer of this GPIO line as set
+ * by whatever is using it, will be empty if there is no current user but
+ * may also be empty if the consumer doesn't set this up
+ * @flags: flags for the GPIO line, such as GPIO_V2_LINE_FLAG_ACTIVE_LOW,
+ * GPIO_V2_LINE_FLAG_OUTPUT etc, OR:ed together
+ * @offset: the local offset on this GPIO device, fill this in when
+ * requesting the line information from the kernel
+ * @num_attrs: the number of attributes in attrs
+ * @attrs: the configuration attributes associated with the line.
+ * @padding: reserved for future use
+ */
+struct gpio_v2_line_info {
+	char name[GPIO_MAX_NAME_SIZE];
+	char consumer[GPIO_MAX_NAME_SIZE];
+	__u32 offset;
+	__u32 num_attrs;
+	__aligned_u64 flags;
+	struct gpio_v2_line_attribute attrs[GPIO_V2_LINE_NUM_ATTRS_MAX];
+	/*
+	 * Pad struct to 64-bit boundary and provide space for future use.
+	 */
+	__u32 padding[4];
+};
+
+enum gpio_v2_line_changed_type {
+	GPIO_V2_LINE_CHANGED_REQUESTED	= 1,
+	GPIO_V2_LINE_CHANGED_RELEASED	= 2,
+	GPIO_V2_LINE_CHANGED_CONFIG	= 3,
+};
+
+/**
+ * struct gpio_v2_line_info_changed - Information about a change in status
+ * of a GPIO line
+ * @info: updated line information
+ * @timestamp: estimate of time of status change occurrence, in nanoseconds
+ * @event_type: the type of change with a value from enum
+ * gpio_v2_line_changed_type
+ * @padding: reserved for future use
+ */
+struct gpio_v2_line_info_changed {
+	struct gpio_v2_line_info info;
+	__aligned_u64 timestamp;
+	__u32 event_type;
+	/*
+	 * Pad struct to 64-bit boundary and provide space for future use.
+	 */
+	__u32 padding[5];
+};
+
+enum gpio_v2_line_event_id {
+	GPIO_V2_LINE_EVENT_RISING_EDGE	= 1,
+	GPIO_V2_LINE_EVENT_FALLING_EDGE	= 2,
+};
+
+/**
+ * struct gpio_v2_line_event - The actual event being pushed to userspace
+ * @timestamp: best estimate of time of event occurrence, in nanoseconds.
+ * The timestamp is read from CLOCK_MONOTONIC and is intended to allow the
+ * accurate measurement of the time between events.  It does not provide
+ * the wall-clock time.
+ * @id: event identifier with value from enum gpio_v2_line_event_id
+ * @offset: the offset of the line that triggered the event
+ * @seqno: the sequence number for this event in the sequence of events for
+ * all the lines in this line request
+ * @line_seqno: the sequence number for this event in the sequence of
+ * events on this particular line
+ * @padding: reserved for future use
+ */
+struct gpio_v2_line_event {
+	__aligned_u64 timestamp;
+	__u32 id;
+	__u32 offset;
+	__u32 seqno;
+	__u32 line_seqno;
+	/*
+	 * Pad struct to 64-bit boundary and provide space for future use.
+	 */
+	__u32 padding[6];
+};
+
+/*
+ *  ABI v1
+ */
+
 /* Informational flags */
 #define GPIOLINE_FLAG_KERNEL		(1UL << 0) /* Line used by the kernel */
 #define GPIOLINE_FLAG_IS_OUT		(1UL << 1)
@@ -149,8 +394,6 @@ struct gpiohandle_config {
 	__u32 padding[4]; /* padding for future use */
 };
 
-#define GPIOHANDLE_SET_CONFIG_IOCTL _IOWR(0xB4, 0x0a, struct gpiohandle_config)
-
 /**
  * struct gpiohandle_data - Information of values on a GPIO handle
  * @values: when getting the state of lines this contains the current
@@ -161,9 +404,6 @@ struct gpiohandle_data {
 	__u8 values[GPIOHANDLES_MAX];
 };
 
-#define GPIOHANDLE_GET_LINE_VALUES_IOCTL _IOWR(0xB4, 0x08, struct gpiohandle_data)
-#define GPIOHANDLE_SET_LINE_VALUES_IOCTL _IOWR(0xB4, 0x09, struct gpiohandle_data)
-
 /* Eventrequest flags */
 #define GPIOEVENT_REQUEST_RISING_EDGE	(1UL << 0)
 #define GPIOEVENT_REQUEST_FALLING_EDGE	(1UL << 1)
@@ -207,11 +447,31 @@ struct gpioevent_data {
 	__u32 id;
 };
 
+/*
+ * v1 and v2 ioctl()s
+ */
 #define GPIO_GET_CHIPINFO_IOCTL _IOR(0xB4, 0x01, struct gpiochip_info)
+#define GPIO_GET_LINEINFO_UNWATCH_IOCTL _IOWR(0xB4, 0x0C, __u32)
+
+/*
+ * v2 ioctl()s
+ */
+#define GPIO_V2_GET_LINEINFO_IOCTL _IOWR(0xB4, 0x05, struct gpio_v2_line_info)
+#define GPIO_V2_GET_LINEINFO_WATCH_IOCTL _IOWR(0xB4, 0x06, struct gpio_v2_line_info)
+#define GPIO_V2_GET_LINE_IOCTL _IOWR(0xB4, 0x07, struct gpio_v2_line_request)
+#define GPIO_V2_LINE_SET_CONFIG_IOCTL _IOWR(0xB4, 0x0D, struct gpio_v2_line_config)
+#define GPIO_V2_LINE_GET_VALUES_IOCTL _IOWR(0xB4, 0x0E, struct gpio_v2_line_values)
+#define GPIO_V2_LINE_SET_VALUES_IOCTL _IOWR(0xB4, 0x0F, struct gpio_v2_line_values)
+
+/*
+ * v1 ioctl()s
+ */
 #define GPIO_GET_LINEINFO_IOCTL _IOWR(0xB4, 0x02, struct gpioline_info)
-#define GPIO_GET_LINEINFO_WATCH_IOCTL _IOWR(0xB4, 0x0b, struct gpioline_info)
-#define GPIO_GET_LINEINFO_UNWATCH_IOCTL _IOWR(0xB4, 0x0c, __u32)
 #define GPIO_GET_LINEHANDLE_IOCTL _IOWR(0xB4, 0x03, struct gpiohandle_request)
 #define GPIO_GET_LINEEVENT_IOCTL _IOWR(0xB4, 0x04, struct gpioevent_request)
+#define GPIOHANDLE_GET_LINE_VALUES_IOCTL _IOWR(0xB4, 0x08, struct gpiohandle_data)
+#define GPIOHANDLE_SET_LINE_VALUES_IOCTL _IOWR(0xB4, 0x09, struct gpiohandle_data)
+#define GPIOHANDLE_SET_CONFIG_IOCTL _IOWR(0xB4, 0x0A, struct gpiohandle_config)
+#define GPIO_GET_LINEINFO_WATCH_IOCTL _IOWR(0xB4, 0x0B, struct gpioline_info)
 
 #endif /* _UAPI_GPIO_H_ */
-- 
2.28.0

