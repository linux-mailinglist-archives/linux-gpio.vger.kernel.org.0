Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B20E2D7232
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Dec 2020 09:50:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392424AbgLKIs3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Dec 2020 03:48:29 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:9516 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392446AbgLKIsX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Dec 2020 03:48:23 -0500
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CsktN1724zhqf4;
        Fri, 11 Dec 2020 16:47:08 +0800 (CST)
Received: from ubuntu.network (10.175.138.68) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.487.0; Fri, 11 Dec 2020 16:47:32 +0800
From:   Zheng Yongjun <zhengyongjun3@huawei.com>
To:     <sean.wang@kernel.org>, <linus.walleij@linaro.org>,
        <matthias.bgg@gmail.com>, <linux-gpio@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     Zheng Yongjun <zhengyongjun3@huawei.com>
Subject: [PATCH -next] mediatek/pinctrl-moore: convert comma to semicolon
Date:   Fri, 11 Dec 2020 16:48:01 +0800
Message-ID: <20201211084801.2425-1-zhengyongjun3@huawei.com>
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
 drivers/pinctrl/mediatek/pinctrl-moore.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-moore.c b/drivers/pinctrl/mediatek/pinctrl-moore.c
index 5e00f93ac998..0fa7de43bc4c 100644
--- a/drivers/pinctrl/mediatek/pinctrl-moore.c
+++ b/drivers/pinctrl/mediatek/pinctrl-moore.c
@@ -514,8 +514,8 @@ static int mtk_build_gpiochip(struct mtk_pinctrl *hw, struct device_node *np)
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

