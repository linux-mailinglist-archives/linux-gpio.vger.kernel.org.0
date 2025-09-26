Return-Path: <linux-gpio+bounces-26628-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C796BA439E
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Sep 2025 16:35:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 32BB34E355B
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Sep 2025 14:35:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F5B31F4192;
	Fri, 26 Sep 2025 14:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iXSlxW7k"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FFEF1DF75C;
	Fri, 26 Sep 2025 14:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758897209; cv=none; b=RFtRX7yFk54CyLDjxH+yAc8gW0jgT82YZc8RjiWiz1fyXDK9Je4Kaw8UECYH8LuLkNvFjwFrM/0RGP8TpxVFtsjY3U2wvS6lUoS+SFQNs6vhrCH3peuSlDLN+6GRpQgzX6JCkSrstUNS1XxxDeT3zMx70S+Tek0Yog0w1QnLyJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758897209; c=relaxed/simple;
	bh=BrLRY240+mmqBOHm/sMgW8G1cM6lFECM17Bu2MS+usE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=efVc3ZASbFz+m17MJJwDOqzmeC4o2SlHhXxUDpxo2V0L66HVjlRzDVtvY/i6tyxP9zwOuCmSpDbgd7KAE9FCTqKENEGimcq5Re+iqNIAyM5/GWihchb3ciqNoq5GwPObZOP1Vv6JkmX+EW/zQoJLV+87NH43zVjj7mNKAkYvbL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iXSlxW7k; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB05CC113D0;
	Fri, 26 Sep 2025 14:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758897207;
	bh=BrLRY240+mmqBOHm/sMgW8G1cM6lFECM17Bu2MS+usE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iXSlxW7kRdi2A1xi1lXCTGA8zaPhnVmJ0WvMwm7y/JG12KTa8Adi225Bob2Gf+4Zb
	 ZLPYb6YziDJ5bQWwdWHrYinHzq5yLitRIumEhYA5QeT4u+dRAaVPoj4y60vH27u35k
	 lSMCtvUh04Pu+157lB4UGr0kGRlwvFK84QDfg5uCfCkeOI9PhAsPcbgIrIOO7nCONZ
	 aN9LsLRL4eg4zohg4VV1V4e1PLiYRiXBrIsBnUCId6Y90X4GbljUyL0TCHcDDxhgK3
	 7exQstAUvwJxhq36F83R2L8XuZEUvk1DzpJyM/Ohqo6dZERtG4kRjJBxuhM6HLAsof
	 CUJK8NcXotqQQ==
From: Conor Dooley <conor@kernel.org>
To: linus.walleij@linaro.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [RFC 1/5] dt-bindings: pinctrl: add polarfire soc iomux0 pinmux
Date: Fri, 26 Sep 2025 15:33:09 +0100
Message-ID: <20250926-polo-jailhouse-aef50bf71c56@spud>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250926-manpower-glacial-e9756c82b427@spud>
References: <20250926-manpower-glacial-e9756c82b427@spud>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4122; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=gAbuGS8OaMl8BEtZC/wqb99I6dMe5gsmkDpWS+Cne4w=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDBnXlqjs0f541NjI8Hz7ydLPk3a5LnVMW9Ks7F8dLb/2W uCP+IblHaUsDGJcDLJiiiyJt/tapNb/cdnh3PMWZg4rE8gQBi5OAZiIyXKGX0zSTXNnBYbHuz3J v1tVsnvTErc4y8OHVNffXMzLeq4iexfDP+USnWnZ191mGHE97JNLZipe9lWp5oHxrKh6zydl80I aGQA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

On Polarfire SoC, iomux0 is responsible for routing functions to either
MSS (multiprocessor subsystem) IOs or to the FPGA fabric, where they
can either interface with custom RTL or be routed to the FPGA fabric's
IOs. Document it.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../microchip,mpfs-pinctrl-iomux0.yaml        | 77 +++++++++++++++++++
 .../microchip,mpfs-mss-top-sysreg.yaml        | 15 ++++
 2 files changed, 92 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/microchip,mpfs-pinctrl-iomux0.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/microchip,mpfs-pinctrl-iomux0.yaml b/Documentation/devicetree/bindings/pinctrl/microchip,mpfs-pinctrl-iomux0.yaml
new file mode 100644
index 000000000000..779348304956
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/microchip,mpfs-pinctrl-iomux0.yaml
@@ -0,0 +1,77 @@
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
+  '-pins$':
+    type: object
+    additionalProperties: false
+
+    allOf:
+      - $ref: pinmux-node.yaml#
+
+    properties:
+      pinmux:
+        description: |
+          The list of GPIOs and their mux settings that properties in the
+          node apply to. The upper 16 bits of the value represent the function
+          and the lower 16 bits where it is routed - 0 is to an MSSIO and 1 to
+          the fabric. Which bit controls which function is described in the
+          register map in section MSS/pfsoc_mss_top_sysreg.htm#IOMUX0_CR.
+
+    required:
+      - pinmux
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #define MPFS_PINFUNC(pin, func) (((pin) << 16) | (func))
+
+    soc {
+      pinctrl@200 {
+        compatible = "microchip,mpfs-pinctrl-iomux0";
+        reg = <0x200 0x4>;
+
+        spi0_mssio: spi0-mssio-pins {
+          pinmux = <MPFS_PINFUNC(0, 0)>;
+        };
+
+        spi0_fabric: spi0-fabric-pins {
+          pinmux = <MPFS_PINFUNC(0, 1)>;
+        };
+      };
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml
index 1ab691db8795..1b737a3fcd33 100644
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
@@ -31,6 +38,14 @@ properties:
       of PolarFire clock/reset IDs.
     const: 1
 
+  pinctrl@200:
+    type: object
+    $ref: /schemas/pinctrl/microchip,mpfs-pinctrl-iomux0.yaml
+
+  pinctrl@204:
+    type: object
+    $ref: /schemas/pinctrl/microchip,mpfs-pinctrl-iomux0.yaml
+
 required:
   - compatible
   - reg
-- 
2.47.3


