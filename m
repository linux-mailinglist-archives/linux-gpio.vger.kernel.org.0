Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5EDB1F18C4
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jun 2020 14:31:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729674AbgFHMar (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Jun 2020 08:30:47 -0400
Received: from esa3.microchip.iphmx.com ([68.232.153.233]:63712 "EHLO
        esa3.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729628AbgFHMaq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Jun 2020 08:30:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1591619445; x=1623155445;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=DqVy/lhHPIGLZ2gVhB+SkFZeyg+IWDog1e2aJcvmuys=;
  b=g1OhfxSf5bNH9eAHqIYKROqAvUjUVp3nWW1gh82kObKtTEJMjCi7u/kS
   4ODNpg64G444b0cON5Z98FKcDZJxRryfUoQp5JUbkJbaY5vcof0mGC2uR
   mDOsuMwTePtyywqvq9jXo5OQtwkitq3T7TkxHY82KN3Hp+Isv+rS/MNT+
   quRkeYQtfAbgrnEfwFQAPvX8i9zOY6rYLgdByMmmbL/FYkLIR8qYNIdbf
   hDvjxvcmE4T7sxpZ+6kkqbNZr86UY0JchhZZGgWzfclw541hESHCi6XwM
   /xOewbTChL9GP8OJcSK1o5UpnC6YD4LfVX++c3CTp8TjZ5snElnh4rw/L
   g==;
IronPort-SDR: BrcHFuJ/CQnl0R+wYshXSuibM0g4Hv44Xsj9CFkUwDVQh+f3qllEPIsWKCCnWEPOVK4fTqlzS/
 VBQv+MUopWl4M1on8o/VU19//2S0q5NG2ttiUNiROeXy3A4knhTuk4NcA2Z5a3RkZLwDLViwDU
 AtXaPMkH7UNmQ3VjPPe5lCx/QJXeWml2xlcbSSjA26dPupO4VfYZhxJ3I5ZY+4Q/armI/ZOGO8
 oOBz5R0WgFHfQIGZmg6r4QS+dJX8D6/zuXhzEdaudAeOR5AA77oTieC9Ov0R6soxulLTqMOyDC
 4+c=
X-IronPort-AV: E=Sophos;i="5.73,487,1583218800"; 
   d="scan'208";a="79311433"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 08 Jun 2020 05:30:44 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1847.3; Mon, 8 Jun 2020 05:30:44 -0700
Received: from soft-dev15.microsemi.net (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.1713.5 via Frontend Transport; Mon, 8 Jun 2020 05:30:39 -0700
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
Subject: [PATCH v2 00/10] Adding support for Microchip Sparx5 SoC
Date:   Mon, 8 Jun 2020 14:30:14 +0200
Message-ID: <20200608123024.5330-1-lars.povlsen@microchip.com>
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
Microsemi Ocelot SoC.

Changes in v2:
- Misc fixes to bindings/arm/microchip,sparx5.yaml
- Changed clock driver to platform driver, among other fixes
- arch/arm64/boot/dts/microchip/sparx5.dtsi:
 - Added pmu and psci node, using PSCI
 - Updates to GICv3 register spaces (GICV/GICH)
 - Updated timer interrupt specifiers
- pinctrl: ocelot: Fixed symbol clashes from powerpc
- pinctrl: ocelot: Patches already in next-20200605 have been removed
    from this series.

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
 drivers/pinctrl/pinctrl-ocelot.c              | 431 +++++++++++++++++-
 include/dt-bindings/clock/microchip,sparx5.h  |  23 +
 20 files changed, 1577 insertions(+), 1 deletion(-)
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
