Return-Path: <linux-gpio+bounces-27561-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id AD75BC02B1B
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Oct 2025 19:16:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 344C335ADFF
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Oct 2025 17:16:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2523134676C;
	Thu, 23 Oct 2025 17:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oLIJCgou"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B11345CC4;
	Thu, 23 Oct 2025 17:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761239759; cv=none; b=RNxIX5D1zDH4e8Wag0llZpqbBkZfQRiYO/hq+JUA0OpMrOEhe6hLszFXYS0zW/H1Xqktutecmd9CwiymRSc1qy/lZu6/KKobMdZZH6TvqGdZGmCIhg/vSEYbMVveEnMv9o9+H9PV0JXFMTEvic+8nip745ROsHkqpmaAftvnQzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761239759; c=relaxed/simple;
	bh=ttHPVffNl2GANNze4h4Gh+P6qAE5Zl9xo7sVI2L9ZU8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uZknW0X02XvfKC/yCy/T/4RcxMceMS/XObMARbFe0ZCseKeIwVNvdsDulsOE5nXz8vQjBeCU2S9BP9w/6wvSYyygl8tdeNUeH65iC0x40hv0tfHUsnDxEeLgEmXVc/PZwPH49VaQGlZFeoC4MMwfq1f/C5LEwvb2bDfuM3qCGyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oLIJCgou; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93668C113D0;
	Thu, 23 Oct 2025 17:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761239759;
	bh=ttHPVffNl2GANNze4h4Gh+P6qAE5Zl9xo7sVI2L9ZU8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oLIJCgoutxtTs5S4P9dCraInt+omDM17L5u9jztEauvqsIYukkX+NMl5gMtYHItJx
	 NT8BzX31Gv/C72I4gxY0dN2Q85Nsl4m3HybYwj6PqRKbbscwQ7P97BuduAtJbuNwtd
	 m0vEa+XVAjE2NExn0G+pEWp9Tptp+ZUCJaTi4ezqpz2Zph0dlvIEm9x3CqJDaSxQ8g
	 W4re3kboCEfculLS+Oney24ecmJfBV293HHV9CDYBl5v75iGlJ3j+dVlk4/xEiLs+l
	 n3FHGr3El4K1avk3pR56yLbD1cov+TZKpe5bpX9pVIJ+wlD9cMW0aOSAz4AAQtkR9a
	 4MmIv4pH8iukw==
From: Conor Dooley <conor@kernel.org>
To: linus.walleij@linaro.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	Valentina.FernandezAlanis@microchip.com
Subject: [PATCH v4 3/5] dt-bindings: pinctrl: document polarfire soc iomux0 pinmux
Date: Thu, 23 Oct 2025 18:14:59 +0100
Message-ID: <20251023-polka-plunder-1376b734c72c@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251023-stopwatch-cough-47d5497be5aa@spud>
References: <20251023-stopwatch-cough-47d5497be5aa@spud>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4853; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=7d4ab0FAvzd52dMlnhHDv/DB9u7Voznk7u8VEd9E7Uc=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDBm/kiZ2p+0Rmrfx32eWy/PWbOZj7Vm8OOmubrjUdqa3T pF37+390FHKwiDGxSArpsiSeLuvRWr9H5cdzj1vYeawMoEMYeDiFICJ3J/PyHDSyKjoR3R8yr7C 5cdTFvm9m+3y6vBvgw1MOzSCkzYdnXCJkaGx175MtUf+9aWepXcWbbPu6JIV9s25tqzVRDHr+DQ hAXYA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

On Polarfire SoC, iomux0 is responsible for routing functions to either
Multiprocessor Subsystem (MSS) IOs or to the FPGA fabric, where they
can either interface with custom RTL or be routed to the FPGA fabric's
IOs. Document it.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../microchip,mpfs-pinctrl-iomux0.yaml        | 89 +++++++++++++++++++
 .../microchip,mpfs-mss-top-sysreg.yaml        | 13 ++-
 2 files changed, 101 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/microchip,mpfs-pinctrl-iomux0.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/microchip,mpfs-pinctrl-iomux0.yaml b/Documentation/devicetree/bindings/pinctrl/microchip,mpfs-pinctrl-iomux0.yaml
