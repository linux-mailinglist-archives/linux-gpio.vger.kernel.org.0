Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 043C520484A
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jun 2020 06:03:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732220AbgFWEC5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Jun 2020 00:02:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726429AbgFWEC4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Jun 2020 00:02:56 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EC77C061573;
        Mon, 22 Jun 2020 21:02:55 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id e8so4024096pgc.5;
        Mon, 22 Jun 2020 21:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2AZsp8B5EAOcfJRQD3uK7WPYxA3PQSyoF4tFq5kvAXw=;
        b=U3WFDIBbjXqFOrETuTX7ceOVXTxK8CWwu0iSBAetFziHgOP8CHV18qo9H+pTQjKFh2
         PCyNxaOA93gt5UUpG9GLSfrnuS/O3uwDyb21aE91TIK1+Z/1gsJdNYa40VX+73fU7Ro0
         8KbmRx4AJieIMlJez8RnHFQsHDgXNnE4vvuz7uD+08BJxrKLo2tKt88rJpQqSyKsV1sp
         D7DQmfWC6S2qvQ5TUmPsRLxZRdnE5GOeR4uqtDgg1HNHGaHXvKIhKSu+CZ78mei9BJ6I
         bqBg/pXF9kR3q2F1PSLQc3bGsNnB/NXe0k5JDbVfdg69e/ceuzMq7F3v2tGNf4loAC8w
         4XVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2AZsp8B5EAOcfJRQD3uK7WPYxA3PQSyoF4tFq5kvAXw=;
        b=qZSiG03C3s2E8oqHUl65CD+rWA5Q5YV4R3mZBtCv0KIfvrLQjMXReL/fU2bp1pvfL9
         4IYH4u8vD7TudjSp4oB/CE3V990/3FPNE+1Ske9M7hUPCuAwS0CKLLi0jkNlYT5aQTvE
         Mf0kDphEH45DLrJkemXY2dOb8u20rWkPtOiLfqoFKVvwc1NaJU94Au2SzeFbJikZ7CMg
         M7xRZ+T2rzNxny3WZiLnwr+ChuALwZe+zE5FDI6heQ6QUAONShs7u7qe436l+S7RoC10
         tP9iDefgsRdqj8kHBHJAqkkxwlQkZXk2gg9rw4XQfblbGQAYS7o6CgXvkcAKmQS+Ixp0
         boYw==
X-Gm-Message-State: AOAM531LqlkrBYgmI9lW12xsx1lyEYyiHhbNkDBxFNlPvQIa9uc21SRo
        6SdwjHygaPKhtKD9j6rVc2V887qX90M=
X-Google-Smtp-Source: ABdhPJwu5I6KD8Wd2eDOoth8T5uB/L2Vt5xF6O14xQAkeYYWaKaADkqcDhLGae5keZpVx2JWvQR/xQ==
X-Received: by 2002:a63:ec44:: with SMTP id r4mr15669063pgj.11.1592884973973;
        Mon, 22 Jun 2020 21:02:53 -0700 (PDT)
Received: from sol.lan (220-235-126-59.dyn.iinet.net.au. [220.235.126.59])
        by smtp.gmail.com with ESMTPSA id n64sm12442315pga.38.2020.06.22.21.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 21:02:53 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH 13/22] gpio: uapi: define uAPI V2
Date:   Tue, 23 Jun 2020 12:00:58 +0800
Message-Id: <20200623040107.22270-14-warthog618@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200623040107.22270-1-warthog618@gmail.com>
References: <20200623040107.22270-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add a new version of the uAPI to address existing 32/64bit alignment
issues, add support for debounce and event sequence numbers, and provide
some future proofing by adding padding reserved for future use.

The alignment issue relates to the gpioevent_data, which packs to different
sizes on 32bit and 64bit platforms. That creates problems for 32bit apps
running on 64bit kernels.  The patch addresses that particular issue, and
the problem more generally, by adding pad fields that explicitly pad
structs out to 64bit boundaries, so they will pack to the same size now,
and even if some of the reserved padding is used for __u64 fields in the
future.

The lack of future proofing in V1 makes it impossible to, for example,
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

