Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DA752B0B05
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Nov 2020 18:13:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726181AbgKLRNM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Nov 2020 12:13:12 -0500
Received: from mail-bn8nam12on2045.outbound.protection.outlook.com ([40.107.237.45]:24346
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726045AbgKLRNL (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 12 Nov 2020 12:13:11 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n9NvHGxptf/9Q2wTz8NRzRS1fOzgpuazTQrGEcZz9KzJAOvMNTFnUR809eaTgMLqBBJzEFa+ReOGijduHm00nhbDDUOeO8vyLhoQazKKTGQim+0+7E5yLizv6FQ/VElYqHGZnDmb8IQ+WQMW9ahh22QEYWWiETfEsFHqHgYPfrY2aGWzvtdAdCAL8+zBYMYDyfhyPsGjNcoaRAzsKDwohsMlK9Aj8lBPAMweHlvK09wR0egJXvsEqtuZpzCPLCNy/ffx3lo8nzTm9rLwOgxbH1Hd6Mn06coFrJb0zTD7U9XB7UDZ1KWJMOeLh17ymyhFPYKe1x202v0NtUduc+MJRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KkJGtdy2JEmHYS0upJDXQBffj2eJKF8HCep+/Agskw0=;
 b=i4U16e/EDprR01xNIiZojHF9Hu9oJNrNsfGPy8dP2gQngfEBeRrb4xNhbGTLd4enAhKhqafP74clPPSlCaNr7Bmf8F5gDhihuQ5r9HvnITSRfjJD7rHxCE1SODUTvvOS/466FMrebTHZmxTYuLSoyU9P7N+kXwM22SlcmgeyuilneKCBF6h/j61Oq6ryvyQ/At1wWO8NNIneuPONlBt6RJt9Vp0oOlh/HzKY0EhJrozKLi7FdNAvpkXjuZoZTtf9kGFZWauC77dHLqgxitos0wfSzeVDBnjphuqgY+rswE79w8dZnWEsxn4mNaNs6VK168UB3hSP7hbgr5vJ6hqC7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=linaro.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KkJGtdy2JEmHYS0upJDXQBffj2eJKF8HCep+/Agskw0=;
 b=nHnDP9fp558Dg3+y3ZF4lEOyBY12SlQafb+/MMTnntVDhaqFCDatlVLoQ8fP14kH2Ty5VdBm+t35zto5LI3Avt0MTpNnE3t5ppAkXO8Rm6AxkKZCKdKyD8HF3v6PutqWEMrKsSeFCgPMMF9SiJbx6sqCFAjRMw7Zt8wrVEid9hQ=
Received: from CY4PR16CA0020.namprd16.prod.outlook.com (2603:10b6:903:102::30)
 by BY5PR02MB6738.namprd02.prod.outlook.com (2603:10b6:a03:20e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Thu, 12 Nov
 2020 17:13:01 +0000
Received: from CY1NAM02FT039.eop-nam02.prod.protection.outlook.com
 (2603:10b6:903:102:cafe::99) by CY4PR16CA0020.outlook.office365.com
 (2603:10b6:903:102::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend
 Transport; Thu, 12 Nov 2020 17:13:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT039.mail.protection.outlook.com (10.152.75.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3564.22 via Frontend Transport; Thu, 12 Nov 2020 17:13:01 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Thu, 12 Nov 2020 09:12:54 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Thu, 12 Nov 2020 09:12:54 -0800
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
        id 1kdG9V-0005SG-4t; Thu, 12 Nov 2020 09:12:53 -0800
From:   Srinivas Neeli <srinivas.neeli@xilinx.com>
To:     <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
        <michal.simek@xilinx.com>, <shubhrajyoti.datta@xilinx.com>,
        <sgoud@xilinx.com>, <hancock@sedsystems.ca>
CC:     <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <git@xilinx.com>,
        Srinivas Neeli <srinivas.neeli@xilinx.com>
Subject: [LINUX PATCH V3 6/9] gpio: gpio-xilinx: Add remove function
Date:   Thu, 12 Nov 2020 22:42:25 +0530
Message-ID: <1605201148-4508-7-git-send-email-srinivas.neeli@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1605201148-4508-1-git-send-email-srinivas.neeli@xilinx.com>
References: <1605201148-4508-1-git-send-email-srinivas.neeli@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3e5ddae3-d875-4343-35ca-08d8872e3606
X-MS-TrafficTypeDiagnostic: BY5PR02MB6738:
X-Microsoft-Antispam-PRVS: <BY5PR02MB6738FB4AD4970AE21A78911EAFE70@BY5PR02MB6738.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kFMUrnWTdV/HfpiFNxKcbgTk2H9E5Ix4tYJ9uS3EOXf2gqEmPKNHCqKLQKtMW3SMLXrD19igK9S8/9vwh4UM667QBLfUUp5Rd0NwJ/2hahdsg5PC4iYvAqD/jQjwZRIcNWHWMDrUjmJKyTxwiZ27ZTTBfYmzctvoKbkwg+4M1haWEfFXxouO+xluU4so7jBqyaW7L/TQhlMzeLRQEcuIoevvINU8bl+zBe1RZQh5QqrJx0VirkA47XjSB1p1e6Oi4bLCBBg57ahAjTpNXAWFAkwRCvk476CiRRc8g4Y48i66lWWCp8YpMAdOQGMdJ0KP8FPf0/priH5qR22YlSrBBp/YQKeRSuTP2NgYSi+exnnFKRvYbuXN9DVrvn2cFFQwVQdHs/jOJu/4KNAButfPATiiai/lgm/Pfbvevz6Bl9Q=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(396003)(376002)(39860400002)(346002)(136003)(46966005)(6666004)(82740400003)(5660300002)(8676002)(2906002)(44832011)(107886003)(36756003)(186003)(110136005)(26005)(70586007)(9786002)(316002)(70206006)(4326008)(336012)(426003)(7636003)(82310400003)(7696005)(54906003)(47076004)(478600001)(2616005)(356005)(8936002)(36906005)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2020 17:13:01.6917
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e5ddae3-d875-4343-35ca-08d8872e3606
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT039.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6738
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Added remove function support.

Signed-off-by: Srinivas Neeli <srinivas.neeli@xilinx.com>
---
Changes in V3:
-Created new patch for remove function.
---
 drivers/gpio/gpio-xilinx.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/gpio/gpio-xilinx.c b/drivers/gpio/gpio-xilinx.c
index 855550a06ded..9abef56eca32 100644
--- a/drivers/gpio/gpio-xilinx.c
+++ b/drivers/gpio/gpio-xilinx.c
@@ -453,6 +453,24 @@ static void xgpio_irqhandler(struct irq_desc *desc)
 }
 
 /**
+ * xgpio_remove - Remove method for the GPIO device.
+ * @pdev: pointer to the platform device
+ *
+ * This function remove gpiochips and frees all the allocated resources.
+ *
+ * Return: 0 always
+ */
+static int xgpio_remove(struct platform_device *pdev)
+{
+	struct xgpio_instance *gpio = platform_get_drvdata(pdev);
+
+	clk_disable_unprepare(gpio->clk);
+	pm_runtime_disable(&pdev->dev);
+
+	return 0;
+}
+
+/**
  * xgpio_of_probe - Probe method for the GPIO device.
  * @pdev: pointer to the platform device
  *
@@ -601,6 +619,7 @@ MODULE_DEVICE_TABLE(of, xgpio_of_match);
 
 static struct platform_driver xgpio_plat_driver = {
 	.probe		= xgpio_probe,
+	.remove		= xgpio_remove,
 	.driver		= {
 			.name = "gpio-xilinx",
 			.of_match_table	= xgpio_of_match,
-- 
2.7.4

