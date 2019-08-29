Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8CA9EA1D00
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Aug 2019 16:38:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727994AbfH2OiO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Aug 2019 10:38:14 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:53711 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727958AbfH2OiN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Aug 2019 10:38:13 -0400
Received: by mail-wm1-f65.google.com with SMTP id 10so3984006wmp.3
        for <linux-gpio@vger.kernel.org>; Thu, 29 Aug 2019 07:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rgfAZbIXAtNJprrW3SR0FliLWlC8AUtP5591I4qRBtY=;
        b=OHA6ZMLqe/FTFL2xNuAXTK+TBgAKyi+kqTTKdnKXX1LoJLLUaqfpaIDH80qz5G53lj
         QOcrfIIT8VtYsVJ+uzUnnAr9ePxDPZ0U3SmOPSVHkGdgKBcBKeQkagn5uIrnyXbsXZ2S
         pk+qv3B052Jku7CFwX9WO3ZSvzmGoA4DQKbVXfjF0RIb8e/i5HDsR/eZFIxK8GhUnG+g
         veayX5RYCXnynnzo2FraoNmeHpg83yGR5Q+9H9MXM7iDDwOgDTQ1WkzUYSZEnFhEC8r2
         2zFaWnuJWNAoJPB6E2ykJqQ4W/wzlViTWG1Xw9469/MIt0hutmGw9FrgF+l4L7Zw7Cw8
         WYVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rgfAZbIXAtNJprrW3SR0FliLWlC8AUtP5591I4qRBtY=;
        b=gw+XpDIdv8JHTzyC9mq+EQl3qO3PRf8AxCMaKC5E1JonU2xanYqmMGg0V4TXPY91Sc
         7eCx/AwChZE5fPlgY9qp1lZt6rO1Pz/akkIt+itclzw+RPsIzjSuWJTnvm5qj1CcG3SB
         l8es6L0fHBo/3RWh7IJbg2CuhC2kEmtvYRYGwqnfOil/nl2jGXko8DiVGDL6S09eZVlk
         ZKWp40Jz7NDfaSnhpIx5OUxigsVXetGmrZmW63swKaDI3gpugzZz5ZqgHUfbYROAqrV+
         oCUwtIStSUagHClJAc3Rzg6A1Mo89Nuh5X6fdjxLVluqe7bviI4qFMv2SKgPKSHvt5DE
         YRbw==
X-Gm-Message-State: APjAAAVVn5iAf5sY6KaoftbVcQ40z/DoNj6Ajwg1xJ9vKUeVC8oRwh4N
        gwtDsEFDuoeg4FsEXlRnOIXOYg==
X-Google-Smtp-Source: APXvYqx+mVH1b84lDgcY8MIGudq3AQBFxK3n8O8b4xXyWDNctXSvSXo7mIwyPPqoRATFo5+lYE7kaQ==
X-Received: by 2002:a7b:c3d4:: with SMTP id t20mr11652532wmj.71.1567089491346;
        Thu, 29 Aug 2019 07:38:11 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
        by smtp.gmail.com with ESMTPSA id g15sm3241925wrp.29.2019.08.29.07.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 07:38:10 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Alban Bedel <albeu@free.fr>,
        Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, Julia Lawall <Julia.Lawall@lip6.fr>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 7/9] gpio: htc-egpio: use devm_platform_ioremap_resource_nocache()
Date:   Thu, 29 Aug 2019 16:37:40 +0200
Message-Id: <20190829143742.24726-8-brgl@bgdev.pl>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190829143742.24726-1-brgl@bgdev.pl>
References: <20190829143742.24726-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Use the new devm_platform_ioremap_resource_nocache() helper for memory
range mapping instead of devm_ioremap_nocache() combined with a call to
platform_get_resource().

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpio-htc-egpio.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-htc-egpio.c b/drivers/gpio/gpio-htc-egpio.c
index 9d3ac51a765c..7d8548e03226 100644
--- a/drivers/gpio/gpio-htc-egpio.c
+++ b/drivers/gpio/gpio-htc-egpio.c
@@ -295,14 +295,13 @@ static int __init egpio_probe(struct platform_device *pdev)
 		ei->chained_irq = res->start;
 
 	/* Map egpio chip into virtual address space. */
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res)
+	ei->base_addr = devm_platform_ioremap_resource_nocache(pdev, 0);
+	if (IS_ERR(ei->base_addr)) {
+		ret = PTR_ERR(ei->base_addr);
 		goto fail;
-	ei->base_addr = devm_ioremap_nocache(&pdev->dev, res->start,
-					     resource_size(res));
-	if (!ei->base_addr)
-		goto fail;
-	pr_debug("EGPIO phys=%08x virt=%p\n", (u32)res->start, ei->base_addr);
+	}
+	pr_debug("EGPIO phys=%08x virt=%p\n",
+		 virt_to_phys(ei->base_addr), ei->base_addr);
 
 	if ((pdata->bus_width != 16) && (pdata->bus_width != 32))
 		goto fail;
-- 
2.21.0

