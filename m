Return-Path: <linux-gpio+bounces-21425-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1822EAD6E2F
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Jun 2025 12:48:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 726641884133
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Jun 2025 10:47:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A889723AB9F;
	Thu, 12 Jun 2025 10:47:26 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [52.175.55.52])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 149AB1422DD;
	Thu, 12 Jun 2025 10:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.175.55.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749725246; cv=none; b=V3oPaDuq5D+Pvlj9wSVpeLfJyxetiiv5PNQivZ6aOPTWgPtW0Z1VR+DML0UAouRscgWpcX3zGbDp1ZlDP1elJn3uat4fF/HNlJnJqiva3ImC4pwsKW18BPHryv0iUADn4BFgkxUXG696Oab7z+2RuDCQe8oM1ZqFv+1OaM6BdSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749725246; c=relaxed/simple;
	bh=E++j0VEKWl4vXpOMr+jNQnxTUhTcRw3k4Jgt5LDWoPA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gxBQ8vJu+fMV1QMce1e4hLaDFRnfhlZsHpmvqv32B7No79QrFtp9NV6LHf6rGLfpuTM0fXulusYc/6SnwDxGUzCQBHf+GjmP0a+29fuapOvW5Y4oNhvXFkTZfn5UTOkKl7w6OIa04UFc+Zbdd0Zm2VoYqDWheFGONUE0YeTL1uQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com; spf=pass smtp.mailfrom=eswincomputing.com; arc=none smtp.client-ip=52.175.55.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eswincomputing.com
Received: from E0006800LT.eswin.cn (unknown [10.12.96.77])
	by app2 (Coremail) with SMTP id TQJkCgAHp5UxsEpornyeAA--.2359S2;
	Thu, 12 Jun 2025 18:47:15 +0800 (CST)
From: Yulin Lu <luyulin@eswincomputing.com>
To: linus.walleij@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kees@kernel.org,
	gustavoars@kernel.org,
	brgl@bgdev.pl,
	linux-hardening@vger.kernel.org
Cc: ningyu@eswincomputing.com,
	linmin@eswincomputing.com,
	zhengyu@eswincomputing.com,
	huangyifeng@eswincomputing.com,
	fenglin@eswincomputing.com,
	lianghujun@eswincomputing.com,
	Yulin Lu <luyulin@eswincomputing.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 1/2] dt-bindings: pinctrl: eswin: Document for EIC7700 SoC
Date: Thu, 12 Jun 2025 18:47:10 +0800
Message-Id: <20250612104710.1341-1-luyulin@eswincomputing.com>
X-Mailer: git-send-email 2.31.1.windows.1
In-Reply-To: <20250612104539.2011-1-luyulin@eswincomputing.com>
References: <20250612104539.2011-1-luyulin@eswincomputing.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:TQJkCgAHp5UxsEpornyeAA--.2359S2
X-Coremail-Antispam: 1UD129KBjvJXoW3XFW8KrWDGw45GryUZry7ZFb_yoW7Kr1xpF
	43W34fJF1qqr1xGa9Ivw109F1fJan7AF9xAFyjyry3Xw1Yq3WSyr4ayr45WFWUWr4kJ343
	Xayjqa4jqF4UCrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9G14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lc7CjxVAaw2AFwI0_GFv_Wrylc2xSY4AK6svPMxAIw28IcxkI7VAKI48JMx
	C20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAF
	wI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20x
	vE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v2
	0xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxV
	W8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7sRRKZX5UUUUU==
X-CM-SenderInfo: pox13z1lq6v25zlqu0xpsx3x1qjou0bp/

Add EIC7700 pinctrl device for all configurable pins.
For the EIC7700 pinctrl registers, each register (32 bits)
controls the characteristics of a single pin.
It supports setting function multiplexing, Schmitt trigger,
drive strength, pull-up/pull-down, and input enable.

Co-developed-by: Samuel Holland <samuel.holland@sifive.com>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
Signed-off-by: Yulin Lu <luyulin@eswincomputing.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../pinctrl/eswin,eic7700-pinctrl.yaml        | 156 ++++++++++++++++++
 1 file changed, 156 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/eswin,eic7700-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/eswin,eic7700-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/eswin,eic7700-pinctrl.yaml
