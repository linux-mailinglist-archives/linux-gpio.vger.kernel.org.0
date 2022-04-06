Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9910F4F61E6
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Apr 2022 16:37:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234971AbiDFOhJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 6 Apr 2022 10:37:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235050AbiDFOg5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 6 Apr 2022 10:36:57 -0400
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [IPv6:2001:df5:b000:5::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2FC5FCBCC
        for <linux-gpio@vger.kernel.org>; Tue,  5 Apr 2022 20:22:36 -0700 (PDT)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id D87C12C0BB4;
        Wed,  6 Apr 2022 03:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1649215353;
        bh=hVpxHdzMJb1hTW90DcdnkBiKsznHikHDfbRI6CGXHh0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=2M5lUscW/ggO8d2VPG/b7qJe37lAxHRDZ8HBdPkMDhmxXsltf7cVBlBCq26pmDIFB
         KTxduFxR8XpUgXgxYvbxAsPNs4IDGLVBaD+9gFgCVmO1Rp794w++0rqcxKBp4lpvPG
         rv6jXJNmmam8XR8290XKJsUmX4WZvFJxvbdRkQRnWdUm3WOvHzPqU64wk+JRw29pTU
         28j7Jv9EKyYvzpHjuoZh4h06/LuN1M6YENpVm2Y67oT1rnoJHV4XlUHDG0VyLCMkaT
         MDJOyYAYf2a9NwM9I9PhRRi67X2AvKm1Exwtu2HaCgoaL5ydFiVZz/cQZtSNlwdKXC
         mxGXPjj/AI2xw==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B624d07790003>; Wed, 06 Apr 2022 15:22:33 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
        by pat.atlnz.lc (Postfix) with ESMTP id 44C0F13EEAA;
        Wed,  6 Apr 2022 15:22:33 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id B31572A2679; Wed,  6 Apr 2022 15:22:28 +1200 (NZST)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     linus.walleij@linaro.org, robh+dt@kernel.org,
        catalin.marinas@arm.com, will@kernel.org, andrew@lunn.ch,
        gregory.clement@bootlin.com, sebastian.hesselbarth@gmail.com,
        kostap@marvell.com, robert.marko@sartura.hr
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v3 3/4] arm64: dts: marvell: Add Armada 98DX2530 SoC and RD-AC5X board
Date:   Wed,  6 Apr 2022 15:21:57 +1200
Message-Id: <20220406032158.1449049-4-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220406032158.1449049-1-chris.packham@alliedtelesis.co.nz>
References: <20220406032158.1449049-1-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.3 cv=JcrCUnCV c=1 sm=1 tr=0 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=z0gMJWrwH1QA:10 a=AA5DLZjKFo6PKoe0PMkA:9
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The 98DX2530 SoC is the Control and Management CPU integrated into
the Marvell 98DX25xx and 98DX35xx series of switch chip (internally
referred to as AlleyCat5 and AlleyCat5X).

These files have been taken from the Marvell SDK and lightly cleaned
up with the License and copyright retained.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---

Notes:
    The Marvell SDK has a number of new compatible strings. I've brought
    through some of the drivers or where possible used an in-tree
    alternative (e.g. there is SDK code for a ac5-gpio but two instances =
of
    the existing marvell,orion-gpio seems to cover what is needed if you =
use
    an appropriate binding). I expect that there will a new series of
    patches when I get some different hardware (or additions to this seri=
es
    depending on if/when it lands).
   =20
    Changes in v3:
    - Move memory node to board
    - Use single digit reg value for phy address
    - Remove MMC node (driver needs work)
    - Remove syscon & simple-mfd for pinctrl
    Changes in v2:
    - Make pinctrl a child node of a syscon node
    - Use marvell,armada-8k-gpio instead of orion-gpio
    - Remove nand peripheral. The Marvell SDK does have some changes for =
the
      ac5-nand-controller but I currently lack hardware with NAND fitted =
so
      I can't test it right now. I've therefore chosen to omit the node a=
nd
      not attempted to bring in the driver or binding.
    - Remove pcie peripheral. Again there are changes in the SDK and I ha=
ve
      no way of testing them.
    - Remove prestera node.
    - Remove "marvell,ac5-ehci" compatible from USB node as
      "marvell,orion-ehci" is sufficient
    - Remove watchdog node. There is a buggy driver for the ac5 watchdog =
in
      the SDK but it needs some work so I've dropped the node for now.

 arch/arm64/boot/dts/marvell/Makefile          |   1 +
 .../boot/dts/marvell/armada-98dx2530.dtsi     | 302 ++++++++++++++++++
 arch/arm64/boot/dts/marvell/rd-ac5x.dts       |  74 +++++
 3 files changed, 377 insertions(+)
 create mode 100644 arch/arm64/boot/dts/marvell/armada-98dx2530.dtsi
 create mode 100644 arch/arm64/boot/dts/marvell/rd-ac5x.dts