Firstly, I've reworked the flags field throughout.  V1 has three different
flags fields, each with their own separate bit definitions.  In V2 that is
collapsed to one.  Further, the bits of the V2 flags field are used
as feature enable flags, with any other necessary configuration fields encoded
separately.  This is simpler and clearer, while also providing a foundation
for adding features in the future.

I've also merged the handle and event requests into a single request, the
line request, as the two requests where mostly the same, other than the
edge detection provided by event requests.  As a byproduct, the V2 uAPI
allows for multiple lines producing edge events on the same line handle.
This is a new capability as V1 only supports a single line in an event
request.

This means there are now only two types of file handle to be concerned with,
the chip and the line, and it is clearer which ioctls apply to which type
of handle.

There is also some minor renaming of fields for consistency compared to their
V1 counterparts, e.g. offset rather than lineoffset or line_offset, and 
consumer rather than consumer_label.

Additionally, V1 GPIOHANDLES_MAX becomes GPIOLINES_MAX in V2 for clarity,
and the gpiohandle_data __u8 array becomes a bitmap gpioline_values.

The V2 uAPI is mostly just a reorganisation of V1, so userspace code,
particularly libgpiod, should easily port to it.

The padding sizes have been carried over from the RFC version, although the
seqnos added to the gpioline_event alone would've used the all of the padding
for that struct, had they not been added here.  So I'm moderatly concerned
that those values are too small due to a lack of imagination on may part and
should be increased to decrease the probability of running out of space in
the padding and requiring creative solutions or even a V3.

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


 include/uapi/linux/gpio.h | 237 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 230 insertions(+), 7 deletions(-)

diff --git a/include/uapi/linux/gpio.h b/include/uapi/linux/gpio.h
index 4e1139ab25bc..e4ed6f79e332 100644
--- a/include/uapi/linux/gpio.h
+++ b/include/uapi/linux/gpio.h
@@ -11,11 +11,14 @@
 #ifndef _UAPI_GPIO_H_
 #define _UAPI_GPIO_H_
 
+#include <linux/kernel.h>
 #include <linux/ioctl.h>
 #include <linux/types.h>
 
 /*
  * The maximum size of name and label arrays.
+ *
+ * Must be a multiple of 8 to ensure 32/64bit alignment of structs.
  */
 #define GPIO_MAX_NAME_SIZE 32
 
@@ -32,6 +35,211 @@ struct gpiochip_info {
 	__u32 lines;
 };
 
