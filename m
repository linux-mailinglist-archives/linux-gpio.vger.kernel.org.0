Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67BD51D1356
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2020 14:55:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733014AbgEMMz4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 May 2020 08:55:56 -0400
Received: from esa3.microchip.iphmx.com ([68.232.153.233]:29476 "EHLO
        esa3.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733012AbgEMMz4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 May 2020 08:55:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1589374555; x=1620910555;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=71agoK2Lf2NcrvRKduazxlxfbvYG5gjDX3+0wemNjCw=;
  b=kEw7j3J8Lg4DwRYfGV4TWwm19Mi5fvwPznVCKoEhCeosxX4cMtq5qGpK
   5HlVLaiwltFUBGV92YyJ8C8zcDZs/emt3ZLnGKrVcHuVLKwpiYbWiVDrB
   SrTbJKssRFhxo4USE4C+StM+E9hu5BnLsO5wNwbCF8HA8Z8IqJOMvNeyF
   jded16ChrSfnEEAEelXXXtdHHrXx2TcjpHPuTYjpewkYnaBqp/P2gzjDI
   LnV3MBHL6J9NNvTOXGC1NXs36/q6RXLs9bZLRMVooNmVqTGJ3fMoUtBd+
   yaTpJUjvEb4crVCUr3dfvC/DUa4JK3k7Cyw2Ojtp/Jncvz4Pk4t3pwoRL
   Q==;
IronPort-SDR: 3Bbqq+3ueyuEU0vcFJ63If04Fklj8PCnVSsmtda/MfpzXzLeqBZv06fQHy9pyyPmCnNbtRr+0a
 WKD8Sfn8OkWwYsBSil4fsWOrrGRJoDowIhYPnCMK08AvJmX7pZ/EXNgGSYq79ci5/nEx5RWj70
 mwSIziKMbOkRgj/N237z1EX/Kkra6yNHUeCsDuY7rS9uKCqDBBXbGr8dzn9k6No+gjmoT8Cw3I
 R7cuwk+XjmQNHshM9gm7mEbUFj8srYBXqe4n0XXL58LCAGSjnt3RhOmuz/UFFD9kWdP7Pu2Cdt
 iUk=
X-IronPort-AV: E=Sophos;i="5.73,387,1583218800"; 
   d="scan'208";a="76494509"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 May 2020 05:55:55 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 13 May 2020 05:55:57 -0700
Received: from soft-dev15.microsemi.net (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.1713.5 via Frontend Transport; Wed, 13 May 2020 05:55:52 -0700
From:   Lars Povlsen <lars.povlsen@microchip.com>
To:     SoC Team <soc@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
CC:     Lars Povlsen <lars.povlsen@microchip.com>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        Olof Johansson <olof@lixom.net>,
        "Michael Turquette" <mturquette@baylibre.com>,
        <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH 00/14] Adding support for Microchip Sparx5 SoC
Date:   Wed, 13 May 2020 14:55:18 +0200
Message-ID: <20200513125532.24585-1-lars.povlsen@microchip.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch series adds support for Microchip Sparx5 SoC, the CPU
system of a advanced, TSN capable gigabit switch. The CPU is an armv8
x 2 CPU core (A53).

Although this is an ARM core, it shares some peripherals with the
Microsemi Ocelot SoC.

This is the first official revision of the series.

Lars Povlsen (14):
  pinctrl: ocelot: Should register GPIO's even if not irq controller
  pinctrl: ocelot: Remove instance number from pin functions
  pinctrl: ocelot: Fix GPIO interrupt decoding on Jaguar2
  arm64: sparx5: Add support for Microchip 2xA53 SoC
  dt-bindings: arm: sparx5: Add documentation for Microchip Sparx5 SoC
  arm64: dts: sparx5: Add basic cpu support
  dt-bindings: pinctrl: ocelot: Add Sparx5 SoC support
  arm64: dts: sparx5: Add pinctrl support
  pinctrl: ocelot: Add Sparx5 SoC support
  dt-bindings: clock: sparx5: Add Sparx5 SoC DPLL clock
  dt-bindings: clock: sparx5: Add bindings include file
  clk: sparx5: Add Sparx5 SoC DPLL clock driver
  arm64: dts: sparx5: Add Sparx5 SoC DPLL clock
  arm64: dts: sparx5: Add i2c devices, i2c muxes

 .../bindings/arm/microchip,sparx5.yaml        |  87 +++
 .../bindings/clock/microchip,sparx5-dpll.yaml |  46 ++
 .../bindings/pinctrl/mscc,ocelot-pinctrl.txt  |   4 +-
 MAINTAINERS                                   |   9 +
 arch/arm64/Kconfig.platforms                  |  14 +
 arch/arm64/boot/dts/Makefile                  |   1 +
 arch/arm64/boot/dts/microchip/Makefile        |   4 +
 arch/arm64/boot/dts/microchip/sparx5.dtsi     | 202 +++++++
 .../boot/dts/microchip/sparx5_pcb125.dts      |  21 +
 .../boot/dts/microchip/sparx5_pcb134.dts      |  17 +
 .../dts/microchip/sparx5_pcb134_board.dtsi    | 252 ++++++++
 .../boot/dts/microchip/sparx5_pcb134_emmc.dts |  17 +
 .../boot/dts/microchip/sparx5_pcb135.dts      |  17 +
 .../dts/microchip/sparx5_pcb135_board.dtsi    |  92 +++
 .../boot/dts/microchip/sparx5_pcb135_emmc.dts |  17 +
 .../boot/dts/microchip/sparx5_pcb_common.dtsi |  19 +
 drivers/clk/Makefile                          |   1 +
 drivers/clk/clk-sparx5.c                      | 269 +++++++++
 drivers/pinctrl/pinctrl-ocelot.c              | 558 +++++++++++++++---
 include/dt-bindings/clock/microchip,sparx5.h  |  23 +
 20 files changed, 1587 insertions(+), 83 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/microchip,sparx5.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/microchip,sparx5-dpll.yaml
 create mode 100644 arch/arm64/boot/dts/microchip/Makefile
 create mode 100644 arch/arm64/boot/dts/microchip/sparx5.dtsi
 create mode 100644 arch/arm64/boot/dts/microchip/sparx5_pcb125.dts
 create mode 100644 arch/arm64/boot/dts/microchip/sparx5_pcb134.dts
 create mode 100644 arch/arm64/boot/dts/microchip/sparx5_pcb134_board.dtsi
 create mode 100644 arch/arm64/boot/dts/microchip/sparx5_pcb134_emmc.dts
 create mode 100644 arch/arm64/boot/dts/microchip/sparx5_pcb135.dts
 create mode 100644 arch/arm64/boot/dts/microchip/sparx5_pcb135_board.dtsi
 create mode 100644 arch/arm64/boot/dts/microchip/sparx5_pcb135_emmc.dts
 create mode 100644 arch/arm64/boot/dts/microchip/sparx5_pcb_common.dtsi
 create mode 100644 drivers/clk/clk-sparx5.c
 create mode 100644 include/dt-bindings/clock/microchip,sparx5.h

--
2.26.2
