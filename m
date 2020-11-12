Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A5F12B0B09
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Nov 2020 18:13:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726215AbgKLRNV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Nov 2020 12:13:21 -0500
Received: from mail-dm6nam10on2088.outbound.protection.outlook.com ([40.107.93.88]:42177
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726200AbgKLRNU (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 12 Nov 2020 12:13:20 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ja7dkthejTbHySIFEEQom0ndZUmmoNhLSik7b1Hu7ATMUZaMO9Fbt6VP9++ee1zU+retE6VJqyhxXbiBijQnvyFdLLN384IE/pI0yD/XOHcj/lY4gfAuBP87EV9SOtuUkcYmrhkZ4IP0P3zPlTt8THVtFryHRQO18ReeADFfXEsLRdX4FhNU3+398IAka33x+cyizWZ312s1Tjr9dXhVJNnyaG8esGZKmme43UtG8RZS2l65G3M3foDsZ+2TA395wjLebKopeznHhWvO8TQvo83NjZaNF+rALBJrr4CRXpPmJRZNhq8P7mcmW8eWX56pUk41i3Ar/YkugPIkw8FKVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mmiedhJM5z71SNmvtNdM7S5v1iGKQ+1iEwYX7LAR9cs=;
 b=RZ6b0ztVbUE3QVri8gcoS1Ag0IYsuN6TgWbKzWJHH2RyGtlRl34/cgJsborIWKQ+AWxMqPKUyVGJciXWJBrtXRpHwpNaIbs+wljfDBsHgN2bF65Rbg8GVUGrufKytdz1+Rm9fntD377iJrV9kVk1kUMoPXcw3iYspZcm6XkRzb8F7tips2lVYNbaRUkUe5QHQdvMgRCMtcFICs7cDQzgK3FUZA8CwnJuPIZxmhXgtM5lZNQ8xXhjG2ZaS2QMRGP/n5xZAW5y9EythPRnwdkBXor6PAlPY6H8Gp0wCgPtPiVhDmpFlXbgGBLdYJz/M7iUTamMCfV75Bm8QACFHfPGcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=linaro.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mmiedhJM5z71SNmvtNdM7S5v1iGKQ+1iEwYX7LAR9cs=;
 b=BPzr8+JNdLc16QmIK+T9nssI2pDcpCl7LOPTvq5bBeCBpjupYK5a60ksl5HZQv8dVnfenMMpWTBI3GEyvLSyjZh0mGY5F0nuVWj1nqwhfeMpi3I/U82BowUeBcSgpXQPFTtMI1sBwOP7lvg3ODGVkrct3MYpkrp8IC7mxBYtA5U=
Received: from DM6PR18CA0029.namprd18.prod.outlook.com (2603:10b6:5:15b::42)
 by SN4PR0201MB3408.namprd02.prod.outlook.com (2603:10b6:803:50::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.25; Thu, 12 Nov
 2020 17:13:17 +0000
Received: from CY1NAM02FT040.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:15b:cafe::39) by DM6PR18CA0029.outlook.office365.com
 (2603:10b6:5:15b::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend
 Transport; Thu, 12 Nov 2020 17:13:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT040.mail.protection.outlook.com (10.152.75.135) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3564.22 via Frontend Transport; Thu, 12 Nov 2020 17:13:17 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Thu, 12 Nov 2020 09:13:03 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Thu, 12 Nov 2020 09:13:03 -0800
Envelope-to: git@xilinx.com,
 michal.simek@xilinx.com,
 linus.walleij@linaro.org,
 bgolaszewski@baylibre.com,
 hancock@sedsystems.ca,
 linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Received: from [10.140.6.6] (port=44844 helo=xhdappanad40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1kdG9e-0005SG-So; Thu, 12 Nov 2020 09:13:03 -0800
From:   Srinivas Neeli <srinivas.neeli@xilinx.com>
To:     <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
        <michal.simek@xilinx.com>, <shubhrajyoti.datta@xilinx.com>,
        <sgoud@xilinx.com>, <hancock@sedsystems.ca>
CC:     <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <git@xilinx.com>,
        Srinivas Neeli <srinivas.neeli@xilinx.com>
Subject: [LINUX PATCH V3 9/9] MAINTAINERS: add fragment for xilinx GPIO drivers
Date:   Thu, 12 Nov 2020 22:42:28 +0530
Message-ID: <1605201148-4508-10-git-send-email-srinivas.neeli@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1605201148-4508-1-git-send-email-srinivas.neeli@xilinx.com>
References: <1605201148-4508-1-git-send-email-srinivas.neeli@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9142f8be-4d42-4cee-833b-08d8872e3f52
X-MS-TrafficTypeDiagnostic: SN4PR0201MB3408:
X-Microsoft-Antispam-PRVS: <SN4PR0201MB3408A1136ECB494459824559AFE70@SN4PR0201MB3408.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:1227;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SH+p9L3EUfE8hksMZocjqyvQ8zwFGcT4BL59I2NWBpgrHR78Kue74pJRzl+AkLisfS2I+TyTlgkhDTKpiO8tPdw0TCV/lFisBKmBkYkRagW99na0W0YR1kLhr8qc+dXvv5d+4JcHmL54CX5NT+vgVHBC3kIWQ8kI8z1pTC/76eQ3yKxYD4lDxfS3iaeXuC26barE1v9LF0Y+ba0JJvlsiXhpEp330InFJJe5am3cdEYi7LH0gFIvFijenPBWypCuk8NPR6+wYjmdwSwOtsAoUKQGQTCKtE0w8oQO7rilv+Ed4+4Ozu16nLpUvw8tXkWYHrkJMFcBSFyz+tcusIp27Ur+e8uOUIHwKqDzMEAS0czOBTDddLuX/kGh81RMl8TRMVUyVfoNhlIlfAxUTV3DYnQsXHBXyhOZNBGeaevYWDE=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(136003)(376002)(346002)(396003)(39860400002)(46966005)(5660300002)(4744005)(44832011)(26005)(107886003)(7696005)(110136005)(54906003)(2616005)(82310400003)(47076004)(426003)(316002)(4326008)(36756003)(186003)(336012)(7636003)(82740400003)(356005)(9786002)(8936002)(2906002)(70206006)(478600001)(70586007)(6666004)(36906005)(8676002)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2020 17:13:17.2843
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9142f8be-4d42-4cee-833b-08d8872e3f52
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT040.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR0201MB3408
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Added entry for xilinx GPIO drivers.

Signed-off-by: Srinivas Neeli <srinivas.neeli@xilinx.com>
Acked-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
---
Changes in V3:
-None
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 87452fca5235..89a7c045a213 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19283,6 +19283,16 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/net/can/xilinx_can.txt
 F:	drivers/net/can/xilinx_can.c
 
+XILINX GPIO DRIVER
+M:	Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
+R:	Srinivas Neeli <srinivas.neeli@xilinx.com>
+R:	Michal Simek <michal.simek@xilinx.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/gpio/gpio-xilinx.txt
+F:	Documentation/devicetree/bindings/gpio/gpio-zynq.txt
+F:	drivers/gpio/gpio-xilinx.c
+F:	drivers/gpio/gpio-zynq.c
+
 XILINX SD-FEC IP CORES
 M:	Derek Kiernan <derek.kiernan@xilinx.com>
 M:	Dragan Cvetic <dragan.cvetic@xilinx.com>
-- 
2.7.4

