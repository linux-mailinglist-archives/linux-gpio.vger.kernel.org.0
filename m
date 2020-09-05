Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFEEA25E821
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Sep 2020 15:49:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728649AbgIENtu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 5 Sep 2020 09:49:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728608AbgIENgv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 5 Sep 2020 09:36:51 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 586DBC061247;
        Sat,  5 Sep 2020 06:36:49 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id m8so6166073pfh.3;
        Sat, 05 Sep 2020 06:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RcaJJxPUWfTCsa1mpxbpca/AYe7cJ1n1R+MIiQxItQI=;
        b=MxwYv0ITKeCA6AbvehPS3/EpH1B+J3WBt3JiGsQmv0zOFjRlJUVuy2UsNZqx/G/NmL
         vwgTraIMLPWp0T6h9/TEeaLt0o04wzz8nUYcOUvLy5GcY77nd64GNS9H4F9/+X88dwd+
         5/HGua9nQHa45JzbY70HzJzLjtLqQ4IXMDHiEs1qyhC7g861cDVl+uY8DOxYp3UpOSpU
         OLEFkyGzXwC4Q6wQ66a1PW/guANKAVjGdXo2I1KVyMeGGlaJhNyqtXE3SvoGyoQAQ5co
         Zis68Uh+mGLooYDOstIO8h+FKKKDK/M4O7fG6J3FNRF3z8esT1BAUKDjf/oGa88pq5Sn
         o+dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RcaJJxPUWfTCsa1mpxbpca/AYe7cJ1n1R+MIiQxItQI=;
        b=g483qH6mfSZtnSgZ0k1eGl25g2bM5ARl4NPV0vU8cNlbN+bJ444jJXQ+MY35hH0JKJ
         VMW6fI2B2cCrJKDhNKBq6jmF7OCiFkukrlh0pIikxhxZXoR7F9J3kYkf7dFmnYKyQJTq
         OVqHTIONzXOQ3lKoXbtpV0Xh9XfE07VH3tf0gCb46TGgLN3U+OFySyxBW93MdClygKHn
         /vV8LaNPNHTm8/2g/mbVDgmyIxu1W1yWPe5u8li8kIF2I6pcZie00Gm2wvNkeWiK7fA+
         CCkqyZ55CW0CZBXXbDTDq7pIvE4v+8ahA6bmV5HhXJXG6axMp+8nXuYLnK2m+ZJC52Ok
         nbBQ==
X-Gm-Message-State: AOAM532Nme+4xw5nXOkCShKD7P8W+V/prdqv+YyABWLr1KRgNXzJQ5k+
        NI+rl/vN9TB1WMrvSbTyfzH0RgP4JSo=
X-Google-Smtp-Source: ABdhPJx7XI1k8duSH7TonjgkaAMF8gNmVTjBxl1RvGGdHzW3lXEDxC+nulnptfK0TOIm/bkv7XTHmA==
X-Received: by 2002:a62:6845:0:b029:13e:dcd:75bd with SMTP id d66-20020a6268450000b029013e0dcd75bdmr275980pfc.12.1599313008475;
        Sat, 05 Sep 2020 06:36:48 -0700 (PDT)
Received: from sol.lan (106-69-184-100.dyn.iinet.net.au. [106.69.184.100])
        by smtp.gmail.com with ESMTPSA id u3sm7556717pjn.29.2020.09.05.06.36.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2020 06:36:47 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH v7 02/20] gpiolib: cdev: replace strncpy with strscpy
Date:   Sat,  5 Sep 2020 21:35:31 +0800
Message-Id: <20200905133549.24606-3-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200905133549.24606-1-warthog618@gmail.com>
References: <20200905133549.24606-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Replace usage of strncpy with strscpy to remove -Wstringop-truncation
warnings.

The structs being populated are zeroed, to prevent stack leakage as
they are returned to userspace, so strscpy performs the equivalent
function without the warnings.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Kent Gibson <warthog618@gmail.com>
---

The memset in gpio_desc_to_lineinfo(), in conjunction with the strscpy,
is necessary as strncpy zero pads the remainder of the destination.
It also guarantees that the info cannot leak kernel stack to userspace.
This is useful here, but is even more important for the v2 info, that
this function is changed to generate in a subsequent patch, as that
struct contains padding and attribute arrays that also need to be
initialised.

 drivers/gpio/gpiolib-cdev.c | 23 +++++++----------------
 1 file changed, 7 insertions(+), 16 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index e95e3eab9867..8b012879fe3f 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -752,6 +752,7 @@ static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
 	bool ok_for_pinctrl;
 	unsigned long flags;
 
+	memset(info, 0, sizeof(*info));
 	info->line_offset = gpio_chip_hwgpio(desc);
 	/*
 	 * This function takes a mutex so we must check this before taking
@@ -765,19 +766,11 @@ static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
 
 	spin_lock_irqsave(&gpio_lock, flags);
 
-	if (desc->name) {
-		strncpy(info->name, desc->name, sizeof(info->name));
-		info->name[sizeof(info->name) - 1] = '\0';
-	} else {
-		info->name[0] = '\0';
-	}
+	if (desc->name)
+		strscpy(info->name, desc->name, sizeof(info->name));
 
-	if (desc->label) {
-		strncpy(info->consumer, desc->label, sizeof(info->consumer));
-		info->consumer[sizeof(info->consumer) - 1] = '\0';
-	} else {
-		info->consumer[0] = '\0';
-	}
+	if (desc->label)
+		strscpy(info->consumer, desc->label, sizeof(info->consumer));
 
 	/*
 	 * Userspace only need to know that the kernel is using this GPIO so
@@ -841,12 +834,10 @@ static long gpio_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 
 		memset(&chipinfo, 0, sizeof(chipinfo));
 
-		strncpy(chipinfo.name, dev_name(&gdev->dev),
+		strscpy(chipinfo.name, dev_name(&gdev->dev),
 			sizeof(chipinfo.name));
-		chipinfo.name[sizeof(chipinfo.name)-1] = '\0';
-		strncpy(chipinfo.label, gdev->label,
+		strscpy(chipinfo.label, gdev->label,
 			sizeof(chipinfo.label));
-		chipinfo.label[sizeof(chipinfo.label)-1] = '\0';
 		chipinfo.lines = gdev->ngpio;
 		if (copy_to_user(ip, &chipinfo, sizeof(chipinfo)))
 			return -EFAULT;
-- 
2.28.0

