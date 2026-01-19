Return-Path: <linux-gpio+bounces-30731-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA56D3A644
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Jan 2026 12:07:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 29F5E30D2B12
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Jan 2026 11:04:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 757243590D4;
	Mon, 19 Jan 2026 11:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VM9V7Cc2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20FC13590D9;
	Mon, 19 Jan 2026 11:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768820681; cv=none; b=WhgqSuzHrpoG2zzq8UGbpyODbAz+kv27v1sZ4HMHoElgKWoHAyBPgRq2NrTX1JJpZspi3YZdqPHjX9dihfiDetsxHzhzxPl7/ne7RjeFLPBQilFaTzRKyTiGAFXqy0yE0/9iASvOwyVWTk811cpaSl49YTMWrwul5QG8dCeGcgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768820681; c=relaxed/simple;
	bh=toyAXNFz6xaIFFWi2zSgWiEzUL6wgF3lM+tCCATOsbM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=goUgdngPtQ29M9vuKTXdJZAbkHcPGU4GYjHGFn565d8HWztacmRF4amR56NE4b+1ykuw7M/s3RD3hGG2kA1qkwLQhepOFRdSNfH3CXkIksPr2wSMSO3H4iXnt/jEwORMolmbxf3+jk2CaIivgw4OTvjHejvhc3vty0bjUEGizN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VM9V7Cc2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE18EC116C6;
	Mon, 19 Jan 2026 11:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768820680;
	bh=toyAXNFz6xaIFFWi2zSgWiEzUL6wgF3lM+tCCATOsbM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VM9V7Cc2ic+8GxuiOpg7PjJFb83m/j4u/xBihsvhfT3kNX/bDyLHSLr0smjjJVPP/
	 LvWtoo4dTa1mUOEziLfU6d6ZkuM2aiSQ+x6BZaBxoZF7/i2PVy77PRomUB8VMmPKXk
	 0Ug0KrkJtv/61duZsQKiZ5eNcZYYd9p3lTt16IggN9qqSCEFABtHybzOqlaq7b4RHO
	 NFFqJPVMMi2Q6zFNExPEz+/28Gq6zsVvmFObYGSdnra47u38LTXtFkm1v4UQij8DSk
	 WoWgFJ7zoWktIdEm97ZD62MzgVYSXnQh11D+KKx4R9zezxCjGwiOhTIDUbURIyGqJY
	 WiQ4E9WyIrHuA==
From: Conor Dooley <conor@kernel.org>
To: linusw@kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	Valentina.FernandezAlanis@microchip.com
Subject: [PATCH v3 6/6] riscv: dts: microchip: add pinctrl nodes for mpfs/icicle kit
Date: Mon, 19 Jan 2026 11:03:57 +0000
Message-ID: <20260119-natural-buddy-acb391bcd9f6@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260119-rearrange-germproof-3e3096cc0da4@spud>
References: <20260119-rearrange-germproof-3e3096cc0da4@spud>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7289; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=gOBtwTD+b/gsoU7RSCsE+sv8+8PvQouCiUPisYu2U3g=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJl5/BuLNJsMja7tudguWBax3o/b5sgkuf83PSSE2avjB ecXvJPqKGVhEONikBVTZEm83dcitf6Pyw7nnrcwc1iZQIYwcHEKwERsrRj+KQozzQp6np80SX57 Zn2U3NqXr9O1Nt0+YCu1NsZTcXqVFcMf7mXyd1acOztPa1lFl4a3/Cr2q8JRdbuimHep5mc3WVS wAQA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

Add pinctrl nodes to PolarFire to demonstrate their use, matching the
default configuration set by the HSS firmware for the Icicle kit's
reference design, as a demonstration of use.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../dts/microchip/mpfs-icicle-kit-common.dtsi |   1 -
 .../dts/microchip/mpfs-icicle-kit-fabric.dtsi |  63 +++++++
 .../boot/dts/microchip/mpfs-pinctrl.dtsi      | 167 ++++++++++++++++++
 arch/riscv/boot/dts/microchip/mpfs.dtsi       |  16 ++
 4 files changed, 246 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/boot/dts/microchip/mpfs-pinctrl.dtsi

