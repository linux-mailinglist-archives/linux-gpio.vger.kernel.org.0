Return-Path: <linux-gpio+bounces-19480-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B6AAA3972
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Apr 2025 23:34:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4D91D1BA6D47
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Apr 2025 21:34:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2540A26D4CB;
	Tue, 29 Apr 2025 21:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QD2PSbN7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A0725486E;
	Tue, 29 Apr 2025 21:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745962427; cv=none; b=Nn9MsTuKJRiGcBu394Q8t83Lf8ERdU5tfffPe3a+9nQFRlP2mxozGyy/Vt3xmyYJajnxvXlWl0dc9lzAVMa2CQr/iy65ZP82OdnnOPTv3icmxU+4vS1xY4Dqzaa0zNRvwUG8YiTas5lIVnQF/KkqojjnSY/QbrIm8sJaa7FGQUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745962427; c=relaxed/simple;
	bh=5ibUK7HGNQaDnCPbcAMcThDKBWgUVVSK8N8Y/HTEbSM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AOoqSlasTouwUB43JEdqR8zWPhfKJG8bPD+7ghhCPwBMxP89CcGxjQ5a14t39yh2UHP4Tb/+cX6xTh55TUzYcbGTGAYW8yPcL8RMQ5rVT8jpjIc+8Eyy7nbNzhO7LgaQSHIyO6OoWz+8wvI9XkmyJCqPHDhkbsV+eA9v7yjbI+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QD2PSbN7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 601A9C4CEEB;
	Tue, 29 Apr 2025 21:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745962427;
	bh=5ibUK7HGNQaDnCPbcAMcThDKBWgUVVSK8N8Y/HTEbSM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=QD2PSbN7eHg4C+1Lj0xtv+1ZgFf8LoTa9/9K9eOQwKTcAmXGeGF+hyn4sfiAyL7Cz
	 6wupIRhmQvgUh4MogZrYSEm9iimkM0oPlhfHdfroWtAPCvFCdqCtlTyK6wJ1KLZGti
	 mlsgTuYPLws2goDAuIpl7qBFiV5c0eyUWdOGII78h+x3Bq5xDoSTwaZvxLBvAs5xJS
	 uiKzS5drBh7Yct2ZiAHl7DnjrkPmlHJd/8NOBCH2N8oj502zsu3WtHvALoS65l8reH
	 92wjFkL5wfsyEPWyJBx0p9HzzVXqMh56fd4oyH2/drh08A3u2ClgEItiUbQJJOy0Cu
	 pSDHICVwuwvIA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F912C3ABAA;
	Tue, 29 Apr 2025 21:33:47 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Tue, 29 Apr 2025 16:33:30 -0500
Subject: [PATCH 1/4] dt-bindings: pinctrl: Document Tegra186 pin
 controllers
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250429-tegra186-pinctrl-v1-1-722c7c42394e@gmail.com>
References: <20250429-tegra186-pinctrl-v1-0-722c7c42394e@gmail.com>
In-Reply-To: <20250429-tegra186-pinctrl-v1-0-722c7c42394e@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745962426; l=16359;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=3k3YXs0SBtQGZRhuNjuF2GlsuJW/96TSbOplCCFJaCE=;
 b=0nZ6t9inmZLfAzm4XXKaGA51o0dH1IX1V9WhDfA5jmsHIFmAh/nvrnjWA+f767UYlcm/yIPqg
 8ztqWiG5Qg7CXOZ0zth3dX4wMbwWZN0QQHH/naOIf03C+g1JSBpyeSC
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

From: Aaron Kling <webgeek1234@gmail.com>

