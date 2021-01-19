Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BE292FB262
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Jan 2021 08:06:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726317AbhASHFA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Jan 2021 02:05:00 -0500
Received: from mail-mw2nam10on2045.outbound.protection.outlook.com ([40.107.94.45]:8320
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731586AbhASF3S (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 19 Jan 2021 00:29:18 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tk8ZSX1t7rbxM3BWC0p8BYwJ9pD+5LiBHnTunFI6vYQR0n6CkJ6Derhx9HHPaFTnp+69me9g1fHlr6/umqxfrdxnewtuudxkhM00H/vFV7+fpyiBcKejsoUC0YF3ObW3y73b2jHPSUIfVH3iQ2c9djtIohDPDVevTaQMXpmVqYtxi6b6UPTM5lN2XTXgm132x3ugxj8+iqgV22DmxheCdLoYxynh3sCSvoQvZs147c4ErwRV/HgQxqTRG4nWe8yu36HgnR1U8SdKPMFuMonCVQMQtfrlYE1j1M4j0UiT57SgQ6Ko0nlqkDoL/7uy0kOdP7LP6pgcxGSA+uxM8ocqhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LhFmhOHKYUZscJUePYJoN1M0mRd5NiQGrfK7Kt36Czk=;
 b=FHnJXRicB8OmAtealn0f5+jxKsv9KKGxOsKlk6JRML+f8aNs5wPY8Oa0+7RnNJ02/00vN8d2OH9nGjq0p/EXkalQzO6vVAFvzfn73wpGBbHvdWXkbxamaATJfGgi6ThNWaKIy46spB6bBEYiskw9Hu8tp3hO4tdAvhBPowX3YAZtl0nIH6dEdLuTxluEKPbLBpmhVkmJmyYEAJ8GUZvbyZezH34XgwJzBkFavUR6lAZuPoleO2hc/IBYkw7cvGIvM1F7sHfozsRw3g+T9QzAUgGUWDX1fiAs3UZFr8m3S9W+CPu0WhpEHPoDoOJJXSO5k6kJsiGGeXC96Vku7PO7Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=gmail.com smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LhFmhOHKYUZscJUePYJoN1M0mRd5NiQGrfK7Kt36Czk=;
 b=A/l9YAQSqn2jK8CE28AgGlZM75B72kyYdMo7sipmZAZko1TlKSFUod2VuNRVbIo3yWh3Xg4lH0nvx97WHr0xr3a96kFMi+2B5jHHoT/nqcn7GVaWGgLim0OgZ5AQaeNUH+YkR7STZNZ9OrmUdgsK1GfWn9CKMIWODIBHm/bcIBU=
Received: from SN4PR0401CA0032.namprd04.prod.outlook.com
 (2603:10b6:803:2a::18) by MW4PR02MB7492.namprd02.prod.outlook.com
 (2603:10b6:303:7c::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Tue, 19 Jan
 2021 05:28:18 +0000
Received: from SN1NAM02FT057.eop-nam02.prod.protection.outlook.com
 (2603:10b6:803:2a:cafe::99) by SN4PR0401CA0032.outlook.office365.com
 (2603:10b6:803:2a::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10 via Frontend
 Transport; Tue, 19 Jan 2021 05:28:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT057.mail.protection.outlook.com (10.152.73.105) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3763.12 via Frontend Transport; Tue, 19 Jan 2021 05:28:18 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Mon, 18 Jan 2021 21:28:12 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Mon, 18 Jan 2021 21:28:12 -0800
Envelope-to: git@xilinx.com,
 michal.simek@xilinx.com,
 saikrishna12468@gmail.com,
 robh+dt@kernel.org,
 linus.walleij@linaro.org,
 gregkh@linuxfoundation.org,
 linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
Received: from [172.23.64.106] (port=37122 helo=xhdvnc125.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <lakshmi.sai.krishna.potthuri@xilinx.com>)
        id 1l1jYp-0004V3-Fl; Mon, 18 Jan 2021 21:28:12 -0800
Received: by xhdvnc125.xilinx.com (Postfix, from userid 14964)
        id 1D0A91222D7; Tue, 19 Jan 2021 10:57:44 +0530 (IST)
From:   Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <git@xilinx.com>,
        <saikrishna12468@gmail.com>,
        Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>
Subject: [PATCH v2 2/3] dt-bindings: pinctrl: Added binding for ZynqMP pinctrl driver
Date:   Tue, 19 Jan 2021 10:57:33 +0530
Message-ID: <1611034054-63867-3-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1611034054-63867-1-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
References: <1611034054-63867-1-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 511397d3-c21e-483b-8aa5-08d8bc3b0733
X-MS-TrafficTypeDiagnostic: MW4PR02MB7492:
X-Microsoft-Antispam-PRVS: <MW4PR02MB749206168D48B9C38E009E49BDA30@MW4PR02MB7492.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qgDJA8NeS3WFRPCUa5L4fSFn6EOTTo/6TpNsKiUD16kKu1c/aib0HSsdMbThguxBXxeJoV5dZoQNkfyGtBLVshYKErDS7m7VPUzeCseM6nfb0sZj3CpnI9MB1/xRa5OVlNzSIsSjkRUnDlWSze5Sa1KvIF+61zIhvb9V3Lwe6NoKT8H3xqetoOc+P8eh2pQI4YYsQfZcR7Lh1AGkwpnHJ3sYkDjj/BrhFQPWiJUwY/k3fPSADrPozbb8QnGOlf/WveWG0OhEL6NzvtVVwLmA3QVt30ec7WFpp0+4XLZWm8v/LgUdRYEkevM64SAKJsi5SJl5RprBuqoY4b66y2Y6hbBCDTyvo9+8JERvRaLp8IBL3rf0v823zNKebIa1om/dzb+kWHnukRy4xewmk+lBGpFCKoorFacVNRZRcjZcgxOMPB18K4C4ECcOzgtldE7hWg1vKS74S4/FetzNGJnOyuENDzI0TSlMQRyW/ervmN3I5nMZkVedKD5g6XTdy4rkt4Bt4LxGxXDxHNu6iu9gHfdmYQX7SIrTwF66v1w3VxEMt74kmIoPjf5IchaiV2oD
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(136003)(39860400002)(376002)(346002)(396003)(46966006)(82310400003)(6266002)(2616005)(107886003)(4326008)(70586007)(316002)(82740400003)(426003)(356005)(186003)(478600001)(8676002)(7636003)(26005)(70206006)(8936002)(966005)(47076005)(2906002)(5660300002)(36756003)(42186006)(30864003)(54906003)(110136005)(336012)(6666004)(36906005)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2021 05:28:18.1966
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 511397d3-c21e-483b-8aa5-08d8bc3b0733
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT057.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR02MB7492
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Added documentation and dt-bindings file which contains MIO pin
configuration defines for Xilinx ZynqMP pinctrl driver.

Signed-off-by: Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>
---
 .../bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml | 337 ++++++++++++++++++
 include/dt-bindings/pinctrl/pinctrl-zynqmp.h  |  23 ++
 2 files changed, 360 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml
 create mode 100644 include/dt-bindings/pinctrl/pinctrl-zynqmp.h

diff --git a/Documentation/devicetree/bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml
new file mode 100644
index 000000000000..9f2efbafcaa4
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml
@@ -0,0 +1,337 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/xlnx,zynqmp-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Xilinx ZynqMP Pinctrl
+
+maintainers:
+  - Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>
+  - Rajan Vaja <rajan.vaja@xilinx.com>
+
+description: |
+  Please refer to pinctrl-bindings.txt in this directory for details of the
+  common pinctrl bindings used by client devices, including the meaning of the
+  phrase "pin configuration node".
+
+  ZynqMP's pin configuration nodes act as a container for an arbitrary number of
+  subnodes. Each of these subnodes represents some desired configuration for a
+  pin, a group, or a list of pins or groups. This configuration can include the
+  mux function to select on those pin(s)/group(s), and various pin configuration
+  parameters, such as pull-up, slew rate, etc.
+
+  Each configuration node can consist of multiple nodes describing the pinmux and
+  pinconf options. Those nodes can be pinmux nodes or pinconf nodes.
+
+  The name of each subnode is not important; all subnodes should be enumerated
+  and processed purely based on their content.
+
+properties:
+  compatible:
+    const: xlnx,zynqmp-pinctrl
+
+patternProperties:
+  '^(.*-)?(default|gpio)$':
+    type: object
+    patternProperties:
+      '^mux(.*)$':
+        type: object
+        description:
+          Pinctrl node's client devices use subnodes for pin muxes,
+          which in turn use below standard properties.
+        $ref: pinmux-node.yaml#
+
+        properties:
+          groups:
+            description:
+              List of groups to select (either this or "pins" must be
+              specified), available groups for this subnode.
+            items:
+              oneOf:
+                - enum: [ethernet0_0_grp, ethernet1_0_grp, ethernet2_0_grp,
+                         ethernet3_0_grp, gemtsu0_0_grp, gemtsu0_1_grp,
+                         gemtsu0_2_grp, mdio0_0_grp, mdio1_0_grp,
+                         mdio1_1_grp, mdio2_0_grp, mdio3_0_grp,
+                         qspi0_0_grp, qspi_ss_0_grp, qspi_fbclk_0_grp,
+                         spi0_0_grp, spi0_ss_0_grp, spi0_ss_1_grp,
+                         spi0_ss_2_grp, spi0_1_grp, spi0_ss_3_grp,
+                         spi0_ss_4_grp, spi0_ss_5_grp, spi0_2_grp,
+                         spi0_ss_6_grp, spi0_ss_7_grp, spi0_ss_8_grp,
+                         spi0_3_grp, spi0_ss_9_grp, spi0_ss_10_grp,
+                         spi0_ss_11_grp, spi0_4_grp, spi0_ss_12_grp,
+                         spi0_ss_13_grp, spi0_ss_14_grp, spi0_5_grp,
+                         spi0_ss_15_grp, spi0_ss_16_grp, spi0_ss_17_grp,
+                         spi1_0_grp, spi1_ss_0_grp, spi1_ss_1_grp,
+                         spi1_ss_2_grp, spi1_1_grp, spi1_ss_3_grp,
+                         spi1_ss_4_grp, spi1_ss_5_grp, spi1_2_grp,
+                         spi1_ss_6_grp, spi1_ss_7_grp, spi1_ss_8_grp,
+                         spi1_3_grp, spi1_ss_9_grp, spi1_ss_10_grp,
+                         spi1_ss_11_grp, spi1_4_grp, spi1_ss_12_grp,
+                         spi1_ss_13_grp, spi1_ss_14_grp, spi1_5_grp,
+                         spi1_ss_15_grp, spi1_ss_16_grp, spi1_ss_17_grp,
+                         sdio0_0_grp, sdio0_1_grp, sdio0_2_grp,
+                         sdio0_3_grp, sdio0_4_grp, sdio0_5_grp,
+                         sdio0_6_grp, sdio0_7_grp, sdio0_8_grp,
+                         sdio0_9_grp, sdio0_10_grp, sdio0_11_grp,
+                         sdio0_12_grp, sdio0_13_grp, sdio0_14_grp,
+                         sdio0_15_grp, sdio0_16_grp, sdio0_17_grp,
+                         sdio0_18_grp, sdio0_19_grp, sdio0_20_grp,
+                         sdio0_21_grp, sdio0_22_grp, sdio0_23_grp,
+                         sdio0_24_grp, sdio0_25_grp, sdio0_26_grp,
+                         sdio0_27_grp, sdio0_28_grp, sdio0_29_grp,
+                         sdio0_30_grp, sdio0_31_grp, sdio0_32_grp,
+                         sdio0_pc_0_grp, sdio0_cd_0_grp, sdio0_wp_0_grp,
+                         sdio0_pc_1_grp, sdio0_cd_1_grp, sdio0_wp_1_grp,
+                         sdio0_pc_2_grp, sdio0_cd_2_grp, sdio0_wp_2_grp,
+                         sdio1_0_grp, sdio1_1_grp, sdio1_2_grp,
+                         sdio1_3_grp, sdio1_4_grp, sdio1_5_grp,
+                         sdio1_6_grp, sdio1_7_grp, sdio1_8_grp,
+                         sdio1_9_grp, sdio1_10_grp, sdio1_11_grp,
+                         sdio1_12_grp, sdio1_13_grp, sdio1_14_grp,
+                         sdio1_15_grp, sdio1_pc_0_grp, sdio1_cd_0_grp,
+                         sdio1_wp_0_grp, sdio1_pc_1_grp, sdio1_cd_1_grp,
+                         sdio1_wp_1_grp, nand0_0_grp, nand0_ce_0_grp,
+                         nand0_rb_0_grp, nand0_dqs_0_grp, nand0_ce_1_grp,
+                         nand0_rb_1_grp, nand0_dqs_1_grp, can0_0_grp,
+                         can0_1_grp, can0_2_grp, can0_3_grp,
+                         can0_4_grp, can0_5_grp, can0_6_grp,
+                         can0_7_grp, can0_8_grp, can0_9_grp,
+                         can0_10_grp, can0_11_grp, can0_12_grp,
+                         can0_13_grp, can0_14_grp, can0_15_grp,
+                         can0_16_grp, can0_17_grp, can0_18_grp,
+                         can1_0_grp, can1_1_grp, can1_2_grp,
+                         can1_3_grp, can1_4_grp, can1_5_grp,
+                         can1_6_grp, can1_7_grp, can1_8_grp,
+                         can1_9_grp, can1_10_grp, can1_11_grp,
+                         can1_12_grp, can1_13_grp, can1_14_grp,
+                         can1_15_grp, can1_16_grp, can1_17_grp,
+                         can1_18_grp, can1_19_grp, uart0_0_grp,
+                         uart0_1_grp, uart0_2_grp, uart0_3_grp,
+                         uart0_4_grp, uart0_5_grp, uart0_6_grp,
+                         uart0_7_grp, uart0_8_grp, uart0_9_grp,
+                         uart0_10_grp, uart0_11_grp, uart0_12_grp,
+                         uart0_13_grp, uart0_14_grp, uart0_15_grp,
+                         uart0_16_grp, uart0_17_grp, uart0_18_grp,
+                         uart1_0_grp, uart1_1_grp, uart1_2_grp,
+                         uart1_3_grp, uart1_4_grp, uart1_5_grp,
+                         uart1_6_grp, uart1_7_grp, uart1_8_grp,
+                         uart1_9_grp, uart1_10_grp, uart1_11_grp,
+                         uart1_12_grp, uart1_13_grp, uart1_14_grp,
+                         uart1_15_grp, uart1_16_grp, uart1_17_grp,
+                         uart1_18_grp, i2c0_0_grp, i2c0_1_grp,
+                         i2c0_2_grp, i2c0_3_grp, i2c0_4_grp,
+                         i2c0_5_grp, i2c0_6_grp, i2c0_7_grp,
+                         i2c0_8_grp, i2c0_9_grp, i2c0_10_grp,
+                         i2c0_11_grp, i2c0_12_grp, i2c0_13_grp,
+                         i2c0_14_grp, i2c0_15_grp, i2c0_16_grp,
+                         i2c0_17_grp, i2c0_18_grp, i2c1_0_grp,
+                         i2c1_1_grp, i2c1_2_grp, i2c1_3_grp,
+                         i2c1_4_grp, i2c1_5_grp, i2c1_6_grp,
+                         i2c1_7_grp, i2c1_8_grp, i2c1_9_grp,
+                         i2c1_10_grp, i2c1_11_grp, i2c1_12_grp,
+                         i2c1_13_grp, i2c1_14_grp, i2c1_15_grp,
+                         i2c1_16_grp, i2c1_17_grp, i2c1_18_grp,
+                         i2c1_19_grp, ttc0_clk_0_grp, ttc0_wav_0_grp,
+                         ttc0_clk_1_grp, ttc0_wav_1_grp, ttc0_clk_2_grp,
+                         ttc0_wav_2_grp, ttc0_clk_3_grp, ttc0_wav_3_grp,
+                         ttc0_clk_4_grp, ttc0_wav_4_grp, ttc0_clk_5_grp,
+                         ttc0_wav_5_grp, ttc0_clk_6_grp, ttc0_wav_6_grp,
+                         ttc0_clk_7_grp, ttc0_wav_7_grp, ttc0_clk_8_grp,
+                         ttc0_wav_8_grp, ttc1_clk_0_grp, ttc1_wav_0_grp,
+                         ttc1_clk_1_grp, ttc1_wav_1_grp, ttc1_clk_2_grp,
+                         ttc1_wav_2_grp, ttc1_clk_3_grp, ttc1_wav_3_grp,
+                         ttc1_clk_4_grp, ttc1_wav_4_grp, ttc1_clk_5_grp,
+                         ttc1_wav_5_grp, ttc1_clk_6_grp, ttc1_wav_6_grp,
+                         ttc1_clk_7_grp, ttc1_wav_7_grp, ttc1_clk_8_grp,
+                         ttc1_wav_8_grp, ttc2_clk_0_grp, ttc2_wav_0_grp,
+                         ttc2_clk_1_grp, ttc2_wav_1_grp, ttc2_clk_2_grp,
+                         ttc2_wav_2_grp, ttc2_clk_3_grp, ttc2_wav_3_grp,
+                         ttc2_clk_4_grp, ttc2_wav_4_grp, ttc2_clk_5_grp,
+                         ttc2_wav_5_grp, ttc2_clk_6_grp, ttc2_wav_6_grp,
+                         ttc2_clk_7_grp, ttc2_wav_7_grp, ttc2_clk_8_grp,
+                         ttc2_wav_8_grp, ttc3_clk_0_grp, ttc3_wav_0_grp,
+                         ttc3_clk_1_grp, ttc3_wav_1_grp, ttc3_clk_2_grp,
+                         ttc3_wav_2_grp, ttc3_clk_3_grp, ttc3_wav_3_grp,
+                         ttc3_clk_4_grp, ttc3_wav_4_grp, ttc3_clk_5_grp,
+                         ttc3_wav_5_grp, ttc3_clk_6_grp, ttc3_wav_6_grp,
+                         ttc3_clk_7_grp, ttc3_wav_7_grp, ttc3_clk_8_grp,
+                         ttc3_wav_8_grp, swdt0_clk_0_grp, swdt0_rst_0_grp,
+                         swdt0_clk_1_grp, swdt0_rst_1_grp, swdt0_clk_2_grp,
+                         swdt0_rst_2_grp, swdt0_clk_3_grp, swdt0_rst_3_grp,
+                         swdt0_clk_4_grp, swdt0_rst_4_grp, swdt0_clk_5_grp,
+                         swdt0_rst_5_grp, swdt0_clk_6_grp, swdt0_rst_6_grp,
+                         swdt0_clk_7_grp, swdt0_rst_7_grp, swdt0_clk_8_grp,
+                         swdt0_rst_8_grp, swdt0_clk_9_grp, swdt0_rst_9_grp,
+                         swdt0_clk_10_grp, swdt0_rst_10_grp, swdt0_clk_11_grp,
+                         swdt0_rst_11_grp, swdt0_clk_12_grp, swdt0_rst_12_grp,
+                         swdt1_clk_0_grp, swdt1_rst_0_grp, swdt1_clk_1_grp,
+                         swdt1_rst_1_grp, swdt1_clk_2_grp, swdt1_rst_2_grp,
+                         swdt1_clk_3_grp, swdt1_rst_3_grp, swdt1_clk_4_grp,
+                         swdt1_rst_4_grp, swdt1_clk_5_grp, swdt1_rst_5_grp,
+                         swdt1_clk_6_grp, swdt1_rst_6_grp, swdt1_clk_7_grp,
+                         swdt1_rst_7_grp, swdt1_clk_8_grp, swdt1_rst_8_grp,
+                         swdt1_clk_9_grp, swdt1_rst_9_grp, swdt1_clk_10_grp,
+                         swdt1_rst_10_grp, swdt1_clk_11_grp, swdt1_rst_11_grp,
+                         swdt1_clk_12_grp, swdt1_rst_12_grp, gpio0_0_grp,
+                         gpio0_1_grp, gpio0_2_grp, gpio0_3_grp,
+                         gpio0_4_grp, gpio0_5_grp, gpio0_6_grp,
+                         gpio0_7_grp, gpio0_8_grp, gpio0_9_grp,
+                         gpio0_10_grp, gpio0_11_grp, gpio0_12_grp,
+                         gpio0_13_grp, gpio0_14_grp, gpio0_15_grp,
+                         gpio0_16_grp, gpio0_17_grp, gpio0_18_grp,
+                         gpio0_19_grp, gpio0_20_grp, gpio0_21_grp,
+                         gpio0_22_grp, gpio0_23_grp, gpio0_24_grp,
+                         gpio0_25_grp, gpio0_26_grp, gpio0_27_grp,
+                         gpio0_28_grp, gpio0_29_grp, gpio0_30_grp,
+                         gpio0_31_grp, gpio0_32_grp, gpio0_33_grp,
+                         gpio0_34_grp, gpio0_35_grp, gpio0_36_grp,
+                         gpio0_37_grp, gpio0_38_grp, gpio0_39_grp,
+                         gpio0_40_grp, gpio0_41_grp, gpio0_42_grp,
+                         gpio0_43_grp, gpio0_44_grp, gpio0_45_grp,
+                         gpio0_46_grp, gpio0_47_grp, gpio0_48_grp,
+                         gpio0_49_grp, gpio0_50_grp, gpio0_51_grp,
+                         gpio0_52_grp, gpio0_53_grp, gpio0_54_grp,
+                         gpio0_55_grp, gpio0_56_grp, gpio0_57_grp,
+                         gpio0_58_grp, gpio0_59_grp, gpio0_60_grp,
+                         gpio0_61_grp, gpio0_62_grp, gpio0_63_grp,
+                         gpio0_64_grp, gpio0_65_grp, gpio0_66_grp,
+                         gpio0_67_grp, gpio0_68_grp, gpio0_69_grp,
+                         gpio0_70_grp, gpio0_71_grp, gpio0_72_grp,
+                         gpio0_73_grp, gpio0_74_grp, gpio0_75_grp,
+                         gpio0_76_grp, gpio0_77_grp, usb0_0_grp,
+                         usb1_0_grp, pmu0_0_grp, pmu0_1_grp,
+                         pmu0_2_grp, pmu0_3_grp, pmu0_4_grp,
+                         pmu0_5_grp, pmu0_6_grp, pmu0_7_grp,
+                         pmu0_8_grp, pmu0_9_grp, pmu0_10_grp,
+                         pmu0_11_grp, pcie0_0_grp, pcie0_1_grp,
+                         pcie0_2_grp, pcie0_3_grp, pcie0_4_grp,
+                         pcie0_5_grp, pcie0_6_grp, pcie0_7_grp,
+                         csu0_0_grp, csu0_1_grp, csu0_2_grp,
+                         csu0_3_grp, csu0_4_grp, csu0_5_grp,
+                         csu0_6_grp, csu0_7_grp, csu0_8_grp,
+                         csu0_9_grp, csu0_10_grp, csu0_11_grp,
+                         dpaux0_0_grp, dpaux0_1_grp, dpaux0_2_grp,
+                         dpaux0_3_grp, pjtag0_0_grp, pjtag0_1_grp,
+                         pjtag0_2_grp, pjtag0_3_grp, pjtag0_4_grp,
+                         pjtag0_5_grp, trace0_0_grp, trace0_clk_0_grp,
+                         trace0_1_grp, trace0_clk_1_grp, trace0_2_grp,
+                         trace0_clk_2_grp, testscan0_0_grp]
+
+          function:
+            description:
+              Specify the alternative function to be configured for the
+              given pin groups.
+            enum: [ethernet0, ethernet1, ethernet2, ethernet3, gemtsu0, usb0, usb1, mdio0,
+                   mdio1, mdio2, mdio3, qspi0, qspi_fbclk, qspi_ss, spi0, spi1, spi0_ss,
+                   spi1_ss, sdio0, sdio0_pc, sdio0_wp, sdio0_cd, sdio1, sdio1_pc, sdio1_wp,
+                   sdio1_cd, nand0, nand0_ce, nand0_rb, nand0_dqs, can0, can1, uart0, uart1,
+                   i2c0, i2c1, ttc0_clk, ttc0_wav, ttc1_clk, ttc1_wav, ttc2_clk, ttc2_wav,
+                   ttc3_clk, ttc3_wav, swdt0_clk, swdt0_rst, swdt1_clk, swdt1_rst, gpio0, pmu0,
+                   pcie0, csu0, dpaux0, pjtag0, trace0, trace0_clk, testscan0]
+
+        required:
+          - groups
+          - function
+
+        additionalProperties: false
+
+      '^conf(.*)$':
+        type: object
+        description:
+          Pinctrl node's client devices use subnodes for pin configurations,
+          which in turn use the standard properties below.
+        $ref: pincfg-node.yaml#
+
+        properties:
+          groups:
+            description:
+              List of pin groups as mentioned above (either this or "pins" must
+              be specified).
+
+          pins:
+            description:
+              List of pin names to select in this subnode (either this or "groups" must
+              be specified)
+            items:
+              oneOf:
+                - pattern: '^MIO([0-9]|[1-6][0-9]|7[0-7])$'
+
+          bias-pull-up: true
+
+          bias-pull-down: true
+
+          bias-disable: true
+
+          input-schmitt-enable: true
+
+          input-schmitt-disable: true
+
+          bias-high-impedance: true
+
+          low-power-enable: true
+
+          low-power-disable: true
+
+          slew-rate:
+            enum: [0, 1]
+
+          drive-strength:
+            description:
+              Selects the drive strength for MIO pins, in mA.
+            enum: [2, 4, 8, 12]
+
+          io-standard:
+            description:
+              Selects the IO standard for MIO pins, this is driver specific.
+            $ref: "/schemas/types.yaml#/definitions/uint32"
+            enum: [0, 1]
+
+        additionalProperties: false
+
+    additionalProperties: false
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/pinctrl/pinctrl-zynqmp.h>
+    zynqmp_firmware: zynqmp-firmware {
+        pinctrl0: pinctrl {
+          compatible = "xlnx,zynqmp-pinctrl";
+
+          pinctrl_uart1_default: uart1-default {
+             mux {
+                 groups = "uart0_4_grp", "uart0_5_grp";
+                 function = "uart0";
+             };
+
+             conf {
+                groups = "uart0_4_grp";
+                slew-rate = <SLEW_RATE_SLOW>;
+                io-standard = <IO_STANDARD_LVCMOS18>;
+             };
+
+             conf-rx {
+                pins = "MIO18";
+                bias-pull-up;
+             };
+
+             conf-tx {
+                pins = "MIO19";
+                bias-disable;
+                input-schmitt-disable;
+             };
+          };
+        };
+    };
+
+    uart1 {
+         pinctrl-names = "default";
+         pinctrl-0 = <&pinctrl_uart1_default>;
+    };
+
+...
diff --git a/include/dt-bindings/pinctrl/pinctrl-zynqmp.h b/include/dt-bindings/pinctrl/pinctrl-zynqmp.h
new file mode 100644
index 000000000000..b73b0ae2f90b
--- /dev/null
+++ b/include/dt-bindings/pinctrl/pinctrl-zynqmp.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * MIO pin configuration defines for Xilinx ZynqMP
+ *
+ * Copyright (C) 2020 Xilinx, Inc.
+ */
+
+#ifndef _DT_BINDINGS_PINCTRL_ZYNQMP_H
+#define _DT_BINDINGS_PINCTRL_ZYNQMP_H
+
+/* Bit value for IO standards */
+#define IO_STANDARD_LVCMOS33	0
+#define IO_STANDARD_LVCMOS18	1
+
+/* Bit values for Slew Rates */
+#define SLEW_RATE_FAST		0
+#define SLEW_RATE_SLOW		1
+
+/* Bit values for Pin inputs */
+#define PIN_INPUT_TYPE_CMOS	0
+#define PIN_INPUT_TYPE_SCHMITT	1
+
+#endif /* _DT_BINDINGS_PINCTRL_ZYNQMP_H */
-- 
2.17.1

