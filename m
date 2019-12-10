Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24A921185F9
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Dec 2019 12:12:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727467AbfLJLMm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Dec 2019 06:12:42 -0500
Received: from mail-dm6nam10on2051.outbound.protection.outlook.com ([40.107.93.51]:57249
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727199AbfLJLMX (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 10 Dec 2019 06:12:23 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LGXHqwwJFfbnEqGbi0pldQ+yqCL7hfnlABrm/T+5FmYEPUP10+eVCsW1RX9qaw7Hc/Csu/GeMQYoLMXK5lJp4Nff3BlTknB7RblLHZ/2oMHVFd5RZw7mbwi3hon2R5V+swZ7iQzLT9Su4HiMcmyo7p8wCwvThfLPjWYQxnNPz6n+k+zamvbR7OIAUTwYtSaZoa67BGKPbJajq+AbH+lOOaC10BnIuqF8m6KBQXIvo6e60G7tjpcET0GKiIn6YBTGh5ArX2lILGaawK2w+JRT4Kpy+Mf+eEcC2yc/bfw04oVxiZFWB+ayixK+aZe/DBZ0Z7olZtToMIeb720Jzhm+7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A69GuNgzd8xLABLyRNAQSBDQDSwq54Hyih2rjqXwyGo=;
 b=ebERVNBYtDRFaQTBETbco4YWgQZtiMkDRHHt51wfW7z7b9rqd6Alh/miqSylpIGf6rtWtlFDNprDCmC1z5b73oWLKe6yRvKFcMT4aWcimTeASF3JvdsAQktKQ8Q53JYtY/1m9B2RSoCEyChyH+nCedU/cu4ZVJsv7coWoS3Rdm0kntgwj9p6CFKOfE6LNO6siwLbivjUeNddmP+cIp8WDdVHkyN0e0Y1E91GEA/lyH5rVAf5hj+qKdW/mNpv6HBKMXVDGgsoTcBoRPo1gTU3h6H5Jyr7j3au8Cth9t4s402I4MmETP2JfCOWhkZb7XPqzUOHLmp6n01HQZSs1vXrow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sifive.com; dmarc=pass action=none header.from=sifive.com;
 dkim=pass header.d=sifive.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A69GuNgzd8xLABLyRNAQSBDQDSwq54Hyih2rjqXwyGo=;
 b=H+5cjzQ5viNvcM4XpGRmnumwQan7r8jDWXHvbn6XiLHn0D3UZ/0p5N7K5FIA+48o1BvpLOT1tngnHNFPIksV0SnQ0gKqnN1l75w73XMniLPDWSrnxzGehYexyjQKcNJGUSD2vOwyBiIZzCmcmSKwj5AvMrIsDIa+yZLAjfUZBuI=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=yash.shah@sifive.com; 
Received: from CH2PR13MB3368.namprd13.prod.outlook.com (52.132.246.90) by
 CH2PR13MB3656.namprd13.prod.outlook.com (20.180.4.204) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.14; Tue, 10 Dec 2019 11:12:03 +0000
Received: from CH2PR13MB3368.namprd13.prod.outlook.com
 ([fe80::eccb:16ac:e897:85d5]) by CH2PR13MB3368.namprd13.prod.outlook.com
 ([fe80::eccb:16ac:e897:85d5%3]) with mapi id 15.20.2538.012; Tue, 10 Dec 2019
 11:12:03 +0000
From:   Yash Shah <yash.shah@sifive.com>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        robh+dt@kernel.org, mark.rutland@arm.com, palmer@dabbelt.com,
        paul.walmsley@sifive.com
Cc:     aou@eecs.berkeley.edu, tglx@linutronix.de, jason@lakedaemon.net,
        maz@kernel.org, bmeng.cn@gmail.com, atish.patra@wdc.com,
        sagar.kadam@sifive.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, sachin.ghadi@sifive.com,
        Yash Shah <yash.shah@sifive.com>
Subject: [PATCH v4 4/6] gpio: sifive: Add DT documentation for SiFive GPIO
Date:   Tue, 10 Dec 2019 16:41:12 +0530
Message-Id: <1575976274-13487-5-git-send-email-yash.shah@sifive.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1575976274-13487-1-git-send-email-yash.shah@sifive.com>
References: <1575976274-13487-1-git-send-email-yash.shah@sifive.com>
Content-Type: text/plain
X-ClientProxiedBy: PN1PR0101CA0028.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c00:c::14) To CH2PR13MB3368.namprd13.prod.outlook.com
 (2603:10b6:610:2c::26)
MIME-Version: 1.0
Received: from dhananjayk-PowerEdge-R620.open-silicon.com (114.143.65.226) by PN1PR0101CA0028.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c00:c::14) with Microsoft SMTP Server (version=TLS1_2, cipher=) via Frontend Transport; Tue, 10 Dec 2019 11:11:58 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [114.143.65.226]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e560f089-2ac2-40d9-8962-08d77d61c8dc
X-MS-TrafficTypeDiagnostic: CH2PR13MB3656:
X-LD-Processed: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CH2PR13MB3656F656608977C93A1E9AD38C5B0@CH2PR13MB3656.namprd13.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1079;
X-Forefront-PRVS: 02475B2A01
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(6029001)(396003)(39850400004)(366004)(136003)(346002)(376002)(199004)(189003)(36756003)(66476007)(1006002)(107886003)(52116002)(6666004)(66946007)(6506007)(26005)(956004)(316002)(2616005)(81166006)(8936002)(81156014)(16526019)(186003)(8676002)(44832011)(966005)(6636002)(5660300002)(86362001)(6486002)(7416002)(66556008)(6512007)(4326008)(478600001)(2906002);DIR:OUT;SFP:1101;SCL:1;SRVR:CH2PR13MB3656;H:CH2PR13MB3368.namprd13.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
Received-SPF: None (protection.outlook.com: sifive.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0atkTLpiyXa4pA/QeYQNYMYg+dAyQs3Z36MlxuL0ybBYibrecogQKiQLbqtsp1Je6mfk+1pj7yLxp/wMo8ddwzP19ARBjb8uzGASC3mEM5LX3OU7xvL2a/jNRnTv2+NUbt97DnRkSeuvmvp9rSQ4xCCzqCeWEgsPWzMauI/oMAnR8CARNeFNkNw9irEMU4SN2SaizM8qLMoz7OwZ59+2P5J9PPkwoer3Dn1i6tdFOwnAWnsLZ1uVccdJfaCaE/wtBeNizq3fjCj1Agq7Clb8lKOiq9W07v0folJokIeBJ71oKDOSE/8oPuuK65nhj5qDx6hgCxb8JIp9Z00/ebERtP3+BL59orXs6VdTCyqvEWPgFBctdOw06JGYomGWeT8AXGjSVk1pic8n/0KOKI8BpDaY93HQw+08cBFrJlbSUfH29k2GxWkZdoAOsHOFiYnPpp1bEQuAUGtgrKQ0WKuBKMZe3K38ZOKQTCR6MHm2L04=
X-OriginatorOrg: sifive.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e560f089-2ac2-40d9-8962-08d77d61c8dc
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2019 11:12:03.4318
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: usjxiEh+l/+AvPDr9hZ8EuOY/JpZuGXpjpZj5iSMSRoT7oI/MAoTRmdZmD2dkXAXXowiSpnYExsa5UmLCrmZ2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR13MB3656
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DT json-schema for GPIO controller added.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Wesley W. Terpstra <wesley@sifive.com>
[Atish: Compatible string update]
Signed-off-by: Atish Patra <atish.patra@wdc.com>
Signed-off-by: Yash Shah <yash.shah@sifive.com>
---
 .../devicetree/bindings/gpio/sifive,gpio.yaml      | 68 ++++++++++++++++++++++
 1 file changed, 68 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/sifive,gpio.yaml

diff --git a/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml b/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
new file mode 100644
index 0000000..418e838
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/sifive,gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SiFive GPIO controller
+
+maintainers:
+  - Yash Shah <yash.shah@sifive.com>
+  - Paul Walmsley <paul.walmsley@sifive.com>
+
+properties:
+  compatible:
+    items:
+      - const: sifive,fu540-c000-gpio
+      - const: sifive,gpio0
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    description:
+      interrupt mapping one per GPIO. Maximum 16 GPIOs.
+    minItems: 1
+    maxItems: 16
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 2
+
+  clocks:
+    maxItems: 1
+
+  "#gpio-cells":
+    const: 2
+
+  gpio-controller: true
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-controller
+  - "#interrupt-cells"
+  - clocks
+  - "#gpio-cells"
+  - gpio-controller
+
+additionalProperties: false
+
+examples:
+  - |
+      #include <dt-bindings/clock/sifive-fu540-prci.h>
+      gpio@10060000 {
+        compatible = "sifive,fu540-c000-gpio", "sifive,gpio0";
+        interrupt-parent = <&plic>;
+        interrupts = <7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22>;
+        reg = <0x0 0x10060000 0x0 0x1000>;
+        clocks = <&tlclk PRCI_CLK_TLCLK>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+      };
+
+...
-- 
2.7.4

