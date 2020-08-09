Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6991723FE7F
	for <lists+linux-gpio@lfdr.de>; Sun,  9 Aug 2020 15:27:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726188AbgHIN1Y (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 9 Aug 2020 09:27:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726120AbgHIN1V (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 9 Aug 2020 09:27:21 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0706AC061756;
        Sun,  9 Aug 2020 06:27:21 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id g19so3472650plq.0;
        Sun, 09 Aug 2020 06:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uNL9DXEfWkyFKrmIT6BVVtAuwwDlXJtas5jqbxiTAWo=;
        b=YL5r5/1WtxbUEOiXuOAajYBc2qstCleKfaQwWIj1YHn2BnrrK2OiEJolt40xqhw68J
         3LZ/q0FAmVrHvNX5RTOTF2yoMlyRf+LlUNJ+x8Umpa0bkOVV2F7ghdYswUdAYF2RZFwt
         7jAyR5+TyZu3hTlfvgcZYNO9oTY8z5Nzj/7zsdHBM+51mc8JjDwHKfzdyD0k3FT3bR8B
         cAZhS8NqaGFQg5mKfRM5GQuAgzxKFoe5MpuuJp9fC+diAfl1olZq3cGHoDGg26dFJpZ4
         Dv6o5AeT6OcDfiB4eiYKUUn93/J0plTRaFVmcOnrgGZYrWE+nKwx/v34duPJOL1uJhYs
         N0qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uNL9DXEfWkyFKrmIT6BVVtAuwwDlXJtas5jqbxiTAWo=;
        b=WQRvyctL3deWRt/47bb9APJaUqt3R8VAGK1MxmBIKdeBEB66eKRTiQNCQo4WGhFntf
         M6ifPsGWeKIhRFRRQdcuU9crpittq/2fnFRku2prt1/4WtuKaX9sv9LyZZokeQrly8SM
         bl8wppB7Xq2pX7GHUJQzsvXIIdYvuVOxf9Nzqa3thVY6LGBlffa8x0HvaV7VXak9/xZt
         RGBdUb5vScDwvZjnhlQJRx833aYpMbNt9+70y1dBZ6eIN8fQ16A61Z73AvtNICg+/DpO
         Kyoe/B/uvkREVBpZ8ctB3tdM5srLiTnYZ9qUdK8usNdgsWJpUqkU9m1eBG108SKt78GZ
         KLWw==
X-Gm-Message-State: AOAM532fmwEzv6/PJjF0xPs51Alkr+0/O7Gry6F9u6HdFV4KjgbStndd
        rWZXXyjnygV3JajHYcJ2H/J/74en
X-Google-Smtp-Source: ABdhPJyEro1gjtbBvoLOd9iKeT6FwbTxMSOJlUT1mSdhjV1m4AmQY2ztycrvAhjBMSCqBwCeXctCmg==
X-Received: by 2002:a17:90b:d87:: with SMTP id bg7mr24145585pjb.159.1596979640168;
        Sun, 09 Aug 2020 06:27:20 -0700 (PDT)
Received: from sol.lan (106-69-185-93.dyn.iinet.net.au. [106.69.185.93])
        by smtp.gmail.com with ESMTPSA id j10sm9127414pff.171.2020.08.09.06.27.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2020 06:27:19 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v3 11/18] gpio: uapi: document uAPI v1 as deprecated
Date:   Sun,  9 Aug 2020 21:25:22 +0800
Message-Id: <20200809132529.264312-12-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200809132529.264312-1-warthog618@gmail.com>
References: <20200809132529.264312-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Update uAPI documentation to deprecate v1 structs and ioctls.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 include/uapi/linux/gpio.h | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/include/uapi/linux/gpio.h b/include/uapi/linux/gpio.h
index 82e8744b8c3b..286f5522378c 100644
--- a/include/uapi/linux/gpio.h
+++ b/include/uapi/linux/gpio.h
@@ -273,6 +273,9 @@ struct gpio_v2_line_event {
 
 /*
  *  ABI v1
+ *
+ * This version of the ABI is deprecated and will be removed in the future.
+ * Use the latest version of the ABI, defined above, instead.
  */
 
 /* Informational flags */
@@ -296,6 +299,9 @@ struct gpio_v2_line_event {
  * @consumer: a functional name for the consumer of this GPIO line as set by
  * whatever is using it, will be empty if there is no current user but may
  * also be empty if the consumer doesn't set this up
+ *
+ * This struct is part of ABI v1 and is deprecated.
+ * Use struct gpio_v2_line_info instead.
  */
 struct gpioline_info {
 	__u32 line_offset;
@@ -327,6 +333,9 @@ enum {
  * guarantee there are no implicit holes between it and subsequent members.
  * The 20-byte padding at the end makes sure we don't add any implicit padding
  * at the end of the structure on 64-bit architectures.
+ *
+ * This struct is part of ABI v1 and is deprecated.
+ * Use struct gpio_v2_line_info_changed instead.
  */
 struct gpioline_info_changed {
 	struct gpioline_info info;
@@ -366,6 +375,9 @@ struct gpioline_info_changed {
  * @fd: if successful this field will contain a valid anonymous file handle
  * after a GPIO_GET_LINEHANDLE_IOCTL operation, zero or negative value
  * means error
+ *
+ * This struct is part of ABI v1 and is deprecated.
+ * Use struct gpio_v2_line_request instead.
  */
 struct gpiohandle_request {
 	__u32 lineoffsets[GPIOHANDLES_MAX];
@@ -385,6 +397,9 @@ struct gpiohandle_request {
  * this specifies the default output value, should be 0 (low) or
  * 1 (high), anything else than 0 or 1 will be interpreted as 1 (high)
  * @padding: reserved for future use and should be zero filled
+ *
+ * This struct is part of ABI v1 and is deprecated.
+ * Use struct gpio_v2_line_config instead.
  */
 struct gpiohandle_config {
 	__u32 flags;
@@ -397,6 +412,9 @@ struct gpiohandle_config {
  * @values: when getting the state of lines this contains the current
  * state of a line, when setting the state of lines these should contain
  * the desired target state
+ *
+ * This struct is part of ABI v1 and is deprecated.
+ * Use struct gpio_v2_line_values instead.
  */
 struct gpiohandle_data {
 	__u8 values[GPIOHANDLES_MAX];
@@ -420,6 +438,9 @@ struct gpiohandle_data {
  * @fd: if successful this field will contain a valid anonymous file handle
  * after a GPIO_GET_LINEEVENT_IOCTL operation, zero or negative value
  * means error
+ *
+ * This struct is part of ABI v1 and is deprecated.
+ * Use struct gpio_v2_line_request instead.
  */
 struct gpioevent_request {
 	__u32 lineoffset;
@@ -439,6 +460,9 @@ struct gpioevent_request {
  * struct gpioevent_data - The actual event being pushed to userspace
  * @timestamp: best estimate of time of event occurrence, in nanoseconds
  * @id: event identifier
+ *
+ * This struct is part of ABI v1 and is deprecated.
+ * Use struct gpio_v2_line_event instead.
  */
 struct gpioevent_data {
 	__u64 timestamp;
@@ -463,6 +487,8 @@ struct gpioevent_data {
 
 /*
  * v1 ioctl()s
+ *
+ * These ioctl()s are deprecated.  Use the v2 equivalent instead.
  */
 #define GPIO_GET_LINEINFO_IOCTL _IOWR(0xB4, 0x02, struct gpioline_info)
 #define GPIO_GET_LINEHANDLE_IOCTL _IOWR(0xB4, 0x03, struct gpiohandle_request)
-- 
2.28.0

