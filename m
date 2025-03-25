Return-Path: <linux-gpio+bounces-17965-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C8EA7036E
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Mar 2025 15:19:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F4157189978A
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Mar 2025 14:14:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC35425A349;
	Tue, 25 Mar 2025 14:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="rZIbUwSY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0CC2259CAD
	for <linux-gpio@vger.kernel.org>; Tue, 25 Mar 2025 14:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742912010; cv=none; b=SiSqheLGytCnfGj4dPLZsjqTpNS6gUSlb8CFEd/IohIabJ/5kMjs1B2yq0kpWzUuNnyQwpsiWc0KJ29KdI4QDki8+kaQ97TPPLYzKKgRvIMUI1Nh0n/QSwaKabyzi+U7/ZRjd3EFLJY6Z5+2c5oqWjDh/AMKxDgXUZzeVqTiHP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742912010; c=relaxed/simple;
	bh=3yXpnSWDBQq0p64UvqJmPhV+biVOzsfuFqv9izqoaNs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MNuFMCrwkWK6iU/zsk4omYIEhd4ozkjTyIywnxmnBNYcYnz9Xq2U4rf87eDSIyzaoYZsOi5vt/A/Y9zf81Wk3+cAb8pfn1jsNph0LBMwg8RODlwBcNmGq5KD9hMRZni0XipTEM8nM/AOOn4c5/O8M6Z7ELS1I2emAuwKz3whL9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=rZIbUwSY; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 6AD76400F7
	for <linux-gpio@vger.kernel.org>; Tue, 25 Mar 2025 14:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1742911996;
	bh=dQe7H9U1jfXffyxDZew1boCw61jbY/93ewTdhDfN7Fg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=rZIbUwSY9eQsDnlMCUw4fvI9i+1ndg4EeafC0ZTTmp5bujvq9szVshPU2heSfewEN
	 4Ua2wfIt2efIAEpc+NtZxijd9XzEj0F5khrrR7Y0WGx89b399sr/iVLkRTTv3UVeE5
	 sfULLrbiA+eXr5uSIon2cFSz5MXll52MWHQDru9Xi6+qj+N8wWDyYH48Vp/1TCbG+k
	 9eI9NWUWbAM0TOJjdiX8RGlmGSCCkrEvdgVH90+ZlYmrlwQrOwCou+1XHaUgwYatlv
	 lMhZM3Bq49xzP+nlEjI7hzb/vXdTVkBN4PgqJJ3cA2oBqW7FoOShHPLMMFgQsw13p7
	 1YxdcFGsBrhWA==
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-391425471ddso3336045f8f.0
        for <linux-gpio@vger.kernel.org>; Tue, 25 Mar 2025 07:13:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742911995; x=1743516795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dQe7H9U1jfXffyxDZew1boCw61jbY/93ewTdhDfN7Fg=;
        b=dj+WLZxMmT96K3zapeHq2jjo0R6BXf56cSTz59pX1ZMOAJh7kAen614N6OCwv9IDTR
         t4UKg/piyZQqykaoxhK66sQp0tTZbmtcBfGVZ16adKKlB452yNMaxUn3fQOwPmuuJNMt
         pWUegOJrenpv/1JfIMRymd4YbRPOfLfJZX2da+QUlDw0PqPe9FmlaAdNtl9Jm6yk2mNf
         TmFTD7NhFSbLGUFO7EIDyHT3xOAzLqENOtQLO6LFfqRx+9L6KJzEA8umqCRFwlJGo1ov
         yuv0UHNZYq1t+QEV+Qpjelcun6wdM5yRVIV8puzGnYaSV9chl4+g9Plb5AXngFX0lkhP
         C7Gw==
X-Forwarded-Encrypted: i=1; AJvYcCUCnFtnyM7kO9ryRjcl2uoDi5j950GorQii+XnOeP8HJrVvpMebIWjOqmJZASmkndh28laF0xfS/p9d@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/2nFeRWbJZ4tdRgIVpL9VDiiSZeoqXOWM+O34xkSUIZBhBdR8
	TUQc9TqdPwyqSTHX3aoShRM/eK9mQCrt3QqSbVmEPtt//jMZD3y07n49Y9jR3zW1IIGxB5j8WTe
	ol7NPNUHgn5PqUWzREse23hpTK1d6UiRwwjUZeJx+jZCbZTGpVP6ovPd2+iE7QPuFbxKzZRDAWx
	c=
