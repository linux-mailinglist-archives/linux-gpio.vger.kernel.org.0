Return-Path: <linux-gpio+bounces-26632-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 089A5BA43C0
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Sep 2025 16:36:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AF5245630F3
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Sep 2025 14:36:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88021221F03;
	Fri, 26 Sep 2025 14:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dpOsrrVj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F4641E5710;
	Fri, 26 Sep 2025 14:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758897216; cv=none; b=IseGPLmk2dmzdNV2E+8fykvFo4OwZH6+Ijgpb8P03L8n8uZjMDOwty/HzxE3DKiSFBXYxaaTpRi/H9IPUQGwFfYNb96UMh0k3Gb4JdCjFZqCepy3Wc/idkVlCBlvB+u90RTvKtgv6GrJY4m0sssvfikUCGGU2uz1njRVJFxxhYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758897216; c=relaxed/simple;
	bh=QIhdLhWroE0KrBzK06zF9iZfWdc0NXhltR+LoAqz2Sc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oPK8pVumDbA9IeA+ZxIY08QH2KkFn8vzB/61eWrXuwmDLHlx6apfI+LH+iOJBp6uukEHLTVMpcMlhGnlRk//QksjhhutSgAeNmznEB/ZTAUwHWgRRfFnAXF+Q3EIG4e+JdmFkt1jLzhr9pdCMC8OAWkvVbLpKw2kVdIfX6VTcgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dpOsrrVj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EC25C116C6;
	Fri, 26 Sep 2025 14:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758897215;
	bh=QIhdLhWroE0KrBzK06zF9iZfWdc0NXhltR+LoAqz2Sc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dpOsrrVjL64Hj830iLNUO171D5ZXYF+i+78OhvNwtvZnH+9Qelsrp15G9NMBnrQaJ
	 PhGmnPN2WEriuqYaTn87TFpCiXlQ9n7sN4u/6Gnj4dZH9OXAi3Rxzv55TGVIQyHc4x
	 5ix6xaG16qHOCjQTGHK++WgQIeCZPJwzE4pOEpgntVvEn2vmx+X0wg/d8ozj0oxkeC
	 N/1x22eDvV+KA4f3llyknux413T0bXnhAHStvyN6bIzdjedNnwiT9aC5e23PLAPb2W
	 uG7Iblnd8SwtHAREr/cllpfkuLxhA1NKhAR8SvIbIn8CyIpdDVaJE5GpRhhz6mahw/
	 /KNhmG5TOfBlg==
From: Conor Dooley <conor@kernel.org>
To: linus.walleij@linaro.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [RFC 5/5] riscv: dts: microchip: add pinctrl nodes for iomux0
Date: Fri, 26 Sep 2025 15:33:13 +0100
Message-ID: <20250926-manhandle-elliptic-fe3693bae638@spud>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250926-manpower-glacial-e9756c82b427@spud>
References: <20250926-manpower-glacial-e9756c82b427@spud>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6241; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=OjPtl0hrmmQCBu1p1jeqReHlGPIYs4iZyh4c+2jtfkI=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDBnXlqjOYuORnPvSmW9XyilN2d5Mtn0rNHtcl0tU6yy4+ yLn2MwrHaUsDGJcDLJiiiyJt/tapNb/cdnh3PMWZg4rE8gQBi5OAZjI+WBGhpklZ7Oi7k1fbDDB 593Zpo+3s344XGpVWLQz792XZOX9iwUY/hcmzQq37pGzrhB4LTOxcssX/6yDqyV2B8Y6eUoJ3r4 RywcA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
This is in RFC state, the commented out perpiherals use a child to
iomux0, and the patch ultimately adding the pinctrl dts nodes will add
both iomux0 and its child. Please ignore them for now. That's also the
reason for no commit message yet, since the final thing will be
different.
---
 .../dts/microchip/mpfs-icicle-kit-fabric.dtsi |  56 +++++++++
 .../boot/dts/microchip/mpfs-icicle-kit.dts    |   1 -
 .../boot/dts/microchip/mpfs-pinctrl.dtsi      | 117 ++++++++++++++++++
 arch/riscv/boot/dts/microchip/mpfs.dtsi       |   9 ++
 4 files changed, 182 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/boot/dts/microchip/mpfs-pinctrl.dtsi

diff --git a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi
index a6dda55a2d1d..4cf8fd1dd24d 100644
--- a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi
+++ b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi
@@ -1,6 +1,9 @@
 // SPDX-License-Identifier: (GPL-2.0 OR MIT)
 /* Copyright (c) 2020-2021 Microchip Technology Inc */
 
+#include "mpfs.dtsi"
+#include "mpfs-pinctrl.dtsi"
+
 / {
 	compatible = "microchip,mpfs-icicle-reference-rtlv2210", "microchip,mpfs-icicle-kit",
 		     "microchip,mpfs";
@@ -63,6 +66,15 @@ refclk_ccc: cccrefclk {
 	};
 };
 
+&can0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&can0_fabric>;
+};
+
+&can1 {
+//	pinctrl-names = "default";
+};
+
 &ccc_nw {
 	clocks = <&refclk_ccc>, <&refclk_ccc>, <&refclk_ccc>, <&refclk_ccc>,
 		 <&refclk_ccc>, <&refclk_ccc>;
@@ -70,3 +82,47 @@ &ccc_nw {
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
+	pinctrl-0 = <&mmuart1_fabric>;
+};
+
+&mmuart2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&mmuart2_fabric>;
+};
+
+&mmuart3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&mmuart3_fabric>;
+};
+
+&mmuart4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&mmuart4_fabric>;
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
+//	pinctrl-names = "default";
+};
diff --git a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts
index f80df225f72b..3c4d5f576e86 100644
--- a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts
+++ b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts
@@ -3,7 +3,6 @@
 
 /dts-v1/;
 
