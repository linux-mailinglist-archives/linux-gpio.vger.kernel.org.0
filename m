Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B1CF22D4A2
	for <lists+linux-gpio@lfdr.de>; Sat, 25 Jul 2020 06:21:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726711AbgGYEU5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 25 Jul 2020 00:20:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725874AbgGYEU5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 25 Jul 2020 00:20:57 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B1F7C0619D3;
        Fri, 24 Jul 2020 21:20:57 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id d1so5602293plr.8;
        Fri, 24 Jul 2020 21:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xKmZFoFGPXrYv7zrcnoT0gyBpXfSMvefhbXt3xDXRKU=;
        b=jLQcNiukFo3MjntQglN5b7wCSyjbDznp9nHFan2QDgoyAbjOA8DiR/NncA8+wtdtS2
         69fTidTe5pnJKWE6qAeW4TFKltFTxpgQ16UeMeFbEw2P42ZYKl0V0KCB3JTC8wHid0+f
         rtdy6Ika8KoW2o+no6LtpFCubgO68nDnATL3o9dEON04XA+aGK2WjxL8bEbvz9Csmgj4
         GsMbI13J8WMSwXAZ/3IbxS+bHX9ePjgcehQ/qsiRHVLEaO2rnX+bHwwvqlbTT4TSam4b
         3d7riajWYcaNlFskSM0UDL3/sNLOQI2ZTan/ljeqb9IyBfDFRtbq5z3bX4pLzMPBmnpv
         Pyrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xKmZFoFGPXrYv7zrcnoT0gyBpXfSMvefhbXt3xDXRKU=;
        b=T72gf/+i1qnkuYeQSgIxHSVGN5NSmFmHdPgB1n2WKCJHmT+AXSivvCedSUGG5EW1s4
         rRjrUcJCMLceVqfUwRT+q+zZnTWPdAiqGadLqna07Enx2toyrUuOXYCIBCFAJyGuNMww
         KnGwbUUAJ+64U0mAnpaQsvUiDVfo7Y9kUKeteM6bzCeIJ06U0JYlWcHEaAe8DVRk6wMj
         waE8vQ0Qk49sAYhZF9F4kgvmJJ/NM30rH0h4nUjD/hBKoC+OxGww+y1v1VrB5zbkV2qm
         mm7QsUaWUTGeNaP/MdGSjrOVVBBCJJOEyjtvVGWrunIk/c9fNOnkfRI1uwRchzUmaUUT
         Bsgw==
X-Gm-Message-State: AOAM533wLNC86hlQ5hzNqVC3mqSzgr4wreR2Rqwv9DGPOqwISkHj1ZRV
        36ZSWn8iQJYHkN42qdEOQ08/MGWK
X-Google-Smtp-Source: ABdhPJygU58xaO4Y/FPN8f0u4AzSVEtTDnsnZBJx5WSClyY/Ev6LUgGOvDg72tqXM1V2WACDmzax2Q==
X-Received: by 2002:a17:90a:f488:: with SMTP id bx8mr8566081pjb.56.1595650855654;
        Fri, 24 Jul 2020 21:20:55 -0700 (PDT)
Received: from sol.lan (106-69-185-93.dyn.iinet.net.au. [106.69.185.93])
        by smtp.gmail.com with ESMTPSA id p1sm885320pjp.10.2020.07.24.21.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2020 21:20:55 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v2 02/18] gpio: uapi: define uAPI v2
Date:   Sat, 25 Jul 2020 12:19:39 +0800
Message-Id: <20200725041955.9985-3-warthog618@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200725041955.9985-1-warthog618@gmail.com>
References: <20200725041955.9985-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add a new version of the uAPI to address existing 32/64-bit alignment
issues, add support for debounce and event sequence numbers, and provide
some future proofing by adding padding reserved for future use.

The alignment issue relates to the gpioevent_data, which packs to different
sizes on 32-bit and 64-bit platforms. That creates problems for 32-bit apps
running on 64-bit kernels.  The patch addresses that particular issue, and
the problem more generally, by adding pad fields that explicitly pad
structs out to 64-bit boundaries, so they will pack to the same size now,
and even if some of the reserved padding is used for __u64 fields in the
future.

The lack of future proofing in v1 makes it impossible to, for example,
add the debounce feature that is included in v2.
The future proofing is addressed by providing reserved padding in all
structs for future features.  Specifically, the line request,
config, info, info_changed and event structs receive updated versions,
and the first three new ioctls.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---

I haven't added any padding to gpiochip_info, as I haven't seen any calls
for new features for the corresponding ioctl, but I'm open to updating that
as well.

