Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD16C3D0E68
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jul 2021 14:03:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237745AbhGULVk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 21 Jul 2021 07:21:40 -0400
Received: from mail-dm6nam10on2069.outbound.protection.outlook.com ([40.107.93.69]:32992
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S238604AbhGULOT (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 21 Jul 2021 07:14:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tscy2W9EbrE7PtRtGdAF+oiLW566GHXxX1UZUbe4wHOohTYd+0CY912kxGLTkpiVYO4eoF9gZm72kJgUSkSjJUs8Zmg4HsHrVWC5IqKIgTyJ18yLtxfQRbbQg2wWSnxMiKNPLIt0/SgwPxx23dv+cdDfWy+AHqa2dVSoqdqFIXLAxM9EJub4XzbdWQYm097blbMuMqlwjhgH9E//Nott8n6OcRYxncvC8D1pMePHV1GivSNlrAx7QzZjf2NXaxmc/b9hdOYvbZtoenKiYtcQ0g75SsRoMfzz/7WyHjbdi3GhrwFiyfO9Kpon/ZTZUecVaCjxA5HKtknTb47Vw+0JUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XPVKjMqMM92v3uDtuPf4XrRmpi/gonyWH1hx059fn6s=;
 b=F91smfmEhxXNppJS5uwSyT1Ou2GVwP4MY0JmKl3UgD75SNtq+EPG9I2ajwq1QOdrm38JPS3L3GZ4cfkDqiNDcHniThGgys5/P7U5btQ7IWIJmakZ4lR/tEZDvY+kl9H5IGWXkhJ4IMgkt3cYQl4xPWBeHUkBM9maezrka8lSZz78506PP2G8b7nxuYcGhIZzpN1b6s/c0heOVlT/R7ZzK5K5DDPQ9vvswROiaia9hORWe5SdFFENfbfBPQmULLkj83eggoamg1b4GNEhc86M+D/K0gZwfWKIJc/HytcK0RpNE164ipKxR9oO3svjC9EiXeDOcOGGIgcxs0T1VfeHxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=gmail.com smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XPVKjMqMM92v3uDtuPf4XrRmpi/gonyWH1hx059fn6s=;
 b=cQ9JVRxoSJ9lZb0OGbreAH1OhN4QOVgF5T0OM+qvzRkjk0gwecWTclZ97xxoe2qMbn9TgClUYp0E6u+fNdo/OyjBX76aQP7WwxhX2koPhhOn9mp/TyZMY7o3aG2vGPymZdzxHwxIvlcmhhCahZyg1aSdNXnA5dhFsOO0KgtoLwU=
Received: from SN4PR0501CA0084.namprd05.prod.outlook.com
 (2603:10b6:803:22::22) by DM5PR02MB2380.namprd02.prod.outlook.com
 (2603:10b6:3:56::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.29; Wed, 21 Jul
 2021 11:54:53 +0000
Received: from SN1NAM02FT0056.eop-nam02.prod.protection.outlook.com
 (2603:10b6:803:22:cafe::d9) by SN4PR0501CA0084.outlook.office365.com
 (2603:10b6:803:22::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.11 via Frontend
 Transport; Wed, 21 Jul 2021 11:54:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0056.mail.protection.outlook.com (10.97.4.111) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4352.24 via Frontend Transport; Wed, 21 Jul 2021 11:54:53 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 21 Jul 2021 04:54:52 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Wed, 21 Jul 2021 04:54:52 -0700
Envelope-to: git@xilinx.com,
 saikrishna12468@gmail.com,
 robh+dt@kernel.org,
 linus.walleij@linaro.org,
 gregkh@linuxfoundation.org,
 linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
Received: from [172.23.64.106] (port=50895 helo=xhdvnc125.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <lakshmi.sai.krishna.potthuri@xilinx.com>)
        id 1m6AoN-0000zY-10; Wed, 21 Jul 2021 04:54:51 -0700
Received: by xhdvnc125.xilinx.com (Postfix, from userid 14964)
        id AFC2512175A; Wed, 21 Jul 2021 17:24:23 +0530 (IST)
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
Subject: [PATCH 2/4] dt-bindings: pinctrl-zynq: Replace 'io-standard' with 'power-source'
Date:   Wed, 21 Jul 2021 17:22:31 +0530
Message-ID: <1626868353-96475-3-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1626868353-96475-1-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
References: <1626868353-96475-1-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f0344817-34c7-4c10-0e2c-08d94c3e5a3d
X-MS-TrafficTypeDiagnostic: DM5PR02MB2380:
X-Microsoft-Antispam-PRVS: <DM5PR02MB238028BCC1CFD85FE3A422DABDE39@DM5PR02MB2380.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iOasmq0J/s2hmX4dwDIiZXAsQh3sWc6NoxsjcQDqH+Ko0PeshMLwFoe6LQ87gYXOlOmu809TIGAHKl2RmMVenqxeOl1/aIL06Ozlt3kVULj2PcIxIGDaxO5zI08Z9FaiXEBQGeIoMI0XgAT3/W70U3EpUWDkf5mtPl302DTa2lyGumtA+CC/3L8RhUTLlwnl2MlQIaYHlMsjcqWIjRgMkKqH4WlO4dRY7smZnFwiEvFlxTuVDQyFjDbCDdiraA/S+qFoxsIvDO4T0yIrnDnZc9KYRB+AF/1kbF3qIxDSvJDSghKQXODvO+7HR66yIKSMbqYWYskEo7JDUETWFVhXu0VUTGciYnFMnSXyM/jyl9xC006iS0w7Ms4AKZaQYHbAIC6fy2UNa6qhbu6jY/17sJ9jnw6K02vyb9yU9nfxyhNP3WuHXiv4HH0CyDvYGuqp7ysdrCMyuFzt8lsg8BCmNvitsuZy4/Qld7zxeP+v0aM2kdfSu522NnXXC4iQ8WcO97MTOjG1gAPDyrvO2Bn7Je9R/5aQakj2kXtyf3k6/C3etE3DUj+4s1vis+VyXDA99z1QLBm3Lqw6W1CcoeB+HbiySWUhJE/IyJf0oETTJ184idSE9FTmXMisi95h+CkhNmw3LQENC6uM7z20/fCR2+Cq+IZx1fNKpyb0wdmeqSlc9NSluMTpUqNHHvcAnhjXh+5KIyl73EmP5l2SBn4nyRIzP8InZmDDUZDJSuSQC3Q=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(39860400002)(376002)(136003)(346002)(396003)(46966006)(36840700001)(26005)(2906002)(8676002)(5660300002)(83380400001)(6266002)(6666004)(70206006)(356005)(186003)(4326008)(8936002)(70586007)(47076005)(36906005)(7636003)(110136005)(316002)(42186006)(36756003)(82310400003)(54906003)(107886003)(478600001)(336012)(82740400003)(426003)(2616005)(36860700001)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2021 11:54:53.4460
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f0344817-34c7-4c10-0e2c-08d94c3e5a3d
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0056.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB2380
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Replace custom pin configuration option 'io-standard' with generic property
'power-source' for Zynq pinctrl also add dt-binding file contains pin
configuration defines for Zynq pinctrl.

Signed-off-by: Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>
---
 .../bindings/pinctrl/xlnx,zynq-pinctrl.yaml     |  8 +++-----
 include/dt-bindings/pinctrl/pinctrl-zynq.h      | 17 +++++++++++++++++
 2 files changed, 20 insertions(+), 5 deletions(-)
 create mode 100644 include/dt-bindings/pinctrl/pinctrl-zynq.h

diff --git a/Documentation/devicetree/bindings/pinctrl/xlnx,zynq-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/xlnx,zynq-pinctrl.yaml
index 2da1969e02ec..ac97dbf6998e 100644
--- a/Documentation/devicetree/bindings/pinctrl/xlnx,zynq-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/xlnx,zynq-pinctrl.yaml
@@ -156,10 +156,7 @@ patternProperties:
           slew-rate:
             enum: [0, 1]
 
-          io-standard:
-            description:
-              Selects the IO standard for MIO pins, this is driver specific.
-            $ref: "/schemas/types.yaml#/definitions/uint32"
+          power-source:
             enum: [1, 2, 3, 4]
 
         oneOf:
@@ -179,6 +176,7 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/pinctrl/pinctrl-zynq.h>
     pinctrl0: pinctrl@700 {
        compatible = "xlnx,zynq-pinctrl";
        reg = <0x700 0x200>;
@@ -193,7 +191,7 @@ examples:
            conf {
                groups = "uart1_10_grp";
                slew-rate = <0>;
-               io-standard = <1>;
+               power-source = <IO_STANDARD_LVCMOS18>;
            };
 
            conf-rx {
diff --git a/include/dt-bindings/pinctrl/pinctrl-zynq.h b/include/dt-bindings/pinctrl/pinctrl-zynq.h
new file mode 100644
index 000000000000..bbfc345f017d
--- /dev/null
+++ b/include/dt-bindings/pinctrl/pinctrl-zynq.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * MIO pin configuration defines for Xilinx Zynq
+ *
+ * Copyright (C) 2021 Xilinx, Inc.
+ */
+
+#ifndef _DT_BINDINGS_PINCTRL_ZYNQ_H
+#define _DT_BINDINGS_PINCTRL_ZYNQ_H
+
+/* Configuration options for different power supplies */
+#define IO_STANDARD_LVCMOS18	1
+#define IO_STANDARD_LVCMOS25	2
+#define IO_STANDARD_LVCMOS33	3
+#define IO_STANDARD_HSTL	4
+
+#endif /* _DT_BINDINGS_PINCTRL_ZYNQ_H */
-- 
2.17.1

