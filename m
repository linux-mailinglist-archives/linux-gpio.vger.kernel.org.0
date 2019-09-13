Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 512A2B1C75
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Sep 2019 13:35:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728746AbfIMLfu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Sep 2019 07:35:50 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:46273 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727997AbfIMLft (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Sep 2019 07:35:49 -0400
Received: by mail-lf1-f65.google.com with SMTP id t8so21817559lfc.13
        for <linux-gpio@vger.kernel.org>; Fri, 13 Sep 2019 04:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7fzuXx96XHp0b7ACig7FtB2F9taxVpkAUyhMy/tq29E=;
        b=lM0jt6TPY/etsbXeH4R4Xy26TsPvqhxo1drL6tOyXyJydYTyC2gPQyOQVMzH99TAAz
         8ypmn0z4vySqRJdc8B6KNPlrRoy8eCODduGnAcHs6q2VXQGCjALulNjb3crbNMl66Gxw
         QiX0lwnqviD5ke0xKV+zpjxb7gmRbXL2iAZYNi4KnSg/7ocbtDYo6rsi5ZI1T7NM4RAO
         tdwLExLPcEDbr1IazKalqhPtCkm5f+Mq9a0pKMhrWS80YAM++FJubKOutEajf2DYX7iw
         DqlCq7BbKV8KPhn5DREIvqdpC+9UWtaTHtDksHLWVo23mCBrwYVY4RXfMGD0t4Kq/biv
         nG+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7fzuXx96XHp0b7ACig7FtB2F9taxVpkAUyhMy/tq29E=;
        b=nnumPaRmDL1hjCHDmo5t5eHllV9yjwfYTsZuIG8D0hZiJDiYnT4/D3KAwIh1/SjrS5
         MkdZJeqy+kGhdPEH1GNrv+XdgWvrQ6ZtA6ZICzTyw4z+i2gTMdlQMLCaCWX9iAF7l+lg
         tSYbqwLH3ZOtnDdDewXNA0a4GheVoWHCoUG1e10Bk7WkHJ4kQqDl1PrLCbrMBZnn+75T
         Eqqs4/tqEaJyu/xCO6iDoy+f6cgyroWD6W/VViBLoP4YFfFCpyz38WvesBA12c8GxAQW
         iqn+kf9mE7EUFei+IOjIvDDOeDkKRUyZ32RD8NUKa/KrGCsDENRvPFp/xj40sqdCc2rj
         JUIQ==
X-Gm-Message-State: APjAAAVs+rZP3hl7LRbMjW71izs5PqSD1rpYS64p81PX5k5IWTe85UCb
        pH45mCCecbIuzrMtbzhuv6Hx2R4ITSjoCgEw
X-Google-Smtp-Source: APXvYqy0HD+z7C6MT39Xmb9ujdY8LJ6z/zcNIDztvVZMSdGPDpxhYgP7iXuRbTdSNHbVN1BzBLGAqw==
X-Received: by 2002:ac2:52a9:: with SMTP id r9mr9444964lfm.172.1568374547606;
        Fri, 13 Sep 2019 04:35:47 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id v17sm6177440ljh.8.2019.09.13.04.35.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2019 04:35:46 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Barry Song <baohua@kernel.org>,
        Yuping Luo <yuping.luo@csr.com>,
        Rongjun Ying <rongjun.ying@csr.com>,
        Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 6/6] pinctrl: sirf/atlas7: Pass irqchip when adding gpiochip
Date:   Fri, 13 Sep 2019 13:35:30 +0200
Message-Id: <20190913113530.5536-6-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190913113530.5536-1-linus.walleij@linaro.org>
References: <20190913113530.5536-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

We need to convert all old gpio irqchips to pass the irqchip
setup along when adding the gpio_chip. For more info see
drivers/gpio/TODO.

For chained irqchips this is a pretty straight-forward
conversion.

Cc: Barry Song <baohua@kernel.org>
Cc: Yuping Luo <yuping.luo@csr.com>
Cc: Rongjun Ying <rongjun.ying@csr.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/sirf/pinctrl-atlas7.c | 41 ++++++++++++++-------------
 1 file changed, 21 insertions(+), 20 deletions(-)

diff --git a/drivers/pinctrl/sirf/pinctrl-atlas7.c b/drivers/pinctrl/sirf/pinctrl-atlas7.c
index 924080362bf7..b1a9611f46b3 100644
--- a/drivers/pinctrl/sirf/pinctrl-atlas7.c
+++ b/drivers/pinctrl/sirf/pinctrl-atlas7.c
@@ -5996,6 +5996,7 @@ static int atlas7_gpio_probe(struct platform_device *pdev)
 	struct gpio_chip *chip;
 	u32 nbank;
 	int ret, idx;
+	struct gpio_irq_chip *girq;
 
 	ret = of_property_read_u32(np, "gpio-banks", &nbank);
 	if (ret) {
@@ -6048,24 +6049,15 @@ static int atlas7_gpio_probe(struct platform_device *pdev)
 	chip->of_gpio_n_cells = 2;
 	chip->parent = &pdev->dev;
 
-	/* Add gpio chip to system */
-	ret = gpiochip_add_data(chip, a7gc);
-	if (ret) {
-		dev_err(&pdev->dev,
-			"%pOF: error in probe function with status %d\n",
-			np, ret);
-		goto failed;
-	}
-
-	/* Add gpio chip to irq subsystem */
-	ret =  gpiochip_irqchip_add(chip, &atlas7_gpio_irq_chip,
-			0, handle_level_irq, IRQ_TYPE_NONE);
-	if (ret) {
-		dev_err(&pdev->dev,
-			"could not connect irqchip to gpiochip\n");
-		goto failed;
-	}
-
+	girq = &chip->irq;
+	girq->chip = &atlas7_gpio_irq_chip;
+	girq->parent_handler = atlas7_gpio_handle_irq;
+	girq->num_parents = nbank;
+	girq->parents = devm_kcalloc(&pdev->dev, nbank,
+				     sizeof(*girq->parents),
+				     GFP_KERNEL);
+	if (!girq->parents)
+		return -ENOMEM;
 	for (idx = 0; idx < nbank; idx++) {
 		struct atlas7_gpio_bank *bank;
 
@@ -6084,9 +6076,18 @@ static int atlas7_gpio_probe(struct platform_device *pdev)
 			goto failed;
 		}
 		bank->irq = ret;
+		girq->parents[idx] = ret;
+	}
+	girq->default_type = IRQ_TYPE_NONE;
+	girq->handler = handle_level_irq;
 
-		gpiochip_set_chained_irqchip(chip, &atlas7_gpio_irq_chip,
-					bank->irq, atlas7_gpio_handle_irq);
+	/* Add gpio chip to system */
+	ret = gpiochip_add_data(chip, a7gc);
+	if (ret) {
+		dev_err(&pdev->dev,
+			"%pOF: error in probe function with status %d\n",
+			np, ret);
+		goto failed;
 	}
 
 	platform_set_drvdata(pdev, a7gc);
-- 
2.21.0

