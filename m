Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED1672738A5
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Sep 2020 04:34:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729755AbgIVCem (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Sep 2020 22:34:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729379AbgIVCel (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Sep 2020 22:34:41 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9D12C061755;
        Mon, 21 Sep 2020 19:34:41 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id d13so10704546pgl.6;
        Mon, 21 Sep 2020 19:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7Xmm15LbmubgcaoAcN8p4xddZgeXjh2diqDOrXM5Y2w=;
        b=TWxzY2Ozgaap2rT8tDvWGATVrUbIUHYO4E5+AtPyiDJDNoeT2WjtEbz8QfQGxfR61g
         /iEQKpg1bacid7O84TNmie/x8bFooPiF8rxHOyofeoi8Sl1xvO4YD72XFHGkwdIhUJXO
         vcog+LYMfNCnrVBJK/x1gS9x7RvIw8buXprTM/d/AnGcl8+STYITumxZU2wLBmFVw8PR
         qnsRVCYZGoKcbw0HAb1i7y86rFD8lxWRdAGgwwQInVHMIIx5DOuFBkOWP9LA0jtzmXf3
         fS1uRi70dkroasoLPx2dkegZuy4mhf+Kv52H3Cak/4joElcc7eTsoq4YG/uobt0oOvdo
         KUKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7Xmm15LbmubgcaoAcN8p4xddZgeXjh2diqDOrXM5Y2w=;
        b=Z1mNs83FU7G4Js8pSYSYuDMNN25aDxcI2hlnWnxsS/ErXqJhZisPSk+shRWYemoMJc
         H2AtV2jpNdDsDd8+fxVzNdt/ezYFop3rJWr3A9UDyW22mR89Y2DoumUY3udqwHq05J4C
         TGYVV4EWhmY72U+rfAWtCV6X4ZdPTy2HBkZDrL7GwgZvIk4EQa/3VOrgwtpQHdy1X/Bo
         LDsHY6S7IE6OVg3GpkkJg7zc3N4oBuYqC+mSOnsaRy5S9crSG6unrj/zc5k8ZnAkZrCi
         +ETWj/4cUSLzqyp0QTgm/pVkBslk8TbYFb1wllKhg5QxinshpSpRxur7KaqVK+j4V0qy
         bK2w==
X-Gm-Message-State: AOAM533PQqly8pg9/U7ThKjexhSDZ9ORXN8rSeUksXnkGQBjzKB56YAH
        byAvLK450PT8UsK8vVJgwKOK9ZEfc0plPw==
X-Google-Smtp-Source: ABdhPJxZePIAYRwYIfS7jnWMgPAWakwPYOITQgKEIo43izGVfAGznhzr2w8+/pcTlnAQ9sDv9d1j8w==
X-Received: by 2002:aa7:8e9a:0:b029:13e:d13d:a050 with SMTP id a26-20020aa78e9a0000b029013ed13da050mr2342707pfr.22.1600742080948;
        Mon, 21 Sep 2020 19:34:40 -0700 (PDT)
Received: from sol.lan (106-69-189-59.dyn.iinet.net.au. [106.69.189.59])
        by smtp.gmail.com with ESMTPSA id j19sm13321390pfi.51.2020.09.21.19.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 19:34:40 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org,
        andy.shevchenko@gmail.com
Cc:     arnd@arndb.de, Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v9 03/20] gpio: uapi: define GPIO_MAX_NAME_SIZE for array sizes
Date:   Tue, 22 Sep 2020 10:31:34 +0800
Message-Id: <20200922023151.387447-4-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200922023151.387447-1-warthog618@gmail.com>
References: <20200922023151.387447-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Replace constant array sizes with a macro constant to clarify the source
of array sizes, provide a place to document any constraints on the size,
and to simplify array sizing in userspace if constructing structs
from their composite fields.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
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