diff --git a/arch/arm64/boot/dts/marvell/Makefile b/arch/arm64/boot/dts/m=
arvell/Makefile
index 1c794cdcb8e6..3905dee558b4 100644
--- a/arch/arm64/boot/dts/marvell/Makefile
+++ b/arch/arm64/boot/dts/marvell/Makefile
@@ -24,3 +24,4 @@ dtb-$(CONFIG_ARCH_MVEBU) +=3D cn9132-db.dtb
 dtb-$(CONFIG_ARCH_MVEBU) +=3D cn9132-db-B.dtb
 dtb-$(CONFIG_ARCH_MVEBU) +=3D cn9130-crb-A.dtb
 dtb-$(CONFIG_ARCH_MVEBU) +=3D cn9130-crb-B.dtb
+dtb-$(CONFIG_ARCH_MVEBU) +=3D rd-ac5x.dtb
diff --git a/arch/arm64/boot/dts/marvell/armada-98dx2530.dtsi b/arch/arm6=
4/boot/dts/marvell/armada-98dx2530.dtsi
new file mode 100644
index 000000000000..b726afaa2e1d
--- /dev/null
+++ b/arch/arm64/boot/dts/marvell/armada-98dx2530.dtsi
@@ -0,0 +1,302 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Device Tree For AC5.
+ *
+ * Copyright (C) 2021 Marvell
+ *
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	model =3D "Marvell AC5 SoC";
+	compatible =3D "marvell,ac5";
+	interrupt-parent =3D <&gic>;
+	#address-cells =3D <2>;
+	#size-cells =3D <2>;
+
+	aliases {
+		serial0 =3D &uart0;
+		spiflash0 =3D &spiflash0;
+		gpio0 =3D &gpio0;
+		gpio1 =3D &gpio1;
+		ethernet0 =3D &eth0;
+		ethernet1 =3D &eth1;
+	};
+
+	psci {
+		compatible =3D "arm,psci-0.2";
+		method =3D "smc";
+	};
+
+	timer {
+		compatible =3D "arm,armv8-timer";
+		interrupts =3D <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>,
+				 <GIC_PPI 8 IRQ_TYPE_LEVEL_HIGH>,
+				 <GIC_PPI 10 IRQ_TYPE_LEVEL_HIGH>,
+				 <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
+		clock-frequency =3D <25000000>;
+	};
+
+	pmu {
+		compatible =3D "arm,armv8-pmuv3";
+		interrupts =3D <GIC_PPI 12 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	soc {
+		compatible =3D "simple-bus";
+		#address-cells =3D <2>;
+		#size-cells =3D <2>;
+		ranges;
+		dma-ranges;
+
+		internal-regs@7f000000 {
+			#address-cells =3D <1>;
+			#size-cells =3D <1>;
+			compatible =3D "simple-bus";
+			/* 16M internal register @ 0x7f00_0000 */
+			ranges =3D <0x0 0x0 0x7f000000 0x1000000>;
+			dma-coherent;
+
+			uart0: serial@12000 {
+				compatible =3D "snps,dw-apb-uart";
+				reg =3D <0x12000 0x100>;
+				reg-shift =3D <2>;
+				interrupts =3D <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
+				reg-io-width =3D <1>;
+				clock-frequency =3D <328000000>;
+				status =3D "okay";
+			};
+
+			mdio: mdio@22004 {
+				#address-cells =3D <1>;
+				#size-cells =3D <0>;
+				compatible =3D "marvell,orion-mdio";
+				reg =3D <0x22004 0x4>;
+				clocks =3D <&core_clock>;
+			};
+
+			i2c0: i2c@11000{
+				compatible =3D "marvell,mv78230-i2c";
+				reg =3D <0x11000 0x20>;
+
+				clocks =3D <&core_clock>;
+				clock-names =3D "core";
+				interrupts =3D <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>;
+				clock-frequency=3D<100000>;
+				status=3D"okay";
+
+				pinctrl-names =3D "default", "gpio";
+				pinctrl-0 =3D <&i2c0_pins>;
+				pinctrl-1 =3D <&i2c0_gpio>;
+				scl_gpio =3D <&gpio0 26 GPIO_ACTIVE_HIGH>;
+				sda_gpio =3D <&gpio0 27 GPIO_ACTIVE_HIGH>;
+			};
+
+			i2c1: i2c@11100{
+				compatible =3D "marvell,mv78230-i2c";
+				reg =3D <0x11100 0x20>;
+
+				clocks =3D <&core_clock>;
+				clock-names =3D "core";
+				interrupts =3D <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>;
+				clock-frequency=3D<100000>;
+				status=3D"okay";
+
+				pinctrl-names =3D "default", "gpio";
+				pinctrl-0 =3D <&i2c1_pins>;
+				pinctrl-1 =3D <&i2c1_gpio>;
+				scl_gpio =3D <&gpio0 20 GPIO_ACTIVE_HIGH>;
+				sda_gpio =3D <&gpio0 21 GPIO_ACTIVE_HIGH>;
+			};
+
+			gpio0: gpio@18100 {
+				compatible =3D "marvell,orion-gpio";
+				reg =3D <0x18100 0x40>;
+				ngpios =3D <32>;
+				gpio-controller;
+				#gpio-cells =3D <2>;
+				gpio-ranges =3D <&pinctrl0 0 0 32>;
+				marvell,pwm-offset =3D <0x1f0>;
+			};
+
+			gpio1: gpio@18140 {
+				reg =3D <0x18140 0x40>;
+				compatible =3D "marvell,orion-gpio";
+				ngpios =3D <14>;
+				gpio-controller;
+				#gpio-cells =3D <2>;
+				gpio-ranges =3D <&pinctrl0 0 32 14>;
+				marvell,pwm-offset =3D <0x1f0>;
+			};
+		};
+
+		/*
+		 * Dedicated section for devices behind 32bit controllers so we
+		 * can configure specific DMA mapping for them
+		 */
+		behind-32bit-controller@7f000000 {
+			compatible =3D "simple-bus";
+			#address-cells =3D <0x2>;
+			#size-cells =3D <0x2>;
+			ranges =3D <0x0 0x0 0x0 0x7f000000 0x0 0x1000000>;
+			/* Host phy ram starts at 0x200M */
+			dma-ranges =3D <0x0 0x0 0x2 0x0 0x1 0x0>;
+			dma-coherent;
+
+			eth0: ethernet@20000 {
+				compatible =3D "marvell,armada-ac5-neta";
+				reg =3D <0x0 0x20000 0x0 0x4000>;
+				interrupts =3D <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
+				clocks =3D <&core_clock>;
+				status =3D "disabled";
+				phy-mode =3D "sgmii";
+			};
+
+			eth1: ethernet@24000 {
+				compatible =3D "marvell,armada-ac5-neta";
+				reg =3D <0x0 0x24000 0x0 0x4000>;
+				interrupts =3D <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>;
+				clocks =3D <&core_clock>;
+				status =3D "disabled";
+				phy-mode =3D "sgmii";
+			};
+
+			/* A dummy entry used for chipidea phy init */
+			usb1phy: usbphy {
+				compatible =3D "usb-nop-xceiv";
+				#phy-cells =3D <0>;
+			};
+
+			/* USB0 is a host USB */
+			usb0: usb@80000 {
+				compatible =3D "marvell,orion-ehci";
+				reg =3D <0x0 0x80000 0x0 0x500>;
+				interrupts =3D <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>;
+				status =3D "okay";
+			};
+
+			/* USB1 is a peripheral USB */
+			usb1: usb@a0000 {
+				reg =3D <0x0 0xa0000 0x0 0x500>;
+				interrupts =3D <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
+				status =3D "okay";
+			};
+		};
+
+		pinctrl0: pinctrl@80020100 {
+			compatible =3D "marvell,ac5-pinctrl";
+			reg =3D <0 0x80020100 0 0x20>;
+
+			i2c0_pins: i2c0-pins {
+				marvell,pins =3D "mpp26", "mpp27";
+				marvell,function =3D "i2c0";
+			};
+
+			i2c0_gpio: i2c0-gpio-pins {
+				marvell,pins =3D "mpp26", "mpp27";
+				marvell,function =3D "gpio";
+			};
+
+			i2c1_pins: i2c1-pins {
+				marvell,pins =3D "mpp20", "mpp21";
+				marvell,function =3D "i2c1";
+			};
+
+			i2c1_gpio: i2c1-gpio-pins {
+				marvell,pins =3D "mpp20", "mpp21";
+				marvell,function =3D "i2c1";
+			};
+		};
+
+		core_clock: core_clock@0 {
+			compatible =3D "fixed-clock";
+			#clock-cells =3D <0>;
+			clock-frequency =3D <400000000>;
+		};
+
+		axi_clock: axi_clock@0 {
+			compatible =3D "fixed-clock";
+			#clock-cells =3D <0>;
+			clock-frequency =3D <325000000>;
+		};
+
+		spi_clock: spi_clock@0 {
+			compatible =3D "fixed-clock";
+			#clock-cells =3D <0>;
+			clock-frequency =3D <200000000>;
+		};
+
+		spi0: spi@805a0000 {
+			compatible =3D "marvell,armada-3700-spi";
+			reg =3D <0x0 0x805a0000 0x0 0x50>;
+			#address-cells =3D <0x1>;
+			#size-cells =3D <0x0>;
+			clocks =3D <&spi_clock>;
+			interrupts =3D <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
+			num-cs =3D <1>;
+			status =3D "disabled";
+		};
+
+		spi@805a8000 {
+			compatible =3D "marvell,armada-3700-spi";
+			reg =3D <0x0 0x805a8000 0x0 0x50>;
+			#address-cells =3D <0x1>;
+			#size-cells =3D <0x0>;
+			clocks =3D <&spi_clock>;
+			interrupts =3D <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
+			num-cs =3D <1>;
+			status =3D "disabled";
+		};
+	};
+
+	gic: interrupt-controller@80600000 {
+		compatible =3D "arm,gic-v3";
+		#interrupt-cells =3D <3>;
+		interrupt-controller;
+		/*#redistributor-regions =3D <1>;*/
+		redistributor-stride =3D <0x0 0x20000>;	// 128kB stride
+		reg =3D <0x0 0x80600000 0x0 0x10000>, /* GICD */
+		      <0x0 0x80660000 0x0 0x40000>; /* GICR */
+		interrupts =3D <GIC_PPI 6 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	cpus {
+		#address-cells =3D <2>;
+		#size-cells =3D <0>;
+
+		cpu-map {
+			cluster0 {
+				core0 {
+					cpu =3D <&CPU0>;
+				};
+				core1 {
+					cpu =3D <&CPU1>;
+				};
+			};
+		};
+
+		CPU0:cpu@0 {
+			device_type =3D "cpu";
+			compatible =3D "arm,armv8";
+			reg =3D <0x0 0x0>;
+			enable-method =3D "psci";
+			next-level-cache =3D <&L2_0>;
+		};
+
+		CPU1:cpu@1 {
+			device_type =3D "cpu";
+			compatible =3D "arm,armv8";
+			reg =3D <0x0 0x100>;
+			enable-method =3D "psci";
+			next-level-cache =3D <&L2_0>;
+		};
+
+		L2_0: l2-cache0 {
+			compatible =3D "cache";
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/marvell/rd-ac5x.dts b/arch/arm64/boot/dt=
s/marvell/rd-ac5x.dts
new file mode 100644
index 000000000000..1290de782f52
--- /dev/null
+++ b/arch/arm64/boot/dts/marvell/rd-ac5x.dts
@@ -0,0 +1,74 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Device Tree For AC5X.
+ *
+ * Copyright (C) 2021 Marvell
+ *
+ */
+/*
+ * Device Tree file for Marvell Alleycat 5X development board
+ * This board file supports the B configuration of the board
+ */
+
+/dts-v1/;
+
+#include "armada-98dx2530.dtsi"
+
+/ {
+	model =3D "Marvell RD-AC5X Board";
+	compatible =3D "marvell,ac5x", "marvell,ac5";
+
+	memory@0 {
+		device_type =3D "memory";
+		reg =3D <0x2 0x00000000 0x0 0x40000000>;
+	};
+};
+
+&mdio {
+	phy0: ethernet-phy@0 {
+		reg =3D <0>;
+	};
+};
+
+&eth0 {
+	status =3D "okay";
+	phy =3D <&phy0>;
+};
+
+&spi0 {
+	status =3D "okay";
+
+	spiflash0: spi-flash@0 {
+		compatible =3D "spi-nor";
+		spi-max-frequency =3D <50000000>;
+		spi-tx-bus-width =3D <1>; /* 1-single, 2-dual, 4-quad */
+		spi-rx-bus-width =3D <1>; /* 1-single, 2-dual, 4-quad */
+		reg =3D <0>;
+
+		#address-cells =3D <1>;
+		#size-cells =3D <1>;
+
+		partition@0 {
+			label =3D "spi_flash_part0";
+			reg =3D <0x0 0x800000>;
+		};
+
+		parition@1 {
+			label =3D "spi_flash_part1";
+			reg =3D <0x800000 0x700000>;
+		};
+
+		parition@2 {
+			label =3D "spi_flash_part2";
+			reg =3D <0xF00000 0x100000>;
+		};
+	};
+};
+
+&usb1 {
+	compatible =3D "chipidea,usb2";
+	phys =3D <&usb1phy>;
+	phy-names =3D "usb-phy";
+	dr_mode =3D "peripheral";
+};
+
--=20
2.35.1

