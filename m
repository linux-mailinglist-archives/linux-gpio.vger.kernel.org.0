Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6702616121D
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2020 13:34:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729399AbgBQMdk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Feb 2020 07:33:40 -0500
Received: from mail-co1nam11on2041.outbound.protection.outlook.com ([40.107.220.41]:19808
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728088AbgBQMdk (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 17 Feb 2020 07:33:40 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jc25Z8nGY1icHHPzM5pUKERcee766pbqSK3W/G9pCNiZ7M7Dy0agcPE/2Tfpjpc3vfRNATIzUMNXXXWkm9mw1oZtyS37EGp0pqkK+ZcdlpnMTnOikQ8qYi/KTM8QNdkqUPI9HA0qzTDct+CRyEY0rpmyhKqHiU7DaStQJ2rMEOZ4i//SzRQ+xvpwYhCcSDzJlJuC9HU1r3q7ecl2Nx5RPViRwVBuEWNx6CWQ/rVMAl47LlLjWPLiSVeCD0a9aODUDoLj+MMOfmR94eNSPvAuOPLHGuUt1J5I4ses6tqI5lRAAEzzfrY5C6pjPy7w6WNh4BV5FGC7TFCIr5pHuMrKAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IB9uxm7lwYo7dVHyVjIwXxLpQBJ2/CAVJvzzFPwPt4E=;
 b=MFR9Am6HHO4J0nrC/n/b6eDkeFeqPmZ3/gwiXyLK0A6Xy3LnFt+KP2EUDI4F6vHCN22fjzagS9RGrySu47RbQTJSNxrkcb/Y/7hxZoZxgC5nkmRZ3Px7ca+8aJFyYVw8j3RGshCtnmHriUP6D+Tgf6fDmIkkUJXnsSQSmuwypInMrvFc4RwPkt31p/FXo+olwbGzLP9Nv3gk1NG7T0VaQ/qlGdL1loL+EKxdpzmxgdIJThb2Kl7cq0BPgyq1VzCS4kM4h79Gcwh0e2roo+XF2EzBFwI5nyK1W8LJkqVErjZV6sAEQYRYMrUmHFnmNLSA3Hy40aJNidw8SsOmxwMsxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IB9uxm7lwYo7dVHyVjIwXxLpQBJ2/CAVJvzzFPwPt4E=;
 b=W4ihzut7YQRd+dVYqpfAMadXOrVtJGtba/NYtAKbfg8DUXRmy7vySxZSMZVqTDkPI2nuKUcWfLdMtdqn8LKjQ60/28aYe1xtxGoBFaOA0WaY+mqEKgarbYmN8E8KNK6QLrTvYJSjqwAEOzX1d7PPDTLFW5XZmHdo9AktKOgqDM4=
Received: from CY4PR02CA0040.namprd02.prod.outlook.com (2603:10b6:903:117::26)
 by BL0PR02MB5618.namprd02.prod.outlook.com (2603:10b6:208:8f::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.22; Mon, 17 Feb
 2020 12:33:37 +0000
Received: from SN1NAM02FT008.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e44::200) by CY4PR02CA0040.outlook.office365.com
 (2603:10b6:903:117::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.25 via Frontend
 Transport; Mon, 17 Feb 2020 12:33:37 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 SN1NAM02FT008.mail.protection.outlook.com (10.152.72.119) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2729.22
 via Frontend Transport; Mon, 17 Feb 2020 12:33:37 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1j3fai-0000Sd-Vd; Mon, 17 Feb 2020 04:33:36 -0800
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1j3fad-0001wt-Sc; Mon, 17 Feb 2020 04:33:31 -0800
Received: from xsj-pvapsmtp01 (xsj-smtp.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 01HCXTxx025919;
        Mon, 17 Feb 2020 04:33:29 -0800
Received: from [10.140.6.6] (helo=xhdappanad40.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1j3fab-0001uE-9H; Mon, 17 Feb 2020 04:33:29 -0800
From:   Srinivas Neeli <srinivas.neeli@xilinx.com>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        michal.simek@xilinx.com, shubhrajyoti.datta@xilinx.com
Cc:     linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, git@xilinx.com
Subject: [PATCH V3 5/7] gpio: zynq: Disable the irq if it is not a wakeup source
Date:   Mon, 17 Feb 2020 18:03:11 +0530
Message-Id: <1581942793-19468-6-git-send-email-srinivas.neeli@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1581942793-19468-1-git-send-email-srinivas.neeli@xilinx.com>
References: <1581942793-19468-1-git-send-email-srinivas.neeli@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83;IPV:;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(136003)(396003)(376002)(346002)(39860400002)(199004)(189003)(8676002)(107886003)(8936002)(70206006)(356004)(4326008)(6666004)(2616005)(81156014)(186003)(26005)(426003)(5660300002)(70586007)(336012)(44832011)(316002)(9786002)(81166006)(36756003)(6636002)(7696005)(478600001)(2906002);DIR:OUT;SFP:1101;SCL:1;SRVR:BL0PR02MB5618;H:xsj-pvapsmtpgw01;FPR:;SPF:Pass;LANG:en;PTR:unknown-60-83.xilinx.com;A:1;MX:1;
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8baf3487-500c-4e39-5965-08d7b3a59c9e
X-MS-TrafficTypeDiagnostic: BL0PR02MB5618:
X-Microsoft-Antispam-PRVS: <BL0PR02MB5618543877531DEB9517A0BBAF160@BL0PR02MB5618.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-Forefront-PRVS: 0316567485
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zKZZpB1zU2cv3cGc7Tf+YPllxTIBqcdYLG2PCljNQvJ9k6Fe6uaMRJlDWqJZtClpPcpoMequTPpmHDWMZBol9KOJ1JZlldoTZ69GygTANthS71Mpm52PLaZQzdUnbXp837t6aWOXE3+kBiDMUrXhsaRVIKiep4PmrBvZF81fzRmTWnu5vAfYCd78wLFA1dMBinTpH8gPp5gvmziSfF9CTR2bh6Juw2PTz6BtVNvvas1ZliOddqnJNTySxIi92mO7jn1nfX1T/QqTKDTqdruMCVYp3ePV6I8AVZk1PFSFoKSIS3vpZ4mJ4iNqFLqV2+6dW+SQo/HV7P8s/mxolJKfAAxP0v3HpdJDbxTYN2IgQzQJxgNCuBKQIRH6BoUlK8djenqPcTFs3GYfH9FiZ+PjtL+nWyRU2NfEuO/IOCuRPFLAtFzLDVBxrb+BtLT9jSZ+
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2020 12:33:37.3692
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8baf3487-500c-4e39-5965-08d7b3a59c9e
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB5618
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

