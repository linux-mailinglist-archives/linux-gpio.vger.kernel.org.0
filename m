Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 046EE34C40B
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Mar 2021 08:51:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230292AbhC2GvZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Mar 2021 02:51:25 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:58203 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S230344AbhC2Guz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Mar 2021 02:50:55 -0400
X-UUID: c73173cc492e4759a94f7ffe8fabfda5-20210329
X-UUID: c73173cc492e4759a94f7ffe8fabfda5-20210329
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw02.mediatek.com
        (envelope-from <zhiyong.tao@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1731230162; Mon, 29 Mar 2021 14:50:51 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 29 Mar 2021 14:50:50 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 29 Mar 2021 14:50:49 +0800
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
Subject: [PATCH 0/6] Mediatek pinctrl patch on mt8195 
Date:   Mon, 29 Mar 2021 14:50:41 +0800
Message-ID: <20210329065047.8388-1-zhiyong.tao@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This series includes 6 patches:
1.add pinctrl file on mt8195.
2.add pinctrl binding document on mt8195.
3.add pinctrl device node on mt8195.
4.add pinctrl driver on MT8195.
5.add pinctrl drive for I2C related pins on MT8195.
6.add pinctrl rsel setting on MT8195.

Zhiyong Tao (6):
  dt-bindings: pinctrl: mt8195: add pinctrl file
  dt-bindings: pinctrl: mt8195: add binding document
  arm64: dts: mt8195: add pinctrl device node
  pinctrl: add pinctrl driver on mt8195
  pinctrl: add drive for I2C related pins on MT8195
  pinctrl: add rsel setting on MT8195

 .../bindings/pinctrl/pinctrl-mt8195.yaml      |  152 ++
 arch/arm64/boot/dts/mediatek/mt8195.dtsi      |   21 +
 drivers/pinctrl/mediatek/Kconfig              |    6 +
 drivers/pinctrl/mediatek/Makefile             |    1 +
 drivers/pinctrl/mediatek/pinctrl-mt8195.c     |  872 +++++++++
 .../pinctrl/mediatek/pinctrl-mtk-common-v2.c  |   29 +
 .../pinctrl/mediatek/pinctrl-mtk-common-v2.h  |   14 +
 drivers/pinctrl/mediatek/pinctrl-mtk-mt8195.h | 1669 +++++++++++++++++
 drivers/pinctrl/mediatek/pinctrl-paris.c      |   16 +
 include/dt-bindings/pinctrl/mt8195-pinfunc.h  |  961 ++++++++++
 10 files changed, 3741 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt8195.c
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt8195.h
 create mode 100644 include/dt-bindings/pinctrl/mt8195-pinfunc.h

--
2.18.0


