Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14AC93B1704
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Jun 2021 11:37:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230123AbhFWJji (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Jun 2021 05:39:38 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:35500 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S230004AbhFWJji (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Jun 2021 05:39:38 -0400
X-UUID: d132d4704be84bfaad737c0e332c7526-20210623
X-UUID: d132d4704be84bfaad737c0e332c7526-20210623
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
        (envelope-from <zhiyong.tao@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 243492518; Wed, 23 Jun 2021 17:37:16 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Jun 2021 17:37:14 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 23 Jun 2021 17:37:13 +0800
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
Subject: [PATCH v8 0/2] Mediatek pinctrl patch on mt8195
Date:   Wed, 23 Jun 2021 17:37:08 +0800
Message-ID: <20210623093710.5340-1-zhiyong.tao@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This series includes 1 patches:
1.add rsel define
2.add pinctrl rsel setting on MT8195.

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

Zhiyong Tao (2):
  dt-bindings: pinctrl: mt8195: add rsel define
  pinctrl: mediatek: add rsel setting on MT8195

 drivers/pinctrl/mediatek/pinctrl-mt8195.c     |  96 +++++++++++++
 .../pinctrl/mediatek/pinctrl-mtk-common-v2.c  | 135 +++++++++++++++---
 .../pinctrl/mediatek/pinctrl-mtk-common-v2.h  |  10 +-
 drivers/pinctrl/mediatek/pinctrl-paris.c      |  23 ++-
 drivers/pinctrl/mediatek/pinctrl-paris.h      |   2 +-
 include/dt-bindings/pinctrl/mt65xx.h          |   9 ++
 6 files changed, 248 insertions(+), 27 deletions(-)

--
2.18.0


