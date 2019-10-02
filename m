Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 10E56C8F36
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2019 19:03:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728463AbfJBRDQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Oct 2019 13:03:16 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:54487 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728145AbfJBRDE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Oct 2019 13:03:04 -0400
Received: by mail-wm1-f65.google.com with SMTP id p7so8003556wmp.4
        for <linux-gpio@vger.kernel.org>; Wed, 02 Oct 2019 10:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4R1pFMiYgGmsrKFaVjsr4CfqOpIjL8+dlsXA4/2/eWc=;
        b=QzNqSGXXrkEMylsWIdkVp1QE2PoiBzEzoPHXnSdEzwqM/i27K0EnnoMQsy8oXtMzMz
         G0erLAZr3GqGCvyIN8vGCo1Krf2cnDHjKo3F7i7O5lXp4LCRDLFmixDQGL/pRcovDnZ+
         3+2YpF6bpI7mdXb0Wd1buJ3VF8yhLlhvl1oykTsRmencBi8cUrv3ZQ3XmvO6T9HyzNLD
         bfk1YRitp5l8qLsK0SwBDbY2qlbu5ykgoNdccKNDD9+bchQOb8XeKGZfT+NGPc/DSqE+
         HgIMAkgs2/+RKb6rZx5/nRGjPvpHvDbu2fZ5xa4BmpmUrjIvjyjnBqSJm7EyBd+TkqNO
         heMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4R1pFMiYgGmsrKFaVjsr4CfqOpIjL8+dlsXA4/2/eWc=;
        b=R3WtwMSUIZYDKMPq+enLkGaDMGhu+61aeIw4SeTBNm2V+25J6av6BzlfpYc+vQuKFR
         Xn0//d+0xf05s+DAkbX1PtvBESiPNCT69Dt+9uCZK+ibNJbiMeL2z65v1G/F6EK9ouKR
         I8L3/13Lu72m1k4XuoH3M7h2KSqhakmjNuxTI4SvSeECDha5eVoZ31wKb7GNF28qH3uB
         Vj4GfLJSCborOHzmXkhWZ4BnaqRUZAYBukawRw7QoN540VTAlly8mWtYNn5VS1TTH6q1
         M+qbbg4snhBmxnJnmRRy3WqXPuFYA3h47SUZjjspXOtEFFXCNxTHdMMrkU5z5g7FpZX0
         pKhQ==
X-Gm-Message-State: APjAAAU6F3WF6rxiSRC8NiNyzHpG4tgoBuCzH5wOd2BmULz8ocxUSPTm
        yEVW9Urt36q9oSFZEJQ9vTuZjQ==
X-Google-Smtp-Source: APXvYqzpviBQxFnllxgLIMD5etZwxvfroogQ32SBiQEuYxpYuHJZHwqSJFyGGMaiLTknVGRotdfxLw==
X-Received: by 2002:a05:600c:290c:: with SMTP id i12mr3808333wmd.77.1570035782386;
        Wed, 02 Oct 2019 10:03:02 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
        by smtp.gmail.com with ESMTPSA id b62sm11188575wmc.13.2019.10.02.10.03.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2019 10:03:01 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Alban Bedel <albeu@free.fr>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 4/6] gpio: ath79: use devm_platform_ioremap_resource()
Date:   Wed,  2 Oct 2019 19:02:47 +0200
Message-Id: <20191002170249.17366-5-brgl@bgdev.pl>
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
 drivers/gpio/gpio-ath79.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-ath79.c b/drivers/gpio/gpio-ath79.c
index f1a5ea9b3de2..53fae02c40ad 100644
--- a/drivers/gpio/gpio-ath79.c
+++ b/drivers/gpio/gpio-ath79.c
@@ -226,7 +226,6 @@ static int ath79_gpio_probe(struct platform_device *pdev)
 	struct device_node *np = dev->of_node;
 	struct ath79_gpio_ctrl *ctrl;
 	struct gpio_irq_chip *girq;
-	struct resource *res;
 	u32 ath79_gpio_count;
 	bool oe_inverted;
 	int err;
@@ -256,12 +255,9 @@ static int ath79_gpio_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res)
-		return -EINVAL;
-	ctrl->base = devm_ioremap_nocache(dev, res->start, resource_size(res));
-	if (!ctrl->base)
-		return -ENOMEM;
+	ctrl->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(ctrl->base))
+		return PTR_ERR(ctrl->base);
 
 	raw_spin_lock_init(&ctrl->lock);
 	err = bgpio_init(&ctrl->gc, dev, 4,
-- 
2.23.0

