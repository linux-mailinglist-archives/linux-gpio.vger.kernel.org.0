Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD1A42FF601
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Jan 2021 21:37:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727168AbhAUUgS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Jan 2021 15:36:18 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:38762 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727738AbhAUHxB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Jan 2021 02:53:01 -0500
X-UUID: 8a517e9c67fd4e4d827d11f90b4bfc9d-20210121
X-UUID: 8a517e9c67fd4e4d827d11f90b4bfc9d-20210121
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
        (envelope-from <hailong.fan@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 213492092; Thu, 21 Jan 2021 15:52:00 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 21 Jan 2021 15:51:53 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 21 Jan 2021 15:51:53 +0800
From:   Hailong Fan <hailong.fan@mediatek.com>
To:     Sean Wang <sean.wang@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
CC:     <linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <youlin.pei@mediatek.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        <srv_heupstream@mediatek.com>, <chentsung@chromium.org>,
        <gtk_pangao@mediatek.com>, <hanks.chen@mediatek.com>,
        <yong.wu@mediatek.com>, Hailong Fan <hailong.fan@mediatek.com>
Subject: [PATCH RESEND] pinctrl: mediatek: Fix trigger type setting follow for unexpected interrupt
Date:   Thu, 21 Jan 2021 15:51:49 +0800
Message-ID: <20210121075149.1310-1-hailong.fan@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

When flipping the polarity will be generated interrupt under certain
circumstances, but GPIO external signal has not changed.
Then, mask the interrupt before polarity setting, and clear the
unexpected interrupt after trigger type setting completed.

Signed-off-by: Hailong Fan <hailong.fan@mediatek.com>
---
Resend since some server reject.
---
 drivers/pinctrl/mediatek/mtk-eint.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/mediatek/mtk-eint.c b/drivers/pinctrl/mediatek/mtk-eint.c
index 22736f60c16c..3acda6bb401e 100644
--- a/drivers/pinctrl/mediatek/mtk-eint.c
+++ b/drivers/pinctrl/mediatek/mtk-eint.c
@@ -157,6 +157,7 @@ static void mtk_eint_ack(struct irq_data *d)
 static int mtk_eint_set_type(struct irq_data *d, unsigned int type)
 {
 	struct mtk_eint *eint = irq_data_get_irq_chip_data(d);
+	unsigned int unmask;
 	u32 mask = BIT(d->hwirq & 0x1f);
 	void __iomem *reg;
 
@@ -173,6 +174,13 @@ static int mtk_eint_set_type(struct irq_data *d, unsigned int type)
 	else
 		eint->dual_edge[d->hwirq] = 0;
 
+	if (!mtk_eint_get_mask(eint, d->hwirq)) {
+		mtk_eint_mask(d);
+		unmask = 1;
+	} else {
+		unmask = 0;
+	}
+
 	if (type & (IRQ_TYPE_LEVEL_LOW | IRQ_TYPE_EDGE_FALLING)) {
 		reg = mtk_eint_get_offset(eint, d->hwirq, eint->regs->pol_clr);
 		writel(mask, reg);
@@ -189,8 +197,9 @@ static int mtk_eint_set_type(struct irq_data *d, unsigned int type)
 		writel(mask, reg);
 	}
 
-	if (eint->dual_edge[d->hwirq])
-		mtk_eint_flip_edge(eint, d->hwirq);
+	mtk_eint_ack(d);
+	if (unmask == 1)
+		mtk_eint_unmask(d);
 
 	return 0;
 }
-- 
2.18.0

