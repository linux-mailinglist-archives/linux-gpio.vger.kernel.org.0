Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D5E5257218
	for <lists+linux-gpio@lfdr.de>; Mon, 31 Aug 2020 05:21:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726984AbgHaDVo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 30 Aug 2020 23:21:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726838AbgHaDVi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 30 Aug 2020 23:21:38 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2937C061573;
        Sun, 30 Aug 2020 20:21:37 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id c142so3726129pfb.7;
        Sun, 30 Aug 2020 20:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RcaJJxPUWfTCsa1mpxbpca/AYe7cJ1n1R+MIiQxItQI=;
        b=aTI7a2AU4hxZdi+i7/z9kbwoB9GJNpqWiuKDO7BeND95OxdHew4eUuOlqpacA7Ol1E
         4K9+mnRroycBM2xnBlGXu35ltuY4K0nh8+G8L56a56SfUfdvFv2U8YRZ2iQT9ZRF2I+4
         69N/EdEGMc6yGWzdZAGnci9ASNMM3iNuq5EGEKrq9YDtuk6jN/mDGjw43tWfGaCJySHH
         RPFUyZAM3D4o1LH+eLBMSvpN6bNpFXhJDLXsYB4Dw0YbtR1vpxkOgog2L7F3TnBnfikp
         MfCPRSOPyGuaZL9+egRF9uxak365/EAwPIr/IFkyDtnFWpxS7s7RT6rGF+EiJC030umk
         kYCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RcaJJxPUWfTCsa1mpxbpca/AYe7cJ1n1R+MIiQxItQI=;
        b=JPDROGSRm1Saa438RnXAmeWQzphOzhZ+d8j0VxOFW+jZSePpDrPkUNaPkNePObiG2o
         ZcIyEEgdLPY5E/1HTd28/pO+2xsqCvxWShFnzoxTZ4hCAKjH0yESQKU9Vgg/3drCsdir
         ZGBdNu098S3n2qSfP1mVPOm37cxrDZ7qkzScxe4++YnTU5BThY/u9oakt0QhFGGjMww9
         GM3Afmz/r+zq3o9cYCAKwFjOLXbP59JJQ+ou+1xXL6NodaawDd6hdILchUeC6W7/8gRY
         Lv/vHONs+egUqgg9Y8nfecdnk/8eNqp4YoIahSSsSr5+4zv+fWTplrcHuhBgnEEpCcVI
         Y8YQ==
X-Gm-Message-State: AOAM5332agqIWZORhv2050xINEmfyePqljQyrUomTenLeTkw3IToEkQU
        8gLECswHajKeA4mMLDlJYYKXI8Zv2j0=
X-Google-Smtp-Source: ABdhPJxRxXAM762RhzXObR884gp0m6R5ZtMso8+dFTBuFlzmQ3bvCQ4dUYoeNua7zJPQDXx5yOgo1w==
X-Received: by 2002:a63:6c0a:: with SMTP id h10mr6864869pgc.11.1598844096832;
        Sun, 30 Aug 2020 20:21:36 -0700 (PDT)
Received: from sol.lan (106-69-184-100.dyn.iinet.net.au. [106.69.184.100])
        by smtp.gmail.com with ESMTPSA id z17sm6095733pfq.38.2020.08.30.20.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2020 20:21:36 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH v6 02/20] gpiolib: cdev: replace strncpy with strscpy
Date:   Mon, 31 Aug 2020 11:19:48 +0800
Message-Id: <20200831032006.1019978-3-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200831032006.1019978-1-warthog618@gmail.com>
References: <20200831032006.1019978-1-warthog618@gmail.com>
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

