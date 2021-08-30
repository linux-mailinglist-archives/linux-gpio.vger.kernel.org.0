Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58D093FAF44
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Aug 2021 02:38:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236212AbhH3AhN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 29 Aug 2021 20:37:13 -0400
Received: from mailgw01.mediatek.com ([60.244.123.138]:57762 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S236190AbhH3AhN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 29 Aug 2021 20:37:13 -0400
X-UUID: e3677512ad6742d7aa1f4a80feb87263-20210830
X-UUID: e3677512ad6742d7aa1f4a80feb87263-20210830
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw01.mediatek.com
        (envelope-from <zhiyong.tao@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1945086286; Mon, 30 Aug 2021 08:36:15 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 30 Aug 2021 08:36:13 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 30 Aug 2021 08:36:06 +0800
From:   Zhiyong Tao <zhiyong.tao@mediatek.com>
To:     <robh+dt@kernel.org>, <linus.walleij@linaro.org>,
        <mark.rutland@arm.com>, <matthias.bgg@gmail.com>,
        <sean.wang@kernel.org>
CC:     <srv_heupstream@mediatek.com>, <zhiyong.tao@mediatek.com>,
        <hui.liu@mediatek.com>, <eddie.huang@mediatek.com>,
        <light.hsieh@mediatek.com>, <biao.huang@mediatek.com>,
        <hongzhou.yang@mediatek.com>, <sean.wang@mediatek.com>,
        <seiya.wang@mediatek.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>
Subject: [PATCH v11 1/4] dt-bindings: pinctrl: mt8195: add rsel define
Date:   Mon, 30 Aug 2021 08:36:00 +0800
Message-ID: <20210830003603.31864-2-zhiyong.tao@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210830003603.31864-1-zhiyong.tao@mediatek.com>
References: <20210830003603.31864-1-zhiyong.tao@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch adds rsel define for mt8195.

Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
---
 include/dt-bindings/pinctrl/mt65xx.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/dt-bindings/pinctrl/mt65xx.h b/include/dt-bindings/pinctrl/mt65xx.h
index 7e16e58fe1f7..f5934abcd1bd 100644
--- a/include/dt-bindings/pinctrl/mt65xx.h
+++ b/include/dt-bindings/pinctrl/mt65xx.h
@@ -16,6 +16,15 @@
 #define MTK_PUPD_SET_R1R0_10 102
 #define MTK_PUPD_SET_R1R0_11 103
 
+#define MTK_PULL_SET_RSEL_000  200
+#define MTK_PULL_SET_RSEL_001  201
+#define MTK_PULL_SET_RSEL_010  202
+#define MTK_PULL_SET_RSEL_011  203
+#define MTK_PULL_SET_RSEL_100  204
+#define MTK_PULL_SET_RSEL_101  205
+#define MTK_PULL_SET_RSEL_110  206
+#define MTK_PULL_SET_RSEL_111  207
+
 #define MTK_DRIVE_2mA  2
 #define MTK_DRIVE_4mA  4
 #define MTK_DRIVE_6mA  6
-- 
2.18.0

