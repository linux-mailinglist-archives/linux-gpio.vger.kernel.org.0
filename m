Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A89450F15
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Jun 2019 16:50:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728127AbfFXOuD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 Jun 2019 10:50:03 -0400
Received: from michel.telenet-ops.be ([195.130.137.88]:37244 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727454AbfFXOuD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Jun 2019 10:50:03 -0400
Received: from ramsan ([84.194.111.163])
        by michel.telenet-ops.be with bizsmtp
        id Uepy2000G3XaVaC06epyXb; Mon, 24 Jun 2019 16:49:58 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hfQIA-00043y-2x; Mon, 24 Jun 2019 16:49:58 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hfQIA-0008QZ-1K; Mon, 24 Jun 2019 16:49:58 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] gpio: Sort GPIO drivers in Makefile
Date:   Mon, 24 Jun 2019 16:49:56 +0200
Message-Id: <20190624144956.32354-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Sort the definitions for the individual GPIO drivers in the Makefile, by
object file name.  Align all entries while at it.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/gpio/Makefile | 296 +++++++++++++++++++++---------------------
 1 file changed, 148 insertions(+), 148 deletions(-)

diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 6700eee860b76f3b..9e400e34e3003ed7 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -17,154 +17,154 @@ obj-$(CONFIG_GPIO_GENERIC)	+= gpio-generic.o
 # directly supported by gpio-generic
 gpio-generic-$(CONFIG_GPIO_GENERIC)	+= gpio-mmio.o
 
