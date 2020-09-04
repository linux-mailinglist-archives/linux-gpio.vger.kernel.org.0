Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29DEF25DE6D
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Sep 2020 17:50:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727937AbgIDPuB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 4 Sep 2020 11:50:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726458AbgIDPqq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Sep 2020 11:46:46 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BEBAC06123A
        for <linux-gpio@vger.kernel.org>; Fri,  4 Sep 2020 08:46:39 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id a17so7191312wrn.6
        for <linux-gpio@vger.kernel.org>; Fri, 04 Sep 2020 08:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DcRR0cvj/PHR5JcTPOP5KmS/Yg2MBZu1qA5qfQNGk0A=;
        b=OSJLrqQlcETqpO5qPErz470rrP4H38PM0Pt8IMETO0NAQJtD9YhqhPpbnjVgO6z5Pc
         zFTnWa4ltyNBOIYyvM+4tgoe3kWJWGZqE++V+EWXWa7BQTeJRGUXB+RdjUucwaB8vcA8
         a87JibEI+hux9ZIBnOWbmMRMtjtepM2P3EDk7RX7CdRquBDpTnwVnZks1Czho5gigPzO
         ZBW5pug6/6n5xkuc53cIUj/ofUMQo9ZoeuLagXDiIzxELjsil7e+coJ8Ky5yYDlrwcXU
         cOpD7DsDHXxX3RQEoBjI4dZ0NGVoglP+yauppUuvEEQIuJHNgVPXVtwRoCNu/iQqYXLn
         CGxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DcRR0cvj/PHR5JcTPOP5KmS/Yg2MBZu1qA5qfQNGk0A=;
        b=ofb4/tZYkXQBBZUC7w7WaF8Cx6IamwFo8Vw6r0kEEkmCP4iPFNjt/ngipwo5ZJIYlf
         VE91gdqd9xsgB1zWK0EDPPBoLNRy0Z5UFYxRezdEJunihQSQXSCwz4zixSmi9cLIKQuL
         FmbeaGXY63RVKBlRik8NdXnk1jOVkJ+2vWkHOqt3jCVboFYjRfgFVom2tGARYOeR0QfO
         RuTa88GTVRS1J4Xhpliqr+p2Kk2AZajbZ/t3c+6dB/daiwwlPPRjm7pk7rzUmskeMk+W
         9wnt1122xK4xWMv7Ebb8e9f/xBlaIZWK6Ek3i5Lk5M0vGH61zSShB0+YYAQ7py+CTm3y
         9UFg==
X-Gm-Message-State: AOAM531ZV00TGBdGZeXywenQTTLjeFQ946V0OKdEJQ7BI/2uZPFJlBr8
        4k7a2+krfXWAt4Ym14gE3g3eUA==
X-Google-Smtp-Source: ABdhPJzydKpw4Z5FsNZ+t0aMz2hV1ayLaJITUh07WUEGRLKoHkz5Fpef/XIauwVmwQp52xf/HGURHw==
X-Received: by 2002:adf:9d44:: with SMTP id o4mr8314372wre.361.1599234398291;
        Fri, 04 Sep 2020 08:46:38 -0700 (PDT)
Received: from debian-brgl.home (lfbn-nic-1-68-20.w2-15.abo.wanadoo.fr. [2.15.159.20])
        by smtp.gmail.com with ESMTPSA id q4sm11983375wru.65.2020.09.04.08.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2020 08:46:37 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 06/23] gpiolib: switch to simpler IDA interface
Date:   Fri,  4 Sep 2020 17:45:30 +0200
Message-Id: <20200904154547.3836-7-brgl@bgdev.pl>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200904154547.3836-1-brgl@bgdev.pl>
References: <20200904154547.3836-1-brgl@bgdev.pl>
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
index 15c99cf560ee..591777bc2285 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -471,7 +471,7 @@ static void gpiodevice_release(struct device *dev)
 	struct gpio_device *gdev = dev_get_drvdata(dev);
 
 	list_del(&gdev->list);
-	ida_simple_remove(&gpio_ida, gdev->id);
+	ida_free(&gpio_ida, gdev->id);
 	kfree_const(gdev->label);
 	kfree(gdev->descs);
 	kfree(gdev);
@@ -582,7 +582,7 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 		gc->of_node = gdev->dev.of_node;
 #endif
 
-	gdev->id = ida_simple_get(&gpio_ida, 0, 0, GFP_KERNEL);
+	gdev->id = ida_alloc(&gpio_ida, GFP_KERNEL);
 	if (gdev->id < 0) {
 		ret = gdev->id;
 		goto err_free_gdev;
@@ -753,7 +753,7 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
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

