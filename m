Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7EC635A0AE
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Apr 2021 16:08:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231402AbhDIOIz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Apr 2021 10:08:55 -0400
Received: from mail-mw2nam12on2085.outbound.protection.outlook.com ([40.107.244.85]:8439
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233009AbhDIOIw (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 9 Apr 2021 10:08:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mYiav54/wgqliTo0qmYs9q0ZeaeavGo5EYyJNIxbBDtYPPt9yrjFYNborvlZcwppLyMtkKoigz+xG3WeW+Q4yTGAR9Gh1yOLftcnzvgoDwitfPXcaJM1ehDsiX+tGnt6KPrejwXc9QnhvhoifrHkfTBQ1RMz9IPjT/pusJqtsntK924ODWNbAcYO7nYVMv9qp18l8dlkIEkLCH90TVG6H0WwVSML+ZI8zs5nylrg5DcwJRBD1oXm/sLl4o1HnMcBUilD93IPQrygdaAA5jsdnVu6sJ+AtUNiNOdm9PK7DGaPacKJW1NnzIFekITJvay1zpZnacOHCZYkLKoLX66QxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wcX+I0oO6tCUrm3FHhb5h5u/UXaWk6B32HUO9NKx/YY=;
 b=BXwxroabjoPuueUkkt/yrRTPnIhFlQxn6Eo8OM/MyWFH5ruWjSeTRwcUQXfC0VZmOmptbu2J5hyPhivlrivVK9Ks2i/QB2zHcN0rMXnDe+EdHzHlv2A1nlEFMnrbsQldI1xcmYf+yV9FfuQ2nYBKzmP/B/AtciS9+8exPJ+kX7G+JvXC5Q8SvvDOitWvXCXWEOCj3N3hJab3S2UhAcBML8l59bUvPyE5zJ9mNKTOgYJALuGWQsS237hsGpRaRuxXveuEVzQbW2zXuR41kwwL341d1Ilj8BRtf/d2iGzZwWRqFp40ZK8VSKjqYiNMeUb1FhtU2Qp85qM9waIYFB5KoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=linaro.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wcX+I0oO6tCUrm3FHhb5h5u/UXaWk6B32HUO9NKx/YY=;
 b=mGCSOH7VuIdjYK4/4q6b8ZkxwbjfKb5b4i3MGl5tZCtP/Sv2jSP1jH2juTF63/8cq6hRtnCyBfCIzwnRCleZN8O4do5mNkBr8dN1C2tZTiSn+LfnmLch8qLP0BuP/pE+f9aoJ2wfwduqkt8g0UWGccmN2A6NmO/314aVHZ/O1Sg=
Received: from CY4PR18CA0063.namprd18.prod.outlook.com (2603:10b6:903:13f::25)
 by SN6PR02MB5055.namprd02.prod.outlook.com (2603:10b6:805:67::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17; Fri, 9 Apr
 2021 14:08:37 +0000
Received: from CY1NAM02FT055.eop-nam02.prod.protection.outlook.com
 (2603:10b6:903:13f:cafe::b6) by CY4PR18CA0063.outlook.office365.com
 (2603:10b6:903:13f::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17 via Frontend
 Transport; Fri, 9 Apr 2021 14:08:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT055.mail.protection.outlook.com (10.152.74.80) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4020.17 via Frontend Transport; Fri, 9 Apr 2021 14:08:37 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Fri, 9 Apr 2021 07:08:28 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Fri, 9 Apr 2021 07:08:28 -0700
Envelope-to: git@xilinx.com,
 linus.walleij@linaro.org,
 bgolaszewski@baylibre.com,
 linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Received: from [172.23.80.241] (port=38546 helo=xhdsneeli40x.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1lUroB-0005KB-6s; Fri, 09 Apr 2021 07:08:27 -0700
From:   Srinivas Neeli <srinivas.neeli@xilinx.com>
To:     <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
        <michal.simek@xilinx.com>, <shubhrajyoti.datta@xilinx.com>,
        <sgoud@xilinx.com>
CC:     <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <git@xilinx.com>,
        Srinivas Neeli <srinivas.neeli@xilinx.com>
Subject: [PATCH 3/3] gpio: zynq: Check return value of irq_get_irq_data
Date:   Fri, 9 Apr 2021 19:38:06 +0530
Message-ID: <20210409140806.31824-4-srinivas.neeli@xilinx.com>
X-Mailer: git-send-email 2.9.1
In-Reply-To: <20210409140806.31824-1-srinivas.neeli@xilinx.com>
References: <20210409140806.31824-1-srinivas.neeli@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f24e1bc3-dec6-4583-8e1f-08d8fb60f85c
X-MS-TrafficTypeDiagnostic: SN6PR02MB5055:
X-Microsoft-Antispam-PRVS: <SN6PR02MB5055D40DAF3B9D4BC96202C1AF739@SN6PR02MB5055.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JnGIdhXZQYcmCcdM6wvBQN8j9XkpSd3WMUHeSDVWgKnDFizENX5rluAYrEMWhnfnrKd62SISH/5HHXICWxI/3VZjxQWxeoE+9pTleWqsrhZclZeUTujD06xUVuwjUF+xKRZr8Iwa/170+2xQsMNBmIBIi7J26TkHueO5NbeqZuaJqjLL5SiMTxcqnckgsweUeOhX75dp4ujzQD24NN44t97/fMx1nrXou/DAJt6XS2xQR/Wbh30FqibUa3XnO3m3bI338/pmVUnDs4nuaBGoTiSLicQCjhDTyYO9FkCZCJW/ZEJ9KHhn7tNLEjiyFA8/kHCaylLHWtxRHa/N24JBSQwhUSo+LqbY1WBk+X7YV+fRzgnuR4eDPu58U2duHV8+o/7+63PC7RdBeoP9UpvMp6Wrhrigh50AzpU7o/kgYJaeTBXuTKRQnO71H66OKWJxM/926pbzdAzAc9vjr6LUy+O043afw1jiEhVlJ5yPY8+U9znzjcOrfAIZpgOUkiohQEzubSgb9s3EttRaryHHmNY4IJJlmTwafjTncSk/+2eUtKqLX2uC/+bM6OlsMgkUZ2hCxymnQ8oDD4QsW94Zr26nk5nBS2mJZmbYh3JLKtMRT570RTU2zC2grxF9mv5WTBUABrMLcIYCua0KqdCBAoMd/rwM1xnwU9HIUAwJEkl36LZiUCXgiZV0YmO7kAyX
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(346002)(136003)(39860400002)(396003)(376002)(36840700001)(46966006)(107886003)(44832011)(4326008)(356005)(83380400001)(1076003)(36756003)(82740400003)(7636003)(2616005)(8936002)(110136005)(316002)(54906003)(9786002)(36906005)(6636002)(5660300002)(7696005)(6666004)(8676002)(478600001)(36860700001)(82310400003)(47076005)(186003)(426003)(336012)(70206006)(2906002)(26005)(70586007)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2021 14:08:37.4543
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f24e1bc3-dec6-4583-8e1f-08d8fb60f85c
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT055.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB5055
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

In two different instances the return value of "irq_get_irq_data"
API was neither captured nor checked.
Fixed it by capturing the return value and then checking for any error.

Addresses-Coverity: "returned_null"
Signed-off-by: Srinivas Neeli <srinivas.neeli@xilinx.com>
---
 drivers/gpio/gpio-zynq.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpio/gpio-zynq.c b/drivers/gpio/gpio-zynq.c
index c91302a16c77..f0cb8ccd03ed 100644
--- a/drivers/gpio/gpio-zynq.c
+++ b/drivers/gpio/gpio-zynq.c
@@ -736,6 +736,11 @@ static int __maybe_unused zynq_gpio_suspend(struct device *dev)
 	struct zynq_gpio *gpio = dev_get_drvdata(dev);
 	struct irq_data *data = irq_get_irq_data(gpio->irq);
 
+	if (!data) {
+		dev_err(dev, "irq_get_irq_data() failed\n");
+		return -EINVAL;
+	}
+
 	if (!device_may_wakeup(dev))
 		disable_irq(gpio->irq);
 
@@ -753,6 +758,11 @@ static int __maybe_unused zynq_gpio_resume(struct device *dev)
 	struct irq_data *data = irq_get_irq_data(gpio->irq);
 	int ret;
 
+	if (!data) {
+		dev_err(dev, "irq_get_irq_data() failed\n");
+		return -EINVAL;
+	}
+
 	if (!device_may_wakeup(dev))
 		enable_irq(gpio->irq);
 
-- 
2.9.1