-obj-$(CONFIG_GPIO_104_DIO_48E)	+= gpio-104-dio-48e.o
-obj-$(CONFIG_GPIO_104_IDIO_16)	+= gpio-104-idio-16.o
-obj-$(CONFIG_GPIO_104_IDI_48)	+= gpio-104-idi-48.o
-obj-$(CONFIG_GPIO_74X164)	+= gpio-74x164.o
-obj-$(CONFIG_GPIO_74XX_MMIO)	+= gpio-74xx-mmio.o
-obj-$(CONFIG_GPIO_ADNP)		+= gpio-adnp.o
-obj-$(CONFIG_GPIO_ADP5520)	+= gpio-adp5520.o
-obj-$(CONFIG_GPIO_ADP5588)	+= gpio-adp5588.o
-obj-$(CONFIG_GPIO_ALTERA)  	+= gpio-altera.o
-obj-$(CONFIG_GPIO_ALTERA_A10SR)	+= gpio-altera-a10sr.o
-obj-$(CONFIG_GPIO_AMD_FCH)	+= gpio-amd-fch.o
-obj-$(CONFIG_GPIO_AMD8111)	+= gpio-amd8111.o
-obj-$(CONFIG_GPIO_AMDPT)	+= gpio-amdpt.o
-obj-$(CONFIG_GPIO_ARIZONA)	+= gpio-arizona.o
-obj-$(CONFIG_GPIO_ATH79)	+= gpio-ath79.o
-obj-$(CONFIG_GPIO_ASPEED)	+= gpio-aspeed.o
-obj-$(CONFIG_GPIO_RASPBERRYPI_EXP)	+= gpio-raspberrypi-exp.o
-obj-$(CONFIG_GPIO_BCM_KONA)	+= gpio-bcm-kona.o
-obj-$(CONFIG_GPIO_BD9571MWV)	+= gpio-bd9571mwv.o
-obj-$(CONFIG_GPIO_BRCMSTB)	+= gpio-brcmstb.o
-obj-$(CONFIG_GPIO_BT8XX)	+= gpio-bt8xx.o
-obj-$(CONFIG_GPIO_CADENCE)	+= gpio-cadence.o
-obj-$(CONFIG_GPIO_CLPS711X)	+= gpio-clps711x.o
-obj-$(CONFIG_GPIO_CS5535)	+= gpio-cs5535.o
-obj-$(CONFIG_GPIO_CRYSTAL_COVE)	+= gpio-crystalcove.o
-obj-$(CONFIG_GPIO_DA9052)	+= gpio-da9052.o
-obj-$(CONFIG_GPIO_DA9055)	+= gpio-da9055.o
-obj-$(CONFIG_GPIO_DAVINCI)	+= gpio-davinci.o
-obj-$(CONFIG_GPIO_DLN2)		+= gpio-dln2.o
-obj-$(CONFIG_GPIO_DWAPB)	+= gpio-dwapb.o
-obj-$(CONFIG_GPIO_EIC_SPRD)	+= gpio-eic-sprd.o
-obj-$(CONFIG_GPIO_EM)		+= gpio-em.o
-obj-$(CONFIG_GPIO_EP93XX)	+= gpio-ep93xx.o
-obj-$(CONFIG_GPIO_EXAR)		+= gpio-exar.o
-obj-$(CONFIG_GPIO_F7188X)	+= gpio-f7188x.o
-obj-$(CONFIG_GPIO_FTGPIO010)	+= gpio-ftgpio010.o
-obj-$(CONFIG_GPIO_GE_FPGA)	+= gpio-ge.o
-obj-$(CONFIG_GPIO_GPIO_MM)	+= gpio-gpio-mm.o
-obj-$(CONFIG_GPIO_GRGPIO)	+= gpio-grgpio.o
-obj-$(CONFIG_GPIO_GW_PLD)	+= gpio-gw-pld.o
-obj-$(CONFIG_GPIO_HLWD)		+= gpio-hlwd.o
-obj-$(CONFIG_HTC_EGPIO)		+= gpio-htc-egpio.o
-obj-$(CONFIG_GPIO_ICH)		+= gpio-ich.o
-obj-$(CONFIG_GPIO_IOP)		+= gpio-iop.o
-obj-$(CONFIG_GPIO_IXP4XX)	+= gpio-ixp4xx.o
-obj-$(CONFIG_GPIO_IT87)		+= gpio-it87.o
-obj-$(CONFIG_GPIO_JANZ_TTL)	+= gpio-janz-ttl.o
-obj-$(CONFIG_GPIO_KEMPLD)	+= gpio-kempld.o
-obj-$(CONFIG_ARCH_KS8695)	+= gpio-ks8695.o
-obj-$(CONFIG_GPIO_INTEL_MID)	+= gpio-intel-mid.o
-obj-$(CONFIG_GPIO_LOONGSON)	+= gpio-loongson.o
-obj-$(CONFIG_GPIO_LP3943)	+= gpio-lp3943.o
-obj-$(CONFIG_GPIO_LPC18XX)	+= gpio-lpc18xx.o
-obj-$(CONFIG_ARCH_LPC32XX)	+= gpio-lpc32xx.o
-obj-$(CONFIG_GPIO_LP873X)	+= gpio-lp873x.o
-obj-$(CONFIG_GPIO_LP87565)	+= gpio-lp87565.o
-obj-$(CONFIG_GPIO_LYNXPOINT)	+= gpio-lynxpoint.o
-obj-$(CONFIG_GPIO_MADERA)	+= gpio-madera.o
-obj-$(CONFIG_GPIO_MAX3191X)	+= gpio-max3191x.o
-obj-$(CONFIG_GPIO_MAX730X)	+= gpio-max730x.o
-obj-$(CONFIG_GPIO_MAX7300)	+= gpio-max7300.o
-obj-$(CONFIG_GPIO_MAX7301)	+= gpio-max7301.o
-obj-$(CONFIG_GPIO_MAX732X)	+= gpio-max732x.o
-obj-$(CONFIG_GPIO_MAX77620)	+= gpio-max77620.o
-obj-$(CONFIG_GPIO_MAX77650)	+= gpio-max77650.o
-obj-$(CONFIG_GPIO_MB86S7X)	+= gpio-mb86s7x.o
-obj-$(CONFIG_GPIO_MENZ127)	+= gpio-menz127.o
-obj-$(CONFIG_GPIO_MERRIFIELD)	+= gpio-merrifield.o
-obj-$(CONFIG_GPIO_MC33880)	+= gpio-mc33880.o
-obj-$(CONFIG_GPIO_MC9S08DZ60)	+= gpio-mc9s08dz60.o
-obj-$(CONFIG_GPIO_MLXBF)	+= gpio-mlxbf.o
-obj-$(CONFIG_GPIO_ML_IOH)	+= gpio-ml-ioh.o
-obj-$(CONFIG_GPIO_MM_LANTIQ)	+= gpio-mm-lantiq.o
-obj-$(CONFIG_GPIO_MOCKUP)      += gpio-mockup.o
-obj-$(CONFIG_GPIO_MPC5200)	+= gpio-mpc5200.o
-obj-$(CONFIG_GPIO_MPC8XXX)	+= gpio-mpc8xxx.o
-obj-$(CONFIG_GPIO_MSIC)		+= gpio-msic.o
+obj-$(CONFIG_GPIO_104_DIO_48E)		+= gpio-104-dio-48e.o
+obj-$(CONFIG_GPIO_104_IDI_48)		+= gpio-104-idi-48.o
+obj-$(CONFIG_GPIO_104_IDIO_16)		+= gpio-104-idio-16.o
+obj-$(CONFIG_GPIO_74X164)		+= gpio-74x164.o
+obj-$(CONFIG_GPIO_74XX_MMIO)		+= gpio-74xx-mmio.o
+obj-$(CONFIG_GPIO_ADNP)			+= gpio-adnp.o
+obj-$(CONFIG_GPIO_ADP5520)		+= gpio-adp5520.o
+obj-$(CONFIG_GPIO_ADP5588)		+= gpio-adp5588.o
+obj-$(CONFIG_GPIO_ALTERA_A10SR)		+= gpio-altera-a10sr.o
+obj-$(CONFIG_GPIO_ALTERA)  		+= gpio-altera.o
+obj-$(CONFIG_GPIO_AMD8111)		+= gpio-amd8111.o
+obj-$(CONFIG_GPIO_AMD_FCH)		+= gpio-amd-fch.o
+obj-$(CONFIG_GPIO_AMDPT)		+= gpio-amdpt.o
+obj-$(CONFIG_GPIO_ARIZONA)		+= gpio-arizona.o
+obj-$(CONFIG_GPIO_ASPEED)		+= gpio-aspeed.o
+obj-$(CONFIG_GPIO_ATH79)		+= gpio-ath79.o
+obj-$(CONFIG_GPIO_BCM_KONA)		+= gpio-bcm-kona.o
+obj-$(CONFIG_GPIO_BD9571MWV)		+= gpio-bd9571mwv.o
+obj-$(CONFIG_GPIO_BRCMSTB)		+= gpio-brcmstb.o
+obj-$(CONFIG_GPIO_BT8XX)		+= gpio-bt8xx.o
+obj-$(CONFIG_GPIO_CADENCE)		+= gpio-cadence.o
+obj-$(CONFIG_GPIO_CLPS711X)		+= gpio-clps711x.o
+obj-$(CONFIG_GPIO_SNPS_CREG)		+= gpio-creg-snps.o
+obj-$(CONFIG_GPIO_CRYSTAL_COVE)		+= gpio-crystalcove.o
+obj-$(CONFIG_GPIO_CS5535)		+= gpio-cs5535.o
+obj-$(CONFIG_GPIO_DA9052)		+= gpio-da9052.o
+obj-$(CONFIG_GPIO_DA9055)		+= gpio-da9055.o
+obj-$(CONFIG_GPIO_DAVINCI)		+= gpio-davinci.o
+obj-$(CONFIG_GPIO_DLN2)			+= gpio-dln2.o
+obj-$(CONFIG_GPIO_DWAPB)		+= gpio-dwapb.o
+obj-$(CONFIG_GPIO_EIC_SPRD)		+= gpio-eic-sprd.o
+obj-$(CONFIG_GPIO_EM)			+= gpio-em.o
+obj-$(CONFIG_GPIO_EP93XX)		+= gpio-ep93xx.o
+obj-$(CONFIG_GPIO_EXAR)			+= gpio-exar.o
+obj-$(CONFIG_GPIO_F7188X)		+= gpio-f7188x.o
+obj-$(CONFIG_GPIO_FTGPIO010)		+= gpio-ftgpio010.o
+obj-$(CONFIG_GPIO_GE_FPGA)		+= gpio-ge.o
+obj-$(CONFIG_GPIO_GPIO_MM)		+= gpio-gpio-mm.o
+obj-$(CONFIG_GPIO_GRGPIO)		+= gpio-grgpio.o
+obj-$(CONFIG_GPIO_GW_PLD)		+= gpio-gw-pld.o
+obj-$(CONFIG_GPIO_HLWD)			+= gpio-hlwd.o
+obj-$(CONFIG_HTC_EGPIO)			+= gpio-htc-egpio.o
+obj-$(CONFIG_GPIO_ICH)			+= gpio-ich.o
+obj-$(CONFIG_GPIO_INTEL_MID)		+= gpio-intel-mid.o
+obj-$(CONFIG_GPIO_IOP)			+= gpio-iop.o
+obj-$(CONFIG_GPIO_IT87)			+= gpio-it87.o
+obj-$(CONFIG_GPIO_IXP4XX)		+= gpio-ixp4xx.o
+obj-$(CONFIG_GPIO_JANZ_TTL)		+= gpio-janz-ttl.o
+obj-$(CONFIG_GPIO_KEMPLD)		+= gpio-kempld.o
+obj-$(CONFIG_ARCH_KS8695)		+= gpio-ks8695.o
+obj-$(CONFIG_GPIO_LOONGSON1)		+= gpio-loongson1.o
+obj-$(CONFIG_GPIO_LOONGSON)		+= gpio-loongson.o
+obj-$(CONFIG_GPIO_LP3943)		+= gpio-lp3943.o
+obj-$(CONFIG_GPIO_LP873X)		+= gpio-lp873x.o
+obj-$(CONFIG_GPIO_LP87565)		+= gpio-lp87565.o
+obj-$(CONFIG_GPIO_LPC18XX)		+= gpio-lpc18xx.o
+obj-$(CONFIG_ARCH_LPC32XX)		+= gpio-lpc32xx.o
+obj-$(CONFIG_GPIO_LYNXPOINT)		+= gpio-lynxpoint.o
+obj-$(CONFIG_GPIO_MADERA)		+= gpio-madera.o
+obj-$(CONFIG_GPIO_MAX3191X)		+= gpio-max3191x.o
+obj-$(CONFIG_GPIO_MAX7300)		+= gpio-max7300.o
+obj-$(CONFIG_GPIO_MAX7301)		+= gpio-max7301.o
+obj-$(CONFIG_GPIO_MAX730X)		+= gpio-max730x.o
+obj-$(CONFIG_GPIO_MAX732X)		+= gpio-max732x.o
+obj-$(CONFIG_GPIO_MAX77620)		+= gpio-max77620.o
+obj-$(CONFIG_GPIO_MAX77650)		+= gpio-max77650.o
+obj-$(CONFIG_GPIO_MB86S7X)		+= gpio-mb86s7x.o
+obj-$(CONFIG_GPIO_MC33880)		+= gpio-mc33880.o
+obj-$(CONFIG_GPIO_MC9S08DZ60)		+= gpio-mc9s08dz60.o
+obj-$(CONFIG_GPIO_MENZ127)		+= gpio-menz127.o
+obj-$(CONFIG_GPIO_MERRIFIELD)		+= gpio-merrifield.o
+obj-$(CONFIG_GPIO_ML_IOH)		+= gpio-ml-ioh.o
+obj-$(CONFIG_GPIO_MLXBF)		+= gpio-mlxbf.o
+obj-$(CONFIG_GPIO_MM_LANTIQ)		+= gpio-mm-lantiq.o
+obj-$(CONFIG_GPIO_MOCKUP)		+= gpio-mockup.o
+obj-$(CONFIG_GPIO_MPC5200)		+= gpio-mpc5200.o
+obj-$(CONFIG_GPIO_MPC8XXX)		+= gpio-mpc8xxx.o
+obj-$(CONFIG_GPIO_MSIC)			+= gpio-msic.o
 obj-$(CONFIG_GPIO_MT7621)		+= gpio-mt7621.o