-#include "mpfs.dtsi"
 #include "mpfs-icicle-kit-fabric.dtsi"
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/leds/common.h>
diff --git a/arch/riscv/boot/dts/microchip/mpfs-pinctrl.dtsi b/arch/riscv/boot/dts/microchip/mpfs-pinctrl.dtsi
new file mode 100644
index 000000000000..1e4d55bd786f
--- /dev/null
+++ b/arch/riscv/boot/dts/microchip/mpfs-pinctrl.dtsi
@@ -0,0 +1,117 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+#define MPFS_PINFUNC(pin, func) (((pin) << 16) | (func))
+
+&iomux0 {
+	spi0_mssio: spi0-mssio-pins {
+		pinmux = <MPFS_PINFUNC(0, 0)>;
+	};
+
+	spi0_fabric: spi0-fabric-pins {
+		pinmux = <MPFS_PINFUNC(0, 1)>;
+	};
+
+	spi1_mssio: spi1-mssio-pins {
+		pinmux = <MPFS_PINFUNC(1, 0)>;
+	};
+
+	spi1_fabric: spi1-fabric-pins {
+		pinmux = <MPFS_PINFUNC(1, 1)>;
+	};
+
+	i2c0_mssio: i2c0-mssio-pins {
+		pinmux = <MPFS_PINFUNC(2, 0)>;
+	};
+
+	i2c0_fabric: i2c0-fabric-pins {
+		pinmux = <MPFS_PINFUNC(2, 1)>;
+	};
+
+	i2c1_mssio: i2c1-mssio-pins {
+		pinmux = <MPFS_PINFUNC(3, 0)>;
+	};
+
+	i2c1_fabric: i2c1-fabric-pins {
+		pinmux = <MPFS_PINFUNC(3, 1)>;
+	};
+
+	can0_mssio: can0-mssio-pins {
+		pinmux = <MPFS_PINFUNC(4, 0)>;
+	};
+
+	can0_fabric: can0-fabric-pins {
+		pinmux = <MPFS_PINFUNC(4, 1)>;
+	};
+
+	can1_mssio: can1-mssio-pins {
+		pinmux = <MPFS_PINFUNC(5, 0)>;
+	};
+
+	can1_fabric: can1-fabric-pins {
+		pinmux = <MPFS_PINFUNC(5, 1)>;
+	};
+
+	qspi_mssio: qspi-mssio-pins {
+		pinmux = <MPFS_PINFUNC(6, 0)>;
+	};
+
+	qspi_fabric: qspi-fabric-pins {
+		pinmux = <MPFS_PINFUNC(6, 1)>;
+	};
+
+	mmuart0_mssio: mmuart0-mssio-pins {
+		pinmux = <MPFS_PINFUNC(7, 0)>;
+	};
+
+	mmuart0_fabric: mmuart0-fabric-pins {
+		pinmux = <MPFS_PINFUNC(7, 1)>;
+	};
+
+	mmuart1_mssio: mmuart1-mssio-pins {
+		pinmux = <MPFS_PINFUNC(8, 0)>;
+	};
+
+	mmuart1_fabric: mmuart1-fabric-pins {
+		pinmux = <MPFS_PINFUNC(8, 1)>;
+	};
+
+	mmuart2_mssio: mmuart2-mssio-pins {
+		pinmux = <MPFS_PINFUNC(9, 0)>;
+	};
+
+	mmuart2_fabric: mmuart2-fabric-pins {
+		pinmux = <MPFS_PINFUNC(9, 1)>;
+	};
+
+	mmuart3_mssio: mmuart3-mssio-pins {
+		pinmux = <MPFS_PINFUNC(10, 0)>;
+	};
+
+	mmuart3_fabric: mmuart3-fabric-pins {
+		pinmux = <MPFS_PINFUNC(10, 1)>;
+	};
+
+	mmuart4_mssio: mmuart4-mssio-pins {
+		pinmux = <MPFS_PINFUNC(11, 0)>;
+	};
+
+	mmuart4_fabric: mmuart4-fabric-pins {
+		pinmux = <MPFS_PINFUNC(11, 1)>;
+	};
+
+	mdio0_mssio: mdio0-mssio-pins {
+		pinmux = <MPFS_PINFUNC(12, 0)>;
+	};
+
+	mdio0_fabric: mdio0-fabric-pins {
+		pinmux = <MPFS_PINFUNC(12, 1)>;
+	};
+
+	mdio1_mssio: mdio1-mssio-pins {
+		pinmux = <MPFS_PINFUNC(13, 0)>;
+	};
+
+	mdio1_fabric: mdio1-fabric-pins {
+		pinmux = <MPFS_PINFUNC(13, 1)>;
+	};
+};
diff --git a/arch/riscv/boot/dts/microchip/mpfs.dtsi b/arch/riscv/boot/dts/microchip/mpfs.dtsi
index 5c2963e269b8..0a0cfd3d3054 100644
--- a/arch/riscv/boot/dts/microchip/mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/mpfs.dtsi
@@ -254,7 +254,16 @@ pdma: dma-controller@3000000 {
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
 		};
 
 		sysreg_scb: syscon@20003000 {
-- 
2.47.3


