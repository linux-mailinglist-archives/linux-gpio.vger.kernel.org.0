Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C1F22D3DBB
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Dec 2020 09:43:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727599AbgLIImR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Dec 2020 03:42:17 -0500
Received: from mail-dm6nam12on2087.outbound.protection.outlook.com ([40.107.243.87]:26624
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727218AbgLIImM (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 9 Dec 2020 03:42:12 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jrkcTi4oP2ZbjogEqgz/8m0MQjqyM/u7l756gVtUFSyMJ9KFj4qhktqZNmB3SsGI02y1CVJT+r0Zy5SsUPx7rWgo8+73WA4/rsMfOZS1DyJ4TQOp4HRl5UxsEcZlCVmZ0CZT8rqXEHdA5SutsihxYZJm6uObUEkaKRMqYrUQniuLMABa/ujjsVSA6XQ6oMua+0HZm9WEouwdTTsxgejnf33dowhM8YK3dwJ1jXsLcW15LWL95YihyoYUZeSOuimwqpCLxXoNpzI76j82pN5Cesb+NmKSfskGXMW2KZ9uy/peyanhXMKogXuHuK/USMFMlVqwWwdnZZ7W26Jig9oR3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rJSeKX4rciHjHSv6xJMCryd5RRskPyS2ghDRmKqh/7M=;
 b=AnDc2b4attor51ZxVA5geSecxTyG+uFwXYyDUN0QglsKfhNa2HTTGinQleKHZEmLtbrL9dL+I4Bjppl3zP8T1+2+s7Ey46tgJ0uyYxPUX5Ft8UVYKKjKAHN/nzng/BY7n4/57s4MElvNLGaToSKAE+fDOk+Oq0/Jb4/X4lEx1UMPQ8uj7YLVBnaFg+QV89fkf7zeJt597SAc2wftbi/06049YlSkgZMHycHAtpU4gqwFUuNsj6QjkhvUXgZQGYSO9lOiC2meviplSDYB3JkIekRCXnmgLpSMYNZImU+McYy0xPoan55qTSCryPK/ssYXxHsf9YNXorIMtsVhEsmwCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=gmail.com smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rJSeKX4rciHjHSv6xJMCryd5RRskPyS2ghDRmKqh/7M=;
 b=BNZTLs4hFtlDHBRdLawUjCQxHeLqhb47mmY9SNmRk3FILnTPvo08niXuFx9yNS1jMUiSPjib9NGBC6GIY50g5uN8QrmPW9gI31dDANFJgQ+hF5oy7F98OJCWs/XnhQiasVk4mxBLeKtxq1hzSF1wj5/6NR+63H06B0sQx2+kcps=
Received: from SN4PR0401CA0020.namprd04.prod.outlook.com
 (2603:10b6:803:21::30) by SA0PR02MB7340.namprd02.prod.outlook.com
 (2603:10b6:806:ea::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12; Wed, 9 Dec
 2020 08:41:15 +0000
Received: from SN1NAM02FT063.eop-nam02.prod.protection.outlook.com
 (2603:10b6:803:21:cafe::2) by SN4PR0401CA0020.outlook.office365.com
 (2603:10b6:803:21::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend
 Transport; Wed, 9 Dec 2020 08:41:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT063.mail.protection.outlook.com (10.152.72.213) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3632.21 via Frontend Transport; Wed, 9 Dec 2020 08:41:15 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Wed, 9 Dec 2020 00:41:06 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Wed, 9 Dec 2020 00:41:06 -0800
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
Received: from [10.140.6.35] (port=50860 helo=xhdsaipava40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <lakshmi.sai.krishna.potthuri@xilinx.com>)
        id 1kmv21-0001cX-1n; Wed, 09 Dec 2020 00:41:05 -0800
Received: by xhdsaipava40.xilinx.com (Postfix, from userid 14964)
        id C626813C03C9; Wed,  9 Dec 2020 14:15:20 +0530 (IST)
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
Subject: [PATCH 2/3] dt-bindings: pinctrl: Added binding for ZynqMP pinctrl driver
Date:   Wed, 9 Dec 2020 14:14:13 +0530
Message-ID: <1607503454-26503-3-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607503454-26503-1-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
References: <1607503454-26503-1-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f51b0186-e301-4ebb-67da-08d89c1e30f4
X-MS-TrafficTypeDiagnostic: SA0PR02MB7340:
X-Microsoft-Antispam-PRVS: <SA0PR02MB7340CA91A583724F8B18D85CBDCC0@SA0PR02MB7340.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EXkpK1gAo59QgQHgYBy8UYjNnaqRSULy7yEsArF5jyVBNLMVv6r9GWN2nGCnTntY7JvD+4pnGPSmQcNxL+d4xnmZMYjbhRzoEFgFKHdJvqn1eBraJwJwvWvLJdBU6oP0tu2oqgWtY8pviaG+O+h3dMyFT0H2+sETAYITUm0rAaktjzmYa8/KvBja3X0zW2Ds64w0J3VS7n/z738kUBxJkvGvGN8wkxSPpzAavHQMwBDq5HnQJEX9fnRoathKULDmTpnarI1TTBrD4G1e/x0n5NDPTau8kloscaVP9VfQ8kQ+kDtw2VxkACAhjzTFTA496lkM6N9EfP4H6xki1JcyXH3rv+uvx246HlqPzgwuCqnxvo+FdfeUPS9dn+3QG9Ilv4PR+IVwQjadyU5goEXhD4lwBoLwN6vrzXGl8AUikSndHFrBIpuexZP/0cHUapel8pEmkypB5CMmDwC/3sTAsFV4UMx4EH8ZyDIS2st/863U/olPl2opNJ7D62dpcl9A
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(46966005)(36906005)(54906003)(426003)(8676002)(47076004)(6666004)(110136005)(42186006)(966005)(508600001)(336012)(356005)(7636003)(186003)(36756003)(82310400003)(4326008)(26005)(2906002)(70586007)(6266002)(70206006)(107886003)(2616005)(8936002)(30864003)(5660300002)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2020 08:41:15.6401
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f51b0186-e301-4ebb-67da-08d89c1e30f4
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT063.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR02MB7340
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Added documentation and dt-bindings file which contains MIO pin
configuration defines for Xilinx ZynqMP pinctrl driver.

Signed-off-by: Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>
---
 .../bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml | 329 ++++++++++++++++++
 include/dt-bindings/pinctrl/pinctrl-zynqmp.h  |  29 ++
 2 files changed, 358 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml
 create mode 100644 include/dt-bindings/pinctrl/pinctrl-zynqmp.h

diff --git a/Documentation/devicetree/bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml
new file mode 100644
index 000000000000..dd0c8c12714f
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml
@@ -0,0 +1,329 @@
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
+      '^(.*-)?mux$':
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
+            enum: [ethernet0_0_grp, ethernet1_0_grp, ethernet2_0_grp,
+                   ethernet3_0_grp, gemtsu0_0_grp, gemtsu0_1_grp,
+                   gemtsu0_2_grp, mdio0_0_grp, mdio1_0_grp,
+                   mdio1_1_grp, mdio2_0_grp, mdio3_0_grp,
+                   qspi0_0_grp, qspi_ss_0_grp, qspi_fbclk_0_grp,
+                   spi0_0_grp, spi0_ss_0_grp, spi0_ss_1_grp,
+                   spi0_ss_2_grp, spi0_1_grp, spi0_ss_3_grp,
+                   spi0_ss_4_grp, spi0_ss_5_grp, spi0_2_grp,
+                   spi0_ss_6_grp, spi0_ss_7_grp, spi0_ss_8_grp,
+                   spi0_3_grp, spi0_ss_9_grp, spi0_ss_10_grp,
+                   spi0_ss_11_grp, spi0_4_grp, spi0_ss_12_grp,
+                   spi0_ss_13_grp, spi0_ss_14_grp, spi0_5_grp,
+                   spi0_ss_15_grp, spi0_ss_16_grp, spi0_ss_17_grp,
+                   spi1_0_grp, spi1_ss_0_grp, spi1_ss_1_grp,
+                   spi1_ss_2_grp, spi1_1_grp, spi1_ss_3_grp,
+                   spi1_ss_4_grp, spi1_ss_5_grp, spi1_2_grp,
+                   spi1_ss_6_grp, spi1_ss_7_grp, spi1_ss_8_grp,
+                   spi1_3_grp, spi1_ss_9_grp, spi1_ss_10_grp,
+                   spi1_ss_11_grp, spi1_4_grp, spi1_ss_12_grp,
+                   spi1_ss_13_grp, spi1_ss_14_grp, spi1_5_grp,
+                   spi1_ss_15_grp, spi1_ss_16_grp, spi1_ss_17_grp,
+                   sdio0_0_grp, sdio0_1_grp, sdio0_2_grp,
+                   sdio0_3_grp, sdio0_4_grp, sdio0_5_grp,
+                   sdio0_6_grp, sdio0_7_grp, sdio0_8_grp,
+                   sdio0_9_grp, sdio0_10_grp, sdio0_11_grp,
+                   sdio0_12_grp, sdio0_13_grp, sdio0_14_grp,
+                   sdio0_15_grp, sdio0_16_grp, sdio0_17_grp,
+                   sdio0_18_grp, sdio0_19_grp, sdio0_20_grp,
+                   sdio0_21_grp, sdio0_22_grp, sdio0_23_grp,
+                   sdio0_24_grp, sdio0_25_grp, sdio0_26_grp,
+                   sdio0_27_grp, sdio0_28_grp, sdio0_29_grp,
+                   sdio0_30_grp, sdio0_31_grp, sdio0_32_grp,
+                   sdio0_pc_0_grp, sdio0_cd_0_grp, sdio0_wp_0_grp,
+                   sdio0_pc_1_grp, sdio0_cd_1_grp, sdio0_wp_1_grp,
+                   sdio0_pc_2_grp, sdio0_cd_2_grp, sdio0_wp_2_grp,
+                   sdio1_0_grp, sdio1_1_grp, sdio1_2_grp,
+                   sdio1_3_grp, sdio1_4_grp, sdio1_5_grp,
+                   sdio1_6_grp, sdio1_7_grp, sdio1_8_grp,
+                   sdio1_9_grp, sdio1_10_grp, sdio1_11_grp,
+                   sdio1_12_grp, sdio1_13_grp, sdio1_14_grp,
+                   sdio1_15_grp, sdio1_pc_0_grp, sdio1_cd_0_grp,
+                   sdio1_wp_0_grp, sdio1_pc_1_grp, sdio1_cd_1_grp,
+                   sdio1_wp_1_grp, nand0_0_grp, nand0_ce_0_grp,
+                   nand0_rb_0_grp, nand0_dqs_0_grp, nand0_ce_1_grp,
+                   nand0_rb_1_grp, nand0_dqs_1_grp, can0_0_grp,
+                   can0_1_grp, can0_2_grp, can0_3_grp,
+                   can0_4_grp, can0_5_grp, can0_6_grp,
+                   can0_7_grp, can0_8_grp, can0_9_grp,
+                   can0_10_grp, can0_11_grp, can0_12_grp,
+                   can0_13_grp, can0_14_grp, can0_15_grp,
+                   can0_16_grp, can0_17_grp, can0_18_grp,
+                   can1_0_grp, can1_1_grp, can1_2_grp,
+                   can1_3_grp, can1_4_grp, can1_5_grp,
+                   can1_6_grp, can1_7_grp, can1_8_grp,
+                   can1_9_grp, can1_10_grp, can1_11_grp,
+                   can1_12_grp, can1_13_grp, can1_14_grp,
+                   can1_15_grp, can1_16_grp, can1_17_grp,
+                   can1_18_grp, can1_19_grp, uart0_0_grp,
+                   uart0_1_grp, uart0_2_grp, uart0_3_grp,
+                   uart0_4_grp, uart0_5_grp, uart0_6_grp,
+                   uart0_7_grp, uart0_8_grp, uart0_9_grp,
+                   uart0_10_grp, uart0_11_grp, uart0_12_grp,
+                   uart0_13_grp, uart0_14_grp, uart0_15_grp,
+                   uart0_16_grp, uart0_17_grp, uart0_18_grp,
+                   uart1_0_grp, uart1_1_grp, uart1_2_grp,
+                   uart1_3_grp, uart1_4_grp, uart1_5_grp,
+                   uart1_6_grp, uart1_7_grp, uart1_8_grp,
+                   uart1_9_grp, uart1_10_grp, uart1_11_grp,
+                   uart1_12_grp, uart1_13_grp, uart1_14_grp,
+                   uart1_15_grp, uart1_16_grp, uart1_17_grp,
+                   uart1_18_grp, i2c0_0_grp, i2c0_1_grp,
+                   i2c0_2_grp, i2c0_3_grp, i2c0_4_grp,
+                   i2c0_5_grp, i2c0_6_grp, i2c0_7_grp,
+                   i2c0_8_grp, i2c0_9_grp, i2c0_10_grp,
+                   i2c0_11_grp, i2c0_12_grp, i2c0_13_grp,
+                   i2c0_14_grp, i2c0_15_grp, i2c0_16_grp,
+                   i2c0_17_grp, i2c0_18_grp, i2c1_0_grp,
+                   i2c1_1_grp, i2c1_2_grp, i2c1_3_grp,
+                   i2c1_4_grp, i2c1_5_grp, i2c1_6_grp,
+                   i2c1_7_grp, i2c1_8_grp, i2c1_9_grp,
+                   i2c1_10_grp, i2c1_11_grp, i2c1_12_grp,
+                   i2c1_13_grp, i2c1_14_grp, i2c1_15_grp,
+                   i2c1_16_grp, i2c1_17_grp, i2c1_18_grp,
+                   i2c1_19_grp, ttc0_clk_0_grp, ttc0_wav_0_grp,
+                   ttc0_clk_1_grp, ttc0_wav_1_grp, ttc0_clk_2_grp,
+                   ttc0_wav_2_grp, ttc0_clk_3_grp, ttc0_wav_3_grp,
+                   ttc0_clk_4_grp, ttc0_wav_4_grp, ttc0_clk_5_grp,
+                   ttc0_wav_5_grp, ttc0_clk_6_grp, ttc0_wav_6_grp,
+                   ttc0_clk_7_grp, ttc0_wav_7_grp, ttc0_clk_8_grp,
+                   ttc0_wav_8_grp, ttc1_clk_0_grp, ttc1_wav_0_grp,
+                   ttc1_clk_1_grp, ttc1_wav_1_grp, ttc1_clk_2_grp,
+                   ttc1_wav_2_grp, ttc1_clk_3_grp, ttc1_wav_3_grp,
+                   ttc1_clk_4_grp, ttc1_wav_4_grp, ttc1_clk_5_grp,
+                   ttc1_wav_5_grp, ttc1_clk_6_grp, ttc1_wav_6_grp,
+                   ttc1_clk_7_grp, ttc1_wav_7_grp, ttc1_clk_8_grp,
+                   ttc1_wav_8_grp, ttc2_clk_0_grp, ttc2_wav_0_grp,
+                   ttc2_clk_1_grp, ttc2_wav_1_grp, ttc2_clk_2_grp,
+                   ttc2_wav_2_grp, ttc2_clk_3_grp, ttc2_wav_3_grp,
+                   ttc2_clk_4_grp, ttc2_wav_4_grp, ttc2_clk_5_grp,
+                   ttc2_wav_5_grp, ttc2_clk_6_grp, ttc2_wav_6_grp,
+                   ttc2_clk_7_grp, ttc2_wav_7_grp, ttc2_clk_8_grp,
+                   ttc2_wav_8_grp, ttc3_clk_0_grp, ttc3_wav_0_grp,
+                   ttc3_clk_1_grp, ttc3_wav_1_grp, ttc3_clk_2_grp,
+                   ttc3_wav_2_grp, ttc3_clk_3_grp, ttc3_wav_3_grp,
+                   ttc3_clk_4_grp, ttc3_wav_4_grp, ttc3_clk_5_grp,
+                   ttc3_wav_5_grp, ttc3_clk_6_grp, ttc3_wav_6_grp,
+                   ttc3_clk_7_grp, ttc3_wav_7_grp, ttc3_clk_8_grp,
+                   ttc3_wav_8_grp, swdt0_clk_0_grp, swdt0_rst_0_grp,
+                   swdt0_clk_1_grp, swdt0_rst_1_grp, swdt0_clk_2_grp,
+                   swdt0_rst_2_grp, swdt0_clk_3_grp, swdt0_rst_3_grp,
+                   swdt0_clk_4_grp, swdt0_rst_4_grp, swdt0_clk_5_grp,
+                   swdt0_rst_5_grp, swdt0_clk_6_grp, swdt0_rst_6_grp,
+                   swdt0_clk_7_grp, swdt0_rst_7_grp, swdt0_clk_8_grp,
+                   swdt0_rst_8_grp, swdt0_clk_9_grp, swdt0_rst_9_grp,
+                   swdt0_clk_10_grp, swdt0_rst_10_grp, swdt0_clk_11_grp,
+                   swdt0_rst_11_grp, swdt0_clk_12_grp, swdt0_rst_12_grp,
+                   swdt1_clk_0_grp, swdt1_rst_0_grp, swdt1_clk_1_grp,
+                   swdt1_rst_1_grp, swdt1_clk_2_grp, swdt1_rst_2_grp,
+                   swdt1_clk_3_grp, swdt1_rst_3_grp, swdt1_clk_4_grp,
+                   swdt1_rst_4_grp, swdt1_clk_5_grp, swdt1_rst_5_grp,
+                   swdt1_clk_6_grp, swdt1_rst_6_grp, swdt1_clk_7_grp,
+                   swdt1_rst_7_grp, swdt1_clk_8_grp, swdt1_rst_8_grp,
+                   swdt1_clk_9_grp, swdt1_rst_9_grp, swdt1_clk_10_grp,
+                   swdt1_rst_10_grp, swdt1_clk_11_grp, swdt1_rst_11_grp,
+                   swdt1_clk_12_grp, swdt1_rst_12_grp, gpio0_0_grp,
+                   gpio0_1_grp, gpio0_2_grp, gpio0_3_grp,
+                   gpio0_4_grp, gpio0_5_grp, gpio0_6_grp,
+                   gpio0_7_grp, gpio0_8_grp, gpio0_9_grp,
+                   gpio0_10_grp, gpio0_11_grp, gpio0_12_grp,
+                   gpio0_13_grp, gpio0_14_grp, gpio0_15_grp,
+                   gpio0_16_grp, gpio0_17_grp, gpio0_18_grp,
+                   gpio0_19_grp, gpio0_20_grp, gpio0_21_grp,
+                   gpio0_22_grp, gpio0_23_grp, gpio0_24_grp,
+                   gpio0_25_grp, gpio0_26_grp, gpio0_27_grp,
+                   gpio0_28_grp, gpio0_29_grp, gpio0_30_grp,
+                   gpio0_31_grp, gpio0_32_grp, gpio0_33_grp,
+                   gpio0_34_grp, gpio0_35_grp, gpio0_36_grp,
+                   gpio0_37_grp, gpio0_38_grp, gpio0_39_grp,
+                   gpio0_40_grp, gpio0_41_grp, gpio0_42_grp,
+                   gpio0_43_grp, gpio0_44_grp, gpio0_45_grp,
+                   gpio0_46_grp, gpio0_47_grp, gpio0_48_grp,
+                   gpio0_49_grp, gpio0_50_grp, gpio0_51_grp,
+                   gpio0_52_grp, gpio0_53_grp, gpio0_54_grp,
+                   gpio0_55_grp, gpio0_56_grp, gpio0_57_grp,
+                   gpio0_58_grp, gpio0_59_grp, gpio0_60_grp,
+                   gpio0_61_grp, gpio0_62_grp, gpio0_63_grp,
+                   gpio0_64_grp, gpio0_65_grp, gpio0_66_grp,
+                   gpio0_67_grp, gpio0_68_grp, gpio0_69_grp,
+                   gpio0_70_grp, gpio0_71_grp, gpio0_72_grp,
+                   gpio0_73_grp, gpio0_74_grp, gpio0_75_grp,
+                   gpio0_76_grp, gpio0_77_grp, usb0_0_grp,
+                   usb1_0_grp, pmu0_0_grp, pmu0_1_grp,
+                   pmu0_2_grp, pmu0_3_grp, pmu0_4_grp,
+                   pmu0_5_grp, pmu0_6_grp, pmu0_7_grp,
+                   pmu0_8_grp, pmu0_9_grp, pmu0_10_grp,
+                   pmu0_11_grp, pcie0_0_grp, pcie0_1_grp,
+                   pcie0_2_grp, pcie0_3_grp, pcie0_4_grp,
+                   pcie0_5_grp, pcie0_6_grp, pcie0_7_grp,
+                   csu0_0_grp, csu0_1_grp, csu0_2_grp,
+                   csu0_3_grp, csu0_4_grp, csu0_5_grp,
+                   csu0_6_grp, csu0_7_grp, csu0_8_grp,
+                   csu0_9_grp, csu0_10_grp, csu0_11_grp,
+                   dpaux0_0_grp, dpaux0_1_grp, dpaux0_2_grp,
+                   dpaux0_3_grp, pjtag0_0_grp, pjtag0_1_grp,
+                   pjtag0_2_grp, pjtag0_3_grp, pjtag0_4_grp,
+                   pjtag0_5_grp, trace0_0_grp, trace0_clk_0_grp,
+                   trace0_1_grp, trace0_clk_1_grp, trace0_2_grp,
+                   trace0_clk_2_grp, testscan0_0_grp]
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
+      '^(.*-)?conf$':
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
+            enum: [MIO0, MIO1, .., MIO18, MIO19,.., MIO77]
+
+          bias-pull-up: true
+
+          bias-pull-down: true
+
+          bias-disable: true
+
+          slew-rate:
+            description:
+              Selects the slew rate for the specified pins.
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
+            enum: [0, 1]
+
+          schmitt-cmos:
+              description:
+                Selects the schmitt or cmos input for MIO pins, this is driver specific.
+              enum: [0, 1]
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
+                 groups = "uart0_4_grp";
+                 function = "uart0";
+             };
+
+             conf {
+                groups = "uart0_4_grp";
+                slew-rate = <SLEW_RATE_SLOW>;
+                io-standard = <IO_STANDARD_LVCMOS18>;
+             };
+
+             rx-conf {
+                pins = "MIO18";
+                bias-pull-up;
+             };
+
+             tx-conf {
+                pins = "MIO19";
+                bias-disable;
+                schmitt-cmos = <PIN_INPUT_TYPE_CMOS>;
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
index 000000000000..509190aa45f7
--- /dev/null
+++ b/include/dt-bindings/pinctrl/pinctrl-zynqmp.h
@@ -0,0 +1,29 @@
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
+/* Bit values for drive control*/
+#define DRIVE_STRENGTH_2MA	2
+#define DRIVE_STRENGTH_4MA	4
+#define DRIVE_STRENGTH_8MA	8
+#define DRIVE_STRENGTH_12MA	12
+
+#endif /* _DT_BINDINGS_PINCTRL_ZYNQMP_H */
-- 
2.17.1

