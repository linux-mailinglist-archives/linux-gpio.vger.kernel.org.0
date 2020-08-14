Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E33AE2443B1
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Aug 2020 05:03:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726690AbgHNDDd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 13 Aug 2020 23:03:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726564AbgHNDDd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 13 Aug 2020 23:03:33 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AD72C061757;
        Thu, 13 Aug 2020 20:03:33 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id y206so3845867pfb.10;
        Thu, 13 Aug 2020 20:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wJ2LgLWLDnEe7sclGO7e9++McxVbFk4TMB6wGucpVAo=;
        b=AxFm7VzZAY2MabY2l36y+a/zeZrVntbmos/mHJsl9xmGIcvXXid1mMlDXiCe9MZRP+
         gjZP+rXhYS7vGF+7cl2cNsAap3RD4LmauIoNrZ5nPbWUgqeRjPlWC2TAxoTG4zdX8f6D
         22UnQp18bFESURChAnwpQrO0JVd8vjS0nM4EMNzWKBiB07CZylAXXUr/fpG6VcL9g9FX
         id9hu6ye6/QcA6wMu/QdVg28twbxFrKIkvkzLq369uB9cXlFM7nrtW9+QQAyoMGSHDOB
         12H7SmtRQY8GjDkSEdbqYZooHQRj8afQLz4vzAb9BxkKHoiFb/qNXRhQ7l1Mgh+CHhzF
         gbMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wJ2LgLWLDnEe7sclGO7e9++McxVbFk4TMB6wGucpVAo=;
        b=mPxMLHpi1SPFl1RCkN90Rmaz6Dyppa6ZazAhkXzEO54Eb8Rs6YhyQxX1HQcrvqW7V+
         Hl4lOeIYhSfvoKJ595TBQuo6IG4YfU9x79Fvz+oDeHtKndc+pOa3KhsC8hgUhMeMyq/G
         37Z7DaM7UmbcWAAPPPBIJksxyusCjgHCWXAchKYoyizuk0hVlWl5/bSdXTpUkp/BRK25
         NRI6qUo1qfLS8IJvIiEu4LA0G1HnNuEtN4KfH5NEOi4Win4TmDqx0bCjfvbsswmZ0yde
         y9EiLETDfYT1SnZvmyfS3+TFdyDBvCuUI0kCqKRmybSBlw6ydM+QK/CgEwmtD6x2LUtV
         odGA==
X-Gm-Message-State: AOAM530IKKCDrf47bfrbzqm/efHjLWz5gdqEQ8AVA20QImW2DkzQNavh
        jmEV9N1ndVPf11JcJWoj6In5Dl0L
X-Google-Smtp-Source: ABdhPJxSTTYTxMzQ5Y1e5H6zd176dCDESyH0AdZ3+KbOgevkhR2TVhsDFP5tLNGLja4kgXFJtJ5JCg==
X-Received: by 2002:a63:1d23:: with SMTP id d35mr401029pgd.291.1597374212597;
        Thu, 13 Aug 2020 20:03:32 -0700 (PDT)
Received: from sol.lan (106-69-161-64.dyn.iinet.net.au. [106.69.161.64])
        by smtp.gmail.com with ESMTPSA id z3sm6522231pgk.49.2020.08.13.20.03.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2020 20:03:31 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH v4 02/20] gpiolib: cdev: replace strncpy with strscpy
Date:   Fri, 14 Aug 2020 11:02:39 +0800
Message-Id: <20200814030257.135463-3-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200814030257.135463-1-warthog618@gmail.com>
References: <20200814030257.135463-1-warthog618@gmail.com>
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
is necessary as strncpy zeroed pads the remainder of the destination.
It is also guarantees that the info cannot contain kernel stack that could
get leaked to userspace.  This is useful here, but is even more important
for the v2 info that this function is changed to generate in a subsequent
patch as that struct contains padding and attribute arrays that need to be
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

