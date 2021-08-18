Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D309D3EFEC3
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Aug 2021 10:11:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238692AbhHRILh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 18 Aug 2021 04:11:37 -0400
Received: from mail-mw2nam10on2069.outbound.protection.outlook.com ([40.107.94.69]:59360
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S239665AbhHRILg (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 18 Aug 2021 04:11:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G9eMwDQRTh7hTP1xUAaUlN0LrjQQmwRR/WJaA6vy7K6qht3WnZCwPZc8pGOhN/bGA2IXZQhltjnAUVQzYV3pElvnTRrfBvLjVDzu4K+hPT4iias5fKGT3FYyY4daKF637kxf/jedvofxFkGRqc6swdfHry+d8pNuKA1QXGv4ZcE5hbCKGnItLlw68FSUPeGWnDO1mgGpIa1SkxqUmFOUzJPHJF+rbQk04O7i+ypxDDSV1rfWi6hyJ7cbppePk5Nq6a3jxcWvcM5NWAEQ/nYKBDnER8yltHZGqcL7IeiksIbm8hq4gKfTpMprn0ft7ZaXClD6++vT/y4e/mvJ/bum3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2X3ukTJDc8HI6vz+zevmuhQEcEDI00JnkCAyoQ7TSTk=;
 b=SNGgn01hYUmQ3dgQ+T2PUzims5PpMpyTr/6V8m6CkJ/YYFuLv6gVjHq2Yj3+yLtG5G+cgfe8xq6t3q273cDCjjigM3ha77aBL5bKsS+n4kqIXfwnYx/GY6i+JvY8MkE/EKLx8rhPLbzSpgFktVBIuO6CfSUGvxt3vIRIZzw9JkdtGqdt9ocnHUQFfs7fJI0PQszgapsBjUelBYCPlrFyg5Qpp8ugL9YPI8t7Tz43IFBtpUbRHA4htRPRr5JVCIfICLavfIxDI8l5UJkbd3cBxTBwoiXl07x/CITyze2S+S3LZ3BzLO1fXfA+2DQiEZF34FjZbuHKGu5eaSTg/39lTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=arndb.de smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2X3ukTJDc8HI6vz+zevmuhQEcEDI00JnkCAyoQ7TSTk=;
 b=PqZFaABwpHBa6sG3ejUVtTGw1UqxDmoT7NmjMtdL+lCY3Kov98GLfD9aHvfKAQ4mMYOyzGwVivS6GTgcnUPzaR75bbMbDg7giQ1ulgPE7xh/jeDxN4t8VRZ4xp1assWY1D/pGEaJ1vbYSZS7gOF+kes8Ozqh3rYrAdXR9Nh9sfM=
Received: from BN9PR03CA0675.namprd03.prod.outlook.com (2603:10b6:408:10e::20)
 by DM6PR02MB5386.namprd02.prod.outlook.com (2603:10b6:5:75::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.21; Wed, 18 Aug
 2021 08:11:00 +0000
Received: from BN1NAM02FT012.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:10e:cafe::c8) by BN9PR03CA0675.outlook.office365.com
 (2603:10b6:408:10e::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Wed, 18 Aug 2021 08:11:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; arndb.de; dkim=none (message not signed)
 header.d=none;arndb.de; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT012.mail.protection.outlook.com (10.13.2.130) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4436.19 via Frontend Transport; Wed, 18 Aug 2021 08:10:59 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 18 Aug 2021 01:10:40 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 18 Aug 2021 01:10:40 -0700
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
 linux-kernel@vger.kernel.org
Received: from [10.140.6.35] (port=57498 helo=xhdsaipava40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <piyush.mehta@xilinx.com>)
        id 1mGGel-0008z4-D0; Wed, 18 Aug 2021 01:10:39 -0700
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
        Piyush Mehta <piyush.mehta@xilinx.com>
Subject: [PATCH V3 2/3] dt-bindings: gpio: zynqmp: Add binding documentation for modepin
Date:   Wed, 18 Aug 2021 13:40:17 +0530
Message-ID: <20210818081018.2620544-3-piyush.mehta@xilinx.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818081018.2620544-1-piyush.mehta@xilinx.com>
References: <20210818081018.2620544-1-piyush.mehta@xilinx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 50a2688a-f285-45f8-b1ef-08d9621fb6d8
X-MS-TrafficTypeDiagnostic: DM6PR02MB5386:
X-Microsoft-Antispam-PRVS: <DM6PR02MB538613A2E743906EC940F5E9D4FF9@DM6PR02MB5386.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kuvavuYf0sjY49W8gDb7gsbY3MA4z/RaToINsj16wER4OToRpDh1HeQYTdvbQ3RVrQgm7efuyoiIlDfhzpwiyHsBrMOnD8E1/bTAJmJhkyP9HTpQQIslLp6IaKZYvrTbDETmSWIek4tRmMVs5l2tIadaUTz9hGZyIyVSIjdwElxiGIctRB77StigNgdbTt4yIraoIGLVkrlSho6twWFFFNkZRapwRKU3UNGvLy9E80DEnapjTWeP1ABmUeOVICfcJHT2nEkVG0hcWbvjSrJKcaRQ1uGIkv1ZyQ3V2OVtxwz5sqN1V/lDAAhvg+3ZOWWkhA8blDtMpH+Av4I8AwPeMnrc0zEOy9jUUBiAc+3ltP/s2Iad8BLvIHjMt6QvDTbN8UUQalBtgI/zYwWPWwKjcKnzg52NzgrppRsA1PFWig5VU7F2jJVi+6htZUdtYoLGU7JDPBgbV0ovuP7ZT5ql5oo1PgULF55U92c7t9gsJI4B40pQ/MP5FTIaM3a9bsV4x4vQf39kSVPryGo/FTqYsBz34308SMRWEN9E8OR579pHGFe3D6pfa2rv8G7WU8bE5R/H1wLNRKuCVRE9RQGQpRzRiOZQHmnyxy1PvUH6ZGh2KASq1RWe5Ktbah9VlfOXpqEO6XjUzIwVLu53fmRCzUyfqaA6cbBkThZadLsJp3JQB/OCNiPQLoc4seavAn1Ej7YCOaiJDBarAZ7dJvjhZwEKzeS3EaCGOJGcZbUU5R/beMZZkoWVSbh4D7R4TUhEjykmlE1F4EHzAOOXrTsjtiu2FP0QZ68smGCNNgYsbECrD4CrNayDogHvMWhwLTmTojeyXgcR1aWtxqYWyLkJWtCRE8dPfusitJNDPFGAMFquvfRoAdZM6JSyvQVmS+DaWDwT094/qaj3egJEZI6uy3e2X8XemwdDYn95+1U+58A=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(376002)(136003)(396003)(346002)(39850400004)(36840700001)(46966006)(36860700001)(5660300002)(4326008)(7696005)(7636003)(44832011)(336012)(316002)(7416002)(1076003)(47076005)(83380400001)(966005)(356005)(186003)(82740400003)(36906005)(478600001)(2616005)(36756003)(110136005)(54906003)(426003)(107886003)(2906002)(8676002)(26005)(6636002)(82310400003)(6666004)(70586007)(8936002)(70206006)(9786002)(921005)(102446001)(2101003)(83996005);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2021 08:10:59.9469
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 50a2688a-f285-45f8-b1ef-08d9621fb6d8
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT012.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB5386
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
index 0000000..1442815
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

