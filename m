Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB5B61D5F38
	for <lists+linux-gpio@lfdr.de>; Sat, 16 May 2020 08:45:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725934AbgEPGp5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 16 May 2020 02:45:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725807AbgEPGp4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 16 May 2020 02:45:56 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 777DEC061A0C;
        Fri, 15 May 2020 23:45:56 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id k7so1943500pjs.5;
        Fri, 15 May 2020 23:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kG+qMcXS2Ip53cSpXcnkCpCFb90d+/fMhBPCaVrL9us=;
        b=pzeAkb3wPVi379FMPtlfG408iB0E8t4bcFJTr5uUtj2+dA6mWkrI6zzRRUnpH+Sr9O
         5WIOt+2pQSBVYToojrreXdaSVj2yJckvWQ9Kl9sDtjSGtiDWCIT9Lh5RvAZekPkg4RLW
         RMd3H2smEJeCJoSq/Kco3tgSEWrSy8xtOIi8WLGaxXElDYduWcAVBLLrl+4wto3R1z+o
         O441U4N4eIii7fBvX7g56W1e8w/BLmsPzrVElaZ9SfbA9UEI5b3ZGmyzW81231tZ8MEf
         Zpl2rTkWcnkg3yuF7z/UhcEADWm3K3TI976GSlQIxhpeES/JO7cHqTCXQredCPDBU49P
         UE8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kG+qMcXS2Ip53cSpXcnkCpCFb90d+/fMhBPCaVrL9us=;
        b=GHrxQhtxDQix1xS+LEVlqvzv+IoykMb5xgEBkgDXxewALF+LlTOrEeSa+0g8qp7qPA
         d8ewA+vR9fXeEOFH53S150sH/Nj6qdZrNEbHSHZmIAi4DawfjAvsIja9LLysEP7EZRkT
         rZVJSGV+oeNGma7KuBxPXs1x1B6mF3VWZBe0VBJom6B+K2qMJwMbwPvnTlb/M0QbmCSD
         I52j6cjslwiFxoFd7G40HmZyC9TYQm3UVfKYJZKtqwbDA46xTISdBFwLcpyx4YWvcJoN
         NrIDMjmGkY2aE3+4D26VzExQuPPS3zzB23+vaWc88gwzGAeot/jW8pajJLnMD7tO9kkG
         py6w==
X-Gm-Message-State: AOAM530L9EYyavkzzuRU2deYEnZwkGEsoIHARZChg/omknYMiydzj/Oq
        Uj/b2g8qF78NvNPAsqpslvfHPZ6UmGc=
X-Google-Smtp-Source: ABdhPJxfAftWX8KptAq1m3kla7lBPUw+f497RI7PRv+8uMH2+A9iabEA1iIC11BswuyD+bt3lpggfg==
X-Received: by 2002:a17:90a:2685:: with SMTP id m5mr3961549pje.197.1589611555196;
        Fri, 15 May 2020 23:45:55 -0700 (PDT)
Received: from sol.lan (220-235-64-125.dyn.iinet.net.au. [220.235.64.125])
        by smtp.gmail.com with ESMTPSA id w192sm3578347pff.126.2020.05.15.23.45.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2020 23:45:54 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [RFC PATCH] gpio: uapi: v2 proposal
Date:   Sat, 16 May 2020 14:45:07 +0800
Message-Id: <20200516064507.19058-1-warthog618@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add a new version of the uAPI to address existing 32/64bit alignment
issues, add support for debounce, and provide some future proofing by
adding padding reserved for future use.

Signed-off-by: Kent Gibson <warthog618@gmail.com>

---

This patch is a proposal to replace the majority of the uAPI, so some 
background and justification is in order.

The alignment issue relates to the gpioevent_data, which packs to different
sizes on 32bit and 64bit platforms. That creates problems for 32bit apps
running on 64bit kernels.  The patch addresses that particular issue, and
the problem more generally, by adding pad fields that explicitly pad
structs out to 64bit boundaries, so they will pack to the same size now,
and even if some of the reserved padding is used for __u64 fields in the
future.

