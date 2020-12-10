Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DB092D5C9A
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Dec 2020 14:59:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726550AbgLJN6j (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Dec 2020 08:58:39 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:9154 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389789AbgLJN6H (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Dec 2020 08:58:07 -0500
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CsFpB1fntz15ZG0;
        Thu, 10 Dec 2020 21:56:50 +0800 (CST)
Received: from ubuntu.network (10.175.138.68) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.487.0; Thu, 10 Dec 2020 21:57:17 +0800
From:   Zheng Yongjun <zhengyongjun3@huawei.com>
To:     <vireshk@kernel.org>, <linus.walleij@linaro.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     Zheng Yongjun <zhengyongjun3@huawei.com>
Subject: [PATCH -next] pinctrl/spear: simplify the return expression of spear300_pinctrl_probe()
Date:   Thu, 10 Dec 2020 21:57:46 +0800
Message-ID: <20201210135746.1492-1-zhengyongjun3@huawei.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.138.68]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Simplify the return expression.

Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
---
 drivers/pinctrl/spear/pinctrl-spear300.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/pinctrl/spear/pinctrl-spear300.c b/drivers/pinctrl/spear/pinctrl-spear300.c
index e39913a18139..d53a04597cbe 100644
--- a/drivers/pinctrl/spear/pinctrl-spear300.c
+++ b/drivers/pinctrl/spear/pinctrl-spear300.c
@@ -654,8 +654,6 @@ static const struct of_device_id spear300_pinctrl_of_match[] = {
 
 static int spear300_pinctrl_probe(struct platform_device *pdev)
 {
-	int ret;
-
 	spear3xx_machdata.groups = spear300_pingroups;
 	spear3xx_machdata.ngroups = ARRAY_SIZE(spear300_pingroups);
 	spear3xx_machdata.functions = spear300_functions;
@@ -669,11 +667,7 @@ static int spear300_pinctrl_probe(struct platform_device *pdev)
 
 	pmx_init_addr(&spear3xx_machdata, PMX_CONFIG_REG);
 
-	ret = spear_pinctrl_probe(pdev, &spear3xx_machdata);
-	if (ret)
-		return ret;
-
-	return 0;
+	return spear_pinctrl_probe(pdev, &spear3xx_machdata);
 }
 
 static struct platform_driver spear300_pinctrl_driver = {
-- 
2.22.0

