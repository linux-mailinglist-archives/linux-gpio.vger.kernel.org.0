Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C6287C8F31
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2019 19:03:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728322AbfJBRDF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Oct 2019 13:03:05 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:40315 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727003AbfJBRDE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Oct 2019 13:03:04 -0400
Received: by mail-wm1-f68.google.com with SMTP id b24so7709516wmj.5
        for <linux-gpio@vger.kernel.org>; Wed, 02 Oct 2019 10:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ay1R6FhENJS8iuSt2hpBFZDMGFIotJho7ukRf5r3dck=;
        b=MWVzQOQN+uVNRPqyDGE93yTy5SoALgAqpLtzI7wvkE7DSnqH4tkxj6RbzO4XraolUb
         ma9o+W+VQJ0XgwIgfsDHYifdihGE9/VS3e1vL+8r3uQn876yl+lXcwg8MepgJpWnCdfA
         IL7Dvc/R5z9kD1C/6i9E2SsUg5rjAxoaXZtjMOkWGaGsTThQcGCoNX+jSAe2MB6Esmit
         8R7SCTcZnZe3S6O+W21LtAzfagisBoyWTBUiNtzrqb1pGX7hINXwmSLYnTA4m0tf0FA6
         CQmrWF/DLXj2KE9iXXop4VOauA3jsJQIRqBe+UqaojMJdyN1saBYLO1QWZgF4bJ8zPGr
         bgpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ay1R6FhENJS8iuSt2hpBFZDMGFIotJho7ukRf5r3dck=;
        b=fqQG5VhPR7hc0/mmp2tn6jZeq8gc5Vdd1UuSXBnQBjJ7MgI4H5lJG8Bt+mzmBfX4jy
         h/b5NcF2f1A33ZrmXq4e4g9bqXCvYnfx3sibKxJsft/z7UOWB2sosAHkLZeEGGsyWNsf
         5bGlYChnIyeiXW3eZk91Vv+p2GQkXwhJD5ROoovfgKwJUSWYKMJC3/TOWYeMfPbXp2OU
         Z/CJkP9PdtmZisBAWqGQmnSO5+gpiJJ6uK48UnbdYpXPmhGV858XqNEXkBG3QTvlYl4P
         TZLw9LPYpF1dB3/TdWGjenCJ0CgHzCXWp/H+qZtQL4rroDEDHSqwGSxKXDH6TJE5BNOt
         xFcw==
X-Gm-Message-State: APjAAAV6EvffueXCTc7USVVd2THIZAaA/iUG6jKIH5A/dYVD30eQpIHO
        BirZ9KXRCi3qi8rwTWkacQZnKw==
X-Google-Smtp-Source: APXvYqz22BjvpDGrKPhqCAJTVhgzXE+CXeU8J/gVwlnoocSXs5j7yKxbBPTecnnvvmjh8rOlPzlRpQ==
X-Received: by 2002:a1c:c14a:: with SMTP id r71mr3812504wmf.46.1570035783552;
        Wed, 02 Oct 2019 10:03:03 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
        by smtp.gmail.com with ESMTPSA id b62sm11188575wmc.13.2019.10.02.10.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2019 10:03:02 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Alban Bedel <albeu@free.fr>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 5/6] gpio: htc-egpio: use devm_platform_ioremap_resource()
Date:   Wed,  2 Oct 2019 19:02:48 +0200
Message-Id: <20191002170249.17366-6-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191002170249.17366-1-brgl@bgdev.pl>
References: <20191002170249.17366-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

There's no need to use the nocache variant of ioremap(). Switch to
using devm_platform_ioremap_resource().

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpio-htc-egpio.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-htc-egpio.c b/drivers/gpio/gpio-htc-egpio.c
index 6eb56f7ab9c9..2d4b0b888f66 100644
--- a/drivers/gpio/gpio-htc-egpio.c
+++ b/drivers/gpio/gpio-htc-egpio.c
@@ -281,14 +281,9 @@ static int __init egpio_probe(struct platform_device *pdev)
 		ei->chained_irq = res->start;
 
 	/* Map egpio chip into virtual address space. */
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res)
+	ei->base_addr = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(ei->base_addr))
 		goto fail;
-	ei->base_addr = devm_ioremap_nocache(&pdev->dev, res->start,
-					     resource_size(res));
-	if (!ei->base_addr)
-		goto fail;
-	pr_debug("EGPIO phys=%08x virt=%p\n", (u32)res->start, ei->base_addr);
 
 	if ((pdata->bus_width != 16) && (pdata->bus_width != 32))
 		goto fail;
-- 
2.23.0

