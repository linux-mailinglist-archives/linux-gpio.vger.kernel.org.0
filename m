Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A97D944BC0E
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Nov 2021 08:19:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229776AbhKJHWD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Nov 2021 02:22:03 -0500
Received: from mailgw01.mediatek.com ([60.244.123.138]:40140 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S229567AbhKJHWC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Nov 2021 02:22:02 -0500
X-UUID: 7324b64ed486497696925dd4ddafaafc-20211110
X-UUID: 7324b64ed486497696925dd4ddafaafc-20211110
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
        (envelope-from <zhiyong.tao@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 1047556568; Wed, 10 Nov 2021 15:19:05 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Wed, 10 Nov 2021 15:19:03 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs10n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Wed, 10 Nov 2021 15:19:02 +0800
From:   Zhiyong Tao <zhiyong.tao@mediatek.com>
To:     <robh+dt@kernel.org>, <linus.walleij@linaro.org>,
        <mark.rutland@arm.com>, <matthias.bgg@gmail.com>,
        <sean.wang@kernel.org>
CC:     <srv_heupstream@mediatek.com>, <zhiyong.tao@mediatek.com>,
        <hui.liu@mediatek.com>, <light.hsieh@mediatek.com>,
        <sean.wang@mediatek.com>, <seiya.wang@mediatek.com>,
        <rex-bc.chen@mediatek.com>, <guodong.liu@mediatek.com>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
        "Guodong Liu" <guodong.liu@mediatek.corp-partner.google.com>,
        Chen-Yu Tsai <wenst@chromium.org>
Subject: [PATCH v4] pinctrl: mediatek: fix global-out-of-bounds issue
Date:   Wed, 10 Nov 2021 15:19:00 +0800
Message-ID: <20211110071900.4490-2-zhiyong.tao@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211110071900.4490-1-zhiyong.tao@mediatek.com>
References: <20211110071900.4490-1-zhiyong.tao@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-MTK:  N
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Guodong Liu <guodong.liu@mediatek.corp-partner.google.com>

When eint virtual eint number is greater than gpio number,
it maybe produce 'desc[eint_n]' size globle-out-of-bounds issue.

Signed-off-by: Guodong Liu <guodong.liu@mediatek.corp-partner.google.com>
Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes in patch v4:
1. fix sort signed-off-by name.
2. add Reviewed-by.

Changes in patch v3:
1. keep original patch author
2. fix version issue.

Changes in patch v2:
1. change check eint number boundary condition.
---
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
index 45ebdeba985a..12163d3c4bcb 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
@@ -285,8 +285,12 @@ static int mtk_xt_get_gpio_n(void *data, unsigned long eint_n,
 	desc = (const struct mtk_pin_desc *)hw->soc->pins;
 	*gpio_chip = &hw->chip;
 
-	/* Be greedy to guess first gpio_n is equal to eint_n */
-	if (desc[eint_n].eint.eint_n == eint_n)
+	/*
+	 * Be greedy to guess first gpio_n is equal to eint_n.
+	 * Only eint virtual eint number is greater than gpio number.
+	 */
+	if (hw->soc->npins > eint_n &&
+	    desc[eint_n].eint.eint_n == eint_n)
 		*gpio_n = eint_n;
 	else
 		*gpio_n = mtk_xt_find_eint_num(hw, eint_n);
-- 
2.25.1

