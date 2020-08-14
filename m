Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1B372443C8
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Aug 2020 05:05:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726938AbgHNDFN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 13 Aug 2020 23:05:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726690AbgHNDFM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 13 Aug 2020 23:05:12 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1557C061383;
        Thu, 13 Aug 2020 20:05:11 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id k13so3529593plk.13;
        Thu, 13 Aug 2020 20:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9daGc+bQBQhtyKnIGABCoe3Sraaytqyp+0NjDqFhrAU=;
        b=tWE/vFQhF4JVkq0UAtlrFfLFuE0m1EAIbkz6Sqg3ea7NaJf1BR+TVpN0W3PhNV8PJF
         Tr+JvKQXEXFfY34Q1aJ/km84LQDXNJNcEfbLfcUuCld+FChPcFN93/fg+JHrL+R88q6Q
         yOL7jAar5fi6Px5Y6PBC/lDU+X3C2Mgf3d5iFWW1d5w8VRS4pJlqtJzIJI/upCQDW2Zn
         kze3EiTNb4lw0Jlq9LxyjUAbNSdD7xZCdLiROUA4P9Iqe6eVlZqD8GGVA2c3paIdUUlT
         KklNKRclIdoSpzytXqI1oPhWc+hUyAUm0rlge9fub+jdh/tpa/d65w2Hw2mli7eGXt0U
         yyBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9daGc+bQBQhtyKnIGABCoe3Sraaytqyp+0NjDqFhrAU=;
        b=YXedpbd7c5lNe+j5EBOMrMkkQD9hXgIwNOEtcpLc2IHzEvBH2qjg3FO1cdvrFWdCY4
         O2PnH5YfBPFUTDx3xX00XMtECikMi7V2A+P0ouDrmJru926T4M1jwUcc1jTJDbU/m+K/
         xXmhiwIljuYcpYNMDL0/BnnzNwE7Xyx80tn0XGRB/berfn9ck8ka1MSFC7c90e5cT/f8
         RlQNu2Jy4GQBjZuQRYX4aSPFUZww9ds91t3MFe50opi7RhmJHxY5KyhtzEFhFA4If4Ph
         0rBAtHrsj1EIkgrWw7/hay2R5QaywfhLdit34VsRVMjWhpkVlYiXhSaImTJ9AChsyZ4w
         esag==
X-Gm-Message-State: AOAM531fPWafKE6T0luoBCabZutssk1Dxb8CwxVWj6GJgfokloUw4MLb
        CTi+XkYesrVel7lZ3mvorGZ+K0v5
X-Google-Smtp-Source: ABdhPJxOETVuvb0Lqh4wKmNHKkF2SNyOPIB2lNBPt9if8kaL+cqulsR9lpghZUUUFUt5c7Q1n1eAQA==
X-Received: by 2002:a17:90a:256b:: with SMTP id j98mr598491pje.83.1597374310653;
        Thu, 13 Aug 2020 20:05:10 -0700 (PDT)
Received: from sol.lan (106-69-161-64.dyn.iinet.net.au. [106.69.161.64])
        by smtp.gmail.com with ESMTPSA id z3sm6522231pgk.49.2020.08.13.20.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2020 20:05:10 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v4 13/20] gpio: uapi: document uAPI v1 as deprecated
Date:   Fri, 14 Aug 2020 11:02:50 +0800
Message-Id: <20200814030257.135463-14-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200814030257.135463-1-warthog618@gmail.com>
References: <20200814030257.135463-1-warthog618@gmail.com>
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

