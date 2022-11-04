Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 08A5E6199B7
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Nov 2022 15:26:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230496AbiKDO0h (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 4 Nov 2022 10:26:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230405AbiKDOZs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Nov 2022 10:25:48 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA4612CDE1;
        Fri,  4 Nov 2022 07:23:54 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id 13so13732401ejn.3;
        Fri, 04 Nov 2022 07:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qss38c2gZbvCdnKfCy/8PNRTYStqggtGB2FqjFiNJo0=;
        b=Ou0tkVLgtESE7YSxTiTQR5sGnGLd9v6Ep3pZdtwzmTYIfB3HVcmzFqWgXq4kCy90rD
         wIpfmhT2WXd8/mNxXmmjMmOc7D8STmZs5l6tdWQdtDKDkzNKbl8w0YWsaNatJlz1eCcm
         IyT67BHZCSPEBCYSKN5svs5SvgSiFu8GL2Vm/rHn7qL3+//GsaV6ejTwF2uV26AYa1kU
         ES8ABn2tBemr+n+niYkd1IWdDmay3joNS+3sKWoZTgEepyT2MBhIpnvZdI4Mwenrsuss
         d3mVyZ//6l7TZZotNmx6OK/RrWF6jX7dCKQQ0xUuiyjvUSuNzu7Kp2yLKXRZVrtywVNx
         tjpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qss38c2gZbvCdnKfCy/8PNRTYStqggtGB2FqjFiNJo0=;
        b=jTlfoXOlKTgYnPtQU0kFxVNbf/PdaVx9vfmLSPVozzYDpRnBLDRJtsxdCkf3gHgwlo
         0Fq3ryRbdr62RGDaNEKB0mnvxz3w2Uo2S2avYj6vkG2RdaX+c3UfCWFVi+p5SJasFP1q
         fH1BnYG8qLBpPUWWYj6A9W2mezPdmjVOFdVgVHdQ16isAFhtrAf3RI6MbZR2iorjVXKv
         +YzAHGkPJ1VvjT7AqajXXNZqoFwGqnYjQaajQYqBSkG1v6KNnrxHC6FFs9hHoFhXOFHT
         uzha8S+uuEMEVvhvNsbqZY6zk8LDFGHuAtsxA2+/ZGNuYIjLpWRIbQ25ptHxL6hFIyI1
         cYCQ==
X-Gm-Message-State: ACrzQf0kp0qXvIlfF2FGk/ibYjGinHoD+jj7p+CH1kjg+xHwBmpd9Zt3
        Iq8jv3FL7SKXUwGNh6M0x9A=
X-Google-Smtp-Source: AMsMyM6PE81aC0ocZ0mJbjtYgpY1o+84Apj6I0uR3zdfk3h5prshLbiehMaAhwkJOohiuEpG8mJ8Lw==
X-Received: by 2002:a17:906:9fc1:b0:761:9192:504f with SMTP id hj1-20020a1709069fc100b007619192504fmr34959731ejc.116.1667571833359;
        Fri, 04 Nov 2022 07:23:53 -0700 (PDT)
Received: from localhost (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id g3-20020a1709061c8300b007a4e02e32ffsm1880223ejh.60.2022.11.04.07.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Nov 2022 07:23:52 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Prathamesh Shete <pshete@nvidia.com>,
        Vidya Sagar <vidyas@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [PATCH v3 2/4] dt-bindings: pinctrl: tegra194: Separate instances
Date:   Fri,  4 Nov 2022 15:23:43 +0100
Message-Id: <20221104142345.1562750-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221104142345.1562750-1-thierry.reding@gmail.com>
References: <20221104142345.1562750-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Tegra194 has two separate instances of the pin controller, one called
AON (in the always-on domain) and another called "main". Instead of
treating them as a single pin controller, split them up into two
separate controllers. Doing so allows the mapping between the pinmux and
GPIO controllers to be trivial identity mappings and more cleanly
separates the AON from the main IP blocks.

Note that while this changes the DT node in an incompatible way, this
doesn't have any practical implications for backwards-compatibility. The
reason for this is that device trees have only reconfigured a very
narrow subset of pins of the main controller, so the new driver will
remain backwards-compatible with old device trees.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v3:
- update for common bindings restructure

Changes in v2:
- add missing "type: object" to patternProperties nodes
- add note about backwards-compatibility

 .../pinctrl/nvidia,tegra194-pinmux.yaml       | 235 ++++++++++++++++--
 1 file changed, 215 insertions(+), 20 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra194-pinmux.yaml b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra194-pinmux.yaml
index 5e0c0bc99001..60a4bdf01bf2 100644
--- a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra194-pinmux.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra194-pinmux.yaml
@@ -1,4 +1,4 @@
-# SPDX-License-Identifier: (GPL-2.0+ OR BSD-2-Clause)
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
 $id: http://devicetree.org/schemas/pinctrl/nvidia,tegra194-pinmux.yaml#
@@ -12,12 +12,13 @@ maintainers:
 
 properties:
   compatible:
-    const: nvidia,tegra194-pinmux
+    enum:
+      - nvidia,tegra194-pinmux
+      - nvidia,tegra194-pinmux-aon
 
   reg:
     items:
-      - description: APB_MISC_GP_*_PADCTRL registers (pad control)
-      - description: PINMUX_AUX_* registers (pinmux)
+      - description: pinmux registers
 
 patternProperties:
   "^pinmux(-[a-z0-9-_]+)?$":
@@ -28,22 +29,19 @@ patternProperties:
     # pin groups
     additionalProperties:
       $ref: nvidia,tegra-pinmux-common.yaml
-      additionalProperties: false
+      unevaluatedProperties: false
       properties:
-        nvidia,pins:
-          description: An array of strings. Each string contains the name of a
-            pin or group. Valid values for these names are listed below.
-
-            Note that the pex_l5_clkreq_n_pgg0 and pex_l5_rst_n_pgg1 pins are
-            part of PCIE C5 power partition. Client devices must enable this
-            partition before accessing the configuration for these pins.
-          items:
-            enum: [ pex_l5_clkreq_n_pgg0, pex_l5_rst_n_pgg1,
-                    # drive groups
-                    drive_pex_l5_clkreq_n_pgg0, drive_pex_l5_rst_n_pgg1 ]
-
         nvidia,function:
-          enum: [ pe5 ]
+          enum: [ aud, can0, can1, ccla, dca, dcb, dgpu, directdc, directdc1,
+                  displaya, displayb, dmic1, dmic2, dmic3, dmic4, dmic5, dp,
+                  dspk0, dspk1, eqos, extperiph1, extperiph2, extperiph3,
+                  extperiph4, gp, gpio, hdmi, i2c1, i2c2, i2c3, i2c5, i2c8,
+                  i2s1, i2s2, i2s3, i2s4, i2s5, i2s6, igpu, iqc1, iqc2, mipi,
+                  nv, pe0, pe1, pe2, pe3, pe4, pe5, qspi, qspi0, qspi1, rsvd0,
+                  rsvd1, rsvd2, rsvd3, sata, sce, sdmmc1, sdmmc3, sdmmc4, slvs,
+                  soc, spdif, spi1, spi2, spi3, touch, uarta, uartb, uartc,
+                  uartd, uarte, uartg, ufs0, usb, vgp1, vgp2, vgp3, vgp4, vgp5,
+                  vgp6, wdt ]
 
         nvidia,pull: true
         nvidia,tristate: true
@@ -59,6 +57,204 @@ patternProperties:
 
 additionalProperties: false
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          const: nvidia,tegra194-pinmux
+    then:
+      patternProperties:
+        "^pinmux(-[a-z0-9-_]+)?$":
+          type: object
+          additionalProperties:
+            properties:
+              nvidia,pins:
+                description: An array of strings. Each string contains the name
+                  of a pin or group. Valid values for these names are listed
+                  below.
+
+                  Note that the pex_l5_clkreq_n_pgg0 and pex_l5_rst_n_pgg1 pins
+                  are part of PCIE C5 power partition. Client devices must
+                  enable this partition before accessing the configuration for
+                  these pins.
+                items:
+                  enum: [ dap6_sclk_pa0, dap6_dout_pa1, dap6_din_pa2,
+                          dap6_fs_pa3, dap4_sclk_pa4, dap4_dout_pa5,
+                          dap4_din_pa6, dap4_fs_pa7, cpu_pwr_req_0_pb0,
+                          cpu_pwr_req_1_pb1, qspi0_sck_pc0, qspi0_cs_n_pc1,
+                          qspi0_io0_pc2, qspi0_io1_pc3, qspi0_io2_pc4,
+                          qspi0_io3_pc5, qspi1_sck_pc6, qspi1_cs_n_pc7,
+                          qspi1_io0_pd0, qspi1_io1_pd1, qspi1_io2_pd2,
+                          qspi1_io3_pd3, eqos_txc_pe0, eqos_td0_pe1,
+                          eqos_td1_pe2, eqos_td2_pe3, eqos_td3_pe4,
+                          eqos_tx_ctl_pe5, eqos_rd0_pe6, eqos_rd1_pe7,
+                          eqos_rd2_pf0, eqos_rd3_pf1, eqos_rx_ctl_pf2,
+                          eqos_rxc_pf3, eqos_sma_mdio_pf4, eqos_sma_mdc_pf5,
+                          soc_gpio00_pg0, soc_gpio01_pg1, soc_gpio02_pg2,
+                          soc_gpio03_pg3, soc_gpio08_pg4, soc_gpio09_pg5,
+                          soc_gpio10_pg6, soc_gpio11_pg7, soc_gpio12_ph0,
+                          soc_gpio13_ph1, soc_gpio14_ph2, uart4_tx_ph3,
+                          uart4_rx_ph4, uart4_rts_ph5, uart4_cts_ph6,
+                          dap2_sclk_ph7, dap2_dout_pi0, dap2_din_pi1,
+                          dap2_fs_pi2, gen1_i2c_scl_pi3, gen1_i2c_sda_pi4,
+                          sdmmc1_clk_pj0, sdmmc1_cmd_pj1, sdmmc1_dat0_pj2,
+                          sdmmc1_dat1_pj3, sdmmc1_dat2_pj4, sdmmc1_dat3_pj5,
+                          pex_l0_clkreq_n_pk0, pex_l0_rst_n_pk1,
+                          pex_l1_clkreq_n_pk2, pex_l1_rst_n_pk3,
+                          pex_l2_clkreq_n_pk4, pex_l2_rst_n_pk5,
+                          pex_l3_clkreq_n_pk6, pex_l3_rst_n_pk7,
+                          pex_l4_clkreq_n_pl0, pex_l4_rst_n_pl1,
+                          pex_wake_n_pl2, sata_dev_slp_pl3, dp_aux_ch0_hpd_pm0,
+                          dp_aux_ch1_hpd_pm1, dp_aux_ch2_hpd_pm2,
+                          dp_aux_ch3_hpd_pm3, hdmi_cec_pm4, soc_gpio50_pm5,
+                          soc_gpio51_pm6, soc_gpio52_pm7, soc_gpio53_pn0,
+                          soc_gpio54_pn1, soc_gpio55_pn2, sdmmc3_clk_po0,
+                          sdmmc3_cmd_po1, sdmmc3_dat0_po2, sdmmc3_dat1_po3,
+                          sdmmc3_dat2_po4, sdmmc3_dat3_po5, extperiph1_clk_pp0,
+                          extperiph2_clk_pp1, cam_i2c_scl_pp2, cam_i2c_sda_pp3,
+                          soc_gpio04_pp4, soc_gpio05_pp5, soc_gpio06_pp6,
+                          soc_gpio07_pp7, soc_gpio20_pq0, soc_gpio21_pq1,
+                          soc_gpio22_pq2, soc_gpio23_pq3, soc_gpio40_pq4,
+                          soc_gpio41_pq5, soc_gpio42_pq6, soc_gpio43_pq7,
+                          soc_gpio44_pr0, soc_gpio45_pr1, uart1_tx_pr2,
+                          uart1_rx_pr3, uart1_rts_pr4, uart1_cts_pr5,
+                          dap1_sclk_ps0, dap1_dout_ps1, dap1_din_ps2,
+                          dap1_fs_ps3, aud_mclk_ps4, soc_gpio30_ps5,
+                          soc_gpio31_ps6, soc_gpio32_ps7, soc_gpio33_pt0,
+                          dap3_sclk_pt1, dap3_dout_pt2, dap3_din_pt3,
+                          dap3_fs_pt4, dap5_sclk_pt5, dap5_dout_pt6,
+                          dap5_din_pt7, dap5_fs_pu0, directdc1_clk_pv0,
+                          directdc1_in_pv1, directdc1_out0_pv2,
+                          directdc1_out1_pv3, directdc1_out2_pv4,
+                          directdc1_out3_pv5, directdc1_out4_pv6,
+                          directdc1_out5_pv7, directdc1_out6_pw0,
+                          directdc1_out7_pw1, gpu_pwr_req_px0, cv_pwr_req_px1,
+                          gp_pwm2_px2, gp_pwm3_px3, uart2_tx_px4, uart2_rx_px5,
+                          uart2_rts_px6, uart2_cts_px7, spi3_sck_py0,
+                          spi3_miso_py1, spi3_mosi_py2, spi3_cs0_py3,
+                          spi3_cs1_py4, uart5_tx_py5, uart5_rx_py6,
+                          uart5_rts_py7, uart5_cts_pz0, usb_vbus_en0_pz1,
+                          usb_vbus_en1_pz2, spi1_sck_pz3, spi1_miso_pz4,
+                          spi1_mosi_pz5, spi1_cs0_pz6, spi1_cs1_pz7,
+                          ufs0_ref_clk_pff0, ufs0_rst_pff1,
+                          pex_l5_clkreq_n_pgg0, pex_l5_rst_n_pgg1,
+                          directdc_comp, sdmmc4_clk, sdmmc4_cmd, sdmmc4_dqs,
+                          sdmmc4_dat7, sdmmc4_dat6, sdmmc4_dat5, sdmmc4_dat4,
+                          sdmmc4_dat3, sdmmc4_dat2, sdmmc4_dat1, sdmmc4_dat0,
+                          sdmmc1_comp, sdmmc1_hv_trim, sdmmc3_comp,
+                          sdmmc3_hv_trim, eqos_comp, qspi_comp,
+                          # drive groups
+                          drive_soc_gpio33_pt0, drive_soc_gpio32_ps7,
+                          drive_soc_gpio31_ps6, drive_soc_gpio30_ps5,
+                          drive_aud_mclk_ps4, drive_dap1_fs_ps3,
+                          drive_dap1_din_ps2, drive_dap1_dout_ps1,
+                          drive_dap1_sclk_ps0, drive_dap3_fs_pt4,
+                          drive_dap3_din_pt3, drive_dap3_dout_pt2,
+                          drive_dap3_sclk_pt1, drive_dap5_fs_pu0,
+                          drive_dap5_din_pt7, drive_dap5_dout_pt6,
+                          drive_dap5_sclk_pt5, drive_dap6_fs_pa3,
+                          drive_dap6_din_pa2, drive_dap6_dout_pa1,
+                          drive_dap6_sclk_pa0, drive_dap4_fs_pa7,
+                          drive_dap4_din_pa6, drive_dap4_dout_pa5,
+                          drive_dap4_sclk_pa4, drive_extperiph2_clk_pp1,
+                          drive_extperiph1_clk_pp0, drive_cam_i2c_sda_pp3,
+                          drive_cam_i2c_scl_pp2, drive_soc_gpio40_pq4,
+                          drive_soc_gpio41_pq5, drive_soc_gpio42_pq6,
+                          drive_soc_gpio43_pq7, drive_soc_gpio44_pr0,
+                          drive_soc_gpio45_pr1, drive_soc_gpio20_pq0,
+                          drive_soc_gpio21_pq1, drive_soc_gpio22_pq2,
+                          drive_soc_gpio23_pq3, drive_soc_gpio04_pp4,
+                          drive_soc_gpio05_pp5, drive_soc_gpio06_pp6,
+                          drive_soc_gpio07_pp7, drive_uart1_cts_pr5,
+                          drive_uart1_rts_pr4, drive_uart1_rx_pr3,
+                          drive_uart1_tx_pr2, drive_dap2_din_pi1,
+                          drive_dap2_dout_pi0, drive_dap2_fs_pi2,
+                          drive_dap2_sclk_ph7, drive_uart4_cts_ph6,
+                          drive_uart4_rts_ph5, drive_uart4_rx_ph4,
+                          drive_uart4_tx_ph3, drive_soc_gpio03_pg3,
+                          drive_soc_gpio02_pg2, drive_soc_gpio01_pg1,
+                          drive_soc_gpio00_pg0, drive_gen1_i2c_scl_pi3,
+                          drive_gen1_i2c_sda_pi4, drive_soc_gpio08_pg4,
+                          drive_soc_gpio09_pg5, drive_soc_gpio10_pg6,
+                          drive_soc_gpio11_pg7, drive_soc_gpio12_ph0,
+                          drive_soc_gpio13_ph1, drive_soc_gpio14_ph2,
+                          drive_soc_gpio50_pm5, drive_soc_gpio51_pm6,
+                          drive_soc_gpio52_pm7, drive_soc_gpio53_pn0,
+                          drive_soc_gpio54_pn1, drive_soc_gpio55_pn2,
+                          drive_dp_aux_ch0_hpd_pm0, drive_dp_aux_ch1_hpd_pm1,
+                          drive_dp_aux_ch2_hpd_pm2, drive_dp_aux_ch3_hpd_pm3,
+                          drive_hdmi_cec_pm4, drive_pex_l2_clkreq_n_pk4,
+                          drive_pex_wake_n_pl2, drive_pex_l1_clkreq_n_pk2,
+                          drive_pex_l1_rst_n_pk3, drive_pex_l0_clkreq_n_pk0,
+                          drive_pex_l0_rst_n_pk1, drive_pex_l2_rst_n_pk5,
+                          drive_pex_l3_clkreq_n_pk6, drive_pex_l3_rst_n_pk7,
+                          drive_pex_l4_clkreq_n_pl0, drive_pex_l4_rst_n_pl1,
+                          drive_sata_dev_slp_pl3, drive_pex_l5_clkreq_n_pgg0,
+                          drive_pex_l5_rst_n_pgg1, drive_cpu_pwr_req_1_pb1,
+                          drive_cpu_pwr_req_0_pb0, drive_sdmmc1_clk_pj0,
+                          drive_sdmmc1_cmd_pj1, drive_sdmmc1_dat3_pj5,
+                          drive_sdmmc1_dat2_pj4, drive_sdmmc1_dat1_pj3,
+                          drive_sdmmc1_dat0_pj2, drive_sdmmc3_dat3_po5,
+                          drive_sdmmc3_dat2_po4, drive_sdmmc3_dat1_po3,
+                          drive_sdmmc3_dat0_po2, drive_sdmmc3_cmd_po1,
+                          drive_sdmmc3_clk_po0, drive_gpu_pwr_req_px0,
+                          drive_spi3_miso_py1, drive_spi1_cs0_pz6,
+                          drive_spi3_cs0_py3, drive_spi1_miso_pz4,
+                          drive_spi3_cs1_py4, drive_gp_pwm3_px3,
+                          drive_gp_pwm2_px2, drive_spi1_sck_pz3,
+                          drive_spi3_sck_py0, drive_spi1_cs1_pz7,
+                          drive_spi1_mosi_pz5, drive_spi3_mosi_py2,
+                          drive_cv_pwr_req_px1, drive_uart2_tx_px4,
+                          drive_uart2_rx_px5, drive_uart2_rts_px6,
+                          drive_uart2_cts_px7, drive_uart5_rx_py6,
+                          drive_uart5_tx_py5, drive_uart5_rts_py7,
+                          drive_uart5_cts_pz0, drive_usb_vbus_en0_pz1,
+                          drive_usb_vbus_en1_pz2, drive_ufs0_rst_pff1,
+                          drive_ufs0_ref_clk_pff0 ]
+
+  - if:
+      properties:
+        compatible:
+          const: nvidia,tegra194-pinmux-aon
+    then:
+      patternProperties:
+        "^pinmux(-[a-z0-9-_]+)?$":
+          type: object
+          additionalProperties:
+            properties:
+              nvidia,pins:
+                items:
+                  enum: [ can1_dout_paa0, can1_din_paa1, can0_dout_paa2,
+                          can0_din_paa3, can0_stb_paa4, can0_en_paa5,
+                          can0_wake_paa6, can0_err_paa7, can1_stb_pbb0,
+                          can1_en_pbb1, can1_wake_pbb2, can1_err_pbb3,
+                          spi2_sck_pcc0, spi2_miso_pcc1, spi2_mosi_pcc2,
+                          spi2_cs0_pcc3, touch_clk_pcc4, uart3_tx_pcc5,
+                          uart3_rx_pcc6, gen2_i2c_scl_pcc7, gen2_i2c_sda_pdd0,
+                          gen8_i2c_scl_pdd1, gen8_i2c_sda_pdd2,
+                          safe_state_pee0, vcomp_alert_pee1,
+                          ao_retention_n_pee2, batt_oc_pee3, power_on_pee4,
+                          pwr_i2c_scl_pee5, pwr_i2c_sda_pee6, sys_reset_n,
+                          shutdown_n, pmu_int_n, soc_pwr_req, clk_32k_in,
+                          # drive groups
+                          drive_shutdown_n, drive_pmu_int_n,
+                          drive_safe_state_pee0, drive_vcomp_alert_pee1,
+                          drive_soc_pwr_req, drive_batt_oc_pee3,
+                          drive_clk_32k_in, drive_power_on_pee4,
+                          drive_pwr_i2c_scl_pee5, drive_pwr_i2c_sda_pee6,
+                          drive_ao_retention_n_pee2, drive_touch_clk_pcc4,
+                          drive_uart3_rx_pcc6, drive_uart3_tx_pcc5,
+                          drive_gen8_i2c_sda_pdd2, drive_gen8_i2c_scl_pdd1,
+                          drive_spi2_mosi_pcc2, drive_gen2_i2c_scl_pcc7,
+                          drive_spi2_cs0_pcc3, drive_gen2_i2c_sda_pdd0,
+                          drive_spi2_sck_pcc0, drive_spi2_miso_pcc1,
+                          drive_can1_dout_paa0, drive_can1_din_paa1,
+                          drive_can0_dout_paa2, drive_can0_din_paa3,
+                          drive_can0_stb_paa4, drive_can0_en_paa5,
+                          drive_can0_wake_paa6, drive_can0_err_paa7,
+                          drive_can1_stb_pbb0, drive_can1_en_pbb1,
+                          drive_can1_wake_pbb2, drive_can1_err_pbb3 ]
+
 required:
   - compatible
   - reg
@@ -69,8 +265,7 @@ examples:
 
     pinmux@2430000 {
         compatible = "nvidia,tegra194-pinmux";
-        reg = <0x2430000 0x17000>,
-              <0xc300000 0x04000>;
+        reg = <0x2430000 0x17000>;
 
         pinctrl-names = "pex_rst";
         pinctrl-0 = <&pex_rst_c5_out_state>;
-- 
2.38.1

