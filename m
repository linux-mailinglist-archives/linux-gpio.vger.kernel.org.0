Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9051012AC20
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Dec 2019 13:13:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726450AbfLZMNB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 26 Dec 2019 07:13:01 -0500
Received: from mail-eopbgr760077.outbound.protection.outlook.com ([40.107.76.77]:27970
        "EHLO NAM02-CY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726741AbfLZMMv (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 26 Dec 2019 07:12:51 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=by1HFqwVqF0i0sLJ8hGxe/rN+j5Nsawu0FtBCjg2wzJfFzVzb6tpZChAYPHtzO61sYsL7CRlvA/45I6Z+bZERkEguNLNJEcDZSrhBc5jH3qKocHIH3kVzitdomS5fioriXwxDWyGnpGebnaiHHq1JFr0R5ijVw8yXaKq3GgmFJhb2zoZ6pUAR0zwDbT1HHDXEe8X9QPjDdj5c1X36vUefA+BufGrTJPEyEA/UDGHHWrVJ8wXhW2kIyDrJrCH/Odwd/QHmo0cXlVoBG3swdtOopKAjLzytBPzWLfzEC/eH/9s+xdF/rSKrSiXjIJbiHxgku38YWA0H63nSt+G4OwX+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=umcrtBgyCudVsyLsfPcgtAt4lldqfqah1ewJVSCjbqg=;
 b=FVK8osbeuNxWp+HebJN0tHc3piJzY0dY8ks9WtARlWLXE4zAa2Z+10ZOoWxXjd4l0Ts9cRbr40S8Sl6gZRYRZKeAuN2AeR4iKOXQdt2uANkOEa5icZwQYtrSHh3SrMaXE75tbBRbLlQnw5kSN8XUuYvjzgTWg/6nXopC8VnG5vEpYb+Htcv1iPbU0PiIDOAQy+v5x7CELOQSlE1flpDh+Lmvd9cIkq1BMR2TRdXYmfaB9BX4PIXMfyhFTTFugTVGfL+HP3tvBk6tHI3rVAR90nXFGOoFJ54X33gdPPFqYOY2zQNIO1b4VMZvrYJ79GxjSZvoa8rXjxXXFiEI4javDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=umcrtBgyCudVsyLsfPcgtAt4lldqfqah1ewJVSCjbqg=;
 b=YRphy+JgfgFXLdTjKtX5Bb9hDuaKfZZaJ4BFCCwW1HaMJdHbuyemkv7GrOrzxRO1cIZ2QVmdutYxTPsuXTBOBm/EbA4y9HxQOl6fCPN/m0Cwvfqw/wjeekAXrnFB6VGHyDHWjul+QG+HRsTqRE68GaFEhPv80ic79pm00ltFYUw=
Received: from SN4PR0201CA0015.namprd02.prod.outlook.com
 (2603:10b6:803:2b::25) by DM5PR02MB3735.namprd02.prod.outlook.com
 (2603:10b6:4:af::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2559.15; Thu, 26 Dec
 2019 12:12:48 +0000
Received: from CY1NAM02FT053.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e45::204) by SN4PR0201CA0015.outlook.office365.com
 (2603:10b6:803:2b::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2559.14 via Frontend
 Transport; Thu, 26 Dec 2019 12:12:48 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 CY1NAM02FT053.mail.protection.outlook.com (10.152.74.165) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2559.14
 via Frontend Transport; Thu, 26 Dec 2019 12:12:47 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1ikS0V-0003KG-6c; Thu, 26 Dec 2019 04:12:47 -0800
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1ikS0Q-0007xv-3L; Thu, 26 Dec 2019 04:12:42 -0800
Received: from xsj-pvapsmtp01 (xsj-mail.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id xBQCCdmx023033;
        Thu, 26 Dec 2019 04:12:39 -0800
Received: from [10.140.6.6] (helo=xhdappanad40.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1ikS0M-0007v9-W2; Thu, 26 Dec 2019 04:12:39 -0800
From:   Srinivas Neeli <srinivas.neeli@xilinx.com>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        michal.simek@xilinx.com, shubhrajyoti.datta@xilinx.com
Cc:     linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, git@xilinx.com
Subject: [PATCH 7/8] gpio: zynq: Add pmc gpio support
Date:   Thu, 26 Dec 2019 17:42:17 +0530
Message-Id: <1577362338-28744-8-git-send-email-srinivas.neeli@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1577362338-28744-1-git-send-email-srinivas.neeli@xilinx.com>
References: <1577362338-28744-1-git-send-email-srinivas.neeli@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83;IPV:;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(346002)(376002)(136003)(396003)(39860400002)(189003)(199004)(107886003)(356004)(6666004)(36756003)(316002)(81166006)(478600001)(2616005)(8676002)(81156014)(4326008)(6636002)(8936002)(2906002)(7696005)(70206006)(44832011)(336012)(5660300002)(186003)(70586007)(9786002)(26005)(426003);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR02MB3735;H:xsj-pvapsmtpgw01;FPR:;SPF:Pass;LANG:en;PTR:unknown-60-83.xilinx.com;MX:1;A:1;
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 29ecf231-7596-4e0c-8b3b-08d789fcebd9
X-MS-TrafficTypeDiagnostic: DM5PR02MB3735:
X-Microsoft-Antispam-PRVS: <DM5PR02MB3735CAB15373925951D5CBE0AF2B0@DM5PR02MB3735.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:773;
X-Forefront-PRVS: 02638D901B
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Kren1gaaiadNzj9OL0zHDWILMc6g1kj5+Z3EzaVarGmyXjrz9xgsGSLbejLnV/cUHeBlFHEs1BKyUnSkZI+s2RYEHwv+wp2v2EMpzbClTokm+HxRpm0uvSt/M/YznHGNFdfnOu3tQxm9OXykC87z+tcRC72NZJ5N9UGpJqGj6N51NYFxQFiO3HFRsAARv7+aVqdpzlBKoHWNhDVqJnzOvGk7JqATIti7Gjz4G6mgYU+wICifHROldHt6HVmIpGJJXKQheV2pILRCBCYxrk98Jix5XeyU9b5/A9pjIwPX/QVdD5/uXCfjGMWj88j6XU2uihRnd+dE19i+rX6e9wiZOStIgO32mKjlcNdUCXxVT3bV6XtbAwQiILSOWgVpL/wB0wZ2QENqP6t8DBaCQGET6panyQMht+F/XdvxCaUr3w1uwiStbDcBktZTa+QEH5gz
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Dec 2019 12:12:47.6600
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 29ecf231-7596-4e0c-8b3b-08d789fcebd9
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB3735
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
 drivers/gpio/gpio-zynq.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpio/gpio-zynq.c b/drivers/gpio/gpio-zynq.c
index 04e7a993be8b..674416a40117 100644
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

