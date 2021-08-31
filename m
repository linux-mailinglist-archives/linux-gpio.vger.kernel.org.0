Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA2D83FC70C
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Aug 2021 14:29:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241637AbhHaMIC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 31 Aug 2021 08:08:02 -0400
Received: from mail-mw2nam12on2043.outbound.protection.outlook.com ([40.107.244.43]:22752
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S241707AbhHaMHk (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 31 Aug 2021 08:07:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PZBA3JHWhpUO/bUw1/I7yxKbLvlmpez3eEpmFC2jUAXRlFuWg0mwQvHl9X+iMg/xI6ZMwJhEnu+7KSByU3oCJah6sJkWCXimtePGeIvDtr+wd4yzL3nsNK1Xw7u9Dq8zdnt5EULCnyYS2w37A+h6bqaTEIK1J3GOzFlSyzX0LUeT0EdjhCT0Jj1p3RZAgCrRlg22F3bF47gZO3PSGkh/pIt6sSAkZVHPOP5J7FVV32F7lv017dc71LmqBUzfPa+3wOUJDms6rSkc4aKzEk/pMB7KdVq9Kz/953t9/YhWNk7Uu9ZFKDZxfF8CYTu46vEeKpdC7sR6Q/bzJda/wksZmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=nmja5eKGdENevEm4HCUs+h5pzNfi2ty2EwxmkX1Z6GE=;
 b=ARZHMIWaSjjZ85+qo9r/kc6tF7pm8MBK2RB0R8YDWpo4EjiObnrDVap24dEvUW3RS3daaMcjpDIre1/gLIWyaZCqTo1sa5O1aBdS5F7amkHwFwaLHF0VdcfkrCkwEMtitYZwWMzHq4ODN0X3UL4FmgmYp49Anpcs65R7+iDpdvGDXEFzJyFhKkSwhQAnfbT0eJzyYinggp5cTMYQQGFnyCIa55mufn/bZUyu1FmeihHxUoqR00suA1pk++SU25/CqTOON8uhWwsIQddoyxXREK1ny0LOC2IcunvgqNoVuEO7P4uzYP+E2I/JZKHZVp8uINuE7XfhMyOb+lSgjy0abA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nmja5eKGdENevEm4HCUs+h5pzNfi2ty2EwxmkX1Z6GE=;
 b=A59mcUuRv0dkjNOdvCUXWxnUyX3Q4+wD/7i7OcQQvLvancyE8aVN9oM2AZeaWcbbP3zfRry984zB09Og+PVnFlRefBURjCA+5sCuSzW+7IF4NR5ZZuazS5BnCe7U3u5B7eYeRQk5xtTLtiV64Dtghkf21WNoxueNe+Riu+BJNRA=
Received: from BN9PR03CA0641.namprd03.prod.outlook.com (2603:10b6:408:13b::16)
 by BY5PR12MB3825.namprd12.prod.outlook.com (2603:10b6:a03:1a2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.17; Tue, 31 Aug
 2021 12:06:42 +0000
Received: from BN8NAM11FT024.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:13b:cafe::9f) by BN9PR03CA0641.outlook.office365.com
 (2603:10b6:408:13b::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.17 via Frontend
 Transport; Tue, 31 Aug 2021 12:06:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT024.mail.protection.outlook.com (10.13.177.38) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4457.17 via Frontend Transport; Tue, 31 Aug 2021 12:06:42 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Tue, 31 Aug
 2021 07:06:37 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <linus.walleij@linaro.org>, <linux-gpio@vger.kernel.org>,
        <Shyam-sundar.S-k@amd.com>
CC:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH 2/2] pinctrl: amd: Handle wake-up interrupt
Date:   Tue, 31 Aug 2021 17:36:13 +0530
Message-ID: <20210831120613.1514899-3-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210831120613.1514899-1-Basavaraj.Natikar@amd.com>
References: <20210831120613.1514899-1-Basavaraj.Natikar@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2bb600a6-2a13-4900-45e1-08d96c77cbbe
X-MS-TrafficTypeDiagnostic: BY5PR12MB3825:
X-Microsoft-Antispam-PRVS: <BY5PR12MB38254FD27725915E579E654DE6CC9@BY5PR12MB3825.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:478;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a+a1ZP2RZzSxX/UfwvDfTYJhbllQibATe/fOIa6kOwUbZlaAuRcs6yyBB0a+dVBkZvitA448muvfU02aFeINpbIPURZ/u4jKJNrgT5xrNgmjT2dCspUq1QUWSFNOHT4JfmOvWw8fCLqwjinpksC5XE5ZqziKwaTCAGPcZDj7HvD9CVzp1bayi8tsG18TZ5COidkMnvC8FDKkf7M10xs//BkcoQnpJ5MJTULKv6PTjqyjxRo2g44Tm2n0pPkJoH5pV2aM1mNXFvzhg7/lkytbNPUVpPLhBS1/X/KAlZVjbgb4ijN9Arb36C8YJ9SCNXljfGV1q1UARRMUw5+1SG5o5jhsrYDReWri7cKC+ZZYwIcflCSPumDwBH1amxOae7Gb1//OO5hNbyw8mivOUBTRbMHoNMjlxoWjC3pmr/UaMR06eMw42zHfYHzpNhOvTbwAPMgQ9q+bwS6FBCEADUWRuQU5ocabdI7AvdeVSM/oH621KfApuqczm4MgGqHXS0MuFsKLB8bviQBSkSugme/A4a0YmzzJ0JQiNyApB6fqj2golvxEuq+ZUrc4rYrkWdISnUkCit9XGo/o/vCk4ZkXL4mSLKN/YsiKT/6V3brDNCkk3loKQvGtO5Nb+Q4QQdle5166IzGU3RICdKnEF6gf8WAXwt2mgzZvqBtiX1y1ghist02JmGcgritoqrFK5exCmQXI1JIji5lZr++M48OErVB7mphE4CGrF0DhLZ89e6ssz58iim+KKjHDej8dLVGK
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(376002)(396003)(136003)(39860400002)(346002)(36840700001)(46966006)(7696005)(2616005)(86362001)(70586007)(6636002)(36756003)(36860700001)(5660300002)(4326008)(70206006)(110136005)(26005)(316002)(186003)(16526019)(6666004)(8936002)(336012)(82310400003)(83380400001)(47076005)(8676002)(478600001)(426003)(82740400003)(2906002)(356005)(1076003)(81166007)(36900700001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2021 12:06:42.4358
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bb600a6-2a13-4900-45e1-08d96c77cbbe
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT024.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3825
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Enable/disable power management wakeup mode, which is disabled by
default. enable_irq_wake enables wakes the system from sleep.

Hence added enable/disable irq_wake to handle wake-up interrupt.

Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/pinctrl/pinctrl-amd.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index 79b8b7f91996..d19974aceb2e 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -445,6 +445,7 @@ static int amd_gpio_irq_set_wake(struct irq_data *d, unsigned int on)
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct amd_gpio *gpio_dev = gpiochip_get_data(gc);
 	u32 wake_mask = BIT(WAKE_CNTRL_OFF_S0I3) | BIT(WAKE_CNTRL_OFF_S3);
+	int err;
 
 	raw_spin_lock_irqsave(&gpio_dev->lock, flags);
 	pin_reg = readl(gpio_dev->base + (d->hwirq)*4);
@@ -457,6 +458,15 @@ static int amd_gpio_irq_set_wake(struct irq_data *d, unsigned int on)
 	writel(pin_reg, gpio_dev->base + (d->hwirq)*4);
 	raw_spin_unlock_irqrestore(&gpio_dev->lock, flags);
 
+	if (on)
+		err = enable_irq_wake(gpio_dev->irq);
+	else
+		err = disable_irq_wake(gpio_dev->irq);
+
+	if (err)
+		dev_err(&gpio_dev->pdev->dev, "failed to %s wake-up interrupt\n",
+			on ? "enable" : "disable");
+
 	return 0;
 }
 
-- 
2.25.1

