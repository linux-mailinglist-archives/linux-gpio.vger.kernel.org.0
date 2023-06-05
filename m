Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C21C4722BA1
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Jun 2023 17:43:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234933AbjFEPnn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Jun 2023 11:43:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234957AbjFEPn3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Jun 2023 11:43:29 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0544610C1;
        Mon,  5 Jun 2023 08:43:08 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-4f4bdcde899so6175968e87.0;
        Mon, 05 Jun 2023 08:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685979756; x=1688571756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jv1oCST/FdriOGFI1N1IVHHR2ZNi0foQxhRUlmKdpUs=;
        b=s0cFVI8dLFLetLChLAOL4W63AzmKAxVT0dYABUMJOjMMIy0Fh1sEHZe9le+stpHy1H
         y+WIWpQAYQ4o7db2mnhGF7/rg6Uq5UvZbGQ9lK3zS6GyKtLzzOEJmC4XdTuKD3WoxTm2
         ImZ4LyivAVUAQrekahwf5WlbYOryMGhmYofmcriNV/f73RRN9j/d3LjcNPIr22VJsNz3
         WfNr7x8oB8nWkWVGmq1nkwbbd7toNoR6HUNpuWAYHYIxUn+29dHyCDMXoBM1jBdlRO8/
         LTeEExbnjkiKiPmhQRLqXV5BeUcTy8wqOc3K+n7ZhrEm5DZ+UN+0nRN3RHVLPKpH85/c
         nicQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685979756; x=1688571756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jv1oCST/FdriOGFI1N1IVHHR2ZNi0foQxhRUlmKdpUs=;
        b=Yj0jTkqKSSoDe99Vj094Cbx04Z79hoGbLOy/E7n5pxYM2MT8koRey0pfG1cgfepGD4
         ck9qf68rxai+Kf0XCiuDdBuKfHsdb8LBjDntxU9/yrt9A8ODUOTzrR1Ln0Sc+Z9wjkdZ
         x/OB/3u88+W/6eDxudtqub//jFYayD0ZvM07tqcj1DJFEhi7nXNxicp4OaoQM1hANe7t
         axJo9vLqDSRYvLmQ3FqHDEvaW9Zv51erMsAIr9C+A24JSIY04CC45iVgvt1Baoo5QFX4
         WhuPRarjIHQkaqRXoFJG/395sjhOdSe34g6kMZdBXF+tqAWSMCjWZr41u4Wv1VOktQeP
         ArGA==
X-Gm-Message-State: AC+VfDwIQnDUtUmnugKydOQTkyHotNr796q/+8jekiKr7Ufqt19oJfCY
        h/A2I0hYJa7nbd/DkxJ82WA=
X-Google-Smtp-Source: ACHHUZ4d6IKQvrtdha9AylFDg0VCdebxIeK5TbQM+ATviVcH53Ply/ttffXAnPQBl87aPgsJPffSBA==
X-Received: by 2002:ac2:55a5:0:b0:4f3:8c0d:41c1 with SMTP id y5-20020ac255a5000000b004f38c0d41c1mr5511889lfg.64.1685979755932;
        Mon, 05 Jun 2023 08:42:35 -0700 (PDT)
Received: from localhost (p200300e41f305300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f30:5300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id r6-20020aa7da06000000b0051631130dc9sm4055725eds.54.2023.06.05.08.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jun 2023 08:42:35 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Prathamesh Shete <pshete@nvidia.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v5 1/3] dt-bindings: pinctrl: Document Tegra234 pin controllers
Date:   Mon,  5 Jun 2023 17:42:28 +0200
Message-Id: <20230605154230.2910847-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230605154230.2910847-1-thierry.reding@gmail.com>
References: <20230605154230.2910847-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Prathamesh Shete <pshete@nvidia.com>

Tegra234 contains two pin controllers. Document their compatible strings
and describe the list of pins and functions that they provide.

Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v5:
- add missing example for AON controller

Changes in v4:
- move "$ref" and "required" properties into more standard locations
- use "additionalProperties: true" for common bindings
- use unevaluatedProperties for specific bindings
- only allow valid per-SoC pin group properties
- drop unnecessary or duplicated properties

