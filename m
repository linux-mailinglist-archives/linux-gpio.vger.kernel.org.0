Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6188D68D60D
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Feb 2023 12:56:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230203AbjBGL4t (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Feb 2023 06:56:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230284AbjBGL4s (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Feb 2023 06:56:48 -0500
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2064.outbound.protection.outlook.com [40.107.92.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C7614493;
        Tue,  7 Feb 2023 03:56:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IXn6HDFiGF2zsME7gST7NoIcO7U67g5oQ4foTTKhqBbFmKEpclj3bR02sOggxCSf6onjEcCXExXkzPa5aSIttQfMtZ4rPKyovRdmLTAOQVtvjFS0RG5PR5RLudDVyzS2igbQNhFMoodPoqb/SfjjjmCMPFkaPjrwEAFALWCTAtoCn2+wXrTSJuQMA0M7lyqVxVXfnnxYvvGFsN/EP1KAtIEAIxOMFNRKj4mCYd1xyxXYfmJVAQBeRvnSkE7vaqaCQcNfz1ybG/rZct/D/wG0Qkv0MqLVW4Um8FSfqjmwVog6srdaAePK9QCn/sqQJ5qcKAxEFXHj5q0jtrkX5zaceg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0CEAZleY73YNyyLjK7SdCtQ7IIoJ64lELxI3OsffG+o=;
 b=Uxab4bUG5Z+NRRdlXtTpqMkrxlLJx1WTcMLQeboZW90b9Terpp2xTXZIYYyH9SuTEbBZrQ9nTO/lRW5PT/04NSnvjnauDi+szmlBQt2z2dqvaL8IDSeHc9GnUCRQ5hzlUvlBIawUhDHlZmCjpYxVfRvLBVB7hxAJhqAt7Lc6xlttMUdmkkhi1pmEEXBe1NGStVmMFJAvu7pkYDTiT6L7p+HqGmU+2jyJ+uIVjEgNQCRvELoDXYugdFRG/hrXP/khLWXoXqNzmqmcF74xttOtPrlntENu0lp9sfp7RZNQWvFNBfkl+wnmv454PS4rWik+zYKMntOTe+1gJ3FwITHUqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0CEAZleY73YNyyLjK7SdCtQ7IIoJ64lELxI3OsffG+o=;
 b=grZ53HCalNyh5AaywrDpPyunNCmkDOWlt13ZrvItN2RAczxVsyjhxlvJZb6/VjljqSzN4vmgIKk8N6Jpbb3O0eQyaayDwoEjluS8KEUTiQEE8P/wsUIibVgehL0X9yyHoQM00pFpNohu7e1Zuw4IrsXZZ7GIXfAN7mqKt8I+MLsR4QKVATZGoOro5RPc5xIFEN5OlBm77uTXeG6OG5fnUnY2fus7KM4DpnMtSO3huAHn0MEZ6w71/RDpyuL81bz4pzk/7MAltm+L1ptdgd8SygWmA2N+u4Jp1frmuDV1VAE5+Yg6Y4TPxPIfbfMT9ZFoNauL8TP/7Ma0SBV5lAgOSw==
Received: from DM6PR17CA0015.namprd17.prod.outlook.com (2603:10b6:5:1b3::28)
 by DS0PR12MB7512.namprd12.prod.outlook.com (2603:10b6:8:13a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.36; Tue, 7 Feb
 2023 11:56:44 +0000
Received: from DM6NAM11FT055.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:1b3:cafe::a9) by DM6PR17CA0015.outlook.office365.com
 (2603:10b6:5:1b3::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34 via Frontend
 Transport; Tue, 7 Feb 2023 11:56:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 DM6NAM11FT055.mail.protection.outlook.com (10.13.173.103) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6086.16 via Frontend Transport; Tue, 7 Feb 2023 11:56:44 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Tue, 7 Feb 2023
 03:56:35 -0800
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Tue, 7 Feb 2023 03:56:35 -0800
Received: from pshete-ubuntu.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.986.36 via Frontend
 Transport; Tue, 7 Feb 2023 03:56:32 -0800
From:   Prathamesh Shete <pshete@nvidia.com>
To:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <linus.walleij@linaro.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-gpio@vger.kernel.org>
CC:     <smangipudi@nvidia.com>, <pshete@nvidia.com>
Subject: [PATCH 1/3] dt-bindings: pinctrl: tegra234: Add DT binding doc
Date:   Tue, 7 Feb 2023 17:26:15 +0530
Message-ID: <20230207115617.12088-1-pshete@nvidia.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT055:EE_|DS0PR12MB7512:EE_
X-MS-Office365-Filtering-Correlation-Id: 4acde724-4b21-4103-2118-08db090261fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UA7QKshooOYtGkKw5fOW6dZcEmNtcNPOLGR0WpRMK7lwy84KWDhUZ41cFjOpjd2AcVuxAj2PXBwbSJYvzCBkyWpTA+ZtJDEMkzTggiZg7jIpC7PkR7bI+Hsq/tdMiYBkkdA9RssGDjfzJZkk9ycfLI5jABoyzlmXJ3ElPIMEhMJrQvQoiRoZzF7Oj26FuLaMfbxzf0bkCEX7oAiV57wQpgeR+6NDt9AJSj02DdOa8kvnjjtX1FRp3K3TVXSI0CxyQi8tlHwrwvbBM6qNdixOZekk0+vOKJwIzvBjJeeL1QuBN2tB/XE16W2H50QeyLT77SKFrGFjAZkZA4V0A8PmTwM33rgLIf84m+TdddKvt2c9O74h8l552CWw3pczPX1lNULrDrfpKG3xofMfbyJjQUJubVA1EbbnA5I5vsnF3c2r6jo2Z1t0aLhf0UFbnVpWK765WTj1www41G4QCKmmAfZDmx6q3y1TGO2bcufaduIZVN66noHHJexb2lG/+QSszbLSu9SBEvTjAVwHT9tftgWlm8YC161CXUz13tMuxyI5FwcCtzUT/ztM/ZruOVhE8UTb9SmtjYTSayUaCuSMdV0oj4e00mfok2apD+FJqWSpI/L2ZvoyO3mnclBWFREADrvCky77E4rc61FUPrN4+yAnnuDn85G5qp5Y8g3b6gT/ey/XZjU9BM9SZCoD8fB2KMWe92Q143zIhD6qS8dOhheOgGY2Xa6jJ1TRliIEPl+RiXVDr8BWgdNzn+zhfpBklBYsKIvPfitugxnS/iiwxaHGXR8yJbbDlFjoabe5GHAqJH8jrYpuJFCo5Pb3suMCp3f3v0EQQFFNG4tl4k3vtQ==
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(396003)(136003)(346002)(376002)(451199018)(36840700001)(46966006)(40470700004)(2616005)(316002)(4326008)(26005)(8936002)(36756003)(8676002)(6666004)(107886003)(41300700001)(966005)(40480700001)(1076003)(86362001)(40460700003)(186003)(478600001)(36860700001)(5660300002)(47076005)(2906002)(54906003)(7696005)(70586007)(110136005)(356005)(83380400001)(426003)(70206006)(336012)(82740400003)(82310400005)(7636003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2023 11:56:44.0370
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4acde724-4b21-4103-2118-08db090261fd
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT055.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7512
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add DT binding doc for Tegra234 pinmux driver.

Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
---
 .../pinctrl/nvidia,tegra234-pinmux.yaml       | 232 ++++++++++++++++++
 1 file changed, 232 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra234-pinmux.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra234-pinmux.yaml b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra234-pinmux.yaml
new file mode 100644
index 000000000000..56b8d364c605
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra234-pinmux.yaml
@@ -0,0 +1,232 @@
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
+properties:
+  compatible:
+    enum:
+      - nvidia,tegra234-pinmux
+      - nvidia,tegra234-pinmux-aon
+
+  reg:
+    items:
+      - description: pinmux registers
+
+patternProperties:
+  "^pinmux(-[a-z0-9-_]+)?$":
+    type: object
+    properties:
+      phandle: true
+
+    # pin groups
+    additionalProperties:
+      $ref: nvidia,tegra-pinmux-common.yaml
+      unevaluatedProperties: false
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
+          const: nvidia,tegra234-pinmux
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
+                items:
+                  enum: [ dap6_sclk_pa0, dap6_dout_pa1, dap6_din_pa2,
+                          dap6_fs_pa3, dap4_sclk_pa4, dap4_dout_pa5,
+                          dap4_din_pa6, dap4_fs_pa7, soc_gpio08_pb0,
+                          qspi0_sck_pc0, qspi0_cs_n_pc1,
+                          qspi0_io0_pc2, qspi0_io1_pc3, qspi0_io2_pc4,
+                          qspi0_io3_pc5, qspi1_sck_pc6, qspi1_cs_n_pc7,
+                          qspi1_io0_pd0, qspi1_io1_pd1, qspi1_io2_pd2,
+                          qspi1_io3_pd3, eqos_txc_pe0, eqos_td0_pe1,
+                          eqos_td1_pe2, eqos_td2_pe3, eqos_td3_pe4,
+                          eqos_tx_ctl_pe5, eqos_rd0_pe6, eqos_rd1_pe7,
+                          eqos_rd2_pf0, eqos_rd3_pf1, eqos_rx_ctl_pf2,
+                          eqos_rxc_pf3, eqos_sma_mdio_pf4, eqos_sma_mdc_pf5,
+                          soc_gpio13_pg0, soc_gpio14_pg1, soc_gpio15_pg2,
+                          soc_gpio16_pg3, soc_gpio17_pg4, soc_gpio18_pg5,
+                          soc_gpio19_pg6, soc_gpio20_pg7, soc_gpio21_ph0,
+                          soc_gpio22_ph1, soc_gpio06_ph2, uart4_tx_ph3,
+                          uart4_rx_ph4, uart4_rts_ph5, uart4_cts_ph6,
+                          soc_gpio41_ph7, soc_gpio42_pi0, soc_gpio43_pi1,
+                          soc_gpio44_pi2, gen1_i2c_scl_pi3, gen1_i2c_sda_pi4,
+                          cpu_pwr_req_pi5, soc_gpio07_pi6,
+                          sdmmc1_clk_pj0, sdmmc1_cmd_pj1, sdmmc1_dat0_pj2,
+                          sdmmc1_dat1_pj3, sdmmc1_dat2_pj4, sdmmc1_dat3_pj5,
+                          pex_l0_clkreq_n_pk0, pex_l0_rst_n_pk1,
+                          pex_l1_clkreq_n_pk2, pex_l1_rst_n_pk3,
+                          pex_l2_clkreq_n_pk4, pex_l2_rst_n_pk5,
+                          pex_l3_clkreq_n_pk6, pex_l3_rst_n_pk7,
+                          pex_l4_clkreq_n_pl0, pex_l4_rst_n_pl1,
+                          pex_wake_n_pl2, soc_gpio34_pl3, dp_aux_ch0_hpd_pm0,
+                          dp_aux_ch1_hpd_pm1, dp_aux_ch2_hpd_pm2,
+                          dp_aux_ch3_hpd_pm3, soc_gpio55_pm4, soc_gpio36_pm5,
+                          soc_gpio53_pm6, soc_gpio38_pm7, dp_aux_ch3_n_pn0,
+                          soc_gpio39_pn1, soc_gpio40_pn2, dp_aux_ch1_p_pn3,
+                          dp_aux_ch1_n_pn4, dp_aux_ch2_p_pn5, dp_aux_ch2_n_pn6,
+                          dp_aux_ch3_p_pn7, extperiph1_clk_pp0,
+                          extperiph2_clk_pp1, cam_i2c_scl_pp2, cam_i2c_sda_pp3,
+                          soc_gpio23_pp4, soc_gpio24_pp5, soc_gpio25_pp6,
+                          pwr_i2c_scl_pp7, pwr_i2c_sda_pq0, soc_gpio28_pq1,
+                          soc_gpio29_pq2, soc_gpio30_pq3, soc_gpio31_pq4,
+                          soc_gpio32_pq5, soc_gpio33_pq6, soc_gpio35_pq7,
+                          soc_gpio37_pr0, soc_gpio56_pr1, uart1_tx_pr2,
+                          uart1_rx_pr3, uart1_rts_pr4, uart1_cts_pr5,
+                          soc_gpio61_pw0, soc_gpio62_pw1, gpu_pwr_req_px0, cv_pwr_req_px1,
+                          gp_pwm2_px2, gp_pwm3_px3, uart2_tx_px4, uart2_rx_px5,
+                          uart2_rts_px6, uart2_cts_px7, spi3_sck_py0,
+                          spi3_miso_py1, spi3_mosi_py2, spi3_cs0_py3,
+                          spi3_cs1_py4, uart5_tx_py5, uart5_rx_py6,
+                          uart5_rts_py7, uart5_cts_pz0, usb_vbus_en0_pz1,
+                          usb_vbus_en1_pz2, spi1_sck_pz3, spi1_miso_pz4,
+                          spi1_mosi_pz5, spi1_cs0_pz6, spi1_cs1_pz7,
+                          spi5_sck_pac0, spi5_miso_pac1, spi5_mosi_pac2,
+                          spi5_cs0_pac3, soc_gpio57_pac4, soc_gpio58_pac5,
+                          soc_gpio59_pac6, soc_gpio60_pac7, soc_gpio45_pad0,
+                          soc_gpio46_pad1, soc_gpio47_pad2, soc_gpio48_pad3,
+                          ufs0_ref_clk_pae0, ufs0_rst_n_pae1,
+                          pex_l5_clkreq_n_paf0, pex_l5_rst_n_paf1,
+                          pex_l6_clkreq_n_paf2, pex_l6_rst_n_paf3,
+                          pex_l7_clkreq_n_pag0, pex_l7_rst_n_pag1,
+                          pex_l8_clkreq_n_pag2, pex_l8_rst_n_pag3,
+                          pex_l9_clkreq_n_pag4, pex_l9_rst_n_pag5,
+                          pex_l10_clkreq_n_pag6, pex_l10_rst_n_pag7,
+                          sdmmc1_comp, eqos_comp, qspi_comp,
+                          # drive groups
+                          drive_soc_gpio08_pb0, drive_soc_gpio36_pm5,
+                          drive_soc_gpio53_pm6, drive_soc_gpio55_pm4,
+                          drive_soc_gpio38_pm7, drive_soc_gpio39_pn1,
+                          drive_soc_gpio40_pn2, drive_dp_aux_ch0_hpd_pm0,
+                          drive_dp_aux_ch1_hpd_pm1, drive_dp_aux_ch2_hpd_pm2,
+                          drive_dp_aux_ch3_hpd_pm3, drive_dp_aux_ch1_p_pn3,
+                          drive_dp_aux_ch1_n_pn4, drive_dp_aux_ch2_p_pn5,
+                          drive_dp_aux_ch2_n_pn6, drive_dp_aux_ch3_p_pn7,
+                          drive_dp_aux_ch3_n_pn0, drive_pex_l2_clkreq_n_pk4,
+                          drive_pex_wake_n_pl2, drive_pex_l1_clkreq_n_pk2,
+                          drive_pex_l1_rst_n_pk3, drive_pex_l0_clkreq_n_pk0,
+                          drive_pex_l0_rst_n_pk1, drive_pex_l2_rst_n_pk5,
+                          drive_pex_l3_clkreq_n_pk6, drive_pex_l3_rst_n_pk7,
+                          drive_pex_l4_clkreq_n_pl0, drive_pex_l4_rst_n_pl1,
+                          drive_soc_gpio34_pl3, drive_pex_l5_clkreq_n_paf0,
+                          drive_pex_l5_rst_n_paf1, drive_pex_l6_clkreq_n_paf2,
+                          drive_pex_l6_rst_n_paf3, drive_pex_l10_clkreq_n_pag6,
+                          drive_pex_l10_rst_n_pag7, drive_pex_l7_clkreq_n_pag0,
+                          drive_pex_l7_rst_n_pag1, drive_pex_l8_clkreq_n_pag2,
+                          drive_pex_l8_rst_n_pag3, drive_pex_l9_clkreq_n_pag4,
+                          drive_pex_l9_rst_n_pag5, drive_sdmmc1_clk_pj0,
+                          drive_sdmmc1_cmd_pj1, drive_sdmmc1_dat3_pj5,
+                          drive_sdmmc1_dat2_pj4, drive_sdmmc1_dat1_pj3,
+                          drive_sdmmc1_dat0_pj2 ]
+
+  - if:
+      properties:
+        compatible:
+          const: nvidia,tegra234-pinmux-aon
+    then:
+      patternProperties:
+        "^pinmux(-[a-z0-9-_]+)?$":
+          type: object
+          additionalProperties:
+            properties:
+              nvidia,pins:
+                items:
+                  enum: [ can0_dout_paa0, can0_din_paa1, can1_dout_paa2,
+                          can1_din_paa3, can0_stb_paa4, can0_en_paa5,
+                          soc_gpio49_paa6, can0_err_paa7, can1_stb_pbb0,
+                          can1_en_pbb1, soc_gpio50_pbb2, can1_err_pbb3,
+                          spi2_sck_pcc0, spi2_miso_pcc1, spi2_mosi_pcc2,
+                          spi2_cs0_pcc3, touch_clk_pcc4, uart3_tx_pcc5,
+                          uart3_rx_pcc6, gen2_i2c_scl_pcc7, gen2_i2c_sda_pdd0,
+                          gen8_i2c_scl_pdd1, gen8_i2c_sda_pdd2,
+                          sce_error_pee0, vcomp_alert_pee1,
+                          ao_retention_n_pee2, batt_oc_pee3, power_on_pee4,
+                          soc_gpio26_pee5, soc_gpio27_pee6, bootv_ctl_n_pee7,
+                          hdmi_cec_pgg0,
+                          # drive groups
+                          drive_touch_clk_pcc4, drive_uart3_rx_pcc6,
+                          drive_uart3_tx_pcc5, drive_gen8_i2c_sda_pdd2,
+                          drive_gen8_i2c_scl_pdd1, drive_spi2_mosi_pcc2,
+                          drive_gen2_i2c_scl_pcc7, drive_spi2_cs0_pcc3,
+                          drive_gen2_i2c_sda_pdd0, drive_spi2_sck_pcc0,
+                          drive_spi2_miso_pcc1, drive_can1_dout_paa2,
+                          drive_can1_din_paa3, drive_can0_dout_paa0,
+                          drive_can0_din_paa1, drive_can0_stb_paa4,
+                          drive_can0_en_paa5, drive_soc_gpio49_paa6,
+                          drive_can0_err_paa7, drive_can1_stb_pbb0,
+                          drive_can1_en_pbb1, drive_soc_gpio50_pbb2,
+                          drive_can1_err_pbb3, drive_sce_error_pee0,
+                          drive_batt_oc_pee3, drive_bootv_ctl_n_pee7,
+                          drive_power_on_pee4, drive_soc_gpio26_pee5,
+                          drive_soc_gpio27_pee6, drive_ao_retention_n_pee2,
+                          drive_vcomp_alert_pee1, drive_hdmi_cec_pgg0 ]
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
+        compatible = "nvidia,tegra234-pinmux";
+        reg = <0x2430000 0x17000>;
+
+        pinctrl-names = "pex_rst";
+        pinctrl-0 = <&pex_rst_c5_out_state>;
+
+        pex_rst_c5_out_state: pinmux-pex-rst-c5-out {
+            pex_rst {
+                nvidia,pins = "pex_l5_rst_n_pgg1";
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
2.17.1