-obj-$(CONFIG_GPIO_MVEBU)        += gpio-mvebu.o
-obj-$(CONFIG_GPIO_MXC)		+= gpio-mxc.o
-obj-$(CONFIG_GPIO_MXS)		+= gpio-mxs.o
-obj-$(CONFIG_GPIO_OCTEON)	+= gpio-octeon.o
-obj-$(CONFIG_GPIO_OMAP)		+= gpio-omap.o
-obj-$(CONFIG_GPIO_PCA953X)	+= gpio-pca953x.o
-obj-$(CONFIG_GPIO_PCF857X)	+= gpio-pcf857x.o
-obj-$(CONFIG_GPIO_PCH)		+= gpio-pch.o
-obj-$(CONFIG_GPIO_PCI_IDIO_16)	+= gpio-pci-idio-16.o
-obj-$(CONFIG_GPIO_PCIE_IDIO_24)	+= gpio-pcie-idio-24.o
-obj-$(CONFIG_GPIO_PISOSR)	+= gpio-pisosr.o
-obj-$(CONFIG_GPIO_PL061)	+= gpio-pl061.o
+obj-$(CONFIG_GPIO_MVEBU)		+= gpio-mvebu.o
+obj-$(CONFIG_GPIO_MXC)			+= gpio-mxc.o
+obj-$(CONFIG_GPIO_MXS)			+= gpio-mxs.o
+obj-$(CONFIG_GPIO_OCTEON)		+= gpio-octeon.o
+obj-$(CONFIG_GPIO_OMAP)			+= gpio-omap.o
+obj-$(CONFIG_GPIO_PALMAS)		+= gpio-palmas.o
+obj-$(CONFIG_GPIO_PCA953X)		+= gpio-pca953x.o
+obj-$(CONFIG_GPIO_PCF857X)		+= gpio-pcf857x.o
+obj-$(CONFIG_GPIO_PCH)			+= gpio-pch.o
+obj-$(CONFIG_GPIO_PCIE_IDIO_24)		+= gpio-pcie-idio-24.o
+obj-$(CONFIG_GPIO_PCI_IDIO_16)		+= gpio-pci-idio-16.o
+obj-$(CONFIG_GPIO_PISOSR)		+= gpio-pisosr.o
+obj-$(CONFIG_GPIO_PL061)		+= gpio-pl061.o
 obj-$(CONFIG_GPIO_PMIC_EIC_SPRD)	+= gpio-pmic-eic-sprd.o
