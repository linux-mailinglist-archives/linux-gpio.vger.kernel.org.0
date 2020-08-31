Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C919257219
	for <lists+linux-gpio@lfdr.de>; Mon, 31 Aug 2020 05:21:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727846AbgHaDV4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 30 Aug 2020 23:21:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726838AbgHaDVs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 30 Aug 2020 23:21:48 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CB0CC061573;
        Sun, 30 Aug 2020 20:21:47 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id mw10so2259730pjb.2;
        Sun, 30 Aug 2020 20:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=s4z3c80rW1f77SHZ1DJfS7Y59f6hWqfux6WtIWEmMvU=;
        b=QBcYBrykVgceqsMHplHHmauMcT+hfCWitLlosKJrBTnrq8+AMbi2I1V2j25ewurtoU
         1AARVptcvo99ojPg1+dIvNZPHttlrt6nNDc8XevUvar9kWGwCXwbmhfUYXlYeR9kSrGL
         OD4bUzL5cOSWL72Nnt5VKhl62/fY4Z/jdc96iZ/b10kT/CyRZu+qp/7kfQghgGV+2xCa
         d6WjYWufWqV3Qef+5K2uOHTxh3sHaXFtMvY+e0UObojO3l80x0+hqHwRpFfnb5ope9ZK
         lS/+GXLtt1LZValWKUwIwDxguQWp6JPz+pVEwclYMgXRg0uOiDEVCN4VKZOWlRSytqmw
         S+Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=s4z3c80rW1f77SHZ1DJfS7Y59f6hWqfux6WtIWEmMvU=;
        b=rpaRkuWekzFFDqZLyrVupE0MDB+Dyt7AV2qwT+PsJ1sDe0VEZTPykC3kOQ30gEfV0H
         Eld4mTVEducBxpgueDFgbWO7Ws8gtC9aIEfR0r21134f0H5ckTBqE4t/ejAUnMjZw/Qa
         d6u7B899U3Htd10bfISuOljDkHl3bH1mmL+vUAq+6Srk10Htc+WDblIw5pw1Gr3XEUNy
         11EBnzdahJn5wL2skzALM3WGu+Coc8byg0kswVLeyXoxe38OA2NOxmyYCaNvfa/geMry
         DwBq4QoGBqnPy8kJrhdKq33KPuqQzcx4l6vqGZCJq9WCpWW7VNw1fwrd10Fuul+Lgxhc
         Y6bw==
X-Gm-Message-State: AOAM531Ptm5fAluPefK25osCiG/V5V7ThJ7OPS1hMWR6fDxn8ElUU5CS
        MBl4Fu5U3OtoK1cD4AcUlcTaALKVHNs=
X-Google-Smtp-Source: ABdhPJz43QLsSpNba7wyGJjB9+wFEvcnTc/cWj/ZPf+20prXgwMFbege2fFHiC29pFyiLm3CYiMSFw==
X-Received: by 2002:a17:90a:7f8a:: with SMTP id m10mr9357767pjl.47.1598844106799;
        Sun, 30 Aug 2020 20:21:46 -0700 (PDT)
Received: from sol.lan (106-69-184-100.dyn.iinet.net.au. [106.69.184.100])
        by smtp.gmail.com with ESMTPSA id z17sm6095733pfq.38.2020.08.30.20.21.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2020 20:21:45 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v6 03/20] gpio: uapi: define GPIO_MAX_NAME_SIZE for array sizes
Date:   Mon, 31 Aug 2020 11:19:49 +0800
Message-Id: <20200831032006.1019978-4-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200831032006.1019978-1-warthog618@gmail.com>
References: <20200831032006.1019978-1-warthog618@gmail.com>
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

