Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 012EC2BA639
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Nov 2020 10:32:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727439AbgKTJbQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 20 Nov 2020 04:31:16 -0500
Received: from mailgw01.mediatek.com ([210.61.82.183]:55334 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727591AbgKTJbK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Nov 2020 04:31:10 -0500
X-UUID: aaaa45181b4c4c9092ec3788acec7136-20201120
X-UUID: aaaa45181b4c4c9092ec3788acec7136-20201120
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw01.mediatek.com
        (envelope-from <zhiyong.tao@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 306028507; Fri, 20 Nov 2020 17:31:04 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 20 Nov 2020 17:31:02 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 20 Nov 2020 17:31:01 +0800
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
Subject: [PATCH] pinctrl: fix low level output voltage issue
Date:   Fri, 20 Nov 2020 17:30:58 +0800
Message-ID: <20201120093058.7248-2-zhiyong.tao@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201120093058.7248-1-zhiyong.tao@mediatek.com>
References: <20201120093058.7248-1-zhiyong.tao@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch is used to fix low level output voltage issue.
A pin is changed from input pull-up to output high.
The Dout value of the pin is default as 0.
If we change the direction of the pin before the dout value of the pin,
It maybe produce a low level output voltage between "input pull-up" and
"output high".

Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
---
 drivers/pinctrl/mediatek/pinctrl-paris.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
index 623af4410b07..039ce9be19c5 100644
--- a/drivers/pinctrl/mediatek/pinctrl-paris.c
+++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
@@ -247,13 +247,13 @@ static int mtk_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 		err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_SR, !!arg);
 		break;
 	case PIN_CONFIG_OUTPUT:
-		err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DIR,
-				       MTK_OUTPUT);
+		err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DO,
+				       arg);
 		if (err)
 			goto err;
 
-		err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DO,
-				       arg);
+		err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DIR,
+				       MTK_OUTPUT);
 		break;
 	case PIN_CONFIG_INPUT_SCHMITT:
 	case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
-- 
2.18.0

