Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1EB227A4BE
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Sep 2020 02:29:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726565AbgI1A3G (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 27 Sep 2020 20:29:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726393AbgI1A3G (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 27 Sep 2020 20:29:06 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69757C0613CE;
        Sun, 27 Sep 2020 17:29:06 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id n14so7749500pff.6;
        Sun, 27 Sep 2020 17:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Eem0c+jPGt4h5O0FB7VOY7qfs4N3yUmzBZn+jIhhYvU=;
        b=exruSH73V21Bcg01fN9gjuKQFFSvKMOLtNaiTHl19ymM8Z9l6OM2CumZOtS4KyM0og
         gDyW/2MvffnXGalsV1I8oV91oAcWLgDWo4UplOmg4r8cCWaA4B6GhZIvfmj1PFVjq6jz
         I9eXjUlvTpoPAc9cJQZbNYOkIg3vIue6ZnYJOUD+aljCNkpi4mhJ6NUklaTOI0PkYdch
         EZmIuUsLg1TNIcTBE6J12SGc+2j3bN7qPzicfs0TSMqvH1rQZz6hDqLI1dgqAKNxjdQw
         Muw19yO+3+RePjjVHfyAMIdOUll/QSm/Ck4X3tkveqzUxSziatutVd5xABfpNQYecAuB
         z3aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Eem0c+jPGt4h5O0FB7VOY7qfs4N3yUmzBZn+jIhhYvU=;
        b=fci4zsC7bsdf18Vb6KUF+sy7nHn6fxc4YiBEnWRZUFrLhBvMAoTBGFob6ru0GXkVWj
         kUwnwtgGIiuniAABWLa6olYTjTo7TvJUloJqOz1WpDwfIX05plSEHuO/ZS5dxjMxR+/f
         RZG1ZMHINK3FMBSAmnkvVYZC9wowCVbqRXaM19R8BY8GWAlLDOjQEvw/gwC+emREsC2a
         kPHg1sWOoOs8jt4P7TVuUHLZtmTBlWvClksLM7Mt+PSIyU/W6FeD3QjYOtvaloxg9/uu
         JIat/lE83iY8cFrc07NTvBb/o2NAGvXYDM2zrW/2yeNZgB4+GTYMozj7jU66dGFYuznw
         yeMQ==
X-Gm-Message-State: AOAM530d7TYCYbQhn46xhgzOaNVoxgBcPcWSV7cXm27bgSYCjnwOxSG1
        IxFIZ4q2bd2WfsRHul+7HZ3wzfWFeLH3bw==
X-Google-Smtp-Source: ABdhPJzkdXUqeCX+EwXwqnDmRInMmV7qZ2LxZBEwGMY2u8Dk54EegWjbOhCvgYpUqfAPEsp4OoFhJQ==
X-Received: by 2002:a17:902:c213:b029:d2:564d:8352 with SMTP id 19-20020a170902c213b02900d2564d8352mr9123320pll.54.1601252945593;
        Sun, 27 Sep 2020 17:29:05 -0700 (PDT)
Received: from sol.lan (106-69-171-132.dyn.iinet.net.au. [106.69.171.132])
        by smtp.gmail.com with ESMTPSA id o20sm8443783pgh.63.2020.09.27.17.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2020 17:29:04 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org,
        andy.shevchenko@gmail.com, arnd@arndb.de
Cc:     Kent Gibson <warthog618@gmail.com>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH v10 02/20] gpiolib: cdev: replace strncpy() with strscpy()
Date:   Mon, 28 Sep 2020 08:27:49 +0800
Message-Id: <20200928002807.12146-3-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200928002807.12146-1-warthog618@gmail.com>
References: <20200928002807.12146-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Replace usage of strncpy() with strscpy() to remove -Wstringop-truncation
warnings.

The structures being populated are zeroed, to prevent stack leakage as
they are returned to userspace, so strscpy() performs the equivalent
function without the warnings.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Kent Gibson <warthog618@gmail.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
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
index 81ce2020f17b..86679397d09c 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -752,6 +752,7 @@ static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
 	bool ok_for_pinctrl;
 	unsigned long flags;
 
+	memset(info, 0, sizeof(*info));
 	info->line_offset = gpio_chip_hwgpio(desc);
 
 	/*
@@ -766,19 +767,11 @@ static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
 
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
@@ -842,12 +835,10 @@ static long gpio_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 
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

