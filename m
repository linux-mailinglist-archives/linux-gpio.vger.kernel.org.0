Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A764913D53A
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Jan 2020 08:47:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726369AbgAPHp1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Jan 2020 02:45:27 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:26807 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729431AbgAPHp1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 16 Jan 2020 02:45:27 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1579160726; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=weUMhUcEMVbgP8WSicbp+9Sndck8nffWYx58qpxpEjs=; b=nFu9gwTOtpVvhf7mfdUHIZySCbVYSoSS85pFf4zCezoyqCVr/jONWeNZarNL/0pvNdqQUv/u
 fpSdZM9+W2pzmjQ+GX/27NeLfaJQPCAqzNhryyg1CbX8J47KlK3CwLER+yV5JiDyHUwr4CX4
 1hF4MlDZDUzz5j1DHGZ1W/hhAio=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e201493.7f45db7cb6c0-smtp-out-n03;
 Thu, 16 Jan 2020 07:45:23 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D0F34C447A9; Thu, 16 Jan 2020 07:45:21 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from srichara1-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sricharan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 234EBC447A2;
        Thu, 16 Jan 2020 07:45:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 234EBC447A2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sricharan@codeaurora.org
From:   Sricharan R <sricharan@codeaurora.org>
To:     agross@kernel.org, devicetree@vger.kernel.org,
        linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-soc@vger.kernel.org,
        robh+dt@kernel.org, sivaprak@codeaurora.org,
        sricharan@codeaurora.org
Cc:     Rajkumar Ayyasamy <arajkuma@codeaurora.org>,
        Selvam Sathappan Periakaruppan <speriaka@codeaurora.org>
Subject: [PATCH V5 1/5] dt-bindings: pinctrl: qcom: Add ipq6018 pinctrl bindings
Date:   Thu, 16 Jan 2020 13:14:57 +0530
Message-Id: <1579160701-32408-2-git-send-email-sricharan@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1579160701-32408-1-git-send-email-sricharan@codeaurora.org>
References: <1579160701-32408-1-git-send-email-sricharan@codeaurora.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add device tree binding Documentation details for ipq6018
pinctrl driver.

Co-developed-by: Rajkumar Ayyasamy <arajkuma@codeaurora.org>
Signed-off-by: Rajkumar Ayyasamy <arajkuma@codeaurora.org>
Co-developed-by: Selvam Sathappan Periakaruppan <speriaka@codeaurora.org>
Signed-off-by: Selvam Sathappan Periakaruppan <speriaka@codeaurora.org>
Co-developed-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
Signed-off-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
Signed-off-by: Sricharan R <sricharan@codeaurora.org>
---
[V5]
* Addressed review comments from Rob
* Ran dt bindings check and no errors were reported
 .../bindings/pinctrl/qcom,ipq6018-pinctrl.yaml     | 162 +++++++++++++++++++++
 1 file changed, 162 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml
