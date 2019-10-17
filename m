Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 493E4DAD41
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2019 14:50:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388127AbfJQMuk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Oct 2019 08:50:40 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:59920 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2502626AbfJQMsb (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 17 Oct 2019 08:48:31 -0400
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id B4EFF685EF95C51EF687;
        Thu, 17 Oct 2019 20:48:29 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.439.0; Thu, 17 Oct 2019
 20:48:19 +0800
From:   YueHaibing <yuehaibing@huawei.com>
To:     <linus.walleij@linaro.org>, <manivannan.sadhasivam@linaro.org>,
        <afaerber@suse.de>, <f.fainelli@gmail.com>, <rjui@broadcom.com>,
        <sbranden@broadcom.com>, <bcm-kernel-feedback-list@broadcom.com>,
        <jesper.nilsson@axis.com>, <lars.persson@axis.com>,
        <ludovic.desroches@microchip.com>, <nicolas.ferre@microchip.com>,
        <alexandre.belloni@bootlin.com>, <baruch@tkos.co.il>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@axis.com>, <linux-oxnas@groups.io>,
        <linux-renesas-soc@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <vz@mleia.com>, <narmstrong@baylibre.com>,
        <geert+renesas@glider.be>, <daniel@zonque.org>,
        <haojian.zhuang@gmail.com>, <wens@csie.org>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <agross@kernel.org>, YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next 07/30] pinctrl: ns2: use devm_platform_ioremap_resource() to simplify code
Date:   Thu, 17 Oct 2019 20:26:17 +0800
Message-ID: <20191017122640.22976-8-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
In-Reply-To: <20191017122640.22976-1-yuehaibing@huawei.com>
References: <20191017122640.22976-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Use devm_platform_ioremap_resource() to simplify the code a bit.
This is detected by coccinelle.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/pinctrl/bcm/pinctrl-ns2-mux.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-ns2-mux.c b/drivers/pinctrl/bcm/pinctrl-ns2-mux.c
index 9fabc45..32f268f 100644
--- a/drivers/pinctrl/bcm/pinctrl-ns2-mux.c
+++ b/drivers/pinctrl/bcm/pinctrl-ns2-mux.c
@@ -1042,8 +1042,7 @@ static int ns2_pinmux_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, pinctrl);
 	spin_lock_init(&pinctrl->lock);
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	pinctrl->base0 = devm_ioremap_resource(&pdev->dev, res);
+	pinctrl->base0 = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(pinctrl->base0))
 		return PTR_ERR(pinctrl->base0);
 
@@ -1057,8 +1056,7 @@ static int ns2_pinmux_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	}
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 2);
-	pinctrl->pinconf_base = devm_ioremap_resource(&pdev->dev, res);
+	pinctrl->pinconf_base = devm_platform_ioremap_resource(pdev, 2);
 	if (IS_ERR(pinctrl->pinconf_base))
 		return PTR_ERR(pinctrl->pinconf_base);
 
-- 
2.7.4


