Return-Path: <linux-gpio+bounces-26629-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 051C4BA43B3
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Sep 2025 16:35:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 101F23A79C6
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Sep 2025 14:35:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48E421E1E1E;
	Fri, 26 Sep 2025 14:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cvLY8jQS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F39CA20F067;
	Fri, 26 Sep 2025 14:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758897211; cv=none; b=upujGR6WjGXvxqVnoG3SecqBz2r9CgtZe5TWc+D1fuJpI5WI1BjlNFnsamk95h06A4nUB1ccdIcxaJ2C57qYSUCEYgXbHC/F83fID/ExbZU/4PDwx3M/rez1mKV2ixBlduhK4vCsHlMTKuOUiqAkZ5022ikDQWdAb2h2woAFmUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758897211; c=relaxed/simple;
	bh=MKaeoxAh1CI3sA7jOxBPksZc2blSaWDWwriebqE3Zoc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JFPzWRcqw6SJlNMOnJsOUupT5BdsoaVkIux0zIgTOsU6gYuH8VXRNicb0MpJi5Tlb5vn29Q0H7pqZHiluFv7/io99aQrLMUej9go2Pv3pDqkA38st48rhtV9tay3iRJJw1duJCR+TUFse9Jl82UIPvwhCBxTiD9TtMjQPFsKK6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cvLY8jQS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4576C4CEF4;
	Fri, 26 Sep 2025 14:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758897209;
	bh=MKaeoxAh1CI3sA7jOxBPksZc2blSaWDWwriebqE3Zoc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cvLY8jQSgfr9cKQjSe7ujETaXlkOewz2I6IUP83GtCnylX45NFlLVZO8OoHIvjUps
	 Cjulinzt2uqgxwk8fkH9pNY6DiqhoLb/S9mRNTBk4Koop99RUaCmVDRuLv+kZj7xAt
	 wCOEhiVQOi7plaHkzBqdjB+vn2baRUoKozqiNElTaBPxTy8NSYNbSVhaqfl+2K+lS0
	 X5dQ/lMG6zVMEHzdkFNjab2M2O1SpmW/larRXZRGthOs6vOjFXBYGsPxtLusTcZ9uG
	 86lZtPeIzXOBVsheXwvTkcVjYfe4XycAtnRKYxsRBoOQxjZAAu78DW/RNPBjg2vDyt
	 qOwsWaDpQ/nSg==
From: Conor Dooley <conor@kernel.org>
To: linus.walleij@linaro.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [RFC 2/5] dt-bindings: pinctrl: add pic64gx "gpio2" pinmux
Date: Fri, 26 Sep 2025 15:33:10 +0100
Message-ID: <20250926-gilled-muppet-6ac08937cea6@spud>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250926-manpower-glacial-e9756c82b427@spud>
References: <20250926-manpower-glacial-e9756c82b427@spud>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3794; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=whSSbDhJyexL6gok/iwOo1IqEtRu9dtNf4oF4w/Mry8=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDBnXlqiI37yb5mf4sOPrD9/JKd8i9O99CfjOIblvg5OQm sFHq4siHaUsDGJcDLJiiiyJt/tapNb/cdnh3PMWZg4rE8gQBi5OAZiI9GZGhq+xfG8W+LV1zH51 4GLqa7OzQdVx5exLbLxaD21L4o4ufMPwz/BHxPGZFly3SqWCXt9ObVjF9NpD9KpIjZb4nu2bEnl NWQA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

The pic64gx has a second pinmux "downstream" of the iomux0 pinmux. The
documentation for the SoC provides no name for this device, but it is
used to swap pins between either GPIO controller #2 or select other
functions, hence the "gpio2" name. Currently there is no documentation
about what each bit actually does that is publicly available, nor (I
believe) what pins are affected. That info is as follows:

