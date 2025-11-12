Return-Path: <linux-gpio+bounces-28403-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 991FAC52C75
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Nov 2025 15:44:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B91C14FBE8F
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Nov 2025 14:34:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14BA233858E;
	Wed, 12 Nov 2025 14:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SK3m/hf+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE996330B33;
	Wed, 12 Nov 2025 14:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762958014; cv=none; b=iA47gTZwww7e+KxbYc4Gkq7Pz2QgRy8EUNwd6QYPHJMVrBq8mAXwXx773eeQACA1CaMLzPFT4G1i4f39L93bX5IgC3nwuFpuhwFkKaNIwgEgMZXvzefYbDbogkZW1RBW54cNKutlDPbg8jLoynPh69nA4xj6RSa3IlAQwCUvP24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762958014; c=relaxed/simple;
	bh=zhH7akUfM6H1jjyVJ86y5rQ+7rbYZJfndGQJBahHkAw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ckjac7Y+kA8hybn5h6LYEYGXFejQ4k3NIMA7ZPsH3qgsW2qGtRlqX6Zx8xkYZC1eUKcCx9S9El1SYbZanOZfHSRo1i/iB2vEgcroOr38JgjtnD01M2FaJgJ6uY06haEsx5pK2ztPfHtR5MVGQZ8lVisnjvheZQTka9/aGtNAOGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SK3m/hf+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DFC5C19423;
	Wed, 12 Nov 2025 14:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762958014;
	bh=zhH7akUfM6H1jjyVJ86y5rQ+7rbYZJfndGQJBahHkAw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SK3m/hf+z6gAd99lb93I4YHdsts1OVSvpSEnnu0d5eXMAfhXg1pzznQSYU5knDeUE
	 Cv6AEEvfLJ0DeZvW067dEA98QuFJdrTQ8stSU3k2H84Bonxt4n0NbTZdU3ai7HFQFf
	 AAg/fgH7T0rffoGMSB/84iXmLiqrbxexvqy2WspNnkGCOKGREJLWtE1NeCCIJi7/AM
	 OZPvX92qvd+AoMWwGgotPlWLwXebjE22vgG27sUg0OsmJHzkvFgKBjnFHt2TX7lBeU
	 OEpDzrnJqlRjgDBjlj+cyED/rjbg/v7JyMRAA7LKDEvvTTjwOsUyR6j3CDuRnHTRJL
	 k98LsArg2SwiA==
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
Subject: [RFC v1 1/4] dt-bindings: pinctrl: document polarfire soc mssio pin controller
Date: Wed, 12 Nov 2025 14:31:12 +0000
Message-ID: <20251112-reappear-margarita-83b9d6c04dd6@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251112-lantern-sappy-bea86ff2a7f4@spud>
References: <20251112-lantern-sappy-bea86ff2a7f4@spud>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4998; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=iNHIWtPBx0P22Oi9qXWzp6kiNAvlDd7zPsi/JxAH/S8=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJkis0zrDuQVn5v57baYxwyzTWoWvByfap4VRZkpR54sK 5eUzivtKGVhEONikBVTZEm83dcitf6Pyw7nnrcwc1iZQIYwcHEKwEReXmdkONSrYrc2ZN2cDnvV lHzDv6cWhUp+amKdGbRhT5asfaexC8P/+tO9Z0Ssly0KfdmwdL7tksITM1cqTv7J8K671uyEygQ LFgA=
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
 .../pinctrl/microchip,mpfs-pinctrl-mssio.yaml | 108 ++++++++++++++++++
 .../microchip,mpfs-mss-top-sysreg.yaml        |   4 +
 2 files changed, 112 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/microchip,mpfs-pinctrl-mssio.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/microchip,mpfs-pinctrl-mssio.yaml b/Documentation/devicetree/bindings/pinctrl/microchip,mpfs-pinctrl-mssio.yaml
new file mode 100644
index 000000000000..32d7a31d669f
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/microchip,mpfs-pinctrl-mssio.yaml
@@ -0,0 +1,108 @@
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
+    const: microchip,mpfs-pinctrl-mssio
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
+            description: |
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
+          microchip,clamp-diode:
+            $ref: /schemas/types.yaml#/definitions/flag
+            description: |
+              Reflects the "Clamp Diode" setting in the MSS Configurator for
+              this pin.
+
+          microchip,bank-lockdown:
+            $ref: /schemas/types.yaml#/definitions/flag
+            description: |
+              Reflects the "Lock Down Bank{2,4} I/Os" setting in the MSS
+              Configurator for this pin.
+
+          microchip,ibufmd:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            default: 0
+            description: |
+              Reflects the "IBUFMD" bits in the MSS Configurator output files
+              for this pin.
+
+        required:
+          - pins
+          - function
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
+      irkd_sd_cfg: irkd-sd-cfg {
+        sd-10ma-pins {
+          pins = <0>, <1>, <2>, <3>, <4>, <5>, <8>, <9>, <10>, <11>, <12>, <13>;
+          function = "sd";
+          bias-pull-up;
+          drive-strength = <10>;
+        };
+
+        sd-8ma-pins {
+          pins = <6>, <7>;
+          function = "sd";
+          bias-pull-up;
+          drive-strength = <8>;
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