+/*
+ * Maximum number of requested lines.
+ *
+ * Must be a multiple of 8 to ensure 32/64bit alignment of structs.
+ */
+#define GPIOLINES_MAX 64
+
+/* the number of __u64 required for a bitmap for GPIOLINES_MAX lines */
+#define GPIOLINES_BITMAP_SIZE	__KERNEL_DIV_ROUND_UP(GPIOLINES_MAX, 64)
+
+enum gpioline_direction {
+	GPIOLINE_DIRECTION_INPUT	= 0,
+	GPIOLINE_DIRECTION_OUTPUT	= 1,
+};
+
+enum gpioline_drive {
+	GPIOLINE_DRIVE_PUSH_PULL	= 0,
+	GPIOLINE_DRIVE_OPEN_DRAIN	= 1,
+	GPIOLINE_DRIVE_OPEN_SOURCE	= 2,
+};
+
+enum gpioline_bias {
+	GPIOLINE_BIAS_DISABLED		= 0,
+	GPIOLINE_BIAS_PULL_UP		= 1,
+	GPIOLINE_BIAS_PULL_DOWN		= 2,
+};
+
+enum gpioline_edge {
+	GPIOLINE_EDGE_NONE		= 0,
+	GPIOLINE_EDGE_RISING		= 1,
+	GPIOLINE_EDGE_FALLING		= 2,
+	GPIOLINE_EDGE_BOTH		= 3,
+};
+
+/* Line flags - V2 */
+#define GPIOLINE_FLAG_V2_USED		(1UL << 0) /* line is not available for request */
+#define GPIOLINE_FLAG_V2_ACTIVE_LOW	(1UL << 1)
+#define GPIOLINE_FLAG_V2_DIRECTION	(1UL << 2)
+#define GPIOLINE_FLAG_V2_DRIVE		(1UL << 3)
+#define GPIOLINE_FLAG_V2_BIAS		(1UL << 4)
+#define GPIOLINE_FLAG_V2_EDGE_DETECTION	(1UL << 5)
+#define GPIOLINE_FLAG_V2_DEBOUNCE	(1UL << 6)
+
+/*
+ * Struct padding sizes.
+ *
+ * These are sized to pad structs to 64bit boundaries.
+ * To maintain 32/64bit alignment, any arbitrary change must be even, as
+ * the pad elements are __u32.
+ */
+#define GPIOLINE_CONFIG_PAD_SIZE		7
+#define GPIOLINE_REQUEST_PAD_SIZE		5
+#define GPIOLINE_INFO_V2_PAD_SIZE		5
+#define GPIOLINE_INFO_CHANGED_V2_PAD_SIZE	5
+#define GPIOLINE_EVENT_PAD_SIZE			2
+
+/**
+ * struct gpioline_values - Values of GPIO lines
+ * @bitmap: a bitmap containing the value of the lines, set to 1 for active
+ * and 0 for inactive.  Note that this is the logical value, which will be
+ * the opposite of the physical value if GPIOLINE_FLAG_V2_ACTIVE_LOW is
+ * set in flags.
+ */
+struct gpioline_values {
+	__u64 bitmap[GPIOLINES_BITMAP_SIZE];
+};
+
+/**
+ * struct gpioline_config - Configuration for GPIO lines
+ * @values: if the direction is GPIOLINE_DIRECTION_OUTPUT, the values that
+ * the lines will be set to.  This field is write-only and is zeroed when
+ * returned within struct gpioline_info.
+ * @flags: flags for the GPIO lines, such as GPIOLINE_FLAG_V2_ACTIVE_LOW,
+ * GPIOLINE_FLAG_V2_DIRECTION etc, OR:ed together
+ * @direction: if GPIOLINE_FLAG_V2_DIRECTION is set in flags, the desired
+ * direction for the requested lines, with a value from enum
+ * gpioline_direction
+ * @drive: if GPIOLINE_FLAG_V2_DRIVE is set in flags, the desired drive for
+ * the requested lines, with a value from enum gpioline_drive
+ * @bias: if GPIOLINE_FLAG_V2_BIAS is set in flags, the desired bias for
+ * the requested lines, with a value from enum gpioline_bias
+ * @edge_detection: if GPIOLINE_FLAG_V2_EDGE_DETECTION is set in flags, the
+ * desired edge_detection for the requested lines, with a value from enum
+ * gpioline_edge
+ * @debounce_period: if GPIOLINE_FLAG_V2_DEBOUNCE is set in flags, the
+ * desired debounce period for the requested lines, in microseconds
+ * @padding: reserved for future use and must be zero filled
+ */
+struct gpioline_config {
+	struct gpioline_values values;
+	__u32 flags;
+	/* Note that the following four fields are equivalent to a single u32. */
+	__u8 direction;
+	__u8 drive;
+	__u8 bias;
+	__u8 edge_detection;
+	__u32 debounce_period;
+	__u32 padding[GPIOLINE_CONFIG_PAD_SIZE]; /* for future use */
+};
+
+/**
+ * struct gpioline_request - Information about a request for GPIO lines
+ * @offsets: an array of desired lines, specified by offset index for the
+ * associated GPIO device
+ * @consumer: a desired consumer label for the selected GPIO lines such as
+ * "my-bitbanged-relay"
+ * @config: requested configuration for the requested lines. Note that even
+ * if multiple lines are requested, the same configuration must be
+ * applicable to all of them. If you want lines with individual
+ * configuration, request them one by one. It is possible to select a batch
+ * of input or output lines, but they must all have the same configuration,
+ * i.e. all inputs or all outputs, all active low etc
+ * @num_lines: number of lines requested in this request, i.e. the number
+ * of valid fields in the GPIOLINES_MAX sized arrays, set to 1 to request a
+ * single line
+ * @event_buffer_size: a suggested minimum number of line events that the
+ * kernel should buffer.  This is only relevant if edge_detection is
+ * enabled. Note that this is only a suggested value and the kernel may
+ * allocate a larger buffer or cap the size of the buffer. If this field is
+ * zero then the buffer size defaults to a minimum of num_lines*16.
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
+	__u32 padding[GPIOLINE_REQUEST_PAD_SIZE]; /* for future use */
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
+ * @config: the configuration of the line.  Note that the values field is
+ * always zeroed - the line must be requested to read the values.
+ * @offset: the local offset on this GPIO device, fill this in when
+ * requesting the line information from the kernel
+ * @padding: reserved for future use
+ */
+struct gpioline_info_v2 {
+	char name[GPIO_MAX_NAME_SIZE];
+	char consumer[GPIO_MAX_NAME_SIZE];
+	struct gpioline_config config;
+	__u32 offset;
+	__u32 padding[GPIOLINE_INFO_V2_PAD_SIZE]; /* for future use */
+};
+
+/**
+ * struct gpioline_info_changed_v2 - Information about a change in status
+ * of a GPIO line
+ * @info: updated line information
+ * @timestamp: estimate of time of status change occurrence, in nanoseconds
+ * and GPIOLINE_CHANGED_CONFIG
+ * @event_type: one of GPIOLINE_CHANGED_REQUESTED, GPIOLINE_CHANGED_RELEASED
+ * @padding: reserved for future use
+ */
+struct gpioline_info_changed_v2 {
+	struct gpioline_info_v2 info;
+	__u64 timestamp;
+	__u32 event_type;
+	__u32 padding[GPIOLINE_INFO_CHANGED_V2_PAD_SIZE]; /* for future use */
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
+	__u32 padding[GPIOLINE_EVENT_PAD_SIZE]; /* for future use */
+};
+
+/*
+ *  ABI V1
+ */
+
 /* Informational flags */
 #define GPIOLINE_FLAG_KERNEL		(1UL << 0) /* Line used by the kernel */
 #define GPIOLINE_FLAG_IS_OUT		(1UL << 1)
