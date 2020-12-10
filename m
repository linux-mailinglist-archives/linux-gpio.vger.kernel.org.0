Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3624E2D5C9E
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Dec 2020 15:00:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389652AbgLJN7c (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Dec 2020 08:59:32 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:9591 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727310AbgLJN70 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Dec 2020 08:59:26 -0500
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CsFqZ02DNzM2qB;
        Thu, 10 Dec 2020 21:58:02 +0800 (CST)
Received: from ubuntu.network (10.175.138.68) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.487.0; Thu, 10 Dec 2020 21:58:33 +0800
From:   Zheng Yongjun <zhengyongjun3@huawei.com>
To:     <sean.wang@kernel.org>, <linus.walleij@linaro.org>,
        <matthias.bgg@gmail.com>, <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
CC:     Zheng Yongjun <zhengyongjun3@huawei.com>
Subject: [PATCH -next] pinctrl/mediatek: simplify the return expression of mtk_pinconf_bias_disable_set_rev1()
Date:   Thu, 10 Dec 2020 21:59:02 +0800
Message-ID: <20201210135902.1548-1-zhengyongjun3@huawei.com>
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
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
index 7e950f5d62d0..7aeb552d16ce 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
@@ -488,14 +488,8 @@ EXPORT_SYMBOL_GPL(mtk_pinconf_bias_get);
 int mtk_pinconf_bias_disable_set_rev1(struct mtk_pinctrl *hw,
 				      const struct mtk_pin_desc *desc)
 {
-	int err;
-
-	err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_PULLEN,
-			       MTK_DISABLE);
-	if (err)
-		return err;
-
-	return 0;
+	return mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_PULLEN,
+				MTK_DISABLE);
 }
 EXPORT_SYMBOL_GPL(mtk_pinconf_bias_disable_set_rev1);
 
-- 
2.22.0

