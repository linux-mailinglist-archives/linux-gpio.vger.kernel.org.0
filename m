Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E4D62EBDB3
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Jan 2021 13:28:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726059AbhAFM2Y (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 6 Jan 2021 07:28:24 -0500
Received: from mail-bn8nam12on2050.outbound.protection.outlook.com ([40.107.237.50]:40188
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726712AbhAFM2W (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 6 Jan 2021 07:28:22 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lXXLdkwm8XtOZVi1+/MMm5gJk7Uvu+Rd4uxmomX9OdIoZNLSFSfVvaFkJQ93xxVy3eHOT5OFGlNrV+m8W3WYjsrJcqkL/hS5J60YzjoXTkfwid5TLltVlQkHWRD3qLf1PeD4bPDHLW7WOu5Lq/lcf0aChPmrBhyQmj2qXlkxBYpjgbYGVLo3IYqbdXOOCMJJEhpN/fuhicMg16Rb5/p53apR+AEQwQ8QOElmRMmdEri0xeJjsSOJzb2e86AS0N6pk7lHzbsjtRNw57oj2fH5P3GDMmvQhNiBrNpSA6zxpWopi765U4VSCozYOG+EVMKJ2VjuHI7MzTtF9vulINGVLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SF6KUbrehHQHc7jVQv5ivsdfH0YzfhqyaLmhN/y8PLM=;
 b=gYAf8u1uoYQ6xPNKVIVQJDZH9C8rES2lBWal4ru+tt84MrR1SYFiGui4+sItxGdmDjldXqSlbrNIi9xb04Zsqae0oFW/ViieUpe5aRMFMwG3wiSuWIh3HQDzN4mbSDiVPAyt+QiSTTeBnyN5/lj8FFTyMxqwkkK137tLM8l0iQHU/PIB6Z8URqMUhnKdquODV592cBW1zvgwABunaJ0cNZ/bzkTXtzyf4YEziYAaVAcC3BcY9V6fJ9c6TLIZzflT3KWk5y7rjDndeilZ8gpNAT3Hgj45KMLVyMzRFTPh36yUL823DEx3rh++0AaXh44CudmolmNJ3zCJ0uY8du9hFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=linaro.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SF6KUbrehHQHc7jVQv5ivsdfH0YzfhqyaLmhN/y8PLM=;
 b=d669nWhFAEH4sK67wc5K1tQjKp0XeGy0hFXnLMwgRM7HlofT3H+isKKWYG16RJNO5qh9ndA1MPkLoZl7mB416SC1EiugQNyKFaeA0w26k/TBEfUYbYwME5MgCAsSJRBcB36w2+YcJngeYDONeCtUaflhSjIkr5RleTprPJu7xqY=
Received: from CY4PR21CA0009.namprd21.prod.outlook.com (2603:10b6:903:dd::19)
 by BYAPR02MB5925.namprd02.prod.outlook.com (2603:10b6:a03:125::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.19; Wed, 6 Jan
 2021 12:27:28 +0000
Received: from CY1NAM02FT040.eop-nam02.prod.protection.outlook.com
 (2603:10b6:903:dd:cafe::cf) by CY4PR21CA0009.outlook.office365.com
 (2603:10b6:903:dd::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.2 via Frontend
 Transport; Wed, 6 Jan 2021 12:27:28 +0000
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
 15.20.3742.6 via Frontend Transport; Wed, 6 Jan 2021 12:27:27 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Wed, 6 Jan 2021 04:27:11 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Wed, 6 Jan 2021 04:27:11 -0800
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
        id 1kx7uA-0003Ag-Ei; Wed, 06 Jan 2021 04:27:10 -0800
From:   Srinivas Neeli <srinivas.neeli@xilinx.com>
To:     <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
        <michal.simek@xilinx.com>, <shubhrajyoti.datta@xilinx.com>,
        <sgoud@xilinx.com>, <hancock@sedsystems.ca>,
        <vilhelm.gray@gmail.com>, <syednwaris@gmail.com>
CC:     <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <git@xilinx.com>,
        Srinivas Neeli <srinivas.neeli@xilinx.com>
Subject: [PATCH V4 5/5] gpio: gpio-xilinx: Add check if width exceeds 32
Date:   Wed, 6 Jan 2021 17:56:40 +0530
Message-ID: <1609936000-28378-6-git-send-email-srinivas.neeli@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1609936000-28378-1-git-send-email-srinivas.neeli@xilinx.com>
References: <1609936000-28378-1-git-send-email-srinivas.neeli@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 205fd76f-b8da-4b62-74b3-08d8b23e6e0b
X-MS-TrafficTypeDiagnostic: BYAPR02MB5925:
X-Microsoft-Antispam-PRVS: <BYAPR02MB5925BECBE8320B763E54EE73AFD00@BYAPR02MB5925.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vFoaPaafhnBxaHGOk+NW0oTCGO4GBbc2X7AecZCJiAEP1oWqcvOZ+b1bhc9F057nzWJuTgue3v/PQzqSHuLyT4IJM4ekRS1K0DnMA1h3y4hgZD1feHGvd7Kf8Edcuq85pZjGRYwWSTomLB1cVpYQCLXTfnns9xT7jo/aeXYfytGKW8ZaEumvCkx5hBw3PjXDKSLQzC0ukRzeTtup0cY2mew8JaHg6OI+ITQamQvRR0qg9SGKHUvOSo5SXPGZntdE3plAUEdRtogEWh3wHayPaTAK8BNJeXaV3v9cs2pRPQj6/zkI5xSkyPVUkbn3LOJdSjRfHeSynW4lpbkt5JdObYHJXg5ihRsUE0Bhr8a6YY8tG6XrlAtSwjb7CjMuHMLmuYXbHyhIWEwEL+emkLbarg665904hL5q/kCYat1jxCko2+lCvGtBcMK7+ujARG98CYN0nL0fFUMsm5CKb9ll0A+8h+0Gv+5gw8Mt/xNahDQe4VZEdtZhRpdC90qCaDgh
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(376002)(136003)(396003)(39860400002)(346002)(46966006)(9786002)(8676002)(8936002)(478600001)(4744005)(70206006)(107886003)(7696005)(110136005)(54906003)(316002)(5660300002)(6666004)(70586007)(47076005)(2906002)(82310400003)(44832011)(82740400003)(186003)(2616005)(83380400001)(7636003)(26005)(356005)(36756003)(426003)(336012)(4326008)(36906005)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2021 12:27:27.6236
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 205fd76f-b8da-4b62-74b3-08d8b23e6e0b
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT040.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5925
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add check to see if gpio-width property does not exceed 32.
If it exceeds then return -EINVAL.

Signed-off-by: Srinivas Neeli <srinivas.neeli@xilinx.com>
---
Changes in V4:
-New patch.
---
 drivers/gpio/gpio-xilinx.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpio/gpio-xilinx.c b/drivers/gpio/gpio-xilinx.c
index e47ae08167f8..ddec718e114c 100644
--- a/drivers/gpio/gpio-xilinx.c
+++ b/drivers/gpio/gpio-xilinx.c
@@ -591,6 +591,9 @@ static int xgpio_probe(struct platform_device *pdev)
 	if (of_property_read_u32(np, "xlnx,gpio-width", &chip->gpio_width[0]))
 		chip->gpio_width[0] = 32;
 
+	if (chip->gpio_width[0] > 32)
+		return -EINVAL;
+
 	spin_lock_init(&chip->gpio_lock);
 
 	if (of_property_read_u32(np, "xlnx,is-dual", &is_dual))
@@ -615,6 +618,8 @@ static int xgpio_probe(struct platform_device *pdev)
 					 &chip->gpio_width[1]))
 			chip->gpio_width[1] = 32;
 
+		if (chip->gpio_width[1] > 32)
+			return -EINVAL;
 	}
 
 	chip->gc.base = -1;
-- 
2.7.4

