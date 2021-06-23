Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8500E3B1706
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Jun 2021 11:37:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230224AbhFWJjj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Jun 2021 05:39:39 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:35517 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S230044AbhFWJji (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Jun 2021 05:39:38 -0400
X-UUID: 4ec23ea4b26e45ec95684a58295b9e85-20210623
X-UUID: 4ec23ea4b26e45ec95684a58295b9e85-20210623
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
        (envelope-from <zhiyong.tao@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1585120396; Wed, 23 Jun 2021 17:37:16 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Jun 2021 17:37:15 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 23 Jun 2021 17:37:14 +0800
From:   Zhiyong Tao <zhiyong.tao@mediatek.com>
To:     <robh+dt@kernel.org>, <linus.walleij@linaro.org>,
        <mark.rutland@arm.com>, <matthias.bgg@gmail.com>,
        <sean.wang@kernel.org>
CC:     <srv_heupstream@mediatek.com>, <zhiyong.tao@mediatek.com>,
        <hui.liu@mediatek.com>, <Rex-BC.chen@mediatek.com>,
        <biao.huang@mediatek.com>, <hongzhou.yang@mediatek.com>,
        <erin.lo@mediatek.com>, <sean.wang@mediatek.com>,
        <seiya.wang@mediatek.com>, <sj.huang@mediatek.com>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>
Subject: [PATCH v8 1/2] dt-bindings: pinctrl: mt8195: add rsel define
Date:   Wed, 23 Jun 2021 17:37:09 +0800
Message-ID: <20210623093710.5340-2-zhiyong.tao@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210623093710.5340-1-zhiyong.tao@mediatek.com>
References: <20210623093710.5340-1-zhiyong.tao@mediatek.com>
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