Tegra186 contains two pin controllers. Document their compatible strings
and describe the list of pins and functions that they provide.

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
 .../bindings/pinctrl/nvidia,tegra186-pinmux.yaml   | 285 +++++++++++++++++++++
 1 file changed, 285 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra186-pinmux.yaml b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra186-pinmux.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..2fcf42869d7b68671ae3ce78bd33787901ae9203
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra186-pinmux.yaml
@@ -0,0 +1,285 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/nvidia,tegra186-pinmux.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra186 Pinmux Controller
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Jon Hunter <jonathanh@nvidia.com>
+
+properties:
+  compatible:
+    enum:
+      - nvidia,tegra186-pinmux
+      - nvidia,tegra186-pinmux-aon
+
+  reg:
+    items:
+      - description: pinmux registers
+
+patternProperties:
+  "^pinmux(-[a-z0-9-_]+)?$":
+    type: object
+
+    # pin groups
+    additionalProperties:
+      $ref: nvidia,tegra-pinmux-common.yaml
+      unevaluatedProperties: false
+      properties:
+        nvidia,function:
+          enum: [ aud, can0, can1, ccla, dca, dcb, dcc, directdc, directdc1,
+                  displaya, displayb, dmic1, dmic2, dmic3, dmic4, dmic5, dp,
+                  dspk0, dspk1, dtv, eqos, extperiph1, extperiph2, extperiph3,
+                  extperiph4, gp, gpio, hdmi, i2c1, i2c2, i2c3, i2c5, i2c7,
+                  i2c8, i2c9, i2s1, i2s2, i2s3, i2s4, i2s5, i2s6, iqc0, iqc1,
+                  nv, pe, pe0, pe1, pe2, qspi, rsvd0, rsvd1, rsvd2, rsvd3,
+                  sata, sce, sdmmc1, sdmmc2, sdmmc3, sdmmc4, soc, spdif, spi1,
+                  spi2, spi3, spi4, touch, uarta, uartb, uartc, uartd, uarte,
+                  uartf, uartg, ufs0, usb, vgp1, vgp2, vgp3, vgp4, vgp5, vgp6,
+                  wdt ]
+
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
+additionalProperties: false
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          const: nvidia,tegra186-pinmux
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
+                items:
+                  enum: [ pex_l0_rst_n_pa0, pex_l0_clkreq_n_pa1,
+                          pex_wake_n_pa2, pex_l1_rst_n_pa3,
+                          pex_l1_clkreq_n_pa4, pex_l2_rst_n_pa5,
+                          pex_l2_clkreq_n_pa6, uart4_tx_pb0, uart4_rx_pb1,
+                          uart4_rts_pb2, uart4_cts_pb3, gpio_wan1_pb4,
+                          gpio_wan2_pb5, gpio_wan3_pb6, gpio_wan4_pc0,
+                          dap2_sclk_pc1, dap2_dout_pc2, dap2_din_pc3,
+                          dap2_fs_pc4, gen1_i2c_scl_pc5, gen1_i2c_sda_pc6,
+                          sdmmc1_clk_pd0, sdmmc1_cmd_pd1, sdmmc1_dat0_pd2,
+                          sdmmc1_dat1_pd3, sdmmc1_dat2_pd4, sdmmc1_dat3_pd5,
+                          eqos_txc_pe0, eqos_td0_pe1, eqos_td1_pe2,
+                          eqos_td2_pe3, eqos_td3_pe4, eqos_tx_ctl_pe5,
+                          eqos_rd0_pe6, eqos_rd1_pe7, eqos_rd2_pf0,
+                          eqos_rd3_pf1, eqos_rx_ctl_pf2, eqos_rxc_pf3,
+                          eqos_mdio_pf4, eqos_mdc_pf5, sdmmc3_clk_pg0,
+                          sdmmc3_cmd_pg1, sdmmc3_dat0_pg2, sdmmc3_dat1_pg3,
+                          sdmmc3_dat2_pg4, sdmmc3_dat3_pg5, gpio_wan5_ph0,
+                          gpio_wan6_ph1, gpio_wan7_ph2, gpio_wan8_ph3,
+                          bcpu_pwr_req_ph4, mcpu_pwr_req_ph5, gpu_pwr_req_ph6,
+                          gpio_pq0_pi0, gpio_pq1_pi1, gpio_pq2_pi2,
+                          gpio_pq3_pi3, gpio_pq4_pi4, gpio_pq5_pi5,
+                          gpio_pq6_pi6, gpio_pq7_pi7, dap1_sclk_pj0,
+                          dap1_dout_pj1, dap1_din_pj2, dap1_fs_pj3,
+                          aud_mclk_pj4, gpio_aud0_pj5, gpio_aud1_pj6,
+                          gpio_aud2_pj7, gpio_aud3_pk0, gen7_i2c_scl_pl0,
+                          gen7_i2c_sda_pl1, gen9_i2c_scl_pl2, gen9_i2c_sda_pl3,
+                          usb_vbus_en0_pl4, usb_vbus_en1_pl5, gp_pwm6_pl6,
+                          gp_pwm7_pl7, dmic1_dat_pm0, dmic1_clk_pm1,
+                          dmic2_dat_pm2, dmic2_clk_pm3, dmic4_dat_pm4,
+                          dmic4_clk_pm5, gpio_cam1_pn0, gpio_cam2_pn1,
+                          gpio_cam3_pn2, gpio_cam4_pn3, gpio_cam6_pn5,
+                          gpio_cam7_pn6, extperiph1_clk_po0,
+                          extperiph2_clk_po1, cam_i2c_scl_po2, cam_i2c_sda_po3,
+                          dp_aux_ch0_hpd_pp0, dp_aux_ch1_hpd_pp1, hdmi_cec_pp2,
+                          gpio_edp0_pp3, gpio_edp1_pp4, gpio_edp2_pp5,
+                          gpio_edp3_pp6, directdc1_clk_pq0, directdc1_in_pq1,
+                          directdc1_out0_pq2, directdc1_out1_pq3,
+                          directdc1_out2_pq4, directdc1_out3_pq5,
+                          qspi_sck_pr0, qspi_io0_pr1, qspi_io1_pr2,
+                          qspi_io2_pr3, qspi_io3_pr4, qspi_cs_n_pr5,
+                          uart1_tx_pt0, uart1_rx_pt1, uart1_rts_pt2,
+                          uart1_cts_pt3, uart2_tx_px0, uart2_rx_px1,
+                          uart2_rts_px2, uart2_cts_px3, uart5_tx_px4,
+                          uart5_rx_px5, uart5_rts_px6, uart5_cts_px7,
+                          gpio_mdm1_py0, gpio_mdm2_py1, gpio_mdm3_py2,
+                          gpio_mdm4_py3, gpio_mdm5_py4, gpio_mdm6_py5,
+                          gpio_mdm7_py6, ufs0_ref_clk_pbb0, ufs0_rst_pbb1,
+                          dap4_sclk_pcc0, dap4_dout_pcc1, dap4_din_pcc2,
+                          dap4_fs_pcc3, directdc_comp, sdmmc1_comp, eqos_comp,
+                          sdmmc3_comp, qspi_comp,
+                          # drive groups
+                          drive_gpio_aud3_pk0, drive_gpio_aud2_pj7,
+                          drive_gpio_aud1_pj6, drive_gpio_aud0_pj5,
+                          drive_aud_mclk_pj4, drive_dap1_fs_pj3,
+                          drive_dap1_din_pj2, drive_dap1_dout_pj1,
+                          drive_dap1_sclk_pj0, drive_dmic1_clk_pm1,
+                          drive_dmic1_dat_pm0, drive_dmic2_dat_pm2,
+                          drive_dmic2_clk_pm3, drive_dmic4_dat_pm4,
+                          drive_dmic4_clk_pm5, drive_dap4_fs_pcc3,
+                          drive_dap4_din_pcc2, drive_dap4_dout_pcc1,
+                          drive_dap4_sclk_pcc0, drive_extperiph2_clk_po1,
+                          drive_extperiph1_clk_po0, drive_cam_i2c_sda_po3,
+                          drive_cam_i2c_scl_po2, drive_gpio_cam1_pn0,
+                          drive_gpio_cam2_pn1, drive_gpio_cam3_pn2,
+                          drive_gpio_cam4_pn3, drive_gpio_cam5_pn4,
+                          drive_gpio_cam6_pn5, drive_gpio_cam7_pn6,
+                          drive_dap2_din_pc3, drive_dap2_dout_pc2,
+                          drive_dap2_fs_pc4, drive_dap2_sclk_pc1,
+                          drive_uart4_cts_pb3, drive_uart4_rts_pb2,
+                          drive_uart4_rx_pb1, drive_uart4_tx_pb0,
+                          drive_gpio_wan4_pc0, drive_gpio_wan3_pb6,
+                          drive_gpio_wan2_pb5, drive_gpio_wan1_pb4,
+                          drive_gen1_i2c_scl_pc5, drive_gen1_i2c_sda_pc6,
+                          drive_uart1_cts_pt3, drive_uart1_rts_pt2,
+                          drive_uart1_rx_pt1, drive_uart1_tx_pt0,
+                          drive_directdc1_out3_pq5, drive_directdc1_out2_pq4,
+                          drive_directdc1_out1_pq3, drive_directdc1_out0_pq2,
+                          drive_directdc1_in_pq1, drive_directdc1_clk_pq0,
+                          drive_gpio_pq0_pi0, drive_gpio_pq1_pi1,
+                          drive_gpio_pq2_pi2, drive_gpio_pq3_pi3,
+                          drive_gpio_pq4_pi4, drive_gpio_pq5_pi5,
+                          drive_gpio_pq6_pi6, drive_gpio_pq7_pi7,
+                          drive_gpio_edp2_pp5, drive_gpio_edp3_pp6,
+                          drive_gpio_edp0_pp3, drive_gpio_edp1_pp4,
+                          drive_dp_aux_ch0_hpd_pp0, drive_dp_aux_ch1_hpd_pp1,
+                          drive_hdmi_cec_pp2, drive_pex_l2_clkreq_n_pa6,
+                          drive_pex_wake_n_pa2, drive_pex_l1_clkreq_n_pa4,
+                          drive_pex_l1_rst_n_pa3, drive_pex_l0_clkreq_n_pa1,
+                          drive_pex_l0_rst_n_pa0, drive_pex_l2_rst_n_pa5,
+                          drive_sdmmc1_clk_pd0, drive_sdmmc1_cmd_pd1,
+                          drive_sdmmc1_dat3_pd5, drive_sdmmc1_dat2_pd4,
+                          drive_sdmmc1_dat1_pd3, drive_sdmmc1_dat0_pd2,
+                          drive_eqos_td3_pe4, drive_eqos_td2_pe3,
+                          drive_eqos_td1_pe2, drive_eqos_td0_pe1,
+                          drive_eqos_rd3_pf1, drive_eqos_rd2_pf0,
+                          drive_eqos_rd1_pe7, drive_eqos_mdio_pf4,
+                          drive_eqos_rd0_pe6, drive_eqos_mdc_pf5,
+                          drive_eqos_txc_pe0, drive_eqos_rxc_pf3,
+                          drive_eqos_tx_ctl_pe5, drive_eqos_rx_ctl_pf2,
+                          drive_sdmmc3_dat3_pg5, drive_sdmmc3_dat2_pg4,
+                          drive_sdmmc3_dat1_pg3, drive_sdmmc3_dat0_pg2,
+                          drive_sdmmc3_cmd_pg1, drive_sdmmc3_clk_pg0,
+                          drive_qspi_io3_pr4, drive_qspi_io2_pr3,
+                          drive_qspi_io1_pr2, drive_qspi_io0_pr1,
+                          drive_qspi_sck_pr0, drive_qspi_cs_n_pr5,
+                          drive_gpio_wan8_ph3, drive_gpio_wan7_ph2,
+                          drive_gpio_wan6_ph1, drive_gpio_wan5_ph0,
+                          drive_uart2_tx_px0, drive_uart2_rx_px1,
+                          drive_uart2_rts_px2, drive_uart2_cts_px3,
+                          drive_uart5_rx_px5, drive_uart5_tx_px4,
+                          drive_uart5_rts_px6, drive_uart5_cts_px7,
+                          drive_gpio_mdm1_py0, drive_gpio_mdm2_py1,
+                          drive_gpio_mdm3_py2, drive_gpio_mdm4_py3,
+                          drive_gpio_mdm5_py4, drive_gpio_mdm6_py5,
+                          drive_gpio_mdm7_py6, drive_bcpu_pwr_req_ph4,
+                          drive_mcpu_pwr_req_ph5, drive_gpu_pwr_req_ph6,
+                          drive_gen7_i2c_scl_pl0, drive_gen7_i2c_sda_pl1,
+                          drive_gen9_i2c_sda_pl3, drive_gen9_i2c_scl_pl2,
+                          drive_usb_vbus_en0_pl4, drive_usb_vbus_en1_pl5,
+                          drive_gp_pwm7_pl7, drive_gp_pwm6_pl6,
+                          drive_ufs0_rst_pbb1, drive_ufs0_ref_clk_pbb0,
+                          drive_directdc_comp, drive_sdmmc1_comp,
+                          drive_eqos_comp, drive_sdmmc3_comp, drive_sdmmc4_clk,
+                          drive_sdmmc4_cmd, drive_sdmmc4_dqs,
+                          drive_sdmmc4_dat7, drive_sdmmc4_dat6,
+                          drive_sdmmc4_dat5, drive_sdmmc4_dat4,
+                          drive_sdmmc4_dat3, drive_sdmmc4_dat2,
+                          drive_sdmmc4_dat1, drive_sdmmc4_dat0,
+                          drive_qspi_comp ]
+
+  - if:
+      properties:
+        compatible:
+          const: nvidia,tegra186-pinmux-aon
+    then:
+      patternProperties:
+        "^pinmux(-[a-z0-9-_]+)?$":
+          type: object
+          additionalProperties:
+            properties:
+              nvidia,pins:
+                items:
+                  enum: [ pwr_i2c_scl_ps0, pwr_i2c_sda_ps1, batt_oc_ps2,
+                          safe_state_ps3, vcomp_alert_ps4, gpio_dis0_pu0,
+                          gpio_dis1_pu1, gpio_dis2_pu2, gpio_dis3_pu3,
+                          gpio_dis4_pu4, gpio_dis5_pu5, gpio_sen0_pv0,
+                          gpio_sen1_pv1, gpio_sen2_pv2, gpio_sen3_pv3,
+                          gpio_sen4_pv4, gpio_sen5_pv5, gpio_sen6_pv6,
+                          gpio_sen7_pv7, gen8_i2c_scl_pw0, gen8_i2c_sda_pw1,
+                          uart3_tx_pw2, uart3_rx_pw3, uart3_rts_pw4,
+                          uart3_cts_pw5, uart7_tx_pw6, uart7_rx_pw7,
+                          can1_dout_pz0, can1_din_pz1, can0_dout_pz2,
+                          can0_din_pz3, can_gpio0_paa0, can_gpio1_paa1,
+                          can_gpio2_paa2, can_gpio3_paa3, can_gpio4_paa4,
+                          can_gpio5_paa5, can_gpio6_paa6, can_gpio7_paa7,
+                          gpio_sen8_pee0, gpio_sen9_pee1, touch_clk_pee2,
+                          power_on_pff0, gpio_sw1_pff1, gpio_sw2_pff2,
+                          gpio_sw3_pff3, gpio_sw4_pff4, shutdown, pmu_int,
+                          soc_pwr_req, clk_32k_in,
+                          # drive groups
+                          drive_touch_clk_pee2, drive_uart3_cts_pw5,
+                          drive_uart3_rts_pw4, drive_uart3_rx_pw3,
+                          drive_uart3_tx_pw2, drive_gen8_i2c_sda_pw1,
+                          drive_gen8_i2c_scl_pw0, drive_uart7_rx_pw7,
+                          drive_uart7_tx_pw6, drive_gpio_sen0_pv0,
+                          drive_gpio_sen1_pv1, drive_gpio_sen2_pv2,
+                          drive_gpio_sen3_pv3, drive_gpio_sen4_pv4,
+                          drive_gpio_sen5_pv5, drive_gpio_sen6_pv6,
+                          drive_gpio_sen7_pv7, drive_gpio_sen8_pee0,
+                          drive_gpio_sen9_pee1, drive_can_gpio7_paa7,
+                          drive_can1_dout_pz0, drive_can1_din_pz1,
+                          drive_can0_dout_pz2, drive_can0_din_pz3,
+                          drive_can_gpio0_paa0, drive_can_gpio1_paa1,
+                          drive_can_gpio2_paa2, drive_can_gpio3_paa3,
+                          drive_can_gpio4_paa4, drive_can_gpio5_paa5,
+                          drive_can_gpio6_paa6, drive_gpio_sw1_pff1,
+                          drive_gpio_sw2_pff2, drive_gpio_sw3_pff3,
+                          drive_gpio_sw4_pff4, drive_shutdown, drive_pmu_int,
+                          drive_safe_state_ps3, drive_vcomp_alert_ps4,
+                          drive_soc_pwr_req, drive_batt_oc_ps2,
+                          drive_clk_32k_in, drive_power_on_pff0,
+                          drive_pwr_i2c_scl_ps0, drive_pwr_i2c_sda_ps1,
+                          drive_gpio_dis0_pu0, drive_gpio_dis1_pu1,
+                          drive_gpio_dis2_pu2, drive_gpio_dis3_pu3,
+                          drive_gpio_dis4_pu4, drive_gpio_dis5_pu5 ]
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
+        compatible = "nvidia,tegra186-pinmux";
+        reg = <0x2430000 0x15000>;
+
+        pinctrl-names = "jetson_io";
+        pinctrl-0 = <&jetson_io_pinmux>;
+
+        jetson_io_pinmux: pinmux {
+            hdr40-pin7 {
+                nvidia,pins = "aud_mclk_pj4";
+                nvidia,function = "aud";
+                nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+                nvidia,tristate = <TEGRA_PIN_DISABLE>;
+                nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+            };
+        };
+    };
+...

-- 
2.48.1



