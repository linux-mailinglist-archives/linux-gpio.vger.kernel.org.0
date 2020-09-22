Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2BE22738A3
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Sep 2020 04:34:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729800AbgIVCe2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Sep 2020 22:34:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729379AbgIVCe1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Sep 2020 22:34:27 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3CBAC061755;
        Mon, 21 Sep 2020 19:34:27 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id l126so11073830pfd.5;
        Mon, 21 Sep 2020 19:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Eem0c+jPGt4h5O0FB7VOY7qfs4N3yUmzBZn+jIhhYvU=;
        b=eXqr5EpE5nujDhsP0bx57l/Z9UKevEA53ZX87cschPeuX67tKhGnjikc+geuJkKot0
         pFLgRgLPqm7aRHmBVcgS1uFEqKaraH9gnJljdJAX7ZGBmkJZqJ4Huid6glgxrs/kC1Pv
         SYqarqaXyumfZ2dU5e7q3hXZZZEQR/tDBcHTjjcGzU3zcl4Nf0KTUaBbZn4e0KNfZ9+P
         z4J7oAao4thTQnmKzQ6bsG+Sbf2b2MLGDjWfhNNah1h8aF1j6G2oe871vP2xIvX+suw+
         PwTvLNRgyRjEpoh2EoNNSUpyJkFTDA6M1fKF8+MVcQNbeNQnWknIcuxYrrHybMdDvde7
         fJSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Eem0c+jPGt4h5O0FB7VOY7qfs4N3yUmzBZn+jIhhYvU=;
        b=FaXVPPIIVjk/x/4uLF55Q2U6iGUvGV738iPs3crKYhrXnmX0dNy+OeL2SsxrVPzCtV
         fTpQYd/fgRduvmW8fW+pwmOs4urYgV8JjtRo9aYQD1Uebx/0REKUhJIncy53GSwAdpso
         X+NHEUxTfIuwhiqnO1oHI2tJerd2ppRfve4tL+sOpgqGSe9n0NU7cdo4/srllMjO3g5x
         0qb+kkTRf2zIZ+uP7e8/MHDKwPK31iwBgRim3LTADGRIvTPsvRDe8f/QEV7uhTJWG7o4
         GImlk3FGnl3X0v/q7XGNt4CApr0WF5BGZ/VUOOC28+5t9rYpsA/nzsSo+gwxrhBtJifQ
         XT6w==
X-Gm-Message-State: AOAM5307EWNRbmom3bWqkwb+kh+uL0vcu4LSEpmz/NnMdNiQGwxnnc/6
        COJiJRpZVVzcb9WPkQ0NfxTaLfOTx5orCA==
X-Google-Smtp-Source: ABdhPJzsL99FhuR+ldsMF3dNXA9MndFVgrfIBeLSvouKo/z4Wwb+P5fw6hXTd4RPqNnaJlI5N7odsg==
X-Received: by 2002:a63:184b:: with SMTP id 11mr1773903pgy.298.1600742066897;
        Mon, 21 Sep 2020 19:34:26 -0700 (PDT)
Received: from sol.lan (106-69-189-59.dyn.iinet.net.au. [106.69.189.59])
        by smtp.gmail.com with ESMTPSA id j19sm13321390pfi.51.2020.09.21.19.34.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 19:34:26 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org,
        andy.shevchenko@gmail.com
Cc:     arnd@arndb.de, Kent Gibson <warthog618@gmail.com>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH v9 02/20] gpiolib: cdev: replace strncpy() with strscpy()
Date:   Tue, 22 Sep 2020 10:31:33 +0800
Message-Id: <20200922023151.387447-3-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200922023151.387447-1-warthog618@gmail.com>
References: <20200922023151.387447-1-warthog618@gmail.com>
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

