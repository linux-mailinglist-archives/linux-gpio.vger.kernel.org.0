Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E36A135A0AF
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Apr 2021 16:08:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233528AbhDIOIz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Apr 2021 10:08:55 -0400
Received: from mail-eopbgr750047.outbound.protection.outlook.com ([40.107.75.47]:48238
        "EHLO NAM02-BL2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233019AbhDIOIx (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 9 Apr 2021 10:08:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iuqrnzfyagxA7yOGfAafTPCMJgx4Gcj+tXvQabJmVzsytVEMYk59P04Jn7nhrF9Ia69FMOEjy4QI4ApfknQNC8rl8KEQkRjl+xADCtOvK/5qd32SVHpBUegu8fTXpacrLT0gCelh4ayKzRSCKFnlSZ4pPIYutXxZzDcttrb9bmxtK9jwNm4cwgoSmlMpboFWDqLFzWUcQOemfIwuXrVrCz/ys1X/3MHxy0blFURtRgSx9kPCLme+po/tJxrNP0iCMxHa/iPjET3B7Px6frWeeimLo+u9ErZ9woh1FlUTUQ6Z4kLqwOBZ4CCeipfwky0j1ZaSfHtPSWlw7cRa4MbJFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mCNzw2wYH/2IVIIN3RXfystupPqj13GJMWZw5r3BkGk=;
 b=arXMysgRy5eDovWx8qzH71Lo0SKz2CjCtgoloK0H+5kOASc3BDkKxqeT/r2NLeFVHmbve7Yr8rPQLifs11bCNQUUpHl0DkxTvuuSMdQ5+/9BAm9f3S8qRqbTG+GWCj9ry0ihdrFjiWIXa1V9h8AfX8as7dZ1l6ys51BXbdBYVcZZTIUxHgs1+gkOYhNR5BYbjyLYBra8hSRRqIjp1sYAmFtWZXdVpkqPJVy/YSXMsgMVCaRh+Z2Z4Z/XI2bZzvY1NzWt8S/JLYJGoWL/jV15rQsaD7grV1TzcKUTECYy8Iy47P36VFjGSai3qOZ5zpgB2GQ19r2EmI07bmH5tONCqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=linaro.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mCNzw2wYH/2IVIIN3RXfystupPqj13GJMWZw5r3BkGk=;
 b=ALOeYLhkxfDyXCZIIZJhZCFmyEkqM/Y2pZS90hFhJWY7/9V9uYfLY3hlTePrBV8He4ieX2lxf6H7oCF+zUBum0vQ4g/+toeof+A3j6C4WIDr93fkb+2molY7Hz2PMSotc0EpvXI+R76oPQmKFk+qVKXtTDAeLcCwZLW14yb3Pw4=
Received: from CY4PR16CA0019.namprd16.prod.outlook.com (2603:10b6:903:102::29)
 by BYAPR02MB4503.namprd02.prod.outlook.com (2603:10b6:a03:56::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.16; Fri, 9 Apr
 2021 14:08:38 +0000
Received: from CY1NAM02FT058.eop-nam02.prod.protection.outlook.com
 (2603:10b6:903:102:cafe::21) by CY4PR16CA0019.outlook.office365.com
 (2603:10b6:903:102::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17 via Frontend
 Transport; Fri, 9 Apr 2021 14:08:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT058.mail.protection.outlook.com (10.152.74.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4020.17 via Frontend Transport; Fri, 9 Apr 2021 14:08:37 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Fri, 9 Apr 2021 07:08:22 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Fri, 9 Apr 2021 07:08:22 -0700
Envelope-to: git@xilinx.com,
 linus.walleij@linaro.org,
 bgolaszewski@baylibre.com,
 linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Received: from [172.23.80.241] (port=38546 helo=xhdsneeli40x.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1lUro4-0005KB-IS; Fri, 09 Apr 2021 07:08:21 -0700
From:   Srinivas Neeli <srinivas.neeli@xilinx.com>
To:     <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
        <michal.simek@xilinx.com>, <shubhrajyoti.datta@xilinx.com>,
        <sgoud@xilinx.com>
CC:     <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <git@xilinx.com>,
        Srinivas Neeli <srinivas.neeli@xilinx.com>
Subject: [PATCH 1/3] gpio: zynq: use module_platform_driver to simplify the code
Date:   Fri, 9 Apr 2021 19:38:04 +0530
Message-ID: <20210409140806.31824-2-srinivas.neeli@xilinx.com>
X-Mailer: git-send-email 2.9.1
In-Reply-To: <20210409140806.31824-1-srinivas.neeli@xilinx.com>
References: <20210409140806.31824-1-srinivas.neeli@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 888a38d7-70d1-4f7a-1af4-08d8fb60f8a5
X-MS-TrafficTypeDiagnostic: BYAPR02MB4503:
X-Microsoft-Antispam-PRVS: <BYAPR02MB4503C9DF91F9F835E1F059D8AF739@BYAPR02MB4503.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:497;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dKx85zHmvXcAGLC4otbgsommMTxFOpKkpa1YnNH2naLHOMg3DlxWZ0R6wghFFhM4svCEvBD2BVnItdYR4gVlD5VoFtfMDx+ncYHb/3izZKZxkV9Yn2TFDlBsXr2YFt08WAAWqNYFg4dCjjauEOoJlTJc7J6UumcDufzfj7Fe6KaR0XeBSc5fOT+8xH/F9KdARTikg9b7DjmLAhLmkJ4FRKT2tVKCyU7NOqd5M2XfFuomvh/rH9/+uYeMwiSPIB6YdmhUG0gD92SEYLea6aaQWvbDsx6n63iO2apImS/zSQFb5JRmtQOfovbQu4S69dqrBSIy46QhIaFhamA8C3n1pl1NpDhXviSy1VcVjzmuS2yUgaNtYJpvtPlD/FuSF9x1mYVU6WZVg1fO1R7/3VFzhh9y7Ca351NLjfV6JhEqfTaD0rghfejGgdAmcvRVBBzzQjSFyV7Jbh31YYRMoKYbKdCzWHZJZokv4bAlfcDOEr49Xft/jrudpscXhE3CROErp6RFhkQpB1x8hYEelJgB5l4DZ7+bMs2NQhw0Av9SlcDuGVn0QtFxJSc9hANzNGs4xukJ/srWHDIzumgpYSZ5iWphgWllmB9XojDLq3kQQ7hmXbU8bDufVT/y0iJPvRuizg/aSizfGyPHE0kSR8yAQf5rkq1VRZC/yJDsabaup8dbbHdspSgGiE/iDgoJeDLL
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(376002)(136003)(39860400002)(396003)(346002)(46966006)(36840700001)(83380400001)(1076003)(8936002)(2906002)(7636003)(356005)(70206006)(36756003)(47076005)(36860700001)(7696005)(9786002)(6636002)(4326008)(70586007)(336012)(316002)(107886003)(36906005)(82310400003)(44832011)(186003)(8676002)(2616005)(478600001)(54906003)(82740400003)(110136005)(6666004)(426003)(26005)(5660300002)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2021 14:08:37.9287
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 888a38d7-70d1-4f7a-1af4-08d8fb60f8a5
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT058.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4503
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

module_platform_driver() makes the code simpler by eliminating
boilerplate code.

Signed-off-by: Srinivas Neeli <srinivas.neeli@xilinx.com>
---
 drivers/gpio/gpio-zynq.c | 17 +----------------
 1 file changed, 1 insertion(+), 16 deletions(-)

diff --git a/drivers/gpio/gpio-zynq.c b/drivers/gpio/gpio-zynq.c
index 3521c1dc3ac0..bb1ac0c5cf26 100644
--- a/drivers/gpio/gpio-zynq.c
+++ b/drivers/gpio/gpio-zynq.c
@@ -1020,22 +1020,7 @@ static struct platform_driver zynq_gpio_driver = {
 	.remove = zynq_gpio_remove,
 };
 
-/**
- * zynq_gpio_init - Initial driver registration call
- *
- * Return: value from platform_driver_register
- */
-static int __init zynq_gpio_init(void)
-{
-	return platform_driver_register(&zynq_gpio_driver);
-}
-postcore_initcall(zynq_gpio_init);
-
-static void __exit zynq_gpio_exit(void)
-{
-	platform_driver_unregister(&zynq_gpio_driver);
-}
-module_exit(zynq_gpio_exit);
+module_platform_driver(zynq_gpio_driver);
 
 MODULE_AUTHOR("Xilinx Inc.");
 MODULE_DESCRIPTION("Zynq GPIO driver");
-- 
2.9.1

