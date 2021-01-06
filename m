Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8FE52EBDAC
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Jan 2021 13:28:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726503AbhAFM2K (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 6 Jan 2021 07:28:10 -0500
Received: from mail-bn8nam11on2074.outbound.protection.outlook.com ([40.107.236.74]:56033
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726500AbhAFM2J (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 6 Jan 2021 07:28:09 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZcAKfpzEXdT8AQvCj/pV0B7luKbNZ1YzOFieshzKXWP7a5MQ/H8iQfvHaUJWw284QvHGa19eYUsDDGKuGR8r3oB70mrpxom+Sfawnjk3vN/qkp0ikadJCRt4/0LKagQ5oFeK02FPUU0zm5LudKzJUcVpnI2NQP/uKAJcD/S1niBaAd8l2Djgi282Z51/r8WdhDNVcYksgl4rG51xUtH36gT1vLvU3KZOfD0D6Sw6LWl3dReVc1Qj25cBe3d6eJZEbwhSOk432HmpIdwhNDeTaDgpIdxk0AuZi8tPoU686ztNVbKlKdh8eyeXlWS85jQD7U6LXQZKYPJhDnUFW99aoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cYMxmvGJ5x9OjrHd/y1TNjqkM8TH/6gVN5QVjHzucqI=;
 b=S4ZZp6IkdxEJmI/vrDYhKSb5HUaX0KN6zubsDmPLeP+GQf2FUlXXTJuaSgehR/UkdyBzVYXWR4Ir2BdfkIF6lD272Gsj2ZLeu9vQLYow+ZKhUBMEMipPUXkMcdNOYvM+kqAgDEX6qQxTBIVMUwF2vONpEDG/5mMRI0Qva0TXJHvHwSdrwfuE+zslUUzYcbo5tjQ0KBWdsPGlmtmPgx/M3xNrbJVnzHligxPBThS+2wgpEK0o2cUMu9gjxz0bqzohrUPt27eB+Fz4fNYPMZsx+lXoDg3/wyKmgwJRvHXeIspg+c8ZZ/J+7Pv+94HUgi26bXH44cwNUNPiaa8WgThOsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=linaro.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cYMxmvGJ5x9OjrHd/y1TNjqkM8TH/6gVN5QVjHzucqI=;
 b=eCBndZE05Se+3mCO/9Km8Lx3csV4elh1sHVIAqmOA1LFdqTghq2Lk2/gDciQu1e/kmRxojKqgt/nUuQfndsfTEH0CfybJnbnpmSvqxw9oEhuGm2oSv1auyIcZM4L09H0bgIA14feP3RG6ztN3iKTFW8uHc8pTmDtfBien9v/i0Y=
Received: from CY4PR1201CA0005.namprd12.prod.outlook.com
 (2603:10b6:910:16::15) by BN6PR02MB2497.namprd02.prod.outlook.com
 (2603:10b6:404:55::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.23; Wed, 6 Jan
 2021 12:27:15 +0000
Received: from CY1NAM02FT032.eop-nam02.prod.protection.outlook.com
 (2603:10b6:910:16:cafe::b3) by CY4PR1201CA0005.outlook.office365.com
 (2603:10b6:910:16::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend
 Transport; Wed, 6 Jan 2021 12:27:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT032.mail.protection.outlook.com (10.152.75.184) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3742.6 via Frontend Transport; Wed, 6 Jan 2021 12:27:14 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Wed, 6 Jan 2021 04:26:54 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Wed, 6 Jan 2021 04:26:54 -0800
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
        id 1kx7ts-0003Ag-UU; Wed, 06 Jan 2021 04:26:53 -0800
From:   Srinivas Neeli <srinivas.neeli@xilinx.com>
To:     <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
        <michal.simek@xilinx.com>, <shubhrajyoti.datta@xilinx.com>,
        <sgoud@xilinx.com>, <hancock@sedsystems.ca>,
        <vilhelm.gray@gmail.com>, <syednwaris@gmail.com>
CC:     <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <git@xilinx.com>,
        Srinivas Neeli <srinivas.neeli@xilinx.com>
Subject: [PATCH V4 1/5] gpio: gpio-xilinx: Simplify with dev_err_probe()
Date:   Wed, 6 Jan 2021 17:56:36 +0530
Message-ID: <1609936000-28378-2-git-send-email-srinivas.neeli@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1609936000-28378-1-git-send-email-srinivas.neeli@xilinx.com>
References: <1609936000-28378-1-git-send-email-srinivas.neeli@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 34d99ad8-2453-4632-76df-08d8b23e663c
X-MS-TrafficTypeDiagnostic: BN6PR02MB2497:
X-Microsoft-Antispam-PRVS: <BN6PR02MB24973A891EFA0F4417CBAF6CAFD00@BN6PR02MB2497.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:1091;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ELeJMZDaQtZyAgyWhFlKK2825QVu2EoEKNJghOpNODIALrAbyhTBa4GIavXdeDDXEsnlOYtsijP7SOAoDTm2oYmwKLJ6yIuF0zRail3PhRrrDjFtTRSNMNcMzJrbayBKyCA2erx80VU0rDQBRlYzgbERSHJxYrjN2joqXunpWQjlisGRhwXOrHEqwJQC9XvnBl+B5naUMu7ImBk+dzeUnaTm8/YpbPXD6prH58JuJRkwjyGPtKxlTAveYC6hVuaVgcWu4D+qiKv+9hZJ313DUsuvwcZShS8/48fs1/I4Ib8q+j0OYgo3daDLnnTizs+EtMwqa8BbuHNKQZnsbueD8KFblr7VibL+425TRA0GXgXkV1hhmVOzao9oPKlE6u+e/A2GHz45xpz3JM5Dxigg69noezs/adTFwUHFDPf40KO7yEEBU5ryoZi5NoT99OI4yX7tEG5UljzqnFZGBIpzW2sMXY28tmv0ItKIGl3v+1D+9f0e3XOhbrZkYbk0yGIi
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(396003)(376002)(136003)(346002)(39860400002)(46966006)(70586007)(426003)(44832011)(70206006)(2616005)(7696005)(4326008)(47076005)(26005)(186003)(2906002)(8936002)(9786002)(5660300002)(107886003)(83380400001)(54906003)(478600001)(82310400003)(4744005)(8676002)(110136005)(316002)(356005)(36906005)(6666004)(7636003)(82740400003)(336012)(36756003)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2021 12:27:14.5260
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 34d99ad8-2453-4632-76df-08d8b23e663c
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT032.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR02MB2497
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Common pattern of handling deferred probe can be simplified with
dev_err_probe(). Less code and also it prints the error value.

Signed-off-by: Srinivas Neeli <srinivas.neeli@xilinx.com>
---
Changes in V4:
-New patch
---
 drivers/gpio/gpio-xilinx.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-xilinx.c b/drivers/gpio/gpio-xilinx.c
index be539381fd82..d010a63d5d15 100644
--- a/drivers/gpio/gpio-xilinx.c
+++ b/drivers/gpio/gpio-xilinx.c
@@ -357,11 +357,8 @@ static int xgpio_probe(struct platform_device *pdev)
 	}
 
 	chip->clk = devm_clk_get_optional(&pdev->dev, NULL);
-	if (IS_ERR(chip->clk)) {
-		if (PTR_ERR(chip->clk) != -EPROBE_DEFER)
-			dev_dbg(&pdev->dev, "Input clock not found\n");
-		return PTR_ERR(chip->clk);
-	}
+	if (IS_ERR(chip->clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(chip->clk), "input clock not found.\n");
 
 	status = clk_prepare_enable(chip->clk);
 	if (status < 0) {
-- 
2.7.4

