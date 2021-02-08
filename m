Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0383312CB5
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Feb 2021 10:07:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231197AbhBHJBA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Feb 2021 04:01:00 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:12528 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231126AbhBHI7X (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Feb 2021 03:59:23 -0500
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DZ0JS3jdnzMTXW;
        Mon,  8 Feb 2021 16:56:56 +0800 (CST)
Received: from huawei.com (10.69.192.56) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.498.0; Mon, 8 Feb 2021
 16:58:35 +0800
From:   Luo Jiaxing <luojiaxing@huawei.com>
To:     <linus.walleij@linaro.org>, <andy.shevchenko@gmail.com>,
        <andriy.shevchenko@linux.intel.com>, <grygorii.strashko@ti.com>,
        <ssantosh@kernel.org>, <khilman@kernel.org>
CC:     <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linuxarm@openeuler.org>
Subject: [PATCH for next v1 2/2] gpio: grgpio: Replace spin_lock_irqsave with spin_lock in grgpio_irq_handler()
Date:   Mon, 8 Feb 2021 16:57:57 +0800
Message-ID: <1612774677-56758-3-git-send-email-luojiaxing@huawei.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1612774677-56758-1-git-send-email-luojiaxing@huawei.com>
References: <1612774677-56758-1-git-send-email-luojiaxing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

There is no need to use API with _irqsave in grgpio_irq_handler(),
because it already be in a irq-disabled context.

Signed-off-by: Luo Jiaxing <luojiaxing@huawei.com>
---
 drivers/gpio/gpio-grgpio.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-grgpio.c b/drivers/gpio/gpio-grgpio.c
index f954359..fa5aa31 100644
--- a/drivers/gpio/gpio-grgpio.c
+++ b/drivers/gpio/gpio-grgpio.c
@@ -195,11 +195,10 @@ static irqreturn_t grgpio_irq_handler(int irq, void *dev)
 {
 	struct grgpio_priv *priv = dev;
 	int ngpio = priv->gc.ngpio;
-	unsigned long flags;
 	int i;
 	int match = 0;
 
-	spin_lock_irqsave(&priv->gc.bgpio_lock, flags);
+	spin_lock(&priv->gc.bgpio_lock);
 
 	/*
 	 * For each gpio line, call its interrupt handler if it its underlying
@@ -215,7 +214,7 @@ static irqreturn_t grgpio_irq_handler(int irq, void *dev)
 		}
 	}
 
-	spin_unlock_irqrestore(&priv->gc.bgpio_lock, flags);
+	spin_unlock(&priv->gc.bgpio_lock);
 
 	if (!match)
 		dev_warn(priv->dev, "No gpio line matched irq %d\n", irq);
-- 
2.7.4

