Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B805D3D53C1
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jul 2021 09:18:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232169AbhGZGgh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Jul 2021 02:36:37 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:55862 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S231774AbhGZGgg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Jul 2021 02:36:36 -0400
X-UUID: acb8997731e54c20a9623734505e804f-20210726
X-UUID: acb8997731e54c20a9623734505e804f-20210726
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
        (envelope-from <sam.shih@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 1892193250; Mon, 26 Jul 2021 15:16:54 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 26 Jul 2021 15:16:52 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 26 Jul 2021 15:16:52 +0800
From:   Sam Shih <sam.shih@mediatek.com>
To:     Rob Herring <robh+dt@kernel.org>, Sean Wang <sean.wang@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
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
        Sam Shih <sam.shih@mediatek.com>
Subject: [PATCH 00/12] Add basic SoC support for mediatek mt7986
Date:   Mon, 26 Jul 2021 15:14:27 +0800
Message-ID: <20210726071439.14248-1-sam.shih@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch adds basic SoC support for Mediatek's new 4-core SoC,
MT7986, which is mainly for wifi-router application.

Sam Shih (12):
  dt-bindings: clock: mediatek: document clk bindings for mediatek
    mt7986 SoC
  clk: mediatek: add mt7986 clock IDs
  clk: mediatek: add mt7986 clock support
  pinctrl: mediatek: moore: use pin number in mtk_pin_desc instead of
    array index
  dt-bindings: pinctrl: update bindings for MT7986 SoC
  pinctrl: mediatek: add support for MT7986 SoC
  dt-bindings: arm64: dts: mediatek: Add mt7986 series
  dt-bindings: rng: mediatek: add mt7986 to mtk rng binding
  dt-bindings: serial: Add compatible for Mediatek MT7986
  dt-bindings: watchdog: Add compatible for Mediatek MT7986
  arm64: dts: mediatek: add mt7986a support
  arm64: dts: mediatek: add mt7986b support

 .../devicetree/bindings/arm/mediatek.yaml     |    8 +
 .../arm/mediatek/mediatek,apmixedsys.txt      |    1 +
 .../bindings/arm/mediatek/mediatek,ethsys.txt |    1 +
 .../arm/mediatek/mediatek,infracfg.txt        |    2 +
 .../arm/mediatek/mediatek,sgmiisys.txt        |    2 +
 .../arm/mediatek/mediatek,topckgen.txt        |    1 +
 .../bindings/pinctrl/pinctrl-mt7622.txt       |  284 +++
 .../devicetree/bindings/rng/mtk-rng.yaml      |    1 +
 .../devicetree/bindings/serial/mtk-uart.txt   |    1 +
 .../devicetree/bindings/watchdog/mtk-wdt.txt  |    1 +
 arch/arm64/boot/dts/mediatek/Makefile         |    2 +
 arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts  |   49 +
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi     |  235 +++
 arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts  |   21 +
 arch/arm64/boot/dts/mediatek/mt7986b.dtsi     |  235 +++
 drivers/clk/mediatek/Kconfig                  |   17 +
 drivers/clk/mediatek/Makefile                 |    2 +
 drivers/clk/mediatek/clk-mt7986-eth.c         |  132 ++
 drivers/clk/mediatek/clk-mt7986.c             |  610 ++++++
 drivers/pinctrl/mediatek/Kconfig              |    7 +
 drivers/pinctrl/mediatek/Makefile             |    1 +
 drivers/pinctrl/mediatek/pinctrl-moore.c      |   61 +
 drivers/pinctrl/mediatek/pinctrl-mt7986.c     | 1640 +++++++++++++++++
 include/dt-bindings/clock/mt7986-clk.h        |  244 +++
 24 files changed, 3558 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a.dtsi
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7986b.dtsi
 create mode 100644 drivers/clk/mediatek/clk-mt7986-eth.c
 create mode 100644 drivers/clk/mediatek/clk-mt7986.c
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt7986.c
 create mode 100644 include/dt-bindings/clock/mt7986-clk.h

-- 
2.29.2

