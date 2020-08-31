Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE19325721B
	for <lists+linux-gpio@lfdr.de>; Mon, 31 Aug 2020 05:22:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727910AbgHaDWC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 30 Aug 2020 23:22:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726838AbgHaDWA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 30 Aug 2020 23:22:00 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 790B4C061573;
        Sun, 30 Aug 2020 20:21:59 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id k15so3783203pfc.12;
        Sun, 30 Aug 2020 20:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HfQiW+WgxYBdXsafpd142Fc8e/yKRCdqQy/cYa2Z45k=;
        b=DobLudprLrVZI/kJktf4hThWP/hNqB2rNNZ+ShlvG5yEiqUYH5g0RuS2U78qrlSGgE
         QWT/BV9GPh0m9LEwhrpA4yFnW0r0wLVaXH6IxhGbn5PtH/wdaUGLzP0uC31aUWE8sCQw
         J7w9ST82M20lyDK/OffmFayOsNlaV+vstydvEUE9wXgNhXqaErwbs2hXynAC3OVVNfzs
         nwJC8XpyTQIlfHpipcji4MjPS84+6Fa1zETjhpd2unxNx7ohGaxt91yOhPg82DgOiUZA
         fF+xNMNW/4z02pr7DLI6NCzzjNawr75hzQR+i3tR5p0lBYC/D5RJdu6RTYs/YoSqFnN5
         JHOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HfQiW+WgxYBdXsafpd142Fc8e/yKRCdqQy/cYa2Z45k=;
        b=MlIx0/0sMNs+6OLsEE7lnDUQfQ5TLyfrdQ3PIVOiJBnZ1svzXjrXyX5pCJORIHGZZk
         2QUxDUThY6Dp6WAtqPtp3QTdi7VScpfSZWKlXp041jUco3/VX7CkSHRhtGZ2FoBL4cfv
         EolYmn8ptUoXmEqDKJCIV4XTCKsWE3uVM0uWC/QzWPM296evha8ZiY5nkYV4Ow45hAU2
         Hvv1wxyhtHsFnseieOGvT2Xa0I3xPm1cO8KoTgsghgAetpZ/RDVkmfSThvKGH9B8U/lT
         tugFjEYtmZ4ei/Dv3OC4xAJiJ/UnbaDna3AWjhd5hcEqhuNSLoD5VN2m+h6ovhfZ0ak4
         GJcg==
X-Gm-Message-State: AOAM53310ZqZMP9Nn7BTBTftoi8zzqMVxdtNZOKGdsa41vod3hwlA077
        4/EQFppSJNxdfrbFdmq+ZWnmN8rnbjA=
X-Google-Smtp-Source: ABdhPJycC/okNQeDvnR4TYF4jYB55BB2C6aTag7sLgXqkcGpa0ZIn6xEr0lcN6rqzpWmzeOGzQUk+g==
X-Received: by 2002:a62:2e81:: with SMTP id u123mr7905266pfu.304.1598844118121;
        Sun, 30 Aug 2020 20:21:58 -0700 (PDT)
Received: from sol.lan (106-69-184-100.dyn.iinet.net.au. [106.69.184.100])
        by smtp.gmail.com with ESMTPSA id z17sm6095733pfq.38.2020.08.30.20.21.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2020 20:21:57 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v6 04/20] gpio: uapi: define uAPI v2
Date:   Mon, 31 Aug 2020 11:19:50 +0800
Message-Id: <20200831032006.1019978-5-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200831032006.1019978-1-warthog618@gmail.com>
References: <20200831032006.1019978-1-warthog618@gmail.com>
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

 include/uapi/linux/gpio.h | 273 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 266 insertions(+), 7 deletions(-)

diff --git a/include/uapi/linux/gpio.h b/include/uapi/linux/gpio.h
index 285cc10355b2..0eb1f53b47e0 100644
--- a/include/uapi/linux/gpio.h
+++ b/include/uapi/linux/gpio.h
@@ -16,6 +16,8 @@
 
 /*
  * The maximum size of name and label arrays.
+ *
+ * Must be a multiple of 8 to ensure 32/64-bit alignment of structs.
  */
 #define GPIO_MAX_NAME_SIZE 32
 
@@ -32,6 +34,248 @@ struct gpiochip_info {
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
+	GPIO_V2_LINE_FLAG_USED			= 1ULL << 0, /* line is not available for request */
+	GPIO_V2_LINE_FLAG_ACTIVE_LOW		= 1ULL << 1,
+	GPIO_V2_LINE_FLAG_INPUT			= 1ULL << 2,
+	GPIO_V2_LINE_FLAG_OUTPUT		= 1ULL << 3,
+	GPIO_V2_LINE_FLAG_EDGE_RISING		= 1ULL << 4,
+	GPIO_V2_LINE_FLAG_EDGE_FALLING		= 1ULL << 5,
+	GPIO_V2_LINE_FLAG_OPEN_DRAIN		= 1ULL << 6,
+	GPIO_V2_LINE_FLAG_OPEN_SOURCE		= 1ULL << 7,
+	GPIO_V2_LINE_FLAG_BIAS_PULL_UP		= 1ULL << 8,
+	GPIO_V2_LINE_FLAG_BIAS_PULL_DOWN	= 1ULL << 9,
+	GPIO_V2_LINE_FLAG_BIAS_DISABLED		= 1ULL << 10,
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
@@ -149,8 +393,6 @@ struct gpiohandle_config {
 	__u32 padding[4]; /* padding for future use */
 };
 
-#define GPIOHANDLE_SET_CONFIG_IOCTL _IOWR(0xB4, 0x0a, struct gpiohandle_config)
-
 /**
  * struct gpiohandle_data - Information of values on a GPIO handle
  * @values: when getting the state of lines this contains the current
@@ -161,9 +403,6 @@ struct gpiohandle_data {
 	__u8 values[GPIOHANDLES_MAX];
 };
 
-#define GPIOHANDLE_GET_LINE_VALUES_IOCTL _IOWR(0xB4, 0x08, struct gpiohandle_data)
-#define GPIOHANDLE_SET_LINE_VALUES_IOCTL _IOWR(0xB4, 0x09, struct gpiohandle_data)
-
 /* Eventrequest flags */
 #define GPIOEVENT_REQUEST_RISING_EDGE	(1UL << 0)
 #define GPIOEVENT_REQUEST_FALLING_EDGE	(1UL << 1)
@@ -207,11 +446,31 @@ struct gpioevent_data {
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

