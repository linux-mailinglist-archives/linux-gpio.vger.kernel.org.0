Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D58F62D7222
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Dec 2020 09:48:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437082AbgLKIqV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Dec 2020 03:46:21 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:9596 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2437120AbgLKIqD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Dec 2020 03:46:03 -0500
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CskqV4GQXzM31s;
        Fri, 11 Dec 2020 16:44:38 +0800 (CST)
Received: from ubuntu.network (10.175.138.68) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.487.0; Fri, 11 Dec 2020 16:45:12 +0800
From:   Zheng Yongjun <zhengyongjun3@huawei.com>
To:     <linus.walleij@linaro.org>, <linux-gpio@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     Zheng Yongjun <zhengyongjun3@huawei.com>
Subject: [PATCH -next] pinctrl/pinctrl-at91: convert comma to semicolon
Date:   Fri, 11 Dec 2020 16:45:41 +0800
Message-ID: <20201211084541.2318-1-zhengyongjun3@huawei.com>
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
 drivers/pinctrl/pinctrl-at91.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-at91.c b/drivers/pinctrl/pinctrl-at91.c
index 72edc675431c..47b19d3a48cf 100644
--- a/drivers/pinctrl/pinctrl-at91.c
+++ b/drivers/pinctrl/pinctrl-at91.c
@@ -1742,7 +1742,7 @@ static int at91_gpio_of_irq_setup(struct platform_device *pdev,
 	gpio_irqchip->irq_disable = gpio_irq_mask;
 	gpio_irqchip->irq_mask = gpio_irq_mask;
 	gpio_irqchip->irq_unmask = gpio_irq_unmask;
-	gpio_irqchip->irq_set_wake = gpio_irq_set_wake,
+	gpio_irqchip->irq_set_wake = gpio_irq_set_wake;
 	gpio_irqchip->irq_set_type = at91_gpio->ops->irq_type;
 
 	/* Disable irqs of this PIO controller */
-- 
2.22.0

