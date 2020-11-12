Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77F652B0AFF
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Nov 2020 18:12:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726104AbgKLRMy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Nov 2020 12:12:54 -0500
Received: from mail-mw2nam10on2069.outbound.protection.outlook.com ([40.107.94.69]:63584
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726101AbgKLRMx (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 12 Nov 2020 12:12:53 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lw+7sJhlyAJiB87hPgh6Oa+rVLd/30Z6xdGhiJuk2Z+n6EHXwhxwJutyBhTPbKuJ0Grfxg3pb/pmtrh7HH2btRJRiYinq/7Cvvg/HuQ9htuY0lHcqShMv7FNShEs0g/RccfCjaeHRh+nwOPlsEK8Nol2V0w2YBckfpl7MCDr49RaYGOOqQJxAasUyS+TUWR3qNXeGOOaNPMWe0FeOBLPg/giVL9Z1qbfxym+PeZvG6G2RtBXJbkQzAcboqEWnW/fvIz1YpLzUpUGd4HZX4u0F5wYT73Xn1TXj18A4B/gq6cvCSxWCW/Q3XoIQ6Y0Hlo9gFBm38tJ9NxRkIcZG+9NVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lBrpWzy5OSbU9TcbX4U7Nh4XXsz9bqsjf+ny5f/ibZ8=;
 b=F7uhk401skVcpDrcRAGR1agJ+3dpHkhhQzu1xGS7Fg/tY8Fe+2BmaGPu/qVk0TJOonNee3Lwz3M7QwvK0MbkKIYryiC3GR6tW+YUN2We+HTj0iyG3PVQoHrjvAjn87BncE0+vVcEE0uO6A35GDotyneX/h6/AFMdosbgdvpTsGhAw7shhm5e+VakWREoeMNvNHddV3eLyT6u0eYXpl3EZbl2lSNItqC9ogsKAWAvQEl6augXeyNtlzrvBO1IrfV/eTKaCHfOtW256t1qBniuNeSlahCBXxMHSyWO2Wc/plvkHqShKbUIxbseOn/hKTy0vEmIhOJEfkMRSW+mbBX4Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=linaro.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lBrpWzy5OSbU9TcbX4U7Nh4XXsz9bqsjf+ny5f/ibZ8=;
 b=hhsniiqy1Bvg/IxYwDjAA7JnprzLml1zCwZPHL6xLI0ynaW4A5r6r7EwLluE4wTUAjRUmfXKcfPp+IjMYkUm58KMT1McnV/2d9gvaV2+BVnmzKPd/v26aRwiKA/1uUcrYyH+dLdxRbktzpIaVaVyrK8zBTM2BHobK1bsmbvWoHA=
Received: from DM5PR08CA0027.namprd08.prod.outlook.com (2603:10b6:4:60::16) by
 SN6PR02MB4445.namprd02.prod.outlook.com (2603:10b6:805:aa::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3541.21; Thu, 12 Nov 2020 17:12:50 +0000
Received: from CY1NAM02FT019.eop-nam02.prod.protection.outlook.com
 (2603:10b6:4:60:cafe::48) by DM5PR08CA0027.outlook.office365.com
 (2603:10b6:4:60::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend
 Transport; Thu, 12 Nov 2020 17:12:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT019.mail.protection.outlook.com (10.152.75.177) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3564.22 via Frontend Transport; Thu, 12 Nov 2020 17:12:50 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Thu, 12 Nov 2020 09:12:47 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Thu, 12 Nov 2020 09:12:47 -0800
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
        id 1kdG9O-0005SG-LP; Thu, 12 Nov 2020 09:12:47 -0800
From:   Srinivas Neeli <srinivas.neeli@xilinx.com>
To:     <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
        <michal.simek@xilinx.com>, <shubhrajyoti.datta@xilinx.com>,
        <sgoud@xilinx.com>, <hancock@sedsystems.ca>
CC:     <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <git@xilinx.com>,
        Srinivas Neeli <srinivas.neeli@xilinx.com>
Subject: [LINUX PATCH V3 4/9] gpio: gpio-xilinx: Reduce spinlock array to single
Date:   Thu, 12 Nov 2020 22:42:23 +0530
Message-ID: <1605201148-4508-5-git-send-email-srinivas.neeli@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1605201148-4508-1-git-send-email-srinivas.neeli@xilinx.com>
References: <1605201148-4508-1-git-send-email-srinivas.neeli@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1f0e273b-0ea1-47e0-9873-08d8872e2f3c
X-MS-TrafficTypeDiagnostic: SN6PR02MB4445:
X-Microsoft-Antispam-PRVS: <SN6PR02MB4445C096D07EBE729F267310AFE70@SN6PR02MB4445.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b8SQvzS2fLLDW8PmtNe4X7Xz9nITSXrolklZoLVVOeOYrbBWnV1Te2376GZiHV5Z0tG1v5Dtj4aM5ojhwkozrUhWu/Dl6rAY1bWFFSADnPuSptYOHAHqhNAnxQzDE1LM7r/NPqHmal+CPBObI/woCb6ySQTnHVwidMZnRw5KPKnYwOgYDb9dom84Frk8C0mVwxDSbYiDsuKLZJ0dWXNniIrNZA7WXs0PTKXws8xT8b28bSs/7/dhx2Y6mbZLjHs+jd8CAbwPMOSAP6JcY0POX+VKoP+YDgjXeUrpN1gR/F5Qey3Lv4+r/NLIIDIjRGx4Nm5UgwUyzqAXiyEnvF+pNk2QkXz8JmUdglgqBHpuRQh/bLQVZ8R7jYpSW8rCCfl00K+/4rytaTz5fxQx6qKp1CTsjzHWepUQqMSrIP5pIEQ=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(136003)(376002)(396003)(39860400002)(346002)(46966005)(8676002)(7696005)(4326008)(426003)(70206006)(5660300002)(2616005)(6666004)(70586007)(82310400003)(336012)(82740400003)(83380400001)(44832011)(54906003)(356005)(316002)(9786002)(36756003)(186003)(478600001)(7636003)(36906005)(26005)(2906002)(8936002)(107886003)(47076004)(110136005)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2020 17:12:50.3031
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f0e273b-0ea1-47e0-9873-08d8872e2f3c
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT019.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB4445
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Changed spinlock array to single. It is preparation for irq support which
is shared between two channels that's why spinlock should be only one.

Signed-off-by: Srinivas Neeli <srinivas.neeli@xilinx.com>
---
Changes in V3:
-Created new patch for spinlock changes.
---
 drivers/gpio/gpio-xilinx.c | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/drivers/gpio/gpio-xilinx.c b/drivers/gpio/gpio-xilinx.c
index 99d603bfb6f0..69bdf1910215 100644
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
@@ -148,8 +148,7 @@ static void xgpio_set_multiple(struct gpio_chip *gc, unsigned long *mask,
 	DECLARE_BITMAP(new, 64);
 	DECLARE_BITMAP(changed, 64);
 
-	spin_lock_irqsave(&chip->gpio_lock[0], flags);
-	spin_lock(&chip->gpio_lock[1]);
+	spin_lock_irqsave(&chip->gpio_lock, flags);
 
 	bitmap_set_value(old, state[0], 0, width[0]);
 	bitmap_set_value(old, state[1], width[0], width[1]);
@@ -170,8 +169,7 @@ static void xgpio_set_multiple(struct gpio_chip *gc, unsigned long *mask,
 		xgpio_writereg(chip->regs + XGPIO_DATA_OFFSET +
 				XGPIO_CHANNEL_OFFSET, state[1]);
 
-	spin_unlock(&chip->gpio_lock[1]);
-	spin_unlock_irqrestore(&chip->gpio_lock[0], flags);
+	spin_unlock_irqrestore(&chip->gpio_lock, flags);
 }
 
 /**
@@ -190,14 +188,14 @@ static int xgpio_dir_in(struct gpio_chip *gc, unsigned int gpio)
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
@@ -221,7 +219,7 @@ static int xgpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
 	int index =  xgpio_index(chip, gpio);
 	int offset =  xgpio_offset(chip, gpio);
 
-	spin_lock_irqsave(&chip->gpio_lock[index], flags);
+	spin_lock_irqsave(&chip->gpio_lock, flags);
 
 	/* Write state of GPIO signal */
 	if (val)
@@ -236,7 +234,7 @@ static int xgpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
 	xgpio_writereg(chip->regs + XGPIO_TRI_OFFSET +
 			xgpio_regoffset(chip, gpio), chip->gpio_dir[index]);
 
-	spin_unlock_irqrestore(&chip->gpio_lock[index], flags);
+	spin_unlock_irqrestore(&chip->gpio_lock, flags);
 
 	return 0;
 }
@@ -294,8 +292,7 @@ static int xgpio_probe(struct platform_device *pdev)
 	if (of_property_read_u32(np, "xlnx,gpio-width", &chip->gpio_width[0]))
 		chip->gpio_width[0] = 32;
 
-	spin_lock_init(&chip->gpio_lock[0]);
-	spin_lock_init(&chip->gpio_lock[1]);
+	spin_lock_init(&chip->gpio_lock);
 
 	if (of_property_read_u32(np, "xlnx,is-dual", &is_dual))
 		is_dual = 0;
-- 
2.7.4

