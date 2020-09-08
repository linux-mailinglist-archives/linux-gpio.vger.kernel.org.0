Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7981261D88
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Sep 2020 21:38:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732141AbgIHTiW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Sep 2020 15:38:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730755AbgIHPzo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Sep 2020 11:55:44 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6415FC061247
        for <linux-gpio@vger.kernel.org>; Tue,  8 Sep 2020 06:12:31 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id x23so7331650wmi.3
        for <linux-gpio@vger.kernel.org>; Tue, 08 Sep 2020 06:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hrkUEQnkIGFGoNQEVpiI9JVsWjIbZBqpkD8BbZf2zOQ=;
        b=PW143ymqvvugN4bi5TTzJs8LeNJbs5u16TQjl6/VN2bg4e6a5jWm/MbcxnMxZVwgwX
         HavELQkYGfFuXp29hqY2myCHP/ErTH2k4PLhAEnfJabgYzTA7SOtzKTZMNVL/hjOjd5M
         5ZwRUchgYXdbR83oKIjrTaRd72ZFyyJX20InDm3G3rZ42nPgSdXHXB7OdEx/oLa0pjJF
         +UdRV++7E2c02jJ5uhDQpQeXb4lJUJ5JwQfyOJOqKu9mqq0jakcFM2xYC9PP+iMfWq9z
         t7p/gfiCT957lE1TPQUcGKQlhd50/KloYi+X4MidwOQB7OKXefPHVRjEEppTAUyRU/Ik
         zPBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hrkUEQnkIGFGoNQEVpiI9JVsWjIbZBqpkD8BbZf2zOQ=;
        b=nMePajPcnTzwJkCCqRRH3Nb6Svjx5mDgYKTeBuV27yfJ2hv8Lthy2r8jzqCiPjGXRi
         IWQP827zIkLN+FI8gQEghMoGojUV9/uVtF+n0MYPb3mxOvWpwww/UqV27TevjHOGmvGn
         7Iok3Kif9GFsWXCSnDkaDNFrdK9x/w46eh6SmPpm8/lo8sTB5CQ7STpDBNID05vv0O+j
         6VDX743h2L/A8+tM7+byd8gVfx4vkHFQzhIg8AvSjNo+puStxGFanqwd59Dj2qeERtz+
         mbW7nvjzR2qaqmBqezUJ2QtBGp+Em96xWmvDlshyOaFmMeF7GDBWcY8FQZdFNzSE6rVY
         HA4w==
X-Gm-Message-State: AOAM5339sMqPLbfW/GN+NYztmyRbfvryLd5p3rZF8ztza/g9aXEWDu/b
        SeF/Xh9aXFuywbIlZVmdfiOWoA==
X-Google-Smtp-Source: ABdhPJxX6aEKKbfcibSkGUiwzn+QESAx0tzCBJXX709sOGdeRCmDm2UPrnZVVvx7qrBO+uolnZj/LQ==
X-Received: by 2002:a05:600c:2215:: with SMTP id z21mr4338869wml.176.1599570750028;
        Tue, 08 Sep 2020 06:12:30 -0700 (PDT)
Received: from debian-brgl.home (lfbn-nic-1-68-20.w2-15.abo.wanadoo.fr. [2.15.159.20])
        by smtp.gmail.com with ESMTPSA id m4sm17596893wro.18.2020.09.08.06.12.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2020 06:12:29 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH] gpiolib: switch to simpler IDA interface
Date:   Tue,  8 Sep 2020 15:12:25 +0200
Message-Id: <20200908131225.10870-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

We don't need to specify any ranges when allocating IDs so we can switch
to ida_alloc() and ida_free() instead of the ida_simple_ counterparts.

ida_simple_get(ida, 0, 0, gfp) is equivalent to
ida_alloc_range(ida, 0, UINT_MAX, gfp) which is equivalent to
ida_alloc(ida, gfp). Note: IDR will never actually allocate an ID
larger than INT_MAX.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpiolib.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 80137c1b3cdc..97f76334ec7e 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -426,7 +426,7 @@ static void gpiodevice_release(struct device *dev)
 	struct gpio_device *gdev = dev_get_drvdata(dev);
 
 	list_del(&gdev->list);
-	ida_simple_remove(&gpio_ida, gdev->id);
+	ida_free(&gpio_ida, gdev->id);
 	kfree_const(gdev->label);
 	kfree(gdev->descs);
 	kfree(gdev);
@@ -537,7 +537,7 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 		gc->of_node = gdev->dev.of_node;
 #endif
 
-	gdev->id = ida_simple_get(&gpio_ida, 0, 0, GFP_KERNEL);
+	gdev->id = ida_alloc(&gpio_ida, GFP_KERNEL);
 	if (gdev->id < 0) {
 		ret = gdev->id;
 		goto err_free_gdev;
@@ -705,7 +705,7 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 err_free_descs:
 	kfree(gdev->descs);
 err_free_ida:
-	ida_simple_remove(&gpio_ida, gdev->id);
+	ida_free(&gpio_ida, gdev->id);
 err_free_gdev:
 	/* failures here can mean systems won't boot... */
 	pr_err("%s: GPIOs %d..%d (%s) failed to register, %d\n", __func__,
-- 
2.26.1

