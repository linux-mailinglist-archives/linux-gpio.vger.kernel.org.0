Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A15B81E938B
	for <lists+linux-gpio@lfdr.de>; Sat, 30 May 2020 22:20:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729319AbgE3UUH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 30 May 2020 16:20:07 -0400
Received: from smtp04.smtpout.orange.fr ([80.12.242.126]:60434 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728741AbgE3UUH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 30 May 2020 16:20:07 -0400
Received: from localhost.localdomain ([93.22.132.31])
        by mwinf5d08 with ME
        id l8Kx220050gnv2t038Kxe4; Sat, 30 May 2020 22:20:05 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 30 May 2020 22:20:05 +0200
X-ME-IP: 93.22.132.31
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     aisheng.dong@nxp.com, festevam@gmail.com, shawnguo@kernel.org,
        stefan@agner.ch, kernel@pengutronix.de, linus.walleij@linaro.org,
        s.hauer@pengutronix.de, linux-imx@nxp.com, ldewangan@nvidia.com
Cc:     linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] pinctrl: imxl: Fix an error handling path in 'imx1_pinctrl_core_probe()'
Date:   Sat, 30 May 2020 22:19:52 +0200
Message-Id: <20200530201952.585798-1-christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

When 'pinctrl_register()' has been turned into 'devm_pinctrl_register()',
an error handling path has not been updated.

Axe a now unneeded 'pinctrl_unregister()'.

Fixes: e55e025d1687 ("pinctrl: imxl: Use devm_pinctrl_register() for pinctrl registration")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/pinctrl/freescale/pinctrl-imx1-core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx1-core.c b/drivers/pinctrl/freescale/pinctrl-imx1-core.c
index 0c1c0e72fa8e..08d110078c43 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx1-core.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx1-core.c
@@ -638,7 +638,6 @@ int imx1_pinctrl_core_probe(struct platform_device *pdev,
 
 	ret = of_platform_populate(pdev->dev.of_node, NULL, NULL, &pdev->dev);
 	if (ret) {
-		pinctrl_unregister(ipctl->pctl);
 		dev_err(&pdev->dev, "Failed to populate subdevices\n");
 		return ret;
 	}
-- 
2.25.1

