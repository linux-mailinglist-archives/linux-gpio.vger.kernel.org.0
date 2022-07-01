Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45878563686
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Jul 2022 17:05:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232398AbiGAPFQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 1 Jul 2022 11:05:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232706AbiGAPFP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Jul 2022 11:05:15 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57E4B218E;
        Fri,  1 Jul 2022 08:05:11 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id c65so3328849edf.4;
        Fri, 01 Jul 2022 08:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hYI571xjfcd6NTelaj/QsnuDLIMhuIqpHTfv15AXH5s=;
        b=Jn392BZeD2PWOlRhqcAphM3cXFdiLRI7Zb/YLphw2rQqt4P3/pfvvDrkXjMQt2I4IM
         PG+t0igQG7EpRVIyg/2vWtWaeJZfg2roiV/pW5DPyOYo94yYXJ4XZkqxELuvnTYEGaVw
         fwuI9dR0/PnHufPmpXAYlJQJ2AaQgvZqwXEWdGz9h4czk4v0F/3eZqM8I91Q0s3pZZaz
         /9hWU65ZQvftGrTFAqHNOiknFvR45d4WPLYAoHiS3WtMJ8vxgrxDkWbpIiyzB9y5Q5Vg
         hosCKFc7BW+pv45dLtDXnjLLbttgno+Y9pB5oB85EJIv7eVKs1cCe8UISV1mQzlyEc8A
         PHPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hYI571xjfcd6NTelaj/QsnuDLIMhuIqpHTfv15AXH5s=;
        b=Z7tMWkea2FasifH3awwgB2x9lF4Xk6DLE4wNVir/8Ow3V7BuTcs9ypYpPizeULuJfH
         bmhDof8uq5XZHT38RAfFXbPkMFHGXEQrFyNa8rDsSG5J6UwrFkeWysPQSqt5UQ/skDO8
         b/MMLfkDfPv6B9Z3NerfZvQdX68z3n0cqnZ2mixSbD4QOTtyFQKOsUBjE85l2Lkr1cE/
         C7kQvObSY3TWqQd1d8fmVUpvKrMuneqfry2kjDrgMumSpW8183wc/kTYzVa2Rx/Fxho3
         VWIESmm5yKL4qK8SF5477s1KXexZHxGly9Z6EtEekOq6BmMan0yV7gcy5+3eTqT68cy2
         dHjA==
X-Gm-Message-State: AJIora8+AgOJfnP0uMxIEI6s5oAJYtI5N1NKxYaZ1RKQU9KHVQ0fCRjZ
        PxnZCUo0MRJqIa0jnf8szcs=
X-Google-Smtp-Source: AGRyM1v7bLwk61vldDf6niGcq8DNNsNoIcbeIeuTUDMMQcI6T8SfKdCDjBH8GZqxU/hWHRSC8UKVFw==
X-Received: by 2002:a05:6402:32a2:b0:435:8b5a:4081 with SMTP id f34-20020a05640232a200b004358b5a4081mr19756689eda.232.1656687908234;
        Fri, 01 Jul 2022 08:05:08 -0700 (PDT)
