Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B62EC3EE76A
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Aug 2021 09:46:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234612AbhHQHqj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Aug 2021 03:46:39 -0400
Received: from mailgw01.mediatek.com ([60.244.123.138]:48458 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S231500AbhHQHqj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Aug 2021 03:46:39 -0400
X-UUID: 6cc2d3ce89ac4336b8ee718cb5ae1705-20210817
X-UUID: 6cc2d3ce89ac4336b8ee718cb5ae1705-20210817
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw01.mediatek.com
        (envelope-from <sam.shih@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 13340958; Tue, 17 Aug 2021 15:46:03 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 17 Aug 2021 15:46:02 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Tue, 17 Aug 2021 15:46:01 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 17 Aug 2021 15:46:01 +0800
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
Subject: [v2,00/12] Add basic SoC support for mediatek mt7986
Date:   Tue, 17 Aug 2021 15:45:45 +0800
Message-ID: <20210817074557.30953-1-sam.shih@mediatek.com>
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
v2: updated mt7986 clock releated IDs, dt-binding, and driver
    updated mt7986 clock releated dt-binding and driver
    updated device tree of mt7986a and mt7986b

Sam Shih (12):
  dt-bindings: clock: mediatek: document clk bindings for mediatek
    mt7986 SoC
  clk: mediatek: add mt7986 clock IDs
  clk: mediatek: add mt7986 clock support
  pinctrl: mediatek: moore: check if pin_desc is valid before use
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
 .../arm/mediatek/mediatek,infracfg.txt        |    1 +
 .../arm/mediatek/mediatek,sgmiisys.txt        |    2 +
 .../arm/mediatek/mediatek,topckgen.txt        |    1 +
 .../bindings/pinctrl/pinctrl-mt7622.txt       |  170 +++
 .../devicetree/bindings/rng/mtk-rng.yaml      |    1 +
 .../devicetree/bindings/serial/mtk-uart.txt   |    1 +
 .../devicetree/bindings/watchdog/mtk-wdt.txt  |    1 +
 arch/arm64/boot/dts/mediatek/Makefile         |    2 +
 arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts  |   49 +
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi     |  227 +++
 arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts  |   21 +
 arch/arm64/boot/dts/mediatek/mt7986b.dtsi     |  236 ++++
 drivers/clk/mediatek/Kconfig                  |   17 +
 drivers/clk/mediatek/Makefile                 |    4 +
 drivers/clk/mediatek/clk-mt7986-apmixed.c     |   78 ++
 drivers/clk/mediatek/clk-mt7986-eth.c         |  132 ++
 drivers/clk/mediatek/clk-mt7986-infracfg.c    |  198 +++
 drivers/clk/mediatek/clk-mt7986-topckgen.c    |  319 +++++
 drivers/pinctrl/mediatek/Kconfig              |    7 +
 drivers/pinctrl/mediatek/Makefile             |    1 +
 drivers/pinctrl/mediatek/pinctrl-moore.c      |   18 +
 drivers/pinctrl/mediatek/pinctrl-mt7986.c     | 1217 +++++++++++++++++
 include/dt-bindings/clock/mt7986-clk.h        |  169 +++
 26 files changed, 2882 insertions(+)
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

