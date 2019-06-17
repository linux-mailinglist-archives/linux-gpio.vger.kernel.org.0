Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9DBE548950
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2019 18:49:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728602AbfFQQtp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Jun 2019 12:49:45 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:47831 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728284AbfFQQtX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Jun 2019 12:49:23 -0400
Received: from orion.localdomain ([77.2.173.233]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MzyAy-1iWGpD2UYo-00wzKU; Mon, 17 Jun 2019 18:49:21 +0200
From:   "Enrico Weigelt, metux IT consult" <info@metux.net>
To:     linux-kernel@vger.kernel.org
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        orsonzhai@gmail.com, baolin.wang@linaro.org, zhang.lyra@gmail.com,
        linux-gpio@vger.kernel.org
Subject: [PATCH 2/7] drivers: gpio: amdpt: drop unneeded deref of &pdev->dev
Date:   Mon, 17 Jun 2019 18:49:15 +0200
Message-Id: <1560790160-3372-2-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1560790160-3372-1-git-send-email-info@metux.net>
References: <1560790160-3372-1-git-send-email-info@metux.net>
X-Provags-ID: V03:K1:Z3KuajUAaUUjLvsAg7Xpv8G/DgShgCtjBl3js4zSDDS61jfGx7s
 oEnwoORX3CnJNmya8kV5iANt4JSd0WRVdObYZpsWOXzhH1YK0yEMOBplGvAjU3evG7V+YoN
 Ixtw9mhS72bQhophVMdXVaratm3ZvZsn85Pc02/hujh2R7w2oZayxA2n6eyhBBCZb3KNidy
 VvgkLsJ3myN4KLJ5uhYvg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:4cTBDo7hRso=:7XE4qgatN8cKIgZKws7cr3
 NwboWBqYLTMyLaahGrLMVKZZhyosrvEcwZBQWgH7Nj1XGL+VlciRg1WTEtJ2xDGTACtr5k+E9
 4JO7vLwZtA+Ujj9dBYMid6zf0DDGH75ZPPIJwevXwzsB31WjcB2UU2b1hEmPqLZfqRBcO2Pag
 d50Lus0c67juIVtzIRRFVYxcDZ0GJ4+6KPtxIr7+r4izufR+ds4KDDKQ2BKAgZ0Z16w9JgN0F
 wRdEbrVKiWtWoLydh2CzcwqY6EvA5cAwlSXKuaY+RiP/j4aZ7Hkla9U1e8tYrkQhd6EBeylHy
 Ai1lO46PatkMXjXOyeC8YZTQRKWs4MuNyLik0Z5vHtjCdlA+ksXEV1LFBxouOomwbeH86gxIS
 iFRRFZrrR9Nliw7Z2HrUfWsEzTsWAQVFafoTDNFdrbvevecP17RQPRWUL91XhrHk2vksTabM3
 vcMEAl2sHj9NuKx4MzcV6kVWMD7o/C/SFsrBxXM1kxTO+GUpAA08SkFhVo1U77AkZ+d2xvijO
 p9ATiShzT1bIM08MCfh2rhXAHBP9aT4DYFb/6FZ9DbNeziHpN6ndjUG5+35KwElkC3PmAOwxS
 vRkr2ObrmY8gU9nBdqMC7fu3KaneMm+gXwclOT7q3/fmcpHMHdrr5iTpmET50GQ3sodV+0Rrx
 LBTtNu/6jQ3Gwm/8fu/uzDvKan0/QhcZ6++Fdu1XSA1PZ+IfMh1UMrtDwStS3iDmJuuQN0NC2
 sn5VRvLf/afi5CjVk9tRgTHXjtSmChlsOh5uTg==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

We already have the struct device* pointer in a local variable,
so we can write this a bit shorter.

Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
---
 drivers/gpio/gpio-amdpt.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-amdpt.c b/drivers/gpio/gpio-amdpt.c
index 1ffd7c2..2ec9d1f 100644
--- a/drivers/gpio/gpio-amdpt.c
+++ b/drivers/gpio/gpio-amdpt.c
@@ -91,7 +91,7 @@ static int pt_gpio_probe(struct platform_device *pdev)
 
 	pt_gpio->reg_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(pt_gpio->reg_base)) {
-		dev_err(&pdev->dev, "Failed to map MMIO resource for PT GPIO.\n");
+		dev_err(dev, "Failed to map MMIO resource for PT GPIO.\n");
 		return PTR_ERR(pt_gpio->reg_base);
 	}
 
@@ -101,7 +101,7 @@ static int pt_gpio_probe(struct platform_device *pdev)
 			 pt_gpio->reg_base + PT_DIRECTION_REG, NULL,
 			 BGPIOF_READ_OUTPUT_REG_SET);
 	if (ret) {
-		dev_err(&pdev->dev, "bgpio_init failed\n");
+		dev_err(dev, "bgpio_init failed\n");
 		return ret;
 	}
 
@@ -110,11 +110,11 @@ static int pt_gpio_probe(struct platform_device *pdev)
 	pt_gpio->gc.free             = pt_gpio_free;
 	pt_gpio->gc.ngpio            = PT_TOTAL_GPIO;
 #if defined(CONFIG_OF_GPIO)
-	pt_gpio->gc.of_node          = pdev->dev.of_node;
+	pt_gpio->gc.of_node          = dev->of_node;
 #endif
 	ret = gpiochip_add_data(&pt_gpio->gc, pt_gpio);
 	if (ret) {
-		dev_err(&pdev->dev, "Failed to register GPIO lib\n");
+		dev_err(dev, "Failed to register GPIO lib\n");
 		return ret;
 	}
 
@@ -124,7 +124,7 @@ static int pt_gpio_probe(struct platform_device *pdev)
 	writel(0, pt_gpio->reg_base + PT_SYNC_REG);
 	writel(0, pt_gpio->reg_base + PT_CLOCKRATE_REG);
 
-	dev_dbg(&pdev->dev, "PT GPIO driver loaded\n");
+	dev_dbg(dev, "PT GPIO driver loaded\n");
 	return ret;
 }
 
-- 
1.9.1