The lack of future proofing in v1 makes it impossible to, for example,
add the debounce feature that is included in v2.
The future proofing is addressed by providing reserved padding in all
structs for future features.  Specifically, the line request, 
config and info structs get updated versions and ioctls.

I haven't added any padding to gpiochip_info, as I haven't seen any calls
for new features for the corresponding ioctl, but I'm open to updating that
as well.

As the majority of the structs and ioctls were being replaced, it seemed
opportune to rework some of the other aspects of the uAPI.

Firstly, I've reworked the flags field throughout.  v1 has three different
flags fields, each with their own separate bit definitions.  In v2 that is
collapsed to one.  Further, the bits of the v2 flags field are used
as feature enable flags, with any other necessary configuration fields encoded
separately.  This is simpler and clearer, while also providing a foundation
for adding features in the future.

I've also merged the handle and event requests into a single request, the
line request, as the two requests where mostly the same, other than the
edge detection provided by event requests.  As a byproduct, the v2 uAPI
allows for multiple lines producing edge events on the same line handle.
This is a new capability as v1 only supports a single line in an event request.

This means there are now only two types of file handle to be concerned with,
the chip and the line, and it is clearer which ioctls apply to which type
of handle.

There is also some minor renaming of fields for consistency compared to their
v1 counterparts, e.g. offset rather than lineoffset or line_offset, and 
consumer rather than consumer_label.

And v1 GPIOHANDLES_MAX and gpiohandle_data become GPIOLINES_MAX and 
gpioline_values for v2 - the only change being the renaming for clarity.

The v2 uAPI is mostly just a reorganisation of v1, so userspace code,
particularly libgpiod, should easily port to it.

This patch is obviously only one patch in a much bigger series that 
will actually implement it, but I would appreciate a review and any feedback,
as it is foundational to the rest of that series.

Thanks,
Kent.

 include/uapi/linux/gpio.h | 204 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 197 insertions(+), 7 deletions(-)

diff --git a/include/uapi/linux/gpio.h b/include/uapi/linux/gpio.h
index 0206383c0383..3db7e0bc1312 100644
--- a/include/uapi/linux/gpio.h
+++ b/include/uapi/linux/gpio.h
@@ -14,6 +14,9 @@
 #include <linux/ioctl.h>
 #include <linux/types.h>
 
