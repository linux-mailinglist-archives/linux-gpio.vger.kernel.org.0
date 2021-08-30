Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02E253FAF41
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Aug 2021 02:38:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236191AbhH3AhF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 29 Aug 2021 20:37:05 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:52704 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S236190AbhH3AhE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 29 Aug 2021 20:37:04 -0400
X-UUID: 5994fbb0c5c34f2cb65ccdb8d8f40913-20210830
X-UUID: 5994fbb0c5c34f2cb65ccdb8d8f40913-20210830
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw02.mediatek.com
        (envelope-from <zhiyong.tao@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 668291029; Mon, 30 Aug 2021 08:36:07 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 30 Aug 2021 08:36:06 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 30 Aug 2021 08:36:05 +0800
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
Subject: [PATCH v11 0/4]  Mediatek pinctrl patch on mt8195 
Date:   Mon, 30 Aug 2021 08:35:59 +0800
Message-ID: <20210830003603.31864-1-zhiyong.tao@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This series includes 4 patches:
1.add rsel define.
2.change pull up/down description
3.add pm_ops.
4.add rsel setting.

Changes in patch v11:
1)add pm_ops fucntion support
2)change pull up/down description
3)add resistance value feature support.

Changes in patch v10:
1)fix PARENTHESIS_ALIGNMENT of mtk_pinconf_bias_set_rsel
2)fix LONG_LINE warning in 615 in pinctrl-paris.c.

Changes in patch v9:
1)fix "mtk_pinconf_bias_set_rsel" build warning.

Changes in patch v8:
1)add rsel define patch
2)avoid  CamelCase
3)add pinctrl rsel setting patch which is another resistance selection
  solution for I2C on MT8195.

Changes in patch v7:
1)add version in patch and fix spelling mistakes.

Changes in patch v6:
1)add "pintcrl: mediatek" as prefix.

Changes in patch v5:
1)document and driver patch are apploed.
2)change '-EOPNOTSUPP' to '-ENOTSUPP'

Changes in patch v4:
1)fix pinctrl-mt8195.yaml warning error.
2)remove pinctrl device node patch which is based on "mt8195.dtsi".

Changes in patch v3:
1)change '^pins' to '-pins$'.
2)change 'state_0_node_a' to 'gpio_pin' which is defined in dts.
3)change 'state_0_node_b' to 'i2c0_pin' which is defined in dts.
4)reorder this series patches. change pinctrl file and binding document
together in one patch.

There are no changes in v1 & v2.

Zhiyong Tao (4):
dt-bindings: pinctrl: mt8195: add rsel define
  dt-bindings: pinctrl: mt8195: change pull up/down description
  pinctrl: mediatek: mt8195: Add pm_ops
  pinctrl: mediatek: add rsel setting on MT8195

 .../bindings/pinctrl/pinctrl-mt8195.yaml      |  32 +++-
 drivers/pinctrl/mediatek/pinctrl-mt8195.c     | 134 +++++++++++++
 .../pinctrl/mediatek/pinctrl-mtk-common-v2.c  | 181 ++++++++++++++++--
 .../pinctrl/mediatek/pinctrl-mtk-common-v2.h  |  35 +++-
 drivers/pinctrl/mediatek/pinctrl-paris.c      |  24 ++-
 drivers/pinctrl/mediatek/pinctrl-paris.h      |   2 +-
 include/dt-bindings/pinctrl/mt65xx.h          |   9 +
 7 files changed, 387 insertions(+), 30 deletions(-)

--
2.18.0


