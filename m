Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A387444D0D
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Nov 2021 02:40:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232935AbhKDBn0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Nov 2021 21:43:26 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:60176 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S232918AbhKDBnY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Nov 2021 21:43:24 -0400
X-UUID: dd3ec9a3dceb43678b58dfa50f612cf4-20211104
X-UUID: dd3ec9a3dceb43678b58dfa50f612cf4-20211104
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
        (envelope-from <zhiyong.tao@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1202912524; Thu, 04 Nov 2021 09:40:45 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Thu, 4 Nov 2021 09:40:43 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs10n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Thu, 4 Nov 2021 09:40:42 +0800
From:   Zhiyong Tao <zhiyong.tao@mediatek.com>
To:     <robh+dt@kernel.org>, <linus.walleij@linaro.org>,
        <mark.rutland@arm.com>, <matthias.bgg@gmail.com>,
        <sean.wang@kernel.org>
CC:     <srv_heupstream@mediatek.com>, <zhiyong.tao@mediatek.com>,
        <hui.liu@mediatek.com>, <light.hsieh@mediatek.com>,
        <sean.wang@mediatek.com>, <seiya.wang@mediatek.com>,
        <rex-bc.chen@mediatek.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
        Guodong Liu <guodong.liu@mediatek.corp-partner.google.com>
Subject: [PATCH] pinctrl: mediatek: fix global-out-of-bounds issue
Date:   Thu, 4 Nov 2021 09:40:39 +0800
Message-ID: <20211104014039.26772-2-zhiyong.tao@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211104014039.26772-1-zhiyong.tao@mediatek.com>
References: <20211104014039.26772-1-zhiyong.tao@mediatek.com>
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

Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
Signed-off-by: Guodong Liu <guodong.liu@mediatek.corp-partner.google.com>
---
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
index 45ebdeba985a..9d57c897835c 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
@@ -286,7 +286,8 @@ static int mtk_xt_get_gpio_n(void *data, unsigned long eint_n,
 	*gpio_chip = &hw->chip;
 
 	/* Be greedy to guess first gpio_n is equal to eint_n */
-	if (desc[eint_n].eint.eint_n == eint_n)
+	if (((*gpio_chip)->ngpio > eint_n) &&
+	    desc[eint_n].eint.eint_n == eint_n)
 		*gpio_n = eint_n;
 	else
 		*gpio_n = mtk_xt_find_eint_num(hw, eint_n);
-- 
2.25.1

