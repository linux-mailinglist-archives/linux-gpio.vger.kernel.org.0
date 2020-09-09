Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12D3D262D41
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Sep 2020 12:33:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726060AbgIIKdH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Sep 2020 06:33:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726426AbgIIK1X (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Sep 2020 06:27:23 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36D88C061756;
        Wed,  9 Sep 2020 03:27:22 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id d9so1775415pfd.3;
        Wed, 09 Sep 2020 03:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RcaJJxPUWfTCsa1mpxbpca/AYe7cJ1n1R+MIiQxItQI=;
        b=pAwh6s0ZhX/dx2v+cRVKexmSDgypMBJCX62gSOUF/5JhnI05C+V1ksmcny+VOeg56y
         YUOQKjFvVpzApRBarjbVtkG6g0VpeSMLwyX9yNxSzUNliX3SsvtH5c5fwVSTd3d/cqg6
         fXiTkzRhBfFS1LbVtMuVTeG+QvfBDw72aK9y8b1n9V9ythjo3OmCtnl7A4kBiAV5nVSw
         lWMyJGvfPOu2ISkma69nag+3kNrnz58daVNzFMkFqDbmK2MxjYPHmUYHYdtntgZAHv9r
         63swhIuBUzq3EOEbT6qguw6Q1MLXEGA6/YyOhxkADqSqzsl1+Fij/rFvSwpyaj71xFlf
         Q5Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RcaJJxPUWfTCsa1mpxbpca/AYe7cJ1n1R+MIiQxItQI=;
        b=UmLWULx8jcRCQfZSLByu6yesV90ub1GrCzcigDQ+I09WVZtfvg7CiRpohScR87DTrj
         zwvKMArooJMPrvaBcG/GaZQPNmZVzc/I//pIDlHHhpATEoh9UjusvuKyFrGx+qSM2VYA
         FIqgAy1vDvCgopeLOG8vhwl/NP9idB3hwTIQU/hrBq1+L9yjX5yPZzFOedrv0hGlWJ/6
         iD52DZn23ati47AJiu6uX12vVRMV3yIrh5a/RPbX+KFlrXS2fi4/i2H3n8bWXhjORlf5
         PPMKsRr6B5HrtNK1Ah3DMWE+AXClQ5I56CDmAT3YtBEncIAvjOWoEuItPujtKCZoxcoR
         eOhw==
X-Gm-Message-State: AOAM532StQ0oy/CHoKBM5EQZCDoTa2JTcekNBaGdWMU2Juqokto9TUcr
        Hn5Sa3a3sfkg42ArSuBSFWoe1Hc/9Xc=
X-Google-Smtp-Source: ABdhPJzNphsO89O9fpmMQbpmXnh+8CJpBZEbxMrCiNZIsEJsgbZHnhqHP8UWp774hxYM3uHLfeTVQw==
X-Received: by 2002:a62:be0b:0:b029:137:3e38:c5de with SMTP id l11-20020a62be0b0000b02901373e38c5demr323325pff.0.1599647241353;
        Wed, 09 Sep 2020 03:27:21 -0700 (PDT)
Received: from sol.lan (106-69-184-100.dyn.iinet.net.au. [106.69.184.100])
        by smtp.gmail.com with ESMTPSA id c7sm2338168pfj.100.2020.09.09.03.27.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2020 03:27:20 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH v8 02/20] gpiolib: cdev: replace strncpy with strscpy
Date:   Wed,  9 Sep 2020 18:26:22 +0800
Message-Id: <20200909102640.1657622-3-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200909102640.1657622-1-warthog618@gmail.com>
References: <20200909102640.1657622-1-warthog618@gmail.com>
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

