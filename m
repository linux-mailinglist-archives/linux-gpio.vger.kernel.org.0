Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EB732280C9
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Jul 2020 15:18:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727043AbgGUNST (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Jul 2020 09:18:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726971AbgGUNSS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Jul 2020 09:18:18 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D998C061794
        for <linux-gpio@vger.kernel.org>; Tue, 21 Jul 2020 06:18:18 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id j11so24002423ljo.7
        for <linux-gpio@vger.kernel.org>; Tue, 21 Jul 2020 06:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PDj7eKU6pQ4LSlV2gMMTigD62tSdWrdJ3rzNmA5jIw4=;
        b=l5hz3FswKq/dsdyDyGG/gNpb1FWuoCnHpgowHGJ1Myd/IWlIkaZR33yId6p9xSn8NR
         4kpiq93g5+VEIFSZjAVcxwLulx6h3JwdVbmZTy74DZYDol+42ry6Zjvw9UuMto+s35H4
         Q9Is6Hb51WmSgbhUwAwVhHYrSxy7kQNAZUmvkcW/rXnTUFXrIMJyFEF7a3CSes++T6h1
         Em+3O2ETgXcl1p/EeYxxV19sgjHfHXRzEgyC/Hn8Phvwk+EHtLzbupjZRwgpjGoRRfEA
         ysK8Nj60ruyf+MkZW+/4fCFSz8zNQtGo1iL0wU7eRa+o/bUrj5Sh3s7rTxmNw/pOLiMl
         mBIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PDj7eKU6pQ4LSlV2gMMTigD62tSdWrdJ3rzNmA5jIw4=;
        b=BgTOkYiuXhnDu02Kh7ciVNOBVdTPjPU/UcACSlfRdM6J5pw3DQ7xP7Qq0vtMN5L/En
         H9LH48H4bU6FJxwCHkAO0yQjggMsv1uTyhC664AbcGrXRLBSuVBljIzoPvmA8QVVt3sj
         FdFJvGkm9TC3GP8TU4YotlSz/JwdoAXjETTODOzMMALhDv6PpJduzJ8UOY/tegw/ogX4
         ku+tlEyFdL7fG8tP++QvlUblJRjidFBoOgBIMllIFw0FoYV9vBwLdDZTfp1/kD4q+CXt
         hQC+cRv4UuNgV1CDBwegvBoxH1Onl8gdmAD8y5De4RNfYR1nvBXe7GFZNcsDWbLw8hMc
         IozQ==
X-Gm-Message-State: AOAM5324ycEpxE2iusBVBpDvCCcbzn/L70BPkg7B0M2e067HstSgdXmQ
        Iit+ACdNwAE6Q3K9tmyM24/SkOxpkJU=
X-Google-Smtp-Source: ABdhPJxvq/4tNNhsA9/78QZ4d73kA9leysIfSZPraITLyaUsIkdiOzOCb7sxR+enoPeeymi7MekXHA==
X-Received: by 2002:a2e:86c4:: with SMTP id n4mr13169651ljj.312.1595337496595;
        Tue, 21 Jul 2020 06:18:16 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id u19sm5093086ljk.0.2020.07.21.06.18.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2020 06:18:15 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Amelie Delaunay <amelie.delaunay@st.com>,
        Benjamin Gaignard <benjamin.gaignard@st.com>
Subject: [PATCH] pinctrl: stmfx: Use irqchip template
Date:   Tue, 21 Jul 2020 15:18:14 +0200
Message-Id: <20200721131814.357182-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This makes the driver use the irqchip template to assign
properties to the gpio_irq_chip instead of using the
explicit calls to gpiochip_irqchip_add_nested() and
gpiochip_set_nested_irqchip(). The irqchip is instead
added while adding the gpiochip.

Cc: Amelie Delaunay <amelie.delaunay@st.com>
Cc: Benjamin Gaignard <benjamin.gaignard@st.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/pinctrl-stmfx.c | 32 +++++++++++++++++---------------
 1 file changed, 17 insertions(+), 15 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-stmfx.c b/drivers/pinctrl/pinctrl-stmfx.c
index 1aae803c12cd..008c83107a3c 100644
--- a/drivers/pinctrl/pinctrl-stmfx.c
+++ b/drivers/pinctrl/pinctrl-stmfx.c
@@ -616,6 +616,7 @@ static int stmfx_pinctrl_probe(struct platform_device *pdev)
 	struct stmfx *stmfx = dev_get_drvdata(pdev->dev.parent);
 	struct device_node *np = pdev->dev.of_node;
 	struct stmfx_pinctrl *pctl;
+	struct gpio_irq_chip *girq;
 	int irq, ret;
 
 	pctl = devm_kzalloc(stmfx->dev, sizeof(*pctl), GFP_KERNEL);
@@ -674,16 +675,6 @@ static int stmfx_pinctrl_probe(struct platform_device *pdev)
 	pctl->gpio_chip.can_sleep = true;
 	pctl->gpio_chip.of_node = np;
 
-	ret = devm_gpiochip_add_data(pctl->dev, &pctl->gpio_chip, pctl);
-	if (ret) {
-		dev_err(pctl->dev, "gpio_chip registration failed\n");
-		return ret;
-	}
-
-	ret = stmfx_pinctrl_gpio_function_enable(pctl);
-	if (ret)
-		return ret;
-
 	pctl->irq_chip.name = dev_name(pctl->dev);
 	pctl->irq_chip.irq_mask = stmfx_pinctrl_irq_mask;
 	pctl->irq_chip.irq_unmask = stmfx_pinctrl_irq_unmask;
@@ -693,13 +684,26 @@ static int stmfx_pinctrl_probe(struct platform_device *pdev)
 	pctl->irq_chip.irq_request_resources = stmfx_gpio_irq_request_resources;
 	pctl->irq_chip.irq_release_resources = stmfx_gpio_irq_release_resources;
 
-	ret = gpiochip_irqchip_add_nested(&pctl->gpio_chip, &pctl->irq_chip,
-					  0, handle_bad_irq, IRQ_TYPE_NONE);
+	girq = &pctl->gpio_chip.irq;
+	girq->chip = &pctl->irq_chip;
+	/* This will let us handle the parent IRQ in the driver */
+	girq->parent_handler = NULL;
+	girq->num_parents = 0;
+	girq->parents = NULL;
+	girq->default_type = IRQ_TYPE_NONE;
+	girq->handler = handle_bad_irq;
+	girq->threaded = true;
+
+	ret = devm_gpiochip_add_data(pctl->dev, &pctl->gpio_chip, pctl);
 	if (ret) {
-		dev_err(pctl->dev, "cannot add irqchip to gpiochip\n");
+		dev_err(pctl->dev, "gpio_chip registration failed\n");
 		return ret;
 	}
 
+	ret = stmfx_pinctrl_gpio_function_enable(pctl);
+	if (ret)
+		return ret;
+
 	ret = devm_request_threaded_irq(pctl->dev, irq, NULL,
 					stmfx_pinctrl_irq_thread_fn,
 					IRQF_ONESHOT,
@@ -709,8 +713,6 @@ static int stmfx_pinctrl_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	gpiochip_set_nested_irqchip(&pctl->gpio_chip, &pctl->irq_chip, irq);
-
 	dev_info(pctl->dev,
 		 "%ld GPIOs available\n", hweight_long(pctl->gpio_valid_mask));
 
-- 
2.26.2

