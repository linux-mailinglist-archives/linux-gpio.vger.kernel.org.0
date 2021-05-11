Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C472637A44C
	for <lists+linux-gpio@lfdr.de>; Tue, 11 May 2021 12:07:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231204AbhEKKIG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 May 2021 06:08:06 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:2775 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231468AbhEKKIG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 11 May 2021 06:08:06 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FfYQx53Gszmfn6;
        Tue, 11 May 2021 18:03:37 +0800 (CST)
Received: from thunder-town.china.huawei.com (10.174.177.72) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.498.0; Tue, 11 May 2021 18:06:52 +0800
From:   Zhen Lei <thunder.leizhen@huawei.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio <linux-gpio@vger.kernel.org>
CC:     Zhen Lei <thunder.leizhen@huawei.com>
Subject: [PATCH 1/1] gpio: logicvc: Remove redundant error printing in logicvc_gpio_probe()
Date:   Tue, 11 May 2021 18:06:46 +0800
Message-ID: <20210511100646.5156-1-thunder.leizhen@huawei.com>
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
 drivers/gpio/gpio-logicvc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-logicvc.c b/drivers/gpio/gpio-logicvc.c
index 015632cf159f0b8..992cc958a43fd1e 100644
--- a/drivers/gpio/gpio-logicvc.c
+++ b/drivers/gpio/gpio-logicvc.c
@@ -114,10 +114,8 @@ static int logicvc_gpio_probe(struct platform_device *pdev)
 		}
 
 		base = devm_ioremap_resource(dev, &res);
-		if (IS_ERR(base)) {
-			dev_err(dev, "Failed to map I/O base\n");
+		if (IS_ERR(base))
 			return PTR_ERR(base);
-		}
 
 		logicvc_gpio_regmap_config.max_register = resource_size(&res) -
 			logicvc_gpio_regmap_config.reg_stride;
-- 
2.26.0.106.g9fadedd


