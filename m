Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A17392EBE82
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Jan 2021 14:23:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726820AbhAFNTj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 6 Jan 2021 08:19:39 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:10554 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726810AbhAFNTj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 6 Jan 2021 08:19:39 -0500
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4D9qfg06khzMFTr;
        Wed,  6 Jan 2021 21:17:47 +0800 (CST)
Received: from ubuntu.network (10.175.138.68) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.498.0; Wed, 6 Jan 2021 21:18:48 +0800
From:   Zheng Yongjun <zhengyongjun3@huawei.com>
To:     <andy@kernel.org>, <sathyanarayanan.kuppuswamy@linux.intel.com>,
        <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
        <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     Zheng Yongjun <zhengyongjun3@huawei.com>
Subject: [PATCH -next] gpio: wcove: use resource_size
Date:   Wed, 6 Jan 2021 21:19:32 +0800
Message-ID: <20210106131932.774-1-zhengyongjun3@huawei.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.138.68]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Use resource_size rather than a verbose computation on
the end and start fields.

Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
---
 drivers/gpio/gpio-wcove.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-wcove.c b/drivers/gpio/gpio-wcove.c
index b5fbba5a783a..97c5f1d01b62 100644
--- a/drivers/gpio/gpio-wcove.c
+++ b/drivers/gpio/gpio-wcove.c
@@ -434,7 +434,7 @@ static int wcove_gpio_probe(struct platform_device *pdev)
 	wg->chip.get_direction = wcove_gpio_get_direction;
 	wg->chip.get = wcove_gpio_get;
 	wg->chip.set = wcove_gpio_set;
-	wg->chip.set_config = wcove_gpio_set_config,
+	wg->chip.set_config = wcove_gpio_set_config;
 	wg->chip.base = -1;
 	wg->chip.ngpio = WCOVE_VGPIO_NUM;
 	wg->chip.can_sleep = true;
-- 
2.22.0

