Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FCAD45AC53
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Nov 2021 20:29:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240022AbhKWTcm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Nov 2021 14:32:42 -0500
Received: from mail-bn8nam12on2079.outbound.protection.outlook.com ([40.107.237.79]:56928
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S237226AbhKWTc3 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 23 Nov 2021 14:32:29 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hus8pma5AzSpVy502qSnJCsY0LX8fx6hF39SCpXU0nwGH//Eg2T4FjcK2EYf4xbWhZocsBLR1j89EEReGa8D9h7vezh7bjBxT31ZR3sx4u/jPtMXui2M3HTz8gdl5ACOeQtlSnKzrof0L3e5byNNk6RiteJsbA6ePy6KXV0PxuKzfXqxa2cjfyEz+4pL+8kK/rVw9Y5FX0IyVKmsEIBHAaroAsbVgDStD4E6f+swZzt/qpvz7qs1ckeH2FEWmlL1VTF9mwZnsGinrHrIAurOA8z5PH+F8MA7TwW9N7A9tK8m+7Bm/79IHpy0EoJYFGk7NyX0j3Gtcb0wFAxUAV9iVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hvi1BiWUwSWHNAHq5sLUOO3Tvy87ugSBxqOSaSRmjPw=;
 b=KdPjJv6C/XrUOKRITqDQik5Dz6LjkXDnkpflKWDR5u7aBJMVPblFu4tpiRd/Kz23fBXaipIxHMqUpS0OuyYs10Zc8zuRlyryfTSpADKq0mkbDnmGanAtHadgyIfWUU24JaCSC0o2HY1V+0yfJjyVenwUgcvl3CbgJYGYhzj7wq0VFre5EBvIoReZI5PW4/KAqTi4swhPkkXaapCMidoLWSVrgExBpULYJiykBSfwlMBZDab6KYWod+mDnJerljxZNvPv1vGsRpdMRhGsGrqn0JA+9xtt97qlqCExmdJpgcFtHR/pzZtlsLhXZxgEmN2G6hupIbIyfpuG66ckGKzvrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.35) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hvi1BiWUwSWHNAHq5sLUOO3Tvy87ugSBxqOSaSRmjPw=;
 b=UCToTL314kTvBH0ka/6mATZXPA4V4ljzb2DglGoRZHi5uYIXQFnUgUH0AkaSdcO3KgjakSaNoICvMZDRXtMuX66eldPJf0Iz+IxHImpbByiYWsA8yHCxaepHOKkU8ya3TrHA+nV8r4nYek3qEvZpJ2RIU3U/Xi/YmJUQgGtMvg3kiO6aS/vTBOdmHmqRe37G57Z81C7GbRwUXwGlQOlfw2pPioa0rdV13JxfOVkivKZN9cLfjGBVKhQVX6drbaA0VgaP4Z6XYgH5OfhVXj2cLgocEoTKNvU3zVa15cgrPlqm5QIzL8q/ZnePK2gI+WZ/rv5eSMP7YWESbiArrh9fEA==
Received: from MWHPR22CA0034.namprd22.prod.outlook.com (2603:10b6:300:69::20)
 by BN6PR12MB1537.namprd12.prod.outlook.com (2603:10b6:405:5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Tue, 23 Nov
 2021 19:29:18 +0000
Received: from CO1NAM11FT034.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:69:cafe::b0) by MWHPR22CA0034.outlook.office365.com
 (2603:10b6:300:69::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend
 Transport; Tue, 23 Nov 2021 19:29:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.35)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.35 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.35; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.35) by
 CO1NAM11FT034.mail.protection.outlook.com (10.13.174.248) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4713.20 via Frontend Transport; Tue, 23 Nov 2021 19:29:17 +0000
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 23 Nov
 2021 19:29:15 +0000
Received: from dipenp.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Tue, 23 Nov 2021 19:29:15 +0000
From:   Dipen Patel <dipenp@nvidia.com>
To:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linus.walleij@linaro.org>,
        <bgolaszewski@baylibre.com>, <warthog618@gmail.com>,
        <devicetree@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <robh+dt@kernel.org>
