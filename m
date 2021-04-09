Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2306A35A0B1
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Apr 2021 16:09:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233599AbhDIOI6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Apr 2021 10:08:58 -0400
Received: from mail-co1nam11on2045.outbound.protection.outlook.com ([40.107.220.45]:34881
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233729AbhDIOI5 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 9 Apr 2021 10:08:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GxpPiHZ9Rd69Un0A42RW/U33zS8QkuJ94ZEcNVnSmwhrHiRoxc5i+QpbWq6CFPmWI5dr/5j0ZCnJP97eg0qWoDMiqBgTfHR8ARtkxpXUiIcETHyBvGpirfq6ng/mkRIVf5KNwU7n0eanksdc+rQYigMBpAIXdd83UWILE+vMPioH3XROpS3uIibQQ3YDiO2sVUdelv3mKDuCjTpF9JCjAhx0eMlDaY8tUgti5dT+tS8k+zdxCfSAvq5/WxP8DScDBED/6UCjQjKnhddJZfLlbYgU0/grJDkKXVEZRtSAKdplL9avKkcOjrXriPyblkKApdmT4yN5ib9DzFgBDkc07A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YhK+TtMuJsUx2jnPqGZBZ/tD9kAKlYS3EoOa6faW+Dk=;
 b=nhOUukpvq2dWRxDzomh+i3/frIxrpFfyCNZERqaaWwbXhhT5LbqQxEZ614/40A2AbCNgjoLi5KBg4f/RnW2jgIx+zAB5kHkj5gcedPqp9OBoDLaziCV3tbHHSJpKFPSsrIs+/UTpKnhrVpZLphEzgj2wtgQlt80yRLEyBk6w8y8vp+JNSEjg7g9VWVurLi80cqP6PygydVlBObKTQ7PU6Zl4hgx4vKVKzXIhVXKQIBE23F7p0sk1nRmGGBk65aJKo/LrPP0iI/X5/nH9fH/ftxUZ8UA+YzeXsgnpU97dtm89CuOriN4WaBgAoxq4NM0ZXMBsfuQJONTq2LsHHFA1zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=linaro.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YhK+TtMuJsUx2jnPqGZBZ/tD9kAKlYS3EoOa6faW+Dk=;
 b=HrSMbmocx4glAl6jP5IQU0+sLVXmwNspytPZVhql6vKNS1rdG30gUCcBOf41gumoCCvP84dPJsgF4ULdL+crST/VARXyFRFyE13aQtLAdxvshaUp/JzghzsT6SRufRxS5+PGbzKhDB4T60CPtxyh8T3+SUQfWGp5WAoQZ/V7bz4=
Received: from DM6PR04CA0015.namprd04.prod.outlook.com (2603:10b6:5:334::20)
 by BL0PR02MB3777.namprd02.prod.outlook.com (2603:10b6:207:4a::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.21; Fri, 9 Apr
 2021 14:08:42 +0000
Received: from CY1NAM02FT039.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:334:cafe::e9) by DM6PR04CA0015.outlook.office365.com
 (2603:10b6:5:334::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17 via Frontend
 Transport; Fri, 9 Apr 2021 14:08:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT039.mail.protection.outlook.com (10.152.75.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4020.17 via Frontend Transport; Fri, 9 Apr 2021 14:08:42 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Fri, 9 Apr 2021 07:08:25 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Fri, 9 Apr 2021 07:08:25 -0700
Envelope-to: git@xilinx.com,
 linus.walleij@linaro.org,
 bgolaszewski@baylibre.com,
 linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Received: from [172.23.80.241] (port=38546 helo=xhdsneeli40x.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1lUro7-0005KB-Sg; Fri, 09 Apr 2021 07:08:24 -0700
From:   Srinivas Neeli <srinivas.neeli@xilinx.com>
To:     <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
        <michal.simek@xilinx.com>, <shubhrajyoti.datta@xilinx.com>,
        <sgoud@xilinx.com>
CC:     <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <git@xilinx.com>,
        Srinivas Neeli <srinivas.neeli@xilinx.com>
Subject: [PATCH 2/3] gpio: zynq: Check return value of pm_runtime_get_sync
Date:   Fri, 9 Apr 2021 19:38:05 +0530
Message-ID: <20210409140806.31824-3-srinivas.neeli@xilinx.com>
X-Mailer: git-send-email 2.9.1
In-Reply-To: <20210409140806.31824-1-srinivas.neeli@xilinx.com>
References: <20210409140806.31824-1-srinivas.neeli@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3e8cd944-7102-4e13-60cd-08d8fb60fb61
X-MS-TrafficTypeDiagnostic: BL0PR02MB3777:
X-Microsoft-Antispam-PRVS: <BL0PR02MB37772B95DB656FD904CCF3D0AF739@BL0PR02MB3777.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xtsoLGqDWl30I5vPgGJw15wny5Ea1bVfbKeKLds5lnnznaHZ6S6UxTbiYFGCNNbTsMWJkutZxenTEOGa508kYOAD58rFz5nQJhK32gHui60JGmQJ7dFmA5PzlAjEOpK4gGQSo5RdW+vROAZg5q1vZXPdgJRuSLEYQsH8hZxKm22Ow4woXJnYEVBr5B/MpdyU4949xjbCJTNgOnuyQPRyZ3cPX9DlUQmEVl++RkjMn4xxe6trIJLcNpvA6FgNfCnFjrTgDMBL/6j2xDMufNKFiAm3Di8MzWcmkdAwfTVLRPbYWKdLQ5xFJwhoqjawQIVZ7TfMhpAHBH1PMl5CgCHofmDIC6uvJx2zMARRAZDik/ppUTmFXjP3bxOtzxjZHzaThmiw+Tdt6aJ108VimFqQZ0fEjW5JrbRiX4F5mjnYskTvaU+6n3kP/uQLaMJximhFKvDGQeojQuFHQNOIs0AgH1nKSLepggPgKWPmSPL5lsovoIad+vvW0JrPWDMX+l46HOObhAEcqc33PQPw5WkrBNF3fcKcTixAXREXlSA417rxB+XZ9cMTYQOHiJ2lrUdnQQkcyRTCm9jNQWmXCRKVj8iWZjGytcZeX8YJm0wyakhM/ogsXzk4F/2glu+P+pikHbzF4O4fvxw0ipR0qSxH1vdjxjb0nqSGs7/KC6aOo+JhRmeFTdO2D8d/jU9ETwT+
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(39860400002)(376002)(136003)(396003)(346002)(46966006)(36840700001)(8676002)(36860700001)(316002)(47076005)(356005)(54906003)(6636002)(5660300002)(4744005)(83380400001)(7636003)(70586007)(9786002)(478600001)(110136005)(70206006)(26005)(1076003)(107886003)(2616005)(82310400003)(82740400003)(4326008)(7696005)(186003)(8936002)(36906005)(6666004)(336012)(44832011)(2906002)(36756003)(426003)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2021 14:08:42.5201
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e8cd944-7102-4e13-60cd-08d8fb60fb61
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT039.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB3777
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Return value of "pm_runtime_get_sync" API was neither captured nor checked.
Fixed it by capturing the return value and then checking for any warning.

Addresses-Coverity: "check_return"
Signed-off-by: Srinivas Neeli <srinivas.neeli@xilinx.com>
---
 drivers/gpio/gpio-zynq.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-zynq.c b/drivers/gpio/gpio-zynq.c
index bb1ac0c5cf26..c91302a16c77 100644
--- a/drivers/gpio/gpio-zynq.c
+++ b/drivers/gpio/gpio-zynq.c
@@ -1001,8 +1001,11 @@ static int zynq_gpio_probe(struct platform_device *pdev)
 static int zynq_gpio_remove(struct platform_device *pdev)
 {
 	struct zynq_gpio *gpio = platform_get_drvdata(pdev);
+	int ret;
 
-	pm_runtime_get_sync(&pdev->dev);
+	ret = pm_runtime_get_sync(&pdev->dev);
+	if (ret < 0)
+		dev_warn(&pdev->dev, "pm_runtime_get_sync() Failed\n");
 	gpiochip_remove(&gpio->chip);
 	clk_disable_unprepare(gpio->clk);
 	device_set_wakeup_capable(&pdev->dev, 0);
-- 
2.9.1

