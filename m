Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 296E93B4B37
	for <lists+linux-gpio@lfdr.de>; Sat, 26 Jun 2021 01:48:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230091AbhFYXui (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 25 Jun 2021 19:50:38 -0400
Received: from mail-dm6nam08on2056.outbound.protection.outlook.com ([40.107.102.56]:32097
        "EHLO NAM04-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229978AbhFYXud (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 25 Jun 2021 19:50:33 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N40aIaqy38SRcpsRwnfGc7w1HUfqJF+T92TAyErxSblF4cGArE8wxr2LKL/yCXwK/nQEZA+YihaMgRf10S4m3L0Cu/84y2KkJ3HlW8hc8EsIZQ4oVIp0WHj1Sd0BplbTYGN+1vCKNZ/6vDc4gIL7fPRuDimmGt1bVujB8fx3zpGkrp9Qnn3l+dfESytZHxySq83/eup+cKR/kbYUKogkYtrBHlg3IBFvLDS1MndACZYmUh1Wi4KG0en54AQcuMGHhcV/INJ8iKT4DgUexGPUABXhJQ5hz8SApToft7SV7Oe7tRxC+vfwIF3qRpsRvQ+1FzQ5dOJiW9QQfUHS6CYKGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GIyzacZwlURVhpQnj3LF44PaPgmTjk6WulCpIe/dtEw=;
 b=jaIO7jD8voDC65XX/xN+FDDrJduv+heFebl6BzpnfIAGG6nHJ0qL+tey+8IUdDQJ3InoPMk+aS60fRLwqz1FKKcb/LwyOn6HWyUg8/9qUu8JsyDiX+yZicvlDespDlnW7x47LezQSE9dSqhTm/43Vh+OM7hp/pW8CSKHgZcxO6nB7ef49Aqf7PAnEDTpJTFKQMnerMRZ54emNIZicBVSFo/CTQPXlyPcpQqxTcJUNYvo+EJuXptziACwI5RURWhUWVhh6DpCXE3nGKOdEX/MY3gd/2dfE72fws2djJMndanOixBzxPNoNAU5cUZvwxltlDDoEgPSjrCJ1A8ToIuDHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.36) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GIyzacZwlURVhpQnj3LF44PaPgmTjk6WulCpIe/dtEw=;
 b=Zr3zk2D64zQtOJuOycTWKMukOnBMDm09J44P/wt5iWtgHlU7Ws2snHqn55pihdlAotG2j3xj3Hz/4PR2WX2YX0e8I9W5xV+WM87gQT+m3ITDJrI/WfeMjY+HECXG1Z8e99831+gvmv/tcBigBO0ZJizqlimZU0+XpabHJtXMO/5F4tfYJ/7uLM4Tr9f4ra4lkriWsKFeFGfCAYovYqjOZkRyoaQV3fZsKz1ahNzf5LpnD7nlhumv3ys0dQEp2aipRh3sZd2qvGbnugproWzdDmcKTmNjP7sgQk1Bg9m/8uhpGhxbnkNrSjiRgXcLQIG3qyrgkKcKrPgUB8kJtsnoTw==
Received: from DM6PR03CA0010.namprd03.prod.outlook.com (2603:10b6:5:40::23) by
 BYAPR12MB2984.namprd12.prod.outlook.com (2603:10b6:a03:da::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.23; Fri, 25 Jun 2021 23:48:10 +0000
Received: from DM6NAM11FT040.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:40:cafe::96) by DM6PR03CA0010.outlook.office365.com
 (2603:10b6:5:40::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18 via Frontend
 Transport; Fri, 25 Jun 2021 23:48:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.36)
 smtp.mailfrom=nvidia.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.36 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.36; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.36) by
 DM6NAM11FT040.mail.protection.outlook.com (10.13.173.133) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4264.18 via Frontend Transport; Fri, 25 Jun 2021 23:48:09 +0000
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 25 Jun
 2021 23:48:08 +0000
Received: from dipenp.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 25 Jun 2021 23:48:08 +0000
From:   Dipen Patel <dipenp@nvidia.com>
To:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linus.walleij@linaro.org>,
        <bgolaszewski@baylibre.com>, <warthog618@gmail.com>,
        <devicetree@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <dipenp@nvidia.com>, <robh+dt@kernel.org>