X-Gm-Gg: ASbGncv3NOOfXttqj1jUJa8bxX/BSotDcJxwl9KI4e9AyThZob+LK4NxgpEUA61YMIH
	pIDGeaGA4DrA1YtOJ/QXCyugYypgRvqrua+XT4P+8IhI1gVFQgeK1a2MiHhPePRgEj/RnPx9Zb+
	XwWIn0ZXf0xUzHnzPXWlhOTAz+HY35tG/EKdy+tnnHIWoeKkWxtdTwFIOdzbXFwEzMuSH82Rt1Z
	EF3iei8SVgTkbv0RfXf3SivZA+s8ptrXzK1LwlxsBt6klQpqjfKeA2ksMu83SNoZTzBarY4Cs3A
	MV68B/Pn7Hro2tnF75o6/I7UnEGEgw==
X-Received: by 2002:a05:6000:2a6:b0:391:2c67:7999 with SMTP id ffacd0b85a97d-3997f9404aemr17107071f8f.48.1742911995059;
        Tue, 25 Mar 2025 07:13:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE78N/yKFkd5sACTOi600OYQuNXlhXVEUf7SmL8hC+Ivi0buOCNdKaf2rmPFabBaYZo9IAMmQ==
X-Received: by 2002:a05:6000:2a6:b0:391:2c67:7999 with SMTP id ffacd0b85a97d-3997f9404aemr17106995f8f.48.1742911994481;
        Tue, 25 Mar 2025 07:13:14 -0700 (PDT)
