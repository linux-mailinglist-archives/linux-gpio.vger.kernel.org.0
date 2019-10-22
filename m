Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BDEF6DFFC7
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Oct 2019 10:43:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388573AbfJVInf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 22 Oct 2019 04:43:35 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:54033 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388592AbfJVInf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Oct 2019 04:43:35 -0400
Received: by mail-wm1-f68.google.com with SMTP id i13so907697wmd.3
        for <linux-gpio@vger.kernel.org>; Tue, 22 Oct 2019 01:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jXNXj1e2zC7QQcAuycavLZxRUf6xfVt6rz1LoeDud/w=;
        b=2QCyA3PXiPUyeYFfuokAvpJI+PvkjVpE4UOc0GXfQNWQLPRIJ0QiOrQS0JzYXAd+n3
         Szn91AoIXkU1TUwFXYX0ApUs9c5lC5Y5TGYRD81OltYhvuecZU7li+rSgVDjbcAnQ9wq
         WDqai+Etz77UZ+acGmURkx9RBtZ6h5KdcahbnB2TyEfltA8mCNAFgHETKBRTRNIG9xy8
         GdlzdG76F+YGV7UVe4OPMrUqElEx17hrl8Yv5dIC5ZavP8i2kjUZrBlwH3DSvF/24Dmp
         bHOtuWOpcUGSPaVQ3cpAWkjb87PLohAZ5qbXRVxeE1FpXwe5mOf9bHcgEjua7PJi2nd1
         0Z/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jXNXj1e2zC7QQcAuycavLZxRUf6xfVt6rz1LoeDud/w=;
        b=dNovf/YdjRZc0mkQTrC5RBNuLZjvRpniOwesF5x61dqPgB3W4rW0mhVYa3XkxHAyqb
         lMD3tFT4I3tNkFR1p3my7LgkN5DXFzWzXvxatqfGfangrElpZSyE/ALhbas35rDZqju7
         GVfYZvmwJYZ1UQJU4II45k4MJ/Gi/+L/gCWNN77+s5UexsacuRriE5iSTfnulTYNhIli
         6aH8oLVWuEF86HKq/2ZSj5w9TuxXMfR48XssjA1fj2clLueFzGfAFPAdiF7SHImumY8B
         udIZa/barHN3Hd1oGkZcXr22hbRA6teQzncmomIfBA6q7tpQT9GxFFk+TZB3yvVPTixF
         XwWg==
X-Gm-Message-State: APjAAAXDYAoCtUsE5Vep1spe92srbcbnk7r2vMiCEWA/0WLg3CjuKSZQ
        hIErrLtIUYNrzUKIHXy10L4NkA==
X-Google-Smtp-Source: APXvYqxrmktides0gIu13c3NuG/KSYgp4SuGdxhZ/o9zHotYMfXm0eCSV6Q2f87+20WxPanjVJ0Q0w==
X-Received: by 2002:a1c:dc83:: with SMTP id t125mr1994370wmg.50.1571733811370;
        Tue, 22 Oct 2019 01:43:31 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
        by smtp.gmail.com with ESMTPSA id q25sm477231wra.3.2019.10.22.01.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2019 01:43:30 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [RESEND PATCH v3 8/8] gpio: tegra186: use devm_platform_ioremap_resource_byname()
Date:   Tue, 22 Oct 2019 10:43:18 +0200
Message-Id: <20191022084318.22256-9-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191022084318.22256-1-brgl@bgdev.pl>
References: <20191022084318.22256-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Use the devm_platform_ioremap_resource_byname() helper instead of
calling platform_get_resource_byname() and devm_ioremap_resource()
separately.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpio/gpio-tegra186.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
index a9058fda187e..ef40fbe923cf 100644
--- a/drivers/gpio/gpio-tegra186.c
+++ b/drivers/gpio/gpio-tegra186.c
@@ -407,7 +407,6 @@ static int tegra186_gpio_probe(struct platform_device *pdev)
 	unsigned int i, j, offset;
 	struct gpio_irq_chip *irq;
 	struct tegra_gpio *gpio;
-	struct resource *res;
 	char **names;
 	int err;
 
@@ -417,8 +416,7 @@ static int tegra186_gpio_probe(struct platform_device *pdev)
 
 	gpio->soc = of_device_get_match_data(&pdev->dev);
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "gpio");
-	gpio->base = devm_ioremap_resource(&pdev->dev, res);
+	gpio->base = devm_platform_ioremap_resource_byname(pdev, "gpio");
 	if (IS_ERR(gpio->base))
 		return PTR_ERR(gpio->base);
 
-- 
2.23.0

