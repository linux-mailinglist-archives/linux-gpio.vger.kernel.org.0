Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15DF11F98AA
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2020 15:33:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730333AbgFONdA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Jun 2020 09:33:00 -0400
Received: from esa5.microchip.iphmx.com ([216.71.150.166]:17288 "EHLO
        esa5.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729875AbgFONc7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Jun 2020 09:32:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1592227979; x=1623763979;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Ka+s5d03Y8BmBXuXW4GOaBZbM0ynu9V+7sDJ77Fp4Ds=;
  b=a/8xdAqHKMoVbKU+4b2kGT9SrLiPlo2KTWivp8we5va8jOmfxqxr/ZzS
   otmRU7cuqq2lYg52y/gSkIwyF6gNWTAXN/WlsYfpPYZvwzYNcsJERQSeJ
   FZOXBo/Jiky+KfSTBmMdLn2MU8QabCcugpRI7QRmdxVTQzOJcRNrkl3hx
   uNPz/VwTLsQ+lCtoaI8TXsGERHMyz2kLJos9XHgkCpK8kabM1EImS2+cR
   tYb1DWipFI9CW7ic+qkb2I9cAa5whLnSQKFt/aeQT67AnoQkqtSdCTaf8
   MZ1ioa8UrbHDwU5iqq2VLA8GkbwS4coHYQ1hiaYy1gWZn7CmCzP0h7Mem
   Q==;
IronPort-SDR: e3CBdppFgGp3sAbe6qxq3NDLY2a4SufAqblFvDA1LXWZSAwHkvaejWSXgfY3wGb4TXWFc57Nrd
 kTBhMXtyzz+pgGvqwRwGLb2diKIaYRtr0o8Cbeh3aCPOXQa0+8vI242STIgfIz1eBYNOdlQhWc
 RLyh9ha+QGzNYASV3uazfyKnc2+GY4hhqQHZ8EjqFeel1hulvHStCIxV1QTphHHadKy3db+RG4
 LQIK7gdnGdSNumistunz2AvjWJX9DR0scAS/eBz020xxawkS7rLAPPkwPi2LJGdlP4aBbG/p/Z
 zY0=
X-IronPort-AV: E=Sophos;i="5.73,514,1583218800"; 
   d="scan'208";a="79480447"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 Jun 2020 06:32:59 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Mon, 15 Jun 2020 06:32:57 -0700
Received: from soft-dev15.microsemi.net (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Mon, 15 Jun 2020 06:32:54 -0700
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
        <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH v3 00/10] Adding support for Microchip Sparx5 SoC
Date:   Mon, 15 Jun 2020 15:32:32 +0200
Message-ID: <20200615133242.24911-1-lars.povlsen@microchip.com>
X-Mailer: git-send-email 2.27.0
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
Microsemi Ocelot MIPS SoC.

Changes in v3:
- a "gpio-restart" node has been added to the pcb134/pcb135 DT files.
- pinctrl-ocelot.c: ENOTSUPP replaced by EOPNOTSUPP. Fixed non-static
  ocelot_pinconf_set(), Fixed ocelot_hw_get_value() not returning proper
  read value.
- Rebased on v5.8-rc1

Changes in v2:
- Misc fixes to bindings/arm/microchip,sparx5.yaml
- Changed clock driver to platform driver, using bitfields, recalc
  properly implented, using proper clock parent.
- arch/arm64/boot/dts/microchip/sparx5.dtsi:
 - Added pmu and psci node, using PSCI
 - Updates to GICv3 register spaces (GICV/GICH)
 - Updated timer interrupt specifiers
- pinctrl: ocelot: Fixed symbol clashes from powerpc

Lars Povlsen (10):
  dt-bindings: arm: sparx5: Add documentation for Microchip Sparx5 SoC
  arm64: sparx5: Add support for Microchip 2xA53 SoC
  arm64: dts: sparx5: Add basic cpu support
  arm64: dts: sparx5: Add pinctrl support
  pinctrl: ocelot: Add Sparx5 SoC support
  dt-bindings: clock: sparx5: Add Sparx5 SoC DPLL clock
  dt-bindings: clock: sparx5: Add bindings include file
  clk: sparx5: Add Sparx5 SoC DPLL clock driver
  arm64: dts: sparx5: Add Sparx5 SoC DPLL clock
  arm64: dts: sparx5: Add i2c devices, i2c muxes

 .../bindings/arm/microchip,sparx5.yaml        |  65 +++
 .../bindings/clock/microchip,sparx5-dpll.yaml |  52 +++
 .../devicetree/bindings/mfd/syscon.yaml       |   1 +
 MAINTAINERS                                   |   9 +
 arch/arm64/Kconfig.platforms                  |  14 +
 arch/arm64/boot/dts/Makefile                  |   1 +
 arch/arm64/boot/dts/microchip/Makefile        |   4 +
 arch/arm64/boot/dts/microchip/sparx5.dtsi     | 213 +++++++++
 .../boot/dts/microchip/sparx5_pcb125.dts      |  21 +
 .../boot/dts/microchip/sparx5_pcb134.dts      |  17 +
 .../dts/microchip/sparx5_pcb134_board.dtsi    | 252 ++++++++++
 .../boot/dts/microchip/sparx5_pcb134_emmc.dts |  17 +
 .../boot/dts/microchip/sparx5_pcb135.dts      |  17 +
 .../dts/microchip/sparx5_pcb135_board.dtsi    |  92 ++++
 .../boot/dts/microchip/sparx5_pcb135_emmc.dts |  17 +
 .../boot/dts/microchip/sparx5_pcb_common.dtsi |  19 +
 drivers/clk/Makefile                          |   1 +
 drivers/clk/clk-sparx5.c                      | 312 +++++++++++++
 drivers/pinctrl/pinctrl-ocelot.c              | 430 +++++++++++++++++-
 include/dt-bindings/clock/microchip,sparx5.h  |  23 +
 20 files changed, 1576 insertions(+), 1 deletion(-)
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
2.27.0