Received: from stitch.. ([80.71.142.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9a6326sm13532091f8f.29.2025.03.25.07.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 07:13:14 -0700 (PDT)
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
To: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>,
	Pritesh Patel <pritesh.patel@einfochips.com>,
	Min Lin <linmin@eswincomputing.com>
Cc: Samuel Holland <samuel.holland@sifive.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [RFC PATCH 1/4] dt-bindings: pinctrl: Add eswin,eic7700-pinctrl binding
Date: Tue, 25 Mar 2025 15:13:03 +0100
Message-ID: <20250325141311.758787-2-emil.renner.berthing@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250325141311.758787-1-emil.renner.berthing@canonical.com>
References: <20250325141311.758787-1-emil.renner.berthing@canonical.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device tree binding for the pin controller on the ESWIN EIC7700
RISC-V SoC.

Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
---
 .../pinctrl/eswin,eic7700-pinctrl.yaml        | 141 ++++++++++++++++++
 1 file changed, 141 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/eswin,eic7700-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/eswin,eic7700-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/eswin,eic7700-pinctrl.yaml
new file mode 100644
index 000000000000..8ef966cebc5e
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/eswin,eic7700-pinctrl.yaml
@@ -0,0 +1,141 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/eswin,eic7700-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ESWIN EIC7700 SoC pin controller
+
+maintainers:
+  - Emil Renner Berthing <emil.renner.berthing@canonical.com>
+
+description: |
+  Pinmux and pinconf controller in the ESWIN EIC7700 RISC-V SoC.
+
+properties:
+  compatible:
+    enum:
+      - eswin,eic7700-pinctrl
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+patternProperties:
+  '-[0-9]+$':
+    type: object
+    additionalProperties: false
+
+    patternProperties:
+      '-pins$':
+        type: object
+        allOf:
+          - $ref: /schemas/pinctrl/pincfg-node.yaml#
+          - $ref: /schemas/pinctrl/pinmux-node.yaml#
+
+        additionalProperties: false
+
+        description:
+          A pinctrl node should contain at least one subnode describing one
+          or more pads and their associated pinmux and pinconf settings.
+
+        properties:
+          pins:
+            items:
+              enum: [ CHIP_MODE, MODE_SET0, MODE_SET1, MODE_SET2, MODE_SET3,
+                      XIN, RTC_XIN, RST_OUT_N, KEY_RESET_N, GPIO0, POR_SEL,
+                      JTAG0_TCK, JTAG0_TMS, JTAG0_TDI, JTAG0_TDO, GPIO5, SPI2_CS0_N,
+                      JTAG1_TCK, JTAG1_TMS, JTAG1_TDI, JTAG1_TDO, GPIO11, SPI2_CS1_N,
+                      PCIE_CLKREQ_N, PCIE_WAKE_N, PCIE_PERST_N, HDMI_SCL, HDMI_SDA,
+                      HDMI_CEC, JTAG2_TRST, RGMII0_CLK_125, RGMII0_TXEN,
+                      RGMII0_TXCLK, RGMII0_TXD0, RGMII0_TXD1, RGMII0_TXD2,
+                      RGMII0_TXD3, I2S0_BCLK, I2S0_WCLK, I2S0_SDI, I2S0_SDO,
+                      I2S_MCLK, RGMII0_RXCLK, RGMII0_RXDV, RGMII0_RXD0, RGMII0_RXD1,
+                      RGMII0_RXD2, RGMII0_RXD3, I2S2_BCLK, I2S2_WCLK, I2S2_SDI,
+                      I2S2_SDO, GPIO27, GPIO28, GPIO29, RGMII0_MDC, RGMII0_MDIO,
+                      RGMII0_INTB, RGMII1_CLK_125, RGMII1_TXEN, RGMII1_TXCLK,
+                      RGMII1_TXD0, RGMII1_TXD1, RGMII1_TXD2, RGMII1_TXD3, I2S1_BCLK,
+                      I2S1_WCLK, I2S1_SDI, I2S1_SDO, GPIO34, RGMII1_RXCLK,
+                      RGMII2_RXDV, RGMII2_RXD0, RGMII2_RXD1, RGMII2_RXD2,
+                      RGMII2_RXD3, SPI1_CS0_N, SPI1_CLK, SPI1_D0, SPI1_D1, SPI1_D2,
+                      SPI1_D3, SPI1_CS1_N, RGMII1_MDC, RGMII1_MDIO, RGMII1_INTB,
+                      USB0_PWREN, USB1_PWREN, I2C0_SCL, I2C0_SDA, I2C1_SCL, I2C1_SDA,
+                      I2C2_SCL, I2C2_SDA, I2C3_SCL, I2C3_SDA, I2C4_SCL, I2C4_SDA,
+                      I2C5_SCL, I2C5_SDA, UART0_TX, UART0_RX, UART1_TX, UART1_RX,
+                      UART1_CTS, UART1_RTS, UART2_TX, UART2_RX, JTAG2_TCK, JTAG2_TMS,
+                      JTAG2_TDI, JTAG2_TDO, FAN_PWM, FAN_TACH, MIPI_CSI0_XVS,
+                      MIPI_CSI0_XHS, MIPI_CSI0_MCLK, MIPI_CSI1_XVS, MIPI_CSI1_XHS,
+                      MIPI_CSI1_MCLK, MIPI_CSI2_XVS, MIPI_CSI2_XHS, MIPI_CSI2_MCLK,
+                      MIPI_CSI3_XVS, MIPI_CSI3_XHS, MIPI_CSI3_MCLK, MIPI_CSI4_XVS,
+                      MIPI_CSI4_XHS, MIPI_CSI4_MCLK, MIPI_CSI5_XVS, MIPI_CSI5_XHS,
+                      MIPI_CSI5_MCLK, SPI3_CS_N, SPI3_CLK, SPI3_DI, SPI3_DO, GPIO92,
+                      GPIO93, S_MODE, GPIO95, SPI0_CS_N, SPI0_CLK, SPI0_D0, SPI0_D1,
+                      SPI0_D2, SPI0_D3, I2C10_SCL, I2C10_SDA, I2C11_SCL, I2C11_SDA,
+                      GPIO106, BOOT_SEL0, BOOT_SEL1, BOOT_SEL2, BOOT_SEL3, GPIO111,
+                      LPDDR_REF_CLK ]
+            description: List of pads that properties in the node apply to.
+
+          function:
+            enum: [ csi, debug, ddr, fan, gpio, hdmi, i2c, i2s, jtag, mipi,
+                    mode, oscillator, pci, pwm, rgmii, reset, sata, spi, sdio,
+                    uart, usb ]
+            description: The mux function to select for the given pins.
+
+          bias-disable: true
+
+          bias-pull-up:
+            oneOf:
+              - type: boolean
+              - const: 25000
+            description: Enable internal 25kOhm pull-up
+
+          bias-pull-down:
+            oneOf:
+              - type: boolean
+              - const: 22000
+            description: Enable internal 22kOhm pull-down
+
+          drive-strength-microamp:
+            enum: [ 3100, 6700, 9600, 12900, 18000, 20900, 23200, 25900 ]
+
+          input-enable: true
+
+          input-disable: true
+
+          input-schmitt-enable: true
+
+          input-schmitt-disable: true
+
+        required:
+          - pins
+
+additionalProperties: false
+
+examples:
+  - |
+    pinctrl: pinctrl@51600080 {
+        compatible = "eswin,eic7700-pinctrl";
+        reg = <0x51600080 0xff80>;
+
+        uart0_pins: uart0-0 {
+            tx-pins {
+                pins = "UART0_TX";
+                function = "uart";
+                bias-disable;
+                drive-strength-microamp = <6700>;
+                input-disable;
+                input-schmitt-disable;
+            };
+
+            rx-pins {
+                pins = "UART0_RX";
+                function = "uart";
+                bias-pull-up;
+                drive-strength-microamp = <6700>;
+                input-enable;
+                input-schmitt-enable;
+            };
+        };
+    };
-- 
2.43.0


