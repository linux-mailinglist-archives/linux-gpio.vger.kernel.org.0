Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5BB340A9B4
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Sep 2021 10:51:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230520AbhINIxB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Sep 2021 04:53:01 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:49076 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S229610AbhINIxA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Sep 2021 04:53:00 -0400
X-UUID: 431777d426d54f57b326deebe80da5b2-20210914
X-UUID: 431777d426d54f57b326deebe80da5b2-20210914
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw02.mediatek.com
        (envelope-from <sam.shih@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 339748266; Tue, 14 Sep 2021 16:51:39 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 14 Sep 2021 16:51:38 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by mtkcas07.mediatek.inc
 (172.21.101.84) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 14 Sep
 2021 16:51:37 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 14 Sep 2021 16:51:37 +0800
From:   Sam Shih <sam.shih@mediatek.com>
To:     Rob Herring <robh+dt@kernel.org>, Sean Wang <sean.wang@kernel.org>,
        "Linus Walleij" <linus.walleij@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Matt Mackall <mpm@selenic.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Fabien Parent <fparent@baylibre.com>,
        Seiya Wang <seiya.wang@mediatek.com>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-crypto@vger.kernel.org>, <linux-serial@vger.kernel.org>,
        <linux-watchdog@vger.kernel.org>, <linux-clk@vger.kernel.org>
CC:     John Crispin <john@phrozen.org>,
        Ryder Lee <Ryder.Lee@mediatek.com>,
        "Sam Shih" <sam.shih@mediatek.com>
Subject: [v3,0/9] Add basic SoC support for mediatek mt7986
Date:   Tue, 14 Sep 2021 16:51:28 +0800
Message-ID: <20210914085137.31761-1-sam.shih@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch adds basic SoC support for Mediatek's new 4-core SoC,
MT7986, which is mainly for wifi-router application.

---
v3: updated mt7986 pinctrl releated dt-bindig,
    updated mt7986 pinctrl driver according to reviewers's suggestion
    fixed wrong clock ID in mt7986-clock-IDs
    added Acked-by tag in some patches
v2: updated mt7986 clock releated IDs, dt-binding, and driver
    updated mt7986 clock releated dt-binding and driver
    updated device tree of mt7986a and mt7986b

Sam Shih (9):
  dt-bindings: clock: mediatek: document clk bindings for mediatek
    mt7986 SoC
  clk: mediatek: add mt7986 clock IDs
  clk: mediatek: add mt7986 clock support
  pinctrl: mediatek: moore: check if pin_desc is valid before use
  dt-bindings: pinctrl: update bindings for MT7986 SoC
  pinctrl: mediatek: add support for MT7986 SoC
  dt-bindings: arm64: dts: mediatek: Add mt7986 series
  arm64: dts: mediatek: add mt7986a support
  arm64: dts: mediatek: add mt7986b support

 .../devicetree/bindings/arm/mediatek.yaml     |   8 +
 .../arm/mediatek/mediatek,apmixedsys.txt      |   1 +
 .../bindings/arm/mediatek/mediatek,ethsys.txt |   1 +
 .../arm/mediatek/mediatek,infracfg.txt        |   1 +
 .../arm/mediatek/mediatek,sgmiisys.txt        |   2 +
 .../arm/mediatek/mediatek,topckgen.txt        |   1 +
 .../pinctrl/mediatek,mt7986-pinctrl.txt       | 300 ++++++
 arch/arm64/boot/dts/mediatek/Makefile         |   2 +
 arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts  |  49 +
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi     | 227 +++++
 arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts  |  21 +
 arch/arm64/boot/dts/mediatek/mt7986b.dtsi     | 227 +++++
 drivers/clk/mediatek/Kconfig                  |  17 +
 drivers/clk/mediatek/Makefile                 |   4 +
 drivers/clk/mediatek/clk-mt7986-apmixed.c     |  78 ++
 drivers/clk/mediatek/clk-mt7986-eth.c         | 132 +++
 drivers/clk/mediatek/clk-mt7986-infracfg.c    | 198 ++++
 drivers/clk/mediatek/clk-mt7986-topckgen.c    | 319 ++++++
 drivers/pinctrl/mediatek/Kconfig              |   7 +
 drivers/pinctrl/mediatek/Makefile             |   1 +
 drivers/pinctrl/mediatek/pinctrl-moore.c      |  18 +
 drivers/pinctrl/mediatek/pinctrl-mt7986.c     | 928 ++++++++++++++++++
 include/dt-bindings/clock/mt7986-clk.h        | 169 ++++
 23 files changed, 2711 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.txt
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a.dtsi
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7986b.dtsi
 create mode 100644 drivers/clk/mediatek/clk-mt7986-apmixed.c
 create mode 100644 drivers/clk/mediatek/clk-mt7986-eth.c
 create mode 100644 drivers/clk/mediatek/clk-mt7986-infracfg.c
 create mode 100644 drivers/clk/mediatek/clk-mt7986-topckgen.c
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt7986.c
 create mode 100644 include/dt-bindings/clock/mt7986-clk.h

-- 
2.29.2

