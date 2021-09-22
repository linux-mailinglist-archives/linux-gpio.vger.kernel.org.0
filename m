Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 134DF414B23
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Sep 2021 15:54:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233079AbhIVNzf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Sep 2021 09:55:35 -0400
Received: from mail-co1nam11on2088.outbound.protection.outlook.com ([40.107.220.88]:64448
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233294AbhIVNze (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 22 Sep 2021 09:55:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O5F9Uonvxb9KDOBpzwLLl3b0VahYXiLOU0E7imAyok5+wrQlbbGWBCWTh1/kwEHTVdx+8dAR/lhe207IKTGYEXNHABoMPLElLyDLu/ZO/gXHCuMrW7QTer63e/VrJDZBCXP+6Z3VSEkJW/8FsrqDpuVxsls2ND2X723G+fQOJ6JNW3B5No8ATA+ryVBbfMGvK/pP0CxJkMqBFI5yr14QkqERpaZQLPjp8zhbj8lAsn0e7CencY/Uo1MZueIetI8+YmOurhScbC5Cc5LEctWPgVW4ZlF5JC+To4Y7lqAi3FB5xNF6yH9WCXyXNEAw12o+Tn4s0EY6OUhdbTxuGmyGVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=jlt1l6JbX5pC+y47uEHX41Bdnzkrx5d7OO8/PhymFnQ=;
 b=nfNVU0mF/xLQ7tgtN9DJ/nbhqxb0thANQI3EsSb48MpwpnL0OOjHZRuKaxapvL2QZWOD2PccCAr4k+vYhBwABNfDsNlVocdZ8PoOTGLChag033+boB/2J3jzxa9RMCrt2qaeGuqyq/47hHfvR7I3L4U/fli6h0pi9Rcf+wdlpcbuVU/7aANNabOG4cT5U519upTeqSRFjac5ncOvwjtzhcMrj8f68lN1JL/usbYIXp/6SUqBSmKYca/tDQsrA8etQnebRhCr5jwLbNza6T4K7UbyJdCPGVHSN7QNDNBNx3nBXLa3ftPW4CUaBm4pT44eCyZmX4vLmJTq43w3sHadXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=arndb.de smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jlt1l6JbX5pC+y47uEHX41Bdnzkrx5d7OO8/PhymFnQ=;
 b=oR8hCciFD+9Q13W/ipeG/Nc60jq9R/u4EKonrbcBcbTHJDmiAlid7v9zmwz1fkoFrZgdg2oUdpWtBOnH+1ps25eey9XCXIQQ+/3RZ66KR7qkII2kFi2fwX2fGa5xx8rbMmwN+l29qxz+rNb1s0YCK1kxL5hyBKjXboeznop/djc=
Received: from BN0PR02CA0015.namprd02.prod.outlook.com (2603:10b6:408:e4::20)
 by BL0PR02MB4563.namprd02.prod.outlook.com (2603:10b6:208:4b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16; Wed, 22 Sep
 2021 13:54:00 +0000
Received: from BN1NAM02FT040.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:e4:cafe::20) by BN0PR02CA0015.outlook.office365.com
 (2603:10b6:408:e4::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Wed, 22 Sep 2021 13:54:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; arndb.de; dkim=none (message not signed)
 header.d=none;arndb.de; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT040.mail.protection.outlook.com (10.13.2.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4523.14 via Frontend Transport; Wed, 22 Sep 2021 13:54:00 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 22 Sep 2021 06:53:45 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 22 Sep 2021 06:53:45 -0700
Envelope-to: git@xilinx.com,
 arnd@arndb.de,
 zou_wei@huawei.com,
 gregkh@linuxfoundation.org,
 linus.walleij@linaro.org,
 iwamatsu@nigauri.org,
 bgolaszewski@baylibre.com,
 robh+dt@kernel.org,
 linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 robh@kernel.org
Received: from [10.140.6.35] (port=53850 helo=xhdsaipava40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <piyush.mehta@xilinx.com>)
        id 1mT2gv-0000im-Db; Wed, 22 Sep 2021 06:53:41 -0700
From:   Piyush Mehta <piyush.mehta@xilinx.com>
To:     <arnd@arndb.de>, <zou_wei@huawei.com>,
        <gregkh@linuxfoundation.org>, <linus.walleij@linaro.org>,
        <michal.simek@xilinx.com>, <wendy.liang@xilinx.com>,
        <iwamatsu@nigauri.org>, <bgolaszewski@baylibre.com>,
        <robh+dt@kernel.org>, <rajan.vaja@xilinx.com>
CC:     <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <git@xilinx.com>, <sgoud@xilinx.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Piyush Mehta <piyush.mehta@xilinx.com>,
        "Rob Herring" <robh@kernel.org>
Subject: [PATCH V4 2/3] dt-bindings: gpio: zynqmp: Add binding documentation for modepin
Date:   Wed, 22 Sep 2021 19:23:18 +0530
Message-ID: <20210922135319.3128153-3-piyush.mehta@xilinx.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210922135319.3128153-1-piyush.mehta@xilinx.com>
References: <20210922135319.3128153-1-piyush.mehta@xilinx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 84c0a40d-bf40-43e0-e61a-08d97dd06e15
X-MS-TrafficTypeDiagnostic: BL0PR02MB4563:
X-Microsoft-Antispam-PRVS: <BL0PR02MB4563FBEF02C3A343C7B607A6D4A29@BL0PR02MB4563.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: thLuP7i/9YcLMk8t5N5DE6XfA5/lIgh7t8lUuCfqOX3NZU+oMNhLGWzLHIatmlbS9xR83Cp3zDwks+3OFToaCSoPgfzASQotifnOqIlx16Ghvas2xRs83AJ0GbgkdbVXJdiyIGl5McJ/zalukPT7rqGjK/d7mZ+k8Zkm+8GtXUzgM6PLATfmX1ulH4JX3HoZTUSIYYRkcyPMJBe1KV18Z4i9eHpvJWkzkIXphukYXoKcEwjGwPGV+ALg8NN36b4ce0mSO7hCG9bSkPuhXuAkJUYjex8UctimhqIyniT7vjzbKGPmBNVYZoVoDkRJpC55XxZwrFq8wcpNmNip0NGHGxzrEzpx8elelwt+5jxZFuhhVDnyBokSRsuVz0aUUGeEH+jUoNzLipsUPmUdZtkJeB2U5T2Ngm0PvvKi8P4SET79ZKYDZp1ZpbyDQGYNPO+MBnnkxVketpj1yoVHdLT/VbepH5iBylq+5LJbuYPJ8GCp7sOvGcPkJdb6EUL+5rg1XgfUi6+zV2cbQa60A+qKFAlEOQVs7SSZDY1zk2t/bBLk5odgDFDYxQBoP9YojpjRz5c+znXkqmV3oA5354lpOpUdIj5xGODhzyle5Jyr4Evfpd0Pi/BQOsSLc0CgxCReEqnMd7YQJMUmbK0U9DUmiJr8prkT3i1PHtiPDzuIjPW3DiLsoI7ohrRu6NMSY1hKPSKYj7vjOdBdRnF6ATxnpZghauL62X3uQ9KG8oSXTQuCS17m5hvaDIMz7JZsqvMyHI37753QreTTzTV0tGUP0lHTsU9YikDlKJ969evE9XGsP2SNcuwNCLFkL12fTy9Ee2ZH+e9aWfKsScLI0V4jXrzT1XPsb0HS5uOb4GGYKUXijsffYKg7zfIu54eFJgB0JZNprn2KsVWx7DNO0KNfspbL8F03tLXBH9WqltpGINk=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(5660300002)(70206006)(8936002)(316002)(36906005)(47076005)(70586007)(2616005)(8676002)(356005)(336012)(110136005)(426003)(54906003)(36756003)(7696005)(6636002)(83380400001)(186003)(508600001)(966005)(36860700001)(44832011)(7636003)(4326008)(82310400003)(9786002)(1076003)(7416002)(2906002)(6666004)(921005)(26005)(102446001)(83996005)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2021 13:54:00.1834
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 84c0a40d-bf40-43e0-e61a-08d97dd06e15
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT040.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB4563
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch adds DT binding document for zynqmp modepin GPIO controller.
Modepin GPIO controller has four GPIO pins which can be configurable
as input or output.

Modepin driver is a bridge between the peripheral driver and GPIO pins.
It has set and get APIs for accessing GPIO pins, based on the device-tree
entry of reset-gpio property in the peripheral driver, every pin can be
configured as input/output and trigger GPIO pin.

For more information please refer zynqMp TRM link:
Link: https://www.xilinx.com/support/documentation/user_guides/ug1085-zynq-ultrascale-trm.pdf
Chapter 2: Signals, Interfaces, and Pins
Table 2-2: Clock, Reset, and Configuration Pins - PS_MODE

Signed-off-by: Piyush Mehta <piyush.mehta@xilinx.com>
Acked-by: Michal Simek <michal.simek@xilinx.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
Changes in v2:
- Addressed review comments: Update commit message

Review Comments:
https://lore.kernel.org/linux-arm-kernel/20210615080553.2021061-2-piyush.mehta@xilinx.com/T/#mbd1fbda813e33b19397b350bde75747c92a0d7e1
https://lore.kernel.org/linux-arm-kernel/20210615080553.2021061-2-piyush.mehta@xilinx.com/T/#me82b1444ab3776162cdb0077dfc9256365c7e736

Changes in v3:
- Addressed Rob and Michal review comments:
  - Update DT example. 

Review Comments:
https://lore.kernel.org/linux-arm-kernel/YRbBnRS0VosXcZWz@robh.at.kernel.org/
https://lore.kernel.org/linux-arm-kernel/d71ad7f9-6972-8cc0-6dfb-b5306c9900d0@xilinx.com/
---
 .../bindings/gpio/xlnx,zynqmp-gpio-modepin.yaml    | 41 ++++++++++++++++++++++
 .../bindings/gpio/xlnx,zynqmp-gpio-modepin.yaml    | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/xlnx,zynqmp-gpio-modepin.yaml

diff --git a/Documentation/devicetree/bindings/gpio/xlnx,zynqmp-gpio-modepin.yaml b/Documentation/devicetree/bindings/gpio/xlnx,zynqmp-gpio-modepin.yaml
new file mode 100644
index 0000000..31c0fc3
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/xlnx,zynqmp-gpio-modepin.yaml
@@ -0,0 +1,43 @@
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
+    zynqmp-firmware {
+        gpio {
+            compatible = "xlnx,zynqmp-gpio-modepin";
+            gpio-controller;
+            #gpio-cells = <2>;
+        };
+    };
+
+...
-- 
2.7.4