diff --git a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-common.dtsi b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-common.dtsi
index b3f61c58e57c..5667805b4b14 100644
--- a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-common.dtsi
+++ b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-common.dtsi
@@ -3,7 +3,6 @@
 
 /dts-v1/;
 
-#include "mpfs.dtsi"
 #include "mpfs-icicle-kit-fabric.dtsi"
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/leds/common.h>
diff --git a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi
index 71f724325578..785176dabcf1 100644
--- a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi
+++ b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi
@@ -1,6 +1,9 @@
 // SPDX-License-Identifier: (GPL-2.0 OR MIT)
 /* Copyright (c) 2020-2021 Microchip Technology Inc */
 
+#include "mpfs.dtsi"
+#include "mpfs-pinctrl.dtsi"
+
 / {
 	core_pwm0: pwm@40000000 {
 		compatible = "microchip,corepwm-rtl-v4";
@@ -80,6 +83,16 @@ refclk_ccc: clock-cccref {
 	};
 };
 
+&can0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&can0_fabric>;
+};
+
+&can1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&ikrd_can1_cfg>;
+};
+
 &ccc_nw {
 	clocks = <&refclk_ccc>, <&refclk_ccc>, <&refclk_ccc>, <&refclk_ccc>,
 		 <&refclk_ccc>, <&refclk_ccc>;
@@ -87,3 +100,53 @@ &ccc_nw {
 		      "dll0_ref", "dll1_ref";
 	status = "okay";
 };
+
+&i2c0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c0_fabric>;
+};
+
+&i2c1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c1_fabric>;
+};
+
+&mmuart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart1_fabric>;
+};
+
+&mmuart2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart2_fabric>;
+};
+
+&mmuart3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart3_fabric>;
+};
+
+&mmuart4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart4_fabric>;
+};
+
+&mssio {
+	pinctrl-names = "default";
+	pinctrl-0 = <&spi1_mssio>, <&can1_mssio>, <&mdio0_mssio>, <&mdio1_mssio>;
+};
+
+&qspi {
+	pinctrl-names = "default";
+	pinctrl-0 = <&qspi_fabric>;
+};
+
+&spi0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&spi0_fabric>;
+};
+
+&spi1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&ikrd_spi1_cfg>;
+};
diff --git a/arch/riscv/boot/dts/microchip/mpfs-pinctrl.dtsi b/arch/riscv/boot/dts/microchip/mpfs-pinctrl.dtsi
new file mode 100644
index 000000000000..232d28eb4efd
--- /dev/null
+++ b/arch/riscv/boot/dts/microchip/mpfs-pinctrl.dtsi
@@ -0,0 +1,167 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+&iomux0 {
+	spi0_fabric: mux-spi0-fabric {
+		function = "spi0";
+		groups = "spi0_fabric";
+	};
+
+	spi0_mssio: mux-spi0-mssio {
+		function = "spi0";
+		groups = "spi0_mssio";
+	};
+
+	spi1_fabric: mux-spi1-fabric {
+		function = "spi1";
+		groups = "spi1_fabric";
+	};
+
+	spi1_mssio: mux-spi1-mssio {
+		function = "spi1";
+		groups = "spi1_mssio";
+	};
+
+	i2c0_fabric: mux-i2c0-fabric {
+		function = "i2c0";
+		groups = "i2c0_fabric";
+	};
+
+	i2c0_mssio: mux-i2c0-mssio {
+		function = "i2c0";
+		groups = "i2c0_mssio";
+	};
+
+	i2c1_fabric: mux-i2c1-fabric {
+		function = "i2c1";
+		groups = "i2c1_fabric";
+	};
+
+	i2c1_mssio: mux-i2c1-mssio {
+		function = "i2c1";
+		groups = "i2c1_mssio";
+	};
+
+	can0_fabric: mux-can0-fabric {
+		function = "can0";
+		groups = "can0_fabric";
+	};
+
+	can0_mssio: mux-can0-mssio {
+		function = "can0";
+		groups = "can0_mssio";
+	};
+
+	can1_fabric: mux-can1-fabric {
+		function = "can1";
+		groups = "can1_fabric";
+	};
+
+	can1_mssio: mux-can1-mssio {
+		function = "can1";
+		groups = "can1_mssio";
+	};
+
+	qspi_fabric: mux-qspi-fabric {
+		function = "qspi";
+		groups = "qspi_fabric";
+	};
+
+	qspi_mssio: mux-qspi-mssio {
+		function = "qspi";
+		groups = "qspi_mssio";
+	};
+
+	uart0_fabric: mux-uart0-fabric {
+		function = "uart0";
+		groups = "uart0_fabric";
+	};
+
+	uart0_mssio: mux-uart0-mssio {
+		function = "uart0";
+		groups = "uart0_mssio";
+	};
+
+	uart1_fabric: mux-uart1-fabric {
+		function = "uart1";
+		groups = "uart1_fabric";
+	};
+
+	uart1_mssio: mux-uart1-mssio {
+		function = "uart1";
+		groups = "uart1_mssio";
+	};
+
+	uart2_fabric: mux-uart2-fabric {
+		function = "uart2";
+		groups = "uart2_fabric";
+	};
+
+	uart2_mssio: mux-uart2-mssio {
+		function = "uart2";
+		groups = "uart2_mssio";
+	};
+
+	uart3_fabric: mux-uart3-fabric {
+		function = "uart3";
+		groups = "uart3_fabric";
+	};
+
+	uart3_mssio: mux-uart3-mssio {
+		function = "uart3";
+		groups = "uart3_mssio";
+	};
+
+	uart4_fabric: mux-uart4-fabric {
+		function = "uart4";
+		groups = "uart4_fabric";
+	};
+
+	uart4_mssio: mux-uart4-mssio {
+		function = "uart4";
+		groups = "uart4_mssio";
+	};
+
+	mdio0_fabric: mux-mdio0-fabric {
+		function = "mdio0";
+		groups = "mdio0_fabric";
+	};
+
+	mdio0_mssio: mux-mdio0-mssio {
+		function = "mdio0";
+		groups = "mdio0_mssio";
+	};
+
+	mdio1_fabric: mux-mdio1-fabric {
+		function = "mdio1";
+		groups = "mdio1_fabric";
+	};
+
+	mdio1_mssio: mux-mdio1-mssio {
+		function = "mdio1";
+		groups = "mdio1_mssio";
+	};
+};
+
+&mssio {
+	ikrd_can1_cfg: ikrd-can1-cfg {
+		can1-pins {
+			pins = <34>, <35>, <36>;
+			function = "spi";
+			bias-pull-up;
+			drive-strength = <8>;
+			power-source = <3300000>;
+			microchip,ibufmd = <0x1>;
+		};
+	};
+
+	ikrd_spi1_cfg: ikrd-spi1-cfg {
+		spi1-pins {
+			pins = <30>, <31>, <32>, <33>;
+			function = "spi";
+			bias-pull-up;
+			drive-strength = <8>;
+			power-source = <3300000>;
+			microchip,ibufmd = <0x1>;
+		};
+	};
+};
diff --git a/arch/riscv/boot/dts/microchip/mpfs.dtsi b/arch/riscv/boot/dts/microchip/mpfs.dtsi
index 5c2963e269b8..0fb94581b6cb 100644
--- a/arch/riscv/boot/dts/microchip/mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/mpfs.dtsi
@@ -254,7 +254,23 @@ pdma: dma-controller@3000000 {
 		mss_top_sysreg: syscon@20002000 {
 			compatible = "microchip,mpfs-mss-top-sysreg", "syscon", "simple-mfd";
 			reg = <0x0 0x20002000 0x0 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
 			#reset-cells = <1>;
+
+			iomux0: pinctrl@200 {
+				compatible = "microchip,mpfs-pinctrl-iomux0";
+				reg = <0x200 0x4>;
+				pinctrl-use-default;
+
+			};
+
+			mssio: pinctrl@204 {
+				compatible = "microchip,mpfs-pinctrl-mssio";
+				reg = <0x204 0x7c>;
+				/* on icicle ref design at least */
+				pinctrl-use-default;
+			};
 		};
 
 		sysreg_scb: syscon@20003000 {
-- 
2.51.0