+/* The maximum size of name and label arrays */
+#define GPIO_MAX_NAME_SIZE 32
+
 /**
  * struct gpiochip_info - Information about a certain GPIO chip
  * @name: the Linux kernel name of this GPIO chip
@@ -27,6 +30,184 @@ struct gpiochip_info {
 	__u32 lines;
 };
 
+/* Maximum number of requested lines */
+#define GPIOLINES_MAX 64
+
+enum gpioline_direction {
+	GPIOLINE_DIRECTION_INPUT	= 1,
+	GPIOLINE_DIRECTION_OUTPUT	= 2,
+};
+
+enum gpioline_drive {
+	GPIOLINE_DRIVE_PUSH_PULL	= 0,
+	GPIOLINE_DRIVE_OPEN_DRAIN	= 1,
+	GPIOLINE_DRIVE_OPEN_SOURCE	= 2,
+};
+
+enum gpioline_bias {
+	GPIOLINE_BIAS_DISABLE		= 0,
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
+#define GPIOLINE_FLAG_V2_KERNEL		(1UL << 0) /* Line used by the kernel */
+#define GPIOLINE_FLAG_V2_ACTIVE_LOW	(1UL << 1)
+#define GPIOLINE_FLAG_V2_DIRECTION	(1UL << 2)
+#define GPIOLINE_FLAG_V2_DRIVE		(1UL << 3)
+#define GPIOLINE_FLAG_V2_BIAS		(1UL << 4)
+#define GPIOLINE_FLAG_V2_EDGE_DETECTION	(1UL << 5)
+#define GPIOLINE_FLAG_V2_DEBOUNCE	(1UL << 6)
+
+/**
+ * struct gpioline_config - Configuration for GPIO lines
+ * @default_values: if the direction is GPIOLINE_DIRECTION_OUTPUT, this
+ * specifies the default output value, should be 0 (low) or 1 (high),
+ * anything else than 0 or 1 will be interpreted as 1 (high)
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
+ * @debounce: if GPIOLINE_FLAG_V2_DEBOUNCE is set in flags, the desired
+ * debounce period for the requested lines, in microseconds
+ * @padding: reserved for future use and should be zero filled
+ */
+struct gpioline_config {
+	__u8 default_values[GPIOLINES_MAX];
+	__u32 flags;
+	__u8 direction;
+	__u8 drive;
+	__u8 bias;
+	__u8 edge_detection;
+	__u32 debounce;
+	__u32 padding[7]; /* for future use */
+};
+
+/**
+ * struct gpioline_request - Information about a request for GPIO lines
+ * @offsets: an array of desired lines, specified by offset index for the
+ * associated GPIO device
+ * @consumer: a desired consumer label for the selected GPIO lines such
+ * as "my-bitbanged-relay"
+ * @config: Requested configuration for the requested lines. Note that
+ * even if multiple lines are requested, the same configuration must be
+ * applicable to all of them. If you want lines with individual
+ * configuration, request them one by one. It is possible to select a
+ * batch of input or output lines, but they must all have the same
+ * configuration, i.e. all inputs or all outputs, all active low etc
+ * @lines: number of lines requested in this request, i.e. the number of
+ * valid fields in the GPIOLINES_MAX sized arrays, set to 1 to request a
+ * single line
+ * @padding: reserved for future use and should be zero filled
+ * @fd: if successful this field will contain a valid anonymous file handle
+ * after a GPIO_GET_LINE_IOCTL operation, zero or negative value means
+ * error
+ */
+struct gpioline_request {
+	__u32 offsets[GPIOLINES_MAX];
+	char consumer[GPIO_MAX_NAME_SIZE];
+	struct gpioline_config config;
+	__u32 lines;
+	__u32 padding[4]; /* for future use */
+	__s32 fd;
+};
+
+/**
+ * struct gpioline_values - Values of GPIO lines
+ * @values: when getting the state of lines this contains the current
+ * state of a line, when setting the state of lines these should contain
+ * the desired target state
+ */
+struct gpioline_values {
+	__u8 values[GPIOLINES_MAX];
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
+ * @offset: the local offset on this GPIO device, fill this in when
+ * requesting the line information from the kernel
+ * @flags: various flags for this line
+ * @direction: if GPIOLINE_FLAG_V2_DIRECTION is set in flags, the direction
+ * of the line, with a value from enum gpioline_direction
+ * @drive: if GPIOLINE_FLAG_V2_DRIVE is set in flags, the drive for the
+ * line, with a value from enum gpioline_drive
+ * @bias: if GPIOLINE_FLAG_V2_BIAS is set in flags, the bias for the line,
+ * with a value from enum gpioline_bias
+ * @edge_detection: if GPIOLINE_FLAG_V2_EDGE_DETECTION is set in flags, the
+ * edge_detection for the line, with a value from enum gpioline_edge
+ * @debounce: if GPIOLINE_FLAG_V2_DEBOUNCE is set in flags, the debounce
+ * period for the line, in microseconds
+ * @padding: reserved for future use
+ */
+struct gpioline_info_v2 {
+	char name[GPIO_MAX_NAME_SIZE];
+	char consumer[GPIO_MAX_NAME_SIZE];
+	__u32 offset;
+	__u32 flags;
+	__u8 direction;
+	__u8 drive;
+	__u8 bias;
+	__u8 edge_detection;
+	__u32 debounce;
+	__u32 padding[12]; /* for future use */
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
+	__u32 padding[5]; /* for future use */
+};
+
+enum gpioline_event_id {
+	GPIOLINE_EVENT_RISING_EDGE	= 1,
+	GPIOLINE_EVENT_FALLING_EDGE	= 2,
+};
+
+/**
+ * struct gpioline_event - The actual event being pushed to userspace
+ * @timestamp: best estimate of time of event occurrence, in nanoseconds
+ * @id: event identifier with value from enum gpioline_event_id
+ * @offset: the offset of the line that triggered the event
+ * @padding: reserved for future use
+ */
+struct gpioline_event {
+	__u64 timestamp;
+	__u32 id;
+	__u32 offset;
+	__u32 padding[2]; /* for future use */
+};
+
 /* Informational flags */
 #define GPIOLINE_FLAG_KERNEL		(1UL << 0) /* Line used by the kernel */
 #define GPIOLINE_FLAG_IS_OUT		(1UL << 1)
@@ -144,8 +325,6 @@ struct gpiohandle_config {
 	__u32 padding[4]; /* padding for future use */
 };
 
-#define GPIOHANDLE_SET_CONFIG_IOCTL _IOWR(0xB4, 0x0a, struct gpiohandle_config)
-
 /**
  * struct gpiohandle_data - Information of values on a GPIO handle
  * @values: when getting the state of lines this contains the current
@@ -156,9 +335,6 @@ struct gpiohandle_data {
 	__u8 values[GPIOHANDLES_MAX];
 };
 
-#define GPIOHANDLE_GET_LINE_VALUES_IOCTL _IOWR(0xB4, 0x08, struct gpiohandle_data)
-#define GPIOHANDLE_SET_LINE_VALUES_IOCTL _IOWR(0xB4, 0x09, struct gpiohandle_data)
-
 /* Eventrequest flags */
 #define GPIOEVENT_REQUEST_RISING_EDGE	(1UL << 0)
 #define GPIOEVENT_REQUEST_FALLING_EDGE	(1UL << 1)
@@ -202,11 +378,25 @@ struct gpioevent_data {
 	__u32 id;
 };
 
+/* V1 and V2 */
 #define GPIO_GET_CHIPINFO_IOCTL _IOR(0xB4, 0x01, struct gpiochip_info)
+#define GPIO_GET_LINEINFO_UNWATCH_IOCTL _IOWR(0xB4, 0x0C, __u32)
+
+/* V1 */
 #define GPIO_GET_LINEINFO_IOCTL _IOWR(0xB4, 0x02, struct gpioline_info)
-#define GPIO_GET_LINEINFO_WATCH_IOCTL _IOWR(0xB4, 0x0b, struct gpioline_info)
-#define GPIO_GET_LINEINFO_UNWATCH_IOCTL _IOWR(0xB4, 0x0c, __u32)
 #define GPIO_GET_LINEHANDLE_IOCTL _IOWR(0xB4, 0x03, struct gpiohandle_request)
 #define GPIO_GET_LINEEVENT_IOCTL _IOWR(0xB4, 0x04, struct gpioevent_request)
+#define GPIOHANDLE_GET_LINE_VALUES_IOCTL _IOWR(0xB4, 0x08, struct gpiohandle_data)
+#define GPIOHANDLE_SET_LINE_VALUES_IOCTL _IOWR(0xB4, 0x09, struct gpiohandle_data)
+#define GPIOHANDLE_SET_CONFIG_IOCTL _IOWR(0xB4, 0x0A, struct gpiohandle_config)
+#define GPIO_GET_LINEINFO_WATCH_IOCTL _IOWR(0xB4, 0x0B, struct gpioline_info)
+
+/* V2 */
+#define GPIO_GET_LINEINFO_V2_IOCTL _IOWR(0xB4, 0x0D, struct gpioline_info_v2)
+#define GPIO_GET_LINEINFO_WATCH_V2_IOCTL _IOWR(0xB4, 0x0E, struct gpioline_info_v2)
+#define GPIO_GET_LINE_IOCTL _IOWR(0xB4, 0x0F, struct gpioline_request)
+#define GPIOLINE_SET_CONFIG_IOCTL _IOWR(0xB4, 0x10, struct gpioline_config)
+#define GPIOLINE_GET_VALUES_IOCTL _IOWR(0xB4, 0x11, struct gpioline_values)
+#define GPIOLINE_SET_VALUES_IOCTL _IOWR(0xB4, 0x12, struct gpioline_values)
 
 #endif /* _UAPI_GPIO_H_ */
-- 
2.26.2

