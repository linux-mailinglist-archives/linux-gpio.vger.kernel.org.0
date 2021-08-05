Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D2B23E1AA1
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Aug 2021 19:43:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240533AbhHERnf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Aug 2021 13:43:35 -0400
Received: from mail-bn8nam11on2051.outbound.protection.outlook.com ([40.107.236.51]:16992
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S240460AbhHERnY (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 5 Aug 2021 13:43:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bboOSvtADXckM5tUUkSc8K4ep8wiWtBAeMGrwloBIZO+tmX6t3UA2onumTAQuG4GV7itUGqick6Y1ES1qBrQszY3Yib8SMDH1lafxR/6gSUh/1rbbL7BkciqZMpiO+XyZwNCC9EIMbY4RMPL0GcgdOMwa8MeiGe5VKC92T/Sd1zTc/vZ1ll0i0vSS+gP9DiTnNTp3N6enFpf63HT6nL2TOOJS5LEMbs0O/Xs/wVDvz12EnvyBx1d9u88MyLWaVX9y+AY8Rhcl3X0r1RxibSWh6nBzeVTE3/yFkE5Dsv6IWay+NttbTMN1DO9RwVUAKKx+ihtPV9P2Lpj+GdSt2z93g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lodLg64lReQGcCsYcxpXPr29vJsoc8wdmyOTOlzt238=;
 b=I/mWlGDW7JHvClvAhiZbl2p7f6RQW5JVpP7d54quPKrJ6eIeKKDq4r+KUzXY78jxiozBnIIYx0qAc2TYVCBiIlGI0CvGxBnwxl8NsEnVRDbVJ4bb8azfwPdOkIULzQVAj9KCYtYDKVBCnDU3lZaaBnv6eOA0/O2Dj4C7ZNJovF1+XqPZjmQF49M32ibDrlusyKYbJc1hrVAtEe8vO8DWAowXwcYmhxOsTtPf220RpSU4pON0hCUnsNwgR3f6bwMXnaDCtwjHl/7l+41JEWN6mKqlQpIjhdfgN/fogT+Xy/jsX3RS+HBwA76KCfPhtZOgwGH/7Oru/2ga9aTKdoiJhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=arndb.de smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lodLg64lReQGcCsYcxpXPr29vJsoc8wdmyOTOlzt238=;
 b=ncUAz0yS9PfkuvHS8aBzQf2zTJyZBzrUp/K6E9ne9jwSAalmA/bKXLI4ileUpKOQoRyTjsUdl3aC8/6FytKQSDd7eFCbnohlbMJeQSIPviKjnn+wAfkmb/BmBjSAXAy29E36HKNysq5jPH5K+U/3Wee+oGsQaABPtb0YU3/ZWuE=
Received: from SN6PR16CA0051.namprd16.prod.outlook.com (2603:10b6:805:ca::28)
 by DM8PR02MB8155.namprd02.prod.outlook.com (2603:10b6:8:1c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.20; Thu, 5 Aug
 2021 17:43:06 +0000
Received: from SN1NAM02FT0028.eop-nam02.prod.protection.outlook.com
 (2603:10b6:805:ca:cafe::60) by SN6PR16CA0051.outlook.office365.com
 (2603:10b6:805:ca::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15 via Frontend
 Transport; Thu, 5 Aug 2021 17:43:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; arndb.de; dkim=none (message not signed)
 header.d=none;arndb.de; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0028.mail.protection.outlook.com (10.97.4.206) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4394.16 via Frontend Transport; Thu, 5 Aug 2021 17:43:06 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 5 Aug 2021 10:42:55 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Thu, 5 Aug 2021 10:42:55 -0700
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
Received: from [10.140.6.35] (port=51088 helo=xhdsaipava40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <piyush.mehta@xilinx.com>)
        id 1mBhOP-0005Bw-P9; Thu, 05 Aug 2021 10:42:54 -0700
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
Subject: [PATCH V2 2/3] dt-bindings: gpio: zynqmp: Add binding documentation for modepin
Date:   Thu, 5 Aug 2021 23:12:18 +0530
Message-ID: <20210805174219.3000667-3-piyush.mehta@xilinx.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210805174219.3000667-1-piyush.mehta@xilinx.com>
References: <20210805174219.3000667-1-piyush.mehta@xilinx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8b3ee291-671e-4152-d1db-08d958387b78
X-MS-TrafficTypeDiagnostic: DM8PR02MB8155:
X-Microsoft-Antispam-PRVS: <DM8PR02MB815579BDC8E579D237A1B5B1D4F29@DM8PR02MB8155.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 29+ECZR9c1MVx68hvOuPqjHARNuU7VPNJ338YZtwQ4/LymOgdlx4PKlEjHdy8kMYGGiaQfh9Zpw/A6UVxRZGzE65uTYncXEAIgiO5O89XPIVmM6TGc0KpzZZuFBKXhJnnpe1MPxhcL32rfrFhSfvh8qAwn9ibQTIeVRYuOpH2nnaHMHd2qjdhNM8zX7kr5JAbIDG0lhKE8M7EJRlPAQGiGzXw+60FnvnZSwuaTdnxnsC8scd+CYF9132unohcgB7WP2VWDOgaqj6IbvH250J4sCP5qZQYNEeXDcwxPfxxRF5tBeYgN9PWprWFz/+2OdUZ8zF3qI9LywedsaeuPrgxhbC5l5BykIszLBML5F9KNVliKRuhPw9N2hMHzhb6Dhg0xXMV9tRQ6Q/QTuSBjV2JisC2keEWAgfBFM8iNUGqHyNqrLfzFZ2mv+a7Vv1WwdQxXyoSORFpUa43sG07Eys9QPHuMh3y2WyQbhisJKxe+VWcOHmg47eSiiet/BzcpA4bWFKQPPMdWiC6GcYimTlPQLn32ES/snDXdpLiG8BckPBfOClPYT29oeZVNTL0aDCum2RxFVI4Ny8ZcZ65FA1A0X6atRM0NqTDJniuD0M8bhyHWXa9R9b7yGOJTreupCfItFefqKX+yZcpz/v+8Wll7Hdy/yWjCAlPws+b3e45T6qHHMP4ayfskKWFm09Xin2yJM7qkaz2mnju+RY3FngG7HGCdSrsHycxK/vRCJduBg+I4VGjv8M2R4xx907G6w0wB514rIuh7R9hJosgCMCZptGf3gTHRURVNy2mxwJhFAJCDw9KdGbzok1IFOOp+qLb6D5Iz+YXUu3CWmMn4kvU+Q7slLbRf5uRG3GHtl7E0Qa9bZQZsfqnGFNNYB/08vcYrrznIhGPqrAxf/GLBT64k5gmw/JCWMbksegmGxixtI=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(376002)(39850400004)(136003)(346002)(396003)(36840700001)(46966006)(7636003)(54906003)(82740400003)(36756003)(6666004)(2616005)(47076005)(7416002)(6636002)(2906002)(356005)(426003)(110136005)(82310400003)(44832011)(26005)(7696005)(921005)(316002)(70206006)(36860700001)(8676002)(83380400001)(36906005)(107886003)(70586007)(1076003)(478600001)(336012)(4326008)(5660300002)(9786002)(8936002)(186003)(966005)(102446001)(2101003)(83996005);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2021 17:43:06.1734
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b3ee291-671e-4152-d1db-08d958387b78
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0028.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR02MB8155
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
---
Changes in v2:
- Addressed review comments: Update commit message

https://lore.kernel.org/linux-arm-kernel/20210615080553.2021061-2-piyush.mehta@xilinx.com/T/#mbd1fbda813e33b19397b350bde75747c92a0d7e1
https://lore.kernel.org/linux-arm-kernel/20210615080553.2021061-2-piyush.mehta@xilinx.com/T/#me82b1444ab3776162cdb0077dfc9256365c7e736
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

