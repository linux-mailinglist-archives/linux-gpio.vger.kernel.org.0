Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0EE2F12AC25
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Dec 2019 13:13:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726060AbfLZMNb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 26 Dec 2019 07:13:31 -0500
Received: from mail-bn7nam10on2040.outbound.protection.outlook.com ([40.107.92.40]:6055
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726728AbfLZMNa (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 26 Dec 2019 07:13:30 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ngrYLLikLX5htB3qU1o/U0YAfMduOmJO+5n3p2XVFH/dKq/9myI3kJYdgV6+9sh1rsQgdEIhz9w+fWMrWA6RC4lj+MRDR8OAl+DGTGi04dvyCFEHsrpc70csIsdRxG8z6BoGZcnczNJHE1isa/dk//YY9rkhdZjU9v1JvS22mTLZv1aV1zjavk0VTPAVOmqWeQe/sTlPYRYQaGrwNFMXIGQxiMTOUkjw+P4tzeos6XMBMjlq0mHtsgW2O2tk8MGag3Q1PQMDjwJwKP/DJel5ahDwO2VXw9KVdjdeu4fV2l1Ws+/WhvHI8feF2HskM4Ai++TLIdB9QwMXrvUtN6ievQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HTXKTYc4Bq0J1YDTtWMLFNu7g47+hz2JCySXU/g7sak=;
 b=Ingf934ihN+HtEEJUOJNpWcQjQqSD2uRohpyHoFcBs2mJCik9RmSFBDlmENUIeeN/8f+Bfc4Uc6S0s5Bj7YboIAGS9zHIQzPx4lmfRY5l5KOjTIH38KwqwU3WpgbNH+gTpz6kYt6LnHcOv4a46W785HnBAElBNGvjO1nzkH3VpFX8mF8aEwvP47WiogNSJ1OCO2YrjMoHK5OVcz182ncO67iU4I3DW+F4yy27FbaAECZhfS500mQlJvtqbiZmqf2n8f0xmSCpkS85v+8NnqvgH8IFHcCPCutKLQe0LZDxKxPPQXfuDPgGxdWP0n+rB/wWReGDFOwXvdNecM6fRuFfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HTXKTYc4Bq0J1YDTtWMLFNu7g47+hz2JCySXU/g7sak=;
 b=Q0914zHfMlLAejnjbzxP6byT0QzzbE8lc5E9x6XPM9PyuTejES5bVzfltjzB0qPVhdpm7HVxF7X62Ebbbwg4fBLjJfOHQ2pch9JXLv12wzYAbGTbM1z58WVwrwXDsUVNzYr77bFi6os0Ura0nWdukgltKrNpdv7tkbHhatPZ2aA=
Received: from BL0PR02CA0005.namprd02.prod.outlook.com (2603:10b6:207:3c::18)
 by DM6PR02MB4298.namprd02.prod.outlook.com (2603:10b6:5:2a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2559.14; Thu, 26 Dec
 2019 12:12:48 +0000
Received: from SN1NAM02FT017.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e44::202) by BL0PR02CA0005.outlook.office365.com
 (2603:10b6:207:3c::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2559.14 via Frontend
 Transport; Thu, 26 Dec 2019 12:12:48 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 SN1NAM02FT017.mail.protection.outlook.com (10.152.72.115) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2559.14
 via Frontend Transport; Thu, 26 Dec 2019 12:12:47 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1ikS0V-0003KF-51; Thu, 26 Dec 2019 04:12:47 -0800
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1ikS0Q-0007xv-1n; Thu, 26 Dec 2019 04:12:42 -0800
Received: from xsj-pvapsmtp01 (xsj-pvapsmtp01.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id xBQCCaGA003167;
        Thu, 26 Dec 2019 04:12:37 -0800
Received: from [10.140.6.6] (helo=xhdappanad40.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1ikS0K-0007v9-DW; Thu, 26 Dec 2019 04:12:36 -0800
From:   Srinivas Neeli <srinivas.neeli@xilinx.com>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        michal.simek@xilinx.com, shubhrajyoti.datta@xilinx.com
Cc:     linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, git@xilinx.com
Subject: [PATCH 6/8] gpio: zynq: Disable the irq if it is not a wakeup source
Date:   Thu, 26 Dec 2019 17:42:16 +0530
Message-Id: <1577362338-28744-7-git-send-email-srinivas.neeli@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1577362338-28744-1-git-send-email-srinivas.neeli@xilinx.com>
References: <1577362338-28744-1-git-send-email-srinivas.neeli@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83;IPV:;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(396003)(376002)(136003)(346002)(189003)(199004)(81166006)(7696005)(26005)(186003)(44832011)(8936002)(81156014)(8676002)(6636002)(426003)(336012)(2906002)(478600001)(5660300002)(316002)(9786002)(70206006)(36756003)(107886003)(2616005)(356004)(4326008)(70586007)(6666004);DIR:OUT;SFP:1101;SCL:1;SRVR:DM6PR02MB4298;H:xsj-pvapsmtpgw01;FPR:;SPF:Pass;LANG:en;PTR:unknown-60-83.xilinx.com;MX:1;A:1;
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f7695a26-6ac3-424f-c501-08d789fcebc8
X-MS-TrafficTypeDiagnostic: DM6PR02MB4298:
X-Microsoft-Antispam-PRVS: <DM6PR02MB4298E3094B219056DB74E76DAF2B0@DM6PR02MB4298.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-Forefront-PRVS: 02638D901B
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8Of2/mIekZ2S0iJh1veeux24/F9b/krOt71jUdo5bmjQfmgYvdeYjfI6Es4HWpafbECcWh7ve/WJBlGFon1tVxe1h6mvQZXRsnqHNB7rgLJpVFX5lMeWhan+VCrXtaFf6Ri7Sccet0+kZLX4GjX4nFa/cA52UsL53MliSe6OqfgCRBwf6S+JZxTLLVqYY7j6yaVZ5UASKT2gqqiiYnGGWucUjNGdwiJ6BqtEulz3UggQI5wZpwHqdbuzQf/pFXwFP3KJkmYf1lUkcmp0VCXIIUK8/7YBDrP3a0ikejSXndYEqW4vfH57T0l9X1VW3SMrciBIfYV9LYHxyYfFkRb3pIFBuQu87bH/5HaaMW6d3m4wPfEdlz0HfuB8oqdJ5TrQafzaISLtqYrqPw2qYhNntvTwX4U6aTroXhGIa8c1lt7haq4x1jtaFTAvrqvNweFq
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Dec 2019 12:12:47.5660
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f7695a26-6ac3-424f-c501-08d789fcebc8
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB4298
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
index 8b913b39f5fa..04e7a993be8b 100644
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

