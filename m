Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B4E82B55F5
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Nov 2020 02:09:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727106AbgKQBJ2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Nov 2020 20:09:28 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:8096 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725814AbgKQBJ2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Nov 2020 20:09:28 -0500
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CZns01YDlzLnt1;
        Tue, 17 Nov 2020 09:09:08 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.487.0; Tue, 17 Nov 2020
 09:09:19 +0800
From:   Yu Kuai <yukuai3@huawei.com>
To:     <linus.walleij@linaro.org>
CC:     <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <yukuai3@huawei.com>, <yi.zhang@huawei.com>,
        <zhangxiaoxu5@huawei.com>
Subject: [PATCH] pinctrl: falcon: add missing put_device() call in pinctrl_falcon_probe()
Date:   Tue, 17 Nov 2020 09:12:52 +0800
Message-ID: <20201117011252.469915-1-yukuai3@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

if of_find_device_by_node() succeed, pinctrl_falcon_probe() doesn't have
a corresponding put_device(). Thus add put_device() to fix the exception
handling for this function implementation.

Fixes: commit e316cb2b16bb ("OF: pinctrl: MIPS: lantiq: adds support for FALCON SoC")
Signed-off-by: Yu Kuai <yukuai3@huawei.com>
---
 drivers/pinctrl/pinctrl-falcon.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-falcon.c b/drivers/pinctrl/pinctrl-falcon.c
index 62c02b969327..7521a924dffb 100644
--- a/drivers/pinctrl/pinctrl-falcon.c
+++ b/drivers/pinctrl/pinctrl-falcon.c
@@ -431,24 +431,28 @@ static int pinctrl_falcon_probe(struct platform_device *pdev)
 
 	/* load and remap the pad resources of the different banks */
 	for_each_compatible_node(np, NULL, "lantiq,pad-falcon") {
-		struct platform_device *ppdev = of_find_device_by_node(np);
 		const __be32 *bank = of_get_property(np, "lantiq,bank", NULL);
 		struct resource res;
+		struct platform_device *ppdev;
 		u32 avail;
 		int pins;
 
 		if (!of_device_is_available(np))
 			continue;
 
-		if (!ppdev) {
-			dev_err(&pdev->dev, "failed to find pad pdev\n");
-			continue;
-		}
 		if (!bank || *bank >= PORTS)
 			continue;
 		if (of_address_to_resource(np, 0, &res))
 			continue;
+
+		ppdev = of_find_device_by_node(np);
+		if (!ppdev) {
+			dev_err(&pdev->dev, "failed to find pad pdev\n");
+			continue;
+		}
+
 		falcon_info.clk[*bank] = clk_get(&ppdev->dev, NULL);
+		put_device(&ppdev->dev);
 		if (IS_ERR(falcon_info.clk[*bank])) {
 			dev_err(&ppdev->dev, "failed to get clock\n");
 			of_node_put(np);
-- 
2.25.4