-obj-$(CONFIG_GPIO_PXA)		+= gpio-pxa.o
-obj-$(CONFIG_GPIO_RC5T583)	+= gpio-rc5t583.o
-obj-$(CONFIG_GPIO_RDC321X)	+= gpio-rdc321x.o
-obj-$(CONFIG_GPIO_RCAR)		+= gpio-rcar.o
-obj-$(CONFIG_GPIO_REG)		+= gpio-reg.o
-obj-$(CONFIG_ARCH_SA1100)	+= gpio-sa1100.o
+obj-$(CONFIG_GPIO_PXA)			+= gpio-pxa.o
+obj-$(CONFIG_GPIO_RASPBERRYPI_EXP)	+= gpio-raspberrypi-exp.o
+obj-$(CONFIG_GPIO_RC5T583)		+= gpio-rc5t583.o
+obj-$(CONFIG_GPIO_RCAR)			+= gpio-rcar.o
+obj-$(CONFIG_GPIO_RDC321X)		+= gpio-rdc321x.o
+obj-$(CONFIG_GPIO_REG)			+= gpio-reg.o
+obj-$(CONFIG_ARCH_SA1100)		+= gpio-sa1100.o
 obj-$(CONFIG_GPIO_SAMA5D2_PIOBU)	+= gpio-sama5d2-piobu.o
