Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 97A171259AF
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Dec 2019 03:50:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726895AbfLSCue (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 18 Dec 2019 21:50:34 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:8147 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726463AbfLSCud (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 18 Dec 2019 21:50:33 -0500
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 86CAE7DB640449C6FB7B;
        Thu, 19 Dec 2019 10:50:31 +0800 (CST)
Received: from linux-lmwb.huawei.com (10.175.103.112) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.439.0; Thu, 19 Dec 2019 10:50:20 +0800
From:   Ma Feng <mafeng.ma@huawei.com>
To:     Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>,
        "Gregory Clement" <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Ma Feng <mafeng.ma@huawei.com>
Subject: [PATCH] pinctrl: armada-37xx: Remove unneeded semicolon
Date:   Thu, 19 Dec 2019 10:51:05 +0800
Message-ID: <1576723865-111331-1-git-send-email-mafeng.ma@huawei.com>
X-Mailer: git-send-email 2.6.2
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.103.112]
X-CFilter-Loop: Reflected
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Fixes coccicheck warning:

drivers/pinctrl/mvebu/pinctrl-armada-37xx.c:736:2-3: Unneeded semicolon
drivers/pinctrl/mvebu/pinctrl-armada-37xx.c:803:2-3: Unneeded semicolon

Fixes: commit 5715092a458c ("pinctrl: armada-37xx: Add gpio support")
       commit 2f227605394b ("pinctrl: armada-37xx: Add irqchip support")

Signed-off-by: Ma Feng <mafeng.ma@huawei.com>
---
 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
index aa9dcde..9f0b3d3 100644
--- a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
+++ b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
@@ -733,7 +733,7 @@ static int armada_37xx_irqchip_register(struct platform_device *pdev,
 			ret = 0;
 			break;
 		}
-	};
+	}
 	if (ret) {
 		dev_err(dev, "no gpio-controller child node\n");
 		return ret;
@@ -800,7 +800,7 @@ static int armada_37xx_gpiochip_register(struct platform_device *pdev,
 			ret = 0;
 			break;
 		}
-	};
+	}
 	if (ret)
 		return ret;

--
2.6.2

