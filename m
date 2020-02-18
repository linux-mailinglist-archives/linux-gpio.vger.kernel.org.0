Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 19AD3161F04
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Feb 2020 03:36:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726245AbgBRCgj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Feb 2020 21:36:39 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:10197 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726185AbgBRCgj (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 17 Feb 2020 21:36:39 -0500
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id A8648E11E7F6A8CFFD36;
        Tue, 18 Feb 2020 10:36:36 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.439.0; Tue, 18 Feb 2020
 10:36:30 +0800
From:   YueHaibing <yuehaibing@huawei.com>
To:     <sean.wang@kernel.org>, <linus.walleij@linaro.org>,
        <matthias.bgg@gmail.com>, <light.hsieh@mediatek.com>
CC:     <linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@listd.org>, <linux-kernel@vger.kernel.org>,
        YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next] pinctrl: mediatek: remove set but not used variable 'e'
Date:   Tue, 18 Feb 2020 10:36:25 +0800
Message-ID: <20200218023625.14324-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c: In function mtk_hw_pin_field_lookup:
drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c:70:39: warning:
 variable e set but not used [-Wunused-but-set-variable]

Since commit 3de7deefce69 ("pinctrl: mediatek: Check gpio pin
number and use binary search in mtk_hw_pin_field_lookup()"),
it is not used any more, so remove it, also remove redundant
assignment to variable c, it will be assigned a new value later
before used.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
index 1da9425..d3169a8 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
@@ -67,7 +67,7 @@ static int mtk_hw_pin_field_lookup(struct mtk_pinctrl *hw,
 				   const struct mtk_pin_desc *desc,
 				   int field, struct mtk_pin_field *pfd)
 {
-	const struct mtk_pin_field_calc *c, *e;
+	const struct mtk_pin_field_calc *c;
 	const struct mtk_pin_reg_calc *rc;
 	int start = 0, end, check;
 	bool found = false;
@@ -82,8 +82,6 @@ static int mtk_hw_pin_field_lookup(struct mtk_pinctrl *hw,
 	}
 
 	end = rc->nranges - 1;
-	c = rc->range;
-	e = c + rc->nranges;
 
 	while (start <= end) {
 		check = (start + end) >> 1;
-- 
2.7.4


