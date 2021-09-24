Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D301416D5E
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Sep 2021 10:07:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244544AbhIXIIX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 24 Sep 2021 04:08:23 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:53652 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S237965AbhIXIIW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 24 Sep 2021 04:08:22 -0400
X-UUID: 2b071b8f61d24529ba1c1b5f85e63a0b-20210924
X-UUID: 2b071b8f61d24529ba1c1b5f85e63a0b-20210924
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw02.mediatek.com
        (envelope-from <zhiyong.tao@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1855317345; Fri, 24 Sep 2021 16:06:45 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 24 Sep 2021 16:06:44 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 24 Sep 2021 16:06:43 +0800
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
Subject: [PATCH v14 0/5] Mediatek pinctrl patch on mt8195 
Date:   Fri, 24 Sep 2021 16:06:27 +0800
Message-ID: <20210924080632.28410-1-zhiyong.tao@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-MTK:  N
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This series includes 5 patches:
1.add rsel define.
2.change pull up/down description
3.fix coding style
4.support rsel feature for common ICs
5.add rsel setting on MT8195

Changes in patch v14:
1)add a schema and new property "mediatek, rsel_resistance_in_si_unit"
  on patch 2/5.
2)fix kernel-doc style comment on patch 4/5.
3)add review-by on patch 3/5 and 5/5.

Changes in patch v13:
1)change "-EOPNOTSUPP" to "-ENOTSUPP" in patch 4/5.
2)fix description on 2/5.

Changes in patch v12:
1)add "ack-by" on "rsel define" patch.
2)add "change reason" in commit message and write a shema
  on patch document patch 2/5.
3)separate eint pm_ops fucntion support patch
4)separate rsel patch, the common parts as patch 4/5 to support
  common ICs. The mt8195 specific changes as patch 5/5.
5)add fix coding style patch to fix Camel spelling to avoid checkpatch
  warning in a following patch.
6)remove unrelated changes in rsel patch.
7)change ternary ops in resel patch
8)add "rsel_is_unit" property on struct mtk_pinctrl, and itendify
  "mediatek,rsel_resistance_in_si_unit" property in probe function.
9)add explanation for "MTK_PULL_RSEL_TYPE" and "MTK_PULL_PU_PD_RSEL_TYPE".
10) fix spell warning in rsel patch.

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

Zhiyong Tao (5):
  dt-bindings: pinctrl: mt8195: add rsel define
  dt-bindings: pinctrl: mt8195: change pull up/down description
  pinctrl: mediatek: fix coding style
  pinctrl: mediatek: support rsel feature
  pinctrl: mediatek: add rsel setting on MT8195

 .../bindings/pinctrl/pinctrl-mt8195.yaml      |  86 ++++++-
 drivers/pinctrl/mediatek/pinctrl-mt8195.c     | 133 ++++++++++
 .../pinctrl/mediatek/pinctrl-mtk-common-v2.c  | 231 +++++++++++++++---
 .../pinctrl/mediatek/pinctrl-mtk-common-v2.h  |  46 ++++
 drivers/pinctrl/mediatek/pinctrl-paris.c      |  68 ++++--
 include/dt-bindings/pinctrl/mt65xx.h          |   9 +
 6 files changed, 519 insertions(+), 54 deletions(-)

--
2.18.0


