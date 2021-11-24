Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2BA945C706
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Nov 2021 15:17:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348868AbhKXOSC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Nov 2021 09:18:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351000AbhKXOR1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Nov 2021 09:17:27 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36F98C0818F3
        for <linux-gpio@vger.kernel.org>; Wed, 24 Nov 2021 04:28:57 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id p27-20020a05600c1d9b00b0033bf8532855so1910680wms.3
        for <linux-gpio@vger.kernel.org>; Wed, 24 Nov 2021 04:28:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DcZ1Q8d+O6FgM0ahJ1NKmjZFVwY2xw4s/RvlwwiK+mU=;
        b=WOKeoFFzUWyCB51Qa2QJzo4p0Sv9PqYAsGJHScNWi0Nxq4TkivGBjOMsmIQgYB/l3P
         rB4/KYGerJym8yts+yBeedP3jrVFUZLq8OQZLErIvNzv7MK1wT7l35NbDKJ5VmFA9Dus
         9H8JlOuZ+ZuUTWSev2rzR576dLdVH29+YiWKHTd8sSyawZ9p/i8GxRJ9sIIAdYpnO58S
         yKpT2i+cBPy1bC9Zg78RgvmKXjZvkYtiItvAhlvZIp8Fta8qs91Xwgbh4DPIpyK3Df4E
         QENJwb+fp+kPKHGoW6R3OYrgOjIGHkGW9INfjPhGlP7bYiFpbXDKLdNYhVUoKu1z1YfA
         mCJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DcZ1Q8d+O6FgM0ahJ1NKmjZFVwY2xw4s/RvlwwiK+mU=;
        b=8ORRcrscAlBwT6bdxWUX+ILFlRMOw2mZqYEOO47RkRgfGBo1SAfrA3aO856Swc0Rd/
         inP7BphPKXqx8Cxki3yf4LRILPYRloBvG6hfpUT0KtpYrbNmEedyehtF27m+AE22mNfb
         TJtBCfPGnqNWvm9VS0ivTf5aZHiRR3T7wC8bh/UQMi2AafOKvEv3KKKfsbsDB0eJ0L6o
         YXmlzE7YM2WURQg2I5WGan739e+kBacV+TnFh+kCAZjWgrGND/7z2URi/m2v44Jo7vwK
         qK0+IrznzhrHZUtSx5xYy2drvSId6jjPXPVRwd4qP+JEwJvj6wZ9GNMEyuFJr4XCXk8N
         OJCg==
X-Gm-Message-State: AOAM531ayPAfWv+F8MEsS7hj12j7DSRwBlHHsW8NnwqSuBFj4ISbSW2M
        rR+hhr+yzinq0fYTH3LhfaJDWLK5yEGe8zTe
X-Google-Smtp-Source: ABdhPJzT/jKV/kTbp1ET/jbz8/YdJAG86C5Bkz7yhjB8UEXLmD/yNJcyuAzmYfO/v9dZHELp43N/GA==
X-Received: by 2002:a05:600c:22d9:: with SMTP id 25mr14255425wmg.71.1637756935782;
        Wed, 24 Nov 2021 04:28:55 -0800 (PST)
Received: from debian-brgl.home ([2a01:cb1d:334:ac00:7d50:ff5:f5c1:e225])
        by smtp.gmail.com with ESMTPSA id p62sm4417694wmp.10.2021.11.24.04.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 04:28:55 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Johan Hovold <johan@kernel.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v3 2/2] gpiolib: check the 'ngpios' property in core gpiolib code
Date:   Wed, 24 Nov 2021 13:28:50 +0100
Message-Id: <20211124122850.7095-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20211124122850.7095-1-brgl@bgdev.pl>
References: <20211124122850.7095-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Several drivers read the 'ngpios' device property on their own, but
since it's defined as a standard GPIO property in the device tree bindings
anyway, it's a good candidate for generalization. If the driver didn't
set its gc->ngpio, try to read the 'ngpios' property from the GPIO
device's firmware node before bailing out.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---
v1 -> v2:
- use device_property_read_u32() instead of fwnode_property_read_u32()
- reverse the error check logic

v2 -> v3:
- don't shadow errors other than -ENODATA in device_property_read_u32()

 drivers/gpio/gpiolib.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index ede8b8a7aa18..f79fd2551cf7 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -599,6 +599,7 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 	int base = gc->base;
 	unsigned int i;
 	int ret = 0;
+	u32 ngpios;
 
 	/*
 	 * First: allocate and populate the internal stat container, and
@@ -647,9 +648,17 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 	}
 
 	if (gc->ngpio == 0) {
-		chip_err(gc, "tried to insert a GPIO chip with zero lines\n");
-		ret = -EINVAL;
-		goto err_free_descs;
+		ret = device_property_read_u32(&gdev->dev, "ngpios", &ngpios);
+		if (ret) {
+			if (ret == -ENODATA) {
+				chip_err(gc, "tried to insert a GPIO chip with zero lines\n");
+				ret = -EINVAL;
+			}
+
+			goto err_free_descs;
+		}
+
+		gc->ngpio = ngpios;
 	}
 
 	if (gc->ngpio > FASTPATH_NGPIO)
-- 
2.25.1

