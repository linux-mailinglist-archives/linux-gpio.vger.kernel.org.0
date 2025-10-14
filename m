Return-Path: <linux-gpio+bounces-27107-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id B3246BDA0ED
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 16:39:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5EF9C355869
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 14:39:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54497301004;
	Tue, 14 Oct 2025 14:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y8pRU42v"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0642E3009F6;
	Tue, 14 Oct 2025 14:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760452594; cv=none; b=DWsra+bzfp/EjZVkGi9LpB2pLAQBt0jECxQJaYFEY/Ed0gTMdUdNNVLedd6ddqeEbt1nRY3AiRsLLbXgxo5K8Qc/0xG57U5BhZCMtvf+3c04uN9W56b5/nENOmfi3UkpMQdYmFiQshX4OUALZMMYRkmoSe94MaJlTJ31LLUi6XE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760452594; c=relaxed/simple;
	bh=Pgc6BBCsBW8XDbmZ8YQIRgh9zAzzQPZv6WP96LVDEYE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e51mCHWjtpnT6jE57u2CMhosmwvkClrjusPt3Lfj+OV3X7DWreCueR/QbRyxK5xRcnEvDo9CgLGpTBBKnsWoZQfNvxurn2S2IBFMfqRFy3gHm15KQFCm5DUwOlM3k/jkuUSOQIN4ZvHO2x7EfQ5QvrHzjARpV66E1ivUglOI4qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y8pRU42v; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2104C116C6;
	Tue, 14 Oct 2025 14:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760452593;
	bh=Pgc6BBCsBW8XDbmZ8YQIRgh9zAzzQPZv6WP96LVDEYE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Y8pRU42vh4TJKlqygyq4RlWIBRh5hBdbLvbj5FBLQOIdNN6ZGeHrmDH1vD8LFBqKm
	 DzwQWii+3jomscaaZeM8JifXeoWzcolbCbSdUi39xtKTysrLmIpFNZ5hFLRlSbj9la
	 zXkSv4XM6Qvck8K3U/pQfXqfkbVfgzaicV0jjfu3LNmPpu6LEEyK2VT9NJxL5u+w4k
	 grd0ZpIbjgnczFYvDO9NOLJ+acVkDfItvzUgN608iWiwCP2BcqY7vak2/FhbUVtWXA
	 jYbja3Me3xM/r2wOb8ZnbaigQjcnwlPafb5RjKIoCaGfY16T3QL2ZIMD0HP0Cix8hA
	 LTAlza9Tlc4UA==
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
Subject: [PATCH v2 1/5] dt-bindings: pinctrl: document pic64gx "gpio2" pinmux
Date: Tue, 14 Oct 2025 15:35:34 +0100
Message-ID: <20251014-stream-zipfile-cd8d6c12b2da@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251014-retype-limit-e6cbe901aa07@spud>
References: <20251014-retype-limit-e6cbe901aa07@spud>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4000; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=qSnLnUgqur9FS7P/2OjboBAMKA41gDk5jloxjVocg0o=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDBnv4s9+DyjZ+IXbWW+xsVOEofOWaVvUkw9dv/Lp6q87c 7ge/lkV2lHKwiDGxSArpsiSeLuvRWr9H5cdzj1vYeawMoEMYeDiFICJ7LJm+Cuoe3rRFAWJl7nz srR/Mp1McfHy9t+amrlm6yXh7dkfG5YzMkw5t/MDLzv7/MkvE2w8nGf6LHohMnPBc77Lqyf5P2b 79YcXAA==
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
 .../microchip,pic64gx-pinctrl-gpio2.yaml      | 73 +++++++++++++++++++
 1 file changed, 73 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/microchip,pic64gx-pinctrl-gpio2.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/microchip,pic64gx-pinctrl-gpio2.yaml b/Documentation/devicetree/bindings/pinctrl/microchip,pic64gx-pinctrl-gpio2.yaml
new file mode 100644
index 000000000000..07d6befb299c
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/microchip,pic64gx-pinctrl-gpio2.yaml
@@ -0,0 +1,73 @@
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
+  mapped to this mux via iomux0 for settings here to have any impact.
+
+properties:
+  compatible:
+    const: microchip,pic64gx-pinctrl-gpio2
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
+        enum: [ mdio0, mdio1, spi0, can0, pcie, qspi, uart3, uart4, can1, uart2, gpio ]
+
+      groups:
+        description:
+          An array of strings. Each string contains the name of a group.
+        items:
+          enum: [ mdio0, mdio1, spi0, can0, pcie, qspi, uart3, uart4, can1, uart2,
+                  gpio_mdio0, gpio_mdio1, gpio_spi0, gpio_can0, gpio_pcie,
+                  gpio_qspi, gpio_uart3, gpio_uart4, gpio_can1, gpio_uart2 ]
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
+    pinctrl@41000000 {
+      compatible = "microchip,pic64gx-pinctrl-gpio2";
+      reg = <0x41000000 0x4>;
+      pinctrl-use-default;
+      pinctrl-names = "default";
+      pinctrl-0 = <&mdio0_gpio2>, <&mdio1_gpio2>, <&spi0_gpio2>, <&qspi_gpio2>,
+                  <&uart3_gpio2>, <&uart4_gpio2>, <&can1_gpio2>, <&can0_gpio2>,
+                  <&uart2_gpio2>;
+
+      mux-gpio2 {
+        function = "gpio";
+        groups = "gpio_mdio1", "gpio_spi0", "gpio_can0", "gpio_pcie",
+                 "gpio_qspi", "gpio_uart3", "gpio_uart4", "gpio_can1";
+      };
+    };
+
+...
-- 
2.51.0


