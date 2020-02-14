Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D457115D2AE
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Feb 2020 08:16:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728779AbgBNHQV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 14 Feb 2020 02:16:21 -0500
Received: from mail-dm6nam12on2070.outbound.protection.outlook.com ([40.107.243.70]:8015
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728975AbgBNHQS (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 14 Feb 2020 02:16:18 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KEQ8eMlQyqPCZzhnB5zA+XiYW+lrIA8SX7AdVzraQzbcs+RUWG5IJOA82DkUZniacjvvvw2CVdeS2FBK/+Hw2Ze0koXFdtAqS1Vp35JkgpX3Sc6P5ou3yhuxkQGaTwDlT80CP+5mDAGlqrgsNNRVvlMKPRk6o+AQyLEmEed6pHEN8Td3q4hyDtaOqGa9XZHjza4QNSdbmyih9X+htUOe7FR1XaTVr8CSxK/TEPkxxbx1YN54002eWHfI+GgbncLM75Zqn7ifpaZj7xnK/GDa2Vd7QQzcYMFg25wvCWzBlevBjxxji+It9o7dGJj18G4QDYTUQDx59FzkwHC1iARc3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LQz9KqmcLaeruV4C2BriXBrjty1fuGu0xbZU8uSeooM=;
 b=iOxn+WmcrpBKDgZGX+mwachg3yO5NbIc6wrn6MDiU+T4Iq7Lm09nvl/sfIHW4mAGyRyP4ecn5CBTznB+CgXuziY9NnJJ5IcAHsbyuhnnblUTvKwZRrgS9oywvDGP2QUVteKuDGNL49hGzfUPihXf9ZEgAb0XTASCs9948L5HD1dBRCJXcCrRQlyVnWzQwdj0txNqUBoa2DiVKj3oQHITB6gS/dJ8WfZtZc0tqYlC4y2Q653OwXkm82inTX45yB4cFMWSF/4AQfqdEAiU5IbqzBdQXKVG8dy6jWrW2QfAqUNgEA0Q6MUXxjbhG/cojfFCAnuSpRuPND6ESyIPRL2MVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LQz9KqmcLaeruV4C2BriXBrjty1fuGu0xbZU8uSeooM=;
 b=TJ/S9n27P/N9tl9abAu2Z1s1SagbMmZ7ZzguIOWt0dN1mQlKG4xUFZ0bGJjOLG5GX9q2hzGk6vsUr0IZe4yyxVxb7uI7z6Zi3LpZaoxKkU+i8ZXfkK/Q8fZvfwwKi317AgSgZyfRxHN8LdGFWvyWDM07hGFgoUbjaNsasiWSsDA=
Received: from DM6PR02CA0104.namprd02.prod.outlook.com (2603:10b6:5:1f4::45)
 by SN6PR02MB4750.namprd02.prod.outlook.com (2603:10b6:805:9c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.22; Fri, 14 Feb
 2020 07:16:15 +0000
Received: from CY1NAM02FT039.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e45::208) by DM6PR02CA0104.outlook.office365.com
 (2603:10b6:5:1f4::45) with Microsoft SMTP Server (version=TLS1_2,
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
 CY1NAM02FT039.mail.protection.outlook.com (10.152.75.140) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2729.22
 via Frontend Transport; Fri, 14 Feb 2020 07:16:14 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1j2VCw-0006Hx-1t; Thu, 13 Feb 2020 23:16:14 -0800
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1j2VCq-0000Um-Um; Thu, 13 Feb 2020 23:16:08 -0800
Received: from xsj-pvapsmtp01 (smtp3.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 01E7G1Ye015610;
        Thu, 13 Feb 2020 23:16:01 -0800
Received: from [10.140.6.6] (helo=xhdappanad40.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1j2VCi-0000OQ-Rs; Thu, 13 Feb 2020 23:16:01 -0800
From:   Srinivas Neeli <srinivas.neeli@xilinx.com>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        michal.simek@xilinx.com, shubhrajyoti.datta@xilinx.com
Cc:     linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, git@xilinx.com
Subject: [PATCH V2 7/7] gpio: zynq: Remove error prints in EPROBE_DEFER
Date:   Fri, 14 Feb 2020 12:45:37 +0530
Message-Id: <1581664537-14386-8-git-send-email-srinivas.neeli@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1581664537-14386-1-git-send-email-srinivas.neeli@xilinx.com>
References: <1581664537-14386-1-git-send-email-srinivas.neeli@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83;IPV:;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(396003)(39860400002)(136003)(346002)(376002)(189003)(199004)(336012)(426003)(186003)(478600001)(2616005)(26005)(316002)(6666004)(356004)(8676002)(81166006)(44832011)(107886003)(81156014)(70586007)(7696005)(6636002)(4744005)(36756003)(8936002)(4326008)(9786002)(5660300002)(70206006)(2906002);DIR:OUT;SFP:1101;SCL:1;SRVR:SN6PR02MB4750;H:xsj-pvapsmtpgw01;FPR:;SPF:Pass;LANG:en;PTR:unknown-60-83.xilinx.com;MX:1;A:1;
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e2de9c3e-80d5-4919-3398-08d7b11dc71e
X-MS-TrafficTypeDiagnostic: SN6PR02MB4750:
X-Microsoft-Antispam-PRVS: <SN6PR02MB4750F0A7B923E4E32A0B49ABAF150@SN6PR02MB4750.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:274;
X-Forefront-PRVS: 03137AC81E
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S9voFb1v4U6sAWG/n2PnbPm817u0TPWPkp/qa+XG8ScWtc9WtyL3THE8qFolXuH98Ty/NsYqIJzSQ7WE7RMVCqLC5qUbyRYyhxtB6lrfFcHlpC5NLpBU2lFHD6FsTxSxLdyMEG1llIpJRUQzUol+zoOp1PVjrpeCuTDObIjpxjr1KIe/RbuOv3mT0KL7ZkpYIOZT5KbMpuZghPEteMtVij4zMtvbTV+931pwxGltCGrLEL0CdNQCIZZQk0ddBCDpNhpvYf6J6r9SebVHykRmToHLDwRYwCBTtxT1mq/Uy6i37/QQxZe3V4rx622UcBXF50jfEkH4Wr9XktODbOQ0sL9flP7Kasq4QSO1wE+fnY8AsIrrF5D9dipnLECit9kz0lawJyJDcdNI0wD/mjVLWBdaY47NO7p/EifuPWF6BubQMqHzVaMF44PL8xE06IrC
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2020 07:16:14.7746
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e2de9c3e-80d5-4919-3398-08d7b11dc71e
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB4750
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>

In case of probe is deferred do not print the errors.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Signed-off-by: Michal Simek <michal.simek@xilinx.com>
---
 drivers/gpio/gpio-zynq.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-zynq.c b/drivers/gpio/gpio-zynq.c
index 2ddb59b242e7..53d1387592fd 100644
--- a/drivers/gpio/gpio-zynq.c
+++ b/drivers/gpio/gpio-zynq.c
@@ -930,7 +930,8 @@ static int zynq_gpio_probe(struct platform_device *pdev)
 	/* Retrieve GPIO clock */
 	gpio->clk = devm_clk_get(&pdev->dev, NULL);
 	if (IS_ERR(gpio->clk)) {
-		dev_err(&pdev->dev, "input clock not found.\n");
+		if (PTR_ERR(gpio->clk) != -EPROBE_DEFER)
+			dev_err(&pdev->dev, "input clock not found.\n");
 		return PTR_ERR(gpio->clk);
 	}
 	ret = clk_prepare_enable(gpio->clk);
-- 
2.7.4

