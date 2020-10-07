Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D28D2863DA
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Oct 2020 18:26:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727278AbgJGQ0v (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 7 Oct 2020 12:26:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726138AbgJGQ0u (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Oct 2020 12:26:50 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47422C0613D2;
        Wed,  7 Oct 2020 09:26:50 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id w11so3006034lfn.2;
        Wed, 07 Oct 2020 09:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=J+F0JpZLJDKUddU6smtOvR/xfwugAr1sQCaGzcxcqqQ=;
        b=kdY4HlVqRt6XN7VaK+xlyt58vS7Dr2sntyeo3T0BeXYe0cKPcalSRoo7uXQmM/Jf3P
         9kAEYI7BbI8fIrGzs2CwpTtlVWaMVp/maKirqYcBxwuZ9osoNv9pQTuHewNbywx+5sFE
         t8CQqd0GZKEvq0+W5lpwGP1NRWwglxmE0tkRHcNFKbJ7xDH5LRmdxyBF8OiVh4Fiqvlf
         PbkIso9S3MnPyWlCB3DFoNsvJi61YfLzvX7vXvWOFnu621eBbJQp5YhJqQSJebOsyRm+
         xc/1sVr/zz+O1DrcFI2eWguCcAidEOA6uvVx/Bm0yu7dT2w+n1TchO9VGclN15Vuovlg
         nTHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=J+F0JpZLJDKUddU6smtOvR/xfwugAr1sQCaGzcxcqqQ=;
        b=Wtq12dVnQwQpdYSMZq9mskR5+L1bMxy7WASs3SABP6i5JC5kRaKbi7D7mZT6NMwv4B
         hqLRmmfettD8Peh3ftevRDC6Tvp+9g+6GF7wbfWDLSOk5mpPiKiFTqi0BwI4+I1I/JNo
         6dEaYYJenT5sdD29z2PqS7EGZMLym4KdmGf9aDcKiqHKCHhaXM0MxGbfPGVeeMYdl6J/
         KeguoII5q+SAOQn2eE6xntPtmYQhJNCHEKoQgEojFrz9KvUfYET3nXyqqz2p1t2D1Rf+
         8KMnOzEjuo2n6fO5ev/l/H8Rk1vmQioFY1F0s6MWVO7OoQNkhVxnM+kTd+9QMTAAciQT
         FbJw==
X-Gm-Message-State: AOAM531Zbt29oVVtDMcxWdgiYwgAwgbfSDrt/niLr8GsygQGhfJhCOJD
        +M0FR4cRqq/jbPYxMV21fTw=
X-Google-Smtp-Source: ABdhPJwEeoINbAcxQ9yDrsIseRzOedKtmnV+i7y7swcWY4AsuPgo0S9G/K6zEGiwuA1mITmKit4Mjw==
X-Received: by 2002:a19:f612:: with SMTP id x18mr1383329lfe.204.1602088008595;
        Wed, 07 Oct 2020 09:26:48 -0700 (PDT)
Received: from localhost.localdomain (host-5-58-109-138.bitternet.ua. [5.58.109.138])
        by smtp.gmail.com with ESMTPSA id n4sm400617lfe.246.2020.10.07.09.26.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2020 09:26:48 -0700 (PDT)
From:   Vladimir Lypak <junak.pub@gmail.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Vladimir Lypak <junak.pub@gmail.com>
Subject: [PATCH v2 2/2] dt-bindings: pinctrl: qcom: add msm8953 pinctrl bindings
Date:   Wed,  7 Oct 2020 19:06:12 +0300
Message-Id: <20201007160611.942754-2-junak.pub@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201007160611.942754-1-junak.pub@gmail.com>
References: <20201007160611.942754-1-junak.pub@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add device tree bindings documentation for Qualcomm MSM8953
pinctrl driver.

Signed-off-by: Vladimir Lypak <junak.pub@gmail.com>
---
Changes in V2:
 - removed "wakeup-parent" property.
 - changed pincfg property pattern to '-pins$' and added its description.
 - added "serial-pins" subnode to example.
---
 .../pinctrl/qcom,msm8953-pinctrl.yaml         | 167 ++++++++++++++++++
 1 file changed, 167 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,msm8953-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,msm8953-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,msm8953-pinctrl.yaml
new file mode 100644
index 000000000000..abe9f4c9b1e3
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,msm8953-pinctrl.yaml
@@ -0,0 +1,167 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/qcom,msm8953-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies, Inc. MSM8953 TLMM block
+
+maintainers:
+  - Bjorn Andersson <bjorn.andersson@linaro.org>
+
+description: |
+  This binding describes the Top Level Mode Multiplexer block found in the
+  MSM8953 platform.
+
+properties:
+  compatible:
+    const: qcom,msm8953-pinctrl
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
+    maxItems: 1
+
+#PIN CONFIGURATION NODES
+patternProperties:
+  '-pins$':
+    type: object
+    description:
+      Pinctrl node's client devices use subnodes for desired pin configuration.
+      Client device subnodes use below standard properties.
+    $ref: "/schemas/pinctrl/pincfg-node.yaml"
+
+    properties:
+      pins:
+        description:
+          List of gpio pins affected by the properties specified in this
+          subnode.
+        items:
+          oneOf:
+            - pattern: "^gpio([0-9]|[1-9][0-9]|1[0-7][0-9])$"
+            - enum: [ sdc1_clk, sdc1_cmd, sdc1_data, sdc1_rclk, sdc2_clk,
+                      sdc2_cmd, sdc2_data, qdsd_clk, qdsd_cmd, qdsd_data0,
+                      qdsd_data1, qdsd_data2, qdsd_data3 ]
+        minItems: 1
+        maxItems: 16
+
+      function:
+        description:
+          Specify the alternative function to be configured for the specified
+          pins.
+
+        enum: [ accel_int, adsp_ext, alsp_int, atest_bbrx0, atest_bbrx1,
+                atest_char, atest_char0, atest_char1, atest_char2, atest_char3,
+                atest_gpsadc_dtest0_native, atest_gpsadc_dtest1_native, atest_tsens,
+                atest_wlan0, atest_wlan1, bimc_dte0, bimc_dte1, blsp1_spi,
+                blsp3_spi, blsp6_spi, blsp7_spi, blsp_i2c1, blsp_i2c2, blsp_i2c3,
+                blsp_i2c4, blsp_i2c5, blsp_i2c6, blsp_i2c7, blsp_i2c8, blsp_spi1,
+                blsp_spi2, blsp_spi3, blsp_spi4, blsp_spi5, blsp_spi6, blsp_spi7,
+                blsp_spi8, blsp_uart2, blsp_uart4, blsp_uart5, blsp_uart6, cam0_ldo,
+                cam1_ldo, cam1_rst, cam1_standby, cam2_rst, cam2_standby, cam3_rst,
+                cam3_standby, cam_irq, cam_mclk, cap_int, cci_async, cci_i2c,
+                cci_timer0, cci_timer1, cci_timer2, cci_timer3, cci_timer4,
+                cdc_pdm0, codec_int1, codec_int2, codec_reset, cri_trng, cri_trng0,
+                cri_trng1, dac_calib0, dac_calib1, dac_calib10, dac_calib11,
+                dac_calib12, dac_calib13, dac_calib14, dac_calib15, dac_calib16,
+                dac_calib17, dac_calib18, dac_calib19, dac_calib2, dac_calib20,
+                dac_calib21, dac_calib22, dac_calib23, dac_calib24, dac_calib25,
+                dac_calib3, dac_calib4, dac_calib5, dac_calib6, dac_calib7,
+                dac_calib8, dac_calib9, dbg_out, ddr_bist, dmic0_clk, dmic0_data,
+                ebi_cdc, ebi_ch0, ext_lpass, flash_strobe, fp_int, gcc_gp1_clk_a,
+                gcc_gp1_clk_b, gcc_gp2_clk_a, gcc_gp2_clk_b, gcc_gp3_clk_a,
+                gcc_gp3_clk_b, gcc_plltest, gcc_tlmm, gpio, gsm0_tx, gsm1_tx,
+                gyro_int, hall_int, hdmi_int, key_focus, key_home, key_snapshot,
+                key_volp, ldo_en, ldo_update, lpass_slimbus, lpass_slimbus0,
+                lpass_slimbus1, m_voc, mag_int, mdp_vsync, mipi_dsi0, modem_tsync,
+                mss_lte, nav_pps, nav_pps_in_a, nav_pps_in_b, nav_tsync,
+                nfc_disable, nfc_dwl, nfc_irq, ois_sync, pa_indicator, pbs0, pbs1,
+                pbs2, pressure_int, pri_mi2s, pri_mi2s_mclk_a, pri_mi2s_mclk_b,
+                pri_mi2s_ws, prng_rosc, pwr_crypto_enabled_a, pwr_crypto_enabled_b,
+                pwr_down, pwr_modem_enabled_a, pwr_modem_enabled_b,
+                pwr_nav_enabled_a, pwr_nav_enabled_b, qdss_cti_trig_in_a0,
+                qdss_cti_trig_in_a1, qdss_cti_trig_in_b0, qdss_cti_trig_in_b1,
+                qdss_cti_trig_out_a0, qdss_cti_trig_out_a1, qdss_cti_trig_out_b0,
+                qdss_cti_trig_out_b1, qdss_traceclk_a, qdss_traceclk_b,
+                qdss_tracectl_a, qdss_tracectl_b, qdss_tracedata_a,
+                qdss_tracedata_b, sd_write, sdcard_det, sec_mi2s, sec_mi2s_mclk_a,
+                sec_mi2s_mclk_b, smb_int, ss_switch, ssbi_wtr1, ts_resout,
+                ts_sample, ts_xvdd, tsens_max, uim1_clk, uim1_data, uim1_present,
+                uim1_reset, uim2_clk, uim2_data, uim2_present, uim2_reset,
+                uim_batt, us_emitter, us_euro, wcss_bt, wcss_fm, wcss_wlan,
+                wcss_wlan0, wcss_wlan1, wcss_wlan2, wsa_en, wsa_io, wsa_irq ]
+
+      drive-strength:
+        enum: [2, 4, 6, 8, 10, 12, 14, 16]
+        default: 2
+        description:
+          Selects the drive strength for the specified pins, in mA.
+
+      bias-pull-down: true
+
+      bias-pull-up: true
+
+      bias-disable: true
+
+      output-high: true
+
+      output-low: true
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
+              compatible = "qcom,msm8953-pinctrl";
+              reg = <0x01000000 0x300000>;
+              interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
+              interrupt-controller;
+              #interrupt-cells = <2>;
+              gpio-controller;
+              #gpio-cells = <2>;
+              gpio-ranges = <&tlmm 0 0 142>;
+
+              serial_default: serial-pins {
+                    pins = "gpio4", "gpio5";
+                    function = "blsp_uart2";
+                    drive-strength = <2>;
+                    bias-disable;
+              };
+        };
-- 
2.28.0

