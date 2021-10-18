Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C04A74317EF
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Oct 2021 13:48:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231684AbhJRLuP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Oct 2021 07:50:15 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:38752 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S231865AbhJRLuH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Oct 2021 07:50:07 -0400
X-UUID: f34a922b839e4663ab0d83a385939c0d-20211018
X-UUID: f34a922b839e4663ab0d83a385939c0d-20211018
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
        (envelope-from <sam.shih@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 2076674163; Mon, 18 Oct 2021 19:47:53 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 18 Oct 2021 19:47:52 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 18 Oct 2021 19:47:52 +0800
From:   Sam Shih <sam.shih@mediatek.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Sean Wang <sean.wang@kernel.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
CC:     John Crispin <john@phrozen.org>,
        Ryder Lee <Ryder.Lee@mediatek.com>,
        "Sam Shih" <sam.shih@mediatek.com>
Subject: [PATCH v8 0/4] Mediatek MT7986 pinctrl support
Date:   Mon, 18 Oct 2021 19:47:35 +0800
Message-ID: <20211018114739.14026-1-sam.shih@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-MTK:  N
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch series add pinctrl support for mediatek mt7986 SoC series.
It is based on patch series "Add basic SoC support for mediatek mt7986"
https://lore.kernel.org/all/20211018114009.13350-1-sam.shih@mediatek.com/
---
v8: fixed uart node in yaml dts example
v7: separate pinctrl part into a single patch series

According to the maintainer’s suggestion, this patch splits the previous
thread into independent patch series.
This patch include clock driver and device tree update

Original thread:
https://lore.kernel.org/all/20210914085137.31761-1-sam.shih@mediatek.com/
---

Sam Shih (4):
  dt-bindings: pinctrl: update bindings for MT7986 SoC
  pinctrl: mediatek: add support for MT7986 SoC
  arm64: dts: mediatek: add pinctrl support for mt7986a
  arm64: dts: mediatek: add pinctrl support for mt7986b

 .../pinctrl/mediatek,mt7986-pinctrl.yaml      | 363 +++++++
 arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts  |  20 +
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi     |  21 +
 arch/arm64/boot/dts/mediatek/mt7986b.dtsi     |  21 +
 drivers/pinctrl/mediatek/Kconfig              |   7 +
 drivers/pinctrl/mediatek/Makefile             |   1 +
 drivers/pinctrl/mediatek/pinctrl-mt7986.c     | 927 ++++++++++++++++++
 7 files changed, 1360 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt7986.c

--
2.29.2

