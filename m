Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2A9823A83E
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Aug 2020 16:21:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726804AbgHCOVE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 3 Aug 2020 10:21:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726130AbgHCOVC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Aug 2020 10:21:02 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79454C06174A;
        Mon,  3 Aug 2020 07:21:02 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id qc22so24009503ejb.4;
        Mon, 03 Aug 2020 07:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZGdvLPViu1fOQOHKCBa/wx0x8Sr4BKnB/HdyCPVX9Es=;
        b=p3UFnhQksxBeryIqwEWqjjT1YdNnrns5WG3wOZ+aHhNDiQVTWw9thTskehnb+vtiic
         +e4lsKFRBSTlMxUnb6ROvRGWcIMHYYu5m83gd2h/mXAV6BrpsNhfza2g7UO7IkRGxqJ0
         3fZWOqUG7V0ZrbAjKEAnqPaRqz87YjDmMwpCy5G7Al44UZeA3742EsAqt54RXz2EFmpE
         eKcSpp/a0WCPBKdRo56b1kZDFZuJ2TcRA4Bj1gwlNhD3oUeYHZ5CGe6rLwPI9wKzVK9v
         6nl/Imbfn1XcD+j9Qa9PfkqYa8lJi6yrl6lxMxICqhF4x4F35tHcljsRJ5aC5A3Qh1Sx
         RB/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZGdvLPViu1fOQOHKCBa/wx0x8Sr4BKnB/HdyCPVX9Es=;
        b=InNElFRgrR+Br01a55O/Q/Ue9aeVz1Uwseb5Un8SsW4kkg/pYGNpeHJ96nEBhGgtQC
         IxXx66FCrEP5eCmx/2pHZEEW5JjfER6qchWQYz1ZROhAFPUczvjiAFAXWQs7uFD727EF
         Fojzi0AdFynsgeERs4cwOLMJ71ciglOpjZtQyr5EwaDxZ7cbZBYQ/g3J1dkul4fxfV/2
         WeHvGZh79UKggNdpTbaIVG+dwLybtEnf3jzdzdLbQ+v5td/3oUucuHa+c3mMO1KQe0Rw
         +gtsABfbXJzKarTr8aM9OHZTvZP85SSH0DCaSjuqw+Lr3lzGE0gtHSsfs6ZJGCSjYPUW
         reow==
X-Gm-Message-State: AOAM530khmum77n2di+sIuzBcS+xMPN8Dak95ctrwFI5cexhP3QCrSN7
        LZh3pA0+fH7KAsm1gzRVBjA=
X-Google-Smtp-Source: ABdhPJy6NyyLqdbrbUt9k8/fIA4cl4GGtJyDEHRvLdTi3v/TgoNFf7BIykV3/hEPGwvYJb92f88Zjg==
X-Received: by 2002:a17:906:15d8:: with SMTP id l24mr16431207ejd.297.1596464461191;
        Mon, 03 Aug 2020 07:21:01 -0700 (PDT)
Received: from localhost.localdomain ([86.121.43.21])
        by smtp.gmail.com with ESMTPSA id p3sm15608432edx.75.2020.08.03.07.20.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2020 07:21:00 -0700 (PDT)
From:   Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
To:     =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-actions@lists.infradead.org
Subject: [PATCH v2 1/3] dt-bindings: pinctrl: Add bindings for Actions S500 SoC
Date:   Mon,  3 Aug 2020 17:20:54 +0300
Message-Id: <7abf618c446b7b648f512afe72e46704156e9912.1596461275.git.cristian.ciocaltea@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1596461275.git.cristian.ciocaltea@gmail.com>
References: <cover.1596461275.git.cristian.ciocaltea@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add pinctrl and gpio bindings for Actions Semi S500 SoC.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
---
Changes in v2:
 - Added myself to the list of maintainers, per Mani's suggestion
 - Added a description item for each of the four register ranges,
   per Rob's feedback
 - Renamed the pin nodes and got rid of the if/then hack in the
   patternProperties,according to Rob's suggestion
 - Added a missing 'additionalProperties: false' line
 - Updated the example with the new node names and the split
   register range

 .../pinctrl/actions,s500-pinctrl.yaml         | 240 ++++++++++++++++++
 1 file changed, 240 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/actions,s500-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/actions,s500-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/actions,s500-pinctrl.yaml
