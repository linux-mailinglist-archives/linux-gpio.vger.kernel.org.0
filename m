Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A305622D4A1
	for <lists+linux-gpio@lfdr.de>; Sat, 25 Jul 2020 06:21:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726639AbgGYEUs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 25 Jul 2020 00:20:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725874AbgGYEUr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 25 Jul 2020 00:20:47 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E06EBC0619D3;
        Fri, 24 Jul 2020 21:20:47 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id f185so1406326pfg.10;
        Fri, 24 Jul 2020 21:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vmHhWGx/KVLPJ+Aj0FzEdCBeQVCDlXYeVMZf4UIryU0=;
        b=FDPQLDX87z+wffNmiV/oOvtjAJbV8XG0+u2YB7fBBmSAF9EnvABzIyHcIUlU8BLl06
         MSjO7P2h2J3dsFE38r8rY7N7blb88BViFbdmXkkzZLcJWaV2VaNtCXsbczDCYAgxapPR
         dzR1wFtsTQOUypVmMg3L/0GYkVTussfkrzaiF9yDTBzQPXhN4NWBwz0x3Ihp86YGT6MV
         2P6EWkYwTVY0YrUJ+xIn1EnHTQ9ubFBAZHzc04HT3B+FzqcaeqQOPriU/MHpafGJ69YX
         KmtXJSWA9A0HT93Z5hqDDGsQPu1uQWOPjqXIgt3Nhn0vGZGCB+upDAPFqBYZIA/I7/MI
         0MMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vmHhWGx/KVLPJ+Aj0FzEdCBeQVCDlXYeVMZf4UIryU0=;
        b=dMZFNt5wVREhQFo6INSZQo493AgQDg/Aeku2sSBIDO0gHTBlfIuSfTCVAEmj6KHjPW
         hnCSm9bXJucAKdLdZZnxYYe8fGEaw1OlL/pfnRsoAgI0agp8RVStfX2HyiYYAowcrO8P
         hXYYiJKR/Ru6TUabaSX2pgWUL4Hz5L2UPK7rIq0eyOZGcm1zXRjIldEg/LW4FEBNsDyk
         Rp+7A5XoTf1pdJyVy/HmY188E8Lgmkuo8F3d/EFIXE0ob6NwPPu3fobqkAwMgmjMAndF
         xdf+6jsFHZDtw8lX+G9YAztudfZaTE/sZ9hOKDRRbWe8pszUhSbOsdQiNRLZ/pIvTiXc
         xwQQ==
X-Gm-Message-State: AOAM530VvA3ZZI3teVOi/RzVnhrDz35EwO2llgL+97tqcXfeuWR1knoW
        AMvC0WI33IRn0ZC9SkSPJ0utO44o
X-Google-Smtp-Source: ABdhPJy3AAdZWuW44KNtF6OWyqysrlc9OnqXGWgAn0IZ2GlbskKHFRO4ytvMBBT+qek+8eOyGhdmiQ==
X-Received: by 2002:a62:8688:: with SMTP id x130mr11768529pfd.280.1595650847071;
        Fri, 24 Jul 2020 21:20:47 -0700 (PDT)
Received: from sol.lan (106-69-185-93.dyn.iinet.net.au. [106.69.185.93])
        by smtp.gmail.com with ESMTPSA id p1sm885320pjp.10.2020.07.24.21.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2020 21:20:46 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v2 01/18] gpio: uapi: define GPIO_MAX_NAME_SIZE for array sizes
Date:   Sat, 25 Jul 2020 12:19:38 +0800
Message-Id: <20200725041955.9985-2-warthog618@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200725041955.9985-1-warthog618@gmail.com>
References: <20200725041955.9985-1-warthog618@gmail.com>
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

This change is not terribly important for V1, but in adding V2 more
documentation for the usage of this value is appropriate.
As it is also used with V1 it warrants a separate patch.

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
2.27.0

