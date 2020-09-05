Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B8CC25E807
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Sep 2020 15:46:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728688AbgIENpv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 5 Sep 2020 09:45:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728653AbgIENi4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 5 Sep 2020 09:38:56 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96EBDC061261;
        Sat,  5 Sep 2020 06:38:32 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id q3so556009plr.13;
        Sat, 05 Sep 2020 06:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iCG3DHPkrfCdnS0ROdlbfM8O23WmFPNngL08pxdvjqU=;
        b=U3YbgltD6ucXyR/AlP+G5doqsuxtYnDRlkPyEQkQlEvfEHxDf+zvDIsuYoRj3+OboD
         V4inm8G7P73ZigDmm0YiQwJEJ3KzuPGlj3HDVd4IRRO+Y0DBnhuDfUgZ52s0ylpKx5b0
         hkq70F1SQvyseHOjzqltB13ThgjCQfR/k9/lwgVauceID/toCZ1MICogcmkcYxByzmb4
         PSF5HOOvVtwtgt1BTjF2OXA3HES3gIHiGv4VYWaIzHApxydVnsUn2eA8JtRifDTMs8tL
         7rBuoT9DS8ItSM52A46YGa2AJcrFItjA2Gkklf+eb+1XYjxksU9OEyBmcVimCq7/v3Nc
         hTWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iCG3DHPkrfCdnS0ROdlbfM8O23WmFPNngL08pxdvjqU=;
        b=toiHZyhtPYt+E8PuDzqJYsB5VC0FhktJS/aHFvckadQb1WBFaiiNwHZ1RS9Nki3Ox5
         pI0dPtI9dxqsiOm1LrouL+RXGy5EyVXvxr/9cNBQAXDinfFLkOoTPLybdu413MSMDrVF
         YCZrhpEe/vpmGweP/ovaAqiKgFRQQFZqqtqtgwWaEMTDdXLLVahUkARnhCur9DgCfS/G
         BJzbwvxxSZYM2rN/IfVJl1zpGt6NDOVYdcZP0M8hzplHMPcKDA1OUCsO4IJkwjRZ2a9f
         j0sm3oGDzJUA1/o76XpT5cAww+ey56eLjdKaEeU9siPNtxH4r4GLBJ6f/WuDl0kd3HDg
         tPrA==
X-Gm-Message-State: AOAM532ukchngx6Kxu3s07FNGoAxQsJ86Znsd58s3RiSCN6o1WDYYs34
        M5G/J7ApzlLgfUw5eS2+/g3JuJtI6vk=
X-Google-Smtp-Source: ABdhPJy+xFjM2GdswNpiy5yeYwW72AaMJsuPUx2HS3Ses3Ba46uQvWCM0taJv4VuDA5afT2ZbmsfAA==
X-Received: by 2002:a17:902:7c01:: with SMTP id x1mr12742905pll.34.1599313111445;
        Sat, 05 Sep 2020 06:38:31 -0700 (PDT)
Received: from sol.lan (106-69-184-100.dyn.iinet.net.au. [106.69.184.100])
        by smtp.gmail.com with ESMTPSA id u3sm7556717pjn.29.2020.09.05.06.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2020 06:38:30 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v7 13/20] gpio: uapi: document uAPI v1 as deprecated
Date:   Sat,  5 Sep 2020 21:35:42 +0800
Message-Id: <20200905133549.24606-14-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200905133549.24606-1-warthog618@gmail.com>
References: <20200905133549.24606-1-warthog618@gmail.com>
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
index 87074886e73d..8f768c66fa96 100644
--- a/include/uapi/linux/gpio.h
+++ b/include/uapi/linux/gpio.h
@@ -275,6 +275,9 @@ struct gpio_v2_line_event {
 
 /*
  *  ABI v1
+ *
+ * This version of the ABI is deprecated and will be removed in the future.
+ * Use the latest version of the ABI, defined above, instead.
  */
 
 /* Informational flags */
@@ -298,6 +301,9 @@ struct gpio_v2_line_event {
  * @consumer: a functional name for the consumer of this GPIO line as set by
  * whatever is using it, will be empty if there is no current user but may
  * also be empty if the consumer doesn't set this up
+ *
+ * This struct is part of ABI v1 and is deprecated.
+ * Use struct gpio_v2_line_info instead.
  */
 struct gpioline_info {
 	__u32 line_offset;
@@ -329,6 +335,9 @@ enum {
  * guarantee there are no implicit holes between it and subsequent members.
  * The 20-byte padding at the end makes sure we don't add any implicit padding
  * at the end of the structure on 64-bit architectures.
+ *
+ * This struct is part of ABI v1 and is deprecated.
+ * Use struct gpio_v2_line_info_changed instead.
  */
 struct gpioline_info_changed {
 	struct gpioline_info info;
@@ -368,6 +377,9 @@ struct gpioline_info_changed {
  * @fd: if successful this field will contain a valid anonymous file handle
  * after a GPIO_GET_LINEHANDLE_IOCTL operation, zero or negative value
  * means error
+ *
+ * This struct is part of ABI v1 and is deprecated.
+ * Use struct gpio_v2_line_request instead.
  */
 struct gpiohandle_request {
 	__u32 lineoffsets[GPIOHANDLES_MAX];
@@ -387,6 +399,9 @@ struct gpiohandle_request {
  * this specifies the default output value, should be 0 (low) or
  * 1 (high), anything else than 0 or 1 will be interpreted as 1 (high)
  * @padding: reserved for future use and should be zero filled
+ *
+ * This struct is part of ABI v1 and is deprecated.
+ * Use struct gpio_v2_line_config instead.
  */
 struct gpiohandle_config {
 	__u32 flags;
@@ -399,6 +414,9 @@ struct gpiohandle_config {
  * @values: when getting the state of lines this contains the current
  * state of a line, when setting the state of lines these should contain
  * the desired target state
+ *
+ * This struct is part of ABI v1 and is deprecated.
+ * Use struct gpio_v2_line_values instead.
  */
 struct gpiohandle_data {
 	__u8 values[GPIOHANDLES_MAX];
@@ -422,6 +440,9 @@ struct gpiohandle_data {
  * @fd: if successful this field will contain a valid anonymous file handle
  * after a GPIO_GET_LINEEVENT_IOCTL operation, zero or negative value
  * means error
+ *
+ * This struct is part of ABI v1 and is deprecated.
+ * Use struct gpio_v2_line_request instead.
  */
 struct gpioevent_request {
 	__u32 lineoffset;
@@ -441,6 +462,9 @@ struct gpioevent_request {
  * struct gpioevent_data - The actual event being pushed to userspace
  * @timestamp: best estimate of time of event occurrence, in nanoseconds
  * @id: event identifier
+ *
+ * This struct is part of ABI v1 and is deprecated.
+ * Use struct gpio_v2_line_event instead.
  */
 struct gpioevent_data {
 	__u64 timestamp;
@@ -465,6 +489,8 @@ struct gpioevent_data {
 
 /*
  * v1 ioctl()s
+ *
+ * These ioctl()s are deprecated.  Use the v2 equivalent instead.
  */
 #define GPIO_GET_LINEINFO_IOCTL _IOWR(0xB4, 0x02, struct gpioline_info)
 #define GPIO_GET_LINEHANDLE_IOCTL _IOWR(0xB4, 0x03, struct gpiohandle_request)
-- 
2.28.0

