Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D43D27A4C0
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Sep 2020 02:29:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726589AbgI1A3O (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 27 Sep 2020 20:29:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726393AbgI1A3O (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 27 Sep 2020 20:29:14 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AEFAC0613CE;
        Sun, 27 Sep 2020 17:29:14 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id n14so7749682pff.6;
        Sun, 27 Sep 2020 17:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7Xmm15LbmubgcaoAcN8p4xddZgeXjh2diqDOrXM5Y2w=;
        b=FnTt14djxHJAdf7yF1iDMqsEgp8UOZGjwgHBgjTFK2uhnrgOdPipcs1c3xLY7uoeau
         /k+IQq6tukbuuXf5uXk8rX+W47nMH+rSx695kbBGgcp6Q+UCUAZoDKnG1KDLZR8Lzo3q
         EZspUjDxBrQxll+H9Q+LbKobab57/J8OLEziwpr8YuN6syiEmk+Jjc4bo0peI5A/4WUt
         s0oLaNtR9KDtgR+ZJCaKQpuGCsFmZaCetPg5xPCg9jeDMLJxaVUlGdS8DqSPkMjjzN+5
         yHlo3THul0K9jHbsk+l9apL8AsCTGIFSJ3heumR8GASbdXO+Q6PGDvckny+yNaq1kIso
         gJbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7Xmm15LbmubgcaoAcN8p4xddZgeXjh2diqDOrXM5Y2w=;
        b=owbTQEXjkFLW0/qSV03HPGRpQvhgz6nXo8SPyDUFwzjlBq+Vvtg3Dx5haOOzruwAK4
         zGEz3xtXwu5hsylpk8h1fklhjVovlDJW6oXrTK0TPu0bEZIIfLxgqFBocEGFPx/svRNT
         0Zshebs1EyLKEbaeIK0QUd1dZetoX0Zfbdstrk3t4HgiBSsNCO3pVpdiP1mLTKXOxtCD
         CFg/wOS4x5ysyXJSsf6UFmcAA1QaIEktwrXNrJ37YrhOKtKghwiHkQhW6bbuXgfbWzOr
         BO8TVyOthFwFYRTAzL9WRWwSH7El8Hm2vmi/1RPbUw+WQU+zbOaMI3xxfeK6+fqY8McP
         vfDw==
X-Gm-Message-State: AOAM532h0kB4wnYjAbTBcFVbo/rcJ8kiCR0KudHpHiKJteONxT18RhoR
        C0sZ30W50njuvEELZrWzS/+kHaKrYFAYHg==
X-Google-Smtp-Source: ABdhPJy0SL9NcxXndhVclm/2wuttmofXb1UJYvLYIjsZA702aSmwpHbPb801x9qVmTrbHYd7bW9Dig==
X-Received: by 2002:aa7:96f1:0:b029:142:2501:39ed with SMTP id i17-20020aa796f10000b0290142250139edmr7893101pfq.60.1601252953289;
        Sun, 27 Sep 2020 17:29:13 -0700 (PDT)
Received: from sol.lan (106-69-171-132.dyn.iinet.net.au. [106.69.171.132])
        by smtp.gmail.com with ESMTPSA id o20sm8443783pgh.63.2020.09.27.17.29.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2020 17:29:12 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org,
        andy.shevchenko@gmail.com, arnd@arndb.de
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v10 03/20] gpio: uapi: define GPIO_MAX_NAME_SIZE for array sizes
Date:   Mon, 28 Sep 2020 08:27:50 +0800
Message-Id: <20200928002807.12146-4-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200928002807.12146-1-warthog618@gmail.com>
References: <20200928002807.12146-1-warthog618@gmail.com>
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

