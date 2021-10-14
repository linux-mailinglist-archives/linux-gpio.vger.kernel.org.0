Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6E3A42D455
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Oct 2021 09:58:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230051AbhJNIAw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 14 Oct 2021 04:00:52 -0400
Received: from mailgw01.mediatek.com ([60.244.123.138]:50326 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S229994AbhJNIAv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 14 Oct 2021 04:00:51 -0400
X-UUID: 60b6c304d841412c86720ad58fef90f6-20211014
X-UUID: 60b6c304d841412c86720ad58fef90f6-20211014
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
        (envelope-from <sam.shih@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 784649004; Thu, 14 Oct 2021 15:58:43 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Thu, 14 Oct 2021 15:58:42 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 14 Oct 2021 15:58:42 +0800
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
Subject: [PATCH v7 0/4] Mediatek MT7986 pinctrl support
Date:   Thu, 14 Oct 2021 15:58:32 +0800
Message-ID: <20211014075836.17681-1-sam.shih@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-MTK:  N
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch series add pinctrl support for mediatek mt7986 SoC series.
It is based on patch series "Add basic SoC support for mediatek mt7986":
https://lore.kernel.org/all/20211014074403.17346-1-sam.shih@mediatek.com/

---
v7 : separate pinctrl part into a single patch series

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