Subject: [RFC 04/11] dt-bindings: Add HTE bindings
Date:   Fri, 25 Jun 2021 16:55:25 -0700
Message-ID: <20210625235532.19575-5-dipenp@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210625235532.19575-1-dipenp@nvidia.com>
References: <20210625235532.19575-1-dipenp@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4d43a2ed-ef91-45ad-322c-08d93833b03c
X-MS-TrafficTypeDiagnostic: BYAPR12MB2984:
X-Microsoft-Antispam-PRVS: <BYAPR12MB2984E3476E2F4AB75D5FEBC3AE069@BYAPR12MB2984.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EOkFqwsXG896/MtAyB+wUjCzk8MHM1SZkz2ehIrWaGeVjklKCUW4Cg7HGleomMA2zu3v/9GuKlaIrAFBX05wsi4czjHQJns1eWScyYfeTheArHEFXShKhzJnslB4V7PGsi5aKHvv1x2xt0RWyJ6STZ6nM1qqIgESus915kfp4DlOhwsY/dR7DAClyVpIJ6js246DTeF2OGfBJ66rvLGjEBKnobpa1SYkffWzyos3ca8ZcGRUrVzG8948/9KtnoEXA5HZCiM9wIrE2r0yeWbkI8rM1Rs50tfcdEgugX9L3ZHSNWh6Bj8eZcd5cWduQWPloVBR3VmySy2a3CKOaZCj2WlmI8yxlQJVC3kEtKERiGL8qvQulD8hy2w1A7J+Jwq2axjiy827gPpLV6loFQmkpUKx0/RoaryvEzD1i5p2bp1T4bDiGntYoNo/avSWjto8ZPYYbKwIxhpG8Yw3rN1EIADfk5SKjzn8eULo6w77n60fQTtu3xEOmzSTdN5W1um2lGMlVFrsMNUV6P9F7sAFuzI9li85oyiloDtSzK44E+gZKWomHrZXdu6I2/g8gu9SFf/KduM5+R6QICgU7QYWEiw/UXpTsRjiYMqYXUFaHJ/Of4MGVSC4Cyv38eH4WG5lY+IwOgznG67VSHSfduqHT6hGWW3Dxn6nbP3rtbSnnH9wwExDyOYyHfU8MmuVh8P+dlZWtpNSjrT34zinq1suLzVtou6qjbqxQSMVga4jLngtbN1TCMG4QGwp0E+1QT7+qZqsi026PQMFCvVDNlT8pzsiFbe1japKoQdJ8jB6RLASqs761XhKpSff0VQhokJfCV3drrRDcxnFMGBEEUmNchBzwwHfmiBwKJFgQKS3rJ3yQSjAbVUb9KvR37ZJUP3ARb28TZoy6/44no9aye5n4g==
X-Forefront-Antispam-Report: CIP:216.228.112.36;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid05.nvidia.com;CAT:NONE;SFS:(4636009)(376002)(346002)(396003)(39860400002)(136003)(36840700001)(46966006)(7416002)(36860700001)(47076005)(1076003)(426003)(82740400003)(2906002)(316002)(36756003)(86362001)(2616005)(336012)(7696005)(478600001)(186003)(7636003)(356005)(70586007)(110136005)(70206006)(921005)(966005)(82310400003)(5660300002)(8676002)(83380400001)(6666004)(26005)(8936002)(83996005)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2021 23:48:09.9609
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d43a2ed-ef91-45ad-322c-08d93833b03c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.36];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT040.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2984
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Introduces HTE devicetree binding details for the HTE subsystem. It
includes examples for the consumers, binding details for the providers
and specific binding details for the Tegra194 based HTE providers.

Signed-off-by: Dipen Patel <dipenp@nvidia.com>
---
 .../devicetree/bindings/hte/hte-consumer.yaml | 47 +++++++++++
 .../devicetree/bindings/hte/hte.yaml          | 34 ++++++++
 .../bindings/hte/nvidia,tegra194-hte.yaml     | 83 +++++++++++++++++++
 3 files changed, 164 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hte/hte-consumer.yaml
 create mode 100644 Documentation/devicetree/bindings/hte/hte.yaml
 create mode 100644 Documentation/devicetree/bindings/hte/nvidia,tegra194-hte.yaml

