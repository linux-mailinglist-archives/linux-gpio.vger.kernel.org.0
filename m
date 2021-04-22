Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60F46367C91
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Apr 2021 10:32:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235453AbhDVIbi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 22 Apr 2021 04:31:38 -0400
Received: from mail-mw2nam12on2060.outbound.protection.outlook.com ([40.107.244.60]:30512
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235435AbhDVIbg (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 22 Apr 2021 04:31:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S+OCUr0GFF4Bz4w67AJjlp5v/86AzgQGkt+WTQKwVu8QHa+OeP0kwExTRxYFHi1Z1JZZ13FPNxq1t5i/Z9O/lcfYstAt6L1mGPVSc5ZtnfLuphMC8OTCgtd2oYarCoWpGQ6Mq1nzAfBbOl/rhn/ke4FGBDVwIOd4pzDEwMEQ5Ta8Rb3UBEZb0IeDd6WVPwhMztTIPytoVTe7t6OkfWYZLmHSAxQsChVzBngpornjATDCWm/9hWG9hjG7uhNs0GBNjLFAu/44CYJWON20LZjAS6OXdK4g426vGXcc26d+8b3DSF73nT+glpfnE5Ir6t6w1sykH2/Hb2lK1x+ePgA5TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=91EW89J+AOWnPgUTmsnuvNPzuh/GIM7cXvwQHAp0vN4=;
 b=mrIv3FsMZ5KZCTBHYJJ3XYiRVqDQWB5gVuTcDT50jI4mmOZiNjRx/LwO4IJH2hf6JAYD9KeIL337c+Sn0K9JVtPnP434FTBI5xh7GvEaX4tMfSloaAmuaZUzmW0OGDHnyRUGQhSH9INg/Qy7kX1nX3DHFYUw4b8XMAIRJt02AcMPMUIDbeWJxRFMHMUjAY85dfn2vx99ZToqQLtv1CuTJrEpq29sV+2N8Oby5+0P6Gy3Cza1A9M64bCiBhU9e2599H9ITKFNUWNQXT/H9y8ILjWL6/PE7xCcAN4u2NnDmMzEzSquq/NpfjhvxzvC6UeiOpJ9Z7bCBvXbW+fhDtAggA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=gmail.com smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=91EW89J+AOWnPgUTmsnuvNPzuh/GIM7cXvwQHAp0vN4=;
 b=KkTgeiEUFigdRrWm9n8dRdG8XABfjLC2aWUpYgJ0rrbDitoHCpkOHKbRoREIkMtTf8zRqvWtsvoxDoBam8AmjTG30KgvOd2lQhbGafU6iMTbaYo6ouVIBtXt9GzI/tWkwjFojbsupXGeaAxkplwqg8L7EUhAATW3inQ3Kc5W/lA=
Received: from CY4PR15CA0010.namprd15.prod.outlook.com (2603:10b6:910:14::20)
 by PH0PR02MB7191.namprd02.prod.outlook.com (2603:10b6:510:13::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20; Thu, 22 Apr
 2021 08:30:56 +0000
Received: from CY1NAM02FT010.eop-nam02.prod.protection.outlook.com
 (2603:10b6:910:14:cafe::b5) by CY4PR15CA0010.outlook.office365.com
 (2603:10b6:910:14::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21 via Frontend
 Transport; Thu, 22 Apr 2021 08:30:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT010.mail.protection.outlook.com (10.152.75.50) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4065.21 via Frontend Transport; Thu, 22 Apr 2021 08:30:56 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 22 Apr 2021 01:30:40 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Thu, 22 Apr 2021 01:30:40 -0700
Envelope-to: git@xilinx.com,
 saikrishna12468@gmail.com,
 robh+dt@kernel.org,
 linus.walleij@linaro.org,
 gregkh@linuxfoundation.org,
 linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
Received: from [172.23.64.106] (port=49361 helo=xhdvnc125.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <lakshmi.sai.krishna.potthuri@xilinx.com>)
        id 1lZUjP-0005N8-0J; Thu, 22 Apr 2021 01:30:39 -0700
Received: by xhdvnc125.xilinx.com (Postfix, from userid 14964)
        id AF48712171C; Thu, 22 Apr 2021 14:00:10 +0530 (IST)
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
Subject: [PATCH v6 2/3] dt-bindings: pinctrl: Add binding for ZynqMP pinctrl driver
Date:   Thu, 22 Apr 2021 14:00:01 +0530
Message-ID: <1619080202-31924-3-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1619080202-31924-1-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
References: <1619080202-31924-1-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6dec2029-ddf4-40bc-ed0c-08d90568f367
X-MS-TrafficTypeDiagnostic: PH0PR02MB7191:
X-Microsoft-Antispam-PRVS: <PH0PR02MB71918340F619195FABFA3252BD469@PH0PR02MB7191.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bn2dZwaeoPEFfBp1Tvoo0hcat5yBtpYov2+o1Htid4ItYBX8XxtWOG8mcL3oiXaZ/3aLuRS9GA7hLTL61graJzNHEyVPga0Phk1qf1QoAWBEVI+LBwfeY3BgF6+nn2G/NbtqB2u+9ZKA7nP2mEu4K84cYtIDTa2Oqc6m3dY6zQrYZuF7zo+ng52vogkAJwCsqq441YMA7We1f/lxf9s84ulmB2JE8BPwMMi5xwNg0O/EQVBf7pXn93iET0OFzFBm0jo1vz4gCzWDaKWRo6+1nthsQqHanRtf0w1nEcwf/SNsaLbTX2NKghl5YNaoSKQwUSliYKNQyM/QiKe0xsdoG7YbT7rKOuTRrPdHFTCcZ5Sohzv4feTTazXk9DU/EzT6yUhOEhm/DCBPoT6uYt1O/rW3HRVJD8LTC+50kVpkQq3zJUHfAidn/IuK+6ulpniG/Nzj1/NXDyDttaK1dOKKB5UP94O5IbQ92F8GYoxxxysFNj0pxsOZd0SQsf65Z5NCCyiUtLmTDepm0qgKGHI/vWUcLL355a3KrA/WZL71VlhjixLvxQBgOSu/x0toFovb39uBpqMUJc/k5v5OXEGpMvcu8WThqGWSEhscccWyQ6ohfhNWlVUbYzKjYKZVVkEqGNYp6HaJPM+83UITRtybmtqTx0VyMcCH7WwNBuc1JidyrMRM/AeB39+donFiHk1rC45nbCo2NvD0Xm3RgbCKEQ8x1Us+PmuS+Xv+9UM650zvOwf83j9zoP5c1JY5Tvl4
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(396003)(39860400002)(346002)(136003)(376002)(46966006)(36840700001)(8936002)(6266002)(36906005)(7636003)(6666004)(8676002)(2906002)(36860700001)(47076005)(70206006)(2616005)(70586007)(336012)(42186006)(26005)(82310400003)(316002)(186003)(356005)(110136005)(107886003)(54906003)(36756003)(4326008)(82740400003)(5660300002)(426003)(966005)(478600001)(30864003)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2021 08:30:56.7418
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dec2029-ddf4-40bc-ed0c-08d90568f367
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT010.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB7191
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Adding documentation and dt-bindings file which contains MIO pin
configuration defines for Xilinx ZynqMP pinctrl driver.

Signed-off-by: Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Link: https://lore.kernel.org/r/1618485193-5403-3-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 .../bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml | 336 ++++++++++++++++++
 include/dt-bindings/pinctrl/pinctrl-zynqmp.h  |  19 +
 2 files changed, 355 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml
 create mode 100644 include/dt-bindings/pinctrl/pinctrl-zynqmp.h

diff --git a/Documentation/devicetree/bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml
new file mode 100644
index 000000000000..8ef0d07d35fe
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml
@@ -0,0 +1,336 @@
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
+      '^mux':
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
+              enum: [ethernet0_0_grp, ethernet1_0_grp, ethernet2_0_grp,
+                     ethernet3_0_grp, gemtsu0_0_grp, gemtsu0_1_grp,
+                     gemtsu0_2_grp, mdio0_0_grp, mdio1_0_grp,
+                     mdio1_1_grp, mdio2_0_grp, mdio3_0_grp,
+                     qspi0_0_grp, qspi_ss_0_grp, qspi_fbclk_0_grp,
+                     spi0_0_grp, spi0_ss_0_grp, spi0_ss_1_grp,
+                     spi0_ss_2_grp, spi0_1_grp, spi0_ss_3_grp,
+                     spi0_ss_4_grp, spi0_ss_5_grp, spi0_2_grp,
+                     spi0_ss_6_grp, spi0_ss_7_grp, spi0_ss_8_grp,
+                     spi0_3_grp, spi0_ss_9_grp, spi0_ss_10_grp,
+                     spi0_ss_11_grp, spi0_4_grp, spi0_ss_12_grp,
+                     spi0_ss_13_grp, spi0_ss_14_grp, spi0_5_grp,
+                     spi0_ss_15_grp, spi0_ss_16_grp, spi0_ss_17_grp,
+                     spi1_0_grp, spi1_ss_0_grp, spi1_ss_1_grp,
+                     spi1_ss_2_grp, spi1_1_grp, spi1_ss_3_grp,
+                     spi1_ss_4_grp, spi1_ss_5_grp, spi1_2_grp,
+                     spi1_ss_6_grp, spi1_ss_7_grp, spi1_ss_8_grp,
+                     spi1_3_grp, spi1_ss_9_grp, spi1_ss_10_grp,
+                     spi1_ss_11_grp, spi1_4_grp, spi1_ss_12_grp,
+                     spi1_ss_13_grp, spi1_ss_14_grp, spi1_5_grp,
+                     spi1_ss_15_grp, spi1_ss_16_grp, spi1_ss_17_grp,
+                     sdio0_0_grp, sdio0_1_grp, sdio0_2_grp,
+                     sdio0_3_grp, sdio0_4_grp, sdio0_5_grp,
+                     sdio0_6_grp, sdio0_7_grp, sdio0_8_grp,
+                     sdio0_9_grp, sdio0_10_grp, sdio0_11_grp,
+                     sdio0_12_grp, sdio0_13_grp, sdio0_14_grp,
+                     sdio0_15_grp, sdio0_16_grp, sdio0_17_grp,
+                     sdio0_18_grp, sdio0_19_grp, sdio0_20_grp,
+                     sdio0_21_grp, sdio0_22_grp, sdio0_23_grp,
+                     sdio0_24_grp, sdio0_25_grp, sdio0_26_grp,
+                     sdio0_27_grp, sdio0_28_grp, sdio0_29_grp,
+                     sdio0_30_grp, sdio0_31_grp, sdio0_32_grp,
+                     sdio0_pc_0_grp, sdio0_cd_0_grp, sdio0_wp_0_grp,
+                     sdio0_pc_1_grp, sdio0_cd_1_grp, sdio0_wp_1_grp,
+                     sdio0_pc_2_grp, sdio0_cd_2_grp, sdio0_wp_2_grp,
+                     sdio1_0_grp, sdio1_1_grp, sdio1_2_grp,
+                     sdio1_3_grp, sdio1_4_grp, sdio1_5_grp,
+                     sdio1_6_grp, sdio1_7_grp, sdio1_8_grp,
+                     sdio1_9_grp, sdio1_10_grp, sdio1_11_grp,
+                     sdio1_12_grp, sdio1_13_grp, sdio1_14_grp,
+                     sdio1_15_grp, sdio1_pc_0_grp, sdio1_cd_0_grp,
+                     sdio1_wp_0_grp, sdio1_pc_1_grp, sdio1_cd_1_grp,
+                     sdio1_wp_1_grp, nand0_0_grp, nand0_ce_0_grp,
+                     nand0_rb_0_grp, nand0_dqs_0_grp, nand0_ce_1_grp,
+                     nand0_rb_1_grp, nand0_dqs_1_grp, can0_0_grp,
+                     can0_1_grp, can0_2_grp, can0_3_grp,
+                     can0_4_grp, can0_5_grp, can0_6_grp,
+                     can0_7_grp, can0_8_grp, can0_9_grp,
+                     can0_10_grp, can0_11_grp, can0_12_grp,
+                     can0_13_grp, can0_14_grp, can0_15_grp,
+                     can0_16_grp, can0_17_grp, can0_18_grp,
+                     can1_0_grp, can1_1_grp, can1_2_grp,
+                     can1_3_grp, can1_4_grp, can1_5_grp,
+                     can1_6_grp, can1_7_grp, can1_8_grp,
+                     can1_9_grp, can1_10_grp, can1_11_grp,
+                     can1_12_grp, can1_13_grp, can1_14_grp,
+                     can1_15_grp, can1_16_grp, can1_17_grp,
+                     can1_18_grp, can1_19_grp, uart0_0_grp,
+                     uart0_1_grp, uart0_2_grp, uart0_3_grp,
+                     uart0_4_grp, uart0_5_grp, uart0_6_grp,
+                     uart0_7_grp, uart0_8_grp, uart0_9_grp,
+                     uart0_10_grp, uart0_11_grp, uart0_12_grp,
+                     uart0_13_grp, uart0_14_grp, uart0_15_grp,
+                     uart0_16_grp, uart0_17_grp, uart0_18_grp,
+                     uart1_0_grp, uart1_1_grp, uart1_2_grp,
+                     uart1_3_grp, uart1_4_grp, uart1_5_grp,
+                     uart1_6_grp, uart1_7_grp, uart1_8_grp,
+                     uart1_9_grp, uart1_10_grp, uart1_11_grp,
+                     uart1_12_grp, uart1_13_grp, uart1_14_grp,
+                     uart1_15_grp, uart1_16_grp, uart1_17_grp,
+                     uart1_18_grp, i2c0_0_grp, i2c0_1_grp,
+                     i2c0_2_grp, i2c0_3_grp, i2c0_4_grp,
+                     i2c0_5_grp, i2c0_6_grp, i2c0_7_grp,
+                     i2c0_8_grp, i2c0_9_grp, i2c0_10_grp,
+                     i2c0_11_grp, i2c0_12_grp, i2c0_13_grp,
+                     i2c0_14_grp, i2c0_15_grp, i2c0_16_grp,
+                     i2c0_17_grp, i2c0_18_grp, i2c1_0_grp,
+                     i2c1_1_grp, i2c1_2_grp, i2c1_3_grp,
+                     i2c1_4_grp, i2c1_5_grp, i2c1_6_grp,
+                     i2c1_7_grp, i2c1_8_grp, i2c1_9_grp,
+                     i2c1_10_grp, i2c1_11_grp, i2c1_12_grp,
+                     i2c1_13_grp, i2c1_14_grp, i2c1_15_grp,
+                     i2c1_16_grp, i2c1_17_grp, i2c1_18_grp,
+                     i2c1_19_grp, ttc0_clk_0_grp, ttc0_wav_0_grp,
+                     ttc0_clk_1_grp, ttc0_wav_1_grp, ttc0_clk_2_grp,
+                     ttc0_wav_2_grp, ttc0_clk_3_grp, ttc0_wav_3_grp,
+                     ttc0_clk_4_grp, ttc0_wav_4_grp, ttc0_clk_5_grp,
+                     ttc0_wav_5_grp, ttc0_clk_6_grp, ttc0_wav_6_grp,
+                     ttc0_clk_7_grp, ttc0_wav_7_grp, ttc0_clk_8_grp,
+                     ttc0_wav_8_grp, ttc1_clk_0_grp, ttc1_wav_0_grp,
+                     ttc1_clk_1_grp, ttc1_wav_1_grp, ttc1_clk_2_grp,
+                     ttc1_wav_2_grp, ttc1_clk_3_grp, ttc1_wav_3_grp,
+                     ttc1_clk_4_grp, ttc1_wav_4_grp, ttc1_clk_5_grp,
+                     ttc1_wav_5_grp, ttc1_clk_6_grp, ttc1_wav_6_grp,
+                     ttc1_clk_7_grp, ttc1_wav_7_grp, ttc1_clk_8_grp,
+                     ttc1_wav_8_grp, ttc2_clk_0_grp, ttc2_wav_0_grp,
+                     ttc2_clk_1_grp, ttc2_wav_1_grp, ttc2_clk_2_grp,
+                     ttc2_wav_2_grp, ttc2_clk_3_grp, ttc2_wav_3_grp,
+                     ttc2_clk_4_grp, ttc2_wav_4_grp, ttc2_clk_5_grp,
+                     ttc2_wav_5_grp, ttc2_clk_6_grp, ttc2_wav_6_grp,
+                     ttc2_clk_7_grp, ttc2_wav_7_grp, ttc2_clk_8_grp,
+                     ttc2_wav_8_grp, ttc3_clk_0_grp, ttc3_wav_0_grp,
+                     ttc3_clk_1_grp, ttc3_wav_1_grp, ttc3_clk_2_grp,
+                     ttc3_wav_2_grp, ttc3_clk_3_grp, ttc3_wav_3_grp,
+                     ttc3_clk_4_grp, ttc3_wav_4_grp, ttc3_clk_5_grp,
+                     ttc3_wav_5_grp, ttc3_clk_6_grp, ttc3_wav_6_grp,
+                     ttc3_clk_7_grp, ttc3_wav_7_grp, ttc3_clk_8_grp,
+                     ttc3_wav_8_grp, swdt0_clk_0_grp, swdt0_rst_0_grp,
+                     swdt0_clk_1_grp, swdt0_rst_1_grp, swdt0_clk_2_grp,
+                     swdt0_rst_2_grp, swdt0_clk_3_grp, swdt0_rst_3_grp,
+                     swdt0_clk_4_grp, swdt0_rst_4_grp, swdt0_clk_5_grp,
+                     swdt0_rst_5_grp, swdt0_clk_6_grp, swdt0_rst_6_grp,
+                     swdt0_clk_7_grp, swdt0_rst_7_grp, swdt0_clk_8_grp,
+                     swdt0_rst_8_grp, swdt0_clk_9_grp, swdt0_rst_9_grp,
+                     swdt0_clk_10_grp, swdt0_rst_10_grp, swdt0_clk_11_grp,
+                     swdt0_rst_11_grp, swdt0_clk_12_grp, swdt0_rst_12_grp,
+                     swdt1_clk_0_grp, swdt1_rst_0_grp, swdt1_clk_1_grp,
+                     swdt1_rst_1_grp, swdt1_clk_2_grp, swdt1_rst_2_grp,
+                     swdt1_clk_3_grp, swdt1_rst_3_grp, swdt1_clk_4_grp,
+                     swdt1_rst_4_grp, swdt1_clk_5_grp, swdt1_rst_5_grp,
+                     swdt1_clk_6_grp, swdt1_rst_6_grp, swdt1_clk_7_grp,
+                     swdt1_rst_7_grp, swdt1_clk_8_grp, swdt1_rst_8_grp,
+                     swdt1_clk_9_grp, swdt1_rst_9_grp, swdt1_clk_10_grp,
+                     swdt1_rst_10_grp, swdt1_clk_11_grp, swdt1_rst_11_grp,
+                     swdt1_clk_12_grp, swdt1_rst_12_grp, gpio0_0_grp,
+                     gpio0_1_grp, gpio0_2_grp, gpio0_3_grp,
+                     gpio0_4_grp, gpio0_5_grp, gpio0_6_grp,
+                     gpio0_7_grp, gpio0_8_grp, gpio0_9_grp,
+                     gpio0_10_grp, gpio0_11_grp, gpio0_12_grp,
+                     gpio0_13_grp, gpio0_14_grp, gpio0_15_grp,
+                     gpio0_16_grp, gpio0_17_grp, gpio0_18_grp,
+                     gpio0_19_grp, gpio0_20_grp, gpio0_21_grp,
+                     gpio0_22_grp, gpio0_23_grp, gpio0_24_grp,
+                     gpio0_25_grp, gpio0_26_grp, gpio0_27_grp,
+                     gpio0_28_grp, gpio0_29_grp, gpio0_30_grp,
+                     gpio0_31_grp, gpio0_32_grp, gpio0_33_grp,
+                     gpio0_34_grp, gpio0_35_grp, gpio0_36_grp,
+                     gpio0_37_grp, gpio0_38_grp, gpio0_39_grp,
+                     gpio0_40_grp, gpio0_41_grp, gpio0_42_grp,
+                     gpio0_43_grp, gpio0_44_grp, gpio0_45_grp,
+                     gpio0_46_grp, gpio0_47_grp, gpio0_48_grp,
+                     gpio0_49_grp, gpio0_50_grp, gpio0_51_grp,
+                     gpio0_52_grp, gpio0_53_grp, gpio0_54_grp,
+                     gpio0_55_grp, gpio0_56_grp, gpio0_57_grp,
+                     gpio0_58_grp, gpio0_59_grp, gpio0_60_grp,
+                     gpio0_61_grp, gpio0_62_grp, gpio0_63_grp,
+                     gpio0_64_grp, gpio0_65_grp, gpio0_66_grp,
+                     gpio0_67_grp, gpio0_68_grp, gpio0_69_grp,
+                     gpio0_70_grp, gpio0_71_grp, gpio0_72_grp,
+                     gpio0_73_grp, gpio0_74_grp, gpio0_75_grp,
+                     gpio0_76_grp, gpio0_77_grp, usb0_0_grp,
+                     usb1_0_grp, pmu0_0_grp, pmu0_1_grp,
+                     pmu0_2_grp, pmu0_3_grp, pmu0_4_grp,
+                     pmu0_5_grp, pmu0_6_grp, pmu0_7_grp,
+                     pmu0_8_grp, pmu0_9_grp, pmu0_10_grp,
+                     pmu0_11_grp, pcie0_0_grp, pcie0_1_grp,
+                     pcie0_2_grp, pcie0_3_grp, pcie0_4_grp,
+                     pcie0_5_grp, pcie0_6_grp, pcie0_7_grp,
+                     csu0_0_grp, csu0_1_grp, csu0_2_grp,
+                     csu0_3_grp, csu0_4_grp, csu0_5_grp,
+                     csu0_6_grp, csu0_7_grp, csu0_8_grp,
+                     csu0_9_grp, csu0_10_grp, csu0_11_grp,
+                     dpaux0_0_grp, dpaux0_1_grp, dpaux0_2_grp,
+                     dpaux0_3_grp, pjtag0_0_grp, pjtag0_1_grp,
+                     pjtag0_2_grp, pjtag0_3_grp, pjtag0_4_grp,
+                     pjtag0_5_grp, trace0_0_grp, trace0_clk_0_grp,
+                     trace0_1_grp, trace0_clk_1_grp, trace0_2_grp,
+                     trace0_clk_2_grp, testscan0_0_grp]
+            maxItems: 78
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
+      '^conf':
+        type: object
+        description:
+          Pinctrl node's client devices use subnodes for pin configurations,
+          which in turn use the standard properties below.
+        $ref: pincfg-node.yaml#
+
+        properties:
+          groups:
+            description:
+              List of pin groups as mentioned above.
+
+          pins:
+            description:
+              List of pin names to select in this subnode.
+            items:
+              pattern: '^MIO([0-9]|[1-6][0-9]|7[0-7])$'
+            maxItems: 78
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
+          power-source:
+            enum: [0, 1]
+
+        oneOf:
+          - required: [ groups ]
+          - required: [ pins ]
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
+                power-source = <IO_STANDARD_LVCMOS18>;
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
index 000000000000..cdb215734bdf
--- /dev/null
+++ b/include/dt-bindings/pinctrl/pinctrl-zynqmp.h
@@ -0,0 +1,19 @@
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
+/* Bit value for different voltage levels */
+#define IO_STANDARD_LVCMOS33	0
+#define IO_STANDARD_LVCMOS18	1
+
+/* Bit values for Slew Rates */
+#define SLEW_RATE_FAST		0
+#define SLEW_RATE_SLOW		1
+
+#endif /* _DT_BINDINGS_PINCTRL_ZYNQMP_H */
-- 
2.17.1

