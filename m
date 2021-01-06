Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 066E82EBDB4
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Jan 2021 13:28:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726705AbhAFM2U (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 6 Jan 2021 07:28:20 -0500
Received: from mail-bn8nam12on2087.outbound.protection.outlook.com ([40.107.237.87]:40161
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726576AbhAFM2S (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 6 Jan 2021 07:28:18 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j5qTvGWKFRQN5RSOfk6F3LCSBk8UK8CfhxvIK6b8vShU8pA9vQ7CUBmKEgSBBrGzBWicn66y0O7ksKzbL/Z+A22jBZR0gyfRTku1zOJ3aLsYDuiMkWFrn7y0Gxi/chJu+ja7f39SZjM6mALRN84KdUNUdZd2VN008x3zpYhzyR18RtLK1DyQSVXB2juhy2QLLZLMTQ2OMrZI43QIuKY/y4s+J+etplXbEelWRH48mBHaTRjdw2mbC2NCu07fjnkvI2PntoUyVznu4IYOJ0B+Gn0zKWmoXe1sefDspys6H+4Z+tzwSY4BNXh4fELjKTu2HpWDhXcC2eQ8rT+a2eeiMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y7FKHvOzNV9IIL9cHUuJWuxtHtej8HeBypt6olXANf8=;
 b=G3xWJ8j4Khy5pXuhwqNnFv7o94a+pgresuc0fZqQ5iQUoG4i4mmDIs1VtNuWH/IITwke7lrBN3TbTR2Ilj6s0PVJi1YlCbZ4fgR8FOIA0cbzFGasZTMIcXYbllIskdUa1m00vHJ5vOkocPGJjLXwC6mN9QBnPIYve8BVXP2mAzN1tTB8IEmYfhPLE3vpDuhtyyqLFKnh3VPsQVKRsLBPMXaBdQH08r5i3pDVQaQ/vuAYyVR0dFQazNecYwj0sIMTte4Q3CEn3uiBYHKFLwgFy6CIlTNehqnn2v0sP7dx7LqqHeuIWcIJ38dfYeLg0UGaDQGJib1JhfE0TbKAQPTcuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=linaro.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y7FKHvOzNV9IIL9cHUuJWuxtHtej8HeBypt6olXANf8=;
 b=gqmU07AjLOB+DNlVneZ2Fvb/L7+6FYk+EU4cHh2UzdLvnd39Km0u8cX//GWJp5dIsMeE2eEK5xCbSlKXT8CIq3sOKJEJHW6jTLR5D0VWEAmsfPonhgiQdkRhUYQabjpocqpfAgm0U91b/GZeEULPamBrBq/ygLr/tk5si2JWrc4=
Received: from CY4PR18CA0069.namprd18.prod.outlook.com (2603:10b6:903:13f::31)
 by PH0PR02MB7719.namprd02.prod.outlook.com (2603:10b6:510:4e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Wed, 6 Jan
 2021 12:27:25 +0000
Received: from CY1NAM02FT003.eop-nam02.prod.protection.outlook.com
 (2603:10b6:903:13f:cafe::f4) by CY4PR18CA0069.outlook.office365.com
 (2603:10b6:903:13f::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend
 Transport; Wed, 6 Jan 2021 12:27:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT003.mail.protection.outlook.com (10.152.74.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3742.6 via Frontend Transport; Wed, 6 Jan 2021 12:27:25 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Wed, 6 Jan 2021 04:26:58 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Wed, 6 Jan 2021 04:26:58 -0800
Envelope-to: git@xilinx.com,
 michal.simek@xilinx.com,
 linus.walleij@linaro.org,
 bgolaszewski@baylibre.com,
 hancock@sedsystems.ca,
 vilhelm.gray@gmail.com,
 syednwaris@gmail.com,
 linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Received: from [10.140.6.6] (port=49550 helo=xhdappanad40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1kx7tx-0003Ag-1W; Wed, 06 Jan 2021 04:26:57 -0800
From:   Srinivas Neeli <srinivas.neeli@xilinx.com>
To:     <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
        <michal.simek@xilinx.com>, <shubhrajyoti.datta@xilinx.com>,
        <sgoud@xilinx.com>, <hancock@sedsystems.ca>,
        <vilhelm.gray@gmail.com>, <syednwaris@gmail.com>
CC:     <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <git@xilinx.com>,
        Srinivas Neeli <srinivas.neeli@xilinx.com>
Subject: [PATCH V4 2/5] gpio: gpio-xilinx: Reduce spinlock array to array
Date:   Wed, 6 Jan 2021 17:56:37 +0530
Message-ID: <1609936000-28378-3-git-send-email-srinivas.neeli@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1609936000-28378-1-git-send-email-srinivas.neeli@xilinx.com>
References: <1609936000-28378-1-git-send-email-srinivas.neeli@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 778765b8-86a9-4a1d-8a07-08d8b23e6ca3
X-MS-TrafficTypeDiagnostic: PH0PR02MB7719:
X-Microsoft-Antispam-PRVS: <PH0PR02MB7719EDDBA75D348D6C36BA1BAFD00@PH0PR02MB7719.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GZE36DtIXn/NEBZ09wZ+C84ZYLHzn+3By6vQI/CKVZAJaB9/t8Zn94A7XO+mTrVwCyJ47hD/Ah+0uoxbWp8Wore0NW/7yXq417oq2PHGICOMZHeCilvsO1iaagrxCaCVcNeOL0qOS3RX9qqR2zbyyPVKx8VUVDX18j4i5O5FxMhuL79moietTE7Blsr81d0plnIWgglfDlM6ug5WofruJc7tvd1KzIIRuWufXHu/27zF88D9nJHqqB++qnajdx1XNeyHprIlGMALngwandgmms16QQhIrnhGEe4aNtPoHGRVn7TO6YzleQyDRoFtxTgFnJtPORphjNYuJzc22rZ+KezE/j2dmElMh6zgTZfilINtFduIKb2HbEReseAbXXAIIkyxfTCVhrjWxM6Zkkk06MtJSLXggAQ3VG/2ZWbXbJl1uJ23JlvMVaUhG00PtCw4rsrPaGHQFl2KZWXY1eGecDE0JJvdxByEpxsZtkpZWmFktAe4RnW1in2JPzAzJz5S
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(346002)(396003)(39860400002)(136003)(376002)(46966006)(36756003)(4326008)(316002)(110136005)(36906005)(7636003)(82310400003)(54906003)(356005)(83380400001)(5660300002)(8936002)(2906002)(9786002)(47076005)(107886003)(6666004)(70586007)(336012)(70206006)(2616005)(426003)(478600001)(26005)(82740400003)(44832011)(186003)(8676002)(7696005)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2021 12:27:25.2659
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 778765b8-86a9-4a1d-8a07-08d8b23e6ca3
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT003.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB7719
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Changed spinlock array to single. It is preparation for irq support which
is shared between two channels that's why spinlock should be only one.

Signed-off-by: Srinivas Neeli <srinivas.neeli@xilinx.com>
---
Changes in V4:
-None.
Changes in V3:
-Created new patch for spinlock changes.
---
 drivers/gpio/gpio-xilinx.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/drivers/gpio/gpio-xilinx.c b/drivers/gpio/gpio-xilinx.c
index d010a63d5d15..f88db56543c2 100644
--- a/drivers/gpio/gpio-xilinx.c
+++ b/drivers/gpio/gpio-xilinx.c
@@ -47,7 +47,7 @@ struct xgpio_instance {
 	unsigned int gpio_width[2];
 	u32 gpio_state[2];
 	u32 gpio_dir[2];
-	spinlock_t gpio_lock[2];
+	spinlock_t gpio_lock;	/* For serializing operations */
 	struct clk *clk;
 };
 
@@ -113,7 +113,7 @@ static void xgpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 	int index =  xgpio_index(chip, gpio);
 	int offset =  xgpio_offset(chip, gpio);
 
-	spin_lock_irqsave(&chip->gpio_lock[index], flags);
+	spin_lock_irqsave(&chip->gpio_lock, flags);
 
 	/* Write to GPIO signal and set its direction to output */
 	if (val)
@@ -124,7 +124,7 @@ static void xgpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 	xgpio_writereg(chip->regs + XGPIO_DATA_OFFSET +
 		       xgpio_regoffset(chip, gpio), chip->gpio_state[index]);
 
-	spin_unlock_irqrestore(&chip->gpio_lock[index], flags);
+	spin_unlock_irqrestore(&chip->gpio_lock, flags);
 }
 
 /**
@@ -144,7 +144,7 @@ static void xgpio_set_multiple(struct gpio_chip *gc, unsigned long *mask,
 	int index = xgpio_index(chip, 0);
 	int offset, i;
 
-	spin_lock_irqsave(&chip->gpio_lock[index], flags);
+	spin_lock_irqsave(&chip->gpio_lock, flags);
 
 	/* Write to GPIO signals */
 	for (i = 0; i < gc->ngpio; i++) {
@@ -155,9 +155,9 @@ static void xgpio_set_multiple(struct gpio_chip *gc, unsigned long *mask,
 			xgpio_writereg(chip->regs + XGPIO_DATA_OFFSET +
 				       index * XGPIO_CHANNEL_OFFSET,
 				       chip->gpio_state[index]);
-			spin_unlock_irqrestore(&chip->gpio_lock[index], flags);
+			spin_unlock_irqrestore(&chip->gpio_lock, flags);
 			index =  xgpio_index(chip, i);
-			spin_lock_irqsave(&chip->gpio_lock[index], flags);
+			spin_lock_irqsave(&chip->gpio_lock, flags);
 		}
 		if (__test_and_clear_bit(i, mask)) {
 			offset =  xgpio_offset(chip, i);
@@ -171,7 +171,7 @@ static void xgpio_set_multiple(struct gpio_chip *gc, unsigned long *mask,
 	xgpio_writereg(chip->regs + XGPIO_DATA_OFFSET +
 		       index * XGPIO_CHANNEL_OFFSET, chip->gpio_state[index]);
 
-	spin_unlock_irqrestore(&chip->gpio_lock[index], flags);
+	spin_unlock_irqrestore(&chip->gpio_lock, flags);
 }
 
 /**
@@ -190,14 +190,14 @@ static int xgpio_dir_in(struct gpio_chip *gc, unsigned int gpio)
 	int index =  xgpio_index(chip, gpio);
 	int offset =  xgpio_offset(chip, gpio);
 
-	spin_lock_irqsave(&chip->gpio_lock[index], flags);
+	spin_lock_irqsave(&chip->gpio_lock, flags);
 
 	/* Set the GPIO bit in shadow register and set direction as input */
 	chip->gpio_dir[index] |= BIT(offset);
 	xgpio_writereg(chip->regs + XGPIO_TRI_OFFSET +
 		       xgpio_regoffset(chip, gpio), chip->gpio_dir[index]);
 
-	spin_unlock_irqrestore(&chip->gpio_lock[index], flags);
+	spin_unlock_irqrestore(&chip->gpio_lock, flags);
 
 	return 0;
 }
@@ -221,7 +221,7 @@ static int xgpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
 	int index =  xgpio_index(chip, gpio);
 	int offset =  xgpio_offset(chip, gpio);
 
-	spin_lock_irqsave(&chip->gpio_lock[index], flags);
+	spin_lock_irqsave(&chip->gpio_lock, flags);
 
 	/* Write state of GPIO signal */
 	if (val)
@@ -236,7 +236,7 @@ static int xgpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
 	xgpio_writereg(chip->regs + XGPIO_TRI_OFFSET +
 			xgpio_regoffset(chip, gpio), chip->gpio_dir[index]);
 
-	spin_unlock_irqrestore(&chip->gpio_lock[index], flags);
+	spin_unlock_irqrestore(&chip->gpio_lock, flags);
 
 	return 0;
 }
@@ -312,7 +312,7 @@ static int xgpio_probe(struct platform_device *pdev)
 	if (of_property_read_u32(np, "xlnx,gpio-width", &chip->gpio_width[0]))
 		chip->gpio_width[0] = 32;
 
-	spin_lock_init(&chip->gpio_lock[0]);
+	spin_lock_init(&chip->gpio_lock);
 
 	if (of_property_read_u32(np, "xlnx,is-dual", &is_dual))
 		is_dual = 0;
@@ -336,7 +336,6 @@ static int xgpio_probe(struct platform_device *pdev)
 					 &chip->gpio_width[1]))
 			chip->gpio_width[1] = 32;
 
-		spin_lock_init(&chip->gpio_lock[1]);
 	}
 
 	chip->gc.base = -1;
-- 
2.7.4

