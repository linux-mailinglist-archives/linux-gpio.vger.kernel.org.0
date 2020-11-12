Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C4FD2B0B07
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Nov 2020 18:13:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726194AbgKLRNN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Nov 2020 12:13:13 -0500
Received: from mail-dm6nam12on2067.outbound.protection.outlook.com ([40.107.243.67]:24290
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726174AbgKLRNM (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 12 Nov 2020 12:13:12 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cjKUww2L7xFSfPO4KpmCg1kwKc2PCiGuzOOp7R5liRFbVkjCBRAEGX6B9cXz0mL3PzjM19eeLZkq1UvMo81T3n0BY3HzTCYMH4CqW99346VMU/cpYOn/olehSQog17KV3BS9GwD+m4atOT7rjsE9IBowFX0nlJ2sUC6gXGdDtSzgcbxkDVP42nz64ROaHHFpO4Xg6hUvuyu+VzwW3k8FfGovGRE58Bdq8zvGONuGGGN0nYReOuHBHkx98wQGn1DG4TvFJWkpoT+mA7pQeJm3kXC7u2DXwurNXmPpNuH7OBj2QvVlYgXk66r8JFliebII4q5qlqKMzrJ+6mCBZPCLbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EJxhm/D4rWyKRNGaxq/cZ4cBPRe3gdRgGXW3kzhFq7g=;
 b=Rnld35krB5sa78JyqMfIGRaMUgghI7WMlxvahxITyk1PN8uyzqr0/PKD6bHbmhBbYlQvmzbOJwfVNwwpkC0Byea+a4uJYK+DRuH3ZYLOTxdSyuPEgLmatWjzdf1j2WwYuqSAEmi21DDXBGU3T4FuoMiPXZd9QkYGb1VXK3hqsubs5efyeKKsIMeb5Akk3AeZRIVYBbYtuShp/Il/Hw4ZPRiLQwNXgYLVaKsdF/E5R/bYgM2Udfzt/hvXuteSlQjJdZc19txqPCjVwIEGldWhnibWBOK7/tnNvWTQp8kye/cPSRb9zUtHSZdoXpXxVshhXYkoQPaqpMccMlr2BIzg1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=linaro.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EJxhm/D4rWyKRNGaxq/cZ4cBPRe3gdRgGXW3kzhFq7g=;
 b=rndhvSDxNyvi6U6I1twGnYkfcGxT70X65y5DF9mwp0lngDVqu5EdlL2JQ6kfsqpBLKmWuzEiaLHDhTyl1ehB+t3uJ9SXlCaBTUQfseZjgDuxPfjWzWlCqsRC4QhSS5KrOWsIb8TPGWLw+3eV5CwUPYyomTRCkdeG7r3POgqZWLo=
Received: from DM6PR18CA0012.namprd18.prod.outlook.com (2603:10b6:5:15b::25)
 by BL0PR02MB4546.namprd02.prod.outlook.com (2603:10b6:208:26::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.22; Thu, 12 Nov
 2020 17:13:09 +0000
Received: from CY1NAM02FT040.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:15b:cafe::e7) by DM6PR18CA0012.outlook.office365.com
 (2603:10b6:5:15b::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend
 Transport; Thu, 12 Nov 2020 17:13:09 +0000
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
 15.20.3564.22 via Frontend Transport; Thu, 12 Nov 2020 17:13:09 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Thu, 12 Nov 2020 09:13:00 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Thu, 12 Nov 2020 09:13:00 -0800
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
        id 1kdG9b-0005SG-Ku; Thu, 12 Nov 2020 09:13:00 -0800
From:   Srinivas Neeli <srinivas.neeli@xilinx.com>
To:     <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
        <michal.simek@xilinx.com>, <shubhrajyoti.datta@xilinx.com>,
        <sgoud@xilinx.com>, <hancock@sedsystems.ca>
CC:     <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <git@xilinx.com>,
        Srinivas Neeli <srinivas.neeli@xilinx.com>
Subject: [LINUX PATCH V3 8/9] gpio: gpio-xilinx: Check return value of of_property_read_u32
Date:   Thu, 12 Nov 2020 22:42:27 +0530
Message-ID: <1605201148-4508-9-git-send-email-srinivas.neeli@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1605201148-4508-1-git-send-email-srinivas.neeli@xilinx.com>
References: <1605201148-4508-1-git-send-email-srinivas.neeli@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5652fa75-e69e-43b1-e6dd-08d8872e3a91
X-MS-TrafficTypeDiagnostic: BL0PR02MB4546:
X-Microsoft-Antispam-PRVS: <BL0PR02MB4546E2FE09FE1B7B50F69FC2AFE70@BL0PR02MB4546.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0bACEIno8ZVXU/K1M3jf0kTZbyD9wrXTfqA6CvKrVyL3YWHYgk2jLyL63fO39dE3c/sFbb2dOr3PcHk6TqEeX4Or8Q6Z9OH35ftGYWa7GyqX6LMrD3x5OpPs9kDc5BTsYpilTQwbNoHUwAC3C4FIq8jKACBdBTYNwFxbNJIm0dobWNsF7havVQ3bstK7t2a0R3larclOeyHQJ3A76TU22NCKNSa1+77nY8mWp+iN+NMOsltYZ/yNqSayVrdjm97SPtz/nSf96q0a53kBYWcb9uIbefuNeC1DsLFZ/FhZ4jWwYOsFhO71op/nb7883+/m2HnHV1ezm92RHT+JEn3m2IhplvOmG81sD4+4qAoEvODDeqt7LwlDXfX+clGD930afhN8IjxXG7vdd+Jou+cMnJoa+/cAZhy6A3xKMFdjkhI=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(136003)(376002)(346002)(39860400002)(396003)(46966005)(336012)(7636003)(83380400001)(82740400003)(6666004)(47076004)(316002)(70206006)(186003)(7696005)(82310400003)(2906002)(70586007)(5660300002)(356005)(478600001)(9786002)(26005)(107886003)(8936002)(54906003)(4326008)(36906005)(110136005)(426003)(8676002)(36756003)(44832011)(2616005)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2020 17:13:09.3181
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5652fa75-e69e-43b1-e6dd-08d8872e3a91
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT040.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB4546
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

In two different instances the return value of "of_property_read_u32"
API was neither captured nor checked.
Fixed it by capturing the return value and then checking for any error.

Addresses-Coverity: "check_return"
Signed-off-by: Srinivas Neeli <srinivas.neeli@xilinx.com>
---
Changes in V3:
-Created new patch to fix coverity warnings.
---
 drivers/gpio/gpio-xilinx.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-xilinx.c b/drivers/gpio/gpio-xilinx.c
index 48f2a6c894f5..8a5f0a0265e6 100644
--- a/drivers/gpio/gpio-xilinx.c
+++ b/drivers/gpio/gpio-xilinx.c
@@ -569,7 +569,8 @@ static int xgpio_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, chip);
 
 	/* Update GPIO state shadow register with default value */
-	of_property_read_u32(np, "xlnx,dout-default", &chip->gpio_state[0]);
+	if (of_property_read_u32(np, "xlnx,dout-default", &chip->gpio_state[0]))
+		chip->gpio_state[0] = 0x0;
 
 	/* Update GPIO direction shadow register with default value */
 	if (of_property_read_u32(np, "xlnx,tri-default", &chip->gpio_dir[0]))
@@ -593,8 +594,9 @@ static int xgpio_probe(struct platform_device *pdev)
 
 	if (is_dual) {
 		/* Update GPIO state shadow register with default value */
-		of_property_read_u32(np, "xlnx,dout-default-2",
-				     &chip->gpio_state[1]);
+		if (of_property_read_u32(np, "xlnx,dout-default-2",
+					 &chip->gpio_state[1]))
+			chip->gpio_state[1] = 0x0;
 
 		/* Update GPIO direction shadow register with default value */
 		if (of_property_read_u32(np, "xlnx,tri-default-2",
-- 
2.7.4

