Return-Path: <linux-gpio+bounces-30728-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EEEED3A622
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Jan 2026 12:04:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AA63E302DB20
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Jan 2026 11:04:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 262063590CA;
	Mon, 19 Jan 2026 11:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gp4aI2+M"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D76A5500945;
	Mon, 19 Jan 2026 11:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768820673; cv=none; b=cwuek+okq638JgiC7gxmoRcuoEAdcd6N5M1vUJgszMKjZUBxxEBQJYmsr/BbBFSl+6Rwa0vBGD7Eq5Nbdz0TKyww7YTcjthMA3WnSMgyuCHohjSq+oWE5LV9oCGOQcun4xpPht808JjoKAODKFrOw3RldLPVScexmX+R8izoAl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768820673; c=relaxed/simple;
	bh=Aw4O/tAH2CFoL17mTtGgcACPbZ5HoHxw5W7CgBBZw4w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WPLgGjneQ7d58kBbTM5SLheLvYUR2SHf9rBQveXSymsMfWKVfLcsYdp+tbl3NIh3lIiO5LHUvM40JcCp0N+kVVt8cC6mYfzbY38oN4v5jGpzK/orIGkoQH/bQY7JRlhIGPG8aZxvL2PGTp5YHpvvNx+rVLXAkXMBSVPuUmLPu1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gp4aI2+M; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 929A4C19425;
	Mon, 19 Jan 2026 11:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768820673;
	bh=Aw4O/tAH2CFoL17mTtGgcACPbZ5HoHxw5W7CgBBZw4w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gp4aI2+MnjEjqC7veAjVt1XEJSWEtE5ZiHotJM6zopQfgsnmkFZ7r8x/yp1Dzz2ls
	 ch2nBPlzo3pQqIwbdOWEb4qEZ2bcWa1Mj68+cddLckv9uKktY1x9uMqTpHGFoDVWJR
	 OVJRII3yt8bfxuG+DLIUSCn0Wo/LWqfDBPfNUKWsLev/h91donmodezK5UO80DXIex
	 qE6ynsE6TWPS0VrQOtRw8fXsOhtej9T35K+SUsTFqJ2DIxa/1bSUXKpe4RqLCtUycY
	 zw9z/Ru/INbEsfwGdPee0vyjkv0VD+4lvGvZsT4sb4pYQMFhI0RfeOkxpva9ngHtSt
	 VOktaKuJIFrZQ==
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
Subject: [PATCH v3 3/6] dt-bindings: pinctrl: document polarfire soc mssio pin controller
Date: Mon, 19 Jan 2026 11:03:54 +0000
Message-ID: <20260119-selector-motto-506568614489@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260119-rearrange-germproof-3e3096cc0da4@spud>
References: <20260119-rearrange-germproof-3e3096cc0da4@spud>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5136; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=4O8W1Kk5A/8Bu7EPK38qeO65/dXnbeqNTeICHehav8g=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJl5/Bvir+38yNlYxNC7ZdGbzgbfYB6TBR8eCp6zmuFwQ Mwha8/ejlIWBjEuBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAEwk+hvDf78rBfnyijZH5m3+ qdz0sstQcHfvTyYd1Wn3gp3919va2TEyNNt0f3o71Vb75BSW6pXKASuTPv+8uyHU92Gd4zYvrbk nOQA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

On Polarfire SoC, the Bank 2 and Bank 4 IOs connected to the
Multiprocessor Subsystem (MSS) are controlled by IOMUX_CRs 1 through 6,
which determine what function in routed to them, and
MSSIO_BANK#_IO_CFG_CRs, which determine the configuration of each pin.

