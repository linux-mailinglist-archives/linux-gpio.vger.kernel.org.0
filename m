Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D193B39A638
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jun 2021 18:49:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229809AbhFCQu4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 3 Jun 2021 12:50:56 -0400
Received: from mail-bn8nam12on2070.outbound.protection.outlook.com ([40.107.237.70]:61472
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229719AbhFCQuz (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 3 Jun 2021 12:50:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RkCAEMh/GpCdnUvHXP6Pwi0G9GZicIV7caApCYOIb3sBj/E+7RMPEqu9h7E4jw+0n3EzWIe5shpl2EKfJXbO85iGrPmySZvqVXTr/grhK9el3LKvOB+1imIuNn0BYYUBe00TIq0iPhdxNSL989JGrXPG6z0KMl6fn5R/y/YsvKWIgVLbCehNGuFdYa7erBqfxaZ7M7ZHZjWynSEoHepbhIaWtDW32lLTDY10pIZvKUmjb9GApTwE7JhiPSltMhRFw7OGZYO9RExToca9mXIGfINk4+XFSEdgwIdEVid8MrhLaHX2KpiywR7ZU1+bbDBSlrQUw/NgJqhxLpNJ0qd0SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=avLXrLWgku6rFJbTzlYFyxlDZndWO0Eio2FBe6qSa/s=;
 b=PXv5RH6SeUpeL908Hksl0Z/rFjKOqAfizpmSOu7STiWv605IhGGnqTs8XAnKR2gb/SYE6GUQb+z6jAqI288vCai1W+MWVt1ms+tqiFDJ8S7J/7bklmprw9w+t4/nwsWvmnWG2tJItR98jZFpOn41Hz7MFl/sxPjJzj6n8mMFsiLiKR4kL9skFV+5aE8scIR53+ExZktOIMkX4v12JyVnbHBLSMm4hDYWZ0gr9b83wcq8W8BrpKjW6eUiCG75Lf+qxszyho5T/Qz28HO4EwDv5ucrlqzSfK7FEKAp0O1PLa35jPHvhCnjAUnPOv5rCi3YEuW0pbjmK++EtOqEhhenzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=linaro.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=avLXrLWgku6rFJbTzlYFyxlDZndWO0Eio2FBe6qSa/s=;
 b=PuBa4KsvP515EqH2KiISDki6vVIKMRV/UFLxTZEpVtr4/IGXAi1tSSSQ5YoYlJfq+UJ8CFtd8DMiBmqO5wXrBpqLYPvyLwgBQW1LZ7EOvCTZgATl7XTR9NO20ApeqBOXwd7FLBnZmZUL3eiYi699pmkR2re/nO6KM5Ymyj4y4ek=
Received: from SN4PR0501CA0094.namprd05.prod.outlook.com
 (2603:10b6:803:22::32) by BN0PR02MB8030.namprd02.prod.outlook.com
 (2603:10b6:408:16d::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.21; Thu, 3 Jun
 2021 16:49:09 +0000
Received: from SN1NAM02FT0055.eop-nam02.prod.protection.outlook.com
 (2603:10b6:803:22:cafe::eb) by SN4PR0501CA0094.outlook.office365.com
 (2603:10b6:803:22::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.11 via Frontend
 Transport; Thu, 3 Jun 2021 16:49:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0055.mail.protection.outlook.com (10.97.5.78) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4195.18 via Frontend Transport; Thu, 3 Jun 2021 16:49:09 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 3 Jun 2021 09:49:08 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Thu, 3 Jun 2021 09:49:08 -0700
Envelope-to: git@xilinx.com,
 linus.walleij@linaro.org,
 bgolaszewski@baylibre.com,
 linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Received: from [172.23.80.241] (port=53548 helo=xhdsneeli40x.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1loqWp-00059W-8L; Thu, 03 Jun 2021 09:49:07 -0700
From:   Srinivas Neeli <srinivas.neeli@xilinx.com>
To:     <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
        <michal.simek@xilinx.com>, <shubhrajyoti.datta@xilinx.com>,
        <sgoud@xilinx.com>
CC:     <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <git@xilinx.com>,
        Srinivas Neeli <srinivas.neeli@xilinx.com>
Subject: [PATCH] gpio: gpio-xilinx: update on suspend and resume calls
Date:   Thu, 3 Jun 2021 22:19:00 +0530
Message-ID: <20210603164900.46020-1-srinivas.neeli@xilinx.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 30d47816-65fd-4f77-e53b-08d926af8201
X-MS-TrafficTypeDiagnostic: BN0PR02MB8030:
X-Microsoft-Antispam-PRVS: <BN0PR02MB803079A00CEA06DF9918093FAF3C9@BN0PR02MB8030.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: G7VAiTJrClGJ1EMl3JJvxq0P9mqdp6xx3Jtc07tEtnyw0WGy0Pw7HQrulRX499XAOnBVvW2ZXiO2VA9dIckFuX5QY0mdR93CfE8fbW6XUpu5d0nM274gxRatvm8iqyPKLXDFrdSw8fH9Ns55Hdp1soCQ0FDayLeuyltO6pUfShE6J9/CwACvNR1HleY31GIPfafvdTsat2ongxeNY/YVZUdW1S37egGW/uyAvRrVmO/Y7q4RD4Ftqcxy6t0NyOFnmzq0R3WYSdjmtBvFzf/5p9uU0U+XzUqtrbBtUvhKzMzZfSdS9noEqoQuCx9F6ZsP06+i5slORjnubBWKgYEjW2LClHaNRoiFimkZUOFS2WxRks9nN2+nzkHFCWiIsQNpaDCF5sCqO1B5FvfXfL+PjXESxa9ap+4zTvsBcwn0w7TEV6+twKropk8t09HOBOm4fmCMyuc/pJJAjKNYIpMoy1/3RujYsoCGxUoymbLI1M3vxP1DRAEHegEq2F/YCcUDxc9drC/sMLOw7GRu3f3xPGLT8cbzYrhRt4vHDmjTed3VsyIqZ4vUPdsVRnWeHu9bxvRMX0IzpvL0mTManWwbkWcJjczzx+BHb0DaDXhUhwAHUjEEx81N6X3fZFuFdr4QeZxoGrGY1jZ8D5LoctqcSU8MOKVWVeed1obc64mTkRFs+zhlXg7xS9MLcRG+TSyi
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(396003)(39860400002)(46966006)(36840700001)(4326008)(36756003)(5660300002)(9786002)(1076003)(7696005)(7636003)(8936002)(6636002)(356005)(6666004)(8676002)(107886003)(70586007)(478600001)(47076005)(15650500001)(70206006)(186003)(36860700001)(2616005)(26005)(44832011)(2906002)(82310400003)(82740400003)(426003)(336012)(83380400001)(316002)(54906003)(110136005)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2021 16:49:09.1140
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 30d47816-65fd-4f77-e53b-08d926af8201
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0055.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR02MB8030
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Current AXI GPIO driver checking for interrupt data in suspend and
resume path and reporting as error in case of no interrupt connection.
As per AXI GPIO IP specification interrupt connection is optional,
driver logic is updated in suspend and resume calls by reporting
debug message and enable/disable clock in case of no connection.

Signed-off-by: Srinivas Neeli <srinivas.neeli@xilinx.com>
---
 drivers/gpio/gpio-xilinx.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-xilinx.c b/drivers/gpio/gpio-xilinx.c
index b411d3156e0b..e0681c37f1cb 100644
--- a/drivers/gpio/gpio-xilinx.c
+++ b/drivers/gpio/gpio-xilinx.c
@@ -302,8 +302,8 @@ static int __maybe_unused xgpio_suspend(struct device *dev)
 	struct irq_data *data = irq_get_irq_data(gpio->irq);
 
 	if (!data) {
-		dev_err(dev, "irq_get_irq_data() failed\n");
-		return -EINVAL;
+		dev_dbg(dev, "IRQ not connected\n");
+		return pm_runtime_force_suspend(dev);
 	}
 
 	if (!irqd_is_wakeup_set(data))
@@ -348,8 +348,8 @@ static int __maybe_unused xgpio_resume(struct device *dev)
 	struct irq_data *data = irq_get_irq_data(gpio->irq);
 
 	if (!data) {
-		dev_err(dev, "irq_get_irq_data() failed\n");
-		return -EINVAL;
+		dev_dbg(dev, "IRQ not connected\n");
+		return pm_runtime_force_resume(dev);
 	}
 
 	if (!irqd_is_wakeup_set(data))
-- 
2.22.0

