Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CBF635B2A4
	for <lists+linux-gpio@lfdr.de>; Sun, 11 Apr 2021 11:27:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235005AbhDKJ1a (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 11 Apr 2021 05:27:30 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:38063 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S230103AbhDKJ1a (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 11 Apr 2021 05:27:30 -0400
X-UUID: 2aa1696d9cdd46fc9247484d894d73d4-20210411
X-UUID: 2aa1696d9cdd46fc9247484d894d73d4-20210411
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
        (envelope-from <zhiyong.tao@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1021508204; Sun, 11 Apr 2021 17:27:10 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 11 Apr 2021 17:27:08 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sun, 11 Apr 2021 17:27:00 +0800
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
Subject: [PATCH v3 0/5] Mediatek pinctrl patch on mt8195 
Date:   Sun, 11 Apr 2021 17:26:54 +0800
Message-ID: <20210411092659.22838-1-zhiyong.tao@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: 8763930F8ABD6FD9D5F4CE88446A048F7706056405D0011918180CF2D4816D8D2000:8
X-MTK:  N
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This series includes 5 patches:
1.add pinctrl file and inding document on mt8195.
2.add pinctrl device node on mt8195.
3.add pinctrl driver on MT8195.
4.add pinctrl drive for I2C related pins on MT8195.
5.add pinctrl rsel setting on MT8195.

Changes in patch v3:
1)change '^pins' to '-pins$'.
2)change 'state_0_node_a' to 'gpio_pin' which is defined in dts.
3)change 'state_0_node_b' to 'i2c0_pin' which is defined in dts.
4)reorder this series patches. change pinctrl file and binding document
together in one patch.

There are no changes in v1 & v2.

Zhiyong Tao (5):
  dt-bindings: pinctrl: mt8195: add pinctrl file and binding document
  arm64: dts: mt8195: add pinctrl device node
  pinctrl: add pinctrl driver on mt8195
  pinctrl: add drive for I2C related pins on MT8195
  pinctrl: add rsel setting on MT8195

 .../bindings/pinctrl/pinctrl-mt8195.yaml      |  152 ++
 arch/arm64/boot/dts/mediatek/mt8195.dtsi      |   21 +
 drivers/pinctrl/mediatek/Kconfig              |    6 +
 drivers/pinctrl/mediatek/Makefile             |    1 +
 drivers/pinctrl/mediatek/pinctrl-mt8195.c     |  872 +++++++++
 .../pinctrl/mediatek/pinctrl-mtk-common-v2.c  |   28 +
 .../pinctrl/mediatek/pinctrl-mtk-common-v2.h  |   15 +
 drivers/pinctrl/mediatek/pinctrl-mtk-mt8195.h | 1669 +++++++++++++++++
 drivers/pinctrl/mediatek/pinctrl-paris.c      |   16 +
 include/dt-bindings/pinctrl/mt8195-pinfunc.h  |  962 ++++++++++
 10 files changed, 3742 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt8195.c
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt8195.h
 create mode 100644 include/dt-bindings/pinctrl/mt8195-pinfunc.h

--
2.18.0 


