Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9862691FB6
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Aug 2019 11:11:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727128AbfHSJLt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 19 Aug 2019 05:11:49 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:39874 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726767AbfHSJLt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 19 Aug 2019 05:11:49 -0400
Received: by mail-lf1-f66.google.com with SMTP id x3so854517lfn.6
        for <linux-gpio@vger.kernel.org>; Mon, 19 Aug 2019 02:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=j/I05uhQKW/43t9Rdq41q6aXWCJLT9bC/VQUa+EvImA=;
        b=y4u5ErMobz+NU6cVvfgrloapCl5Y+lHaB1H2y34wD7lvAorRFf5K6BQPcYHWGVuRQd
         1ej5WhNeD65Xm7lmV7gL80EW7x3rvZ/iyZfGHALrzSweRczZiyYg+utTnYL8qPEiv9TX
         E7mDDXpDBL1T9c+2ujt2w56tbRVyzuUUqWEQINjCaffOLlH5D4U6QG6rM9nvg3vy1ly5
         /dGrCoWLX1Ef/aH1vYyxYZDXFeyuIUYd9OiysIEAgqg8m/+cNN78MCzESskDLVdyrXIT
         1Nkvx+P4g33GeJ4PSYvTVycbULhq7BIFp7WXxlG6P7ErH0YQnkWXjdtGGrTzXYNKQv00
         nyEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=j/I05uhQKW/43t9Rdq41q6aXWCJLT9bC/VQUa+EvImA=;
        b=OqngIgiqUqOGQJ/iNaKw0q1Mg7sDQQpmSiBwiSZJ3uGLWVnqYIcSD6OT3yTNeY/8SC
         C0ZURjGJfC8agWIRvBcElENYYNoszCIAUEORBAn9hDe1v3DdgGg4SY/XFQQ+SAjYPyfC
         op+2Hmgyi8bgprav1y7n8v7qSah6rL8ghk923Nvud92x6mCJKcD2DJbiWPas+4kOgs0W
         pMMsnIjDo3mTJ94SjA63sUU1xA8axOReWL52EKOc+yK+O6CE678oXBilDkZceYigSHDf
         b+n71ul+7hBKKUgwFdtGA79oYZZxUc6Dj/Uy77earktd3E7gUcfd/qQFenNTD0jFovXs
         QYaw==
X-Gm-Message-State: APjAAAXCaGJtbnyYQRKYkPWy1OdNFfs9peDcMljr9z4p5sc4lhqIt0ej
        CXn87rsV529t0tFzT+9ydm7sfeMTMKw=
X-Google-Smtp-Source: APXvYqyp2wPtP26Jnm9cm6pSd9HHE71sPuVyTNAYXR0RlrPELK+8Cx4EWmEAKI4/IkMPVfaoIHIJSQ==
X-Received: by 2002:a19:80c4:: with SMTP id b187mr11387136lfd.122.1566205906896;
        Mon, 19 Aug 2019 02:11:46 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id q17sm2235494lfa.82.2019.08.19.02.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2019 02:11:45 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Benjamin Gaignard <benjamin.gaignard@st.com>,
        Amelie Delaunay <amelie.delaunay@st.com>
Subject: [PATCH] pinctrl: stmfx: Use the callback to populate valid_mask
Date:   Mon, 19 Aug 2019 11:11:40 +0200
Message-Id: <20190819091140.622-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This makes use of the existing callback to populate the
valid mask instead of iteratively setting it up during
probe.

Cc: Benjamin Gaignard <benjamin.gaignard@st.com>
Cc: Amelie Delaunay <amelie.delaunay@st.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Testing this requires the patch:
"gpio: Pass mask and size with the init_valid_mask()"
that I just sent out.
---
 drivers/pinctrl/pinctrl-stmfx.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-stmfx.c b/drivers/pinctrl/pinctrl-stmfx.c
index d3332da35637..13b6d6f72bcc 100644
--- a/drivers/pinctrl/pinctrl-stmfx.c
+++ b/drivers/pinctrl/pinctrl-stmfx.c
@@ -585,12 +585,24 @@ static int stmfx_pinctrl_gpio_function_enable(struct stmfx_pinctrl *pctl)
 	return stmfx_function_enable(pctl->stmfx, func);
 }
 
+static int stmfx_pinctrl_gpio_init_valid_mask(struct gpio_chip *gc,
+					      unsigned long *valid_mask,
+					      unsigned int ngpios)
+{
+	struct stmfx_pinctrl *pctl = gpiochip_get_data(gc);
+	u32 n;
+
+	for_each_clear_bit(n, &pctl->gpio_valid_mask, ngpios)
+		clear_bit(n, valid_mask);
+
+	return 0;
+}
+
 static int stmfx_pinctrl_probe(struct platform_device *pdev)
 {
 	struct stmfx *stmfx = dev_get_drvdata(pdev->dev.parent);
 	struct device_node *np = pdev->dev.of_node;
 	struct stmfx_pinctrl *pctl;
-	u32 n;
 	int irq, ret;
 
 	pctl = devm_kzalloc(stmfx->dev, sizeof(*pctl), GFP_KERNEL);
@@ -651,6 +663,7 @@ static int stmfx_pinctrl_probe(struct platform_device *pdev)
 	pctl->gpio_chip.can_sleep = true;
 	pctl->gpio_chip.of_node = np;
 	pctl->gpio_chip.need_valid_mask = true;
+	pctl->gpio_chip.init_valid_mask = stmfx_pinctrl_gpio_init_valid_mask;
 
 	ret = devm_gpiochip_add_data(pctl->dev, &pctl->gpio_chip, pctl);
 	if (ret) {
@@ -668,8 +681,6 @@ static int stmfx_pinctrl_probe(struct platform_device *pdev)
 	pctl->irq_chip.irq_set_type = stmfx_pinctrl_irq_set_type;
 	pctl->irq_chip.irq_bus_lock = stmfx_pinctrl_irq_bus_lock;
 	pctl->irq_chip.irq_bus_sync_unlock = stmfx_pinctrl_irq_bus_sync_unlock;
-	for_each_clear_bit(n, &pctl->gpio_valid_mask, pctl->gpio_chip.ngpio)
-		clear_bit(n, pctl->gpio_chip.valid_mask);
 
 	ret = gpiochip_irqchip_add_nested(&pctl->gpio_chip, &pctl->irq_chip,
 					  0, handle_bad_irq, IRQ_TYPE_NONE);
-- 
2.21.0