new file mode 100644
index 000000000000..33391d30c00c
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/actions,s500-pinctrl.yaml
@@ -0,0 +1,240 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/actions,s500-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Actions Semi S500 SoC pinmux & GPIO controller
+
+maintainers:
+  - Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
+  - Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
+
+description: |
+  Pinmux & GPIO controller manages pin multiplexing & configuration including
+  GPIO function selection & GPIO attributes configuration. Please refer to
+  pinctrl-bindings.txt in this directory for common binding part and usage.
+
+properties:
+  compatible:
+    const: actions,s500-pinctrl
+
+  reg:
+    items:
+      - description: GPIO Output + GPIO Input + GPIO Data
+      - description: Multiplexing Control
+      - description: PAD Pull Control + PAD Schmitt Trigger Enable + PAD Control
+      - description: PAD Drive Capacity Select
+    minItems: 1
+    maxItems: 4
+
+  clocks:
+    maxItems: 1
+
+  gpio-controller: true
+
+  gpio-ranges:
+    maxItems: 1
+
+  '#gpio-cells':
+    description:
+      Specifies the pin number and flags, as defined in
+      include/dt-bindings/gpio/gpio.h
+    const: 2
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    description:
+      Specifies the pin number and flags, as defined in
+      include/dt-bindings/interrupt-controller/irq.h
+    const: 2
+
+  interrupts:
+    description:
+      One interrupt per each of the 5 GPIO ports supported by the controller,
+      sorted by port number ascending order.
+    minItems: 5
+    maxItems: 5
+
+patternProperties:
+  '-pins$':
+    type: object
+    patternProperties:
+      '^(.*-)?pinmux$':
+        type: object
+        description:
+          Pinctrl node's client devices specify pin muxes using subnodes,
+          which in turn use the standard properties below.
+        $ref: pinmux-node.yaml#
+
+        properties:
+          groups:
+            description:
+              List of gpio pin groups affected by the functions specified in
+              this subnode.
+            items:
+              oneOf:
+                - enum: [lcd0_d18_mfp, rmii_crs_dv_mfp, rmii_txd0_mfp,
+                    rmii_txd1_mfp, rmii_txen_mfp, rmii_rxen_mfp, rmii_rxd1_mfp,
+                    rmii_rxd0_mfp, rmii_ref_clk_mfp, i2s_d0_mfp, i2s_pcm1_mfp,
+                    i2s0_pcm0_mfp, i2s1_pcm0_mfp, i2s_d1_mfp, ks_in2_mfp,
+                    ks_in1_mfp, ks_in0_mfp, ks_in3_mfp, ks_out0_mfp,
+                    ks_out1_mfp, ks_out2_mfp, lvds_o_pn_mfp, dsi_dn0_mfp,
+                    dsi_dp2_mfp, lcd0_d17_mfp, dsi_dp3_mfp, dsi_dn3_mfp,
+                    dsi_dp0_mfp, lvds_ee_pn_mfp, spi0_i2c_pcm_mfp,
+                    spi0_i2s_pcm_mfp, dsi_dnp1_cp_mfp, lvds_e_pn_mfp,
+                    dsi_dn2_mfp, uart2_rtsb_mfp, uart2_ctsb_mfp, uart3_rtsb_mfp,
+                    uart3_ctsb_mfp, sd0_d0_mfp, sd0_d1_mfp, sd0_d2_d3_mfp,
+                    sd1_d0_d3_mfp, sd0_cmd_mfp, sd0_clk_mfp, sd1_cmd_mfp,
+                    uart0_rx_mfp, clko_25m_mfp, csi_cn_cp_mfp, sens0_ckout_mfp,
+                    uart0_tx_mfp, i2c0_mfp, csi_dn_dp_mfp, sen0_pclk_mfp,
+                    pcm1_in_mfp, pcm1_clk_mfp, pcm1_sync_mfp, pcm1_out_mfp,
+                    dnand_data_wr_mfp, dnand_acle_ce0_mfp, nand_ceb2_mfp,
+                    nand_ceb3_mfp]
+            minItems: 1
+            maxItems: 32
+
+          function:
+            description:
+              Specify the alternative function to be configured for the
+              given gpio pin groups.
+            enum: [nor, eth_rmii, eth_smii, spi0, spi1, spi2, spi3, sens0,
+              sens1, uart0, uart1, uart2, uart3, uart4, uart5, uart6, i2s0,
+              i2s1, pcm1, pcm0, ks, jtag, pwm0, pwm1, pwm2, pwm3, pwm4, pwm5,
+              p0, sd0, sd1, sd2, i2c0, i2c1, i2c3, dsi, lvds, usb30, clko_25m,
+              mipi_csi, nand, spdif, ts, lcd0]
+
+        required:
+          - groups
+          - function
+
+        additionalProperties: false
+
+      '^(.*-)?pinconf$':
+        type: object
+        description:
+          Pinctrl node's client devices specify pin configurations using
+          subnodes, which in turn use the standard properties below.
+        $ref: pincfg-node.yaml#
+
+        properties:
+          groups:
+            description:
+              List of gpio pin groups affected by the drive-strength property
+              specified in this subnode.
+            items:
+              oneOf:
+                - enum: [sirq_drv, rmii_txd01_txen_drv, rmii_rxer_drv,
+                    rmii_crs_drv, rmii_rxd10_drv, rmii_ref_clk_drv,
+                    smi_mdc_mdio_drv, i2s_d0_drv, i2s_bclk0_drv, i2s3_drv,
+                    i2s13_drv, pcm1_drv, ks_in_drv, ks_out_drv, lvds_all_drv,
+                    lcd_dsi_drv, dsi_drv, sd0_d0_d3_drv, sd1_d0_d3_drv,
+                    sd0_cmd_drv, sd0_clk_drv, sd1_cmd_drv, sd1_clk_drv,
+                    spi0_all_drv, uart0_rx_drv, uart0_tx_drv, uart2_all_drv,
+                    i2c0_all_drv, i2c12_all_drv, sens0_pclk_drv,
+                    sens0_ckout_drv, uart3_all_drv]
+            minItems: 1
+            maxItems: 32
+
+          pins:
+            description:
+              List of gpio pins affected by the bias-pull-* and
+              input-schmitt-* properties specified in this subnode.
+            items:
+              oneOf:
+                - enum: [dnand_dqs, dnand_dqsn, eth_txd0, eth_txd1, eth_txen,
+                    eth_rxer, eth_crs_dv, eth_rxd1, eth_rxd0, eth_ref_clk,
+                    eth_mdc, eth_mdio, sirq0, sirq1, sirq2, i2s_d0, i2s_bclk0,
+                    i2s_lrclk0, i2s_mclk0, i2s_d1, i2s_bclk1, i2s_lrclk1,
+                    i2s_mclk1, ks_in0, ks_in1, ks_in2, ks_in3, ks_out0, ks_out1,
+                    ks_out2, lvds_oep, lvds_oen, lvds_odp, lvds_odn, lvds_ocp,
+                    lvds_ocn, lvds_obp, lvds_obn, lvds_oap, lvds_oan, lvds_eep,
+                    lvds_een, lvds_edp, lvds_edn, lvds_ecp, lvds_ecn, lvds_ebp,
+                    lvds_ebn, lvds_eap, lvds_ean, lcd0_d18, lcd0_d17, dsi_dp3,
+                    dsi_dn3, dsi_dp1, dsi_dn1, dsi_cp, dsi_cn, dsi_dp0, dsi_dn0,
+                    dsi_dp2, dsi_dn2, sd0_d0, sd0_d1, sd0_d2, sd0_d3, sd1_d0,
+                    sd1_d1, sd1_d2, sd1_d3, sd0_cmd, sd0_clk, sd1_cmd, sd1_clk,
+                    spi0_sclk, spi0_ss, spi0_miso, spi0_mosi, uart0_rx,
+                    uart0_tx, i2c0_sclk, i2c0_sdata, sensor0_pclk,
+                    sensor0_ckout, dnand_ale, dnand_cle, dnand_ceb0, dnand_ceb1,
+                    dnand_ceb2, dnand_ceb3, uart2_rx, uart2_tx, uart2_rtsb,
+                    uart2_ctsb, uart3_rx, uart3_tx, uart3_rtsb, uart3_ctsb,
+                    pcm1_in, pcm1_clk, pcm1_sync, pcm1_out, i2c1_sclk,
+                    i2c1_sdata, i2c2_sclk, i2c2_sdata, csi_dn0, csi_dp0,
+                    csi_dn1, csi_dp1, csi_dn2, csi_dp2, csi_dn3, csi_dp3,
+                    csi_cn, csi_cp, dnand_d0, dnand_d1, dnand_d2, dnand_d3,
+                    dnand_d4, dnand_d5, dnand_d6, dnand_d7, dnand_rb, dnand_rdb,
+                    dnand_rdbn, dnand_wrb, porb, clko_25m, bsel, pkg0, pkg1,
+                    pkg2, pkg3]
+            minItems: 1
+            maxItems: 64
+
+          bias-pull-up: true
+          bias-pull-down: true
+
+          drive-strength:
+            description:
+              Selects the drive strength for the specified pins, in mA.
+            enum: [2, 4, 8, 12]
+
+          input-schmitt-enable: true
+          input-schmitt-disable: true
+
+        additionalProperties: false
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - gpio-controller
+  - gpio-ranges
+  - '#gpio-cells'
+  - interrupt-controller
+  - '#interrupt-cells'
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    pinctrl: pinctrl@b01b0000 {
+        compatible = "actions,s500-pinctrl";
+        reg = <0xb01b0000 0x40>, <0xb01b0040 0x10>,
+              <0xb01b0060 0x18>, <0xb01b0080 0xc>;
+        clocks = <&cmu 55>;
+        gpio-controller;
+        gpio-ranges = <&pinctrl 0 0 132>;
+        #gpio-cells = <2>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+        interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
+
+        mmc0_pins: mmc0-pins {
+            pinmux {
+                groups = "sd0_d0_mfp", "sd0_d1_mfp", "sd0_d2_d3_mfp",
+                         "sd0_cmd_mfp", "sd0_clk_mfp";
+                function = "sd0";
+            };
+
+            drv-pinconf {
+                groups = "sd0_d0_d3_drv", "sd0_cmd_drv", "sd0_clk_drv";
+                drive-strength = <8>;
+            };
+
+            bias-pinconf {
+                pins = "sd0_d0", "sd0_d1", "sd0_d2",
+                       "sd0_d3", "sd0_cmd";
+                bias-pull-up;
+            };
+        };
+    };
+
+...
-- 
2.28.0

