Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E693F1FCC9B
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2020 13:40:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727039AbgFQLi7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 17 Jun 2020 07:38:59 -0400
Received: from mail-bn7nam10on2072.outbound.protection.outlook.com ([40.107.92.72]:6164
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726763AbgFQLhx (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 17 Jun 2020 07:37:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y7RnUe683Yo2Tnw4pJhpLKbFI+sXQDxTJOuRo37po9EGa8fD3Nf3h3F5srZPhdelhGHwKOSN5G6DPvoyep6+cB5ySulR7/YeUzeratmwWnzb1rRT+SxyB2r+lU+XCwukkgoL7MK9PQWRD3t8Sstr8eOWjUfNJ6/m+VDFIcDEtB3cm4j4cvB93jpCLWPOSlibccLpqPmLRdVk4s2c5WvHyn65IaUuZlkfZ79+qKE4dxAGTBPJDiiIFIgLmTyU6cL9RpUjKdgwFjk5yM8SxUZHEznv7o+K0pf5DyYZnwEyY0ICON6BHlfImF1OnRs1Zuty3H17WX+xog6rFaYjj+Ohag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IB9uxm7lwYo7dVHyVjIwXxLpQBJ2/CAVJvzzFPwPt4E=;
 b=eyDAFq3Kl63i8J4CEO5ICmZLybAfs9r5abaR6oRXLIPEieAXnsf0PoLsrNZd6m6Bt9xCX4a8xIM2rw150rbvl+eaBcQ58eRlUESmrBnoscjsAYTcCDeOoG01lB+3arZcS/mLWj6HwzneLHRpdGCSdWbiniKD6Drgxf+03zDwqDSIyjPTVeUhqkNg4U8CZmtBTT4VZtECw9wielxFkzdGejnm86H5wI+HZLiUJnpGw4IArYRhaORb19yrRXM4/KDMxFRsPl539C7ZbdXfq2XCfcK2SFcsnvZR2Dhr4XeKxV6KMbFFhAE7v1PZTBTJfq1AwszekQGuZF9jADb0PPkoag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IB9uxm7lwYo7dVHyVjIwXxLpQBJ2/CAVJvzzFPwPt4E=;
 b=RsWUyvE5MGdfkcEQtwSz0zhXmrZMo5DIPud8AkYh5pZLrNswVCVoQ8zgykYfrHkq4KqoDs570qHLdTvLf4kf3+3H89UCoUe8dIiZjvDutzW40L3MesF/XKqJtpy1sZGJP4QmqcOZHmPAWKUG09vU0pEBBxrLEF5SQ2aOkMJrS5g=
Received: from MN2PR19CA0056.namprd19.prod.outlook.com (2603:10b6:208:19b::33)
 by SN6PR02MB4912.namprd02.prod.outlook.com (2603:10b6:805:99::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.25; Wed, 17 Jun
 2020 11:37:50 +0000
Received: from BL2NAM02FT008.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:19b:cafe::f3) by MN2PR19CA0056.outlook.office365.com
 (2603:10b6:208:19b::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.22 via Frontend
 Transport; Wed, 17 Jun 2020 11:37:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 BL2NAM02FT008.mail.protection.outlook.com (10.152.76.162) with Microsoft SMTP
 Server id 15.20.3088.18 via Frontend Transport; Wed, 17 Jun 2020 11:37:50
 +0000
Received: from [149.199.38.66] (port=36161 helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1jlWN3-0001I0-EA; Wed, 17 Jun 2020 04:36:45 -0700
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1jlWO5-0007aG-O2; Wed, 17 Jun 2020 04:37:49 -0700
Received: from xsj-pvapsmtp01 (xsj-mail.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 05HBbiV2015099;
        Wed, 17 Jun 2020 04:37:44 -0700
Received: from [10.140.6.6] (helo=xhdappanad40.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1jlWO0-0007TR-8l; Wed, 17 Jun 2020 04:37:44 -0700
From:   Srinivas Neeli <srinivas.neeli@xilinx.com>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        michal.simek@xilinx.com, shubhrajyoti.datta@xilinx.com,
        sgoud@xilinx.com
Cc:     linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, git@xilinx.com
Subject: [PATCH V4 5/7] gpio: zynq: Disable the irq if it is not a wakeup source
Date:   Wed, 17 Jun 2020 17:07:25 +0530
Message-Id: <1592393847-1415-6-git-send-email-srinivas.neeli@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1592393847-1415-1-git-send-email-srinivas.neeli@xilinx.com>
References: <1592393847-1415-1-git-send-email-srinivas.neeli@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapsmtpgw01;PTR:unknown-60-83.xilinx.com;CAT:NONE;SFTY:;SFS:(136003)(396003)(376002)(39860400002)(346002)(46966005)(2616005)(9786002)(426003)(107886003)(36756003)(6666004)(8676002)(7696005)(44832011)(4326008)(6636002)(82740400003)(8936002)(82310400002)(5660300002)(26005)(186003)(2906002)(83380400001)(356005)(47076004)(316002)(336012)(70206006)(70586007)(81166007)(478600001);DIR:OUT;SFP:1101;
X-MS-PublicTrafficType: Email
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: beb4aa85-6d6e-442c-2548-08d812b2dd69
X-MS-TrafficTypeDiagnostic: SN6PR02MB4912:
X-Microsoft-Antispam-PRVS: <SN6PR02MB4912E6C50B4DA18DE7ABD301AF9A0@SN6PR02MB4912.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-Forefront-PRVS: 04371797A5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QLu2Wi3LPr1rXNOCBo7AHZ7oexMQNtna89EboIDjD1bAoGsnWLJBnm994qME2aWFsDFoc7udzc7GVyajTJM7qwQGFADnIUj6KxIwm0Ps8HaQX2PdoHAsrc5RvTcCiCKAsUoMvafN4ai0zWhbnK96+0yAQOCmw+G6SK4l3MLi4DUXp9kitfa4ZMf5gQ0bImRKr8WATk+O9MSMOKSbjbaMGy1gM93UXiNaSwXRQs4KTRIn34ySJDeSA5tN8208FGgc3At5XiVj7hyvFulnolMbyW3e9zussaLUxZmFd/qwVU1lKjGO0CYNkhd6l2V7d+Fhss/DfCbCPIx7t8EpqxNsEzyOPBbqv2g9SsTb5gCVqKpk9Ud9H3S3bngNTXaIxwmmoh6tgZkHNWY0hmn6PvS34g==
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2020 11:37:50.0979
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: beb4aa85-6d6e-442c-2548-08d812b2dd69
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB4912
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>

If gpio is not set to wake disable the interrupt. ATF set all slaves with
enabled interrupts as wakeup sources and if gpio is used in r5 then it
wakes up linux.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Signed-off-by: Michal Simek <michal.simek@xilinx.com>
---
 drivers/gpio/gpio-zynq.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpio/gpio-zynq.c b/drivers/gpio/gpio-zynq.c
index 9ac69144a0eb..b6261a3aec55 100644
--- a/drivers/gpio/gpio-zynq.c
+++ b/drivers/gpio/gpio-zynq.c
@@ -735,6 +735,9 @@ static int __maybe_unused zynq_gpio_suspend(struct device *dev)
 	struct zynq_gpio *gpio = dev_get_drvdata(dev);
 	struct irq_data *data = irq_get_irq_data(gpio->irq);
 
+	if (!device_may_wakeup(dev))
+		disable_irq(gpio->irq);
+
 	if (!irqd_is_wakeup_set(data)) {
 		zynq_gpio_save_context(gpio);
 		return pm_runtime_force_suspend(dev);
@@ -749,6 +752,9 @@ static int __maybe_unused zynq_gpio_resume(struct device *dev)
 	struct irq_data *data = irq_get_irq_data(gpio->irq);
 	int ret;
 
+	if (!device_may_wakeup(dev))
+		enable_irq(gpio->irq);
+
 	if (!irqd_is_wakeup_set(data)) {
 		ret = pm_runtime_force_resume(dev);
 		zynq_gpio_restore_context(gpio);
@@ -956,6 +962,8 @@ static int zynq_gpio_probe(struct platform_device *pdev)
 		goto err_pm_put;
 	}
 
+	irq_set_status_flags(gpio->irq, IRQ_DISABLE_UNLAZY);
+	device_init_wakeup(&pdev->dev, 1);
 	pm_runtime_put(&pdev->dev);
 
 	return 0;
-- 
2.7.4

