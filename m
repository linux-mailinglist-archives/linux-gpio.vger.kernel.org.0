Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FA5F3A78C0
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Jun 2021 10:07:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230506AbhFOIJZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Jun 2021 04:09:25 -0400
Received: from mail-bn7nam10on2051.outbound.protection.outlook.com ([40.107.92.51]:33344
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230448AbhFOIJX (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 15 Jun 2021 04:09:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QVkAmR2NW5pUkzH0m/v19Xw33S1kha2soOLSCnbNVHvfv1ClNM3rQF/LR08XoctSCVHjA9QaQ0pjC6FQM/SXyeZgg0a0UkC1MfpKUIAs1vpRcs1jn0J6NizsafPcjVUztUz7HtJvCOVN+OdzYiifj8D5uAgabt2qPzcOAw+KX2g4uVI+TdGyqaruFUh7F/VAdVhKXjuZtdu8KCt7GSj3cHEbdLeD8azFTalX6kpILvBjuAQOF1BIRQw7JOJjnFeSuFTgSW9pGIje53r9ltO2A3s+ywHQOx2jUr4HzTltV9nPUDCFWIu3zfBlT20ucbfxnrpUsibo/BTIB+a6DYFsUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zfB/qHTM7/Iv5IYnGXAldJYLby7Jr3vOCEWRpi0FOrY=;
 b=It68UYdb5j8nG5t6vuLFiB8HJHF0Ytl7+aFyUgsz4MRmwv1nYnEbs9tOJRFC7CQDDMjHKE/R3kJKdghcoAZF1DaoRL9kgJOoIyh/TCKubcTx0+cEzQk3Jp553cSniPxAEhUVMd0z1e2ZvOzUF5LHD1gu9WgCohboRSLHqLEC5Pye5L3n6CGdFIr2W2kemYx+O9rp5Qgvz2SBektY3hxGMdMTBkU8EES5Ix/ihOelRywMCAYoMjZ3ZqMrb8QwttUBnWiZKCdTMxuWAS0aylb1AxRUwGaSL+1hET/T3CoEh6HqNltVj6OiCN3V754yW/EZLxWVr3XTKMSYf3znxtMIsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=linaro.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zfB/qHTM7/Iv5IYnGXAldJYLby7Jr3vOCEWRpi0FOrY=;
 b=oSgh6pXizSP+LRytZj1jzMAhQh9/x0IzJYpfqamjZSnQNV7XKdEQj8XGZazvAqjNJZchj56M4w0HzjZQGxiTJmjJtpGxDuVqYXyCplKjj51YA4c8/t/fI07QXZb81bcRSM0xczl6TY6LkkjoUZygU/TG+vXAxND8k54nR3+8hwg=
Received: from BN0PR02CA0050.namprd02.prod.outlook.com (2603:10b6:408:e5::25)
 by MN2PR02MB6061.namprd02.prod.outlook.com (2603:10b6:208:1b5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21; Tue, 15 Jun
 2021 08:07:16 +0000
Received: from BN1NAM02FT037.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:e5:cafe::e1) by BN0PR02CA0050.outlook.office365.com
 (2603:10b6:408:e5::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21 via Frontend
 Transport; Tue, 15 Jun 2021 08:07:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT037.mail.protection.outlook.com (10.13.2.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4219.21 via Frontend Transport; Tue, 15 Jun 2021 08:07:16 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 15 Jun 2021 01:06:39 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Tue, 15 Jun 2021 01:06:39 -0700
Envelope-to: git@xilinx.com,
 linus.walleij@linaro.org,
 bgolaszewski@baylibre.com,
 robh+dt@kernel.org,
 linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Received: from [10.140.6.35] (port=43350 helo=xhdsaipava40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <piyush.mehta@xilinx.com>)
        id 1lt45m-0002dn-Nm; Tue, 15 Jun 2021 01:06:39 -0700
From:   Piyush Mehta <piyush.mehta@xilinx.com>
To:     <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
        <robh+dt@kernel.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>, <git@xilinx.com>,
        <sgoud@xilinx.com>, <michal.simek@xilinx.com>,
        Piyush Mehta <piyush.mehta@xilinx.com>
Subject: [PATCH 1/2] dt-bindings: gpio: Add binding documentation for modepin
Date:   Tue, 15 Jun 2021 13:35:52 +0530
Message-ID: <20210615080553.2021061-2-piyush.mehta@xilinx.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210615080553.2021061-1-piyush.mehta@xilinx.com>
References: <20210615080553.2021061-1-piyush.mehta@xilinx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a80e9cc6-03a2-4bef-48f4-08d92fd4973d
X-MS-TrafficTypeDiagnostic: MN2PR02MB6061:
X-Microsoft-Antispam-PRVS: <MN2PR02MB60610702EEEF00471EEBC2D5D4309@MN2PR02MB6061.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xbqMx10Y3SnwN/jC7eA/ZrcKujAJXgYnOKVbw2YcyAzgZeWUYI6eoCD/TtZyfkuXZKLfjra4eN9vh8vkaSOubreaA51iHWhi52/RaGOnsejSyshTsdP3RkvK1SsG8koZosdqIDXxDCmuchIZPqdYlynNY5INvQY6XFx6NF3DIW/RE6fVCuMEw3oA/YmVkmH84AOjuxYT2Nxicz96jGIThvmYfvxkyrbGLpkl823r5AfzWKSDM9w/Sc5n9Ju/IVSfASez0ZndzOCfyDk1XZi34c10L/RnG9/cIrXlMu2m++ieRPqzwbDHPPHsuv4HJLFn/ZNZGH/il6Qtmbbt3hJOEaO25Xy2Nw2Npj9BNNjGPHhayW8dQc8h9zTrBVQg/u3UdhV3f3cJ0r7xWtjPyGIZ1C8AGjJ6oWJVQZhWueY/jGCV3JyiOfp28g9dNFpHByC09GGrx+VCnJ/FyV35LncL4zl6S4i2oujB7OwyASEQGH0wmUJMmYTazZgAxI8cXZEH8LFFoSCJqmjOkWZtSAL4FcTcCiPMIAMhGsuvwNDGcsjsJTfRjp3BtCpzMeBV8EHa6lyV7KJ3lsc5PvpiWC1nIMfhe0ZkygHjndEChjV4xKIIgDImqslRnP35x48PIy2BJcM+CFuprG1/a5WVkKDpJBpGac1HEQIZkaIMHFFf4jRIkzcLoXD8qSK+59rbcafhlb3YgAh9rVQ/zTeLuSVYYwaDqnxxH5RrC9JXZb48vQ2dB0uLxycH3YG5LH735RDpaLJv0v0NvrYzH/maar/GhSAzs7sibbRzW3Rn5tk8WV6pf2lWE46dTCD7ay41lsFD4PDJDwKkAsKtPVu1RZgKtw==
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(136003)(376002)(39850400004)(396003)(346002)(46966006)(36840700001)(7636003)(356005)(70206006)(186003)(110136005)(82310400003)(70586007)(54906003)(107886003)(6666004)(44832011)(82740400003)(4326008)(8676002)(1076003)(336012)(36756003)(8936002)(2906002)(36906005)(316002)(36860700001)(47076005)(9786002)(26005)(478600001)(5660300002)(7696005)(2616005)(426003)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2021 08:07:16.5024
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a80e9cc6-03a2-4bef-48f4-08d92fd4973d
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT037.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB6061
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add DT binding document for modepin GPIO controller.

Signed-off-by: Piyush Mehta <piyush.mehta@xilinx.com>
State: pending
---
 .../bindings/gpio/xlnx,zynqmp-gpio-modepin.yaml    | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/xlnx,zynqmp-gpio-modepin.yaml

diff --git a/Documentation/devicetree/bindings/gpio/xlnx,zynqmp-gpio-modepin.yaml b/Documentation/devicetree/bindings/gpio/xlnx,zynqmp-gpio-modepin.yaml
new file mode 100644
index 0000000..39d78f8
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/xlnx,zynqmp-gpio-modepin.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/gpio/xlnx,zynqmp-gpio-modepin.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: ZynqMP Mode Pin GPIO controller
+
+description:
+  PS_MODE is 4-bits boot mode pins sampled on POR deassertion. Mode Pin
+  GPIO controller with configurable from numbers of pins (from 0 to 3 per
+  PS_MODE). Every pin can be configured as input/output.
+
+maintainers:
+  - Piyush Mehta <piyush.mehta@xilinx.com>
+
+properties:
+  compatible:
+    const: xlnx,zynqmp-gpio-modepin
+
+  gpio-controller: true
+
+  "#gpio-cells":
+    const: 2
+
+required:
+  - compatible
+  - gpio-controller
+  - "#gpio-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    modepin_gpio: gpio {
+        compatible = "xlnx,zynqmp-gpio-modepin";
+        gpio-controller;
+        #gpio-cells = <2>;
+    };
+
+...
-- 
2.7.4