diff --git a/Documentation/devicetree/bindings/hte/hte-consumer.yaml b/Documentation/devicetree/bindings/hte/hte-consumer.yaml
new file mode 100644
index 000000000000..79ae1f7d5185
--- /dev/null
+++ b/Documentation/devicetree/bindings/hte/hte-consumer.yaml
@@ -0,0 +1,47 @@
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
+  HTE properties should be named "htes". The exact meaning of each htes
+  property must be documented in the device tree binding for each device.
+  An optional property "hte-names" may contain a list of strings to label
+  each of the HTE devices listed in the "htes" property.
+
+  The "hte-names" property if specified is used to map the name of the HTE
+  device requested by the devm_of_hte_request_ts() or of_hte_request_ts
+  call to an index into the list given by the "htes" property.
+
+properties:
+  htes:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description:
+      The list of HTE provider phandle. The provider must document the number
+      of cell that must be passed in this property along with phandle.
+
+  hte-names:
+    $ref: /schemas/types.yaml#/definitions/string-array
+    description:
+      An optional string property.
+
+required:
+  - "htes"
+
+dependencies:
+  hte-names: [ htes ]
+
+additionalProperties: true
+
+examples:
+  - |
+    hte_irq_consumer {
+              htes = <&tegra_hte_lic 0x19>;
+              hte-names = "hte-irq";
+    };
diff --git a/Documentation/devicetree/bindings/hte/hte.yaml b/Documentation/devicetree/bindings/hte/hte.yaml
new file mode 100644
index 000000000000..e285c38f1a05
--- /dev/null
+++ b/Documentation/devicetree/bindings/hte/hte.yaml
@@ -0,0 +1,34 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hte/hte.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: HTE providers
+
+maintainers:
+  - Dipen Patel <dipenp@nvidia.com>
+
+properties:
+  $nodename:
+    pattern: "^hte(@.*|-[0-9a-f])*$"
+
+  "#hte-cells":
+    description:
+      Number of cells in a HTE specifier.
+
+required:
+  - "#hte-cells"
+
+additionalProperties: true
+
+examples:
+  - |
+    tegra_hte_aon: hte@c1e0000 {
+              compatible = "nvidia,tegra194-gte-aon";
+              reg = <0xc1e0000 0x10000>;
+              interrupts = <0 13 0x4>;
+              int-threshold = <1>;
+              slices = <3>;
+              #hte-cells = <1>;
+    };
\ No newline at end of file
diff --git a/Documentation/devicetree/bindings/hte/nvidia,tegra194-hte.yaml b/Documentation/devicetree/bindings/hte/nvidia,tegra194-hte.yaml
new file mode 100644
index 000000000000..bb76cc1971f0
--- /dev/null
+++ b/Documentation/devicetree/bindings/hte/nvidia,tegra194-hte.yaml
@@ -0,0 +1,83 @@
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
+   description:
+    HTE lines are arranged in 32 bit slice where each bit represents different
+    line/signal that it can enable/configure for the timestamp. It is u32
+    property and depends on the HTE instance in the chip.
+   oneOf:
+    - items:
+        - const: 3
+    - items:
+        - const: 11
+
+  '#hte-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - slices
+  - "#hte-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    tegra_hte_aon: hte@c1e0000 {
+              compatible = "nvidia,tegra194-gte-aon";
+              reg = <0xc1e0000 0x10000>;
+              interrupts = <0 13 0x4>;
+              int-threshold = <1>;
+              slices = <3>;
+              #hte-cells = <1>;
+    };
+
+  - |
+    tegra_hte_lic: hte@3aa0000 {
+              compatible = "nvidia,tegra194-gte-lic";
+              reg = <0x3aa0000 0x10000>;
+              interrupts = <0 11 0x4>;
+              int-threshold = <1>;
+              slices = <11>;
+              #hte-cells = <1>;
+    };
+
+...
-- 
2.17.1

