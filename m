Return-Path: <linux-gpio+bounces-29129-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30308C8DDD6
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Nov 2025 11:58:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DDE5A3ACF5A
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Nov 2025 10:58:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C540532BF4B;
	Thu, 27 Nov 2025 10:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="huqA8t04"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C78332BF25;
	Thu, 27 Nov 2025 10:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764241090; cv=none; b=PH3tzN0tbpCkv28eVbZTuaO8s3r/3irm+CXqcP3niTKliAqj1ZUaWYQVpCYKXINa8+SNqRFT5nQOtEMzHx1trCMI1CWXdYjUJeOa5W9ikylvweB0c3UNovNDvyEupanHAka89a4iZhqfzJCaafWz2rfVUnRtYY4iFFS/+Ph1s3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764241090; c=relaxed/simple;
	bh=QntMC1Plc0uiKYuyMpfdHsJb3H/MQs4/CJxQ+Tdrig4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QeSDY80kXu803wFDzEePLyxqDwcEcvyog4qazET28e9zHtG7wwDExmsCwJ09hfotb5rzMAKlTHe6y+Svd0jaqZ5rC9mlcHY5AeVzffBtTnThLiXrsOcuYdqzAdf3u7SAcXkSAt/IK7emlQvRBfQ53cQAxuKtKi9TnhNfYr67dwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=huqA8t04; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FC05C116B1;
	Thu, 27 Nov 2025 10:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764241090;
	bh=QntMC1Plc0uiKYuyMpfdHsJb3H/MQs4/CJxQ+Tdrig4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=huqA8t04NiiAojA+QzdDPv+7c2unnncBLeqcK4ay/q56/PGBdM3BLZhagfzbwmKs4
	 dbEbWy2Igy1JG/UOhUFZeNSx/jj5fKTGtYpXhjE5zztrRNKqOsv56d1jdm/4P5G40g
	 iShQV+MCgArHs/RLiJtBzY6+trNP+kR/aQL+ZE8ZHqIfQkWa8kFtjfr8X08gKH9FYb
	 yudLmM0Ju4ycP1wKR0rP+Gp4E3MTGkeBOWC+MfrmS9N3cPCa+/+XyWPRexdS1AzUcM
	 +L4anzp34oXlIsAKeSeFEdfK8PjlSvlsI4Hg5NNWWrGTF8ZEmzN4AiniL2U3bqD55e
	 lVEZAJsN6OYdw==
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
Subject: [RFC v2 1/5] dt-bindings: pinctrl: document polarfire soc mssio pin controller
Date: Thu, 27 Nov 2025 10:57:57 +0000
Message-ID: <20251127-spousal-bless-199b36f89c80@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251127-bogged-gauze-74aed9fdac0e@spud>
References: <20251127-bogged-gauze-74aed9fdac0e@spud>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5443; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=E1nwd3XqkqEieXaLBbYG6rMb6tjKHWffqqDnAyioFbw=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJkaeluq/kl6+JfmP9seMkeW10j+lPmcuNP8M+LVeg66/ hJeuKO2o5SFQYyLQVZMkSXxdl+L1Po/Ljuce97CzGFlAhnCwMUpABPhEGH4Z7GTb7u7UEMIczpj 3JwG5Y9LKhrvPTwRo+rfW5vyMSD9IMP/JP+A9dGnF904/T7uW1JDKgvj557dWYVN+roPHzyxlYx mBwA=
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
 .../pinctrl/microchip,mpfs-pinctrl-mssio.yaml | 119 ++++++++++++++++++
 .../microchip,mpfs-mss-top-sysreg.yaml        |   4 +
 2 files changed, 123 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/microchip,mpfs-pinctrl-mssio.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/microchip,mpfs-pinctrl-mssio.yaml b/Documentation/devicetree/bindings/pinctrl/microchip,mpfs-pinctrl-mssio.yaml
new file mode 100644
index 000000000000..c8e509ba2f51
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/microchip,mpfs-pinctrl-mssio.yaml
@@ -0,0 +1,119 @@
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
+          microchip,bank-voltage-microvolt:
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
+          - microchip,bank-voltage-microvolt
+
+        if:
+          properties:
+            microchip,bank-voltage-microvolt:
+              contains:
+                enum: [ 1200000, 1500000, 1800000 ]
+        then:
+          required:
+            - input-schmitt-enable
+
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
+          microchip,bank-voltage-microvolt = <3300000>;
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


