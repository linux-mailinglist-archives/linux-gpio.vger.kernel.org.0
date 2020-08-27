Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E37622546FF
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Aug 2020 16:35:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727048AbgH0Ofc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Aug 2020 10:35:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726876AbgH0OEA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Aug 2020 10:04:00 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3244C0619C5;
        Thu, 27 Aug 2020 07:03:20 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id nv17so2678856pjb.3;
        Thu, 27 Aug 2020 07:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9daGc+bQBQhtyKnIGABCoe3Sraaytqyp+0NjDqFhrAU=;
        b=cibGEd7w5SHuwMpQ4ocj9kfknHVCpQJFx3E9Jm2dd0Tx69gKU/Y5BwFkqGVYmnlSH1
         FytcLBwxkj6iwfL3mFdpFbWT56D4XPASSSCnIwR2FZZttcQdSCROg+u8pN7uJNu2dHFW
         py8QNASLNc5OkgpSLijB3zjfEl71Sh0wFoT1lVZTyosx7wqiyuiwe+nuVe1Psgf1q97K
         SXwQJDK73PcoX262TA44usY6IZQQwxFMu7bK31nbbBBVM18hAL+2xWo0uW9d4Fq83XJj
         q0vlbx64K1mVv5tENaW1qGzzXa3iS1qvZFvKH2N5yeYkj3H5NmoEXgqyz5xRx2F2nndz
         jQOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9daGc+bQBQhtyKnIGABCoe3Sraaytqyp+0NjDqFhrAU=;
        b=t796xuDLjNpM4HBlPhWNvBL0S4uosNwPPgiasFwz0vClrybMwU9Kbnc74imxsKksh6
         shxpkskVECQH7+C2FfAxjmIoWaanFDL3QSh1X5gvUcnkA4Nz8aZ30RkoVTY8scluH6rs
         1baELYthgVdqV7ewGu2Q+1bfcLTVeGb4p9CetAER/eZqfJv54xYAb4HxsagKcFgHJjoQ
         1/MbTcH7hPTtZ2CFcUviCUmwr81eZCrsTvRl38xzGCOA9BDH5xITapgssciiKo3ttwla
         +DHPyz853AirMYzLfdgjddXnKPX8cguTg24m7v+j4DzST/m3lZcvTyM22FVwzYOCt6IR
         fpkw==
X-Gm-Message-State: AOAM531pOtTwb5k5/Q+g31AjtU/O3R9UdpodAYeiHQ05gYnbQRL+SMFO
        uYmrOpomehZ/2OdqtRoW0akv277bBHk=
X-Google-Smtp-Source: ABdhPJxl/w5AoKJLugN5UJh8/H6o9mfA7L4cPn4EUStogfziG9oiSAzPrWj9J5IvkZfGtXpfkzhUug==
X-Received: by 2002:a17:90a:e292:: with SMTP id d18mr9118171pjz.96.1598536999661;
        Thu, 27 Aug 2020 07:03:19 -0700 (PDT)
Received: from sol.lan (106-69-184-100.dyn.iinet.net.au. [106.69.184.100])
        by smtp.gmail.com with ESMTPSA id fs12sm2371092pjb.21.2020.08.27.07.03.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2020 07:03:18 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v5 13/20] gpio: uapi: document uAPI v1 as deprecated
Date:   Thu, 27 Aug 2020 22:00:13 +0800
Message-Id: <20200827140020.159627-14-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200827140020.159627-1-warthog618@gmail.com>
References: <20200827140020.159627-1-warthog618@gmail.com>
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
index 0eb1f53b47e0..4af67415d73e 100644
--- a/include/uapi/linux/gpio.h
+++ b/include/uapi/linux/gpio.h
@@ -274,6 +274,9 @@ struct gpio_v2_line_event {
 
 /*
  *  ABI v1
+ *
+ * This version of the ABI is deprecated and will be removed in the future.
+ * Use the latest version of the ABI, defined above, instead.
  */
 
 /* Informational flags */
@@ -297,6 +300,9 @@ struct gpio_v2_line_event {
  * @consumer: a functional name for the consumer of this GPIO line as set by
  * whatever is using it, will be empty if there is no current user but may
  * also be empty if the consumer doesn't set this up
+ *
+ * This struct is part of ABI v1 and is deprecated.
+ * Use struct gpio_v2_line_info instead.
  */
 struct gpioline_info {
 	__u32 line_offset;
@@ -328,6 +334,9 @@ enum {
  * guarantee there are no implicit holes between it and subsequent members.
  * The 20-byte padding at the end makes sure we don't add any implicit padding
  * at the end of the structure on 64-bit architectures.
+ *
+ * This struct is part of ABI v1 and is deprecated.
+ * Use struct gpio_v2_line_info_changed instead.
  */
 struct gpioline_info_changed {
 	struct gpioline_info info;
@@ -367,6 +376,9 @@ struct gpioline_info_changed {
  * @fd: if successful this field will contain a valid anonymous file handle
  * after a GPIO_GET_LINEHANDLE_IOCTL operation, zero or negative value
  * means error
+ *
+ * This struct is part of ABI v1 and is deprecated.
+ * Use struct gpio_v2_line_request instead.
  */
 struct gpiohandle_request {
 	__u32 lineoffsets[GPIOHANDLES_MAX];
@@ -386,6 +398,9 @@ struct gpiohandle_request {
  * this specifies the default output value, should be 0 (low) or
  * 1 (high), anything else than 0 or 1 will be interpreted as 1 (high)
  * @padding: reserved for future use and should be zero filled
+ *
+ * This struct is part of ABI v1 and is deprecated.
+ * Use struct gpio_v2_line_config instead.
  */
 struct gpiohandle_config {
 	__u32 flags;
@@ -398,6 +413,9 @@ struct gpiohandle_config {
  * @values: when getting the state of lines this contains the current
  * state of a line, when setting the state of lines these should contain
  * the desired target state
+ *
+ * This struct is part of ABI v1 and is deprecated.
+ * Use struct gpio_v2_line_values instead.
  */
 struct gpiohandle_data {
 	__u8 values[GPIOHANDLES_MAX];
@@ -421,6 +439,9 @@ struct gpiohandle_data {
  * @fd: if successful this field will contain a valid anonymous file handle
  * after a GPIO_GET_LINEEVENT_IOCTL operation, zero or negative value
  * means error
+ *
+ * This struct is part of ABI v1 and is deprecated.
+ * Use struct gpio_v2_line_request instead.
  */
 struct gpioevent_request {
 	__u32 lineoffset;
@@ -440,6 +461,9 @@ struct gpioevent_request {
  * struct gpioevent_data - The actual event being pushed to userspace
  * @timestamp: best estimate of time of event occurrence, in nanoseconds
  * @id: event identifier
+ *
+ * This struct is part of ABI v1 and is deprecated.
+ * Use struct gpio_v2_line_event instead.
  */
 struct gpioevent_data {
 	__u64 timestamp;
@@ -464,6 +488,8 @@ struct gpioevent_data {
 
 /*
  * v1 ioctl()s
+ *
+ * These ioctl()s are deprecated.  Use the v2 equivalent instead.
  */
 #define GPIO_GET_LINEINFO_IOCTL _IOWR(0xB4, 0x02, struct gpioline_info)
 #define GPIO_GET_LINEHANDLE_IOCTL _IOWR(0xB4, 0x03, struct gpiohandle_request)
-- 
2.28.0

