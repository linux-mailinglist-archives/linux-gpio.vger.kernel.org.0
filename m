Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DF3F4B401B
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Feb 2022 04:09:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235542AbiBNDGt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 13 Feb 2022 22:06:49 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:47170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237049AbiBNDGs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 13 Feb 2022 22:06:48 -0500
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74274C07;
        Sun, 13 Feb 2022 19:06:41 -0800 (PST)
X-UUID: 17ba665b0a964b4ab283a997014f1a21-20220214
X-UUID: 17ba665b0a964b4ab283a997014f1a21-20220214
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
        (envelope-from <guodong.liu@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 1458350915; Mon, 14 Feb 2022 11:06:37 +0800
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 14 Feb 2022 11:06:36 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 14 Feb
 2022 11:06:36 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 14 Feb 2022 11:06:35 +0800
From:   Guodong Liu <guodong.liu@mediatek.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Sean Wang <sean.wang@kernel.org>
CC:     Sean Wang <sean.wang@mediatek.com>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <Project_Global_Chrome_Upstream_Group@mediatek.com>,
        Guodong Liu <guodong.liu@mediatek.com>
Subject: [PATCH v4 0/3] pinctrl: mediatek: Support pinctrl driver on mt8186
Date:   Mon, 14 Feb 2022 11:06:28 +0800
Message-ID: <20220214030631.4969-1-guodong.liu@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-MTK:  N
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

changes since v3:
- remove generic descriptions for common properties
- remove quotes
- drop "."
- drop "-" on description
- move partial "bias-pull-up" description info to the example
- don't break the code into two lines, maximux 84 columns is fine
- add the required fixes tag

changes since v2:
- update reg property
- update reg-names property
- sync rsel resistance selection property same as patch 3
- repair constraints is not indented correctly for bias-pull-{up,down}
- add "type: boolean" to the list of valid values. This corresponds to having bias-pull-{up,down} without any arguments.
- add dual file license for file "mt8186-pinfunc.h"
- add patch 3 to change "mediatek,rsel_resistance_in_si_unit" to "mediatek,rsel-resistance-in-si-unit"

changes since v1:
- add default pinctrl config to consistent with other MTK pinctrl drivers

Patch 1 add pinctrl file and binding document.

Patch 2 add pinctrl chip driver on mt8186.

Patch 3 canonical rsel resistance selection property.

Guodong Liu (3):
  dt-bindings: pinctrl: mt8186: add pinctrl file and binding document
  pinctrl: add pinctrl driver on mt8186
  pinctrl: canonical rsel resistance selection property

 .../bindings/pinctrl/pinctrl-mt8186.yaml      |  302 +++
 drivers/pinctrl/mediatek/Kconfig              |    7 +
 drivers/pinctrl/mediatek/Makefile             |    1 +
 drivers/pinctrl/mediatek/pinctrl-mt8186.c     | 1311 ++++++++++
 drivers/pinctrl/mediatek/pinctrl-mtk-mt8186.h | 2186 +++++++++++++++++
 drivers/pinctrl/mediatek/pinctrl-paris.c      |    2 +-
 include/dt-bindings/pinctrl/mt8186-pinfunc.h  | 1174 +++++++++
 7 files changed, 4982 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-mt8186.yaml
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt8186.c
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt8186.h
 create mode 100644 include/dt-bindings/pinctrl/mt8186-pinfunc.h

-- 
2.25.1

