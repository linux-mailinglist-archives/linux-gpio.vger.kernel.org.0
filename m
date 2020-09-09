Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55085262D09
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Sep 2020 12:27:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728363AbgIIK1c (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Sep 2020 06:27:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728325AbgIIK12 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Sep 2020 06:27:28 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3998CC061573;
        Wed,  9 Sep 2020 03:27:28 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id t14so1734866pgl.10;
        Wed, 09 Sep 2020 03:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=s4z3c80rW1f77SHZ1DJfS7Y59f6hWqfux6WtIWEmMvU=;
        b=IqzWNR9DDHLCcsVJA8mCEA2kZlg3WOXKJLRSNGXE2gwK9ZlIQ0jhWXcrL0BX6gwaS5
         TjvNGur4lD67arunDUpBF+PeTUIr7Bd/NIamSNmWMnxJQvuN8dO13r1NSxx13uCuI5c1
         rSdn7WZJFvYNt+uCOIsPWlFkUoGrSb/bEXeqyeSpD6hOJc/N23KMXeOC84AxMZpzyyPW
         qw9M86JM5VyZxBTTKBtOXtDvi8rU59BrNzfKyY+LU+cVW5Pm7OAiHbMTjpZlh/Y3Zqda
         LcTVpTY8/LnC60YQV8onU/SqH112lKnGmVJOtYMNQN2bhWykE4vFYAza7QuTOmIshw9u
         M1tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=s4z3c80rW1f77SHZ1DJfS7Y59f6hWqfux6WtIWEmMvU=;
        b=h9iSi6iCBaacw9do46c8HQvmVu85yos1/xEMp+xRH0qRuGSsH8TH0EtwfLBTkRxL+Q
         31Dymg5xubTdjL2tdvaLDJqssPyxa29Lc5shXVnsBACfVKPmROdZZUHYDZHUIWQuA9kx
         cD7484nH29vhdydAyUlS8P64G7G8TBYsE82s5/r2kK4YExzJBVt+fEIVI6U1s49w3CYc
         0/pH7LUCv7CGuehfB2y482Hqau2EoaPwJ0apQJOFmDskcY9H1PSXM8bUNb9044jYxgIG
         Qklt6BGh4qPM4Z+eFzte/nNIeI5PKPhhcXICg9PMdzl7mdFBiBcsvloyhwFJ5zsY3Y6w
         l7Ag==
X-Gm-Message-State: AOAM5313Rq5FbFmHtlaO8sz5fkSQhMgsW1PeMNwGRxYWxj8da2OujlMj
        l1pvOMj0jfB+A+m+wDhNGTTAB7eQkWg=
X-Google-Smtp-Source: ABdhPJyBMxDEFwSxUV6Ep/vCfE6CRq0DIzqlW3B13ZAW9nUAebAMlgBolla95TF8kST/PTQM9zAbTQ==
X-Received: by 2002:a05:6a00:16c2:: with SMTP id l2mr244712pfc.112.1599647247314;
        Wed, 09 Sep 2020 03:27:27 -0700 (PDT)
Received: from sol.lan (106-69-184-100.dyn.iinet.net.au. [106.69.184.100])
        by smtp.gmail.com with ESMTPSA id c7sm2338168pfj.100.2020.09.09.03.27.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2020 03:27:26 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v8 03/20] gpio: uapi: define GPIO_MAX_NAME_SIZE for array sizes
Date:   Wed,  9 Sep 2020 18:26:23 +0800
Message-Id: <20200909102640.1657622-4-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200909102640.1657622-1-warthog618@gmail.com>
References: <20200909102640.1657622-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Replace constant array sizes with a macro constant to clarify the source
of array sizes, provide a place to document any constraints on the size,
and to simplify array sizing in userspace if constructing structs
from their composite fields.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 include/uapi/linux/gpio.h | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/include/uapi/linux/gpio.h b/include/uapi/linux/gpio.h
index 9c27cecf406f..285cc10355b2 100644
--- a/include/uapi/linux/gpio.h
+++ b/include/uapi/linux/gpio.h
@@ -14,6 +14,11 @@
 #include <linux/ioctl.h>
 #include <linux/types.h>
 
+/*
+ * The maximum size of name and label arrays.
+ */
+#define GPIO_MAX_NAME_SIZE 32
+
 /**
  * struct gpiochip_info - Information about a certain GPIO chip
  * @name: the Linux kernel name of this GPIO chip
@@ -22,8 +27,8 @@
  * @lines: number of GPIO lines on this chip
  */
 struct gpiochip_info {
-	char name[32];
-	char label[32];
+	char name[GPIO_MAX_NAME_SIZE];
+	char label[GPIO_MAX_NAME_SIZE];
 	__u32 lines;
 };
 
@@ -52,8 +57,8 @@ struct gpiochip_info {
 struct gpioline_info {
 	__u32 line_offset;
 	__u32 flags;
-	char name[32];
-	char consumer[32];
+	char name[GPIO_MAX_NAME_SIZE];
+	char consumer[GPIO_MAX_NAME_SIZE];
 };
 
 /* Maximum number of requested handles */
@@ -123,7 +128,7 @@ struct gpiohandle_request {
 	__u32 lineoffsets[GPIOHANDLES_MAX];
 	__u32 flags;
 	__u8 default_values[GPIOHANDLES_MAX];
-	char consumer_label[32];
+	char consumer_label[GPIO_MAX_NAME_SIZE];
 	__u32 lines;
 	int fd;
 };
@@ -182,7 +187,7 @@ struct gpioevent_request {
 	__u32 lineoffset;
 	__u32 handleflags;
 	__u32 eventflags;
-	char consumer_label[32];
+	char consumer_label[GPIO_MAX_NAME_SIZE];
 	int fd;
 };
 
-- 
2.28.0

