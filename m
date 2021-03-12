Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2531D3385FF
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Mar 2021 07:36:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231861AbhCLGfZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 12 Mar 2021 01:35:25 -0500
Received: from mailgw01.mediatek.com ([210.61.82.183]:51394 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S231765AbhCLGfP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 12 Mar 2021 01:35:15 -0500
X-UUID: 51bdb82c8a9f43aab5225e746b882b3c-20210312
X-UUID: 51bdb82c8a9f43aab5225e746b882b3c-20210312
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
        (envelope-from <zhiyong.tao@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 213615173; Fri, 12 Mar 2021 14:35:07 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 12 Mar 2021 14:35:06 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 12 Mar 2021 14:35:05 +0800
From:   Zhiyong Tao <zhiyong.tao@mediatek.com>
To:     <robh+dt@kernel.org>, <linus.walleij@linaro.org>,
        <mark.rutland@arm.com>, <matthias.bgg@gmail.com>,
        <sean.wang@kernel.org>
CC:     <srv_heupstream@mediatek.com>, <zhiyong.tao@mediatek.com>,
        <hui.liu@mediatek.com>, <eddie.huang@mediatek.com>,
        <jg_poxu@mediatek.com>, <biao.huang@mediatek.com>,
        <hongzhou.yang@mediatek.com>, <erin.lo@mediatek.com>,
        <sean.wang@mediatek.com>, <seiya.wang@mediatek.com>,
        <sj.huang@mediatek.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>
Subject: [PATCH] pinctrl: add lock in mtk_rmw function.
Date:   Fri, 12 Mar 2021 14:35:02 +0800
Message-ID: <20210312063502.3685-2-zhiyong.tao@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210312063502.3685-1-zhiyong.tao@mediatek.com>
References: <20210312063502.3685-1-zhiyong.tao@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

When multiple threads operate on the same register resource
which include multiple pin, It will make the register resource
wrong to control. So we add lock to avoid the case.

Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
---
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 4 ++++
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h | 2 ++
 drivers/pinctrl/mediatek/pinctrl-paris.c         | 2 ++
 3 files changed, 8 insertions(+)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
index 72f17f26acd8..fcf7c3eeee4a 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
@@ -58,10 +58,14 @@ void mtk_rmw(struct mtk_pinctrl *pctl, u8 i, u32 reg, u32 mask, u32 set)
 {
 	u32 val;
 
+	mutex_lock(&pctl->lock);
+
 	val = mtk_r32(pctl, i, reg);
 	val &= ~mask;
 	val |= set;
 	mtk_w32(pctl, i, reg, val);
+
+	mutex_unlock(&pctl->lock);
 }
 
 static int mtk_hw_pin_field_lookup(struct mtk_pinctrl *hw,
diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
index e2aae285b5fc..65eac708a3b3 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
@@ -251,6 +251,8 @@ struct mtk_pinctrl {
 	struct mtk_eint			*eint;
 	struct mtk_pinctrl_group	*groups;
 	const char          **grp_names;
+	/* lock pin's register resource to avoid multiple threads issue*/
+	struct mutex lock;
 };
 
 void mtk_rmw(struct mtk_pinctrl *pctl, u8 i, u32 reg, u32 mask, u32 set);
diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
index da1f19288aa6..48e823f6d293 100644
--- a/drivers/pinctrl/mediatek/pinctrl-paris.c
+++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
@@ -970,6 +970,8 @@ int mtk_paris_pinctrl_probe(struct platform_device *pdev,
 
 	hw->nbase = hw->soc->nbase_names;
 
+	mutex_init(&hw->lock);
+
 	err = mtk_pctrl_build_state(pdev);
 	if (err) {
 		dev_err(&pdev->dev, "build state failed: %d\n", err);
-- 
2.18.0