As the majority of the structs and ioctls were being replaced, it seemed
opportune to rework some of the other aspects of the uAPI.

Firstly, I've reworked the flags field throughout.  v1 has three different
flags fields, each with their own separate bit definitions.  In v2 that is
collapsed to one.

I've also merged the handle and event requests into a single request, the
line request, as the two requests were mostly the same, other than the
edge detection provided by event requests.  As a byproduct, the v2 uAPI
allows for multiple lines producing edge events on the same line handle.
This is a new capability as v1 only supports a single line in an event
request.

This means there are now only two types of file handle to be concerned with,
the chip and the line, and it is clearer which ioctls apply to which type
of handle.

There is also some minor renaming of fields for consistency compared to
their v1 counterparts, e.g. offset rather than lineoffset or line_offset,
and consumer rather than consumer_label.

Additionally, v1 GPIOHANDLES_MAX becomes GPIOLINES_MAX in v2 for clarity,
and the gpiohandle_data __u8 array becomes a bitmap gpioline_values.

The v2 uAPI is mostly just a reorganisation of v1, so userspace code,
particularly libgpiod, should easily port to it.

Changes since v1:
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

Changes since the RFC:
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
 
 include/uapi/linux/gpio.h | 284 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 270 insertions(+), 14 deletions(-)

diff --git a/include/uapi/linux/gpio.h b/include/uapi/linux/gpio.h
index 285cc10355b2..3f6db33014f0 100644
--- a/include/uapi/linux/gpio.h
+++ b/include/uapi/linux/gpio.h
@@ -12,10 +12,13 @@
 #define _UAPI_GPIO_H_
 
 #include <linux/ioctl.h>
+#include <linux/kernel.h>
 #include <linux/types.h>
 
 /*
  * The maximum size of name and label arrays.
+ *
+ * Must be a multiple of 8 to ensure 32/64-bit alignment of structs.
  */
 #define GPIO_MAX_NAME_SIZE 32
 
@@ -32,6 +35,251 @@ struct gpiochip_info {
 	__u32 lines;
 };
 
