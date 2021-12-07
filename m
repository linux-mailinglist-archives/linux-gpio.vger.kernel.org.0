Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B28C46B732
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Dec 2021 10:34:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233990AbhLGJhv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Dec 2021 04:37:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233979AbhLGJhu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Dec 2021 04:37:50 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7187CC061359
        for <linux-gpio@vger.kernel.org>; Tue,  7 Dec 2021 01:34:20 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id i5so28194569wrb.2
        for <linux-gpio@vger.kernel.org>; Tue, 07 Dec 2021 01:34:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OFBmi+P/xtj6C6buB+yHW4BbejPgVcLwap8GITqyozA=;
        b=XFKOPBFgmnOjtLWo+hF4B4IjH2aqPggZ9A6FbZDaiZUqIf/ZRwvWk8Ghjrrt1VGsUF
         u7xVinbsMUPp+RFNv3Tl1MqWYJyW2z5WjgwXPTx93d/3PROc5v81CXEl/YKlIlgDHCpq
         9tuidmtSZcdBvoVesAedGqtwqDhax5X7e/FaY8BhfNsAkn2DSLId6LnhxbVn05KTrLdO
         gyLk2ydDzFdsu4gBxdKksQc6pN4si3lT3+dJZhQ2zYrOkMJaiU59Mvey+y7W+XHc4aIP
         3L22w3da1htEExmnzZUkY+TagqmF4YE4msiCM9YlKpk23tD2XJq2JtVcp/KbhGWIv1fg
         iQCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OFBmi+P/xtj6C6buB+yHW4BbejPgVcLwap8GITqyozA=;
        b=cI0zjXHzqIPzaDtGk41r+9Yoenhu1+v0OHb78YHHCgCBAmM2nNthcJqvZMs9x2+8m2
         9RrQWFGbrMsXcxVeShMQNvJlaEuy/ZT+v4nKkWkKueKrO9SCm+Wyz9ig1OwHfVU8OzBc
         TxZPbNqV5Pd9vr6a9QL1eIrqKnKuRdrQYC4hAxeGuGvECCU1vK/ZFaK+hY/Krcc9Vp6t
         462zIVDZEYlXXPeJ43UP7gDBTj3FMND5TvvdDXiXYUyxjFxKqvNCVQv5F6Jw4BDH7KNS
         tIzTHyDExnacAkczFIuttsamlhen13mlDNpnMnJZ1GpG5UoiQ7+c85d9cssSBDPWOtYc
         RkGw==
X-Gm-Message-State: AOAM531lVfar9tFIdlceCzDGF30W9JHUue5DnjVuST0By1hfKHtWNIKS
        2jl9GHaq98+Io5OdnA3VnEEU6A==
X-Google-Smtp-Source: ABdhPJxbP0byRQB5Xb7wHgkrSsoF1aSzKzq9UqD7unbP/TVOOP2QlSMWogRPv8NwCAThrRBL1X1v/Q==
X-Received: by 2002:adf:dbd1:: with SMTP id e17mr48998698wrj.480.1638869659079;
        Tue, 07 Dec 2021 01:34:19 -0800 (PST)
Received: from debian-brgl.home ([2a01:cb1d:334:ac00:7d50:ff5:f5c1:e225])
        by smtp.gmail.com with ESMTPSA id k13sm13783291wri.6.2021.12.07.01.34.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Dec 2021 01:34:18 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Shuah Khan <shuah@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v13 3/7] gpiolib: of: make fwnode take precedence in struct gpio_chip
Date:   Tue,  7 Dec 2021 10:34:08 +0100
Message-Id: <20211207093412.27833-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20211207093412.27833-1-brgl@bgdev.pl>
References: <20211207093412.27833-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

If the driver sets the fwnode in struct gpio_chip, let it take
precedence over the of_node. This only affects OF-based systems,
ACPI needs to be converted separately.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 drivers/gpio/gpiolib-of.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 0ad288ab6262..91dcf2c6cdd8 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -1046,6 +1046,9 @@ void of_gpio_dev_init(struct gpio_chip *gc, struct gpio_device *gdev)
 	if (gc->parent)
 		gdev->dev.of_node = gc->parent->of_node;
 
+	if (gc->fwnode)
+		gc->of_node = to_of_node(gc->fwnode);
+
 	/* If the gpiochip has an assigned OF node this takes precedence */
 	if (gc->of_node)
 		gdev->dev.of_node = gc->of_node;
-- 
2.25.1

