Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 770EE2EEF82
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Jan 2021 10:25:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728430AbhAHJYI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Jan 2021 04:24:08 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:10419 "EHLO
        szxga06-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728443AbhAHJYI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Jan 2021 04:24:08 -0500
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4DByLT4K9qzj0SP;
        Fri,  8 Jan 2021 17:22:41 +0800 (CST)
Received: from ubuntu.network (10.175.138.68) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.498.0; Fri, 8 Jan 2021 17:23:20 +0800
From:   Zheng Yongjun <zhengyongjun3@huawei.com>
To:     <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
        <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     Zheng Yongjun <zhengyongjun3@huawei.com>
Subject: [PATCH v2 -next] gpio: max77620: convert comma to semicolon
Date:   Fri, 8 Jan 2021 17:24:05 +0800
Message-ID: <20210108092405.19291-1-zhengyongjun3@huawei.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.138.68]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Replace a comma between expression statements by a semicolon.

Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
---
 drivers/gpio/gpio-max77620.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-max77620.c b/drivers/gpio/gpio-max77620.c
index 7c0a9ef0b500..82b3a913005d 100644
--- a/drivers/gpio/gpio-max77620.c
+++ b/drivers/gpio/gpio-max77620.c
@@ -325,7 +325,7 @@ static int max77620_gpio_probe(struct platform_device *pdev)
 	girq->parents = NULL;
 	girq->default_type = IRQ_TYPE_NONE;
 	girq->handler = handle_edge_irq;
-	girq->init_hw = max77620_gpio_irq_init_hw,
+	girq->init_hw = max77620_gpio_irq_init_hw;
 	girq->threaded = true;
 
 	platform_set_drvdata(pdev, mgpio);
-- 
2.22.0

