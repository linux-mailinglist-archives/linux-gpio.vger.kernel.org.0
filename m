Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC6A227A4D5
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Sep 2020 02:31:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726604AbgI1AbP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 27 Sep 2020 20:31:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726387AbgI1AbO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 27 Sep 2020 20:31:14 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF5DAC0613CE;
        Sun, 27 Sep 2020 17:31:14 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id s31so2531812pga.7;
        Sun, 27 Sep 2020 17:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=n/qd/Q8kwQyOh0/mMVICaic8kPdt+pWRcMGx87GUK6k=;
        b=Y6XxYkB6nz3ZbHr0k+NO+bS1nXF751ze2MjXXsVhPV4Dezdt/mUNliDi7kk1KvZZsx
         eaq3qizPbmThYvT0BYbSe7X4mB3anh8crdkjYu4uR4wsOdwlO8jGYlhsEk/PWV08f/f7
         QMDfG++y4TnNsXgkooYcHgsmqGlSB+KSgkKFKVHELGeTLZbnEy3znQw2SSsOzJbS2m8V
         Wsz+kEN764rIO8PEK+Py8k+XW1jO8s7JeJVoUZMcG/mu+9FM1qMNBzYncojrvHiJdAXO
         gcn1gFTLgOGmy6D0LVTG+Mf9oFGYje5ffKoQru8BObRD9MHcMe3KInZ2v6eT+B0AL4yZ
         MCYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=n/qd/Q8kwQyOh0/mMVICaic8kPdt+pWRcMGx87GUK6k=;
        b=Jahnx6asySbV3GOM+xXC1otsarXy+eMq2cEAE9ZgbOtx00O/YpFY2jZ+atnCzHvnil
         3GQzVFZeG3un+J0bVnWv7TCVEV/1CXkdsJlZ/nbIuuNElG/26zg38YCbSg/pLOwg07fC
         4iAtL1EMqxjEysWRjl55l12k6xothVlWNs2oygOHNVIOwxdoetEJeasKy3frPQDuF+BK
         ewatz66pa9otuW9ERHxBaLZClMjpVLQbDuAWh9wqCOSwRArtdCJQ4B89SEK9c1dMZ2Ke
         JsdbObJq3icYYUy4au8rALOWOjIgQdg/PhK42mOeLcEVBBb2Rzx9Mp94ffW+HQ/s4JSQ
         dNDw==
X-Gm-Message-State: AOAM531K2iXbNtuJKgxD3qlNCawfflUEkwYliWLk7rHvsAB/W17kWYG6
        7Lig945x44GWaoSiDznXnZq/WKcHZF/DgQ==
X-Google-Smtp-Source: ABdhPJyFvtVxIXuqXOLghHG8XI8NwIrEtpG1e1LiGg0OIfafRdwLOLriwYcAObE8lvG5pxZ0hY+Ddw==
X-Received: by 2002:aa7:85d4:0:b029:142:4339:42ca with SMTP id z20-20020aa785d40000b0290142433942camr7989215pfn.5.1601253073818;
        Sun, 27 Sep 2020 17:31:13 -0700 (PDT)
Received: from sol.lan (106-69-171-132.dyn.iinet.net.au. [106.69.171.132])
        by smtp.gmail.com with ESMTPSA id o20sm8443783pgh.63.2020.09.27.17.31.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2020 17:31:13 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org,
        andy.shevchenko@gmail.com, arnd@arndb.de
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v10 13/20] gpio: uapi: document uAPI v1 as deprecated
Date:   Mon, 28 Sep 2020 08:28:00 +0800
Message-Id: <20200928002807.12146-14-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200928002807.12146-1-warthog618@gmail.com>
References: <20200928002807.12146-1-warthog618@gmail.com>
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
index 5904f49399de..07865c601099 100644
--- a/include/uapi/linux/gpio.h
+++ b/include/uapi/linux/gpio.h
@@ -292,6 +292,9 @@ struct gpio_v2_line_event {
 
 /*
  *  ABI v1
+ *
+ * This version of the ABI is deprecated.
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

