Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26B1527AC13
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Sep 2020 12:42:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726614AbgI1Km2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 28 Sep 2020 06:42:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726607AbgI1KmJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 28 Sep 2020 06:42:09 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BAFDC0613D9
        for <linux-gpio@vger.kernel.org>; Mon, 28 Sep 2020 03:42:06 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id a9so641718wmm.2
        for <linux-gpio@vger.kernel.org>; Mon, 28 Sep 2020 03:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9OHLxj5LKThNKX3AdZ96/ghdViR26xgQsL7zhp/+aDs=;
        b=a5ghI0fLgsfZKabmY7q23//OX5oPw2iffveHVQ71bkjGVVICZKZ17FxZGZCoYb1D30
         hddl2lKzBQFamZTmMVG3n7p0Zs0/v6UBj/vSryoXw1wc1ZcA36pEWjhUBOa7ZD01L6cu
         EDHNit98fpoeDsy9F+TmaNP9mMQHlt14cJVNwEUJqjqmzodnuRQUPiKMiER95nW+yFkA
         5FfIOoUthFQb9fX0KBbqlQnHnj7Yv13lyWOs8+H4V2T9n1ZRcWYLkAWUfmoc15nMhHEC
         FByGJR4jVd/F2rXJY46vesVPjgQlYYr+LVmmWL0fQ8F2rwQk29Azjd+Pz7eBnvbjiNVh
         McgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9OHLxj5LKThNKX3AdZ96/ghdViR26xgQsL7zhp/+aDs=;
        b=isHIZBTLMXV8+HnNJqfGK2QlkZ+vBPBTzMeGn2pUY8gVmPwVnuH9BAgQa9jURjitJp
         XC3q3VymmXaTLJY7ivYPsZgmmSVi1gJKP3KNk4fLrsEVIJNY2AtVIlM39tqtY4zCpUMm
         R2JIhZPlFkazU99bBUsaIEx9PkB05hbGNDup9PZS+SSwEk9tokwhuv77juW+jj2bG2E8
         jH/wk9dyl3wtJ6zHbaVkika3cq+SlejZpd6JhcfDewMofT5M+0muNNDBrd9Mh5Y42ZZ4
         EawodPkXSbZriDSOBb+19XE3doohjhCtRTSM5U2l6dzBpja+2aNRLJp5kmCTshIaBdIf
         pu8g==
X-Gm-Message-State: AOAM5336vN9o3l8tCbyeYLXt5oXrSxINUtEcSnoC1LY9yfwOt4S1DnTf
        YRcrKWFaF7eE6KFv61hrDESsZg==
X-Google-Smtp-Source: ABdhPJwnSwPvU4Rl2Aysgxa3ibHM8/8y6qDuUcA7Zu4ElxXOmY/yIYDsD3cAgYZQ66J8Rgwz1J0yfw==
X-Received: by 2002:a7b:cc84:: with SMTP id p4mr1008856wma.58.1601289725175;
        Mon, 28 Sep 2020 03:42:05 -0700 (PDT)
Received: from debian-brgl.home (lfbn-nic-1-68-20.w2-15.abo.wanadoo.fr. [2.15.159.20])
        by smtp.gmail.com with ESMTPSA id f14sm939258wrt.53.2020.09.28.03.42.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 03:42:04 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v2 5/9] gpio: mockup: use pr_fmt()
Date:   Mon, 28 Sep 2020 12:41:51 +0200
Message-Id: <20200928104155.7385-6-brgl@bgdev.pl>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200928104155.7385-1-brgl@bgdev.pl>
References: <20200928104155.7385-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

We don't need a custom logging helper. Let's use the standard pr_fmt()
macro which allows us to use all pr_*() routines with custom format.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-mockup.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index 90a1d6c2775f..c2b2f7d5ff34 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -7,6 +7,8 @@
  * Copyright (C) 2017 Bartosz Golaszewski <brgl@bgdev.pl>
  */
 
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
 #include <linux/debugfs.h>
 #include <linux/gpio/driver.h>
 #include <linux/interrupt.h>
@@ -30,8 +32,6 @@
 /* Maximum of three properties + the sentinel. */
 #define GPIO_MOCKUP_MAX_PROP	4
 
-#define gpio_mockup_err(...)	pr_err(KBUILD_MODNAME ": " __VA_ARGS__)
-
 /*
  * struct gpio_pin_status - structure describing a GPIO status
  * @dir:       Configures direction of gpio as "in" or "out"
@@ -548,7 +548,7 @@ static int __init gpio_mockup_init(void)
 
 	err = platform_driver_register(&gpio_mockup_driver);
 	if (err) {
-		gpio_mockup_err("error registering platform driver\n");
+		pr_err("error registering platform driver\n");
 		debugfs_remove_recursive(gpio_mockup_dbg_dir);
 		return err;
 	}
@@ -577,7 +577,7 @@ static int __init gpio_mockup_init(void)
 
 		pdev = platform_device_register_full(&pdevinfo);
 		if (IS_ERR(pdev)) {
-			gpio_mockup_err("error registering device");
+			pr_err("error registering device");
 			platform_driver_unregister(&gpio_mockup_driver);
 			gpio_mockup_unregister_pdevs();
 			debugfs_remove_recursive(gpio_mockup_dbg_dir);
-- 
2.26.1