Changes in v3:
- split up into multiple files (suggested by Krzysztof)
- do not permit underscore in pinmux node names
- reword commit message

 .../pinctrl/nvidia,tegra234-pinmux-aon.yaml   |  78 ++++++++++
 .../nvidia,tegra234-pinmux-common.yaml        |  66 +++++++++
 .../pinctrl/nvidia,tegra234-pinmux.yaml       | 139 ++++++++++++++++++
 3 files changed, 283 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra234-pinmux-aon.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra234-pinmux-common.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra234-pinmux.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra234-pinmux-aon.yaml b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra234-pinmux-aon.yaml
new file mode 100644
index 000000000000..f3deda9f7127
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra234-pinmux-aon.yaml
@@ -0,0 +1,78 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/nvidia,tegra234-pinmux-aon.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra234 AON Pinmux Controller
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Jon Hunter <jonathanh@nvidia.com>
+
+$ref: nvidia,tegra234-pinmux-common.yaml
+
+properties:
+  compatible:
+    const: nvidia,tegra234-pinmux-aon
+
+patternProperties:
+  "^pinmux(-[a-z0-9-]+)?$":
+    type: object
+
+    # pin groups
+    additionalProperties:
+      properties:
+        nvidia,pins:
+          items:
+            enum: [ can0_dout_paa0, can0_din_paa1, can1_dout_paa2,
+                    can1_din_paa3, can0_stb_paa4, can0_en_paa5,
+                    soc_gpio49_paa6, can0_err_paa7, can1_stb_pbb0,
+                    can1_en_pbb1, soc_gpio50_pbb2, can1_err_pbb3,
+                    spi2_sck_pcc0, spi2_miso_pcc1, spi2_mosi_pcc2,
+                    spi2_cs0_pcc3, touch_clk_pcc4, uart3_tx_pcc5,
+                    uart3_rx_pcc6, gen2_i2c_scl_pcc7, gen2_i2c_sda_pdd0,
+                    gen8_i2c_scl_pdd1, gen8_i2c_sda_pdd2,
+                    sce_error_pee0, vcomp_alert_pee1,
+                    ao_retention_n_pee2, batt_oc_pee3, power_on_pee4,
+                    soc_gpio26_pee5, soc_gpio27_pee6, bootv_ctl_n_pee7,
+                    hdmi_cec_pgg0,
+                    # drive groups
+                    drive_touch_clk_pcc4, drive_uart3_rx_pcc6,
+                    drive_uart3_tx_pcc5, drive_gen8_i2c_sda_pdd2,
+                    drive_gen8_i2c_scl_pdd1, drive_spi2_mosi_pcc2,
+                    drive_gen2_i2c_scl_pcc7, drive_spi2_cs0_pcc3,
+                    drive_gen2_i2c_sda_pdd0, drive_spi2_sck_pcc0,
+                    drive_spi2_miso_pcc1, drive_can1_dout_paa2,
+                    drive_can1_din_paa3, drive_can0_dout_paa0,
+                    drive_can0_din_paa1, drive_can0_stb_paa4,
+                    drive_can0_en_paa5, drive_soc_gpio49_paa6,
+                    drive_can0_err_paa7, drive_can1_stb_pbb0,
+                    drive_can1_en_pbb1, drive_soc_gpio50_pbb2,
+                    drive_can1_err_pbb3, drive_sce_error_pee0,
+                    drive_batt_oc_pee3, drive_bootv_ctl_n_pee7,
+                    drive_power_on_pee4, drive_soc_gpio26_pee5,
+                    drive_soc_gpio27_pee6, drive_ao_retention_n_pee2,
+                    drive_vcomp_alert_pee1, drive_hdmi_cec_pgg0 ]
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/pinctrl/pinctrl-tegra.h>
+
+    pinmux@c300000 {
+      compatible = "nvidia,tegra234-pinmux-aon";
+      reg = <0xc300000 0x4000>;
+
+      pinctrl-names = "cec";
+      pinctrl-0 = <&cec_state>;
+
+      cec_state: pinmux-cec {
+        cec {
+          nvidia,pins = "hdmi_cec_pgg0";
+          nvidia,function = "gp";
+        };
+      };
+    };
+...
diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra234-pinmux-common.yaml b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra234-pinmux-common.yaml
new file mode 100644
index 000000000000..4f9de78085e5
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra234-pinmux-common.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/nvidia,tegra234-pinmux-common.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra234 Pinmux Controller
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Jon Hunter <jonathanh@nvidia.com>
+
+properties:
+  reg:
+    items:
+      - description: pinmux registers
+
+patternProperties:
+  "^pinmux(-[a-z0-9-]+)?$":
+    type: object
+
+    # pin groups
+    additionalProperties:
+      $ref: nvidia,tegra-pinmux-common.yaml
+      # We would typically use unevaluatedProperties here but that has the
+      # downside that all the properties in the common bindings become valid
+      # for all chip generations. In this case, however, we want the per-SoC
+      # bindings to be able to override which of the common properties are
+      # allowed, since not all pinmux generations support the same sets of
+      # properties. This way, the common bindings define the format of the
+      # properties but the per-SoC bindings define which of them apply to a
+      # given chip.
+      additionalProperties: false
+      properties:
+        nvidia,function:
+          enum: [ gp, uartc, i2c8, spi2, i2c2, can1, can0, rsvd0, eth0, eth2,
+                  eth1, dp, eth3, i2c4, i2c7, i2c9, eqos, pe2, pe1, pe0, pe3,
+                  pe4, pe5, pe6, pe7, pe8, pe9, pe10, qspi0, qspi1, qpsi,
+                  sdmmc1, sce, soc, gpio, hdmi, ufs0, spi3, spi1, uartb, uarte,
+                  usb, extperiph2, extperiph1, i2c3, vi0, i2c5, uarta, uartd,
+                  i2c1, i2s4, i2s6, aud, spi5, touch, uartj, rsvd1, wdt, tsc,
+                  dmic3, led, vi0_alt, i2s5, nv, extperiph3, extperiph4, spi4,
+                  ccla, i2s1, i2s2, i2s3, i2s8, rsvd2, dmic5, dca, displayb,
+                  displaya, vi1, dcb, dmic1, dmic4, i2s7, dmic2, dspk0, rsvd3,
+                  tsc_alt, istctrl, vi1_alt, dspk1, igpu ]
+
+        # out of the common properties, only these are allowed for Tegra234
+        nvidia,pins: true
+        nvidia,pull: true
+        nvidia,tristate: true
+        nvidia,schmitt: true
+        nvidia,enable-input: true
+        nvidia,open-drain: true
+        nvidia,lock: true
+        nvidia,drive-type: true
+        nvidia,io-hv: true
+
+      required:
+        - nvidia,pins
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: true
+...
diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra234-pinmux.yaml b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra234-pinmux.yaml
new file mode 100644
index 000000000000..17b865ecfcda
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra234-pinmux.yaml
@@ -0,0 +1,139 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/nvidia,tegra234-pinmux.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra234 Pinmux Controller
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Jon Hunter <jonathanh@nvidia.com>
+
+$ref: nvidia,tegra234-pinmux-common.yaml
+
+properties:
+  compatible:
+    const: nvidia,tegra234-pinmux
+
+patternProperties:
+  "^pinmux(-[a-z0-9-]+)?$":
+    type: object
+
+    # pin groups
+    additionalProperties:
+      properties:
+        nvidia,pins:
+          items:
+            enum: [ dap6_sclk_pa0, dap6_dout_pa1, dap6_din_pa2,
+                    dap6_fs_pa3, dap4_sclk_pa4, dap4_dout_pa5,
+                    dap4_din_pa6, dap4_fs_pa7, soc_gpio08_pb0,
+                    qspi0_sck_pc0, qspi0_cs_n_pc1,
+                    qspi0_io0_pc2, qspi0_io1_pc3, qspi0_io2_pc4,
+                    qspi0_io3_pc5, qspi1_sck_pc6, qspi1_cs_n_pc7,
+                    qspi1_io0_pd0, qspi1_io1_pd1, qspi1_io2_pd2,
+                    qspi1_io3_pd3, eqos_txc_pe0, eqos_td0_pe1,
+                    eqos_td1_pe2, eqos_td2_pe3, eqos_td3_pe4,
+                    eqos_tx_ctl_pe5, eqos_rd0_pe6, eqos_rd1_pe7,
+                    eqos_rd2_pf0, eqos_rd3_pf1, eqos_rx_ctl_pf2,
+                    eqos_rxc_pf3, eqos_sma_mdio_pf4, eqos_sma_mdc_pf5,
+                    soc_gpio13_pg0, soc_gpio14_pg1, soc_gpio15_pg2,
+                    soc_gpio16_pg3, soc_gpio17_pg4, soc_gpio18_pg5,
+                    soc_gpio19_pg6, soc_gpio20_pg7, soc_gpio21_ph0,
+                    soc_gpio22_ph1, soc_gpio06_ph2, uart4_tx_ph3,
+                    uart4_rx_ph4, uart4_rts_ph5, uart4_cts_ph6,
+                    soc_gpio41_ph7, soc_gpio42_pi0, soc_gpio43_pi1,
+                    soc_gpio44_pi2, gen1_i2c_scl_pi3, gen1_i2c_sda_pi4,
+                    cpu_pwr_req_pi5, soc_gpio07_pi6,
+                    sdmmc1_clk_pj0, sdmmc1_cmd_pj1, sdmmc1_dat0_pj2,
+                    sdmmc1_dat1_pj3, sdmmc1_dat2_pj4, sdmmc1_dat3_pj5,
+                    pex_l0_clkreq_n_pk0, pex_l0_rst_n_pk1,
+                    pex_l1_clkreq_n_pk2, pex_l1_rst_n_pk3,
+                    pex_l2_clkreq_n_pk4, pex_l2_rst_n_pk5,
+                    pex_l3_clkreq_n_pk6, pex_l3_rst_n_pk7,
+                    pex_l4_clkreq_n_pl0, pex_l4_rst_n_pl1,
+                    pex_wake_n_pl2, soc_gpio34_pl3, dp_aux_ch0_hpd_pm0,
+                    dp_aux_ch1_hpd_pm1, dp_aux_ch2_hpd_pm2,
+                    dp_aux_ch3_hpd_pm3, soc_gpio55_pm4, soc_gpio36_pm5,
+                    soc_gpio53_pm6, soc_gpio38_pm7, dp_aux_ch3_n_pn0,
+                    soc_gpio39_pn1, soc_gpio40_pn2, dp_aux_ch1_p_pn3,
+                    dp_aux_ch1_n_pn4, dp_aux_ch2_p_pn5, dp_aux_ch2_n_pn6,
+                    dp_aux_ch3_p_pn7, extperiph1_clk_pp0,
+                    extperiph2_clk_pp1, cam_i2c_scl_pp2, cam_i2c_sda_pp3,
+                    soc_gpio23_pp4, soc_gpio24_pp5, soc_gpio25_pp6,
+                    pwr_i2c_scl_pp7, pwr_i2c_sda_pq0, soc_gpio28_pq1,
+                    soc_gpio29_pq2, soc_gpio30_pq3, soc_gpio31_pq4,
+                    soc_gpio32_pq5, soc_gpio33_pq6, soc_gpio35_pq7,
+                    soc_gpio37_pr0, soc_gpio56_pr1, uart1_tx_pr2,
+                    uart1_rx_pr3, uart1_rts_pr4, uart1_cts_pr5,
+                    soc_gpio61_pw0, soc_gpio62_pw1, gpu_pwr_req_px0,
+                    cv_pwr_req_px1, gp_pwm2_px2, gp_pwm3_px3, uart2_tx_px4,
+                    uart2_rx_px5, uart2_rts_px6, uart2_cts_px7, spi3_sck_py0,
+                    spi3_miso_py1, spi3_mosi_py2, spi3_cs0_py3,
+                    spi3_cs1_py4, uart5_tx_py5, uart5_rx_py6,
+                    uart5_rts_py7, uart5_cts_pz0, usb_vbus_en0_pz1,
+                    usb_vbus_en1_pz2, spi1_sck_pz3, spi1_miso_pz4,
+                    spi1_mosi_pz5, spi1_cs0_pz6, spi1_cs1_pz7,
+                    spi5_sck_pac0, spi5_miso_pac1, spi5_mosi_pac2,
+                    spi5_cs0_pac3, soc_gpio57_pac4, soc_gpio58_pac5,
+                    soc_gpio59_pac6, soc_gpio60_pac7, soc_gpio45_pad0,
+                    soc_gpio46_pad1, soc_gpio47_pad2, soc_gpio48_pad3,
+                    ufs0_ref_clk_pae0, ufs0_rst_n_pae1,
+                    pex_l5_clkreq_n_paf0, pex_l5_rst_n_paf1,
+                    pex_l6_clkreq_n_paf2, pex_l6_rst_n_paf3,
+                    pex_l7_clkreq_n_pag0, pex_l7_rst_n_pag1,
+                    pex_l8_clkreq_n_pag2, pex_l8_rst_n_pag3,
+                    pex_l9_clkreq_n_pag4, pex_l9_rst_n_pag5,
+                    pex_l10_clkreq_n_pag6, pex_l10_rst_n_pag7,
+                    sdmmc1_comp, eqos_comp, qspi_comp,
+                    # drive groups
+                    drive_soc_gpio08_pb0, drive_soc_gpio36_pm5,
+                    drive_soc_gpio53_pm6, drive_soc_gpio55_pm4,
+                    drive_soc_gpio38_pm7, drive_soc_gpio39_pn1,
+                    drive_soc_gpio40_pn2, drive_dp_aux_ch0_hpd_pm0,
+                    drive_dp_aux_ch1_hpd_pm1, drive_dp_aux_ch2_hpd_pm2,
+                    drive_dp_aux_ch3_hpd_pm3, drive_dp_aux_ch1_p_pn3,
+                    drive_dp_aux_ch1_n_pn4, drive_dp_aux_ch2_p_pn5,
+                    drive_dp_aux_ch2_n_pn6, drive_dp_aux_ch3_p_pn7,
+                    drive_dp_aux_ch3_n_pn0, drive_pex_l2_clkreq_n_pk4,
+                    drive_pex_wake_n_pl2, drive_pex_l1_clkreq_n_pk2,
+                    drive_pex_l1_rst_n_pk3, drive_pex_l0_clkreq_n_pk0,
+                    drive_pex_l0_rst_n_pk1, drive_pex_l2_rst_n_pk5,
+                    drive_pex_l3_clkreq_n_pk6, drive_pex_l3_rst_n_pk7,
+                    drive_pex_l4_clkreq_n_pl0, drive_pex_l4_rst_n_pl1,
+                    drive_soc_gpio34_pl3, drive_pex_l5_clkreq_n_paf0,
+                    drive_pex_l5_rst_n_paf1, drive_pex_l6_clkreq_n_paf2,
+                    drive_pex_l6_rst_n_paf3, drive_pex_l10_clkreq_n_pag6,
+                    drive_pex_l10_rst_n_pag7, drive_pex_l7_clkreq_n_pag0,
+                    drive_pex_l7_rst_n_pag1, drive_pex_l8_clkreq_n_pag2,
+                    drive_pex_l8_rst_n_pag3, drive_pex_l9_clkreq_n_pag4,
+                    drive_pex_l9_rst_n_pag5, drive_sdmmc1_clk_pj0,
+                    drive_sdmmc1_cmd_pj1, drive_sdmmc1_dat3_pj5,
+                    drive_sdmmc1_dat2_pj4, drive_sdmmc1_dat1_pj3,
+                    drive_sdmmc1_dat0_pj2 ]
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/pinctrl/pinctrl-tegra.h>
+
+    pinmux@2430000 {
+        compatible = "nvidia,tegra234-pinmux";
+        reg = <0x2430000 0x17000>;
+
+        pinctrl-names = "pex_rst";
+        pinctrl-0 = <&pex_rst_c5_out_state>;
+
+        pex_rst_c5_out_state: pinmux-pex-rst-c5-out {
+            pexrst {
+                nvidia,pins = "pex_l5_rst_n_paf1";
+                nvidia,schmitt = <TEGRA_PIN_DISABLE>;
+                nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+                nvidia,io-hv = <TEGRA_PIN_ENABLE>;
+                nvidia,tristate = <TEGRA_PIN_DISABLE>;
+                nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+            };
+        };
+    };
+...
-- 
2.40.1

