Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 582352D722C
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Dec 2020 09:48:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391682AbgLKIr5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Dec 2020 03:47:57 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:9515 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392639AbgLKIrj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Dec 2020 03:47:39 -0500
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CsksV3c73zhqcD;
        Fri, 11 Dec 2020 16:46:22 +0800 (CST)
Received: from ubuntu.network (10.175.138.68) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.487.0; Fri, 11 Dec 2020 16:46:49 +0800
From:   Zheng Yongjun <zhengyongjun3@huawei.com>
To:     <sean.wang@kernel.org>, <linus.walleij@linaro.org>,
        <matthias.bgg@gmail.com>, <linux-gpio@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     Zheng Yongjun <zhengyongjun3@huawei.com>
Subject: [PATCH -next] mediatek/pinctrl-paris: convert comma to semicolon
Date:   Fri, 11 Dec 2020 16:47:17 +0800
Message-ID: <20201211084717.2371-1-zhengyongjun3@huawei.com>
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
 drivers/pinctrl/mediatek/pinctrl-paris.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
index 623af4410b07..d27b9278ecb3 100644
--- a/drivers/pinctrl/mediatek/pinctrl-paris.c
+++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
@@ -891,8 +891,8 @@ static int mtk_build_gpiochip(struct mtk_pinctrl *hw, struct device_node *np)
 	chip->direction_output	= mtk_gpio_direction_output;
 	chip->get		= mtk_gpio_get;
 	chip->set		= mtk_gpio_set;
-	chip->to_irq		= mtk_gpio_to_irq,
-	chip->set_config	= mtk_gpio_set_config,
+	chip->to_irq		= mtk_gpio_to_irq;
+	chip->set_config	= mtk_gpio_set_config;
 	chip->base		= -1;
 	chip->ngpio		= hw->soc->npins;
 	chip->of_node		= np;
-- 
2.22.0

