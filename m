Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8AC641E4CB
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Oct 2021 01:26:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350247AbhI3X2c (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 Sep 2021 19:28:32 -0400
Received: from mail-bn8nam12on2088.outbound.protection.outlook.com ([40.107.237.88]:51232
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1350111AbhI3X2X (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 30 Sep 2021 19:28:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fRgAJzomb9Ttg7twxJSzC/KZDb86ML4L/4M1MyNVFsib5l1BC1qdbxmJlPP43SLfWLKVPIjad5k8qHmvkaWx3ysv6x5gxh45DNQukOrx9nkhMfEBJC47/pfAokryD3nGBSIzOHVobC70m0s4LaAO5FVvFDVvEvVhB2+lTeRQhX7dw9dQvAqLOi5Lmo70kVY6qYkLIbjtw88Hz2OY1ym5lIU3cOrM9/5zDHfxxYrjW86b0fQVo7goxjQkljnKav7XmLYZnhdL/LM0DjgvF4GmjWfy/W9hrF9rETpgi5X3gGE2QNdYz61HUzB9xYKljtpHiIMDn+T8jqktmQPcs5mj1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VDtlkRnoWkzwcuagPb7OqfTqEqYL6Ii1kESGkErISX0=;
 b=Q2lVzYfYXzlM5ph2MMLyKzXguPe2O0f4xPaV2DBxC6caJRCAPAqevsEagDP2jeh7H9lKc9cr14oWl02asmlo3tXpJeeeFo3xdkRWQeoN0XXt+Er6zTIqJLi4QmnFsB1b6WEjiGT4h3AQ72APs84/+Sn2yGW5awnUtibazH6Ses8sL2rnJk6KyGiTFb4sarnzpfpswylluX4QDlGfcrpzA4jPeA3blpH9NOUwHVJaiw03lCfSBbxMUSNTaKbxd1lehnvrmDjNwjpI7MLM1sbuyF/JO5G/HEv4gvylM6JN74rBIp9KGVPYWeaPQ8aT6c146kFKHS5EyYn4/8DLIOnclA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VDtlkRnoWkzwcuagPb7OqfTqEqYL6Ii1kESGkErISX0=;
 b=NzIcBxF7l5VG76gRUkCl8lryafi87/Lw5kXgMB96tAknKOVA+Odn3rvS4JKvMAzmic0VDPUDxwerLrj/s165gumxetpF2g8U0rMUg9v2JKAuYPb81hOpsQMRMde89mKXPLTVrUnrQ53XtDc+HeYrewyXtBW/HfT2k23L3Z3ZSk8bmgLJ/WduQfBs+pO6CVFi3cSjDn164qIOmIXL6lTKjl2VKAfGweHk+WV9WyazVQcrLYoTXOZwCEqiWJNzo8ZCz5VxawdJJXRrHtcVG1dGzbRuSmAmBqLuMjgORC1B+NgMx5/ZWcU+Z4/2tHW7h9IMvM7rXTS/oVNSPaAVCPOVGw==
Received: from BN9PR03CA0630.namprd03.prod.outlook.com (2603:10b6:408:106::35)
 by SA0PR12MB4445.namprd12.prod.outlook.com (2603:10b6:806:95::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14; Thu, 30 Sep
 2021 23:26:37 +0000
Received: from BN8NAM11FT009.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:106:cafe::8d) by BN9PR03CA0630.outlook.office365.com
 (2603:10b6:408:106::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Thu, 30 Sep 2021 23:26:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT009.mail.protection.outlook.com (10.13.176.65) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4566.14 via Frontend Transport; Thu, 30 Sep 2021 23:26:37 +0000
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 30 Sep
 2021 23:26:36 +0000
Received: from dipenp.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Thu, 30 Sep 2021 23:26:36 +0000
From:   Dipen Patel <dipenp@nvidia.com>
To:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linus.walleij@linaro.org>,
        <bgolaszewski@baylibre.com>, <warthog618@gmail.com>,
        <devicetree@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <robh+dt@kernel.org>
CC:     Dipen Patel <dipenp@nvidia.com>
Subject: [RFC v2 04/11] dt-bindings: Add HTE bindings
Date:   Thu, 30 Sep 2021 16:26:10 -0700
Message-ID: <20210930232617.6396-5-dipenp@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210930232617.6396-1-dipenp@nvidia.com>
References: <20210930232617.6396-1-dipenp@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e46deb14-e15c-4c1a-66f6-08d98469bfdf
X-MS-TrafficTypeDiagnostic: SA0PR12MB4445:
X-Microsoft-Antispam-PRVS: <SA0PR12MB4445E962AFEEAA8130F773A8AEAA9@SA0PR12MB4445.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aqS3SDsaax7DYXDYZLBjwXLzPDLzaTNJfuzq5RLY8dfiaoBlWAuf2AZV0ToxgpBEqWuTEP4Vv8Lso5Nn889PlcDH1MeqxZjSmp3uZ47baqfJgHM5nJIwCeVpVkXsrjselKfAsFuWoG9z3pDt/Pzz5EUwiQj6gynrA0Eim0xjyFgCV12xqTieqkjFK7/xhXzXl0UxUzYa96cqpN84vqfMKIWcn1jr0OlJv6tKyg0Cb6lSrLJLxs/EJW+ou7TJ37L6hlQKhaRtXRh8sXsrBAe11l67+bGCpjJUC+OGF7yH/L1AJr4TJePnknmjFHsPg5JM1hg7m7WrNPvMJIg24agKLUrJHv/AimS8t/klHiezuZO3J5iWUEvaq8GKmHIKPO1IF8BesGGyaI6bUxRan46Lj0Y0I8gVjC1wli18gqeqM0o//ebxKyLbJCDuWGwFiP/jqlbMpzQD+jl5SbUnZhGKiL2shx+676/SKMkI1GdVhEYrlGYeJryCcfMn4naqUgvdWOAa+fr03WNoaj+ZWe0l/yY4za04bsX2+qA/pQVD7qw1B6DZJF50eMjZs/QIikQymjiJmZc4/Q58hKTH+u7+gWD4APMN0UNn0Tcivr8lKYhiJ7cYlJVlLdPumq3OuQU0TfjtgiQGJ+W0iucqpCEGF3qSviZn2T9CjfcdlpT3fgsFWPC4tW1w1qePS+7AA5pRgG7EKciU5wnRQAyHkWEraKjHjZBH/DY7S+09i9Oa5Qn5p3scPMPP77hcwQL1CL7Fn4N8Aw/VLgAfz8IoaRBtx+8BuQiHw4VKsqM2lPfFX8x8hu2l9GLGXqWIFkENeiBFPQBDhKNAK4ShP1nVj+jWoFbFr5o9iL260xWvRwKtaQRntvuhkd2vcLev1QzxBNn3zvFQvDKGc17P53LfWDyjXA==
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(426003)(7416002)(508600001)(4326008)(8936002)(47076005)(2616005)(921005)(83380400001)(82310400003)(356005)(110136005)(36860700001)(966005)(7696005)(70206006)(70586007)(86362001)(36756003)(186003)(5660300002)(107886003)(316002)(26005)(336012)(6666004)(2906002)(1076003)(7636003)(8676002)(2101003)(83996005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2021 23:26:37.3508
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e46deb14-e15c-4c1a-66f6-08d98469bfdf
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT009.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4445
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Introduces HTE devicetree binding details for the HTE subsystem. It
includes examples for the consumers, binding details for the providers
and specific binding details for the Tegra194 based HTE providers.

Signed-off-by: Dipen Patel <dipenp@nvidia.com>
---
Changes in v2:
- Replace hte with hardware-timestamp for property names
- Renamed file
- Removed example from the common dt binding file.

 .../hte/hardware-timestamps-common.yaml       | 29 +++++++
 .../devicetree/bindings/hte/hte-consumer.yaml | 48 +++++++++++
 .../bindings/hte/nvidia,tegra194-hte.yaml     | 79 +++++++++++++++++++
 3 files changed, 156 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hte/hardware-timestamps-common.yaml
 create mode 100644 Documentation/devicetree/bindings/hte/hte-consumer.yaml
 create mode 100644 Documentation/devicetree/bindings/hte/nvidia,tegra194-hte.yaml

diff --git a/Documentation/devicetree/bindings/hte/hardware-timestamps-common.yaml b/Documentation/devicetree/bindings/hte/hardware-timestamps-common.yaml
new file mode 100644
index 000000000000..8b8db3bc4dcf
--- /dev/null
+++ b/Documentation/devicetree/bindings/hte/hardware-timestamps-common.yaml
@@ -0,0 +1,29 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hte/hardware-timestamps-common.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Hardware timestamp providers
+
+maintainers:
+  - Dipen Patel <dipenp@nvidia.com>
+
+description: |
+  Some devices/SoCs have hardware time stamping engines which can use hardware
+  means to timestamp entity in realtime. The entity could be anything from
+  GPIOs, IRQs, Bus and so on. The hardware timestamp engine (HTE) present
+  itself as a provider with the bindings described in this document.
+
+properties:
+  $nodename:
+    pattern: "^hardware-timestamps(@.*|-[0-9a-f])*$"
+
+  "#hardware-timestamps-cells":
+    description:
+      Number of cells in a HTE specifier.
+
+required:
+  - "#hardware-timestamps-cells"
+
+additionalProperties: true
diff --git a/Documentation/devicetree/bindings/hte/hte-consumer.yaml b/Documentation/devicetree/bindings/hte/hte-consumer.yaml
new file mode 100644
index 000000000000..cf65d1d44a18
--- /dev/null
+++ b/Documentation/devicetree/bindings/hte/hte-consumer.yaml
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hte/hte-consumer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: HTE Consumer Device Tree Bindings
+
+maintainers:
+  - Dipen Patel <dipenp@nvidia.com>
+
+description: |
+  HTE properties should be named "hardware-timestamps". The exact meaning of
+  each hardware-timestamps property must be documented in the device tree
+  binding for each device. An optional property "hardware-timestamps-names" may
+  contain a list of strings to label each of the HTE devices listed in the
+  "hardware-timestamps" property.
+
+  The "hardware-timestamps-names" property if specified is used to map the name
+  of the HTE device requested by the devm_of_hte_request_ts() or of_hte_request_ts
+  call to an index into the list given by the "hardware-timestamps" property.
+
+properties:
+  hardware-timestamps:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description:
+      The list of HTE provider phandle. The provider must document the number
+      of cell that must be passed in this property along with phandle.
+
+  hardware-timestamps-names:
+    $ref: /schemas/types.yaml#/definitions/string-array
+    description:
+      An optional string property.
+
+required:
+  - "hardware-timestamps"
+
+dependencies:
+  hardware-timestamps-names: [ hardware-timestamps ]
+
+additionalProperties: true
+
+examples:
+  - |
+    hte_irq_consumer {
+              hardware-timestamps = <&tegra_hte_lic 0x19>;
+              hardware-timestamps-names = "hte-irq";
+    };
diff --git a/Documentation/devicetree/bindings/hte/nvidia,tegra194-hte.yaml b/Documentation/devicetree/bindings/hte/nvidia,tegra194-hte.yaml
new file mode 100644
index 000000000000..529926118f35
--- /dev/null
+++ b/Documentation/devicetree/bindings/hte/nvidia,tegra194-hte.yaml
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hte/nvidia,tegra194-hte.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Tegra194 on chip generic hardware timestamping engine (HTE)
+
+maintainers:
+  - Dipen Patel <dipenp@nvidia.com>
+
+description: |
+  Tegra194 SoC has multiple generic hardware timestamping engines which can
+  monitor subset of GPIO and on chip IRQ lines for the state change, upon
+  detection it will record timestamp (taken from system counter) in its
+  internal hardware FIFO. It has bitmap array arranged in 32bit slices where
+  each bit represent signal/line to enable or disable for the hardware
+  timestamping.
+
+properties:
+  compatible:
+    enum:
+      - nvidia,tegra194-gte-aon
+      - nvidia,tegra194-gte-lic
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  int-threshold:
+    description:
+      HTE device generates its interrupt based on this u32 FIFO threshold
+      value. The recommended value is 1.
+    minimum: 1
+    maximum: 256
+
+  slices:
+    description:
+      HTE lines are arranged in 32 bit slice where each bit represents different
+      line/signal that it can enable/configure for the timestamp. It is u32
+      property and depends on the HTE instance in the chip.
+    enum: [3, 11]
+
+  '#hardware-timestamps-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - slices
+  - "#hardware-timestamps-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    tegra_hte_aon: hardware-timestamps@c1e0000 {
+              compatible = "nvidia,tegra194-gte-aon";
+              reg = <0xc1e0000 0x10000>;
+              interrupts = <0 13 0x4>;
+              int-threshold = <1>;
+              slices = <3>;
+              #hardware-timestamps-cells = <1>;
+    };
+
+  - |
+    tegra_hte_lic: hardware-timestamps@3aa0000 {
+              compatible = "nvidia,tegra194-gte-lic";
+              reg = <0x3aa0000 0x10000>;
+              interrupts = <0 11 0x4>;
+              int-threshold = <1>;
+              slices = <11>;
+              #hardware-timestamps-cells = <1>;
+    };
+
+...
-- 
2.17.1