-obj-$(CONFIG_GPIO_SCH)		+= gpio-sch.o
-obj-$(CONFIG_GPIO_SCH311X)	+= gpio-sch311x.o
-obj-$(CONFIG_GPIO_SNPS_CREG)	+= gpio-creg-snps.o
-obj-$(CONFIG_GPIO_SODAVILLE)	+= gpio-sodaville.o
-obj-$(CONFIG_GPIO_SPEAR_SPICS)	+= gpio-spear-spics.o
-obj-$(CONFIG_GPIO_SPRD)		+= gpio-sprd.o
-obj-$(CONFIG_GPIO_STA2X11)	+= gpio-sta2x11.o
-obj-$(CONFIG_GPIO_STMPE)	+= gpio-stmpe.o
-obj-$(CONFIG_GPIO_STP_XWAY)	+= gpio-stp-xway.o
-obj-$(CONFIG_GPIO_SYSCON)	+= gpio-syscon.o
-obj-$(CONFIG_GPIO_TB10X)	+= gpio-tb10x.o
-obj-$(CONFIG_GPIO_TC3589X)	+= gpio-tc3589x.o
-obj-$(CONFIG_GPIO_TEGRA)	+= gpio-tegra.o
-obj-$(CONFIG_GPIO_TEGRA186)	+= gpio-tegra186.o
-obj-$(CONFIG_GPIO_THUNDERX)	+= gpio-thunderx.o
-obj-$(CONFIG_GPIO_TIMBERDALE)	+= gpio-timberdale.o
-obj-$(CONFIG_GPIO_PALMAS)	+= gpio-palmas.o
-obj-$(CONFIG_GPIO_SIOX)		+= gpio-siox.o
-obj-$(CONFIG_GPIO_TPIC2810)	+= gpio-tpic2810.o
-obj-$(CONFIG_GPIO_TPS65086)	+= gpio-tps65086.o
-obj-$(CONFIG_GPIO_TPS65218)	+= gpio-tps65218.o
-obj-$(CONFIG_GPIO_TPS6586X)	+= gpio-tps6586x.o
-obj-$(CONFIG_GPIO_TPS65910)	+= gpio-tps65910.o
-obj-$(CONFIG_GPIO_TPS65912)	+= gpio-tps65912.o
-obj-$(CONFIG_GPIO_TPS68470)	+= gpio-tps68470.o
-obj-$(CONFIG_GPIO_TQMX86)	+= gpio-tqmx86.o
-obj-$(CONFIG_GPIO_TS4800)	+= gpio-ts4800.o
-obj-$(CONFIG_GPIO_TS4900)	+= gpio-ts4900.o
-obj-$(CONFIG_GPIO_TS5500)	+= gpio-ts5500.o
-obj-$(CONFIG_GPIO_TWL4030)	+= gpio-twl4030.o
-obj-$(CONFIG_GPIO_TWL6040)	+= gpio-twl6040.o
-obj-$(CONFIG_GPIO_UCB1400)	+= gpio-ucb1400.o
-obj-$(CONFIG_GPIO_UNIPHIER)	+= gpio-uniphier.o
-obj-$(CONFIG_GPIO_VF610)	+= gpio-vf610.o
-obj-$(CONFIG_GPIO_VIPERBOARD)	+= gpio-viperboard.o
-obj-$(CONFIG_GPIO_VR41XX)	+= gpio-vr41xx.o
-obj-$(CONFIG_GPIO_VX855)	+= gpio-vx855.o
-obj-$(CONFIG_GPIO_WHISKEY_COVE)	+= gpio-wcove.o
-obj-$(CONFIG_GPIO_WINBOND)	+= gpio-winbond.o
-obj-$(CONFIG_GPIO_WM831X)	+= gpio-wm831x.o
-obj-$(CONFIG_GPIO_WM8350)	+= gpio-wm8350.o
-obj-$(CONFIG_GPIO_WM8994)	+= gpio-wm8994.o
-obj-$(CONFIG_GPIO_WS16C48)	+= gpio-ws16c48.o
-obj-$(CONFIG_GPIO_XGENE)	+= gpio-xgene.o
-obj-$(CONFIG_GPIO_XGENE_SB)	+= gpio-xgene-sb.o
-obj-$(CONFIG_GPIO_XILINX)	+= gpio-xilinx.o
-obj-$(CONFIG_GPIO_XLP)		+= gpio-xlp.o
-obj-$(CONFIG_GPIO_XRA1403)	+= gpio-xra1403.o
-obj-$(CONFIG_GPIO_XTENSA)	+= gpio-xtensa.o
-obj-$(CONFIG_GPIO_ZEVIO)	+= gpio-zevio.o
-obj-$(CONFIG_GPIO_ZYNQ)		+= gpio-zynq.o
-obj-$(CONFIG_GPIO_ZX)		+= gpio-zx.o
-obj-$(CONFIG_GPIO_LOONGSON1)	+= gpio-loongson1.o
+obj-$(CONFIG_GPIO_SCH311X)		+= gpio-sch311x.o
+obj-$(CONFIG_GPIO_SCH)			+= gpio-sch.o
+obj-$(CONFIG_GPIO_SIOX)			+= gpio-siox.o
+obj-$(CONFIG_GPIO_SODAVILLE)		+= gpio-sodaville.o
+obj-$(CONFIG_GPIO_SPEAR_SPICS)		+= gpio-spear-spics.o
+obj-$(CONFIG_GPIO_SPRD)			+= gpio-sprd.o
+obj-$(CONFIG_GPIO_STA2X11)		+= gpio-sta2x11.o
+obj-$(CONFIG_GPIO_STMPE)		+= gpio-stmpe.o
+obj-$(CONFIG_GPIO_STP_XWAY)		+= gpio-stp-xway.o
+obj-$(CONFIG_GPIO_SYSCON)		+= gpio-syscon.o
+obj-$(CONFIG_GPIO_TB10X)		+= gpio-tb10x.o
+obj-$(CONFIG_GPIO_TC3589X)		+= gpio-tc3589x.o
+obj-$(CONFIG_GPIO_TEGRA186)		+= gpio-tegra186.o
+obj-$(CONFIG_GPIO_TEGRA)		+= gpio-tegra.o
+obj-$(CONFIG_GPIO_THUNDERX)		+= gpio-thunderx.o
+obj-$(CONFIG_GPIO_TIMBERDALE)		+= gpio-timberdale.o
+obj-$(CONFIG_GPIO_TPIC2810)		+= gpio-tpic2810.o
+obj-$(CONFIG_GPIO_TPS65086)		+= gpio-tps65086.o
+obj-$(CONFIG_GPIO_TPS65218)		+= gpio-tps65218.o
+obj-$(CONFIG_GPIO_TPS6586X)		+= gpio-tps6586x.o
+obj-$(CONFIG_GPIO_TPS65910)		+= gpio-tps65910.o
+obj-$(CONFIG_GPIO_TPS65912)		+= gpio-tps65912.o
+obj-$(CONFIG_GPIO_TPS68470)		+= gpio-tps68470.o
+obj-$(CONFIG_GPIO_TQMX86)		+= gpio-tqmx86.o
+obj-$(CONFIG_GPIO_TS4800)		+= gpio-ts4800.o
+obj-$(CONFIG_GPIO_TS4900)		+= gpio-ts4900.o
+obj-$(CONFIG_GPIO_TS5500)		+= gpio-ts5500.o
+obj-$(CONFIG_GPIO_TWL4030)		+= gpio-twl4030.o
+obj-$(CONFIG_GPIO_TWL6040)		+= gpio-twl6040.o
+obj-$(CONFIG_GPIO_UCB1400)		+= gpio-ucb1400.o
+obj-$(CONFIG_GPIO_UNIPHIER)		+= gpio-uniphier.o
+obj-$(CONFIG_GPIO_VF610)		+= gpio-vf610.o
+obj-$(CONFIG_GPIO_VIPERBOARD)		+= gpio-viperboard.o
+obj-$(CONFIG_GPIO_VR41XX)		+= gpio-vr41xx.o
+obj-$(CONFIG_GPIO_VX855)		+= gpio-vx855.o
+obj-$(CONFIG_GPIO_WHISKEY_COVE)		+= gpio-wcove.o
+obj-$(CONFIG_GPIO_WINBOND)		+= gpio-winbond.o
+obj-$(CONFIG_GPIO_WM831X)		+= gpio-wm831x.o
+obj-$(CONFIG_GPIO_WM8350)		+= gpio-wm8350.o
+obj-$(CONFIG_GPIO_WM8994)		+= gpio-wm8994.o
+obj-$(CONFIG_GPIO_WS16C48)		+= gpio-ws16c48.o
+obj-$(CONFIG_GPIO_XGENE)		+= gpio-xgene.o
+obj-$(CONFIG_GPIO_XGENE_SB)		+= gpio-xgene-sb.o
+obj-$(CONFIG_GPIO_XILINX)		+= gpio-xilinx.o
+obj-$(CONFIG_GPIO_XLP)			+= gpio-xlp.o
+obj-$(CONFIG_GPIO_XRA1403)		+= gpio-xra1403.o
+obj-$(CONFIG_GPIO_XTENSA)		+= gpio-xtensa.o
+obj-$(CONFIG_GPIO_ZEVIO)		+= gpio-zevio.o
+obj-$(CONFIG_GPIO_ZX)			+= gpio-zx.o
+obj-$(CONFIG_GPIO_ZYNQ)			+= gpio-zynq.o
-- 
2.17.1