Received: from localhost (p200300e41f12c800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f12:c800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id r10-20020a1709061baa00b0072a815f569bsm1371473ejg.185.2022.07.01.08.05.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Jul 2022 08:05:07 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Prathamesh Shete <pshete@nvidia.com>,
        Vidya Sagar <vidyas@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [PATCH 1/4] dt-bindings: pinctrl: tegra: Convert to json-schema
Date:   Fri,  1 Jul 2022 17:04:58 +0200
Message-Id: <20220701150501.443296-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220701150501.443296-1-thierry.reding@gmail.com>
References: <20220701150501.443296-1-thierry.reding@gmail.com>
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

From: Thierry Reding <treding@nvidia.com>

Convert the NVIDIA Tegra pinmux controller bindings from the free-form
text format to json-schema.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../bindings/clock/nvidia,tegra124-dfll.yaml  |   2 +-
 .../pinctrl/nvidia,tegra114-pinmux.txt        | 131 --------
 .../pinctrl/nvidia,tegra114-pinmux.yaml       | 264 ++++++++++++++++
 .../pinctrl/nvidia,tegra124-pinmux.txt        | 153 ----------
 .../pinctrl/nvidia,tegra124-pinmux.yaml       | 287 ++++++++++++++++++
 .../pinctrl/nvidia,tegra194-pinmux.txt        | 107 -------
 .../pinctrl/nvidia,tegra194-pinmux.yaml       | 176 +++++++++++
 .../pinctrl/nvidia,tegra20-pinmux.txt         | 143 ---------
 .../pinctrl/nvidia,tegra20-pinmux.yaml        | 203 +++++++++++++
 .../pinctrl/nvidia,tegra210-pinmux.txt        | 166 ----------
 .../pinctrl/nvidia,tegra210-pinmux.yaml       | 232 ++++++++++++++
 .../pinctrl/nvidia,tegra30-pinmux.txt         | 144 ---------
 .../pinctrl/nvidia,tegra30-pinmux.yaml        | 268 ++++++++++++++++
 13 files changed, 1431 insertions(+), 845 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra114-pinmux.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra114-pinmux.yaml
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-pinmux.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-pinmux.yaml
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra194-pinmux.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra194-pinmux.yaml
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra20-pinmux.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra20-pinmux.yaml
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra210-pinmux.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra210-pinmux.yaml
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra30-pinmux.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra30-pinmux.yaml

diff --git a/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.yaml b/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.yaml
index 85234a48b590..96c54c215f77 100644
--- a/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.yaml
+++ b/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.yaml
@@ -219,7 +219,7 @@ examples:
 
     /*
      * pinmux nodes added for completeness. Binding doc can be found in:
-     * Documentation/devicetree/bindings/pinctrl/nvidia,tegra210-pinmux.txt
+     * Documentation/devicetree/bindings/pinctrl/nvidia,tegra210-pinmux.yaml
      */
 
     pinmux: pinmux@700008d4 {
diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra114-pinmux.txt b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra114-pinmux.txt
deleted file mode 100644
index fb70856c5b51..000000000000
--- a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra114-pinmux.txt
+++ /dev/null
@@ -1,131 +0,0 @@
-NVIDIA Tegra114 pinmux controller
-
-The Tegra114 pinctrl binding is very similar to the Tegra20 and Tegra30
-pinctrl binding, as described in nvidia,tegra20-pinmux.txt and
-nvidia,tegra30-pinmux.txt. In fact, this document assumes that binding as
-a baseline, and only documents the differences between the two bindings.
-
-Required properties:
-- compatible: "nvidia,tegra114-pinmux"
-- reg: Should contain the register physical address and length for each of
-  the pad control and mux registers. The first bank of address must be the
-  driver strength pad control register address and second bank address must
-  be pinmux register address.
-
-Tegra114 adds the following optional properties for pin configuration subnodes:
-- nvidia,enable-input: Integer. Enable the pin's input path. 0: no, 1: yes.
-- nvidia,open-drain: Integer. Enable open drain mode. 0: no, 1: yes.
-- nvidia,lock: Integer. Lock the pin configuration against further changes
-    until reset. 0: no, 1: yes.
-- nvidia,io-reset: Integer. Reset the IO path. 0: no, 1: yes.
-- nvidia,rcv-sel: Integer. Select VIL/VIH receivers. 0: normal, 1: high.
-- nvidia,drive-type: Integer. Valid range 0...3.
-
-As with Tegra20 and Terga30, see the Tegra TRM for complete details regarding
-which groups support which functionality.
-
-Valid values for pin and group names are:
-
-  per-pin mux groups:
-
-    These all support nvidia,function, nvidia,tristate, nvidia,pull,
-    nvidia,enable-input, nvidia,lock. Some support nvidia,open-drain,
-    nvidia,io-reset and nvidia,rcv-sel.
-
-    ulpi_data0_po1, ulpi_data1_po2, ulpi_data2_po3, ulpi_data3_po4,
-    ulpi_data4_po5, ulpi_data5_po6, ulpi_data6_po7, ulpi_data7_po0,
-    ulpi_clk_py0, ulpi_dir_py1, ulpi_nxt_py2, ulpi_stp_py3, dap3_fs_pp0,
-    dap3_din_pp1, dap3_dout_pp2, dap3_sclk_pp3, pv0, pv1, sdmmc1_clk_pz0,
-    sdmmc1_cmd_pz1, sdmmc1_dat3_py4, sdmmc1_dat2_py5, sdmmc1_dat1_py6,
-    sdmmc1_dat0_py7, clk2_out_pw5, clk2_req_pcc5, hdmi_int_pn7, ddc_scl_pv4,
-    ddc_sda_pv5, uart2_rxd_pc3, uart2_txd_pc2, uart2_rts_n_pj6,
-    uart2_cts_n_pj5, uart3_txd_pw6, uart3_rxd_pw7, uart3_cts_n_pa1,
-    uart3_rts_n_pc0, pu0, pu1, pu2, pu3, pu4, pu5, pu6, gen1_i2c_sda_pc5,
-    gen1_i2c_scl_pc4, dap4_fs_pp4, dap4_din_pp5, dap4_dout_pp6, dap4_sclk_pp7,
-    clk3_out_pee0, clk3_req_pee1, gmi_wp_n_pc7, gmi_iordy_pi5, gmi_wait_pi7,
-    gmi_adv_n_pk0, gmi_clk_pk1, gmi_cs0_n_pj0, gmi_cs1_n_pj2, gmi_cs2_n_pk3,
-    gmi_cs3_n_pk4, gmi_cs4_n_pk2, gmi_cs6_n_pi3, gmi_cs7_n_pi6, gmi_ad0_pg0,
-    gmi_ad1_pg1, gmi_ad2_pg2, gmi_ad3_pg3, gmi_ad4_pg4, gmi_ad5_pg5,
-    gmi_ad6_pg6, gmi_ad7_pg7, gmi_ad8_ph0, gmi_ad9_ph1, gmi_ad10_ph2,
-    gmi_ad11_ph3, gmi_ad12_ph4, gmi_ad13_ph5, gmi_ad14_ph6, gmi_ad15_ph7,
-    gmi_a16_pj7, gmi_a17_pb0, gmi_a18_pb1, gmi_a19_pk7, gmi_wr_n_pi0,
-    gmi_oe_n_pi1, gmi_dqs_p_pj3, gmi_rst_n_pi4, gen2_i2c_scl_pt5,
-    gen2_i2c_sda_pt6, sdmmc4_clk_pcc4, sdmmc4_cmd_pt7, sdmmc4_dat0_paa0,
-    sdmmc4_dat1_paa1, sdmmc4_dat2_paa2, sdmmc4_dat3_paa3, sdmmc4_dat4_paa4,
-    sdmmc4_dat5_paa5, sdmmc4_dat6_paa6, sdmmc4_dat7_paa7, cam_mclk_pcc0,
-    pcc1, pbb0, cam_i2c_scl_pbb1, cam_i2c_sda_pbb2, pbb3, pbb4, pbb5, pbb6,
-    pbb7, pcc2, pwr_i2c_scl_pz6, pwr_i2c_sda_pz7, kb_row0_pr0, kb_row1_pr1,
-    kb_row2_pr2, kb_row3_pr3, kb_row4_pr4, kb_row5_pr5, kb_row6_pr6,
-    kb_row7_pr7, kb_row8_ps0, kb_row9_ps1, kb_row10_ps2, kb_col0_pq0,
-    kb_col1_pq1, kb_col2_pq2, kb_col3_pq3, kb_col4_pq4, kb_col5_pq5,
-    kb_col6_pq6, kb_col7_pq7, clk_32k_out_pa0, sys_clk_req_pz5, core_pwr_req,
-    cpu_pwr_req, pwr_int_n, owr, dap1_fs_pn0, dap1_din_pn1, dap1_dout_pn2,
-    dap1_sclk_pn3, clk1_req_pee2, clk1_out_pw4, spdif_in_pk6, spdif_out_pk5,
-    dap2_fs_pa2, dap2_din_pa4, dap2_dout_pa5, dap2_sclk_pa3, dvfs_pwm_px0,
-    gpio_x1_aud_px1, gpio_x3_aud_px3, dvfs_clk_px2, gpio_x4_aud_px4,
-    gpio_x5_aud_px5, gpio_x6_aud_px6, gpio_x7_aud_px7, sdmmc3_clk_pa6,
-    sdmmc3_cmd_pa7, sdmmc3_dat0_pb7, sdmmc3_dat1_pb6, sdmmc3_dat2_pb5,
-    sdmmc3_dat3_pb4, hdmi_cec_pee3, sdmmc1_wp_n_pv3, sdmmc3_cd_n_pv2,
-    gpio_w2_aud_pw2, gpio_w3_aud_pw3, usb_vbus_en0_pn4, usb_vbus_en1_pn5,
-    sdmmc3_clk_lb_in_pee5, sdmmc3_clk_lb_out_pee4, reset_out_n.
-
-  drive groups:
-
-    These all support nvidia,pull-down-strength, nvidia,pull-up-strength,
-    nvidia,slew-rate-rising, nvidia,slew-rate-falling. Most but not all
-    support nvidia,high-speed-mode, nvidia,schmitt, nvidia,low-power-mode
-    and nvidia,drive-type.
-
-    ao1, ao2, at1, at2, at3, at4, at5, cdev1, cdev2, dap1, dap2, dap3, dap4,
-    dbg, sdio3, spi, uaa, uab, uart2, uart3, sdio1, ddc, gma, gme, gmf, gmg,
-    gmh, owr, uda.
-
-Valid values for nvidia,functions are:
-
-  blink, cec, cldvfs, clk12, cpu, dap, dap1, dap2, dev3, displaya,
-  displaya_alt, displayb, dtv, emc_dll, extperiph1, extperiph2,
-  extperiph3, gmi, gmi_alt, hda, hsi, i2c1, i2c2, i2c3, i2c4, i2cpwr,
-  i2s0, i2s1, i2s2, i2s3, i2s4, irda, kbc, nand, nand_alt, owr, pmi,
-  pwm0, pwm1, pwm2, pwm3, pwron, reset_out_n, rsvd1, rsvd2, rsvd3,
-  rsvd4, sdmmc1, sdmmc2, sdmmc3, sdmmc4, soc, spdif, spi1, spi2, spi3,
-  spi4, spi5, spi6, sysclk, trace, uarta, uartb, uartc, uartd, ulpi,
-  usb, vgp1, vgp2, vgp3, vgp4, vgp5, vgp6, vi, vi_alt1, vi_alt3
-
-Example:
-
-	pinmux: pinmux {
-		compatible = "nvidia,tegra114-pinmux";
-		reg = <0x70000868 0x148		/* Pad control registers */
-		       0x70003000 0x40c>;	/* PinMux registers */
-	};
-
-Example board file extract:
-
-	pinctrl {
-		sdmmc4_default: pinmux {
-			sdmmc4_clk_pcc4 {
-				nvidia,pins = "sdmmc4_clk_pcc4",
-				nvidia,function = "sdmmc4";
-				nvidia,pull = <0>;
-				nvidia,tristate = <0>;
-			};
-			sdmmc4_dat0_paa0 {
-				nvidia,pins = "sdmmc4_dat0_paa0",
-						"sdmmc4_dat1_paa1",
-						"sdmmc4_dat2_paa2",
-						"sdmmc4_dat3_paa3",
-						"sdmmc4_dat4_paa4",
-						"sdmmc4_dat5_paa5",
-						"sdmmc4_dat6_paa6",
-						"sdmmc4_dat7_paa7";
-				nvidia,function = "sdmmc4";
-				nvidia,pull = <2>;
-				nvidia,tristate = <0>;
-			};
-		};
-	};
-
-	sdhci@78000400 {
-		pinctrl-names = "default";
-		pinctrl-0 = <&sdmmc4_default>;
-	};
diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra114-pinmux.yaml b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra114-pinmux.yaml
new file mode 100644
index 000000000000..fa95d0bd6fe4
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra114-pinmux.yaml
@@ -0,0 +1,264 @@
+# SPDX-License-Identifier: (GPL-2.0+ OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/nvidia,tegra114-pinmux.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra114 pinmux Controller
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Jon Hunter <jonathanh@nvidia.com>
+
+properties:
+  compatible:
+    const: nvidia,tegra114-pinmux
+
+  reg:
+    items:
+      - description: pad control registers
+      - description: mux registers
+
+additionalProperties:
+  type: object
+  description: |
+    Please refer to pinctrl-bindings.txt in this directory for details of the common pinctrl
+    bindings used by client devices, including the meaning of the phrase "pin configuration
+    node".
+
+    Tegra's pin configuration nodes act as a container for an arbitrary number of subnodes. Each
+    of these subnodes represents some desired configuration for a pin, a group, or a list of
+    pins or groups. This configuration can include the mux function to select on those pin(s)/
+    group(s), and various pin configuration parameters, such as pull-up, tristate, drive
+    strength, etc.
+
+    The name of each subnode is not important; all subnodes should be enumerated and processed
+    purely based on their content.
+
+    Each subnode only affects those parameters that are explicitly listed. In other words, a
+    subnode that lists a mux function but no pin configuration parameters implies no information
+    about any pin configuration parameters.
+
+    Similarly, a pin subnode that describes a pullup parameter implies no information about e.g.
+    the mux function or tristate parameter. For this reason, even seemingly boolean values are
+    actually tristates in this binding: unspecified, off, or on. Unspecified is represented as
+    an absent property, and off/on are represented as integer values 0 and 1.
+
+    Note that many of these properties are only valid for certain specific pins or groups. See
+    the Tegra TRM and various pinmux spreadsheets for complete details regarding which groups
+    support which functionality. The Linux pinctrl driver may also be a useful reference, since
+    it consolidates, disambiguates, and corrects data from all those sources.
+
+  patternProperties:
+    "^pinmux(-[a-z0-9-_]+)?$":
+      type: object
+      properties:
+        nvidia,pins:
+          $ref: /schemas/types.yaml#/definitions/string-array
+          description: An array of strings. Each string contains the name of a pin or group.
+            Valid values for these names are listed below.
+          items:
+            enum: [ ulpi_data0_po1, ulpi_data1_po2, ulpi_data2_po3, ulpi_data3_po4, ulpi_data4_po5,
+                    ulpi_data5_po6, ulpi_data6_po7, ulpi_data7_po0, ulpi_clk_py0, ulpi_dir_py1,
+                    ulpi_nxt_py2, ulpi_stp_py3, dap3_fs_pp0, dap3_din_pp1, dap3_dout_pp2,
+                    dap3_sclk_pp3, pv0, pv1, sdmmc1_clk_pz0, sdmmc1_cmd_pz1, sdmmc1_dat3_py4,
+                    sdmmc1_dat2_py5, sdmmc1_dat1_py6, sdmmc1_dat0_py7, clk2_out_pw5, clk2_req_pcc5,
+                    hdmi_int_pn7, ddc_scl_pv4, ddc_sda_pv5, uart2_rxd_pc3, uart2_txd_pc2,
+                    uart2_rts_n_pj6, uart2_cts_n_pj5, uart3_txd_pw6, uart3_rxd_pw7,
+                    uart3_cts_n_pa1, uart3_rts_n_pc0, pu0, pu1, pu2, pu3, pu4, pu5, pu6,
+                    gen1_i2c_sda_pc5, gen1_i2c_scl_pc4, dap4_fs_pp4, dap4_din_pp5, dap4_dout_pp6,
+                    dap4_sclk_pp7, clk3_out_pee0, clk3_req_pee1, gmi_wp_n_pc7, gmi_iordy_pi5,
+                    gmi_wait_pi7, gmi_adv_n_pk0, gmi_clk_pk1, gmi_cs0_n_pj0, gmi_cs1_n_pj2,
+                    gmi_cs2_n_pk3, gmi_cs3_n_pk4, gmi_cs4_n_pk2, gmi_cs6_n_pi3, gmi_cs7_n_pi6,
+                    gmi_ad0_pg0, gmi_ad1_pg1, gmi_ad2_pg2, gmi_ad3_pg3, gmi_ad4_pg4, gmi_ad5_pg5,
+                    gmi_ad6_pg6, gmi_ad7_pg7, gmi_ad8_ph0, gmi_ad9_ph1, gmi_ad10_ph2, gmi_ad11_ph3,
+                    gmi_ad12_ph4, gmi_ad13_ph5, gmi_ad14_ph6, gmi_ad15_ph7, gmi_a16_pj7,
+                    gmi_a17_pb0, gmi_a18_pb1, gmi_a19_pk7, gmi_wr_n_pi0, gmi_oe_n_pi1,
+                    gmi_dqs_p_pj3, gmi_rst_n_pi4, gen2_i2c_scl_pt5, gen2_i2c_sda_pt6,
+                    sdmmc4_clk_pcc4, sdmmc4_cmd_pt7, sdmmc4_dat0_paa0, sdmmc4_dat1_paa1,
+                    sdmmc4_dat2_paa2, sdmmc4_dat3_paa3, sdmmc4_dat4_paa4, sdmmc4_dat5_paa5,
+                    sdmmc4_dat6_paa6, sdmmc4_dat7_paa7, cam_mclk_pcc0, pcc1, pbb0,
+                    cam_i2c_scl_pbb1, cam_i2c_sda_pbb2, pbb3, pbb4, pbb5, pbb6, pbb7, pcc2,
+                    pwr_i2c_scl_pz6, pwr_i2c_sda_pz7, kb_row0_pr0, kb_row1_pr1, kb_row2_pr2,
+                    kb_row3_pr3, kb_row4_pr4, kb_row5_pr5, kb_row6_pr6, kb_row7_pr7, kb_row8_ps0,
+                    kb_row9_ps1, kb_row10_ps2, kb_col0_pq0, kb_col1_pq1, kb_col2_pq2, kb_col3_pq3,
+                    kb_col4_pq4, kb_col5_pq5, kb_col6_pq6, kb_col7_pq7, clk_32k_out_pa0,
+                    sys_clk_req_pz5, core_pwr_req, cpu_pwr_req, pwr_int_n, owr, dap1_fs_pn0,
+                    dap1_din_pn1, dap1_dout_pn2, dap1_sclk_pn3, clk1_req_pee2, clk1_out_pw4,
+                    spdif_in_pk6, spdif_out_pk5, dap2_fs_pa2, dap2_din_pa4, dap2_dout_pa5,
+                    dap2_sclk_pa3, dvfs_pwm_px0, gpio_x1_aud_px1, gpio_x3_aud_px3, dvfs_clk_px2,
+                    gpio_x4_aud_px4, gpio_x5_aud_px5, gpio_x6_aud_px6, gpio_x7_aud_px7,
+                    sdmmc3_clk_pa6, sdmmc3_cmd_pa7, sdmmc3_dat0_pb7, sdmmc3_dat1_pb6,
+                    sdmmc3_dat2_pb5, sdmmc3_dat3_pb4, hdmi_cec_pee3, sdmmc1_wp_n_pv3,
+                    sdmmc3_cd_n_pv2, gpio_w2_aud_pw2, gpio_w3_aud_pw3, usb_vbus_en0_pn4,
+                    usb_vbus_en1_pn5, sdmmc3_clk_lb_in_pee5, sdmmc3_clk_lb_out_pee4, reset_out_n,
+                    # drive groups
+                    drive_ao1, drive_ao2, drive_at1, drive_at2, drive_at3, drive_at4, drive_at5,
+                    drive_cdev1, drive_cdev2, drive_dap1, drive_dap2, drive_dap3, drive_dap4,
+                    drive_dbg, drive_sdio3, drive_spi, drive_uaa, drive_uab, drive_uart2,
+                    drive_uart3, drive_sdio1, drive_ddc, drive_gma, drive_gme, drive_gmf,
+                    drive_gmg, drive_gmh, drive_owr, drive_uda ]
+
+        nvidia,function:
+          $ref: /schemas/types.yaml#/definitions/string
+          description: A string containing the name of the function to mux to the pin or group.
+            Valid values for function names are listed below. See the Tegra TRM to determine
+            which are valid for each pin or group.
+          enum: [ blink, cec, cldvfs, clk12, cpu, dap, dap1, dap2, dev3, displaya, displaya_alt,
+                  displayb, dtv, emc_dll, extperiph1, extperiph2, extperiph3, gmi, gmi_alt, hda,
+                  hsi, i2c1, i2c2, i2c3, i2c4, i2cpwr, i2s0, i2s1, i2s2, i2s3, i2s4, irda, kbc,
+                  nand, nand_alt, owr, pmi, pwm0, pwm1, pwm2, pwm3, pwron, reset_out_n, rsvd1,
+                  rsvd2, rsvd3, rsvd4, sdmmc1, sdmmc2, sdmmc3, sdmmc4, soc, spdif, spi1, spi2,
+                  spi3, spi4, spi5, spi6, sysclk, trace, uarta, uartb, uartc, uartd, ulpi, usb,
+                  vgp1, vgp2, vgp3, vgp4, vgp5, vgp6, vi, vi_alt1, vi_alt3 ]
+
+        nvidia,pull:
+          description: Pull-down/up setting to apply to the pin.
+          $ref: /schemas/types.yaml#/definitions/uint32
+          oneOf:
+            - description: none
+              const: 0
+            - description: down
+              const: 1
+            - description: up
+              const: 2
+
+        nvidia,tristate:
+          description: Tristate setting to apply to the pin.
+          $ref: /schemas/types.yaml#/definitions/uint32
+          oneOf:
+            - description: drive
+              const: 0
+            - description: tristate
+              const: 1
+
+        nvidia,enable-input:
+          description: Enable the pin's input path.
+          $ref: /schemas/types.yaml#/definitions/uint32
+          oneOf:
+            - description: disable input (i.e. output only)
+              const: 0
+            - description: enable input
+              const: 1
+
+        nvidia,open-drain:
+          description: Open-drain configuration for the pin.
+          $ref: /schemas/types.yaml#/definitions/uint32
+          oneOf:
+            - description: disable open-drain
+              const: 0
+            - description: enable open-drain
+              const: 1
+
+        nvidia,lock:
+          description: Lock the pin configuration against further changes until reset.
+          $ref: /schemas/types.yaml#/definitions/uint32
+          oneOf:
+            - description: disable pin configuration lock
+              const: 0
+            - description: enable pin configuration lock
+              const: 1
+
+        nvidia,io-reset:
+          description: reset the I/O path
+          $ref: /schemas/types.yaml#/definitions/uint32
+          enum: [ 0, 1 ]
+
+        nvidia,rcv-sel:
+          description: select VIL/VIH receivers
+          $ref: /schemas/types.yaml#/definitions/uint32
+          oneOf:
+            - description: normal receivers
+              const: 0
+            - description: high-voltage receivers
+              const: 1
+
+        nvidia,high-speed-mode:
+          description: Enable high speed mode the pins.
+          $ref: /schemas/types.yaml#/definitions/uint32
+          oneOf:
+            - description: normal speed mode
+              const: 0
+            - description: high speed mode
+              const: 1
+
+        nvidia,schmitt:
+          description: Enable Schmitt trigger on the input.
+          $ref: /schemas/types.yaml#/definitions/uint32
+          oneOf:
+            - description: disable Schmitt trigger on the input
+              const: 0
+            - description: enable Schmitt trigger on the input
+              const: 1
+
+        nvidia,low-power-mode:
+          description: Controls the drive power or current. Valid values are from 0 through 3,
+            where 0 specifies the least power and 3 specifies the most power. See "Low Power
+            Mode" or "LPMD1" and "LPMD0" in the Tegra TRM.
+          $ref: /schemas/types.yaml#/definitions/uint32
+          enum: [ 0, 1, 2, 3 ]
+
+        nvidia,drive-type:
+          description: Drive type to configure for the pin.
+          $ref: /schemas/types.yaml#/definitions/uint32
+          enum: [ 0, 1, 2, 3 ]
+
+        nvidia,pull-down-strength:
+          description: Controls drive strength. 0 is weakest. The range of valid values depends
+            on the pingroup. See "CAL_DRVDN" in the Tegra TRM.
+          $ref: /schemas/types.yaml#/definitions/uint32
+
+        nvidia,pull-up-strength:
+          description: Controls drive strength. 0 is weakest. The range of valid values depends
+            on the pingroup. See "CAL_DRVUP" in the Tegra TRM.
+          $ref: /schemas/types.yaml#/definitions/uint32
+
+        nvidia,slew-rate-rising:
+          description: Controls rising signal slew rate. 0 is fastest. The range of valid values
+            depends on the pingroup. See "DRVDN_SLWR" in the Tegra TRM.
+          $ref: /schemas/types.yaml#/definitions/uint32
+
+        nvidia,slew-rate-falling:
+          description: Controls falling signal slew rate. 0 is fastest. The range of valid
+            values depends on the pingroup. See "DRVUP_SLWF" in the Tegra TRM.
+          $ref: /schemas/types.yaml#/definitions/uint32
+
+      additionalProperties: false
+
+      required:
+        - nvidia,pins
+
+required:
+  - compatible
+  - reg
+
+examples:
+  - |
+    pinmux@70000868 {
+      compatible = "nvidia,tegra114-pinmux";
+      reg = <0x70000868 0x148>, /* Pad control registers */
+            <0x70003000 0x40c>; /* PinMux registers */
+
+      pinmux {
+        sdmmc4_clk_pcc4 {
+          nvidia,pins = "sdmmc4_clk_pcc4";
+          nvidia,function = "sdmmc4";
+          nvidia,pull = <0>;
+          nvidia,tristate = <0>;
+        };
+
+        sdmmc4_dat0_paa0 {
+          nvidia,pins = "sdmmc4_dat0_paa0",
+                        "sdmmc4_dat1_paa1",
+                        "sdmmc4_dat2_paa2",
+                        "sdmmc4_dat3_paa3",
+                        "sdmmc4_dat4_paa4",
+                        "sdmmc4_dat5_paa5",
+                        "sdmmc4_dat6_paa6",
+                        "sdmmc4_dat7_paa7";
+          nvidia,function = "sdmmc4";
+          nvidia,pull = <2>;
+          nvidia,tristate = <0>;
+        };
+      };
+    };
diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-pinmux.txt b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-pinmux.txt
deleted file mode 100644
index f4d06bb0b55a..000000000000
--- a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-pinmux.txt
+++ /dev/null
@@ -1,153 +0,0 @@
-NVIDIA Tegra124 pinmux controller
-
-The Tegra124 pinctrl binding is very similar to the Tegra20 and Tegra30
-pinctrl binding, as described in nvidia,tegra20-pinmux.txt and
-nvidia,tegra30-pinmux.txt. In fact, this document assumes that binding as
-a baseline, and only documents the differences between the two bindings.
-
-Required properties:
-- compatible: For Tegra124, must contain "nvidia,tegra124-pinmux".  For
-  Tegra132, must contain '"nvidia,tegra132-pinmux", "nvidia-tegra124-pinmux"'.
-- reg: Should contain a list of base address and size pairs for:
-    -- first entry - the drive strength and pad control registers.
-    -- second entry - the pinmux registers
-    -- third entry - the MIPI_PAD_CTRL register
-
-Tegra124 adds the following optional properties for pin configuration subnodes.
-The macros for options are defined in the
-	include/dt-binding/pinctrl/pinctrl-tegra.h.
-- nvidia,enable-input: Integer. Enable the pin's input path.
-		enable :TEGRA_PIN_ENABLE and
-		disable or output only: TEGRA_PIN_DISABLE.
-- nvidia,open-drain: Integer.
-		enable: TEGRA_PIN_ENABLE.
-		disable: TEGRA_PIN_DISABLE.
-- nvidia,lock: Integer. Lock the pin configuration against further changes
-    until reset.
-		enable: TEGRA_PIN_ENABLE.
-		disable: TEGRA_PIN_DISABLE.
-- nvidia,io-reset: Integer. Reset the IO path.
-		enable: TEGRA_PIN_ENABLE.
-		disable: TEGRA_PIN_DISABLE.
-- nvidia,rcv-sel: Integer. Select VIL/VIH receivers.
-		normal: TEGRA_PIN_DISABLE
-		high: TEGRA_PIN_ENABLE
-
-Please refer the Tegra TRM for complete details regarding which groups
-support which functionality.
-
-Valid values for pin and group names are:
-
-  per-pin mux groups:
-
-    These all support nvidia,function, nvidia,tristate, nvidia,pull,
-    nvidia,enable-input. Some support nvidia,lock nvidia,open-drain,
-    nvidia,io-reset and nvidia,rcv-sel.
-
-	ulpi_data0_po1, ulpi_data1_po2, ulpi_data2_po3, ulpi_data3_po4,
-	ulpi_data4_po5, ulpi_data5_po6, ulpi_data6_po7, ulpi_data7_po0,
-	ulpi_clk_py0, ulpi_dir_py1, ulpi_nxt_py2, ulpi_stp_py3, dap3_fs_pp0,
-	dap3_din_pp1, dap3_dout_pp2, dap3_sclk_pp3, pv0, pv1, sdmmc1_clk_pz0,
-	sdmmc1_cmd_pz1, sdmmc1_dat3_py4, sdmmc1_dat2_py5, sdmmc1_dat1_py6,
-	sdmmc1_dat0_py7, clk2_out_pw5, clk2_req_pcc5, hdmi_int_pn7, ddc_scl_pv4,
-	ddc_sda_pv5, uart2_rxd_pc3, uart2_txd_pc2, uart2_rts_n_pj6,
-	uart2_cts_n_pj5, uart3_txd_pw6, uart3_rxd_pw7, uart3_cts_n_pa1,
-	uart3_rts_n_pc0, pu0, pu1, pu2, pu3, pu4, pu5, pu6, gen1_i2c_scl_pc4,
-	gen1_i2c_sda_pc5, dap4_fs_pp4, dap4_din_pp5, dap4_dout_pp6,
-	dap4_sclk_pp7, clk3_out_pee0, clk3_req_pee1, pc7, pi5, pi7, pk0, pk1,
-	pj0, pj2, pk3, pk4, pk2, pi3, pi6, pg0, pg1, pg2, pg3, pg4, pg5, pg6,
-	pg7, ph0, ph1, ph2, ph3, ph4, ph5, ph6, ph7, pj7, pb0, pb1, pk7, pi0,
-	pi1, pi2, pi4, gen2_i2c_scl_pt5, gen2_i2c_sda_pt6, sdmmc4_clk_pcc4,
-	sdmmc4_cmd_pt7, sdmmc4_dat0_paa0, sdmmc4_dat1_paa1, sdmmc4_dat2_paa2,
-	sdmmc4_dat3_paa3, sdmmc4_dat4_paa4, sdmmc4_dat5_paa5, sdmmc4_dat6_paa6,
-	sdmmc4_dat7_paa7, cam_mclk_pcc0, pcc1, pbb0, cam_i2c_scl_pbb1,
-	cam_i2c_sda_pbb2, pbb3, pbb4, pbb5, pbb6, pbb7, pcc2, jtag_rtck,
-	pwr_i2c_scl_pz6, pwr_i2c_sda_pz7, kb_row0_pr0, kb_row1_pr1, kb_row2_pr2,
-	kb_row3_pr3, kb_row4_pr4, kb_row5_pr5, kb_row6_pr6, kb_row7_pr7,
-	kb_row8_ps0, kb_row9_ps1, kb_row10_ps2, kb_row11_ps3, kb_row12_ps4,
-	kb_row13_ps5, kb_row14_ps6, kb_row15_ps7, kb_col0_pq0, kb_col1_pq1,
-	kb_col2_pq2, kb_col3_pq3, kb_col4_pq4, kb_col5_pq5, kb_col6_pq6,
-	kb_col7_pq7, clk_32k_out_pa0, core_pwr_req, cpu_pwr_req, pwr_int_n,
-	clk_32k_in, owr, dap1_fs_pn0, dap1_din_pn1, dap1_dout_pn2,
-	dap1_sclk_pn3, dap_mclk1_req_pee2, dap_mclk1_pw4, spdif_in_pk6,
-	spdif_out_pk5, dap2_fs_pa2, dap2_din_pa4, dap2_dout_pa5, dap2_sclk_pa3,
-	dvfs_pwm_px0, gpio_x1_aud_px1, gpio_x3_aud_px3, dvfs_clk_px2,
-	gpio_x4_aud_px4, gpio_x5_aud_px5, gpio_x6_aud_px6, gpio_x7_aud_px7,
-	sdmmc3_clk_pa6, sdmmc3_cmd_pa7, sdmmc3_dat0_pb7, sdmmc3_dat1_pb6,
-	sdmmc3_dat2_pb5, sdmmc3_dat3_pb4, pex_l0_rst_n_pdd1,
-	pex_l0_clkreq_n_pdd2, pex_wake_n_pdd3, pex_l1_rst_n_pdd5,
-	pex_l1_clkreq_n_pdd6, hdmi_cec_pee3, sdmmc1_wp_n_pv3,
-	sdmmc3_cd_n_pv2, gpio_w2_aud_pw2, gpio_w3_aud_pw3, usb_vbus_en0_pn4,
-	usb_vbus_en1_pn5, sdmmc3_clk_lb_out_pee4, sdmmc3_clk_lb_in_pee5,
-	gmi_clk_lb, reset_out_n, kb_row16_pt0, kb_row17_pt1, usb_vbus_en2_pff1,
-	pff2, dp_hpd_pff0,
-
-  drive groups:
-
-    These all support nvidia,pull-down-strength, nvidia,pull-up-strength,
-    nvidia,slew-rate-rising, nvidia,slew-rate-falling. Most but not all
-    support nvidia,high-speed-mode, nvidia,schmitt, nvidia,low-power-mode
-    and nvidia,drive-type.
-
-    ao1, ao2, at1, at2, at3, at4, at5, cdev1, cdev2, dap1, dap2, dap3, dap4,
-    dbg, sdio3, spi, uaa, uab, uart2, uart3, sdio1, ddc, gma, gme, gmf, gmg,
-    gmh, owr, uda, gpv, dev3, cec, usb_vbus_en, ao3, ao0, hv0, sdio4, ao4.
-
-  MIPI pad control groups:
-
-    These support only the nvidia,function property.
-
-    dsi_b
-
-Valid values for nvidia,functions are:
-
-  blink, cec, cldvfs, clk12, cpu, dap, dap1, dap2, dev3, displaya,
-  displaya_alt, displayb, dtv, extperiph1, extperiph2, extperiph3,
-  gmi, gmi_alt, hda, hsi, i2c1, i2c2, i2c3, i2c4, i2cpwr, i2s0,
-  i2s1, i2s2, i2s3, i2s4, irda, kbc, owr, pmi, pwm0, pwm1, pwm2, pwm3,
-  pwron, reset_out_n, rsvd1, rsvd2, rsvd3, rsvd4, sdmmc1, sdmmc2, sdmmc3,
-  sdmmc4, soc, spdif, spi1, spi2, spi3, spi4, spi5, spi6, trace, uarta,
-  uartb, uartc, uartd, ulpi, usb, vgp1, vgp2, vgp3, vgp4, vgp5, vgp6,
-  vi, vi_alt1, vi_alt3, vimclk2, vimclk2_alt, sata, ccla, pe0, pe, pe1,
-  dp, rtck, sys, clk tmds, csi, dsi_b
-
-Example:
-
-	pinmux: pinmux {
-		compatible = "nvidia,tegra124-pinmux";
-		reg = <0x0 0x70000868 0x0 0x164>, /* Pad control registers */
-		      <0x0 0x70003000 0x0 0x434>, /* Mux registers */
-		      <0x0 0x70000820 0x0 0x8>;   /* MIPI pad control */
-	};
-
-Example pinmux entries:
-
-	pinctrl {
-		sdmmc4_default: pinmux {
-			sdmmc4_clk_pcc4 {
-				nvidia,pins = "sdmmc4_clk_pcc4",
-				nvidia,function = "sdmmc4";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-			};
-
-			sdmmc4_dat0_paa0 {
-				nvidia,pins = "sdmmc4_dat0_paa0",
-						"sdmmc4_dat1_paa1",
-						"sdmmc4_dat2_paa2",
-						"sdmmc4_dat3_paa3",
-						"sdmmc4_dat4_paa4",
-						"sdmmc4_dat5_paa5",
-						"sdmmc4_dat6_paa6",
-						"sdmmc4_dat7_paa7";
-				nvidia,function = "sdmmc4";
-				nvidia,pull = <TEGRA_PIN_PULL_UP>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-			};
-		};
-	};
-
-	sdhci@78000400 {
-		pinctrl-names = "default";
-		pinctrl-0 = <&sdmmc4_default>;
-	};
diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-pinmux.yaml b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-pinmux.yaml
new file mode 100644
index 000000000000..2702a80104cc
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-pinmux.yaml
@@ -0,0 +1,287 @@
+# SPDX-License-Identifier: (GPL-2.0+ OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/nvidia,tegra124-pinmux.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra124 Pinmux Controller
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Jon Hunter <jonathanh@nvidia.com>
+
+description: The Tegra124 pinctrl binding is very similar to the Tegra20 and Tegra30 pinctrl
+  binding, as described in nvidia,tegra20-pinmux.yaml and nvidia,tegra30-pinmux.yaml. In fact, this
+  document assumes that binding as a baseline, and only documents the differences between the two
+  bindings.
+
+properties:
+  compatible:
+    oneOf:
+      - const: nvidia,tegra124-pinmux
+      - items:
+          - const: nvidia,tegra132-pinmux
+          - const: nvidia,tegra124-pinmux
+
+  reg:
+    items:
+      - description: driver strength and pad control registers
+      - description: pinmux registers
+      - description: MIPI_PAD_CTRL registers
+
+additionalProperties:
+  description: |
+    Tegra's pin configuration nodes act as containers for an arbitrary number of subnodes. Each of
+    these subnodes represents some desired configuration for a pin, a group, or a list of pins or
+    groups. This configuration can include the mux function to select on those pin(s)/group(s), and
+    various pin configuration parameters, such as pull-up, tristate, drive strength, etc.
+
+    The name of each subnode is not important; all subnodes should be enumerated and processed
+    purely based on their content.
+
+    Each subnode only affects those parameters that are explicitly listed. In other words, a
+    subnode that lists a mux function but no pin configuration parameters implies no information
+    about any pin configuration parameters. Similarly, a pin subnode that describes a pullup
+    parameter implies no information about e.g. the mux function or tristate parameter. For this
+    reason, even seemingly boolean values are actually tristates in this binding: unspecified, off,
+    or on. Unspecified is represented as an absent property, and off/on are represented as integer
+    values 0 and 1.
+
+    See the TRM to determine which properties and values apply to each pin/group. Macro values for
+    property values are defined in include/dt-binding/pinctrl/pinctrl-tegra.h.
+  type: object
+  patternProperties:
+    "^pinmux(-[a-z0-9-_]+)?$":
+      properties:
+        nvidia,pins:
+          description: An array of strings. Each string contains the name of a pin or group. Valid
+            values for these names are listed below.
+          $ref: /schemas/types.yaml#/definitions/string-array
+          items:
+            enum: [ ulpi_data0_po1, ulpi_data1_po2, ulpi_data2_po3, ulpi_data3_po4,
+                    ulpi_data4_po5, ulpi_data5_po6, ulpi_data6_po7, ulpi_data7_po0, ulpi_clk_py0,
+                    ulpi_dir_py1, ulpi_nxt_py2, ulpi_stp_py3, dap3_fs_pp0, dap3_din_pp1,
+                    dap3_dout_pp2, dap3_sclk_pp3, pv0, pv1, sdmmc1_clk_pz0, sdmmc1_cmd_pz1,
+                    sdmmc1_dat3_py4, sdmmc1_dat2_py5, sdmmc1_dat1_py6, sdmmc1_dat0_py7,
+                    clk2_out_pw5, clk2_req_pcc5, hdmi_int_pn7, ddc_scl_pv4, ddc_sda_pv5,
+                    uart2_rxd_pc3, uart2_txd_pc2, uart2_rts_n_pj6, uart2_cts_n_pj5,
+                    uart3_txd_pw6, uart3_rxd_pw7, uart3_cts_n_pa1, uart3_rts_n_pc0, pu0, pu1,
+                    pu2, pu3, pu4, pu5, pu6, gen1_i2c_scl_pc4, gen1_i2c_sda_pc5, dap4_fs_pp4,
+                    dap4_din_pp5, dap4_dout_pp6, dap4_sclk_pp7, clk3_out_pee0, clk3_req_pee1,
+                    pc7, pi5, pi7, pk0, pk1, pj0, pj2, pk3, pk4, pk2, pi3, pi6, pg0, pg1, pg2,
+                    pg3, pg4, pg5, pg6, pg7, ph0, ph1, ph2, ph3, ph4, ph5, ph6, ph7, pj7, pb0,
+                    pb1, pk7, pi0, pi1, pi2, pi4, gen2_i2c_scl_pt5, gen2_i2c_sda_pt6,
+                    sdmmc4_clk_pcc4, sdmmc4_cmd_pt7, sdmmc4_dat0_paa0, sdmmc4_dat1_paa1,
+                    sdmmc4_dat2_paa2, sdmmc4_dat3_paa3, sdmmc4_dat4_paa4, sdmmc4_dat5_paa5,
+                    sdmmc4_dat6_paa6, sdmmc4_dat7_paa7, cam_mclk_pcc0, pcc1, pbb0,
+                    cam_i2c_scl_pbb1, cam_i2c_sda_pbb2, pbb3, pbb4, pbb5, pbb6, pbb7, pcc2,
+                    jtag_rtck, pwr_i2c_scl_pz6, pwr_i2c_sda_pz7, kb_row0_pr0, kb_row1_pr1,
+                    kb_row2_pr2, kb_row3_pr3, kb_row4_pr4, kb_row5_pr5, kb_row6_pr6, kb_row7_pr7,
+                    kb_row8_ps0, kb_row9_ps1, kb_row10_ps2, kb_row11_ps3, kb_row12_ps4,
+                    kb_row13_ps5, kb_row14_ps6, kb_row15_ps7, kb_col0_pq0, kb_col1_pq1,
+                    kb_col2_pq2, kb_col3_pq3, kb_col4_pq4, kb_col5_pq5, kb_col6_pq6, kb_col7_pq7,
+                    clk_32k_out_pa0, core_pwr_req, cpu_pwr_req, pwr_int_n, clk_32k_in, owr,
+                    dap1_fs_pn0, dap1_din_pn1, dap1_dout_pn2, dap1_sclk_pn3, dap_mclk1_req_pee2,
+                    dap_mclk1_pw4, spdif_in_pk6, spdif_out_pk5, dap2_fs_pa2, dap2_din_pa4,
+                    dap2_dout_pa5, dap2_sclk_pa3, dvfs_pwm_px0, gpio_x1_aud_px1, gpio_x3_aud_px3,
+                    dvfs_clk_px2, gpio_x4_aud_px4, gpio_x5_aud_px5, gpio_x6_aud_px6,
+                    gpio_x7_aud_px7, sdmmc3_clk_pa6, sdmmc3_cmd_pa7, sdmmc3_dat0_pb7,
+                    sdmmc3_dat1_pb6, sdmmc3_dat2_pb5, sdmmc3_dat3_pb4, pex_l0_rst_n_pdd1,
+                    pex_l0_clkreq_n_pdd2, pex_wake_n_pdd3, pex_l1_rst_n_pdd5,
+                    pex_l1_clkreq_n_pdd6, hdmi_cec_pee3, sdmmc1_wp_n_pv3, sdmmc3_cd_n_pv2,
+                    gpio_w2_aud_pw2, gpio_w3_aud_pw3, usb_vbus_en0_pn4, usb_vbus_en1_pn5,
+                    sdmmc3_clk_lb_out_pee4, sdmmc3_clk_lb_in_pee5, gmi_clk_lb, reset_out_n,
+                    kb_row16_pt0, kb_row17_pt1, usb_vbus_en2_pff1, pff2, dp_hpd_pff0,
+                    # drive groups
+                    drive_ao1, drive_ao2, drive_at1, drive_at2, drive_at3, drive_at4, drive_at5,
+                    drive_cdev1, drive_cdev2, drive_dap1, drive_dap2, drive_dap3, drive_dap4,
+                    drive_dbg, drive_sdio3, drive_spi, drive_uaa, drive_uab, drive_uart2,
+                    drive_uart3, drive_sdio1, drive_ddc, drive_gma, drive_gme, drive_gmf,
+                    drive_gmg, drive_gmh, drive_owr, drive_uda, drive_gpv, drive_dev3, drive_cec,
+                    drive_usb_vbus_en, drive_ao3, drive_ao0, drive_hv0, drive_sdio4, drive_ao4,
+                    # MIPI pad control groups
+                    mipi_pad_ctrl_dsi_b ]
+
+        nvidia,function:
+          description: A string containing the name of the function to mux to the pin or group.
+          $ref: /schemas/types.yaml#/definitions/string
+          enum: [ blink, cec, cldvfs, clk12, cpu, dap, dap1, dap2, dev3, displaya, displaya_alt,
+                  displayb, dtv, extperiph1, extperiph2, extperiph3, gmi, gmi_alt, hda, hsi, i2c1,
+                  i2c2, i2c3, i2c4, i2cpwr, i2s0, i2s1, i2s2, i2s3, i2s4, irda, kbc, owr, pmi,
+                  pwm0, pwm1, pwm2, pwm3, pwron, reset_out_n, rsvd1, rsvd2, rsvd3, rsvd4, sdmmc1,
+                  sdmmc2, sdmmc3, sdmmc4, soc, spdif, spi1, spi2, spi3, spi4, spi5, spi6, trace,
+                  uarta, uartb, uartc, uartd, ulpi, usb, vgp1, vgp2, vgp3, vgp4, vgp5, vgp6, vi,
+                  vi_alt1, vi_alt3, vimclk2, vimclk2_alt, sata, ccla, pe0, pe, pe1, dp, rtck, sys,
+                  clk, tmds, csi, dsi_b ]
+
+        nvidia,pull:
+          description: Pull-down/up setting to apply to the pin.
+          $ref: /schemas/types.yaml#/definitions/uint32
+          oneOf:
+            - description: none
+              const: 0
+            - description: down
+              const: 1
+            - description: up
+              const: 2
+
+        nvidia,tristate:
+          description: Tristate setting to apply to the pin.
+          $ref: /schemas/types.yaml#/definitions/uint32
+          oneOf:
+            - description: drive
+              const: 0
+            - description: tristate
+              const: 1
+
+        nvidia,enable-input:
+          description: Enable the pin's input path.
+          $ref: /schemas/types.yaml#/definitions/uint32
+          oneOf:
+            - description: disable input (i.e. output only)
+              const: 0
+            - description: enable input
+              const: 1
+
+        nvidia,open-drain:
+          description: Open-drain configuration for the pin.
+          $ref: /schemas/types.yaml#/definitions/uint32
+          oneOf:
+            - description: disable open-drain
+              const: 0
+            - description: enable open-drain
+              const: 1
+
+        nvidia,lock:
+          description: Lock the pin configuration against further changes until reset.
+          $ref: /schemas/types.yaml#/definitions/uint32
+          oneOf:
+            - description: disable pin configuration lock
+              const: 0
+            - description: enable pin configuration lock
+              const: 1
+
+        nvidia,io-reset:
+          description: reset the I/O path
+          $ref: /schemas/types.yaml#/definitions/uint32
+          enum: [ 0, 1 ]
+
+        nvidia,rcv-sel:
+          description: select VIL/VIH receivers
+          $ref: /schemas/types.yaml#/definitions/uint32
+          oneOf:
+            - description: normal receivers
+              const: 0
+            - description: high-voltage receivers
+              const: 1
+
+        nvidia,high-speed-mode:
+          description: Enable high speed mode the pins.
+          $ref: /schemas/types.yaml#/definitions/uint32
+          oneOf:
+            - description: normal speed mode
+              const: 0
+            - description: high speed mode
+              const: 1
+
+        nvidia,schmitt:
+          description: Enable Schmitt trigger on the input.
+          $ref: /schemas/types.yaml#/definitions/uint32
+          oneOf:
+            - description: disable Schmitt trigger on the input
+              const: 0
+            - description: enable Schmitt trigger on the input
+              const: 1
+
+        nvidia,low-power-mode:
+          description: Controls the drive power or current. Valid values are from 0 through 3,
+            where 0 specifies the least power and 3 specifies the most power. See "Low Power Mode"
+            or "LPMD1" and "LPMD0" in the Tegra TRM.
+          $ref: /schemas/types.yaml#/definitions/uint32
+          enum: [ 0, 1, 2, 3 ]
+
+        nvidia,drive-type:
+          description: Drive type to configure for the pin.
+          $ref: /schemas/types.yaml#/definitions/uint32
+          enum: [ 0, 1, 2, 3 ]
+
+        nvidia,pull-down-strength:
+          description: Controls drive strength. 0 is weakest. The range of valid values depends on
+            the pingroup. See "CAL_DRVDN" in the Tegra TRM.
+          $ref: /schemas/types.yaml#/definitions/uint32
+
+        nvidia,pull-up-strength:
+          description: Controls drive strength. 0 is weakest. The range of valid values depends on
+            the pingroup. See "CAL_DRVUP" in the Tegra TRM.
+          $ref: /schemas/types.yaml#/definitions/uint32
+
+        nvidia,slew-rate-rising:
+          description: Controls rising signal slew rate. 0 is fastest. The range of valid values
+            depends on the pingroup. See "DRVDN_SLWR" in the Tegra TRM.
+          $ref: /schemas/types.yaml#/definitions/uint32
+
+        nvidia,slew-rate-falling:
+          description: Controls falling signal slew rate. 0 is fastest. The range of valid values
+            depends on the pingroup. See "DRVUP_SLWF" in the Tegra TRM.
+          $ref: /schemas/types.yaml#/definitions/uint32
+
+      additionalProperties: false
+
+      required:
+        - nvidia,pins
+
+required:
+  - compatible
+  - reg
+
+examples:
+  - |
+    #include <dt-bindings/clock/tegra124-car.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/pinctrl/pinctrl-tegra.h>
+
+    pinmux@70000868 {
+        compatible = "nvidia,tegra124-pinmux";
+        reg = <0x70000868 0x164>, /* Pad control registers */
+              <0x70003000 0x434>, /* Mux registers */
+              <0x70000820 0x8>;   /* MIPI pad control */
+
+        sdmmc4_default: pinmux {
+            sdmmc4_clk_pcc4 {
+                nvidia,pins = "sdmmc4_clk_pcc4";
+                nvidia,function = "sdmmc4";
+                nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+                nvidia,tristate = <TEGRA_PIN_DISABLE>;
+            };
+
+            sdmmc4_dat0_paa0 {
+                nvidia,pins = "sdmmc4_dat0_paa0",
+                              "sdmmc4_dat1_paa1",
+                              "sdmmc4_dat2_paa2",
+                              "sdmmc4_dat3_paa3",
+                              "sdmmc4_dat4_paa4",
+                              "sdmmc4_dat5_paa5",
+                              "sdmmc4_dat6_paa6",
+                              "sdmmc4_dat7_paa7";
+                nvidia,function = "sdmmc4";
+                nvidia,pull = <TEGRA_PIN_PULL_UP>;
+                nvidia,tristate = <TEGRA_PIN_DISABLE>;
+            };
+        };
+    };
+
+    mmc@700b0600 {
+        compatible = "nvidia,tegra124-sdhci";
+        reg = <0x700b0600 0x200>;
+        interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&tegra_car TEGRA124_CLK_SDMMC4>;
+        clock-names = "sdhci";
+        resets = <&tegra_car 15>;
+        reset-names = "sdhci";
+
+        bus-width = <8>;
+        non-removable;
+
+        pinctrl-names = "default";
+        pinctrl-0 = <&sdmmc4_default>;
+    };
diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra194-pinmux.txt b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra194-pinmux.txt
deleted file mode 100644
index 90d38f710635..000000000000
--- a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra194-pinmux.txt
+++ /dev/null
@@ -1,107 +0,0 @@
-NVIDIA Tegra194 pinmux controller
-
-Required properties:
-- compatible: "nvidia,tegra194-pinmux"
-- reg: Should contain a list of base address and size pairs for:
-  - first entry: The APB_MISC_GP_*_PADCTRL registers (pad control)
-  - second entry: The PINMUX_AUX_* registers (pinmux)
-
-Please refer to pinctrl-bindings.txt in this directory for details of the
-common pinctrl bindings used by client devices, including the meaning of the
-phrase "pin configuration node".
-
-Tegra's pin configuration nodes act as a container for an arbitrary number of
-subnodes. Each of these subnodes represents some desired configuration for a
-pin, a group, or a list of pins or groups. This configuration can include the
-mux function to select on those pin(s)/group(s), and various pin configuration
-parameters, such as pull-up, tristate, drive strength, etc.
-
-See the TRM to determine which properties and values apply to each pin/group.
-Macro values for property values are defined in
-include/dt-binding/pinctrl/pinctrl-tegra.h.
-
-Required subnode-properties:
-- nvidia,pins : An array of strings. Each string contains the name of a pin or
-    group. Valid values for these names are listed below.
-
-Optional subnode-properties:
-- nvidia,function: A string containing the name of the function to mux to the
-    pin or group.
-- nvidia,pull: Integer, representing the pull-down/up to apply to the pin.
-    0: none, 1: down, 2: up.
-- nvidia,tristate: Integer.
-    0: drive, 1: tristate.
-- nvidia,enable-input: Integer. Enable the pin's input path.
-    enable :TEGRA_PIN_ENABLE and
-    disable or output only: TEGRA_PIN_DISABLE.
-- nvidia,open-drain: Integer.
-    enable: TEGRA_PIN_ENABLE.
-    disable: TEGRA_PIN_DISABLE.
-- nvidia,lock: Integer. Lock the pin configuration against further changes
-    until reset.
-    enable: TEGRA_PIN_ENABLE.
-    disable: TEGRA_PIN_DISABLE.
-- nvidia,io-hv: Integer. Select high-voltage receivers.
-    normal: TEGRA_PIN_DISABLE
-    high: TEGRA_PIN_ENABLE
-- nvidia,schmitt: Integer. Enables Schmitt Trigger on the input.
-    normal: TEGRA_PIN_DISABLE
-    high: TEGRA_PIN_ENABLE
-- nvidia,drive-type: Integer. Valid range 0...3.
-- nvidia,pull-down-strength: Integer. Controls drive strength. 0 is weakest.
-    The range of valid values depends on the pingroup. See "CAL_DRVDN" in the
-    Tegra TRM.
-- nvidia,pull-up-strength: Integer. Controls drive strength. 0 is weakest.
-    The range of valid values depends on the pingroup. See "CAL_DRVUP" in the
-    Tegra TRM.
-
-Valid values for pin and group names (nvidia,pin) are:
-
-    These correspond to Tegra PADCTL_* (pinmux) registers.
-
-  Mux groups:
-
-    These correspond to Tegra PADCTL_* (pinmux) registers. Any property
-    that exists in those registers may be set for the following pin names.
-
-    pex_l5_clkreq_n_pgg0, pex_l5_rst_n_pgg1
-
-  Drive groups:
-
-    These registers controls a single pin for which a mux group exists.
-    See the list above for the pin name to use when configuring the pinmux.
-
-    pex_l5_clkreq_n_pgg0, pex_l5_rst_n_pgg1
-
-Valid values for nvidia,functions are:
-
-    pe5
-
-Power Domain:
-    pex_l5_clkreq_n_pgg0 and pex_l5_rst_n_pgg1 are part of PCIE C5 power
-    partition. Client devices must enable this partition before accessing
-    these pins here.
-
-
-Example:
-
-		tegra_pinctrl: pinmux: pinmux@2430000 {
-			compatible = "nvidia,tegra194-pinmux";
-			reg = <0x2430000 0x17000
-			       0xc300000 0x4000>;
-
-			pinctrl-names = "pex_rst";
-			pinctrl-0 = <&pex_rst_c5_out_state>;
-
-			pex_rst_c5_out_state: pex_rst_c5_out {
-				pex_rst {
-					nvidia,pins = "pex_l5_rst_n_pgg1";
-					nvidia,schmitt = <TEGRA_PIN_DISABLE>;
-					nvidia,lpdr = <TEGRA_PIN_ENABLE>;
-					nvidia,enable-input = <TEGRA_PIN_DISABLE>;
-					nvidia,io-hv = <TEGRA_PIN_ENABLE>;
-					nvidia,tristate = <TEGRA_PIN_DISABLE>;
-					nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				};
-			};
-		};
diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra194-pinmux.yaml b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra194-pinmux.yaml
new file mode 100644
index 000000000000..66cf1d9a23e8
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra194-pinmux.yaml
@@ -0,0 +1,176 @@
+# SPDX-License-Identifier: (GPL-2.0+ OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/nvidia,tegra194-pinmux.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra194 Pinmux Controller
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Jon Hunter <jonathanh@nvidia.com>
+
+properties:
+  compatible:
+    const: nvidia,tegra194-pinmux
+
+  reg:
+    items:
+      - description: APB_MISC_GP_*_PADCTRL registers (pad control)
+      - description: PINMUX_AUX_* registers (pinmux)
+
+additionalProperties:
+  description: |
+    Tegra's pin configuration nodes act as containers for an arbitrary number of subnodes. Each of
+    these subnodes represents some desired configuration for a pin, a group, or a list of pins or
+    groups. This configuration can include the mux function to select on those pin(s)/group(s), and
+    various pin configuration parameters, such as pull-up, tristate, drive strength, etc.
+
+    The name of each subnode is not important; all subnodes should be enumerated and processed
+    purely based on their content.
+
+    Each subnode only affects those parameters that are explicitly listed. In other words, a
+    subnode that lists a mux function but no pin configuration parameters implies no information
+    about any pin configuration parameters. Similarly, a pin subnode that describes a pullup
+    parameter implies no information about e.g. the mux function or tristate parameter. For this
+    reason, even seemingly boolean values are actually tristates in this binding: unspecified, off,
+    or on. Unspecified is represented as an absent property, and off/on are represented as integer
+    values 0 and 1.
+
+    See the TRM to determine which properties and values apply to each pin/group. Macro values for
+    property values are defined in include/dt-binding/pinctrl/pinctrl-tegra.h.
+  type: object
+  patternProperties:
+    "^[a-z0-9-_]+$":
+      properties:
+        nvidia,pins:
+          description: An array of strings. Each string contains the name of a pin or group. Valid
+            values for these names are listed below.
+
+            Note that the pex_l5_clkreq_n_pgg0 and pex_l5_rst_n_pgg1 pins are part of PCIE C5
+            power partition. Client devices must enable this partition before accessing the
+            configuration for these pins.
+          $ref: /schemas/types.yaml#/definitions/string-array
+          items:
+            enum: [ pex_l5_clkreq_n_pgg0, pex_l5_rst_n_pgg1,
+                    # drive groups
+                    drive_pex_l5_clkreq_n_pgg0, drive_pex_l5_rst_n_pgg1 ]
+
+        nvidia,function:
+          description: A string containing the name of the function to mux to the pin or group.
+          $ref: /schemas/types.yaml#/definitions/string
+          enum: [ pe5 ]
+
+        nvidia,pull:
+          description: Pull-down/up setting to apply to the pin.
+          $ref: /schemas/types.yaml#/definitions/uint32
+          oneOf:
+            - description: none
+              const: 0
+            - description: down
+              const: 1
+            - description: up
+              const: 2
+
+        nvidia,tristate:
+          description: Tristate setting to apply to the pin.
+          $ref: /schemas/types.yaml#/definitions/uint32
+          oneOf:
+            - description: drive
+              const: 0
+            - description: tristate
+              const: 1
+
+        nvidia,enable-input:
+          description: Enable the pin's input path.
+          $ref: /schemas/types.yaml#/definitions/uint32
+          oneOf:
+            - description: disable input (i.e. output only)
+              const: 0
+            - description: enable input
+              const: 1
+
+        nvidia,open-drain:
+          description: Open-drain configuration for the pin.
+          $ref: /schemas/types.yaml#/definitions/uint32
+          oneOf:
+            - description: disable open-drain
+              const: 0
+            - description: enable open-drain
+              const: 1
+
+        nvidia,lock:
+          description: Lock the pin configuration against further changes until reset.
+          $ref: /schemas/types.yaml#/definitions/uint32
+          oneOf:
+            - description: disable pin configuration lock
+              const: 0
+            - description: enable pin configuration lock
+              const: 1
+
+        nvidia,io-hv:
+          description: Select high-voltage receivers.
+          $ref: /schemas/types.yaml#/definitions/uint32
+          oneOf:
+            - description: Use normal receivers.
+              const: 0
+            - description: Use high-voltage receivers.
+              const: 1
+
+        nvidia,schmitt:
+          description: Enable Schmitt trigger on the input.
+          $ref: /schemas/types.yaml#/definitions/uint32
+          oneOf:
+            - description: disable Schmitt trigger on the input
+              const: 0
+            - description: enable Schmitt trigger on the input
+              const: 1
+
+        nvidia,drive-type:
+          description: Drive type to configure for the pin.
+          $ref: /schemas/types.yaml#/definitions/uint32
+          enum: [ 0, 1, 2, 3 ]
+
+        nvidia,pull-down-strength:
+          description: Controls drive strength. 0 is weakest. The range of valid values depends on
+            the pingroup. See "CAL_DRVDN" in the Tegra TRM.
+          $ref: /schemas/types.yaml#/definitions/uint32
+
+        nvidia,pull-up-strength:
+          description: Controls drive strength. 0 is weakest. The range of valid values depends on
+            the pingroup. See "CAL_DRVUP" in the Tegra TRM.
+          $ref: /schemas/types.yaml#/definitions/uint32
+
+      additionalProperties: false
+
+      required:
+        - nvidia,pins
+
+required:
+  - compatible
+  - reg
+
+examples:
+  - |
+    #include <dt-bindings/pinctrl/pinctrl-tegra.h>
+
+    pinmux@2430000 {
+      compatible = "nvidia,tegra194-pinmux";
+      reg = <0x2430000 0x17000>,
+            <0xc300000 0x04000>;
+
+      pinctrl-names = "pex_rst";
+      pinctrl-0 = <&pex_rst_c5_out_state>;
+
+      pex_rst_c5_out_state: pex_rst_c5_out {
+        pex_rst {
+          nvidia,pins = "pex_l5_rst_n_pgg1";
+          nvidia,schmitt = <TEGRA_PIN_DISABLE>;
+          nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+          nvidia,io-hv = <TEGRA_PIN_ENABLE>;
+          nvidia,tristate = <TEGRA_PIN_DISABLE>;
+          nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+        };
+      };
+    };
+...
diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra20-pinmux.txt b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra20-pinmux.txt
deleted file mode 100644
index 3c8ce28baad6..000000000000
--- a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra20-pinmux.txt
+++ /dev/null
@@ -1,143 +0,0 @@
-NVIDIA Tegra20 pinmux controller
-
-Required properties:
-- compatible: "nvidia,tegra20-pinmux"
-- reg: Should contain the register physical address and length for each of
-  the tri-state, mux, pull-up/down, and pad control register sets.
-
-Please refer to pinctrl-bindings.txt in this directory for details of the
-common pinctrl bindings used by client devices, including the meaning of the
-phrase "pin configuration node".
-
-Tegra's pin configuration nodes act as a container for an arbitrary number of
-subnodes. Each of these subnodes represents some desired configuration for a
-pin, a group, or a list of pins or groups. This configuration can include the
-mux function to select on those pin(s)/group(s), and various pin configuration
-parameters, such as pull-up, tristate, drive strength, etc.
-
-The name of each subnode is not important; all subnodes should be enumerated
-and processed purely based on their content.
-
-Each subnode only affects those parameters that are explicitly listed. In
-other words, a subnode that lists a mux function but no pin configuration
-parameters implies no information about any pin configuration parameters.
-Similarly, a pin subnode that describes a pullup parameter implies no
-information about e.g. the mux function or tristate parameter. For this
-reason, even seemingly boolean values are actually tristates in this binding:
-unspecified, off, or on. Unspecified is represented as an absent property,
-and off/on are represented as integer values 0 and 1.
-
-Required subnode-properties:
-- nvidia,pins : An array of strings. Each string contains the name of a pin or
-    group. Valid values for these names are listed below.
-
-Optional subnode-properties:
-- nvidia,function: A string containing the name of the function to mux to the
-  pin or group. Valid values for function names are listed below. See the Tegra
-  TRM to determine which are valid for each pin or group.
-- nvidia,pull: Integer, representing the pull-down/up to apply to the pin.
-    0: none, 1: down, 2: up.
-- nvidia,tristate: Integer.
-    0: drive, 1: tristate.
-- nvidia,high-speed-mode: Integer. Enable high speed mode the pins.
-    0: no, 1: yes.
-- nvidia,schmitt: Integer. Enables Schmitt Trigger on the input.
-    0: no, 1: yes.
-- nvidia,low-power-mode: Integer. Valid values 0-3. 0 is least power, 3 is
-    most power. Controls the drive power or current. See "Low Power Mode"
-    or "LPMD1" and "LPMD0" in the Tegra TRM.
-- nvidia,pull-down-strength: Integer. Controls drive strength. 0 is weakest.
-    The range of valid values depends on the pingroup. See "CAL_DRVDN" in the
-    Tegra TRM.
-- nvidia,pull-up-strength: Integer. Controls drive strength. 0 is weakest.
-    The range of valid values depends on the pingroup. See "CAL_DRVUP" in the
-    Tegra TRM.
-- nvidia,slew-rate-rising: Integer. Controls rising signal slew rate. 0 is
-    fastest. The range of valid values depends on the pingroup. See
-    "DRVDN_SLWR" in the Tegra TRM.
-- nvidia,slew-rate-falling: Integer. Controls falling signal slew rate. 0 is
-    fastest. The range of valid values depends on the pingroup. See
-    "DRVUP_SLWF" in the Tegra TRM.
-
-Note that many of these properties are only valid for certain specific pins
-or groups. See the Tegra TRM and various pinmux spreadsheets for complete
-details regarding which groups support which functionality. The Linux pinctrl
-driver may also be a useful reference, since it consolidates, disambiguates,
-and corrects data from all those sources.
-
-Valid values for pin and group names are:
-
-  mux groups:
-
-    These all support nvidia,function, nvidia,tristate, and many support
-    nvidia,pull.
-
-    ata, atb, atc, atd, ate, cdev1, cdev2, crtp, csus, dap1, dap2, dap3, dap4,
-    ddc, dta, dtb, dtc, dtd, dte, dtf, gma, gmb, gmc, gmd, gme, gpu, gpu7,
-    gpv, hdint, i2cp, irrx, irtx, kbca, kbcb, kbcc, kbcd, kbce, kbcf, lcsn,
-    ld0, ld1, ld2, ld3, ld4, ld5, ld6, ld7, ld8, ld9, ld10, ld11, ld12, ld13,
-    ld14, ld15, ld16, ld17, ldc, ldi, lhp0, lhp1, lhp2, lhs, lm0, lm1, lpp,
-    lpw0, lpw1, lpw2, lsc0, lsc1, lsck, lsda, lsdi, lspi, lvp0, lvp1, lvs,
-    owc, pmc, pta, rm, sdb, sdc, sdd, sdio1, slxa, slxc, slxd, slxk, spdi,
-    spdo, spia, spib, spic, spid, spie, spif, spig, spih, uaa, uab, uac, uad,
-    uca, ucb, uda.
-
-  tristate groups:
-
-    These only support nvidia,pull.
-
-    ck32, ddrc, pmca, pmcb, pmcc, pmcd, pmce, xm2c, xm2d, ls, lc, ld17_0,
-    ld19_18, ld21_20, ld23_22.
-
-  drive groups:
-
-    With some exceptions, these support nvidia,high-speed-mode,
-    nvidia,schmitt, nvidia,low-power-mode, nvidia,pull-down-strength,
-    nvidia,pull-up-strength, nvidia,slew-rate-rising, nvidia,slew-rate-falling.
-
-    drive_ao1, drive_ao2, drive_at1, drive_at2, drive_cdev1, drive_cdev2,
-    drive_csus, drive_dap1, drive_dap2, drive_dap3, drive_dap4, drive_dbg,
-    drive_lcd1, drive_lcd2, drive_sdmmc2, drive_sdmmc3, drive_spi, drive_uaa,
-    drive_uab, drive_uart2, drive_uart3, drive_vi1, drive_vi2, drive_xm2a,
-    drive_xm2c, drive_xm2d, drive_xm2clk, drive_sdio1, drive_crt, drive_ddc,
-    drive_gma, drive_gmb, drive_gmc, drive_gmd, drive_gme, drive_owr,
-    drive_uda.
-
-Valid values for nvidia,functions are:
-
-  ahb_clk, apb_clk, audio_sync, crt, dap1, dap2, dap3, dap4, dap5,
-  displaya, displayb, emc_test0_dll, emc_test1_dll, gmi, gmi_int,
-  hdmi, i2cp, i2c1, i2c2, i2c3, ide, irda, kbc, mio, mipi_hs, nand,
-  osc, owr, pcie, plla_out, pllc_out1, pllm_out1, pllp_out2, pllp_out3,
-  pllp_out4, pwm, pwr_intr, pwr_on, rsvd1, rsvd2, rsvd3, rsvd4, rtck,
-  sdio1, sdio2, sdio3, sdio4, sflash, spdif, spi1, spi2, spi2_alt,
-  spi3, spi4, trace, twc, uarta, uartb, uartc, uartd, uarte, ulpi,
-  vi, vi_sensor_clk, xio
-
-Example:
-
-	pinctrl@70000000 {
-		compatible = "nvidia,tegra20-pinmux";
-		reg = < 0x70000014 0x10    /* Tri-state registers */
-			0x70000080 0x20    /* Mux registers */
-			0x700000a0 0x14    /* Pull-up/down registers */
-			0x70000868 0xa8 >; /* Pad control registers */
-	};
-
-Example board file extract:
-
-	pinctrl@70000000 {
-		sdio4_default: sdio4_default {
-			atb {
-				nvidia,pins = "atb", "gma", "gme";
-				nvidia,function = "sdio4";
-				nvidia,pull = <0>;
-				nvidia,tristate = <0>;
-			};
-		};
-	};
-
-	sdhci@c8000600 {
-		pinctrl-names = "default";
-		pinctrl-0 = <&sdio4_default>;
-	};
diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra20-pinmux.yaml b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra20-pinmux.yaml
new file mode 100644
index 000000000000..a0c44bf7a7b1
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra20-pinmux.yaml
@@ -0,0 +1,203 @@
+# SPDX-License-Identifier: (GPL-2.0+ OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/nvidia,tegra20-pinmux.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra20 Pinmux Controller
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Jon Hunter <jonathanh@nvidia.com>
+
+properties:
+  compatible:
+    const: nvidia,tegra20-pinmux
+
+  reg:
+    items:
+      - description: tri-state registers
+      - description: mux register
+      - description: pull-up/down registers
+      - description: pad control registers
+
+additionalProperties:
+  type: object
+  description: |
+    Please refer to pinctrl-bindings.txt in this directory for details of the common pinctrl
+    bindings used by client devices, including the meaning of the phrase "pin configuration
+    node".
+
+    Tegra's pin configuration nodes act as a container for an arbitrary number of subnodes. Each
+    of these subnodes represents some desired configuration for a pin, a group, or a list of
+    pins or groups. This configuration can include the mux function to select on those pin(s)/
+    group(s), and various pin configuration parameters, such as pull-up, tristate, drive
+    strength, etc.
+
+    The name of each subnode is not important; all subnodes should be enumerated and processed
+    purely based on their content.
+
+    Each subnode only affects those parameters that are explicitly listed. In other words, a
+    subnode that lists a mux function but no pin configuration parameters implies no information
+    about any pin configuration parameters.
+
+    Similarly, a pin subnode that describes a pullup parameter implies no information about e.g.
+    the mux function or tristate parameter. For this reason, even seemingly boolean values are
+    actually tristates in this binding: unspecified, off, or on. Unspecified is represented as
+    an absent property, and off/on are represented as integer values 0 and 1.
+
+    Note that many of these properties are only valid for certain specific pins or groups. See
+    the Tegra TRM and various pinmux spreadsheets for complete details regarding which groups
+    support which functionality. The Linux pinctrl driver may also be a useful reference, since
+    it consolidates, disambiguates, and corrects data from all those sources.
+
+  patternProperties:
+    "^pinmux(-[a-z0-9-_]+)?$":
+      type: object
+      properties:
+        nvidia,pins:
+          $ref: /schemas/types.yaml#/definitions/string-array
+          description: An array of strings. Each string contains the name of a pin or group.
+            Valid values for these names are listed below.
+          items:
+            enum: [ ata, atb, atc, atd, ate, cdev1, cdev2, crtp, csus, dap1, dap2, dap3, dap4,
+                    ddc, dta, dtb, dtc, dtd, dte, dtf, gma, gmb, gmc, gmd, gme, gpu, gpu7, gpv,
+                    hdint, i2cp, irrx, irtx, kbca, kbcb, kbcc, kbcd, kbce, kbcf, lcsn, ld0, ld1,
+                    ld2, ld3, ld4, ld5, ld6, ld7, ld8, ld9, ld10, ld11, ld12, ld13, ld14, ld15,
+                    ld16, ld17, ldc, ldi, lhp0, lhp1, lhp2, lhs, lm0, lm1, lpp, lpw0, lpw1, lpw2,
+                    lsc0, lsc1, lsck, lsda, lsdi, lspi, lvp0, lvp1, lvs, owc, pmc, pta, rm, sdb,
+                    sdc, sdd, sdio1, slxa, slxc, slxd, slxk, spdi, spdo, spia, spib, spic, spid,
+                    spie, spif, spig, spih, uaa, uab, uac, uad, uca, ucb, uda,
+                    # tristate groups
+                    ck32, ddrc, pmca, pmcb, pmcc, pmcd, pmce, xm2c, xm2d, ls, lc, ld17_0,
+                    ld19_18, ld21_20, ld23_22,
+                    # drive groups
+                    drive_ao1, drive_ao2, drive_at1, drive_at2, drive_cdev1, drive_cdev2,
+                    drive_csus, drive_dap1, drive_dap2, drive_dap3, drive_dap4, drive_dbg,
+                    drive_lcd1, drive_lcd2, drive_sdmmc2, drive_sdmmc3, drive_spi, drive_uaa,
+                    drive_uab, drive_uart2, drive_uart3, drive_vi1, drive_vi2, drive_xm2a,
+                    drive_xm2c, drive_xm2d, drive_xm2clk, drive_sdio1, drive_crt, drive_ddc,
+                    drive_gma, drive_gmb, drive_gmc, drive_gmd, drive_gme, drive_owr,
+                    drive_uda ]
+
+        nvidia,function:
+          $ref: /schemas/types.yaml#/definitions/string
+          description: A string containing the name of the function to mux to the pin or group.
+            Valid values for function names are listed below. See the Tegra TRM to determine
+            which are valid for each pin or group.
+          enum: [ ahb_clk, apb_clk, audio_sync, crt, dap1, dap2, dap3, dap4, dap5, displaya,
+                  displayb, emc_test0_dll, emc_test1_dll, gmi, gmi_int, hdmi, i2cp, i2c1, i2c2,
+                  i2c3, ide, irda, kbc, mio, mipi_hs, nand, osc, owr, pcie, plla_out, pllc_out1,
+                  pllm_out1, pllp_out2, pllp_out3, pllp_out4, pwm, pwr_intr, pwr_on, rsvd1,
+                  rsvd2, rsvd3, rsvd4, rtck, sdio1, sdio2, sdio3, sdio4, sflash, spdif, spi1,
+                  spi2, spi2_alt, spi3, spi4, trace, twc, uarta, uartb, uartc, uartd, uarte,
+                  ulpi, vi, vi_sensor_clk, xio ]
+
+        nvidia,pull:
+          description: Pull-down/up setting to apply to the pin.
+          $ref: /schemas/types.yaml#/definitions/uint32
+          oneOf:
+            - description: none
+              const: 0
+            - description: down
+              const: 1
+            - description: up
+              const: 2
+
+        nvidia,tristate:
+          description: Tristate setting to apply to the pin.
+          $ref: /schemas/types.yaml#/definitions/uint32
+          oneOf:
+            - description: drive
+              const: 0
+            - description: tristate
+              const: 1
+
+        nvidia,high-speed-mode:
+          description: Enable high speed mode the pins.
+          $ref: /schemas/types.yaml#/definitions/uint32
+          oneOf:
+            - description: normal speed mode
+              const: 0
+            - description: high speed mode
+              const: 1
+
+        nvidia,schmitt:
+          description: Enable Schmitt trigger on the input.
+          $ref: /schemas/types.yaml#/definitions/uint32
+          oneOf:
+            - description: disable Schmitt trigger on the input
+              const: 0
+            - description: enable Schmitt trigger on the input
+              const: 1
+
+        nvidia,low-power-mode:
+          description: Controls the drive power or current. Valid values are from 0 through 3,
+            where 0 specifies the least power and 3 specifies the most power. See "Low Power
+            Mode" or "LPMD1" and "LPMD0" in the Tegra TRM.
+          $ref: /schemas/types.yaml#/definitions/uint32
+          enum: [ 0, 1, 2, 3 ]
+
+        nvidia,pull-down-strength:
+          description: Controls drive strength. 0 is weakest. The range of valid values depends
+            on the pingroup. See "CAL_DRVDN" in the Tegra TRM.
+          $ref: /schemas/types.yaml#/definitions/uint32
+
+        nvidia,pull-up-strength:
+          description: Controls drive strength. 0 is weakest. The range of valid values depends
+            on the pingroup. See "CAL_DRVUP" in the Tegra TRM.
+          $ref: /schemas/types.yaml#/definitions/uint32
+
+        nvidia,slew-rate-rising:
+          description: Controls rising signal slew rate. 0 is fastest. The range of valid values
+            depends on the pingroup. See "DRVDN_SLWR" in the Tegra TRM.
+          $ref: /schemas/types.yaml#/definitions/uint32
+
+        nvidia,slew-rate-falling:
+          description: Controls falling signal slew rate. 0 is fastest. The range of valid
+            values depends on the pingroup. See "DRVUP_SLWF" in the Tegra TRM.
+          $ref: /schemas/types.yaml#/definitions/uint32
+
+      additionalProperties: false
+
+      required:
+        - nvidia,pins
+
+required:
+  - compatible
+  - reg
+
+examples:
+  - |
+    #include <dt-bindings/clock/tegra20-car.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    pinctrl@70000000 {
+      compatible = "nvidia,tegra20-pinmux";
+      reg = <0x70000014 0x10>, /* Tri-state registers */
+            <0x70000080 0x20>, /* Mux registers */
+            <0x700000a0 0x14>, /* Pull-up/down registers */
+            <0x70000868 0xa8>; /* Pad control registers */
+
+      pinmux {
+        atb {
+          nvidia,pins = "atb", "gma", "gme";
+          nvidia,function = "sdio4";
+          nvidia,pull = <0>;
+          nvidia,tristate = <0>;
+        };
+      };
+    };
+
+    mmc@c8000600 {
+      compatible = "nvidia,tegra20-sdhci";
+      reg = <0xc8000600 0x200>;
+      interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
+      clocks = <&tegra_car TEGRA20_CLK_SDMMC4>;
+      clock-names = "sdhci";
+      resets = <&tegra_car 15>;
+      reset-names = "sdhci";
+
+      pinctrl-names = "default";
+      pinctrl-0 = <&sdio4_default>;
+    };
diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra210-pinmux.txt b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra210-pinmux.txt
deleted file mode 100644
index 85f211436b8e..000000000000
--- a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra210-pinmux.txt
+++ /dev/null
@@ -1,166 +0,0 @@
-NVIDIA Tegra210 pinmux controller
-
-Required properties:
-- compatible: "nvidia,tegra210-pinmux"
-- reg: Should contain a list of base address and size pairs for:
-  - first entry: The APB_MISC_GP_*_PADCTRL registers (pad control)
-  - second entry: The PINMUX_AUX_* registers (pinmux)
-
-Please refer to pinctrl-bindings.txt in this directory for details of the
-common pinctrl bindings used by client devices, including the meaning of the
-phrase "pin configuration node".
-
-Tegra's pin configuration nodes act as a container for an arbitrary number of
-subnodes. Each of these subnodes represents some desired configuration for a
-pin, a group, or a list of pins or groups. This configuration can include the
-mux function to select on those pin(s)/group(s), and various pin configuration
-parameters, such as pull-up, tristate, drive strength, etc.
-
-The name of each subnode is not important; all subnodes should be enumerated
-and processed purely based on their content.
-
-Each subnode only affects those parameters that are explicitly listed. In
-other words, a subnode that lists a mux function but no pin configuration
-parameters implies no information about any pin configuration parameters.
-Similarly, a pin subnode that describes a pullup parameter implies no
-information about e.g. the mux function or tristate parameter. For this
-reason, even seemingly boolean values are actually tristates in this binding:
-unspecified, off, or on. Unspecified is represented as an absent property,
-and off/on are represented as integer values 0 and 1.
-
-See the TRM to determine which properties and values apply to each pin/group.
-Macro values for property values are defined in
-include/dt-binding/pinctrl/pinctrl-tegra.h.
-
-Required subnode-properties:
-- nvidia,pins : An array of strings. Each string contains the name of a pin or
-    group. Valid values for these names are listed below.
-
-Optional subnode-properties:
-- nvidia,function: A string containing the name of the function to mux to the
-    pin or group.
-- nvidia,pull: Integer, representing the pull-down/up to apply to the pin.
-    0: none, 1: down, 2: up.
-- nvidia,tristate: Integer.
-    0: drive, 1: tristate.
-- nvidia,enable-input: Integer. Enable the pin's input path.
-    enable :TEGRA_PIN_ENABLE and
-    disable or output only: TEGRA_PIN_DISABLE.
-- nvidia,open-drain: Integer.
-    enable: TEGRA_PIN_ENABLE.
-    disable: TEGRA_PIN_DISABLE.
-- nvidia,lock: Integer. Lock the pin configuration against further changes
-    until reset.
-    enable: TEGRA_PIN_ENABLE.
-    disable: TEGRA_PIN_DISABLE.
-- nvidia,io-hv: Integer. Select high-voltage receivers.
-    normal: TEGRA_PIN_DISABLE
-    high: TEGRA_PIN_ENABLE
-- nvidia,high-speed-mode: Integer. Enable high speed mode the pins.
-    normal: TEGRA_PIN_DISABLE
-    high: TEGRA_PIN_ENABLE
-- nvidia,schmitt: Integer. Enables Schmitt Trigger on the input.
-    normal: TEGRA_PIN_DISABLE
-    high: TEGRA_PIN_ENABLE
-- nvidia,drive-type: Integer. Valid range 0...3.
-- nvidia,pull-down-strength: Integer. Controls drive strength. 0 is weakest.
-    The range of valid values depends on the pingroup. See "CAL_DRVDN" in the
-    Tegra TRM.
-- nvidia,pull-up-strength: Integer. Controls drive strength. 0 is weakest.
-    The range of valid values depends on the pingroup. See "CAL_DRVUP" in the
-    Tegra TRM.
-- nvidia,slew-rate-rising: Integer. Controls rising signal slew rate. 0 is
-    fastest. The range of valid values depends on the pingroup. See
-    "DRVDN_SLWR" in the Tegra TRM.
-- nvidia,slew-rate-falling: Integer. Controls falling signal slew rate. 0 is
-    fastest. The range of valid values depends on the pingroup. See
-    "DRVUP_SLWF" in the Tegra TRM.
-
-Valid values for pin and group names (nvidia,pin) are:
-
-  Mux groups:
-
-    These correspond to Tegra PINMUX_AUX_* (pinmux) registers. Any property
-    that exists in those registers may be set for the following pin names.
-
-    In Tegra210, many pins also have a dedicated APB_MISC_GP_*_PADCTRL
-    register. Where that is true, and property that exists in that register
-    may also be set on the following pin names.
-
-    als_prox_int_px3, ap_ready_pv5, ap_wake_bt_ph3, ap_wake_nfc_ph7,
-    aud_mclk_pbb0, batt_bcl, bt_rst_ph4, bt_wake_ap_ph5, button_home_py1,
-    button_power_on_px5, button_slide_sw_py0, button_vol_down_px7,
-    button_vol_up_px6, cam1_mclk_ps0, cam1_pwdn_ps7, cam1_strobe_pt1,
-    cam2_mclk_ps1, cam2_pwdn_pt0, cam_af_en_ps5, cam_flash_en_ps6,
-    cam_i2c_scl_ps2, cam_i2c_sda_ps3, cam_rst_ps4cam_rst_ps4, clk_32k_in,
-    clk_32k_out_py5, clk_req, core_pwr_req, cpu_pwr_req, dap1_din_pb1,
-    dap1_dout_pb2, dap1_fs_pb0, dap1_sclk_pb3, dap2_din_paa2, dap2_dout_paa3,
-    dap2_fs_paa0, dap2_sclk_paa1, dap4_din_pj5, dap4_dout_pj6, dap4_fs_pj4,
-    dap4_sclk_pj7, dmic1_clk_pe0, dmic1_dat_pe1, dmic2_clk_pe2, dmic2_dat_pe3,
-    dmic3_clk_pe4, dmic3_dat_pe5, dp_hpd0_pcc6, dvfs_clk_pbb2, dvfs_pwm_pbb1,
-    gen1_i2c_scl_pj1, gen1_i2c_sda_pj0, gen2_i2c_scl_pj2, gen2_i2c_sda_pj3,
-    gen3_i2c_scl_pf0, gen3_i2c_sda_pf1, gpio_x1_aud_pbb3, gpio_x3_aud_pbb4,
-    gps_en_pi2, gps_rst_pi3, hdmi_cec_pcc0, hdmi_int_dp_hpd_pcc1, jtag_rtck,
-    lcd_bl_en_pv1, lcd_bl_pwm_pv0, lcd_gpio1_pv3, lcd_gpio2_pv4, lcd_rst_pv2,
-    lcd_te_py2, modem_wake_ap_px0, motion_int_px2, nfc_en_pi0, nfc_int_pi1,
-    pa6, pcc7, pe6, pe7, pex_l0_clkreq_n_pa1, pex_l0_rst_n_pa0,
-    pex_l1_clkreq_n_pa4, pex_l1_rst_n_pa3, pex_wake_n_pa2, ph6, pk0, pk1, pk2,
-    pk3, pk4, pk5, pk6, pk7, pl0, pl1, pwr_i2c_scl_py3, pwr_i2c_sda_py4,
-    pwr_int_n, pz0, pz1, pz2, pz3, pz4, pz5, qspi_cs_n_pee1, qspi_io0_pee2,
-    qspi_io1_pee3, qspi_io2_pee4, qspi_io3_pee5, qspi_sck_pee0,
-    sata_led_active_pa5, sdmmc1_clk_pm0, sdmmc1_cmd_pm1, sdmmc1_dat0_pm5,
-    sdmmc1_dat1_pm4, sdmmc1_dat2_pm3, sdmmc1_dat3_pm2, sdmmc3_clk_pp0,
-    sdmmc3_cmd_pp1, sdmmc3_dat0_pp5, sdmmc3_dat1_pp4, sdmmc3_dat2_pp3,
-    sdmmc3_dat3_pp2, shutdown, spdif_in_pcc3, spdif_out_pcc2, spi1_cs0_pc3,
-    spi1_cs1_pc4, spi1_miso_pc1, spi1_mosi_pc0, spi1_sck_pc2, spi2_cs0_pb7,
-    spi2_cs1_pdd0, spi2_miso_pb5, spi2_mosi_pb4, spi2_sck_pb6, spi4_cs0_pc6,
-    spi4_miso_pd0, spi4_mosi_pc7, spi4_sck_pc5, temp_alert_px4, touch_clk_pv7,
-    touch_int_px1, touch_rst_pv6, uart1_cts_pu3, uart1_rts_pu2, uart1_rx_pu1,
-    uart1_tx_pu0, uart2_cts_pg3, uart2_rts_pg2, uart2_rx_pg1, uart2_tx_pg0,
-    uart3_cts_pd4, uart3_rts_pd3, uart3_rx_pd2, uart3_tx_pd1, uart4_cts_pi7,
-    uart4_rts_pi6, uart4_rx_pi5, uart4_tx_pi4, usb_vbus_en0_pcc4,
-    usb_vbus_en1_pcc5, wifi_en_ph0, wifi_rst_ph1, wifi_wake_ap_ph2
-
-  Drive groups:
-
-    These correspond to the Tegra APB_MISC_GP_*_PADCTRL (pad control)
-    registers. Note that where one of these registers controls a single pin
-    for which a PINMUX_AUX_* exists, see the list above for the pin name to
-    use when configuring the pinmux.
-
-    pa6, pcc7, pe6, pe7, ph6, pk0, pk1, pk2, pk3, pk4, pk5, pk6, pk7, pl0, pl1,
-    pz0, pz1, pz2, pz3, pz4, pz5, sdmmc1, sdmmc2, sdmmc3, sdmmc4
-
-Valid values for nvidia,functions are:
-
-    aud, bcl, blink, ccla, cec, cldvfs, clk, core, cpu, displaya, displayb,
-    dmic1, dmic2, dmic3, dp, dtv, extperiph3, i2c1, i2c2, i2c3, i2cpmu, i2cvi,
-    i2s1, i2s2, i2s3, i2s4a, i2s4b, i2s5a, i2s5b, iqc0, iqc1, jtag, pe, pe0,
-    pe1, pmi, pwm0, pwm1, pwm2, pwm3, qspi, rsvd0, rsvd1, rsvd2, rsvd3, sata,
-    sdmmc1, sdmmc3, shutdown, soc, sor0, sor1, spdif, spi1, spi2, spi3, spi4,
-    sys, touch, uart, uarta, uartb, uartc, uartd, usb, vgp1, vgp2, vgp3, vgp4,
-    vgp5, vgp6, vimclk, vimclk2
-
-Example:
-
-	pinmux: pinmux@70000800 {
-		compatible = "nvidia,tegra210-pinmux";
-		reg = <0x0 0x700008d4 0x0 0x2a8>, /* Pad control registers */
-		      <0x0 0x70003000 0x0 0x1000>; /* Mux registers */
-
-		pinctrl-names = "boot";
-		pinctrl-0 = <&state_boot>;
-
-		state_boot: pinmux {
-			gen1_i2c_scl_pj1 {
-				nvidia,pins = "gen1_i2c_scl_pj1",
-				nvidia,function = "i2c1";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
-				nvidia,open-drain = <TEGRA_PIN_ENABLE>;
-				nvidia,io-hv = <TEGRA_PIN_ENABLE>;
-			};
-		};
-	};
-};
diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra210-pinmux.yaml b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra210-pinmux.yaml
new file mode 100644
index 000000000000..fae863fb96a3
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra210-pinmux.yaml
@@ -0,0 +1,232 @@
+# SPDX-License-Identifier: (GPL-2.0+ OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/nvidia,tegra210-pinmux.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra210 Pinmux Controller
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Jon Hunter <jonathanh@nvidia.com>
+
+properties:
+  compatible:
+    const: nvidia,tegra210-pinmux
+
+  reg:
+    items:
+      - description: APB_MISC_GP_*_PADCTRL register (pad control)
+      - description: PINMUX_AUX_* registers (pinmux)
+
+additionalProperties:
+  description: |
+    Tegra's pin configuration nodes act as containers for an arbitrary number of subnodes. Each of
+    these subnodes represents some desired configuration for a pin, a group, or a list of pins or
+    groups. This configuration can include the mux function to select on those pin(s)/group(s), and
+    various pin configuration parameters, such as pull-up, tristate, drive strength, etc.
+
+    The name of each subnode is not important; all subnodes should be enumerated and processed
+    purely based on their content.
+
+    Each subnode only affects those parameters that are explicitly listed. In other words, a
+    subnode that lists a mux function but no pin configuration parameters implies no information
+    about any pin configuration parameters. Similarly, a pin subnode that describes a pullup
+    parameter implies no information about e.g. the mux function or tristate parameter. For this
+    reason, even seemingly boolean values are actually tristates in this binding: unspecified, off,
+    or on. Unspecified is represented as an absent property, and off/on are represented as integer
+    values 0 and 1.
+
+    See the TRM to determine which properties and values apply to each pin/group. Macro values for
+    property values are defined in include/dt-binding/pinctrl/pinctrl-tegra.h.
+  type: object
+  patternProperties:
+    "^[a-z0-9-_]+$":
+      properties:
+        nvidia,pins:
+          description: An array of strings. Each string contains the name of a pin or group. Valid
+            values for these names are listed below.
+          $ref: /schemas/types.yaml#/definitions/string-array
+          items:
+            enum: [ als_prox_int_px3, ap_ready_pv5, ap_wake_bt_ph3, ap_wake_nfc_ph7,
+                    aud_mclk_pbb0, batt_bcl, bt_rst_ph4, bt_wake_ap_ph5, button_home_py1,
+                    button_power_on_px5, button_slide_sw_py0, button_vol_down_px7,
+                    button_vol_up_px6, cam1_mclk_ps0, cam1_pwdn_ps7, cam1_strobe_pt1,
+                    cam2_mclk_ps1, cam2_pwdn_pt0, cam_af_en_ps5, cam_flash_en_ps6,
+                    cam_i2c_scl_ps2, cam_i2c_sda_ps3, cam_rst_ps4, clk_32k_in, clk_32k_out_py5,
+                    clk_req, core_pwr_req, cpu_pwr_req, dap1_din_pb1, dap1_dout_pb2, dap1_fs_pb0,
+                    dap1_sclk_pb3, dap2_din_paa2, dap2_dout_paa3, dap2_fs_paa0, dap2_sclk_paa1,
+                    dap4_din_pj5, dap4_dout_pj6, dap4_fs_pj4, dap4_sclk_pj7, dmic1_clk_pe0,
+                    dmic1_dat_pe1, dmic2_clk_pe2, dmic2_dat_pe3, dmic3_clk_pe4, dmic3_dat_pe5,
+                    dp_hpd0_pcc6, dvfs_clk_pbb2, dvfs_pwm_pbb1, gen1_i2c_scl_pj1, gen1_i2c_sda_pj0,
+                    gen2_i2c_scl_pj2, gen2_i2c_sda_pj3, gen3_i2c_scl_pf0, gen3_i2c_sda_pf1,
+                    gpio_x1_aud_pbb3, gpio_x3_aud_pbb4, gps_en_pi2, gps_rst_pi3, hdmi_cec_pcc0,
+                    hdmi_int_dp_hpd_pcc1, jtag_rtck, lcd_bl_en_pv1, lcd_bl_pwm_pv0, lcd_gpio1_pv3,
+                    lcd_gpio2_pv4, lcd_rst_pv2, lcd_te_py2, modem_wake_ap_px0, motion_int_px2,
+                    nfc_en_pi0, nfc_int_pi1, pa6, pcc7, pe6, pe7, pex_l0_clkreq_n_pa1,
+                    pex_l0_rst_n_pa0, pex_l1_clkreq_n_pa4, pex_l1_rst_n_pa3, pex_wake_n_pa2, ph6,
+                    pk0, pk1, pk2, pk3, pk4, pk5, pk6, pk7, pl0, pl1, pwr_i2c_scl_py3,
+                    pwr_i2c_sda_py4, pwr_int_n, pz0, pz1, pz2, pz3, pz4, pz5, qspi_cs_n_pee1,
+                    qspi_io0_pee2, qspi_io1_pee3, qspi_io2_pee4, qspi_io3_pee5, qspi_sck_pee0,
+                    sata_led_active_pa5, sdmmc1_clk_pm0, sdmmc1_cmd_pm1, sdmmc1_dat0_pm5,
+                    sdmmc1_dat1_pm4, sdmmc1_dat2_pm3, sdmmc1_dat3_pm2, sdmmc3_clk_pp0,
+                    sdmmc3_cmd_pp1, sdmmc3_dat0_pp5, sdmmc3_dat1_pp4, sdmmc3_dat2_pp3,
+                    sdmmc3_dat3_pp2, shutdown, spdif_in_pcc3, spdif_out_pcc2, spi1_cs0_pc3,
+                    spi1_cs1_pc4, spi1_miso_pc1, spi1_mosi_pc0, spi1_sck_pc2, spi2_cs0_pb7,
+                    spi2_cs1_pdd0, spi2_miso_pb5, spi2_mosi_pb4, spi2_sck_pb6, spi4_cs0_pc6,
+                    spi4_miso_pd0, spi4_mosi_pc7, spi4_sck_pc5, temp_alert_px4, touch_clk_pv7,
+                    touch_int_px1, touch_rst_pv6, uart1_cts_pu3, uart1_rts_pu2, uart1_rx_pu1,
+                    uart1_tx_pu0, uart2_cts_pg3, uart2_rts_pg2, uart2_rx_pg1, uart2_tx_pg0,
+                    uart3_cts_pd4, uart3_rts_pd3, uart3_rx_pd2, uart3_tx_pd1, uart4_cts_pi7,
+                    uart4_rts_pi6, uart4_rx_pi5, uart4_tx_pi4, usb_vbus_en0_pcc4,
+                    usb_vbus_en1_pcc5, wifi_en_ph0, wifi_rst_ph1, wifi_wake_ap_ph2,
+                    # drive groups
+                    drive_pa6, drive_pcc7, drive_pe6, drive_pe7, drive_ph6, drive_pk0, drive_pk1,
+                    drive_pk2, drive_pk3, drive_pk4, drive_pk5, drive_pk6, drive_pk7, drive_pl0,
+                    drive_pl1, drive_pz0, drive_pz1, drive_pz2, drive_pz3, drive_pz4, drive_pz5,
+                    drive_sdmmc1, drive_sdmmc2, drive_sdmmc3, drive_sdmmc4 ]
+
+        nvidia,function:
+          description: A string containing the name of the function to mux to the pin or group.
+          $ref: /schemas/types.yaml#/definitions/string
+          enum: [ aud, bcl, blink, ccla, cec, cldvfs, clk, core, cpu, displaya,
+                  displayb, dmic1, dmic2, dmic3, dp, dtv, extperiph3, i2c1, i2c2,
+                  i2c3, i2cpmu, i2cvi, i2s1, i2s2, i2s3, i2s4a, i2s4b, i2s5a,
+                  i2s5b, iqc0, iqc1, jtag, pe, pe0, pe1, pmi, pwm0, pwm1, pwm2,
+                  pwm3, qspi, rsvd0, rsvd1, rsvd2, rsvd3, sata, sdmmc1, sdmmc3,
+                  shutdown, soc, sor0, sor1, spdif, spi1, spi2, spi3, spi4, sys,
+                  touch, uart, uarta, uartb, uartc, uartd, usb, vgp1, vgp2, vgp3,
+                  vgp4, vgp5, vgp6, vimclk, vimclk2 ]
+
+        nvidia,pull:
+          description: Pull-down/up setting to apply to the pin.
+          $ref: /schemas/types.yaml#/definitions/uint32
+          oneOf:
+            - description: none
+              const: 0
+            - description: down
+              const: 1
+            - description: up
+              const: 2
+
+        nvidia,tristate:
+          description: Tristate setting to apply to the pin.
+          $ref: /schemas/types.yaml#/definitions/uint32
+          oneOf:
+            - description: drive
+              const: 0
+            - description: tristate
+              const: 1
+
+        nvidia,enable-input:
+          description: Enable the pin's input path.
+          $ref: /schemas/types.yaml#/definitions/uint32
+          oneOf:
+            - description: disable input (i.e. output only)
+              const: 0
+            - description: enable input
+              const: 1
+
+        nvidia,open-drain:
+          description: Open-drain configuration for the pin.
+          $ref: /schemas/types.yaml#/definitions/uint32
+          oneOf:
+            - description: disable open-drain
+              const: 0
+            - description: enable open-drain
+              const: 1
+
+        nvidia,lock:
+          description: Lock the pin configuration against further changes until reset.
+          $ref: /schemas/types.yaml#/definitions/uint32
+          oneOf:
+            - description: disable pin configuration lock
+              const: 0
+            - description: enable pin configuration lock
+              const: 1
+
+        nvidia,io-hv:
+          description: Select high-voltage receivers.
+          $ref: /schemas/types.yaml#/definitions/uint32
+          oneOf:
+            - description: Use normal receivers.
+              const: 0
+            - description: Use high-voltage receivers.
+              const: 1
+
+        nvidia,high-speed-mode:
+          description: Enable high speed mode the pins.
+          $ref: /schemas/types.yaml#/definitions/uint32
+          oneOf:
+            - description: normal speed mode
+              const: 0
+            - description: high speed mode
+              const: 1
+
+        nvidia,schmitt:
+          description: Enable Schmitt trigger on the input.
+          $ref: /schemas/types.yaml#/definitions/uint32
+          oneOf:
+            - description: disable Schmitt trigger on the input
+              const: 0
+            - description: enable Schmitt trigger on the input
+              const: 1
+
+        nvidia,drive-type:
+          description: Drive type to configure for the pin.
+          $ref: /schemas/types.yaml#/definitions/uint32
+          enum: [ 0, 1, 2, 3 ]
+
+        nvidia,pull-down-strength:
+          description: Controls drive strength. 0 is weakest. The range of valid values depends on
+            the pingroup. See "CAL_DRVDN" in the Tegra TRM.
+          $ref: /schemas/types.yaml#/definitions/uint32
+
+        nvidia,pull-up-strength:
+          description: Controls drive strength. 0 is weakest. The range of valid values depends on
+            the pingroup. See "CAL_DRVUP" in the Tegra TRM.
+          $ref: /schemas/types.yaml#/definitions/uint32
+
+        nvidia,slew-rate-rising:
+          description: Controls rising signal slew rate. 0 is fastest. The range of valid values
+            depends on the pingroup. See "DRVDN_SLWR" in the Tegra TRM.
+          $ref: /schemas/types.yaml#/definitions/uint32
+
+        nvidia,slew-rate-falling:
+          description: Controls falling signal slew rate. 0 is fastest. The range of valid values
+            depends on the pingroup. See "DRVUP_SLWF" in the Tegra TRM.
+          $ref: /schemas/types.yaml#/definitions/uint32
+
+      additionalProperties: false
+
+      required:
+        - nvidia,pins
+
+required:
+  - compatible
+  - reg
+
+examples:
+  - |
+    #include <dt-bindings/pinctrl/pinctrl-tegra.h>
+
+    pinmux: pinmux@70000800 {
+        compatible = "nvidia,tegra210-pinmux";
+        reg = <0x700008d4 0x02a8>, /* Pad control registers */
+              <0x70003000 0x1000>; /* Mux registers */
+
+        pinctrl-names = "boot";
+        pinctrl-0 = <&state_boot>;
+
+        state_boot: pinmux {
+            gen1_i2c_scl_pj1 {
+                nvidia,pins = "gen1_i2c_scl_pj1";
+                nvidia,function = "i2c1";
+                nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+                nvidia,tristate = <TEGRA_PIN_DISABLE>;
+                nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+                nvidia,open-drain = <TEGRA_PIN_ENABLE>;
+                nvidia,io-hv = <TEGRA_PIN_ENABLE>;
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra30-pinmux.txt b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra30-pinmux.txt
deleted file mode 100644
index 0e6354c11e6d..000000000000
--- a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra30-pinmux.txt
+++ /dev/null
@@ -1,144 +0,0 @@
-NVIDIA Tegra30 pinmux controller
-
-The Tegra30 pinctrl binding is very similar to the Tegra20 pinctrl binding,
-as described in nvidia,tegra20-pinmux.txt. In fact, this document assumes
-that binding as a baseline, and only documents the differences between the
-two bindings.
-
-Required properties:
-- compatible: "nvidia,tegra30-pinmux"
-- reg: Should contain the register physical address and length for each of
-  the pad control and mux registers.
-
-Tegra30 adds the following optional properties for pin configuration subnodes:
-- nvidia,enable-input: Integer. Enable the pin's input path. 0: no, 1: yes.
-- nvidia,open-drain: Integer. Enable open drain mode. 0: no, 1: yes.
-- nvidia,lock: Integer. Lock the pin configuration against further changes
-    until reset. 0: no, 1: yes.
-- nvidia,io-reset: Integer. Reset the IO path. 0: no, 1: yes.
-
-As with Tegra20, see the Tegra TRM for complete details regarding which groups
-support which functionality.
-
-Valid values for pin and group names are:
-
-  per-pin mux groups:
-
-    These all support nvidia,function, nvidia,tristate, nvidia,pull,
-    nvidia,enable-input, nvidia,lock. Some support nvidia,open-drain,
-    nvidia,io-reset.
-
-    clk_32k_out_pa0, uart3_cts_n_pa1, dap2_fs_pa2, dap2_sclk_pa3,
-    dap2_din_pa4, dap2_dout_pa5, sdmmc3_clk_pa6, sdmmc3_cmd_pa7, gmi_a17_pb0,
-    gmi_a18_pb1, lcd_pwr0_pb2, lcd_pclk_pb3, sdmmc3_dat3_pb4, sdmmc3_dat2_pb5,
-    sdmmc3_dat1_pb6, sdmmc3_dat0_pb7, uart3_rts_n_pc0, lcd_pwr1_pc1,
-    uart2_txd_pc2, uart2_rxd_pc3, gen1_i2c_scl_pc4, gen1_i2c_sda_pc5,
-    lcd_pwr2_pc6, gmi_wp_n_pc7, sdmmc3_dat5_pd0, sdmmc3_dat4_pd1, lcd_dc1_pd2,
-    sdmmc3_dat6_pd3, sdmmc3_dat7_pd4, vi_d1_pd5, vi_vsync_pd6, vi_hsync_pd7,
-    lcd_d0_pe0, lcd_d1_pe1, lcd_d2_pe2, lcd_d3_pe3, lcd_d4_pe4, lcd_d5_pe5,
-    lcd_d6_pe6, lcd_d7_pe7, lcd_d8_pf0, lcd_d9_pf1, lcd_d10_pf2, lcd_d11_pf3,
-    lcd_d12_pf4, lcd_d13_pf5, lcd_d14_pf6, lcd_d15_pf7, gmi_ad0_pg0,
-    gmi_ad1_pg1, gmi_ad2_pg2, gmi_ad3_pg3, gmi_ad4_pg4, gmi_ad5_pg5,
-    gmi_ad6_pg6, gmi_ad7_pg7, gmi_ad8_ph0, gmi_ad9_ph1, gmi_ad10_ph2,
-    gmi_ad11_ph3, gmi_ad12_ph4, gmi_ad13_ph5, gmi_ad14_ph6, gmi_ad15_ph7,
-    gmi_wr_n_pi0, gmi_oe_n_pi1, gmi_dqs_pi2, gmi_cs6_n_pi3, gmi_rst_n_pi4,
-    gmi_iordy_pi5, gmi_cs7_n_pi6, gmi_wait_pi7, gmi_cs0_n_pj0, lcd_de_pj1,
-    gmi_cs1_n_pj2, lcd_hsync_pj3, lcd_vsync_pj4, uart2_cts_n_pj5,
-    uart2_rts_n_pj6, gmi_a16_pj7, gmi_adv_n_pk0, gmi_clk_pk1, gmi_cs4_n_pk2,
-    gmi_cs2_n_pk3, gmi_cs3_n_pk4, spdif_out_pk5, spdif_in_pk6, gmi_a19_pk7,
-    vi_d2_pl0, vi_d3_pl1, vi_d4_pl2, vi_d5_pl3, vi_d6_pl4, vi_d7_pl5,
-    vi_d8_pl6, vi_d9_pl7, lcd_d16_pm0, lcd_d17_pm1, lcd_d18_pm2, lcd_d19_pm3,
-    lcd_d20_pm4, lcd_d21_pm5, lcd_d22_pm6, lcd_d23_pm7, dap1_fs_pn0,
-    dap1_din_pn1, dap1_dout_pn2, dap1_sclk_pn3, lcd_cs0_n_pn4, lcd_sdout_pn5,
-    lcd_dc0_pn6, hdmi_int_pn7, ulpi_data7_po0, ulpi_data0_po1, ulpi_data1_po2,
-    ulpi_data2_po3, ulpi_data3_po4, ulpi_data4_po5, ulpi_data5_po6,
-    ulpi_data6_po7, dap3_fs_pp0, dap3_din_pp1, dap3_dout_pp2, dap3_sclk_pp3,
-    dap4_fs_pp4, dap4_din_pp5, dap4_dout_pp6, dap4_sclk_pp7, kb_col0_pq0,
-    kb_col1_pq1, kb_col2_pq2, kb_col3_pq3, kb_col4_pq4, kb_col5_pq5,
-    kb_col6_pq6, kb_col7_pq7, kb_row0_pr0, kb_row1_pr1, kb_row2_pr2,
-    kb_row3_pr3, kb_row4_pr4, kb_row5_pr5, kb_row6_pr6, kb_row7_pr7,
-    kb_row8_ps0, kb_row9_ps1, kb_row10_ps2, kb_row11_ps3, kb_row12_ps4,
-    kb_row13_ps5, kb_row14_ps6, kb_row15_ps7, vi_pclk_pt0, vi_mclk_pt1,
-    vi_d10_pt2, vi_d11_pt3, vi_d0_pt4, gen2_i2c_scl_pt5, gen2_i2c_sda_pt6,
-    sdmmc4_cmd_pt7, pu0, pu1, pu2, pu3, pu4, pu5, pu6, jtag_rtck_pu7, pv0,
-    pv1, pv2, pv3, ddc_scl_pv4, ddc_sda_pv5, crt_hsync_pv6, crt_vsync_pv7,
-    lcd_cs1_n_pw0, lcd_m1_pw1, spi2_cs1_n_pw2, spi2_cs2_n_pw3, clk1_out_pw4,
-    clk2_out_pw5, uart3_txd_pw6, uart3_rxd_pw7, spi2_mosi_px0, spi2_miso_px1,
-    spi2_sck_px2, spi2_cs0_n_px3, spi1_mosi_px4, spi1_sck_px5, spi1_cs0_n_px6,
-    spi1_miso_px7, ulpi_clk_py0, ulpi_dir_py1, ulpi_nxt_py2, ulpi_stp_py3,
-    sdmmc1_dat3_py4, sdmmc1_dat2_py5, sdmmc1_dat1_py6, sdmmc1_dat0_py7,
-    sdmmc1_clk_pz0, sdmmc1_cmd_pz1, lcd_sdin_pz2, lcd_wr_n_pz3, lcd_sck_pz4,
-    sys_clk_req_pz5, pwr_i2c_scl_pz6, pwr_i2c_sda_pz7, sdmmc4_dat0_paa0,
-    sdmmc4_dat1_paa1, sdmmc4_dat2_paa2, sdmmc4_dat3_paa3, sdmmc4_dat4_paa4,
-    sdmmc4_dat5_paa5, sdmmc4_dat6_paa6, sdmmc4_dat7_paa7, pbb0,
-    cam_i2c_scl_pbb1, cam_i2c_sda_pbb2, pbb3, pbb4, pbb5, pbb6, pbb7,
-    cam_mclk_pcc0, pcc1, pcc2, sdmmc4_rst_n_pcc3, sdmmc4_clk_pcc4,
-    clk2_req_pcc5, pex_l2_rst_n_pcc6, pex_l2_clkreq_n_pcc7,
-    pex_l0_prsnt_n_pdd0, pex_l0_rst_n_pdd1, pex_l0_clkreq_n_pdd2,
-    pex_wake_n_pdd3, pex_l1_prsnt_n_pdd4, pex_l1_rst_n_pdd5,
-    pex_l1_clkreq_n_pdd6, pex_l2_prsnt_n_pdd7, clk3_out_pee0, clk3_req_pee1,
-    clk1_req_pee2, hdmi_cec_pee3, clk_32k_in, core_pwr_req, cpu_pwr_req, owr,
-    pwr_int_n.
-
-  drive groups:
-
-    These all support nvidia,pull-down-strength, nvidia,pull-up-strength,
-    nvidia,slew-rate-rising, nvidia,slew-rate-falling. Most but not all
-    support nvidia,high-speed-mode, nvidia,schmitt, nvidia,low-power-mode.
-
-    ao1, ao2, at1, at2, at3, at4, at5, cdev1, cdev2, cec, crt, csus, dap1,
-    dap2, dap3, dap4, dbg, ddc, dev3, gma, gmb, gmc, gmd, gme, gmf, gmg,
-    gmh, gpv, lcd1, lcd2, owr, sdio1, sdio2, sdio3, spi, uaa, uab, uart2,
-    uart3, uda, vi1.
-
-Valid values for nvidia,functions are:
-
-  blink, cec, clk_12m_out, clk_32k_in, core_pwr_req, cpu_pwr_req, crt,
-  dap, ddr, dev3, displaya, displayb, dtv, extperiph1, extperiph2,
-  extperiph3, gmi, gmi_alt, hda, hdcp, hdmi, hsi, i2c1, i2c2, i2c3,
-  i2c4, i2cpwr, i2s0, i2s1, i2s2, i2s3, i2s4, invalid, kbc, mio, nand,
-  nand_alt, owr, pcie, pwm0, pwm1, pwm2, pwm3, pwr_int_n, rsvd1, rsvd2,
-  rsvd3, rsvd4, rtck, sata, sdmmc1, sdmmc2, sdmmc3, sdmmc4, spdif, spi1,
-  spi2, spi2_alt, spi3, spi4, spi5, spi6, sysclk, test, trace, uarta,
-  uartb, uartc, uartd, uarte, ulpi, vgp1, vgp2, vgp3, vgp4, vgp5, vgp6,
-  vi, vi_alt1, vi_alt2, vi_alt3
-
-Example:
-
-	pinctrl@70000000 {
-		compatible = "nvidia,tegra30-pinmux";
-		reg = < 0x70000868 0xd0     /* Pad control registers */
-			0x70003000 0x3e0 >; /* Mux registers */
-	};
-
-Example board file extract:
-
-	pinctrl@70000000 {
-		sdmmc4_default: pinmux {
-			sdmmc4_clk_pcc4 {
-				nvidia,pins =	"sdmmc4_clk_pcc4",
-						"sdmmc4_rst_n_pcc3";
-				nvidia,function = "sdmmc4";
-				nvidia,pull = <0>;
-				nvidia,tristate = <0>;
-			};
-			sdmmc4_dat0_paa0 {
-				nvidia,pins =	"sdmmc4_dat0_paa0",
-						"sdmmc4_dat1_paa1",
-						"sdmmc4_dat2_paa2",
-						"sdmmc4_dat3_paa3",
-						"sdmmc4_dat4_paa4",
-						"sdmmc4_dat5_paa5",
-						"sdmmc4_dat6_paa6",
-						"sdmmc4_dat7_paa7";
-				nvidia,function = "sdmmc4";
-				nvidia,pull = <2>;
-				nvidia,tristate = <0>;
-			};
-		};
-	};
-
-	sdhci@78000400 {
-		pinctrl-names = "default";
-		pinctrl-0 = <&sdmmc4_default>;
-	};
diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra30-pinmux.yaml b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra30-pinmux.yaml
new file mode 100644
index 000000000000..b09c5990b962
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra30-pinmux.yaml
@@ -0,0 +1,268 @@
+# SPDX-License-Identifier: (GPL-2.0+ OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/nvidia,tegra30-pinmux.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra30 pinmux Controller
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Jon Hunter <jonathanh@nvidia.com>
+
+properties:
+  compatible:
+    const: nvidia,tegra30-pinmux
+
+  reg:
+    items:
+      - description: pad control registers
+      - description: mux registers
+
+additionalProperties:
+  type: object
+  description: |
+    Please refer to pinctrl-bindings.txt in this directory for details of the common pinctrl
+    bindings used by client devices, including the meaning of the phrase "pin configuration
+    node".
+
+    Tegra's pin configuration nodes act as a container for an arbitrary number of subnodes. Each
+    of these subnodes represents some desired configuration for a pin, a group, or a list of
+    pins or groups. This configuration can include the mux function to select on those pin(s)/
+    group(s), and various pin configuration parameters, such as pull-up, tristate, drive
+    strength, etc.
+
+    The name of each subnode is not important; all subnodes should be enumerated and processed
+    purely based on their content.
+
+    Each subnode only affects those parameters that are explicitly listed. In other words, a
+    subnode that lists a mux function but no pin configuration parameters implies no information
+    about any pin configuration parameters.
+
+    Similarly, a pin subnode that describes a pullup parameter implies no information about e.g.
+    the mux function or tristate parameter. For this reason, even seemingly boolean values are
+    actually tristates in this binding: unspecified, off, or on. Unspecified is represented as
+    an absent property, and off/on are represented as integer values 0 and 1.
+
+    Note that many of these properties are only valid for certain specific pins or groups. See
+    the Tegra TRM and various pinmux spreadsheets for complete details regarding which groups
+    support which functionality. The Linux pinctrl driver may also be a useful reference, since
+    it consolidates, disambiguates, and corrects data from all those sources.
+
+  patternProperties:
+    "^pinmux(-[a-z0-9-_]+)?$":
+      type: object
+      properties:
+        nvidia,pins:
+          $ref: /schemas/types.yaml#/definitions/string-array
+          description: An array of strings. Each string contains the name of a pin or group.
+            Valid values for these names are listed below.
+          items:
+            enum: [ clk_32k_out_pa0, uart3_cts_n_pa1, dap2_fs_pa2, dap2_sclk_pa3, dap2_din_pa4,
+                    dap2_dout_pa5, sdmmc3_clk_pa6, sdmmc3_cmd_pa7, gmi_a17_pb0, gmi_a18_pb1,
+                    lcd_pwr0_pb2, lcd_pclk_pb3, sdmmc3_dat3_pb4, sdmmc3_dat2_pb5, sdmmc3_dat1_pb6,
+                    sdmmc3_dat0_pb7, uart3_rts_n_pc0, lcd_pwr1_pc1, uart2_txd_pc2, uart2_rxd_pc3,
+                    gen1_i2c_scl_pc4, gen1_i2c_sda_pc5, lcd_pwr2_pc6, gmi_wp_n_pc7,
+                    sdmmc3_dat5_pd0, sdmmc3_dat4_pd1, lcd_dc1_pd2, sdmmc3_dat6_pd3,
+                    sdmmc3_dat7_pd4, vi_d1_pd5, vi_vsync_pd6, vi_hsync_pd7, lcd_d0_pe0, lcd_d1_pe1,
+                    lcd_d2_pe2, lcd_d3_pe3, lcd_d4_pe4, lcd_d5_pe5, lcd_d6_pe6, lcd_d7_pe7,
+                    lcd_d8_pf0, lcd_d9_pf1, lcd_d10_pf2, lcd_d11_pf3, lcd_d12_pf4, lcd_d13_pf5,
+                    lcd_d14_pf6, lcd_d15_pf7, gmi_ad0_pg0, gmi_ad1_pg1, gmi_ad2_pg2, gmi_ad3_pg3,
+                    gmi_ad4_pg4, gmi_ad5_pg5, gmi_ad6_pg6, gmi_ad7_pg7, gmi_ad8_ph0, gmi_ad9_ph1,
+                    gmi_ad10_ph2, gmi_ad11_ph3, gmi_ad12_ph4, gmi_ad13_ph5, gmi_ad14_ph6,
+                    gmi_ad15_ph7, gmi_wr_n_pi0, gmi_oe_n_pi1, gmi_dqs_pi2, gmi_cs6_n_pi3,
+                    gmi_rst_n_pi4, gmi_iordy_pi5, gmi_cs7_n_pi6, gmi_wait_pi7, gmi_cs0_n_pj0,
+                    lcd_de_pj1, gmi_cs1_n_pj2, lcd_hsync_pj3, lcd_vsync_pj4, uart2_cts_n_pj5,
+                    uart2_rts_n_pj6, gmi_a16_pj7, gmi_adv_n_pk0, gmi_clk_pk1, gmi_cs4_n_pk2,
+                    gmi_cs2_n_pk3, gmi_cs3_n_pk4, spdif_out_pk5, spdif_in_pk6, gmi_a19_pk7,
+                    vi_d2_pl0, vi_d3_pl1, vi_d4_pl2, vi_d5_pl3, vi_d6_pl4, vi_d7_pl5, vi_d8_pl6,
+                    vi_d9_pl7, lcd_d16_pm0, lcd_d17_pm1, lcd_d18_pm2, lcd_d19_pm3, lcd_d20_pm4,
+                    lcd_d21_pm5, lcd_d22_pm6, lcd_d23_pm7, dap1_fs_pn0, dap1_din_pn1,
+                    dap1_dout_pn2, dap1_sclk_pn3, lcd_cs0_n_pn4, lcd_sdout_pn5, lcd_dc0_pn6,
+                    hdmi_int_pn7, ulpi_data7_po0, ulpi_data0_po1, ulpi_data1_po2, ulpi_data2_po3,
+                    ulpi_data3_po4, ulpi_data4_po5, ulpi_data5_po6, ulpi_data6_po7, dap3_fs_pp0,
+                    dap3_din_pp1, dap3_dout_pp2, dap3_sclk_pp3, dap4_fs_pp4, dap4_din_pp5,
+                    dap4_dout_pp6, dap4_sclk_pp7, kb_col0_pq0, kb_col1_pq1, kb_col2_pq2,
+                    kb_col3_pq3, kb_col4_pq4, kb_col5_pq5, kb_col6_pq6, kb_col7_pq7, kb_row0_pr0,
+                    kb_row1_pr1, kb_row2_pr2, kb_row3_pr3, kb_row4_pr4, kb_row5_pr5, kb_row6_pr6,
+                    kb_row7_pr7, kb_row8_ps0, kb_row9_ps1, kb_row10_ps2, kb_row11_ps3,
+                    kb_row12_ps4, kb_row13_ps5, kb_row14_ps6, kb_row15_ps7, vi_pclk_pt0,
+                    vi_mclk_pt1, vi_d10_pt2, vi_d11_pt3, vi_d0_pt4, gen2_i2c_scl_pt5,
+                    gen2_i2c_sda_pt6, sdmmc4_cmd_pt7, pu0, pu1, pu2, pu3, pu4, pu5, pu6,
+                    jtag_rtck_pu7, pv0, pv1, pv2, pv3, ddc_scl_pv4, ddc_sda_pv5, crt_hsync_pv6,
+                    crt_vsync_pv7, lcd_cs1_n_pw0, lcd_m1_pw1, spi2_cs1_n_pw2, spi2_cs2_n_pw3,
+                    clk1_out_pw4, clk2_out_pw5, uart3_txd_pw6, uart3_rxd_pw7, spi2_mosi_px0,
+                    spi2_miso_px1, spi2_sck_px2, spi2_cs0_n_px3, spi1_mosi_px4, spi1_sck_px5,
+                    spi1_cs0_n_px6, spi1_miso_px7, ulpi_clk_py0, ulpi_dir_py1, ulpi_nxt_py2,
+                    ulpi_stp_py3, sdmmc1_dat3_py4, sdmmc1_dat2_py5, sdmmc1_dat1_py6,
+                    sdmmc1_dat0_py7, sdmmc1_clk_pz0, sdmmc1_cmd_pz1, lcd_sdin_pz2, lcd_wr_n_pz3,
+                    lcd_sck_pz4, sys_clk_req_pz5, pwr_i2c_scl_pz6, pwr_i2c_sda_pz7,
+                    sdmmc4_dat0_paa0, sdmmc4_dat1_paa1, sdmmc4_dat2_paa2, sdmmc4_dat3_paa3,
+                    sdmmc4_dat4_paa4, sdmmc4_dat5_paa5, sdmmc4_dat6_paa6, sdmmc4_dat7_paa7, pbb0,
+                    cam_i2c_scl_pbb1, cam_i2c_sda_pbb2, pbb3, pbb4, pbb5, pbb6, pbb7,
+                    cam_mclk_pcc0, pcc1, pcc2, sdmmc4_rst_n_pcc3, sdmmc4_clk_pcc4, clk2_req_pcc5,
+                    pex_l2_rst_n_pcc6, pex_l2_clkreq_n_pcc7, pex_l0_prsnt_n_pdd0,
+                    pex_l0_rst_n_pdd1, pex_l0_clkreq_n_pdd2, pex_wake_n_pdd3, pex_l1_prsnt_n_pdd4,
+                    pex_l1_rst_n_pdd5, pex_l1_clkreq_n_pdd6, pex_l2_prsnt_n_pdd7, clk3_out_pee0,
+                    clk3_req_pee1, clk1_req_pee2, hdmi_cec_pee3, clk_32k_in, core_pwr_req,
+                    cpu_pwr_req, owr, pwr_int_n,
+                    # drive groups
+                    drive_ao1, drive_ao2, drive_at1, drive_at2, drive_at3, drive_at4, drive_at5,
+                    drive_cdev1, drive_cdev2, drive_cec, drive_crt, drive_csus, drive_dap1,
+                    drive_dap2, drive_dap3, drive_dap4, drive_dbg, drive_ddc, drive_dev3,
+                    drive_gma, drive_gmb, drive_gmc, drive_gmd, drive_gme, drive_gmf, drive_gmg,
+                    drive_gmh, drive_gpv, drive_lcd1, drive_lcd2, drive_owr, drive_sdio1,
+                    drive_sdio2, drive_sdio3, drive_spi, drive_uaa, drive_uab, drive_uart2,
+                    drive_uart3, drive_uda, drive_vi1 ]
+
+        nvidia,function:
+          $ref: /schemas/types.yaml#/definitions/string
+          description: A string containing the name of the function to mux to the pin or group.
+            Valid values for function names are listed below. See the Tegra TRM to determine
+            which are valid for each pin or group.
+          enum: [ blink, cec, clk_12m_out, clk_32k_in, core_pwr_req, cpu_pwr_req, crt, dap, ddr,
+                  dev3, displaya, displayb, dtv, extperiph1, extperiph2, extperiph3, gmi, gmi_alt,
+                  hda, hdcp, hdmi, hsi, i2c1, i2c2, i2c3, i2c4, i2cpwr, i2s0, i2s1, i2s2, i2s3,
+                  i2s4, invalid, kbc, mio, nand, nand_alt, owr, pcie, pwm0, pwm1, pwm2, pwm3,
+                  pwr_int_n, rsvd1, rsvd2, rsvd3, rsvd4, rtck, sata, sdmmc1, sdmmc2, sdmmc3,
+                  sdmmc4, spdif, spi1, spi2, spi2_alt, spi3, spi4, spi5, spi6, sysclk, test,
+                  trace, uarta, uartb, uartc, uartd, uarte, ulpi, vgp1, vgp2, vgp3, vgp4, vgp5,
+                  vgp6, vi, vi_alt1, vi_alt2, vi_alt3 ]
+
+        nvidia,pull:
+          description: Pull-down/up setting to apply to the pin.
+          $ref: /schemas/types.yaml#/definitions/uint32
+          oneOf:
+            - description: none
+              const: 0
+            - description: down
+              const: 1
+            - description: up
+              const: 2
+
+        nvidia,tristate:
+          description: Tristate setting to apply to the pin.
+          $ref: /schemas/types.yaml#/definitions/uint32
+          oneOf:
+            - description: drive
+              const: 0
+            - description: tristate
+              const: 1
+
+        nvidia,enable-input:
+          description: Enable the pin's input path.
+          $ref: /schemas/types.yaml#/definitions/uint32
+          oneOf:
+            - description: disable input (i.e. output only)
+              const: 0
+            - description: enable input
+              const: 1
+
+        nvidia,open-drain:
+          description: Open-drain configuration for the pin.
+          $ref: /schemas/types.yaml#/definitions/uint32
+          oneOf:
+            - description: disable open-drain
+              const: 0
+            - description: enable open-drain
+              const: 1
+
+        nvidia,lock:
+          description: Lock the pin configuration against further changes until reset.
+          $ref: /schemas/types.yaml#/definitions/uint32
+          oneOf:
+            - description: disable pin configuration lock
+              const: 0
+            - description: enable pin configuration lock
+              const: 1
+
+        nvidia,io-reset:
+          description: reset the I/O path
+          $ref: /schemas/types.yaml#/definitions/uint32
+          enum: [ 0, 1 ]
+
+        nvidia,high-speed-mode:
+          description: Enable high speed mode the pins.
+          $ref: /schemas/types.yaml#/definitions/uint32
+          oneOf:
+            - description: normal speed mode
+              const: 0
+            - description: high speed mode
+              const: 1
+
+        nvidia,schmitt:
+          description: Enable Schmitt trigger on the input.
+          $ref: /schemas/types.yaml#/definitions/uint32
+          oneOf:
+            - description: disable Schmitt trigger on the input
+              const: 0
+            - description: enable Schmitt trigger on the input
+              const: 1
+
+        nvidia,low-power-mode:
+          description: Controls the drive power or current. Valid values are from 0 through 3,
+            where 0 specifies the least power and 3 specifies the most power. See "Low Power
+            Mode" or "LPMD1" and "LPMD0" in the Tegra TRM.
+          $ref: /schemas/types.yaml#/definitions/uint32
+          enum: [ 0, 1, 2, 3 ]
+
+        nvidia,pull-down-strength:
+          description: Controls drive strength. 0 is weakest. The range of valid values depends
+            on the pingroup. See "CAL_DRVDN" in the Tegra TRM.
+          $ref: /schemas/types.yaml#/definitions/uint32
+
+        nvidia,pull-up-strength:
+          description: Controls drive strength. 0 is weakest. The range of valid values depends
+            on the pingroup. See "CAL_DRVUP" in the Tegra TRM.
+          $ref: /schemas/types.yaml#/definitions/uint32
+
+        nvidia,slew-rate-rising:
+          description: Controls rising signal slew rate. 0 is fastest. The range of valid values
+            depends on the pingroup. See "DRVDN_SLWR" in the Tegra TRM.
+          $ref: /schemas/types.yaml#/definitions/uint32
+
+        nvidia,slew-rate-falling:
+          description: Controls falling signal slew rate. 0 is fastest. The range of valid
+            values depends on the pingroup. See "DRVUP_SLWF" in the Tegra TRM.
+          $ref: /schemas/types.yaml#/definitions/uint32
+
+      additionalProperties: false
+
+      required:
+        - nvidia,pins
+
+required:
+  - compatible
+  - reg
+
+examples:
+  - |
+    pinctrl@70000000 {
+      compatible = "nvidia,tegra30-pinmux";
+      reg = <0x70000868 0x0d0>, /* Pad control registers */
+            <0x70003000 0x3e0>; /* Mux registers */
+
+      pinmux {
+        sdmmc4_clk_pcc4 {
+          nvidia,pins = "sdmmc4_clk_pcc4",
+                        "sdmmc4_rst_n_pcc3";
+          nvidia,function = "sdmmc4";
+          nvidia,pull = <0>;
+          nvidia,tristate = <0>;
+        };
+
+        sdmmc4_dat0_paa0 {
+          nvidia,pins = "sdmmc4_dat0_paa0",
+                        "sdmmc4_dat1_paa1",
+                        "sdmmc4_dat2_paa2",
+                        "sdmmc4_dat3_paa3",
+                        "sdmmc4_dat4_paa4",
+                        "sdmmc4_dat5_paa5",
+                        "sdmmc4_dat6_paa6",
+                        "sdmmc4_dat7_paa7";
+          nvidia,function = "sdmmc4";
+          nvidia,pull = <2>;
+          nvidia,tristate = <0>;
+        };
+      };
+    };
-- 
2.36.1