new file mode 100644
index 000000000000..d46e7ee6372d
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/eswin,eic7700-pinctrl.yaml
@@ -0,0 +1,156 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/eswin,eic7700-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Eswin Eic7700 Pinctrl
+
+maintainers:
+  - Yulin Lu <luyulin@eswincomputing.com>
+
+allOf:
+  - $ref: pinctrl.yaml#
+
+description: |
+  eic7700 pin configuration nodes act as a container for an arbitrary number of
+  subnodes. Each of these subnodes represents some desired configuration for one or
+  more pins. This configuration can include the mux function to select on those pin(s),
+  and various pin configuration parameters, such as input-enable, pull-up, etc.
+
+properties:
+  compatible:
+    const: eswin,eic7700-pinctrl
+
+  reg:
+    maxItems: 1
+
+  vrgmii-supply:
+    description:
+      Regulator supply for the RGMII interface IO power domain.
+      This property should reference a regulator that provides either 1.8V or 3.3V,
+      depending on the board-level voltage configuration required by the RGMII interface.
+
+patternProperties:
+  '-grp$':
+    type: object
+    additionalProperties: false
+
+    patternProperties:
+      '-pins$':
+        type: object
+
+        properties:
+          pins:
+            description:
+              For eic7700, specifies the name(s) of one or more pins to be configured by
+              this node.
+            items:
+              enum: [ chip_mode, mode_set0, mode_set1, mode_set2, mode_set3, xin,
+                      rst_out_n, key_reset_n, gpio0, por_sel, jtag0_tck, jtag0_tms,
+                      jtag0_tdi, jtag0_tdo, gpio5, spi2_cs0_n, jtag1_tck, jtag1_tms,
+                      jtag1_tdi, jtag1_tdo, gpio11, spi2_cs1_n, pcie_clkreq_n,
+                      pcie_wake_n, pcie_perst_n, hdmi_scl, hdmi_sda, hdmi_cec,
+                      jtag2_trst, rgmii0_clk_125, rgmii0_txen, rgmii0_txclk,
+                      rgmii0_txd0, rgmii0_txd1, rgmii0_txd2, rgmii0_txd3, i2s0_bclk,
+                      i2s0_wclk, i2s0_sdi, i2s0_sdo, i2s_mclk, rgmii0_rxclk,
+                      rgmii0_rxdv, rgmii0_rxd0, rgmii0_rxd1, rgmii0_rxd2, rgmii0_rxd3,
+                      i2s2_bclk, i2s2_wclk, i2s2_sdi, i2s2_sdo, gpio27, gpio28, gpio29,
+                      rgmii0_mdc, rgmii0_mdio, rgmii0_intb, rgmii1_clk_125, rgmii1_txen,
+                      rgmii1_txclk, rgmii1_txd0, rgmii1_txd1, rgmii1_txd2, rgmii1_txd3,
+                      i2s1_bclk, i2s1_wclk, i2s1_sdi, i2s1_sdo, gpio34, rgmii1_rxclk,
+                      rgmii1_rxdv, rgmii1_rxd0, rgmii1_rxd1, rgmii1_rxd2, rgmii1_rxd3,
+                      spi1_cs0_n, spi1_clk, spi1_d0, spi1_d1, spi1_d2, spi1_d3, spi1_cs1_n,
+                      rgmii1_mdc, rgmii1_mdio, rgmii1_intb, usb0_pwren, usb1_pwren,
+                      i2c0_scl, i2c0_sda, i2c1_scl, i2c1_sda, i2c2_scl, i2c2_sda,
+                      i2c3_scl, i2c3_sda, i2c4_scl, i2c4_sda, i2c5_scl, i2c5_sda,
+                      uart0_tx, uart0_rx, uart1_tx, uart1_rx, uart1_cts, uart1_rts,
+                      uart2_tx, uart2_rx, jtag2_tck, jtag2_tms, jtag2_tdi, jtag2_tdo,
+                      fan_pwm, fan_tach, mipi_csi0_xvs, mipi_csi0_xhs, mipi_csi0_mclk,
+                      mipi_csi1_xvs, mipi_csi1_xhs, mipi_csi1_mclk, mipi_csi2_xvs,
+                      mipi_csi2_xhs, mipi_csi2_mclk, mipi_csi3_xvs, mipi_csi3_xhs,
+                      mipi_csi3_mclk, mipi_csi4_xvs, mipi_csi4_xhs, mipi_csi4_mclk,
+                      mipi_csi5_xvs, mipi_csi5_xhs, mipi_csi5_mclk, spi3_cs_n, spi3_clk,
+                      spi3_di, spi3_do, gpio92, gpio93, s_mode, gpio95, spi0_cs_n,
+                      spi0_clk, spi0_d0, spi0_d1, spi0_d2, spi0_d3, i2c10_scl,
+                      i2c10_sda, i2c11_scl, i2c11_sda, gpio106, boot_sel0, boot_sel1,
+                      boot_sel2, boot_sel3, gpio111, lpddr_ref_clk ]
+
+          function:
+            description:
+              Specify the alternative function to be configured for the
+              given pins.
+            enum: [ disabled, boot_sel, chip_mode, emmc, fan_tach,
+                    gpio, hdmi, i2c, i2s, jtag, ddr_ref_clk_sel,
+                    lpddr_ref_clk, mipi_csi, osc, pcie, pwm,
+                    rgmii, reset, sata, sdio, spi, s_mode, uart, usb ]
+
+          input-schmitt-enable: true
+
+          input-schmitt-disable: true
+
+          bias-disable: true
+
+          bias-pull-down: true
+
+          bias-pull-up: true
+
+          input-enable: true
+
+          input-disable: true
+
+          drive-strength-microamp: true
+
+        required:
+          - pins
+
+        additionalProperties: false
+
+        allOf:
+          - $ref: pincfg-node.yaml#
+          - $ref: pinmux-node.yaml#
+
+          - if:
+              properties:
+                pins:
+                  anyOf:
+                    - pattern: '^rgmii'
+                    - const: lpddr_ref_clk
+            then:
+              properties:
+                drive-strength-microamp:
+                  enum: [3000, 6000, 9000, 12000, 15000, 18000, 21000, 24000]
+            else:
+              properties:
+                drive-strength-microamp:
+                  enum: [6000, 9000, 12000, 15000, 18000, 21000, 24000, 27000]
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    pinctrl@51600080 {
+      compatible = "eswin,eic7700-pinctrl";
+      reg = <0x51600080 0x1fff80>;
+      vrgmii-supply = <&vcc_1v8>;
+
+      dev-active-grp {
+        /* group node defining 1 standard pin */
+        gpio10-pins {
+          pins = "jtag1_tdo";
+          function = "gpio";
+          input-enable;
+          bias-pull-up;
+        };
+
+        /* group node defining 2 I2C pins */
+        i2c6-pins {
+          pins = "uart1_cts", "uart1_rts";
+          function = "i2c";
+        };
+      };
+    };
-- 
2.25.1


