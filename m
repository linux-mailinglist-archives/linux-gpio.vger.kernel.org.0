Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D68782738C0
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Sep 2020 04:36:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729007AbgIVCgZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Sep 2020 22:36:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728750AbgIVCgZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Sep 2020 22:36:25 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7DAAC061755;
        Mon, 21 Sep 2020 19:36:25 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id k14so10694261pgi.9;
        Mon, 21 Sep 2020 19:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HWdFOGRMI91b7B+0vJAOwP+fW8WsK8xMK9Y3S/VkuhE=;
        b=p2iN1MJdOxmmKcvtWAKrT3bKwK8MFgLAQTgPYEQ7YKxGrTsn5AKlQHL/Fzl+U15Bxa
         r8mBbHgm35Z8UeE2dkVKcTAOtiWqz9b5zh86+Wkj+vn6rqKAShjSlEPdwaZ2PvcDmOuG
         N2UJcbQbaYUUoIrAcxl66C6IYqlk7dREBkVxiR6kC6RVGFo4AtfS4h3wOwwHDaWeAdij
         hR93cIgUzUzc98AgabAfHSbKPL9vWgVcqykXh3lFZDCZwJMW+L+nDgs83HiCNrgyOSqX
         lZalSALPkj7KEDAh8yV9F6h7KsJjvsuJPoAqs1YEKBPC1J5noVJtuYbu7u6R9lg3QAgc
         9Q+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HWdFOGRMI91b7B+0vJAOwP+fW8WsK8xMK9Y3S/VkuhE=;
        b=M/xv9yP8GPWjRN4DDFhNpjKimM8bCn3OZdqKpyjJxBzEBRq7vgWG0zSjetox+mC/dK
         5w+rAz6PNlr48jto3Crqzv0xe/db2yDdnj6/bAcE9iiJ0FVPUMs3LKl2ll5oTfCXThDB
         XdOKT2f3xM4EtHZGhkv1cXk0bDIcVIMpOkauBg1g2Igaz55G3xXjR5NgzfgPZsZfudHR
         s8EILxB7k2AK2w5/DCjoGqesyoiRWIL3anuSqKltm0azmhdOXfQMaNW3SvvNWeK4x88+
         mWHeCOSRb4Bhotnc5LfONLL1qOhGefmWF8WN+NLyIE/Kh1aNhSG5TfnQEs0f0nIplUwA
         leyw==
X-Gm-Message-State: AOAM533LlG1pkNchXgvFtOqKrMQEuIiaut81Z0m0hXzBcCk5J1UVEB42
        r9pB+PjNcIPaLlExl6Gx31a1ROt1SKggpQ==
X-Google-Smtp-Source: ABdhPJwqDsiX5jvCFwlHF2+cJMbgZarxNmanqcitJBDUtO1QXr+fqu8H+BecPENZSzsCZsgZDNLnoA==
X-Received: by 2002:a17:902:bc82:b029:d2:2988:43ef with SMTP id bb2-20020a170902bc82b02900d2298843efmr2635210plb.68.1600742184803;
        Mon, 21 Sep 2020 19:36:24 -0700 (PDT)
Received: from sol.lan (106-69-189-59.dyn.iinet.net.au. [106.69.189.59])
        by smtp.gmail.com with ESMTPSA id j19sm13321390pfi.51.2020.09.21.19.36.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 19:36:24 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org,
        andy.shevchenko@gmail.com
