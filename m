Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4060822E96F
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Jul 2020 11:50:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726315AbgG0JuO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 Jul 2020 05:50:14 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:55601 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726139AbgG0JuN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Jul 2020 05:50:13 -0400
X-Originating-IP: 90.66.108.79
Received: from localhost (lfbn-lyo-1-1932-79.w90-66.abo.wanadoo.fr [90.66.108.79])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id DAB87E0011;
        Mon, 27 Jul 2020 09:50:09 +0000 (UTC)
Date:   Mon, 27 Jul 2020 11:50:09 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Lars Povlsen <lars.povlsen@microchip.com>
Cc:     SoC Team <soc@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        Olof Johansson <olof@lixom.net>,
        Michael Turquette <mturquette@baylibre.com>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 00/10] Adding support for Microchip Sparx5 SoC
Message-ID: <20200727095009.GK4073@piout.net>
References: <20200727084211.6632-1-lars.povlsen@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200727084211.6632-1-lars.povlsen@microchip.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Lars,

As Arnd stated, he already applied the patches so you have to send an
incremental patch to fix the clock driver.

On 27/07/2020 10:42:01+0200, Lars Povlsen wrote:
> This patch series adds support for Microchip Sparx5 SoC, the CPU
> system of a advanced, TSN capable gigabit switch. The CPU is an armv8
> x 2 CPU core (A53).
> 
> Although this is an ARM core, it shares some peripherals with the
> Microsemi Ocelot MIPS SoC.
> 
> NB: This version *only* updates the drivers/clk/clk-sparx5.c driver
> 
> Changes in v4:
> - Updates to the clock driver per Stephen Boyd <sboyd@kernel.org>
>  - Remove unused include of of_address.h
>  - Remove unused member in s5_hw_clk struct
>  - Changed type (to unsigned long) for freq in s5_pll_conf struct
>  - Use .parent_data instead of looking up parent name
>  - Use devm_of_clk_add_hw_provider
>  - Some minor comsmetics
> 
> Changes in v3:
> - a "gpio-restart" node has been added to the pcb134/pcb135 DT files.
> - pinctrl-ocelot.c: ENOTSUPP replaced by EOPNOTSUPP. Fixed non-static
>   ocelot_pinconf_set(), Fixed ocelot_hw_get_value() not returning proper
>   read value.
> - Rebased on v5.8-rc1
> 
> Changes in v2:
> - Misc fixes to bindings/arm/microchip,sparx5.yaml
> - Changed clock driver to platform driver, using bitfields, recalc
>   properly implented, using proper clock parent.
> - arch/arm64/boot/dts/microchip/sparx5.dtsi:
>  - Added pmu and psci node, using PSCI
>  - Updates to GICv3 register spaces (GICV/GICH)
>  - Updated timer interrupt specifiers
> - pinctrl: ocelot: Fixed symbol clashes from powerpc
> 
> Lars Povlsen (10):
>   dt-bindings: arm: sparx5: Add documentation for Microchip Sparx5 SoC
>   arm64: sparx5: Add support for Microchip 2xA53 SoC
>   arm64: dts: sparx5: Add basic cpu support
>   arm64: dts: sparx5: Add pinctrl support
>   pinctrl: ocelot: Add Sparx5 SoC support
>   dt-bindings: clock: sparx5: Add Sparx5 SoC DPLL clock
>   dt-bindings: clock: sparx5: Add bindings include file
>   clk: sparx5: Add Sparx5 SoC DPLL clock driver
>   arm64: dts: sparx5: Add Sparx5 SoC DPLL clock
>   arm64: dts: sparx5: Add i2c devices, i2c muxes
> 
>  .../bindings/arm/microchip,sparx5.yaml        |  65 +++
>  .../bindings/clock/microchip,sparx5-dpll.yaml |  52 +++
>  .../devicetree/bindings/mfd/syscon.yaml       |   1 +
>  MAINTAINERS                                   |   9 +
>  arch/arm64/Kconfig.platforms                  |  14 +
>  arch/arm64/boot/dts/Makefile                  |   1 +
>  arch/arm64/boot/dts/microchip/Makefile        |   4 +
>  arch/arm64/boot/dts/microchip/sparx5.dtsi     | 213 +++++++++
>  .../boot/dts/microchip/sparx5_pcb125.dts      |  21 +
>  .../boot/dts/microchip/sparx5_pcb134.dts      |  17 +
>  .../dts/microchip/sparx5_pcb134_board.dtsi    | 252 ++++++++++
>  .../boot/dts/microchip/sparx5_pcb134_emmc.dts |  17 +
>  .../boot/dts/microchip/sparx5_pcb135.dts      |  17 +
>  .../dts/microchip/sparx5_pcb135_board.dtsi    |  92 ++++
>  .../boot/dts/microchip/sparx5_pcb135_emmc.dts |  17 +
>  .../boot/dts/microchip/sparx5_pcb_common.dtsi |  19 +
>  drivers/clk/Makefile                          |   1 +
>  drivers/clk/clk-sparx5.c                      | 295 ++++++++++++
>  drivers/pinctrl/pinctrl-ocelot.c              | 430 +++++++++++++++++-
>  include/dt-bindings/clock/microchip,sparx5.h  |  23 +
>  20 files changed, 1559 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/arm/microchip,sparx5.yaml
>  create mode 100644 Documentation/devicetree/bindings/clock/microchip,sparx5-dpll.yaml
>  create mode 100644 arch/arm64/boot/dts/microchip/Makefile
>  create mode 100644 arch/arm64/boot/dts/microchip/sparx5.dtsi
>  create mode 100644 arch/arm64/boot/dts/microchip/sparx5_pcb125.dts
>  create mode 100644 arch/arm64/boot/dts/microchip/sparx5_pcb134.dts
>  create mode 100644 arch/arm64/boot/dts/microchip/sparx5_pcb134_board.dtsi
>  create mode 100644 arch/arm64/boot/dts/microchip/sparx5_pcb134_emmc.dts
>  create mode 100644 arch/arm64/boot/dts/microchip/sparx5_pcb135.dts
>  create mode 100644 arch/arm64/boot/dts/microchip/sparx5_pcb135_board.dtsi
>  create mode 100644 arch/arm64/boot/dts/microchip/sparx5_pcb135_emmc.dts
>  create mode 100644 arch/arm64/boot/dts/microchip/sparx5_pcb_common.dtsi
>  create mode 100644 drivers/clk/clk-sparx5.c
>  create mode 100644 include/dt-bindings/clock/microchip,sparx5.h
> 
> --
> 2.27.0

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
