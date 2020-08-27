Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EAB125468D
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Aug 2020 16:14:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727912AbgH0OOC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Aug 2020 10:14:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728067AbgH0OLf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Aug 2020 10:11:35 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCAB9C06121B;
        Thu, 27 Aug 2020 07:01:05 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id mw10so2644888pjb.2;
        Thu, 27 Aug 2020 07:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fedQaMAad6gJKi/QRC5xP0GL2BO40HvVvA1rAXDD1oY=;
        b=GBl5AMzIlvZhybWGvaLgu6UPCdgkvGDYSc+9qPjQno4yxfhwCK4T/WcfvblLCoSlOL
         jHyzuyH0+lKkPElF5bECyZbOmcrCvFon/KjgSBzFq+BmtCG6OsZlESBjEWQYfZWQRpKp
         gEkosSek1khI8cnxG/7misDAlpGUuoPaHOK3AXBVpyHxnKibvXuC4euRH48K0xSAh6Di
         zTL6vQJIwbWxY2IRLSGutmpunj21ieHy/kt3mm7ujgBS1JYMSvuNspZGJHVNq7fCelhi
         bSeBxzaOy82dJU8ZI2IZt4aBnY6bW8lhgHfdogY99sNro68ntGYPJSlv+P9BVYyifEY2
         Cyfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fedQaMAad6gJKi/QRC5xP0GL2BO40HvVvA1rAXDD1oY=;
        b=UBG2gRTIK1xx5X3TYgq57Ll6REcIHYqdEW6I7fl9dmcpaouWsIFfccol6CdkCXAHD1
         pqGbH8d1Do20OGGxKGgOPSp05SK9rO+wmGPe63aKFnN5UnytY8QVaJUn0j0YB5ZcN9qB
         LKvjW+JG+gl4/5Oyej2dvMAz0KnINLPOCj1NMxHtx4mVYPX/If+HWZTcNt8RmzGqcXkV
         +eaGbH1iV6WUI4qA3xi7rvAZHxgIJ7POvrVEvKpYTg6ictuYaHCnTKBMnrhxT0VCuODd
         rUHuIYqGTtzCG+rRRuTXCLyXgr9PEQhxt8RFNH7VBxm1Vph2c/YkzfT7J5szQQpaDJtI
         R4bg==
X-Gm-Message-State: AOAM533ZROCxpqHG9F06GKPh31QHtTp23/EeAZH3QjRGGy7DUh/XgS9D
        3mXeha55lOQTeAdqLzlAS6/6gsbDkwc=
X-Google-Smtp-Source: ABdhPJz2HOayJnC9uXU68hHAjjsSHbf/scUyiTGvIEs2DN1gP7UgBoRHCysnVIolQEomelhcnIYPPA==
X-Received: by 2002:a17:90a:630c:: with SMTP id e12mr10571615pjj.17.1598536864878;
        Thu, 27 Aug 2020 07:01:04 -0700 (PDT)
Received: from sol.lan (106-69-184-100.dyn.iinet.net.au. [106.69.184.100])
        by smtp.gmail.com with ESMTPSA id fs12sm2371092pjb.21.2020.08.27.07.01.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2020 07:01:04 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v5 01/20] gpiolib: cdev: desc_to_lineinfo should set info offset
Date:   Thu, 27 Aug 2020 22:00:01 +0800
Message-Id: <20200827140020.159627-2-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200827140020.159627-1-warthog618@gmail.com>
References: <20200827140020.159627-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Set the value of the line info offset in desc_to_lineinfo, rather than
relying on it being passed in the info.  This makes the function behave
as you would expect from the name - it generates the line info
corresponding to a given GPIO desc.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---

There are some instances where this results in the offset being set when
it is already set in the info, but this is clearer especially considering
that, as part of the replacement of strncpy with strscpy and to ensure
kernel stack cannot be leaked to userspace, the info is initially zeroed
in a subsequent patch.

 drivers/gpio/gpiolib-cdev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index e6c9b78adfc2..e95e3eab9867 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -752,6 +752,7 @@ static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
 	bool ok_for_pinctrl;
 	unsigned long flags;
 
+	info->line_offset = gpio_chip_hwgpio(desc);
 	/*
 	 * This function takes a mutex so we must check this before taking
 	 * the spinlock.
@@ -933,7 +934,6 @@ static int lineinfo_changed_notify(struct notifier_block *nb,
 		return NOTIFY_DONE;
 
 	memset(&chg, 0, sizeof(chg));
-	chg.info.line_offset = gpio_chip_hwgpio(desc);
 	chg.event_type = action;
 	chg.timestamp = ktime_get_ns();
 	gpio_desc_to_lineinfo(desc, &chg.info);
-- 
2.28.0

