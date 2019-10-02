Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6C9BC8F3A
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2019 19:03:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728143AbfJBRDD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Oct 2019 13:03:03 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:51462 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728026AbfJBRDC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Oct 2019 13:03:02 -0400
Received: by mail-wm1-f65.google.com with SMTP id 7so8015172wme.1
        for <linux-gpio@vger.kernel.org>; Wed, 02 Oct 2019 10:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=k98jJ6leJNvu6m3znq1eJetk1/42eBKvt3QqR0mLfj8=;
        b=lxKDJIxtrA+AaoH9hHGjmKKlsAsLooqmCiaDKqDhytOP8eU/kmgw3hiObzp4jcX/+y
         lR/DNiWn0o80MKmPsDj2WSpg76giCUluFDBOPZ0Grw1ewH6hJ/kkQ8fckhdu9B6Ydf1v
         dhBE0MEiT2EDeJaebmIH+s4oUBoQVxs2oAr9R/cQsdEg7Obw9G2+CfvBL/pw22lg0vdj
         A2YVr23O9N0V6G70wrUl46SoYVoMK752FUAQRmXfsooe7LIXSAoPeN+F/syMH3xtwsUB
         ivJUCnKPfpiydMcAlUi/RpcEESq1m9ZspJda3Xgf9yVXnXm8m9J7uvSWmfEf9YcB7wNg
         MAow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=k98jJ6leJNvu6m3znq1eJetk1/42eBKvt3QqR0mLfj8=;
        b=TOHCLP6AHTXLfHxdLvIpC++7OuUlr3oIA+JJgY8x5pGIWM62d0AS7pd0fNm5UnEyRG
         mZZxqAkm+P27+SwHnp8jnxjYjEi4deYdUWbf4vvP6m9GdXyqK0ZSINETEA/PT89o1XXL
         z7gpc20vP97Og50Kn9+poP9YzDFFG26Qb+DoYTB9xGthQw8ozryI5X2krQO9utlVPwRo
         vecGZT64OmiEAoG1j8oLjLeF8DMOfuPuXsudaEsrKTaPJ3itgkpoF81POkTC6S6c3oYW
         hvyARewLVJtCXcKD1QYfd146niuPhjGlLzS6X8FmCa/yCvcTj5WevBpXfDy9F6XZ5g8q
         K0Yw==
X-Gm-Message-State: APjAAAX3MpOvTBMVmClIr4+VoCQIzIGGZwKTp2KtuSN2CsgiFQRMI70N
        ENw2t+HieGOOy1Myddw4ghgBJw==
X-Google-Smtp-Source: APXvYqytl9aa2IhBwRidDycF7p7f4DA6mc+u9jHirYf0nudjJF4WIB863gOOvVY2rpb8EO7ANCLkOQ==
X-Received: by 2002:a05:600c:24cf:: with SMTP id 15mr3691526wmu.139.1570035780056;
        Wed, 02 Oct 2019 10:03:00 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
        by smtp.gmail.com with ESMTPSA id b62sm11188575wmc.13.2019.10.02.10.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2019 10:02:59 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Alban Bedel <albeu@free.fr>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 2/6] gpio: xgene: use devm_platform_ioremap_resource()
Date:   Wed,  2 Oct 2019 19:02:45 +0200
Message-Id: <20191002170249.17366-3-brgl@bgdev.pl>
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
 drivers/gpio/gpio-xgene.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-xgene.c b/drivers/gpio/gpio-xgene.c
index 900b38a7dba8..a6e66ac18e1f 100644
--- a/drivers/gpio/gpio-xgene.c
+++ b/drivers/gpio/gpio-xgene.c
@@ -155,7 +155,6 @@ static SIMPLE_DEV_PM_OPS(xgene_gpio_pm, xgene_gpio_suspend, xgene_gpio_resume);
 
 static int xgene_gpio_probe(struct platform_device *pdev)
 {
-	struct resource *res;
 	struct xgene_gpio *gpio;
 	int err = 0;
 
@@ -163,14 +162,9 @@ static int xgene_gpio_probe(struct platform_device *pdev)
 	if (!gpio)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res)
-		return -EINVAL;
-
-	gpio->base = devm_ioremap_nocache(&pdev->dev, res->start,
-							resource_size(res));
-	if (!gpio->base)
-		return -ENOMEM;
+	gpio->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(gpio->base))
+		return PTR_ERR(gpio->base);
 
 	gpio->chip.ngpio = XGENE_MAX_GPIOS;
 
-- 
2.23.0

