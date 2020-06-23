Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8C3D204858
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jun 2020 06:04:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732357AbgFWEDZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Jun 2020 00:03:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732351AbgFWEDY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Jun 2020 00:03:24 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEB50C061795;
        Mon, 22 Jun 2020 21:03:23 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id u128so9247903pgu.13;
        Mon, 22 Jun 2020 21:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+kW864VZBEMSalv4BR4EqKVRUPzOGP1u8NMsK1NQ/ws=;
        b=gdajZ7xMPK0mLpLirrDDbV0d3rJ9oxl189kBoGbxoUONebK+GOt4eBnL0+1MFkz/zR
         Wl81a2GNMNXlNA/p08lltWI6xhqopJ5SDQq728duU8awuB56ZduuwuhgvTiOzpO2iEQM
         RoqXe4WtYLavTth8wO3G9xTzQY0s7ShP10KyE4pS9xn4efmHHOwKISkxK9nQnQbdejWf
         HS6+N7NKnozeiOqBz+fWnQ9LrhTH2eKJ2cGxJ9mt9G+LYQA4XUGO+E4h9o+0bwIx3uF0
         R68ZpGoUWniC0wH282fKC7fSZSll4YJ2LA/gljyskDAWiV8LprZOSgYmN6LW3/q8tplq
         uGWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+kW864VZBEMSalv4BR4EqKVRUPzOGP1u8NMsK1NQ/ws=;
        b=j3w/tohf0ExGDJUyRnJhLQ1mcrpDAhqnNWwZltwBm8Hxrb7mZBjEjYlY3rOyaAjFBW
         u7zLJ4k5VBLN3uo9IUrAY6E9dsHQSUrnBSEGVxZEG20SC32Fiec/WSp3Tw5/f8TZDcl5
         wV8hp4QXbdKJztUdab/c5tpu/nqj9kfOtCpFxssoOXg7xGvjKt/pm8alG8ObE1Nbneks
         fq4TPQXwcATJhcJDVOza/CTwNE74xn1NAv5+llsnA230ffqFlgmCkOJH17847Qz8lG/M
         tvcLSvaPoy0NhwrK7P8ze6UHqNuR0AOgb8AOIMlr+0JzgfUWY/BRrtsCU8SDuQNHApSG
         8NKw==
X-Gm-Message-State: AOAM533vSXTMTVqLlS6lr7MpBOjSm/3QBgyOweuykHSigTjj4Ls770aI
        LW6nhsdO0clTlFhpYdEjo3rbbz4XVGw=
X-Google-Smtp-Source: ABdhPJwLQILd6naRQA/C6iTsG37IZzSbRnvBzv+5fCGSk99RUcVfdgtO0wi2ka5vFTN/J5s3TS/Bng==
X-Received: by 2002:a63:4f1b:: with SMTP id d27mr15223800pgb.389.1592885002956;
        Mon, 22 Jun 2020 21:03:22 -0700 (PDT)
Received: from sol.lan (220-235-126-59.dyn.iinet.net.au. [220.235.126.59])
        by smtp.gmail.com with ESMTPSA id n64sm12442315pga.38.2020.06.22.21.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 21:03:22 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH 19/22] gpio: uapi: document uAPI V1 as deprecated
Date:   Tue, 23 Jun 2020 12:01:04 +0800
Message-Id: <20200623040107.22270-20-warthog618@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200623040107.22270-1-warthog618@gmail.com>
References: <20200623040107.22270-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Update uAPI documentation to deprecate V1 structs and ioctls.

Signed-off-by: Kent Gibson <warthog618@gmail.com>

---
 include/uapi/linux/gpio.h | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/include/uapi/linux/gpio.h b/include/uapi/linux/gpio.h
index e4ed6f79e332..752d63f56b0d 100644
--- a/include/uapi/linux/gpio.h
+++ b/include/uapi/linux/gpio.h
@@ -238,6 +238,9 @@ struct gpioline_event {
 
 /*
  *  ABI V1
+ *
+ * This version of the ABI is deprecated and will be removed in the future.
+ * Use the latest version if the ABI, defined above, instead.
  */
 
 /* Informational flags */
@@ -261,6 +264,9 @@ struct gpioline_event {
  * @consumer: a functional name for the consumer of this GPIO line as set by
  * whatever is using it, will be empty if there is no current user but may
  * also be empty if the consumer doesn't set this up
+ *
+ * This struct part of ABI V1 and is deprecated.
+ * Use struct gpioline_info_v2 instead.
  */
 struct gpioline_info {
 	__u32 line_offset;
@@ -292,6 +298,9 @@ enum {
  * guarantee there are no implicit holes between it and subsequent members.
  * The 20-byte padding at the end makes sure we don't add any implicit padding
  * at the end of the structure on 64-bit architectures.
+ *
+ * This struct part of ABI V1 and is deprecated.
+ * Use struct gpioline_info_changed_v2 instead.
  */
 struct gpioline_info_changed {
 	struct gpioline_info info;
@@ -331,6 +340,9 @@ struct gpioline_info_changed {
  * @fd: if successful this field will contain a valid anonymous file handle
  * after a GPIO_GET_LINEHANDLE_IOCTL operation, zero or negative value
  * means error
+ *
+ * This struct part of ABI V1 and is deprecated.
+ * Use struct gpioline_request instead.
  */
 struct gpiohandle_request {
 	__u32 lineoffsets[GPIOHANDLES_MAX];
@@ -350,6 +362,9 @@ struct gpiohandle_request {
  * this specifies the default output value, should be 0 (low) or
  * 1 (high), anything else than 0 or 1 will be interpreted as 1 (high)
  * @padding: reserved for future use and should be zero filled
+ *
+ * This struct part of ABI V1 and is deprecated.
+ * Use struct gpioline_config instead.
  */
 struct gpiohandle_config {
 	__u32 flags;
@@ -362,6 +377,9 @@ struct gpiohandle_config {
  * @values: when getting the state of lines this contains the current
  * state of a line, when setting the state of lines these should contain
  * the desired target state
+ *
+ * This struct part of ABI V1 and is deprecated.
+ * Use struct gpioline_values instead.
  */
 struct gpiohandle_data {
 	__u8 values[GPIOHANDLES_MAX];
@@ -385,6 +403,9 @@ struct gpiohandle_data {
  * @fd: if successful this field will contain a valid anonymous file handle
  * after a GPIO_GET_LINEEVENT_IOCTL operation, zero or negative value
  * means error
+ *
+ * This struct part of ABI V1 and is deprecated.
+ * Use struct gpioline_request instead.
  */
 struct gpioevent_request {
 	__u32 lineoffset;
@@ -404,6 +425,9 @@ struct gpioevent_request {
  * struct gpioevent_data - The actual event being pushed to userspace
  * @timestamp: best estimate of time of event occurrence, in nanoseconds
  * @id: event identifier
+ *
+ * This struct part of ABI V1 and is deprecated.
+ * Use struct gpioline_event instead.
  */
 struct gpioevent_data {
 	__u64 timestamp;
@@ -428,6 +452,8 @@ struct gpioevent_data {
 
 /*
  * V1 ioctl()s
+ *
+ * These ioctl()s are deprecated.  Use the V2 equivalent instead.
  */
 #define GPIO_GET_LINEINFO_IOCTL _IOWR(0xB4, 0x02, struct gpioline_info)
 #define GPIO_GET_LINEHANDLE_IOCTL _IOWR(0xB4, 0x03, struct gpiohandle_request)
-- 
2.27.0

