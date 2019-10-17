Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67CFFDAD13
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2019 14:50:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502776AbfJQMtF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Oct 2019 08:49:05 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:4210 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2502753AbfJQMtD (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 17 Oct 2019 08:49:03 -0400
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id DCF64DF8FCD52FFBE71C;
        Thu, 17 Oct 2019 20:48:55 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.439.0; Thu, 17 Oct 2019
 20:48:49 +0800
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
Subject: [PATCH -next 19/30] pinctrl: tb10x: use devm_platform_ioremap_resource() to simplify code
Date:   Thu, 17 Oct 2019 20:26:29 +0800
Message-ID: <20191017122640.22976-20-yuehaibing@huawei.com>
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
 drivers/pinctrl/pinctrl-tb10x.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-tb10x.c b/drivers/pinctrl/pinctrl-tb10x.c
index 1f64e2e..ab49bd7 100644
--- a/drivers/pinctrl/pinctrl-tb10x.c
+++ b/drivers/pinctrl/pinctrl-tb10x.c
@@ -747,7 +747,6 @@ static struct pinctrl_desc tb10x_pindesc = {
 static int tb10x_pinctrl_probe(struct platform_device *pdev)
 {
 	int ret = -EINVAL;
-	struct resource *mem;
 	struct device *dev = &pdev->dev;
 	struct device_node *of_node = dev->of_node;
 	struct device_node *child;
@@ -768,8 +767,7 @@ static int tb10x_pinctrl_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, state);
 	mutex_init(&state->mutex);
 
-	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	state->base = devm_ioremap_resource(dev, mem);
+	state->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(state->base)) {
 		ret = PTR_ERR(state->base);
 		goto fail;
-- 
2.7.4


