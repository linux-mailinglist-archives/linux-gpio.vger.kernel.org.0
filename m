Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F06B125F68
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Dec 2019 11:43:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726776AbfLSKm5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Dec 2019 05:42:57 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:61144 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726793AbfLSKmx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 19 Dec 2019 05:42:53 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1576752173; h=References: In-Reply-To: Message-Id: Date:
 Subject: To: From: Sender;
 bh=6DacnwmMWPUD4nOv69Iq6uGJwHw/xzXzAqbMl6vb/Tk=; b=YcGa4mYXgfbvGx+zgGfp86N3REn0qLHbzNju90x7vmfeGp+8euw+e3aoMfITLt7bZA6Sy0E6
 z34gIO+A6lkiwObuMa1yDKM1spTWKKVw5vQUFpnchpIxnvF0R+fnZxjfM6lwRvHyzr7N3zN/
 gv3QjQTE6XwQF6bu7rjXa7BQDN4=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5dfb542c.7f8b255617d8-smtp-out-n02;
 Thu, 19 Dec 2019 10:42:52 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C8171C53805; Thu, 19 Dec 2019 10:42:51 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from srichara-linux.qualcomm.com (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sricharan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id BC234C53803;
        Thu, 19 Dec 2019 10:42:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org BC234C53803
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sricharan@codeaurora.org
From:   Sricharan R <sricharan@codeaurora.org>
To:     sricharan@codeaurora.org, agross@kernel.org,
        devicetree@vger.kernel.org, linus.walleij@linaro.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-soc@vger.kernel.org, robh+dt@kernel.org, sboyd@kernel.org,
        sivaprak@codeaurora.org
Subject: [PATCH V2 1/7] dt-bindings: pinctrl: qcom: Add ipq6018 pinctrl bindings
Date:   Thu, 19 Dec 2019 16:11:43 +0530
Message-Id: <1576752109-24497-2-git-send-email-sricharan@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1576752109-24497-1-git-send-email-sricharan@codeaurora.org>
References: <1576752109-24497-1-git-send-email-sricharan@codeaurora.org>
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

[V2] Splitted dt bindings and driver into different patches. Added missing bindings,
     and some style changes.

 .../bindings/pinctrl/qcom,ipq6018-pinctrl.yaml     | 172 +++++++++++++++++++++
 1 file changed, 172 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml
new file mode 100644
index 0000000..745a11e
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml
@@ -0,0 +1,172 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
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
+  reg:
+    maxItems: 1
+  interrupts:
+    Description: Specifies the TLMM summary IRQ
+    maxItems: 1
+  interrupt-controller: true
+  '#interrupt-cells':
+    Description:
+      Specifies the PIN numbers and Flags, as defined in defined in
+      include/dt-bindings/interrupt-controller/irq.h
+    const: 2
+  gpio-controller: true
+  '#gpio-cells':
+    Description: Specifying the pin number and flags, as defined in
+      include/dt-bindings/gpio/gpio.h
+    const: 2
+  gpio-ranges:
+    Description: Documentation/devicetree/bindings/gpio/gpio.txt
+    maxItems: 1
+
+#PIN CONFIGURATION NODES
+patternProperties:
+  '-pins$':
+    type: object
+    Description:
+      Pinctrl node's client devices use subnodes for desired pin configuration.
+      Client device subnodes use below standard properties.
+
+    Properties:
+      pins:
+        allOf:
+          $ref: /schemas/types.yaml#/definitions/string
+          enum:
+            gpio0-gpio80
+            sdc1_clk
+            sdc1_cmd
+            sdc1_data
+            sdc2_clk
+            sdc2_cmd
+            sdc2_data
+            qdsd_cmd
+            qdsd_data0
+            qdsd_data1
+            qdsd_data2
+            qdsd_data3
+        Description:
+          List of gpio pins affected by the properties specified in this
+          subnode.
+
+      function:
+        allOf:
+          $ref: /schemas/types.yaml#/definitions/string
+          enum:
+            adsp_ext, alsp_int, atest_bbrx0, atest_bbrx1, atest_char,
+            atest_char0, atest_char1, atest_char2, atest_char3, atest_combodac,
+            atest_gpsadc0, atest_gpsadc1, atest_tsens, atest_wlan0,
+            atest_wlan1, backlight_en, bimc_dte0, bimc_dte1, blsp_i2c1,
+            blsp_i2c2, blsp_i2c3, blsp_i2c4, blsp_i2c5, blsp_i2c6,  blsp_spi1,
+            blsp_spi1_cs1, blsp_spi1_cs2, blsp_spi1_cs3, blsp_spi2,
+            blsp_spi2_cs1, blsp_spi2_cs2, blsp_spi2_cs3, blsp_spi3,
+            blsp_spi3_cs1, blsp_spi3_cs2, blsp_spi3_cs3, blsp_spi4, blsp_spi5,
+            blsp_spi6, blsp_uart1, blsp_uart2, blsp_uim1, blsp_uim2, cam1_rst,
+            cam1_standby, cam_mclk0, cam_mclk1, cci_async, cci_i2c, cci_timer0,
+            cci_timer1, cci_timer2, cdc_pdm0, codec_mad, dbg_out, display_5v,
+            dmic0_clk, dmic0_data, dsi_rst, ebi0_wrcdc, euro_us, ext_lpass,
+            flash_strobe, gcc_gp1_clk_a, gcc_gp1_clk_b, gcc_gp2_clk_a,
+            gcc_gp2_clk_b, gcc_gp3_clk_a, gcc_gp3_clk_b, gpio, gsm0_tx0,
+            gsm0_tx1, gsm1_tx0, gsm1_tx1, gyro_accl, kpsns0, kpsns1, kpsns2,
+            ldo_en, ldo_update, mag_int, mdp_vsync, modem_tsync, m_voc,
+            nav_pps, nav_tsync, pa_indicator, pbs0, pbs1, pbs2, pri_mi2s,
+            pri_mi2s_ws, prng_rosc, pwr_crypto_enabled_a, pwr_crypto_enabled_b,
+            pwr_modem_enabled_a,  pwr_modem_enabled_b, pwr_nav_enabled_a,
+            pwr_nav_enabled_b, qdss_ctitrig_in_a0, qdss_ctitrig_in_a1,
+            qdss_ctitrig_in_b0, qdss_ctitrig_in_b1, qdss_ctitrig_out_a0,
+            qdss_ctitrig_out_a1, qdss_ctitrig_out_b0, qdss_ctitrig_out_b1,
+            qdss_traceclk_a, qdss_traceclk_b, qdss_tracectl_a, qdss_tracectl_b,
+            qdss_tracedata_a, qdss_tracedata_b, reset_n, sd_card, sd_write,
+            sec_mi2s, smb_int, ssbi_wtr0, ssbi_wtr1, uim1, uim2, uim3,
+            uim_batt, wcss_bt, wcss_fm, wcss_wlan, webcam1_rst
+        Description:
+          Specify the alternative function to be configured for the specified
+          pins.
+      bias-disable:
+        type: boolean
+        Description:
+          The specified pins should be configured as no pull.
+      bias-pull-down:
+        type: boolean
+        Description:
+          The specified pins should be configured as pull down.
+      bias-pull-up:
+        type: boolean
+        Description:
+          The specified pins should be configured as pull up.
+      output-high:
+        type: boolean
+        Description:
+          The specified pins are configured in output mode, driven high.
+          This option is not available for sdc pins.
+      output-low:
+        type: boolean
+        Description:
+          The specified pins are configured in output mode, driven low.
+          This option is not available for sdc pins.
+      drive-strength:
+        allOf:
+          $ref: /schemas/types.yaml#/definitions/uint32
+          enum: [2, 4, 6, 8, 10, 12, 14, 16]
+        Description:
+          elects the drive strength for the specified pins, in mA.
+
+    required:
+      - pins
+      - function
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
+example:
+        tlmm: pinctrl@1000000 {
+                compatible = "qcom,ipq6018-pinctrl";
+                reg = <0x1000000 0x300000>;
+                interrupts = <0 208 0>;
+                gpio-controller;
+                #gpio-cells = <2>;
+                interrupt-controller;
+                #interrupt-cells = <2>;
+
+                uart_pins: uart_pins {
+                        mux {
+                                pins = "gpio4", "gpio5";
+                                function = "blsp_uart2";
+                        };
+
+                        tx {
+                                pins = "gpio4";
+                                drive-strength = <4>;
+                                bias-disable;
+                        };
+
+                        rx {
+                                pins = "gpio5";
+                                drive-strength = <2>;
+                                bias-pull-up;
+                        };
+                };
+        };
-- 
1.9.1
