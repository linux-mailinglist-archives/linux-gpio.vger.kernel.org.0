Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC4733D0E67
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jul 2021 14:02:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238513AbhGULVX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 21 Jul 2021 07:21:23 -0400
Received: from mail-co1nam11on2054.outbound.protection.outlook.com ([40.107.220.54]:14665
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S238592AbhGULOL (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 21 Jul 2021 07:14:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g9Hli6iOdCNvhMe+HfLrEWX7Oy15XwLrzCruCWLpDlh4DqjwDCLI8xYfxdewaijXxrb6WAO2dE1J2ESMgRxYAlYgtjoUWR8c8EmIVIMsrmVj5dXjt0ypoemM+6vsKHJD1owjl2XQtWgSumgaRLMQsdYmj2onOGMWMXyVUABKu67kNpXTOGRcZac+/pLF1C3a4zWdrInwunzChqWyYC4SOBl9SZskGHB4laxcuXvxNjKOxJqgCUDkxG02iE0Z1krvQ2Cuprw6Z1j3Vcigr+fImn3mEt/qos/jSEIS1IBMAoJnl/USGTc3fChJ2u+qctb53/wIdX3k1+6pYAdnud32PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+hotZynpJxorOnJot3OxUKgpm8VPNYEdnigjaza1TwI=;
 b=YZrybYgBqdZv1g/wkOltW7U3qYJ3zGxMp5OBu5sT8OeVeiWETPw07S3WsiWao3EcKkzGqtIow15JVRSNr7Cc9j79Plro1qLmTzVA++SygxyDxPkSh9yxryw6CQUAYHFwxVgo0P+m0/zDKqPKuy6f/zqDeNMdzB1S1wq/jFrhKBRrBABYmJoXsGo0wSCN/ziihdaiAcv08fWHxdUS601hoOxcTkl0CVgkShHf4Pv5BgVc00/f73TidNwpsOCUsEBtfvJuEHZERA9uF3yBvIHVM9KUqlqhPcViWTHHhSQyxgfwQc/GgnZu/3RpDZsPM+NKncQcRWH09orXOrRt/EFBFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=gmail.com smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+hotZynpJxorOnJot3OxUKgpm8VPNYEdnigjaza1TwI=;
 b=FQAdMzR7u0gO2ruRM/vGYAWgvTmR/JycShlj8o87pS7NVZHk6J+MhKF+beBqW28sjIRas/lRpX1pDvfnFvH/xYymTgPMZEViruWUDbeMHB+6WagZAJ19SV5QjzxUoPYuOFyXKExSwkmUxxQ+o7d6jROzghxlxVKpiluFUzaAMzs=
Received: from BN8PR12CA0022.namprd12.prod.outlook.com (2603:10b6:408:60::35)
 by BN7PR02MB5314.namprd02.prod.outlook.com (2603:10b6:408:2d::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.22; Wed, 21 Jul
 2021 11:54:46 +0000
Received: from BN1NAM02FT003.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:60:cafe::79) by BN8PR12CA0022.outlook.office365.com
 (2603:10b6:408:60::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.22 via Frontend
 Transport; Wed, 21 Jul 2021 11:54:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT003.mail.protection.outlook.com (10.13.2.122) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4352.24 via Frontend Transport; Wed, 21 Jul 2021 11:54:46 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 21 Jul 2021 04:54:39 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Wed, 21 Jul 2021 04:54:39 -0700
Envelope-to: git@xilinx.com,
 saikrishna12468@gmail.com,
 robh+dt@kernel.org,
 linus.walleij@linaro.org,
 gregkh@linuxfoundation.org,
 linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
Received: from [172.23.64.106] (port=50893 helo=xhdvnc125.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <lakshmi.sai.krishna.potthuri@xilinx.com>)
        id 1m6Ao9-0000yo-HJ; Wed, 21 Jul 2021 04:54:38 -0700
Received: by xhdvnc125.xilinx.com (Postfix, from userid 14964)
        id A9F3712102E; Wed, 21 Jul 2021 17:24:23 +0530 (IST)
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
Subject: [PATCH 1/4] dt-bindings: pinctrl: pinctrl-zynq: Convert to yaml
Date:   Wed, 21 Jul 2021 17:22:30 +0530
Message-ID: <1626868353-96475-2-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1626868353-96475-1-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
References: <1626868353-96475-1-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d9615950-9562-46d8-c122-08d94c3e55eb
X-MS-TrafficTypeDiagnostic: BN7PR02MB5314:
X-Microsoft-Antispam-PRVS: <BN7PR02MB53143E62A604E0A3E6C3E442BDE39@BN7PR02MB5314.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FmSAsHJpgjntBthN29xfLYku3/aBEzLm7BeP3izIZk51zcv8z8Flj680r4WacVJxlGN5BYR4jWxPdQID+2MMJAjwAODGLvcmz2dKWSgXJefwZFxjiJQN2kdn4KSGaazYlIvk7gNQjqFRoYHyCX5xJD15+MRzGJ40c0h9r1F6SgYbMmDuQsJ0oGMoqNHZgRxAwj2v6um5Q4FJIOJcKSCVduuvwkahQshu7aayp+1KGPlkRgO+GQcV7+2Q7dh55HfvwAnnRhutJ6uU3TvA+TU9k3aCq3Vt+k6luGY6+nuINLMGHI64beALhSFpmkTXZ5P2aYGv3H2Y3ymznLlDAdQ6uINj63CAO57AiH0deC1rYffghRaFQsRcAX9q7L3T12avDSY5gArLnIPzhNpbs3jmyeR46/95eSFsI1RPGVcRANaT/Qzlm8CJqNUYXuq9yzqysKo1e2rdQU17LTziHJ8XwEV4Cc14YferEhfWm4xJ3qCHtW8IYqJLkB3u8aeRsArzODLkmOwDwlGgRBBru7Baxo18TW0HTfLxb+jSfJT2/xLQfezjyKELyTFHXQ35euW/NMaJRETfJLJ3Y30c+MzwTxVONUYIqL6/4FSrrFoth4Nx680MxNQlEr2QhNu/YbGNi91k5nthVYV1onct01i4fgHU5RnUrz89YwVwe1PZ1nXvV8JkD3w/6iZpj6UVhMiWEgZvU5NXhSzVvHAmhbJbFgSuyS9yNuhEmyNI5SqMv0ev2rBJO1FPImxm5vM+8g0q7Z/cVerQnkhB31J7lw/7NJOsDUn3t3IQ33sZS8KxneBJujxmpsiAMmymGaCexH9Uua8LjeajGHpFCWGcuNzzSKYQZXpyCLTXNUka3TuIrjM=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(376002)(136003)(346002)(396003)(39860400002)(46966006)(36840700001)(2906002)(6266002)(7636003)(478600001)(30864003)(36906005)(316002)(42186006)(110136005)(2616005)(47076005)(36860700001)(70206006)(70586007)(26005)(356005)(186003)(54906003)(82740400003)(8936002)(8676002)(6666004)(36756003)(4326008)(83380400001)(966005)(336012)(426003)(82310400003)(5660300002)(107886003)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2021 11:54:46.1513
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d9615950-9562-46d8-c122-08d94c3e55eb
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT003.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR02MB5314
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Convert the Zynq pinctrl binding file to yaml.

Signed-off-by: Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>
---
 .../bindings/pinctrl/xlnx,zynq-pinctrl.txt    | 105 ---------
 .../bindings/pinctrl/xlnx,zynq-pinctrl.yaml   | 216 ++++++++++++++++++
 2 files changed, 216 insertions(+), 105 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/xlnx,zynq-pinctrl.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/xlnx,zynq-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/xlnx,zynq-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/xlnx,zynq-pinctrl.txt
deleted file mode 100644
index f488b0f77406..000000000000
--- a/Documentation/devicetree/bindings/pinctrl/xlnx,zynq-pinctrl.txt
+++ /dev/null
@@ -1,105 +0,0 @@
-	Binding for Xilinx Zynq Pinctrl
-
-Required properties:
-- compatible: "xlnx,zynq-pinctrl"
-- syscon: phandle to SLCR
-- reg: Offset and length of pinctrl space in SLCR
-
-Please refer to pinctrl-bindings.txt in this directory for details of the
-common pinctrl bindings used by client devices, including the meaning of the
-phrase "pin configuration node".
-
-Zynq's pin configuration nodes act as a container for an arbitrary number of
-subnodes. Each of these subnodes represents some desired configuration for a
-pin, a group, or a list of pins or groups. This configuration can include the
-mux function to select on those pin(s)/group(s), and various pin configuration
-parameters, such as pull-up, slew rate, etc.
-
-Each configuration node can consist of multiple nodes describing the pinmux and
-pinconf options. Those nodes can be pinmux nodes or pinconf nodes.
-
-The name of each subnode is not important; all subnodes should be enumerated
-and processed purely based on their content.
-
-Required properties for pinmux nodes are:
- - groups: A list of pinmux groups.
- - function: The name of a pinmux function to activate for the specified set
-   of groups.
-
-Required properties for configuration nodes:
-One of:
- - pins: a list of pin names
- - groups: A list of pinmux groups.
-
-The following generic properties as defined in pinctrl-bindings.txt are valid
-to specify in a pinmux subnode:
- groups, function
-
-The following generic properties as defined in pinctrl-bindings.txt are valid
-to specify in a pinconf subnode:
- groups, pins, bias-disable, bias-high-impedance, bias-pull-up, slew-rate,
- low-power-disable, low-power-enable
-
- Valid arguments for 'slew-rate' are '0' and '1' to select between slow and fast
- respectively.
-
- Valid values for groups are:
-   ethernet0_0_grp, ethernet1_0_grp, mdio0_0_grp, mdio1_0_grp,
-   qspi0_0_grp, qspi1_0_grp, qspi_fbclk, qspi_cs1_grp, spi0_0_grp - spi0_2_grp,
-   spi0_X_ssY (X=0..2, Y=0..2), spi1_0_grp - spi1_3_grp,
-   spi1_X_ssY (X=0..3, Y=0..2), sdio0_0_grp - sdio0_2_grp,
-   sdio1_0_grp - sdio1_3_grp, sdio0_emio_wp, sdio0_emio_cd, sdio1_emio_wp,
-   sdio1_emio_cd, smc0_nor, smc0_nor_cs1_grp, smc0_nor_addr25_grp, smc0_nand,
-   can0_0_grp - can0_10_grp, can1_0_grp - can1_11_grp, uart0_0_grp - uart0_10_grp,
-   uart1_0_grp - uart1_11_grp, i2c0_0_grp - i2c0_10_grp, i2c1_0_grp - i2c1_10_grp,
-   ttc0_0_grp - ttc0_2_grp, ttc1_0_grp - ttc1_2_grp, swdt0_0_grp - swdt0_4_grp,
-   gpio0_0_grp - gpio0_53_grp, usb0_0_grp, usb1_0_grp
-
- Valid values for pins are:
-   MIO0 - MIO53
-
- Valid values for function are:
-   ethernet0, ethernet1, mdio0, mdio1, qspi0, qspi1, qspi_fbclk, qspi_cs1,
-   spi0, spi0_ss, spi1, spi1_ss, sdio0, sdio0_pc, sdio0_cd, sdio0_wp,
-   sdio1, sdio1_pc, sdio1_cd, sdio1_wp,
-   smc0_nor, smc0_nor_cs1, smc0_nor_addr25, smc0_nand, can0, can1, uart0, uart1,
-   i2c0, i2c1, ttc0, ttc1, swdt0, gpio0, usb0, usb1
-
-The following driver-specific properties as defined here are valid to specify in
-a pin configuration subnode:
- - io-standard: Configure the pin to use the selected IO standard according to
-   this mapping:
-    1: LVCMOS18
-    2: LVCMOS25
-    3: LVCMOS33
-    4: HSTL
-
-Example:
-	pinctrl0: pinctrl@700 {
-		compatible = "xlnx,pinctrl-zynq";
-		reg = <0x700 0x200>;
-		syscon = <&slcr>;
-
-		pinctrl_uart1_default: uart1-default {
-			mux {
-				groups = "uart1_10_grp";
-				function = "uart1";
-			};
-
-			conf {
-				groups = "uart1_10_grp";
-				slew-rate = <0>;
-				io-standard = <1>;
-			};
-
-			conf-rx {
-				pins = "MIO49";
-				bias-high-impedance;
-			};
-
-			conf-tx {
-				pins = "MIO48";
-				bias-disable;
-			};
-		};
-	};
diff --git a/Documentation/devicetree/bindings/pinctrl/xlnx,zynq-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/xlnx,zynq-pinctrl.yaml
new file mode 100644
index 000000000000..2da1969e02ec
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/xlnx,zynq-pinctrl.yaml
@@ -0,0 +1,216 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/xlnx,zynq-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Xilinx Zynq Pinctrl
+
+maintainers:
+  - Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>
+
+description: |
+  Please refer to pinctrl-bindings.txt in this directory for details of the
+  common pinctrl bindings used by client devices, including the meaning of the
+  phrase "pin configuration node".
+
+  Zynq's pin configuration nodes act as a container for an arbitrary number of
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
+    const: xlnx,zynq-pinctrl
+
+  reg:
+    description: Specifies the base address and size of the SLCR space.
+    maxItems: 1
+
+  syscon:
+    description:
+      phandle to the SLCR.
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
+              enum: [ethernet0_0_grp, ethernet1_0_grp, mdio0_0_grp,
+                     mdio1_0_grp, qspi0_0_grp, qspi1_0_grp, qspi_fbclk,
+                     qspi_cs1_grp, spi0_0_grp, spi0_1_grp, spi0_2_grp,
+                     spi0_0_ss0, spi0_0_ss1, spi0_0_ss2, spi0_1_ss0,
+                     spi0_1_ss1, spi0_1_ss2, spi0_2_ss0, spi0_2_ss1,
+                     spi0_2_ss2, spi1_0_grp, spi1_1_grp, spi1_2_grp,
+                     spi1_3_grp, spi1_0_ss0, spi1_0_ss1, spi1_0_ss2,
+                     spi1_1_ss0, spi1_1_ss1, spi1_1_ss2, spi1_2_ss0,
+                     spi1_2_ss1, spi1_2_ss2, spi1_3_ss0, spi1_3_ss1,
+                     spi1_3_ss2, sdio0_0_grp, sdio0_1_grp, sdio0_2_grp,
+                     sdio1_0_grp, sdio1_1_grp, sdio1_2_grp, sdio1_3_grp,
+                     sdio0_emio_wp, sdio0_emio_cd, sdio1_emio_wp,
+                     sdio1_emio_cd, smc0_nor, smc0_nor_cs1_grp,
+                     smc0_nor_addr25_grp, smc0_nand, can0_0_grp, can0_1_grp,
+                     can0_2_grp, can0_3_grp, can0_4_grp, can0_5_grp,
+                     can0_6_grp, can0_7_grp, can0_8_grp, can0_9_grp,
+                     can0_10_grp, can1_0_grp, can1_1_grp, can1_2_grp,
+                     can1_3_grp, can1_4_grp, can1_5_grp, can1_6_grp,
+                     can1_7_grp, can1_8_grp, can1_9_grp, can1_10_grp,
+                     can1_11_grp, uart0_0_grp, uart0_1_grp, uart0_2_grp,
+                     uart0_3_grp, uart0_4_grp, uart0_5_grp, uart0_6_grp,
+                     uart0_7_grp, uart0_8_grp, uart0_9_grp, uart0_10_grp,
+                     uart1_0_grp, uart1_1_grp, uart1_2_grp, uart1_3_grp,
+                     uart1_4_grp, uart1_5_grp, uart1_6_grp, uart1_7_grp,
+                     uart1_8_grp, uart1_9_grp, uart1_10_grp, uart1_11_grp,
+                     i2c0_0_grp, i2c0_1_grp, i2c0_2_grp, i2c0_3_grp,
+                     i2c0_4_grp, i2c0_5_grp, i2c0_6_grp, i2c0_7_grp,
+                     i2c0_8_grp, i2c0_9_grp, i2c0_10_grp, i2c1_0_grp,
+                     i2c1_1_grp, i2c1_2_grp, i2c1_3_grp, i2c1_4_grp,
+                     i2c1_5_grp, i2c1_6_grp, i2c1_7_grp, i2c1_8_grp,
+                     i2c1_9_grp, i2c1_10_grp, ttc0_0_grp, ttc0_1_grp,
+                     ttc0_2_grp, ttc1_0_grp, ttc1_1_grp, ttc1_2_grp,
+                     swdt0_0_grp, swdt0_1_grp, swdt0_2_grp, swdt0_3_grp,
+                     swdt0_4_grp, gpio0_0_grp, gpio0_1_grp, gpio0_2_grp,
+                     gpio0_3_grp, gpio0_4_grp, gpio0_5_grp, gpio0_6_grp,
+                     gpio0_7_grp, gpio0_8_grp, gpio0_9_grp, gpio0_10_grp,
+                     gpio0_11_grp, gpio0_12_grp, gpio0_13_grp, gpio0_14_grp,
+                     gpio0_15_grp, gpio0_16_grp, gpio0_17_grp, gpio0_18_grp,
+                     gpio0_19_grp, gpio0_20_grp, gpio0_21_grp, gpio0_22_grp,
+                     gpio0_23_grp, gpio0_24_grp, gpio0_25_grp, gpio0_26_grp,
+                     gpio0_27_grp, gpio0_28_grp, gpio0_29_grp, gpio0_30_grp,
+                     gpio0_31_grp, gpio0_32_grp, gpio0_33_grp, gpio0_34_grp,
+                     gpio0_35_grp, gpio0_36_grp, gpio0_37_grp, gpio0_38_grp,
+                     gpio0_39_grp, gpio0_40_grp, gpio0_41_grp, gpio0_42_grp,
+                     gpio0_43_grp, gpio0_44_grp, gpio0_45_grp, gpio0_46_grp,
+                     gpio0_47_grp, gpio0_48_grp, gpio0_49_grp, gpio0_50_grp,
+                     gpio0_51_grp, gpio0_52_grp, gpio0_53_grp, usb0_0_grp,
+                     usb1_0_grp]
+            maxItems: 54
+
+          function:
+            description:
+              Specify the alternative function to be configured for the
+              given pin groups.
+            enum: [ethernet0, ethernet1, mdio0, mdio1, qspi0, qspi1, qspi_fbclk,
+                   qspi_cs1, spi0, spi0_ss, spi1, spi1_ss, sdio0, sdio0_pc,
+                   sdio0_cd, sdio0_wp, sdio1, sdio1_pc, sdio1_cd, sdio1_wp,
+                   smc0_nor, smc0_nor_cs1, smc0_nor_addr25, smc0_nand, can0,
+                   can1, uart0, uart1, i2c0, i2c1, ttc0, ttc1, swdt0, gpio0,
+                   usb0, usb1]
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
+              pattern: '^MIO([0-9]|[1-4][0-9]|5[0-3])$'
+            maxItems: 54
+
+          bias-pull-up: true
+
+          bias-pull-down: true
+
+          bias-disable: true
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
+          io-standard:
+            description:
+              Selects the IO standard for MIO pins, this is driver specific.
+            $ref: "/schemas/types.yaml#/definitions/uint32"
+            enum: [1, 2, 3, 4]
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
+  - reg
+  - syscon
+
+additionalProperties: false
+
+examples:
+  - |
+    pinctrl0: pinctrl@700 {
+       compatible = "xlnx,zynq-pinctrl";
+       reg = <0x700 0x200>;
+       syscon = <&slcr>;
+
+       pinctrl_uart1_default: uart1-default {
+           mux {
+               groups = "uart1_10_grp";
+               function = "uart1";
+           };
+
+           conf {
+               groups = "uart1_10_grp";
+               slew-rate = <0>;
+               io-standard = <1>;
+           };
+
+           conf-rx {
+               pins = "MIO49";
+               bias-high-impedance;
+           };
+
+           conf-tx {
+               pins = "MIO48";
+               bias-disable;
+           };
+       };
+    };
+
+    uart1 {
+         pinctrl-names = "default";
+         pinctrl-0 = <&pinctrl_uart1_default>;
+    };
+
+...
-- 
2.17.1