+/*
+ * Maximum number of requested lines.
+ *
+ * Must be a multiple of 8 to ensure 32/64-bit alignment of structs.
+ */
+#define GPIOLINES_MAX 64
+
+/* The number of __u64 required for a bitmap for GPIOLINES_MAX lines */
+#define GPIOLINES_BITMAP_SIZE	__KERNEL_DIV_ROUND_UP(GPIOLINES_MAX, 64)
+
+/*
+ * The maximum number of configuration attributes associated with a line
+ * request.
+ */
+#define GPIOLINE_NUM_ATTRS_MAX 10
+
+/**
+ * enum gpioline_flag_v2 - &struct gpioline_attribute.flags values
+ */
+enum gpioline_flag_v2 {
+	GPIOLINE_FLAG_V2_USED			= 1UL << 0, /* line is not available for request */
+	GPIOLINE_FLAG_V2_ACTIVE_LOW		= 1UL << 1,
+	GPIOLINE_FLAG_V2_INPUT			= 1UL << 2,
+	GPIOLINE_FLAG_V2_OUTPUT			= 1UL << 3,
+	GPIOLINE_FLAG_V2_EDGE_RISING		= 1UL << 4,
+	GPIOLINE_FLAG_V2_EDGE_FALLING		= 1UL << 5,
+	GPIOLINE_FLAG_V2_OPEN_DRAIN		= 1UL << 6,
+	GPIOLINE_FLAG_V2_OPEN_SOURCE		= 1UL << 7,
+	GPIOLINE_FLAG_V2_BIAS_PULL_UP		= 1UL << 8,
+	GPIOLINE_FLAG_V2_BIAS_PULL_DOWN		= 1UL << 9,
+	GPIOLINE_FLAG_V2_BIAS_DISABLED		= 1UL << 10,
+};
+
+/**
+ * struct gpioline_values - Values of GPIO lines
+ * @bits: a bitmap containing the value of the lines, set to 1 for active
+ * and 0 for inactive.  Note that this is the logical value, which will be
+ * the opposite of the physical value if the line is configured as active
+ * low.
+ */
+struct gpioline_values {
+	__u64 bits[GPIOLINES_BITMAP_SIZE];
+};
+
+/**
+ * struct gpioline_set_values - Values to set a group of GPIO lines
+ * @mask: a bitmap identifying the lines to set.
+ * @bits: a bitmap containing the value of the lines, set to 1 for active
+ * and 0 for inactive.  Note that this is the logical value, which will be
+ * the opposite of the physical value if the line is configured as active
+ * low.
+ */
+struct gpioline_set_values {
+	__u64 mask[GPIOLINES_BITMAP_SIZE];
+	__u64 bits[GPIOLINES_BITMAP_SIZE];
+};
+
+/**
+ * enum gpioline_attr_id - &struct gpioline_attribute.id values
+ */
+enum gpioline_attr_id {
+	GPIOLINE_ATTR_ID_FLAGS			= 1,
+	GPIOLINE_ATTR_ID_OUTPUT_VALUES		= 2,
+	GPIOLINE_ATTR_ID_DEBOUNCE		= 3,
+};
+
+/**
+ * struct gpioline_attribute - a configurable attribute of a line
+ * @id: attribute identifier with value from &enum gpioline_attr_id
+ * @padding: reserved for future use and must be zero filled
+ * @flags: if id is GPIOLINE_ATTR_ID_FLAGS, the flags for the GPIO line,
+ * with values from enum gpioline_flag_v2, such as
+ * GPIOLINE_FLAG_V2_ACTIVE_LOW, GPIOLINE_FLAG_V2_OUTPUT etc, OR:ed
+ * together.  This overrides the default flags contained in the &struct
+ * gpioline_config for the associated line.
+ * @values: if id is GPIOLINE_ATTR_ID_OUTPUT_VALUES, the values to which
+ * the lines will be set
+ * @debounce_period: if id is GPIOLINE_ATTR_ID_DEBOUNCE, the desired
+ * debounce period, in microseconds
+ */
+struct gpioline_attribute {
+	__u32 id;
+	__u32 padding;
+	union {
+		__u64 flags;
+		struct gpioline_values values;
+		__u32 debounce_period;
+	};
+};
+
+/**
+ * struct gpioline_config_attribute - a configuration attribute associated
+ * with one or more of the requested lines.
+ * @mask: a bitmap identifying the lines to which the attribute applies
+ * @attr: the configurable attribute
+ */
+struct gpioline_config_attribute {
+	__u64 mask[GPIOLINES_BITMAP_SIZE];
+	struct gpioline_attribute attr;
+};
+
+/**
+ * struct gpioline_config - Configuration for GPIO lines
+ * @flags: flags for the GPIO lines, with values from enum
+ * gpioline_flag_v2, such as GPIOLINE_FLAG_V2_ACTIVE_LOW,
+ * GPIOLINE_FLAG_V2_OUTPUT etc, OR:ed together.  This is the default for
+ * all requested lines but may be overridden for particular lines using
+ * attrs.
+ * @num_attrs: the number of attributes in attrs
+ * @padding: reserved for future use and must be zero filled
+ * @attrs: the configuration attributes associated with the requested
+ * lines.
+ */
+struct gpioline_config {
+	__u64 flags;
+	__u32 num_attrs;
+	/*
+	 * Pad to fill implicit padding and provide space for future use.
+	 */
+	__u32 padding[5];
+	struct gpioline_config_attribute attrs[GPIOLINE_NUM_ATTRS_MAX];
+};
+
+/**
+ * struct gpioline_request - Information about a request for GPIO lines
+ * @offsets: an array of desired lines, specified by offset index for the
+ * associated GPIO device
+ * @consumer: a desired consumer label for the selected GPIO lines such as
+ * "my-bitbanged-relay"
+ * @config: requested configuration for the lines.
+ * @num_lines: number of lines requested in this request, i.e. the number
+ * of valid fields in the GPIOLINES_MAX sized arrays, set to 1 to request a
+ * single line
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
+struct gpioline_request {
+	__u32 offsets[GPIOLINES_MAX];
+	char consumer[GPIO_MAX_NAME_SIZE];
+	struct gpioline_config config;
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
+ * struct gpioline_info_v2 - Information about a certain GPIO line
+ * @name: the name of this GPIO line, such as the output pin of the line on
+ * the chip, a rail or a pin header name on a board, as specified by the
+ * gpio chip, may be empty
+ * @consumer: a functional name for the consumer of this GPIO line as set
+ * by whatever is using it, will be empty if there is no current user but
+ * may also be empty if the consumer doesn't set this up
+ * @flags: flags for the GPIO line, such as GPIOLINE_FLAG_V2_ACTIVE_LOW,
+ * GPIOLINE_FLAG_V2_OUTPUT etc, OR:ed together
+ * @offset: the local offset on this GPIO device, fill this in when
+ * requesting the line information from the kernel
+ * @num_attrs: the number of attributes in attrs
+ * @attrs: the configuration attributes associated with the line.
+ * @padding: reserved for future use
+ */
+struct gpioline_info_v2 {
+	char name[GPIO_MAX_NAME_SIZE];
+	char consumer[GPIO_MAX_NAME_SIZE];
+	__u32 offset;
+	__u32 num_attrs;
+	__u64 flags;
+	struct gpioline_attribute attrs[GPIOLINE_NUM_ATTRS_MAX];
+	/*
+	 * Pad struct to 64-bit boundary and provide space for future use.
+	 */
+	__u32 padding[4];
+};
+
+enum gpioline_changed_type {
+	GPIOLINE_CHANGED_REQUESTED	= 1,
+	GPIOLINE_CHANGED_RELEASED	= 2,
+	GPIOLINE_CHANGED_CONFIG		= 3,
+};
+
+/**
+ * struct gpioline_info_changed_v2 - Information about a change in status
+ * of a GPIO line
+ * @info: updated line information
+ * @timestamp: estimate of time of status change occurrence, in nanoseconds
+ * @event_type: the type of change with a value from enum gpioline_changed_type
+ * @padding: reserved for future use
+ */
+struct gpioline_info_changed_v2 {
+	struct gpioline_info_v2 info;
+	__u64 timestamp;
+	__u32 event_type;
+	/*
+	 * Pad struct to 64-bit boundary and provide space for future use.
+	 */
+	__u32 padding[5];
+};
+
+enum gpioline_event_id {
+	GPIOLINE_EVENT_RISING_EDGE	= 1,
+	GPIOLINE_EVENT_FALLING_EDGE	= 2,
+};
+
+/**
+ * struct gpioline_event - The actual event being pushed to userspace
+ * @timestamp: best estimate of time of event occurrence, in nanoseconds.
+ * The timestamp is read from CLOCK_MONOTONIC and is intended to allow the
+ * accurate measurement of the time between events.  It does not provide
+ * the wall-clock time.
+ * @id: event identifier with value from enum gpioline_event_id
+ * @offset: the offset of the line that triggered the event
+ * @seqno: the sequence number for this event in the sequence of events for
+ * all the lines in this line request
+ * @line_seqno: the sequence number for this event in the sequence of
+ * events on this particular line
+ * @padding: reserved for future use
+ */
+struct gpioline_event {
+	__u64 timestamp;
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
@@ -64,13 +312,6 @@ struct gpioline_info {
 /* Maximum number of requested handles */
 #define GPIOHANDLES_MAX 64
 
-/* Possible line status change events */
-enum {
-	GPIOLINE_CHANGED_REQUESTED = 1,
-	GPIOLINE_CHANGED_RELEASED,
-	GPIOLINE_CHANGED_CONFIG,
-};
-
 /**
  * struct gpioline_info_changed - Information about a change in status
  * of a GPIO line
@@ -149,8 +390,6 @@ struct gpiohandle_config {
 	__u32 padding[4]; /* padding for future use */
 };
 
-#define GPIOHANDLE_SET_CONFIG_IOCTL _IOWR(0xB4, 0x0a, struct gpiohandle_config)
-
 /**
  * struct gpiohandle_data - Information of values on a GPIO handle
  * @values: when getting the state of lines this contains the current
@@ -161,9 +400,6 @@ struct gpiohandle_data {
 	__u8 values[GPIOHANDLES_MAX];
 };
 
-#define GPIOHANDLE_GET_LINE_VALUES_IOCTL _IOWR(0xB4, 0x08, struct gpiohandle_data)
-#define GPIOHANDLE_SET_LINE_VALUES_IOCTL _IOWR(0xB4, 0x09, struct gpiohandle_data)
-
 /* Eventrequest flags */
 #define GPIOEVENT_REQUEST_RISING_EDGE	(1UL << 0)
 #define GPIOEVENT_REQUEST_FALLING_EDGE	(1UL << 1)
@@ -207,11 +443,31 @@ struct gpioevent_data {
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
+#define GPIO_GET_LINEINFO_V2_IOCTL _IOWR(0xB4, 0x05, struct gpioline_info_v2)
+#define GPIO_GET_LINEINFO_WATCH_V2_IOCTL _IOWR(0xB4, 0x06, struct gpioline_info_v2)
+#define GPIO_GET_LINE_IOCTL _IOWR(0xB4, 0x07, struct gpioline_request)
+#define GPIOLINE_SET_CONFIG_IOCTL _IOWR(0xB4, 0x0D, struct gpioline_config)
+#define GPIOLINE_GET_VALUES_IOCTL _IOWR(0xB4, 0x0E, struct gpioline_values)
+#define GPIOLINE_SET_VALUES_IOCTL _IOWR(0xB4, 0x0F, struct gpioline_set_values)
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
2.27.0