new file mode 100644
index 000000000000..3c98eb35fb82
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/microchip,mpfs-pinctrl-iomux0.yaml
@@ -0,0 +1,89 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/microchip,mpfs-pinctrl-iomux0.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip PolarFire SoC iomux0
+
+maintainers:
+  - Conor Dooley <conor.dooley@microchip.com>
+
+description:
+  iomux0 is responsible for routing some functions to either the FPGA fabric,
+  or to MSSIOs. It only performs muxing, and has no IO configuration role, as
+  fabric IOs are configured separately and just routing a function to MSSIOs is
+  not sufficient for it to actually get mapped to an MSSIO, just makes it
+  possible.
+
+properties:
+  compatible:
+    oneOf:
+      - const: microchip,mpfs-pinctrl-iomux0
+      - items:
+          - const: microchip,pic64gx-pinctrl-iomux0
+          - const: microchip,mpfs-pinctrl-iomux0
+
+  reg:
+    maxItems: 1
+
+  pinctrl-use-default: true
+
+patternProperties:
+  '^mux-':
+    type: object
+    $ref: pinmux-node.yaml
+    additionalProperties: false
+
+    properties:
+      function:
+        description:
+          A string containing the name of the function to mux to the group.
+        enum: [ spi0, spi1, i2c0, i2c1, can0, can1, qspi, uart0, uart1, uart2,
+                uart3, uart4, mdio0, mdio1 ]
+
+      groups:
+        description:
+          An array of strings. Each string contains the name of a group.
+        items:
+          enum: [ spi0_fabric, spi0_mssio, spi1_fabric, spi1_mssio, i2c0_fabric,
+                  i2c0_mssio, i2c1_fabric, i2c1_mssio, can0_fabric, can0_mssio,
+                  can1_fabric, can1_mssio, qspi_fabric, qspi_mssio,
+                  uart0_fabric, uart0_mssio, uart1_fabric, uart1_mssio,
+                  uart2_fabric, uart2_mssio, uart3_fabric, uart3_mssio,
+                  uart4_fabric, uart4_mssio, mdio0_fabric, mdio0_mssio,
+                  mdio1_fabric, mdio1_mssio ]
+
+    required:
+      - function
+      - groups
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    soc {
+      #size-cells = <1>;
+      #address-cells = <1>;
+
+      pinctrl@200 {
+        compatible = "microchip,mpfs-pinctrl-iomux0";
+        reg = <0x200 0x4>;
+
+        mux-spi0-fabric {
+          function = "spi0";
+          groups = "spi0_fabric";
+        };
+
+        mux-spi1-mssio {
+          function = "spi1";
+          groups = "spi1_mssio";
+        };
+      };
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml
index 1ab691db8795..39987f722411 100644
--- a/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml
+++ b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml
@@ -18,10 +18,17 @@ properties:
     items:
       - const: microchip,mpfs-mss-top-sysreg
       - const: syscon
+      - const: simple-mfd
 
   reg:
     maxItems: 1
 
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 1
+
   '#reset-cells':
     description:
       The AHB/AXI peripherals on the PolarFire SoC have reset support, so
@@ -31,6 +38,10 @@ properties:
       of PolarFire clock/reset IDs.
     const: 1
 
+  pinctrl@200:
+    type: object
+    $ref: /schemas/pinctrl/microchip,mpfs-pinctrl-iomux0.yaml
+
 required:
   - compatible
   - reg
@@ -40,7 +51,7 @@ additionalProperties: false
 examples:
   - |
     syscon@20002000 {
-      compatible = "microchip,mpfs-mss-top-sysreg", "syscon";
+      compatible = "microchip,mpfs-mss-top-sysreg", "syscon", "simple-mfd";
       reg = <0x20002000 0x1000>;
       #reset-cells = <1>;
     };
-- 
2.51.0