@@ -149,8 +357,6 @@ struct gpiohandle_config {
 	__u32 padding[4]; /* padding for future use */
 };
 
-#define GPIOHANDLE_SET_CONFIG_IOCTL _IOWR(0xB4, 0x0a, struct gpiohandle_config)
-
 /**
  * struct gpiohandle_data - Information of values on a GPIO handle
  * @values: when getting the state of lines this contains the current
@@ -161,9 +367,6 @@ struct gpiohandle_data {
 	__u8 values[GPIOHANDLES_MAX];
 };
 
-#define GPIOHANDLE_GET_LINE_VALUES_IOCTL _IOWR(0xB4, 0x08, struct gpiohandle_data)
-#define GPIOHANDLE_SET_LINE_VALUES_IOCTL _IOWR(0xB4, 0x09, struct gpiohandle_data)
-
 /* Eventrequest flags */
 #define GPIOEVENT_REQUEST_RISING_EDGE	(1UL << 0)
 #define GPIOEVENT_REQUEST_FALLING_EDGE	(1UL << 1)
@@ -207,11 +410,31 @@ struct gpioevent_data {
 	__u32 id;
 };
 
+/*
+ * V1 and V2 ioctl()s
+ */
 #define GPIO_GET_CHIPINFO_IOCTL _IOR(0xB4, 0x01, struct gpiochip_info)
+#define GPIO_GET_LINEINFO_UNWATCH_IOCTL _IOWR(0xB4, 0x0C, __u32)
+
+/*
+ * V2 ioctl()s
+ */
+#define GPIO_GET_LINEINFO_V2_IOCTL _IOWR(0xB4, 0x05, struct gpioline_info_v2)
+#define GPIO_GET_LINEINFO_WATCH_V2_IOCTL _IOWR(0xB4, 0x06, struct gpioline_info_v2)
+#define GPIO_GET_LINE_IOCTL _IOWR(0xB4, 0x07, struct gpioline_request)
+#define GPIOLINE_SET_CONFIG_IOCTL _IOWR(0xB4, 0x0D, struct gpioline_config)
+#define GPIOLINE_GET_VALUES_IOCTL _IOWR(0xB4, 0x0E, struct gpioline_values)
+#define GPIOLINE_SET_VALUES_IOCTL _IOWR(0xB4, 0x0F, struct gpioline_values)
+
+/*
+ * V1 ioctl()s
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

