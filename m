Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8A832443B3
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Aug 2020 05:03:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726727AbgHNDDl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 13 Aug 2020 23:03:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726564AbgHNDDk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 13 Aug 2020 23:03:40 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BFF3C061757;
        Thu, 13 Aug 2020 20:03:40 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id v5so1381219plo.4;
        Thu, 13 Aug 2020 20:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=s4z3c80rW1f77SHZ1DJfS7Y59f6hWqfux6WtIWEmMvU=;
        b=jE56/qNS2bR2eU/znoGV6CpLP/o/OxHAV7hxz27u+pQJgrjwR0rrwTLvEKS/buhcNp
         0TYpM+FeHKK3knW1+S+DcLD7UcvslV2WSB8A6zrYREsGr5R8uyASKqg5i7Vm+D6cp55F
         KUxt+BVIYKnPqpN90JwU60FDmEpUdEfVSEZkYFame9ShRYi991AmZ7s4OaoG/OjivJHd
         Ph5lxUv/MhYDOp/zElspaZl7ROy1q2H5DM6MHkoBECCwdzAtnBV9rbkygk9K3xx9yQf0
         1O+6xWcugPAoIl6FdjNw3bjCteX/JW3SWYRNEH7OqvHuHHSaTZ8HsWfl38xoL/81lzGz
         yHbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=s4z3c80rW1f77SHZ1DJfS7Y59f6hWqfux6WtIWEmMvU=;
        b=Y1AgtAkXe8PwQXkB92Nt9c5OcCHks4VuBTNJdZ1eUol0x9JbUMIDHFZ7/pDUh1Adgu
         LZ0twysFM0Daqz7MA0QCrVSchWFil1Q8Ry2kr/KyZvkH0Uc176heqMyUVkUqpgC3uVhp
         mQ1X3xt3czDzZfLmk9ovw1Sub75rU4ajxVxM4etp4cuVXm+nqKNwKkX1euAYdOB4qVCV
         0s/ZE7OEsORCP6KL8FU7oQLOJz68ZEdCdVEFyNiTlmu74komJ9gqSfrvhW8n3ngC9hiA
         SnLZlRRFZALYkpTbEhnwOguAS+YiVnd725qxEE3UPgFQq/3BUTy3xf48ot+utJSZUgsO
         LFEw==
X-Gm-Message-State: AOAM533HOV/f0yil/rOVNjSUkhzNlxNKERe0juWUm2tCa6Rs/aZ+ulOS
        oKWHtBWzcJegqvvn8/CAJgrhGY1j
X-Google-Smtp-Source: ABdhPJzgr/sNJhj12Zn2keI64vzZMXkJj/QXCSoZ+heE3pk5VkzrBYgkAclOw9nn0Q86QMy2aYAeeg==
X-Received: by 2002:a17:90a:e50d:: with SMTP id t13mr571289pjy.33.1597374219770;
        Thu, 13 Aug 2020 20:03:39 -0700 (PDT)
Received: from sol.lan (106-69-161-64.dyn.iinet.net.au. [106.69.161.64])
        by smtp.gmail.com with ESMTPSA id z3sm6522231pgk.49.2020.08.13.20.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2020 20:03:39 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v4 03/20] gpio: uapi: define GPIO_MAX_NAME_SIZE for array sizes
Date:   Fri, 14 Aug 2020 11:02:40 +0800
Message-Id: <20200814030257.135463-4-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200814030257.135463-1-warthog618@gmail.com>
References: <20200814030257.135463-1-warthog618@gmail.com>
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