CC:     Dipen Patel <dipenp@nvidia.com>
Subject: [RFC v3 04/12] dt-bindings: Add HTE bindings
Date:   Tue, 23 Nov 2021 11:30:31 -0800
Message-ID: <20211123193039.25154-5-dipenp@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211123193039.25154-1-dipenp@nvidia.com>
References: <20211123193039.25154-1-dipenp@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1fe5362a-b69b-4356-352e-08d9aeb78a87
X-MS-TrafficTypeDiagnostic: BN6PR12MB1537:
X-Microsoft-Antispam-PRVS: <BN6PR12MB1537D3FE3B8B8360EF09EC39AE609@BN6PR12MB1537.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QLQkKCm7N6eFSwmHwrA/nW+okulmUpkbS3U9+gMX4Oy6LrS2DwEUO8qsdHwFj1DrnzJVzncGavHbBPeXkME+dgTXxK6HbqGfdEl/WbYqbHBhPe0H8d8gMll8/GeJXmPVkvzppfg2KQLjSMc8RpVOpHl9udU3jjKA8OvCFrmO9Z1CXzBDkWM5/viN+0QJp1pzeZXHoEtc2p72GtMk+3hZewFUKW7S+VldnjSyLyxrQz7KxsnMetGoC5/Z+rcGgGDZ8PmHsx4C+l5LHanzKTA7mdHH71lmKB4EBWdC62rlBix5K5xUgU7OaZmtaGL0tPutpvA4qw3OFeOgxdBy8JQ+2c7CG1Pr1IayYpaCmlbebggwCy9XD5GHtXs5DRLOs1Xq6kpvcdWWkNjdRjhYF1bA7Rx+ZL7blpodSxCNJ3eSSyrRsKd5cwzestajbC6ZFh/z7ZZoDDCI9cO6yLfmxhTZLjrKfaUhHycXKj+/4D5Ua+RhiEdldEUZutarqPdFlgKmSTWld2xB4ycDDpfekqLWgzEVbSdckkei1bIAiBWxPMZkuD9pypY17NrLbO1nWsAZzDtuKMqClOIrTyqhzD0iTmpDoac1e9UnDVGac4rJnHne951qkbPZjKxMDIy4InTzptihE+VZ8Y6rqCYH3sFrogrj4vsSORjYEE7wX5TySBtyt9HUDKy7h6Iv5ju0PCaqNANeFJGbGO7jIVNxPk6XC5zI8/YVYWFK8qzfe8lJlTXo0VofIRuJUdTzaFXAru+bTK39rh9BuS5MWid+h+IDN3GYIqgjL3DXhSB8x42ddulW3YmEhrc/X4a/T4G/G5bYbz2/R/gCu2flBNxQnIAVR6TN0B6Q/XNB9zNXL2KpCksNaTP8R07c8njCcatH1msHD2+VMhY6tqnn1xyaJZHUBg==
X-Forefront-Antispam-Report: CIP:216.228.112.35;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid04.nvidia.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(7636003)(966005)(4326008)(6666004)(8936002)(107886003)(921005)(1076003)(26005)(356005)(8676002)(2906002)(5660300002)(86362001)(508600001)(426003)(83380400001)(36860700001)(2616005)(110136005)(316002)(7696005)(7416002)(70586007)(70206006)(47076005)(82310400004)(336012)(36756003)(186003)(2101003)(83996005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2021 19:29:17.4811
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fe5362a-b69b-4356-352e-08d9aeb78a87
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.35];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT034.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1537
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Introduces HTE devicetree binding details for the HTE subsystem. It
includes examples for the consumers, binding details for the providers
and specific binding details for the Tegra194 based HTE providers.

Signed-off-by: Dipen Patel <dipenp@nvidia.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---
Changes in v2:
- Replace hte with hardware-timestamp for property names
- Renamed file
- Removed example from the common dt binding file.

