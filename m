Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9E7E37A2A3
	for <lists+linux-gpio@lfdr.de>; Tue, 11 May 2021 10:51:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231176AbhEKIws (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 May 2021 04:52:48 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:2619 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230518AbhEKIws (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 11 May 2021 04:52:48 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FfWm25wHQzPwZY;
        Tue, 11 May 2021 16:48:18 +0800 (CST)
Received: from thunder-town.china.huawei.com (10.174.177.72) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.498.0; Tue, 11 May 2021 16:51:32 +0800
From:   Zhen Lei <thunder.leizhen@huawei.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
CC:     Zhen Lei <thunder.leizhen@huawei.com>
Subject: [PATCH 1/1] pinctrl: iproc-gpio: Remove redundant error printing in iproc_gpio_probe()
Date:   Tue, 11 May 2021 16:51:26 +0800
Message-ID: <20210511085126.4287-1-thunder.leizhen@huawei.com>
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
 drivers/pinctrl/bcm/pinctrl-iproc-gpio.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c b/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
index e2bd2dce6bb4154..dc511b9a6b43f1b 100644
--- a/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
+++ b/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
@@ -813,10 +813,8 @@ static int iproc_gpio_probe(struct platform_device *pdev)
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
 	if (res) {
 		chip->io_ctrl = devm_ioremap_resource(dev, res);
-		if (IS_ERR(chip->io_ctrl)) {
-			dev_err(dev, "unable to map I/O memory\n");
+		if (IS_ERR(chip->io_ctrl))
 			return PTR_ERR(chip->io_ctrl);
-		}
 		if (of_device_is_compatible(dev->of_node,
 					    "brcm,cygnus-ccm-gpio"))
 			io_ctrl_type = IOCTRL_TYPE_CDRU;
-- 
2.26.0.106.g9fadedd