pin     role (1/0)
---     ----------
E14	MAC_0_MDC/GPIO_2_0
E15	MAC_0_MDIO/GPIO_2_1
F16	MAC_1_MDC/GPIO_2_2
F17	MAC_1_MDIO/GPIO_2_3
D19	SPI_0_CLK/GPIO_2_4
B18	SPI_0_SS0/GPIO_2_5
B10	CAN_0_RXBUS/GPIO_2_6
C14	PCIE_PERST_2#/GPIO_2_7
E18	PCIE_WAKE#/GPIO_2_8
D18	PCIE_PERST_1#/GPIO_2_9
E19	SPI_0_DO/GPIO_2_10
C7	SPI_0_DI/GPIO_2_11
D6	QSPI_SS0/GPIO_2_12
D7	QSPI_CLK (B)/GPIO_2_13
C9	QSPI_DATA0/GPIO_2_14
C10	QSPI_DATA1/GPIO_2_15
A5	QSPI_DATA2/GPIO_2_16
A6	QSPI_DATA3/GPIO_2_17
D8	MMUART_3_RXD/GPIO_2_18
D9	MMUART_3_TXD/GPIO_2_19
B8	MMUART_4_RXD/GPIO_2_20
A8	MMUART_4_TXD/GPIO_2_21
C12	CAN_1_TXBUS/GPIO_2_22
B12	CAN_1_RXBUS/GPIO_2_23
A11	CAN_0_TX_EBL_N/GPIO_2_24
A10	CAN_1_TX_EBL_N/GPIO_2_25
D11	MMUART_2_RXD/GPIO_2_26
C11	MMUART_2_TXD/GPIO_2_27
B9	CAN_0_TXBUS/GPIO_2_28

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../microchip,pic64gx-pinctrl-gpio2.yaml      | 74 +++++++++++++++++++
 1 file changed, 74 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/microchip,pic64gx-pinctrl-gpio2.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/microchip,pic64gx-pinctrl-gpio2.yaml b/Documentation/devicetree/bindings/pinctrl/microchip,pic64gx-pinctrl-gpio2.yaml
new file mode 100644
index 000000000000..be7d4b1948dc
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/microchip,pic64gx-pinctrl-gpio2.yaml
@@ -0,0 +1,74 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/microchip,pic64gx-pinctrl-gpio2.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip PIC64GX GPIO2 Mux
+
+maintainers:
+  - Conor Dooley <conor.dooley@microchip.com>
+
+description:
+  The "GPIO2 Mux" determines whether GPIO2 or select other functions are
+  available on package pins on PIC64GX. Some of these functions must be
+  mapped to this mux 
+
+properties:
+  compatible:
+     const: microchip,pic64gx-pinctrl-gpio2
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
+          node apply to. The upper 16 bits of the value represent the pin
+          and the lower 16 bits determine which function is routed there.
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
+    #define PIC64GX_PINFUNC(pin, func) (((pin) << 16) | (func))
+
+    soc {
+      pinctrl@f00 {
+      compatible = "microchip,pic64gx-pinctrl-gpio2";
+      reg = <0xf00 0x4>;
+      pinctrl-use-default;
+      pinctrl-names = "default";
+      pinctrl-0 = <&mdio0_gpio2>, <&mdio1_gpio2>, <&spi0_gpio2>, <&qspi_gpio2>,
+            <&mmuart3_gpio2>, <&mmuart4_gpio2>, <&can1_gpio2>, <&can0_gpio2>,
+            <&mmuart2_gpio2>;
+
+        mdio0_gpio: gpio0-gpio-pins {
+          pinmux = <PIC64GX_PINFUNC(0, 0)>, <PIC64GX_PINFUNC(1, 0)>;
+        };
+
+        mdio0_mdio: mdio0-mdio-pins {
+          pinmux = <PIC64GX_PINFUNC(0, 1)>, <PIC64GX_PINFUNC(1, 1)>;
+        };
+      };
+    };
+
+...
-- 
2.47.3