new file mode 100644
index 0000000..0622258
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml
@@ -0,0 +1,162 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/qcom,ipq6018-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies, Inc. IPQ6018 TLMM block
+
+maintainers:
+  - Sricharan R <sricharan@codeaurora.org>
+
+description: |
+  This binding describes the Top Level Mode Multiplexer block found in the
+  IPQ6018 platform.
+
+properties:
+  compatible:
+    const: qcom,ipq6018-pinctrl
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    description: Specifies the TLMM summary IRQ
+    maxItems: 1
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    description:
+      Specifies the PIN numbers and Flags, as defined in defined in
+      include/dt-bindings/interrupt-controller/irq.h
+    const: 2
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    description: Specifying the pin number and flags, as defined in
+      include/dt-bindings/gpio/gpio.h
+    const: 2
+
+  gpio-ranges:
+    description: Documentation/devicetree/bindings/gpio/gpio.txt
+    maxItems: 1
+
+#PIN CONFIGURATION NODES
+patternProperties:
+  '.*-pin.*':
+    type: object
+    description:
+      Pinctrl node's client devices use subnodes for desired pin configuration.
+      Client device subnodes use below standard properties.
+    allOf:
+      - $ref: "/schemas/pinctrl/pincfg-node.yaml"
+
+    properties:
+      pins:
+        description:
+          List of gpio pins affected by the properties specified in this
+          subnode. The valid values are gpio1-80, sdc1_clk, sdc1_cmd,
+          sdc1_data, sdc2_clk, sdc2_cmd, sdc2_data, qdsd_cmd, qdsd_data0,
+          qdsd_data1, qdsd_data2, qdsd_data3
+        minItems: 1
+        maxItems: 4
+
+      function:
+        description:
+          Specify the alternative function to be configured for the specified
+          pins.
+        enum: [ adsp_ext, alsp_int, atest_bbrx0, atest_bbrx1, atest_char,
+          atest_char0, atest_char1, atest_char2, atest_char3, atest_combodac,
+          atest_gpsadc0, atest_gpsadc1, atest_tsens, atest_wlan0,
+          atest_wlan1, backlight_en, bimc_dte0, bimc_dte1, blsp1_i2c,
+          blsp2_i2c, blsp3_i2c, blsp4_i2c, blsp5_i2c, blsp6_i2c,  blsp1_spi,
+          blsp1_spi_cs1, blsp1_spi_cs2, blsp1_spi_cs3, blsp2_spi,
+          blsp2_spi_cs1, blsp2_spi_cs2, blsp2_spi_cs3, blsp3_spi,
+          blsp3_spi_cs1, blsp3_spi_cs2, blsp3_spi_cs3, blsp4_spi, blsp5_spi,
+          blsp6_spi, blsp1_uart, blsp2_uart, blsp1_uim, blsp2_uim, cam1_rst,
+          cam1_standby, cam_mclk0, cam_mclk1, cci_async, cci_i2c, cci_timer0,
+          cci_timer1, cci_timer2, cdc_pdm0, codec_mad, dbg_out, display_5v,
+          dmic0_clk, dmic0_data, dsi_rst, ebi0_wrcdc, euro_us, ext_lpass,
+          flash_strobe, gcc_gp1_clk_a, gcc_gp1_clk_b, gcc_gp2_clk_a,
+          gcc_gp2_clk_b, gcc_gp3_clk_a, gcc_gp3_clk_b, gpio, gsm0_tx0,
+          gsm0_tx1, gsm1_tx0, gsm1_tx1, gyro_accl, kpsns0, kpsns1, kpsns2,
+          ldo_en, ldo_update, mag_int, mdp_vsync, modem_tsync, m_voc,
+          nav_pps, nav_tsync, pa_indicator, pbs0, pbs1, pbs2, pri_mi2s,
+          pri_mi2s_ws, prng_rosc, pwr_crypto_enabled_a, pwr_crypto_enabled_b,
+          pwr_modem_enabled_a,  pwr_modem_enabled_b, pwr_nav_enabled_a,
+          pwr_nav_enabled_b, qdss_ctitrig_in_a0, qdss_ctitrig_in_a1,
+          qdss_ctitrig_in_b0, qdss_ctitrig_in_b1, qdss_ctitrig_out_a0,
+          qdss_ctitrig_out_a1, qdss_ctitrig_out_b0, qdss_ctitrig_out_b1,
+          qdss_traceclk_a, qdss_traceclk_b, qdss_tracectl_a, qdss_tracectl_b,
+          qdss_tracedata_a, qdss_tracedata_b, reset_n, sd_card, sd_write,
+          sec_mi2s, smb_int, ssbi_wtr0, ssbi_wtr1, uim1, uim2, uim3,
+          uim_batt, wcss_bt, wcss_fm, wcss_wlan, webcam1_rst ]
+
+      drive-strength:
+        enum: [2, 4, 6, 8, 10, 12, 14, 16]
+        default: 2
+        description:
+          Selects the drive strength for the specified pins, in mA.
+
+      bias-pull-down:
+        type: boolean
+        description: The specified pin should be configured as pull down.
+
+      bias-pull-up:
+        type: boolean
+        description: The specified pin should be configured as pull up.
+
+      bias-disable:
+        type: boolean
+        description: The specified pin should be configured as no pull.
+
+      output-high:
+        type: boolean
+        description: The specified pin is configured in output mode, driven
+          high.
+
+      output-low:
+        type: boolean
+        description: The specified pin is configured in output mode, driven
+          low.
+
+    required:
+      - pins
+      - function
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-controller
+  - '#interrupt-cells'
+  - gpio-controller
+  - '#gpio-cells'
+  - gpio-ranges
+
+additionalProperties: false
+
+examples:
+  - |
+        #include <dt-bindings/interrupt-controller/arm-gic.h>
+        tlmm: pinctrl@1000000 {
+              compatible = "qcom,ipq6018-pinctrl";
+              reg = <0x01000000 0x300000>;
+              interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
+              interrupt-controller;
+              #interrupt-cells = <2>;
+              gpio-controller;
+              #gpio-cells = <2>;
+              gpio-ranges = <&tlmm 0 80>;
+
+              serial3-pinmux {
+                      pins = "gpio44", "gpio45";
+                      function = "blsp2_uart";
+                      drive-strength = <8>;
+                      bias-pull-down;
+              };
+        };
-- 
2.7.4
