Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0818212AC23
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Dec 2019 13:13:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726597AbfLZMNM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 26 Dec 2019 07:13:12 -0500
Received: from mail-mw2nam12on2043.outbound.protection.outlook.com ([40.107.244.43]:59457
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726060AbfLZMMo (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 26 Dec 2019 07:12:44 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l/TIBEZLeUYtKIQccCSuNuDouV0I8zJlAapxboeQwXG5Ue14JNQJNdoMTINOcPGxrclXVSX52Z7pQbyVrELLgMQFihpcGXBs3uMQ2Mjcw/yClyFVGjpBSan2ndGLXG0kUZTTLpBk7EHpUrwZmxXonyRlVi9qtRV2AHg2984Ne+vCIgmX40as6kv3QA+SKyXEOJXUTC0/vwqrd86e59xJicvnsueeQaMJL+OcHlnSIBBhAw8ZkPrUgKSVwcmhVA/WW/YfS0cDjRQEJqmjaqEHkeNR1H0Tf2d28n5rJ2wXFs4EOB6v2w8ykJeDpjay6OVZvRXnhAlb3kO9KKXucXKQOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=srs7Q8sszDaLxxLw0b00KRF5F0W9kcUoYsOHvyAhJP8=;
 b=CF5ww36QnzLY9XZJn5ShNf6kN7iz189HXG7eZ99S+7u/4aE+2z/FQ4LGX0HeHK9PgARXLsNQMCAxWL3BlOLOfKmck1IFmV8MOJc9OiMY9pWiIrC2/nkfD72sAjMk1tyT2JVeJFvllcZtEUErmIzKSWYaaCyehbFtUE39hfB3cn8f56RfPFhIwJAFn5N+KBDi6g9K+/7j0EwAlfr0mZ84695UbijK3SfGpgBnHrHsUqnke6BTHsxKJ/O/uEjTvP69EKhT5ISL0jwm+9HDO6/0qfNFbzp8HQ+HRheGoXbUEmwt0I349UzMGtrEgiw1oZ6fPZpH7j8aufydFXkFxWVfeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=srs7Q8sszDaLxxLw0b00KRF5F0W9kcUoYsOHvyAhJP8=;
 b=oS0tm2wihyKh66uYQjtx+jxTKBab15FJY1k90y9Wibeoz3h4fg5mN3yeb2rOEC1OfukMxSPWgO4gXKzpRVQZ2FbTZHzZm9UYdswg1xsFAyDw2J35AUcfopFvNq6m3Ic1iWkVhDnEyz4fGWsMYbGUkUyLqvlg18DtdfF/zEO84Mo=
Received: from CY4PR02CA0033.namprd02.prod.outlook.com (2603:10b6:903:117::19)
 by DM6PR02MB4425.namprd02.prod.outlook.com (2603:10b6:5:2a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2581.11; Thu, 26 Dec
 2019 12:12:37 +0000
Received: from CY1NAM02FT042.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e45::209) by CY4PR02CA0033.outlook.office365.com
 (2603:10b6:903:117::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2581.11 via Frontend
 Transport; Thu, 26 Dec 2019 12:12:37 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 CY1NAM02FT042.mail.protection.outlook.com (10.152.75.136) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2559.14
 via Frontend Transport; Thu, 26 Dec 2019 12:12:36 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1ikS0K-0003JT-Eo; Thu, 26 Dec 2019 04:12:36 -0800
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1ikS0F-0007wQ-B3; Thu, 26 Dec 2019 04:12:31 -0800
Received: from xsj-pvapsmtp01 (mail.xilinx.com [149.199.38.66] (may be forged))
        by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id xBQCCNRp003123;
        Thu, 26 Dec 2019 04:12:24 -0800
Received: from [10.140.6.6] (helo=xhdappanad40.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1ikS07-0007v9-Eh; Thu, 26 Dec 2019 04:12:23 -0800
From:   Srinivas Neeli <srinivas.neeli@xilinx.com>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        michal.simek@xilinx.com, shubhrajyoti.datta@xilinx.com
Cc:     linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, git@xilinx.com
Subject: [PATCH 1/8] gpio: zynq: Fix for bug in zynq_gpio_restore_context API
Date:   Thu, 26 Dec 2019 17:42:11 +0530
Message-Id: <1577362338-28744-2-git-send-email-srinivas.neeli@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1577362338-28744-1-git-send-email-srinivas.neeli@xilinx.com>
References: <1577362338-28744-1-git-send-email-srinivas.neeli@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83;IPV:;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(136003)(396003)(39860400002)(346002)(376002)(189003)(199004)(107886003)(6636002)(6666004)(356004)(9786002)(4326008)(316002)(36756003)(5660300002)(70586007)(8936002)(426003)(8676002)(81156014)(81166006)(7696005)(26005)(70206006)(44832011)(2616005)(336012)(186003)(2906002)(478600001)(42866002);DIR:OUT;SFP:1101;SCL:1;SRVR:DM6PR02MB4425;H:xsj-pvapsmtpgw01;FPR:;SPF:Pass;LANG:en;PTR:unknown-60-83.xilinx.com;MX:1;A:1;
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4335e0c7-003e-4d6a-3ae8-08d789fce573
X-MS-TrafficTypeDiagnostic: DM6PR02MB4425:
X-Microsoft-Antispam-PRVS: <DM6PR02MB4425271C5EDABA0FD0C85489AF2B0@DM6PR02MB4425.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-Forefront-PRVS: 02638D901B
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MvFJ+wA59OxbbKs6owaCOXo1Fe9A9BcXhszRbcXDVWFvWHiOZl370xhXKoaeXg3BPIzgI/1HfVq70ZJvOVwLWR5BK18z7zNwZQBCc4AianCDtlt6cYM4iUiRsWB6pmAj+7jst2/bIta+0g4s2RamNY5xXM2ozWocPjGo7HNK+NgVABvU+dMB8qjEKqCaU24vtOQSrjWallOEFGghCgHO9dXs6CHgsSf0yBTln5CA01w5vEX4YAaTJtWZCEHh36lEOS0cg1YabQjyzAn+5JjzWvSO9QqO3c/ErjLWi/KC5CXrE0Id7ZcKm32AnYx5D+LgUJAE68dBq0+ozYwlOQrRf4dRKAZk9Qf8lOfkUam/WrV/599/xy7k4eyliCf6cKD38eGjqPYp5+2ylEWwA/iE9bNaSoL/9aTumM4ZIFl4zciYBddLsG4sfFndU0Vz017wXveM3RNxRW7n6HxC83z0V7fSER/AGQ7a94AGSHaBUxVtS62EsanxJnvLkLbi+Wsz
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Dec 2019 12:12:36.9221
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4335e0c7-003e-4d6a-3ae8-08d789fce573
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB4425
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Swapna Manupati <swapna.manupati@xilinx.com>

This patch writes the inverse value of Interrupt Mask Status
register into the Interrupt Enable register in
zynq_gpio_restore_context API to fix the bug.

Fixes: e11de4de28c0 ("gpio: zynq: Add support for suspend resume")
Signed-off-by: Swapna Manupati <swapna.manupati@xilinx.com>
Signed-off-by: Michal Simek <michal.simek@xilinx.com>
Signed-off-by: Srinivas Neeli <srinivas.neeli@xilinx.com>
---
 drivers/gpio/gpio-zynq.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-zynq.c b/drivers/gpio/gpio-zynq.c
index 4c3f6370eab4..05ba16fffdad 100644
--- a/drivers/gpio/gpio-zynq.c
+++ b/drivers/gpio/gpio-zynq.c
@@ -684,6 +684,8 @@ static void zynq_gpio_restore_context(struct zynq_gpio *gpio)
 	unsigned int bank_num;
 
 	for (bank_num = 0; bank_num < gpio->p_data->max_bank; bank_num++) {
+		writel_relaxed(ZYNQ_GPIO_IXR_DISABLE_ALL, gpio->base_addr +
+				ZYNQ_GPIO_INTDIS_OFFSET(bank_num));
 		writel_relaxed(gpio->context.datalsw[bank_num],
 			       gpio->base_addr +
 			       ZYNQ_GPIO_DATA_LSW_OFFSET(bank_num));
@@ -693,9 +695,6 @@ static void zynq_gpio_restore_context(struct zynq_gpio *gpio)
 		writel_relaxed(gpio->context.dirm[bank_num],
 			       gpio->base_addr +
 			       ZYNQ_GPIO_DIRM_OFFSET(bank_num));
-		writel_relaxed(gpio->context.int_en[bank_num],
-			       gpio->base_addr +
-			       ZYNQ_GPIO_INTEN_OFFSET(bank_num));
 		writel_relaxed(gpio->context.int_type[bank_num],
 			       gpio->base_addr +
 			       ZYNQ_GPIO_INTTYPE_OFFSET(bank_num));
@@ -705,6 +704,9 @@ static void zynq_gpio_restore_context(struct zynq_gpio *gpio)
 		writel_relaxed(gpio->context.int_any[bank_num],
 			       gpio->base_addr +
 			       ZYNQ_GPIO_INTANY_OFFSET(bank_num));
+		writel_relaxed(~(gpio->context.int_en[bank_num]),
+			       gpio->base_addr +
+			       ZYNQ_GPIO_INTEN_OFFSET(bank_num));
 	}
 }
 
-- 
2.7.4

