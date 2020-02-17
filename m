Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D2CE16121A
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2020 13:34:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729611AbgBQMdv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Feb 2020 07:33:51 -0500
Received: from mail-dm6nam10on2051.outbound.protection.outlook.com ([40.107.93.51]:29280
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727513AbgBQMdu (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 17 Feb 2020 07:33:50 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dkuy/dtHcrFSPBkrw3IeUOGdoi58iluiBDt+nR5DkW+P3mmeIq+TBwbgroWpwEJPjwuLxzF6ZG2RycmnDBHFKxbyM3ofQLiq0uYIHeZg3Is/WEIhbAjX7RYNhoKX/HLOQYoA88mXt/eDgX2UJgiQZPtVbEFY0zJax/mczzez6yPV5hhnJZqqmnXpnC5KZ/NwQrdWqDqERC4o32j3sNSH+jcse9+hCy8d+J2kNOED71/u+uzQhBo2qkVItOWrW8LHw7Fqan8/9rFkY2rL08vb/VHr+Dme76vfiMEQsdV38+1acR0PhbFpRQPZEw65Ac56d78cXdBFKZ57IqbHLs4uuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LQz9KqmcLaeruV4C2BriXBrjty1fuGu0xbZU8uSeooM=;
 b=LLZvhsMHkt7CRVNCjgNymqUjGVwKb5ppDGDAxUCNktoPwZ2NCtUZTHo8VEfs0Vp/DoruF6/wTsSjvP5Z20vG1Zu+kbLkDetFEvfZh1dexSpNNgMg6bV0uryw/Bt2R8oEm98ROVAdBRLe1dQrb1fuxTuDTDEY6LGq1ZuDI3IkB+eHc8Af6o4CLpywtx6lMcYXr2XBNOzXmvGHwbpid/d4af0f/7sR5BJXAdcE7UYFmdKrUw51ARZjuHQPVkb4T5BEFvfZFq7xh7FSnGs7HsZR4Pf6nnry86XLxJEsUAEMjcroVzCKHBu1pQhu14ugJ67ZB1UWrDc5AwFEwAZtg/oHpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LQz9KqmcLaeruV4C2BriXBrjty1fuGu0xbZU8uSeooM=;
 b=X/d/Cig/nPSkxY2aYl+CWmvHyepvViVPiKwMExAPE3giZ30MYUbLNwEY5fsA+JMcfW1ku05Rh+gdYqNoRbI/dBIcggRrpZsu/rUfoIZG1cyOHEzpEAS/QqEVCoHZpTDqq1F7BNjs3l3LRUyeDz7X+iEt2VuWIbbQmZ75XYTWYL0=
Received: from MWHPR02CA0016.namprd02.prod.outlook.com (2603:10b6:300:4b::26)
 by MN2PR02MB5759.namprd02.prod.outlook.com (2603:10b6:208:10d::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.25; Mon, 17 Feb
 2020 12:33:48 +0000
Received: from CY1NAM02FT044.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e45::204) by MWHPR02CA0016.outlook.office365.com
 (2603:10b6:300:4b::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.25 via Frontend
 Transport; Mon, 17 Feb 2020 12:33:48 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 CY1NAM02FT044.mail.protection.outlook.com (10.152.75.137) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2729.22
 via Frontend Transport; Mon, 17 Feb 2020 12:33:47 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1j3fat-0000TO-BO; Mon, 17 Feb 2020 04:33:47 -0800
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1j3fao-0001yh-8B; Mon, 17 Feb 2020 04:33:42 -0800
Received: from xsj-pvapsmtp01 (xsj-mail.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 01HCXYt8026029;
        Mon, 17 Feb 2020 04:33:35 -0800
Received: from [10.140.6.6] (helo=xhdappanad40.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1j3fag-0001uE-BM; Mon, 17 Feb 2020 04:33:34 -0800
From:   Srinivas Neeli <srinivas.neeli@xilinx.com>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        michal.simek@xilinx.com, shubhrajyoti.datta@xilinx.com
Cc:     linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, git@xilinx.com
Subject: [PATCH V3 7/7] gpio: zynq: Remove error prints in EPROBE_DEFER
Date:   Mon, 17 Feb 2020 18:03:13 +0530
Message-Id: <1581942793-19468-8-git-send-email-srinivas.neeli@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1581942793-19468-1-git-send-email-srinivas.neeli@xilinx.com>
References: <1581942793-19468-1-git-send-email-srinivas.neeli@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83;IPV:;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(396003)(39850400004)(136003)(346002)(376002)(189003)(199004)(8676002)(81156014)(81166006)(5660300002)(316002)(26005)(4326008)(70206006)(2906002)(7696005)(478600001)(4744005)(6666004)(356004)(6636002)(9786002)(8936002)(2616005)(336012)(70586007)(36756003)(107886003)(186003)(44832011)(426003);DIR:OUT;SFP:1101;SCL:1;SRVR:MN2PR02MB5759;H:xsj-pvapsmtpgw01;FPR:;SPF:Pass;LANG:en;PTR:unknown-60-83.xilinx.com;MX:1;A:1;
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 05eec5a2-b76a-4353-a5bf-08d7b3a5a2d3
X-MS-TrafficTypeDiagnostic: MN2PR02MB5759:
X-Microsoft-Antispam-PRVS: <MN2PR02MB57590C6043D290E2EDBEC233AF160@MN2PR02MB5759.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:274;
X-Forefront-PRVS: 0316567485
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Hy+HwPWnTdXm3MOocHnsmkS0AnoIrVl6uo6qLmySxd8HOLQyx30e/0Fk8ugAlITxIxy/nLhBR2QOtby8KWZ7ze8EW80U6Czm4w6kqwZW5Yns8CLmo1i/vT1NjHOBoNa5vFhpc/oLspmCL4TlpcUIofmtANRNV5BOPSzsYG3sYQFyIwqeROvppTRIuML0PuOMJlTNEcfATW/NVoWQe9VhpuYI+APMxmOFrlB1zUWy/iqF2nqvzolLXdBdp4K/OhdeMhPsfq8BG4hj9MqDRnAVhiXBr8OoGJMWIfmOqZR2eUQCxTHGsWxXn1OJUo5fcSvKLz2JWEWAvpskdSStLdlNmb08Vub1OYubKnub1fCG0gObmg0VpTRe4+tyZe1ODHdIHAgGJgrU+eGlFrDeoQWHidmSfMz3Tga95t8fyfakX4tzBICObB1MYuDiM9JfadOL
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2020 12:33:47.7688
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 05eec5a2-b76a-4353-a5bf-08d7b3a5a2d3
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB5759
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

