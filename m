Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D64C83FAF49
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Aug 2021 02:38:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236226AbhH3AhO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 29 Aug 2021 20:37:14 -0400
Received: from mailgw01.mediatek.com ([60.244.123.138]:57772 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S236210AbhH3AhN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 29 Aug 2021 20:37:13 -0400
X-UUID: 63fd491b17ad40ed8f31af6e7d363da7-20210830
X-UUID: 63fd491b17ad40ed8f31af6e7d363da7-20210830
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
        (envelope-from <zhiyong.tao@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1654982555; Mon, 30 Aug 2021 08:36:17 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 30 Aug 2021 08:36:16 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 30 Aug 2021 08:36:15 +0800
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
Subject: [PATCH v11 3/4] pinctrl: mediatek: mt8195: Add pm_ops
Date:   Mon, 30 Aug 2021 08:36:02 +0800
Message-ID: <20210830003603.31864-4-zhiyong.tao@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210830003603.31864-1-zhiyong.tao@mediatek.com>
References: <20210830003603.31864-1-zhiyong.tao@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Setting this up will configure wake from suspend properly,
and wake only for the interrupts that are setup in wake_mask,
not all interrupts.

Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
---
 drivers/pinctrl/mediatek/pinctrl-mt8195.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8195.c b/drivers/pinctrl/mediatek/pinctrl-mt8195.c
index a7500e18bb1d..892e79703f98 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt8195.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt8195.c
@@ -839,6 +839,7 @@ static struct platform_driver mt8195_pinctrl_driver = {
 	.driver = {
 		.name = "mt8195-pinctrl",
 		.of_match_table = mt8195_pinctrl_of_match,
+		.pm = &mtk_paris_pinctrl_pm_ops,
 	},
 	.probe = mt8195_pinctrl_probe,
 };
-- 
2.18.0