Cc:     arnd@arndb.de, Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v9 13/20] gpio: uapi: document uAPI v1 as deprecated
Date:   Tue, 22 Sep 2020 10:31:44 +0800
Message-Id: <20200922023151.387447-14-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200922023151.387447-1-warthog618@gmail.com>
References: <20200922023151.387447-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Update uAPI documentation to deprecate v1 structs and ioctls.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 include/uapi/linux/gpio.h | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/include/uapi/linux/gpio.h b/include/uapi/linux/gpio.h
index 5904f49399de..98d5aa88870b 100644
--- a/include/uapi/linux/gpio.h
+++ b/include/uapi/linux/gpio.h
@@ -292,6 +292,9 @@ struct gpio_v2_line_event {
 
 /*
  *  ABI v1
+ *
+ * This version of the ABI is deprecated and will be removed in the future.
+ * Use the latest version of the ABI, defined above, instead.
  */
 
 /* Informational flags */
@@ -315,6 +318,9 @@ struct gpio_v2_line_event {
  * @consumer: a functional name for the consumer of this GPIO line as set by
  * whatever is using it, will be empty if there is no current user but may
  * also be empty if the consumer doesn't set this up
+ *
+ * This struct is part of ABI v1 and is deprecated.
+ * Use struct gpio_v2_line_info instead.
  */
 struct gpioline_info {
 	__u32 line_offset;
@@ -346,6 +352,9 @@ enum {
  * guarantee there are no implicit holes between it and subsequent members.
  * The 20-byte padding at the end makes sure we don't add any implicit padding
  * at the end of the structure on 64-bit architectures.
+ *
+ * This struct is part of ABI v1 and is deprecated.
+ * Use struct gpio_v2_line_info_changed instead.
  */
 struct gpioline_info_changed {
 	struct gpioline_info info;
@@ -385,6 +394,9 @@ struct gpioline_info_changed {
  * @fd: if successful this field will contain a valid anonymous file handle
  * after a GPIO_GET_LINEHANDLE_IOCTL operation, zero or negative value
  * means error
+ *
+ * This struct is part of ABI v1 and is deprecated.
+ * Use struct gpio_v2_line_request instead.
  */
 struct gpiohandle_request {
 	__u32 lineoffsets[GPIOHANDLES_MAX];
@@ -404,6 +416,9 @@ struct gpiohandle_request {
  * this specifies the default output value, should be 0 (low) or
  * 1 (high), anything else than 0 or 1 will be interpreted as 1 (high)
  * @padding: reserved for future use and should be zero filled
+ *
+ * This struct is part of ABI v1 and is deprecated.
+ * Use struct gpio_v2_line_config instead.
  */
 struct gpiohandle_config {
 	__u32 flags;
@@ -416,6 +431,9 @@ struct gpiohandle_config {
  * @values: when getting the state of lines this contains the current
  * state of a line, when setting the state of lines these should contain
  * the desired target state
+ *
+ * This struct is part of ABI v1 and is deprecated.
+ * Use struct gpio_v2_line_values instead.
  */
 struct gpiohandle_data {
 	__u8 values[GPIOHANDLES_MAX];
@@ -439,6 +457,9 @@ struct gpiohandle_data {
  * @fd: if successful this field will contain a valid anonymous file handle
  * after a GPIO_GET_LINEEVENT_IOCTL operation, zero or negative value
  * means error
+ *
+ * This struct is part of ABI v1 and is deprecated.
+ * Use struct gpio_v2_line_request instead.
  */
 struct gpioevent_request {
 	__u32 lineoffset;
@@ -458,6 +479,9 @@ struct gpioevent_request {
  * struct gpioevent_data - The actual event being pushed to userspace
  * @timestamp: best estimate of time of event occurrence, in nanoseconds
  * @id: event identifier
+ *
+ * This struct is part of ABI v1 and is deprecated.
+ * Use struct gpio_v2_line_event instead.
  */
 struct gpioevent_data {
 	__u64 timestamp;
@@ -482,6 +506,8 @@ struct gpioevent_data {
 
 /*
  * v1 ioctl()s
+ *
+ * These ioctl()s are deprecated.  Use the v2 equivalent instead.
  */
 #define GPIO_GET_LINEINFO_IOCTL _IOWR(0xB4, 0x02, struct gpioline_info)
 #define GPIO_GET_LINEHANDLE_IOCTL _IOWR(0xB4, 0x03, struct gpiohandle_request)
-- 
2.28.0