Document it, including several custom configuration options that stem
from MSS Configurator options (the MSS Configurator is part of the FPGA
tooling for this device). "ibufmd" unfortunately is not a 1:1 mapping
with an MSS Configurator option, unlike clamp-diode or lockdown, and I
do not know the effect of any bits in the field. I have no been able to
find an explanation for these bits in documentation.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../pinctrl/microchip,mpfs-pinctrl-mssio.yaml | 109 ++++++++++++++++++
 .../microchip,mpfs-mss-top-sysreg.yaml        |   4 +
 2 files changed, 113 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/microchip,mpfs-pinctrl-mssio.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/microchip,mpfs-pinctrl-mssio.yaml b/Documentation/devicetree/bindings/pinctrl/microchip,mpfs-pinctrl-mssio.yaml
new file mode 100644
index 000000000000..fe05196160f4
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/microchip,mpfs-pinctrl-mssio.yaml
@@ -0,0 +1,109 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/microchip,mpfs-pinctrl-mssio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip Polarfire SoC MSSIO pinctrl
+
+maintainers:
+  - Conor Dooley <conor.dooley@microchip.com>
+
+properties:
+  compatible:
+    oneOf:
+      - const: microchip,mpfs-pinctrl-mssio
+      - items:
+          - const: microchip,pic64gx-pinctrl-mssio
+          - const: microchip,mpfs-pinctrl-mssio
+
+  reg:
+    maxItems: 1
+
+  pinctrl-use-default: true
+
+patternProperties:
+  '-cfg$':
+    type: object
+    additionalProperties: false
+
+    patternProperties:
+      '-pins$':
+        type: object
+        additionalProperties: false
+
+        allOf:
+          - $ref: pincfg-node.yaml#
+          - $ref: pinmux-node.yaml#
+
+        properties:
+          pins:
+            description:
+              The list of IOs that properties in the pincfg node apply to.
+
+          function:
+            description:
+              A string containing the name of the function to mux for these
+              pins. The "reserved" function tristates a pin.
+            enum: [ sd, emmc, qspi, spi, usb, uart, i2c, can, mdio, misc
+                    reserved, gpio, fabric-test, tied-low, tied-high, tristate ]
+
+          bias-bus-hold: true
+          bias-disable: true
+          bias-pull-down: true
+          bias-pull-up: true
+          input-schmitt-enable: true
+          low-power-enable: true
+
+          drive-strength:
+            enum: [ 2, 4, 6, 8, 10, 12, 16, 20 ]
+
+          power-source:
+            description:
+              Which bank voltage to use. This cannot differ for pins in a
+              given bank, the whole bank uses the same voltage.
+            enum: [ 1200000, 1500000, 1800000, 2500000, 3300000 ]
+
+          microchip,clamp-diode:
+            $ref: /schemas/types.yaml#/definitions/flag
+            description:
+              Reflects the "Clamp Diode" setting in the MSS Configurator for
+              this pin. This setting controls whether or not input voltage
+              clamping should be enabled.
+
+          microchip,ibufmd:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            default: 0
+            description:
+              Reflects the "IBUFMD" bits in the MSS Configurator output files
+              for this pin.
+
+        required:
+          - pins
+          - function
+          - power-source
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    pinctrl@204 {
+      compatible = "microchip,mpfs-pinctrl-mssio";
+      reg = <0x204 0x7c>;
+
+      ikrd-spi1-cfg {
+        spi1-pins {
+          pins = <30>, <31>, <32>, <33>;
+          function = "spi";
+          bias-pull-up;
+          drive-strength = <8>;
+          power-source = <3300000>;
+          microchip,ibufmd = <0x1>;
+        };
+      };
+    };
+...
diff --git a/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml
index 39987f722411..44e4a50c3155 100644
--- a/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml
+++ b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml
@@ -42,6 +42,10 @@ properties:
     type: object
     $ref: /schemas/pinctrl/microchip,mpfs-pinctrl-iomux0.yaml
 
+  pinctrl@204:
+    type: object
+    $ref: /schemas/pinctrl/microchip,mpfs-pinctrl-mssio.yaml
+
 required:
   - compatible
   - reg
-- 
2.51.0