Changes in v3:
- Addressed grammatical errors.
- Removed double plural from the respective properties.
- Added dual license.
- Prefixed "nvidia" in nvidia specific properties. 

 .../hte/hardware-timestamps-common.yaml       | 29 +++++++
 .../devicetree/bindings/hte/hte-consumer.yaml | 48 +++++++++++
 .../bindings/hte/nvidia,tegra194-hte.yaml     | 80 +++++++++++++++++++
 3 files changed, 157 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hte/hardware-timestamps-common.yaml
 create mode 100644 Documentation/devicetree/bindings/hte/hte-consumer.yaml
 create mode 100644 Documentation/devicetree/bindings/hte/nvidia,tegra194-hte.yaml

diff --git a/Documentation/devicetree/bindings/hte/hardware-timestamps-common.yaml b/Documentation/devicetree/bindings/hte/hardware-timestamps-common.yaml
new file mode 100644
index 000000000000..ee6f94890695
--- /dev/null
+++ b/Documentation/devicetree/bindings/hte/hardware-timestamps-common.yaml
@@ -0,0 +1,29 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
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
+    pattern: "^hardware-timestamp(@.*|-[0-9a-f])?$"
+
+  "#hardware-timestamp-cells":
+    description:
+      Number of cells in a HTE specifier.
+
+required:
+  - "#hardware-timestamp-cells"
+
+additionalProperties: true
diff --git a/Documentation/devicetree/bindings/hte/hte-consumer.yaml b/Documentation/devicetree/bindings/hte/hte-consumer.yaml
new file mode 100644
index 000000000000..75914e1c8ee1
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
+  binding for each device. An optional property "hardware-timestamp-names" may
+  contain a list of strings to label each of the HTE devices listed in the
+  "hardware-timestamps" property.
+
+  The "hardware-timestamp-names" property if specified is used to map the name
+  of the HTE device requested by the devm_of_hte_request_ts() call to an index
+  into the list given by the "hardware-timestamps" property.
+
+properties:
+  hardware-timestamps:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description:
+      The list of HTE provider phandle. The provider must document the number
+      of cell that must be passed in this property along with phandle.
+
+  hardware-timestamp-names:
+    $ref: /schemas/types.yaml#/definitions/string-array
+    description:
+      An optional string property.
+
+required:
+  - hardware-timestamps
+
+dependencies:
+  hardware-timestamp-names: [ hardware-timestamps ]
+
+additionalProperties: true
+
+examples:
+  - |
+    hte_irq_consumer {
+              hardware-timestamps = <&tegra_hte_lic 0x19>;
+              hardware-timestamp-names = "hte-irq";
+    };
diff --git a/Documentation/devicetree/bindings/hte/nvidia,tegra194-hte.yaml b/Documentation/devicetree/bindings/hte/nvidia,tegra194-hte.yaml
new file mode 100644
index 000000000000..675d4bb6ad3b
--- /dev/null
+++ b/Documentation/devicetree/bindings/hte/nvidia,tegra194-hte.yaml
@@ -0,0 +1,80 @@
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
+  internal hardware FIFO. It has a bitmap array arranged in 32bit slices where
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
+  nvidia,int-threshold:
+    description:
+      HTE device generates its interrupt based on this u32 FIFO threshold
+      value. The recommended value is 1.
+    minimum: 1
+    maximum: 256
+
+  nvidia,slices:
+    type: int
+    description:
+      HTE lines are arranged in 32 bit slice where each bit represents different
+      line/signal that it can enable/configure for the timestamp. It is u32
+      property and depends on the HTE instance in the chip.
+    enum: [3, 11]
+
+  '#hardware-timestamp-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - nvidia,slices
+  - "#hardware-timestamp-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    tegra_hte_aon: hardware-timestamp@c1e0000 {
+              compatible = "nvidia,tegra194-gte-aon";
+              reg = <0xc1e0000 0x10000>;
+              interrupts = <0 13 0x4>;
+              nvidia,int-threshold = <1>;
+              nvidia,slices = <3>;
+              #hardware-timestamp-cells = <1>;
+    };
+
+  - |
+    tegra_hte_lic: hardware-timestamp@3aa0000 {
+              compatible = "nvidia,tegra194-gte-lic";
+              reg = <0x3aa0000 0x10000>;
+              interrupts = <0 11 0x4>;
+              nvidia,int-threshold = <1>;
+              nvidia,slices = <11>;
+              #hardware-timestamp-cells = <1>;
+    };
+
+...
-- 
2.17.1

