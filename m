Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53A9E25E820
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Sep 2020 15:49:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728627AbgIENts (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 5 Sep 2020 09:49:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728620AbgIENhW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 5 Sep 2020 09:37:22 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2696EC061249;
        Sat,  5 Sep 2020 06:36:57 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id g6so4315354pjl.0;
        Sat, 05 Sep 2020 06:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=s4z3c80rW1f77SHZ1DJfS7Y59f6hWqfux6WtIWEmMvU=;
        b=pmye0PpzFmNB1JsH8HxQ/dlynWGKMLFnhfGl4FAV0gwXJU5+ySddrKzsNzTG1guKVZ
         EeccRFMRg3u+U5IaT4jXNz9XhdIwto6YJwaEumovUuTq/M98JSpGoIhiycWLfNWwo00N
         gHOUChrAATqzGARMQyG5egN05jrF5i/Z68mH+JSC1B1pPnm0HhkNHgrJXDbOF6Q3rW4w
         RH7ceobyc+4HAJKezuZDJe2ZEA2hVhvmxqHgamWQobkFqnEuoiCm2D763VaU77wmcVqP
         1DHiwAHG7bC6qwWpnqWJNyUK0t8rSKstPC1r0bxVJHfocLFrw11cOeWOwGp+94FyWm8l
         gwpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=s4z3c80rW1f77SHZ1DJfS7Y59f6hWqfux6WtIWEmMvU=;
        b=nEI/h0TX85rkyqT+D+74MekrcSgLtSiHOpRxqVKjKjKArt5CfUNn18UOINNSXwNFze
         pTwMKwifJtRQVgVe0ZrqRHmrCIxRtznHMdkF2wFHng+mtAupFUa5NYtgc6X8nrJpQzNQ
         /y3lmV4G7XOrJxdjcTuz212Gha5suIl4i9l8Fp0R7HNRR0CeQlvQYGEQ167QK3jloPiG
         zvBJi9yxBa/ta5SSFXsnu/3L6UHveA51YEpSbakl+qJx1oOnELJTiAnC72F7Jka15w62
         0h1jYTF7B9Y5FIUAXOoyooj/SuPDawHONr/itx4TLn9bzheAleAUY0XRVremJvh9ZvPl
         +PTA==
X-Gm-Message-State: AOAM531R7vUFqPEYpBoduXcWmkRnw27hsizOIxS+Q9KIy9qp520b5U84
        5Nko5im4KnQg7DXXmYVsKrxLCxF/YTg=
X-Google-Smtp-Source: ABdhPJxi+jMAGUUjuJlo9I6PTRWi75G1O4mnyvE6RuLBUoxsiYseZk3bjFqsPRUPQedAnfqtbmBhFw==
X-Received: by 2002:a17:90a:d246:: with SMTP id o6mr5108343pjw.211.1599313016337;
        Sat, 05 Sep 2020 06:36:56 -0700 (PDT)
Received: from sol.lan (106-69-184-100.dyn.iinet.net.au. [106.69.184.100])
        by smtp.gmail.com with ESMTPSA id u3sm7556717pjn.29.2020.09.05.06.36.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2020 06:36:55 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v7 03/20] gpio: uapi: define GPIO_MAX_NAME_SIZE for array sizes
Date:   Sat,  5 Sep 2020 21:35:32 +0800
Message-Id: <20200905133549.24606-4-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200905133549.24606-1-warthog618@gmail.com>
References: <20200905133549.24606-1-warthog618@gmail.com>
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

