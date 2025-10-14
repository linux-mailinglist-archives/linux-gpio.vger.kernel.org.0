Return-Path: <linux-gpio+bounces-27109-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id D33F4BDA105
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 16:39:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5789C354E98
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 14:39:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD950301482;
	Tue, 14 Oct 2025 14:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L1xRW4nT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A292FE07E;
	Tue, 14 Oct 2025 14:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760452598; cv=none; b=XWFkxRs7DGJtqfBzpwjH6XHoE1irhLzjgSkalivhDCku1tBGJbKFtEtOskfHsPYhzy579wUAtocsjmXu4cipq3DmHtBVM/paGjP0RF/l7L91Z0+RcK2UVh/QBpYBR80cqmdLEAHRSMR0KDmlltpmenejhd4xh9jqEL1/6pZs0Ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760452598; c=relaxed/simple;
	bh=+VfmoY4o0Igi3qnQwAAWFr+iU1sBQSfgIaPUV+gsUTQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c2RZZ6sM6HXeaJ2JY3mrfHnFmtphk9OZe1ChovVWbMBvduohUYk/9CfWmAzIwQCuYOaJ3yTeH0EckYGJlmWAKq1Rfkb3RE0w6U3/Zf+dCCV4+ou2Pr/Gb3tLfRQhHSNegdkQkWC+z8Nqwbigg3gSl4Bv6X7C+Pr5QSJxuDLf8iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L1xRW4nT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3381CC116C6;
	Tue, 14 Oct 2025 14:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760452598;
	bh=+VfmoY4o0Igi3qnQwAAWFr+iU1sBQSfgIaPUV+gsUTQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=L1xRW4nTtH8wLSueESBBMa2mHxBJIWmp/TZKr8dJp/9IB2N4g19+igfdtu4ZjeEg3
	 jWukgT9p/nH5OmIOStTuqaAkG0CfuPtfF0NsEF2nmv8XsyqjnZfpOhumj0M7rq05IG
	 SUS/un85uZf3Km6K84qjiC3CZ2GZyirWIxCEKVFpLTHqz1dh2+1D0wZ6xBzd9155P5
	 vJmFbsRhU1cVWeC1MRjl723gGQOlAqUyI2B4RJlsD8FboY8OVtnrmMGFcgMA0+AR5B
	 NOmvsfQJorF4ruCP2b2UyColP4i2LavtncT+x8oaE4Bmzhqz+IsMTUFDXdQNhIbkaJ
	 66ijl/mLVHnUQ==
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
Subject: [PATCH v2 3/5] dt-bindings: pinctrl: document polarfire soc iomux0 pinmux
Date: Tue, 14 Oct 2025 15:35:36 +0100
Message-ID: <20251014-ravioli-ramrod-84b478186bb7@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251014-retype-limit-e6cbe901aa07@spud>
References: <20251014-retype-limit-e6cbe901aa07@spud>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4774; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=5sn1YstE+H7UqUTB9GFUwVJdl/TH6yEqpFLyqPJF4eU=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDBnv4s998JBZ63hlw6Fnez/vfRRnuGtfRVXZGs0P7xc+f O37/8fd1o5SFgYxLgZZMUWWxNt9LVLr/7jscO55CzOHlQlkCAMXpwBMxEmHkWHdNKO6gy7fHjd8 V1yQMpP1LIPHu/MCbwUsv9w8qKbZ/j2CkeGKYllS6hb/KZ3a6r3suxwdf12YUVWeN/sgf0TOM3s rAyYA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

On Polarfire SoC, iomux0 is responsible for routing functions to either
Multiprocessor Subsystem (MSS) IOs or to the FPGA fabric, where they
can either interface with custom RTL or be routed to the FPGA fabric's
IOs. Document it.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../microchip,mpfs-pinctrl-iomux0.yaml        | 88 +++++++++++++++++++
 .../microchip,mpfs-mss-top-sysreg.yaml        | 13 ++-
 2 files changed, 100 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/microchip,mpfs-pinctrl-iomux0.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/microchip,mpfs-pinctrl-iomux0.yaml b/Documentation/devicetree/bindings/pinctrl/microchip,mpfs-pinctrl-iomux0.yaml
new file mode 100644
index 000000000000..2b718de83a83
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/microchip,mpfs-pinctrl-iomux0.yaml
@@ -0,0 +1,88 @@
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


