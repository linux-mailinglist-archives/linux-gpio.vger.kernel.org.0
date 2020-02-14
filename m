Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 006AE15D2AC
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Feb 2020 08:16:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728977AbgBNHQS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 14 Feb 2020 02:16:18 -0500
Received: from mail-dm6nam11on2082.outbound.protection.outlook.com ([40.107.223.82]:32215
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728779AbgBNHQS (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 14 Feb 2020 02:16:18 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WbB4vN6pUq4pe0AvqtiSLxtjUxCrf7L1asLyBgCi+Hg+RAEya2PiXTeEymosYW/39vOUPNnNflRwM3mOk1wqtdjpsRGg/NvgpIDNzwxGxTTpRv7EsaGtkuYx8QgqZyTyFYD5LEitpTKdN1gkssGpUDM1aj/DjBafV8MtJAlG5HBwjr+v11cu5DjFOvkYpoTlHJ9GrZrZaz+Qvus3kj5b0+o9zzuE4Mg/MSXBOj6Au75DPnElq07X6N8qyGzcmqkNbBUZ1BA3PIgH4QfNh2iN5ZsU76jKq92q0oQpjXVKr81yW6cMNpBa2lZZTm6SK+qaBZdvCtyiGR26kpon/m+wZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sRjMKkpkUyonj62oWCWHcCtH01gsJmzRrIJ4r5lqWPY=;
 b=TSivyJFrDBHJhjIKIgSMQIg9dqjARXrKMHmhlJk3Qa3m5vdkZvOm8Z6ECo/MIb5h4pRM2c4mcg8bDQ1mCY5Dea+ddh8gax422s0SEZ6gov3u427+hEDhCoEz6yKcIBVG7lef1bE0xGZc0ChZoayV2pXyBPoOodn1YyWOfolH8xByPmcyob87ons/AUTlzdeAAXuwFgUzACb+teOtnmvELFm+VuH+9zepdvF4Jr5uooucyKSEBJtjaA3oDm2EuUe6Ow2BL5rfJ07+Ezm8P4gFzVRMdSgt+DVP6sdUmTYF+P9X2H4wzKOBNYufPohpqOA9Q4Caqqh9D3TZrBcOnChY/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sRjMKkpkUyonj62oWCWHcCtH01gsJmzRrIJ4r5lqWPY=;
 b=Us7p9ybaVVdSEyeA7ZjoIC87S8qrlaBo32HwrolvKcsP4oP8hnlAm5IYNTgXl4+TCKmcIHFdza6SspjIBG6ybDaBLFE2iJRjnQ9+L0Ae/CMt8x7EUdzLb6vHUWYTl3sIuY9Y8ve6MwbeS0ALcppMLmiAl3+fQP0GZqrQRlSEU4Y=
Received: from MN2PR02CA0023.namprd02.prod.outlook.com (2603:10b6:208:fc::36)
 by BN6PR02MB3346.namprd02.prod.outlook.com (2603:10b6:405:67::34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2707.23; Fri, 14 Feb
 2020 07:16:15 +0000
Received: from BL2NAM02FT062.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e46::208) by MN2PR02CA0023.outlook.office365.com
 (2603:10b6:208:fc::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.23 via Frontend
 Transport; Fri, 14 Feb 2020 07:16:15 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 BL2NAM02FT062.mail.protection.outlook.com (10.152.77.57) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2729.22
 via Frontend Transport; Fri, 14 Feb 2020 07:16:15 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1j2VCw-0006Hw-0K; Thu, 13 Feb 2020 23:16:14 -0800
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1j2VCq-0000Um-TE; Thu, 13 Feb 2020 23:16:08 -0800
Received: from xsj-pvapsmtp01 (smtp3.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 01E7Fw72015592;
        Thu, 13 Feb 2020 23:15:58 -0800
Received: from [10.140.6.6] (helo=xhdappanad40.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1j2VCf-0000OQ-V7; Thu, 13 Feb 2020 23:15:58 -0800
From:   Srinivas Neeli <srinivas.neeli@xilinx.com>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        michal.simek@xilinx.com, shubhrajyoti.datta@xilinx.com
Cc:     linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, git@xilinx.com
Subject: [PATCH V2 6/7] gpio: zynq: Add pmc gpio support
Date:   Fri, 14 Feb 2020 12:45:36 +0530
Message-Id: <1581664537-14386-7-git-send-email-srinivas.neeli@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1581664537-14386-1-git-send-email-srinivas.neeli@xilinx.com>
References: <1581664537-14386-1-git-send-email-srinivas.neeli@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83;IPV:;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(376002)(346002)(396003)(136003)(39860400002)(189003)(199004)(6636002)(107886003)(336012)(7696005)(426003)(2616005)(316002)(4326008)(186003)(5660300002)(26005)(44832011)(2906002)(966005)(81166006)(81156014)(8676002)(8936002)(70586007)(9786002)(478600001)(356004)(6666004)(36756003)(70206006);DIR:OUT;SFP:1101;SCL:1;SRVR:BN6PR02MB3346;H:xsj-pvapsmtpgw01;FPR:;SPF:Pass;LANG:en;PTR:unknown-60-83.xilinx.com;MX:1;A:1;
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a8910a40-bc07-4c9b-0f9a-08d7b11dc757
X-MS-TrafficTypeDiagnostic: BN6PR02MB3346:
X-Microsoft-Antispam-PRVS: <BN6PR02MB334664B0DD3D322A72BFB943AF150@BN6PR02MB3346.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-Forefront-PRVS: 03137AC81E
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gj2MOYLrarLn7vqsEILJ2VScfcmzeuMwjsyMiv4KJQRrgbeRFRZa2hdYTNIt3Jsr6ZotEQpxG4I294JEPwIGE5AwPqC9U0lJqh5NQGIqNs9qTqAKIugLgera47LrkYO+SAs8OG2C1oi+ltyT2zWFCzaLMixXMl9nKaJqFf1nfsTcJOi8V4CUnmEzEYHTV3Z63NfOl27OI6TC4guSB5xkphZH100kFm1jNptp3kIIAm0FB+bjqXwvnN949zp10+OPAxIyx09U5YvseuqLRB9a92cqCVfrVVwjx2NHfFd1csMt7vXWKr+6Q9fZ9uRjolFot2KvsL6p3V64VXbLcaRLJqI4CImwRRKvUKdChcWdpa9F5tPSKfhqQhL/d7dM7L+PFcLu8gW0lG0wtmZxgSQ+onI1Tf8qs4noE0v5uAYRFnz8Pk1un7nmFjs4JEkyNDVBOVNGtT1MzFBPZJdJQ0YHiKIvaE5G53ACcsh0ht87pYUwJfvcybHGhMZgPSxr0q7NgLg6uJ20a0HI/zQ8y2vJWQ==
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2020 07:16:15.0362
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a8910a40-bc07-4c9b-0f9a-08d7b11dc757
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR02MB3346
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>

Add PMC gpio support.
Only bank 0,1, 3 and 4 are connected to the multiplexed Input output
pins. Bank 0 and 1 to mio and bank 3 and 4 to extended multiplexed input
output pins.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Signed-off-by: Michal Simek <michal.simek@xilinx.com>
---
Versal devices are the industry's first adaptive compute acceleration platforms.
https://www.xilinx.com/support/documentation/data_sheets/ds950-versal-overview.pdf

On the Versal platform, we are using two customized GPIO controllers(IP) which were used in Zynq/ZynqMp platform.
One of them present in the Platform Management Controller(PMC) block and other in Processing System(PS) block.

In PMC_GPIO only Bank0,1,3 & 4 are enabled and in PS_GPIO only Bank 0 & 3 are enabled.

You can find more details of GPIO IP in ZynqMP TRM General Purpose I/O(Chapter-27).
https://www.xilinx.com/support/documentation/user_guides/ug1085-zynq-ultrascale-trm.pdf
---
 drivers/gpio/gpio-zynq.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpio/gpio-zynq.c b/drivers/gpio/gpio-zynq.c
index b6261a3aec55..2ddb59b242e7 100644
--- a/drivers/gpio/gpio-zynq.c
+++ b/drivers/gpio/gpio-zynq.c
@@ -23,6 +23,7 @@
 #define ZYNQ_GPIO_MAX_BANK	4
 #define ZYNQMP_GPIO_MAX_BANK	6
 #define VERSAL_GPIO_MAX_BANK	4
+#define PMC_GPIO_MAX_BANK	5
 #define VERSAL_UNUSED_BANKS	2
 
 #define ZYNQ_GPIO_BANK0_NGPIO	32
@@ -815,6 +816,20 @@ static const struct zynq_platform_data versal_gpio_def = {
 	.bank_max[3] = 57, /* Bank 3 is connected to FMIOs (32 pins) */
 };
 
+static const struct zynq_platform_data pmc_gpio_def = {
+	.label = "pmc_gpio",
+	.ngpio = 116,
+	.max_bank = PMC_GPIO_MAX_BANK,
+	.bank_min[0] = 0,
+	.bank_max[0] = 25, /* 0 to 25 are connected to MIOs (26 pins) */
+	.bank_min[1] = 26,
+	.bank_max[1] = 51, /* Bank 1 are connected to MIOs (26 pins) */
+	.bank_min[3] = 52,
+	.bank_max[3] = 83, /* Bank 3 is connected to EMIOs (32 pins) */
+	.bank_min[4] = 84,
+	.bank_max[4] = 115, /* Bank 4 is connected to EMIOs (32 pins) */
+};
+
 static const struct zynq_platform_data zynqmp_gpio_def = {
 	.label = "zynqmp_gpio",
 	.quirks = GPIO_QUIRK_DATA_RO_BUG,
@@ -853,6 +868,7 @@ static const struct of_device_id zynq_gpio_of_match[] = {
 	{ .compatible = "xlnx,zynq-gpio-1.0", .data = &zynq_gpio_def },
 	{ .compatible = "xlnx,zynqmp-gpio-1.0", .data = &zynqmp_gpio_def },
 	{ .compatible = "xlnx,versal-gpio-1.0", .data = &versal_gpio_def },
+	{ .compatible = "xlnx,pmc-gpio-1.0", .data = &pmc_gpio_def },
 	{ /* end of table */ }
 };
 MODULE_DEVICE_TABLE(of, zynq_gpio_of_match);
-- 
2.7.4

