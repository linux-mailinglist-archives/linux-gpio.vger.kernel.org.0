Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B407C37A308
	for <lists+linux-gpio@lfdr.de>; Tue, 11 May 2021 11:09:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231199AbhEKJK6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 May 2021 05:10:58 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:2559 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230442AbhEKJK6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 11 May 2021 05:10:58 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FfX9q4dg0zkWMH;
        Tue, 11 May 2021 17:07:11 +0800 (CST)
Received: from thunder-town.china.huawei.com (10.174.177.72) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.498.0; Tue, 11 May 2021 17:09:40 +0800
From:   Zhen Lei <thunder.leizhen@huawei.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>
CC:     Zhen Lei <thunder.leizhen@huawei.com>
Subject: [PATCH 1/1] pinctrl: ocelot: Remove redundant error printing in ocelot_pinctrl_probe()
Date:   Tue, 11 May 2021 17:09:36 +0800
Message-ID: <20210511090936.4452-1-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.174.177.72]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

When devm_ioremap_resource() fails, a clear enough error message will be
printed by its subfunction __devm_ioremap_resource(). The error
information contains the device name, failure cause, and possibly resource
information.

Therefore, remove the error printing here to simplify code and reduce the
binary size.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 drivers/pinctrl/pinctrl-ocelot.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-ocelot.c b/drivers/pinctrl/pinctrl-ocelot.c
index 2fd18e356d0c6f2..e470c16718dea20 100644
--- a/drivers/pinctrl/pinctrl-ocelot.c
+++ b/drivers/pinctrl/pinctrl-ocelot.c
@@ -1362,10 +1362,8 @@ static int ocelot_pinctrl_probe(struct platform_device *pdev)
 
 	base = devm_ioremap_resource(dev,
 			platform_get_resource(pdev, IORESOURCE_MEM, 0));
-	if (IS_ERR(base)) {
-		dev_err(dev, "Failed to ioremap registers\n");
+	if (IS_ERR(base))
 		return PTR_ERR(base);
-	}
 
 	info->stride = 1 + (info->desc->npins - 1) / 32;
 
-- 
2.26.0.106.g9fadedd


