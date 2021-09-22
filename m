Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB530413FD3
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Sep 2021 04:56:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230409AbhIVC6U (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Sep 2021 22:58:20 -0400
Received: from mailgw01.mediatek.com ([60.244.123.138]:44634 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S230293AbhIVC6T (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Sep 2021 22:58:19 -0400
X-UUID: fc03ce8e44ce447aac1f18694fe48f8a-20210922
X-UUID: fc03ce8e44ce447aac1f18694fe48f8a-20210922
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
        (envelope-from <zhiyong.tao@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1170145746; Wed, 22 Sep 2021 10:56:46 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 22 Sep 2021 10:56:44 +0800
Received: from localhost.localdomain (10.17.3.154) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 22 Sep 2021 10:56:43 +0800
From:   Zhiyong Tao <zhiyong.tao@mediatek.com>
To:     <robh+dt@kernel.org>, <linus.walleij@linaro.org>,
        <mark.rutland@arm.com>, <matthias.bgg@gmail.com>,
        <sean.wang@kernel.org>
CC:     <srv_heupstream@mediatek.com>, <zhiyong.tao@mediatek.com>,
        <hui.liu@mediatek.com>, <light.hsieh@mediatek.com>,
        <biao.huang@mediatek.com>, <hongzhou.yang@mediatek.com>,
        <sean.wang@mediatek.com>, <seiya.wang@mediatek.com>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>
Subject: [PATCH v13 3/5] pinctrl: mediatek: fix coding style
Date:   Wed, 22 Sep 2021 10:56:38 +0800
Message-ID: <20210922025640.11600-4-zhiyong.tao@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210922025640.11600-1-zhiyong.tao@mediatek.com>
References: <20210922025640.11600-1-zhiyong.tao@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-MTK:  N
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Fix Camel spelling coding style to avoid checkpatch
warning in a following patch.

Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
---
 drivers/pinctrl/mediatek/pinctrl-paris.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
index 85db2e4377f0..38aec0177d15 100644
--- a/drivers/pinctrl/mediatek/pinctrl-paris.c
+++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
@@ -577,7 +577,7 @@ static int mtk_hw_get_value_wrap(struct mtk_pinctrl *hw, unsigned int gpio, int
 	mtk_hw_get_value_wrap(hw, gpio, PINCTRL_PIN_REG_DRV)
 
 ssize_t mtk_pctrl_show_one_pin(struct mtk_pinctrl *hw,
-	unsigned int gpio, char *buf, unsigned int bufLen)
+	unsigned int gpio, char *buf, unsigned int buf_len)
 {
 	int pinmux, pullup, pullen, len = 0, r1 = -1, r0 = -1;
 	const struct mtk_pin_desc *desc;
@@ -610,7 +610,7 @@ ssize_t mtk_pctrl_show_one_pin(struct mtk_pinctrl *hw,
 	} else if (pullen != MTK_DISABLE && pullen != MTK_ENABLE) {
 		pullen = 0;
 	}
-	len += scnprintf(buf + len, bufLen - len,
+	len += scnprintf(buf + len, buf_len - len,
 			"%03d: %1d%1d%1d%1d%02d%1d%1d%1d%1d",
 			gpio,
 			pinmux,
@@ -624,10 +624,10 @@ ssize_t mtk_pctrl_show_one_pin(struct mtk_pinctrl *hw,
 			pullup);
 
 	if (r1 != -1) {
-		len += scnprintf(buf + len, bufLen - len, " (%1d %1d)\n",
+		len += scnprintf(buf + len, buf_len - len, " (%1d %1d)\n",
 			r1, r0);
 	} else {
-		len += scnprintf(buf + len, bufLen - len, "\n");
+		len += scnprintf(buf + len, buf_len - len, "\n");
 	}
 
 	return len;
-- 
2.25.1

