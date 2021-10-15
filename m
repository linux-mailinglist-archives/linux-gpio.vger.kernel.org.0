Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D93642F5E8
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Oct 2021 16:44:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232174AbhJOOqG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 15 Oct 2021 10:46:06 -0400
Received: from mail-mw2nam12on2045.outbound.protection.outlook.com ([40.107.244.45]:13152
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232140AbhJOOqF (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 15 Oct 2021 10:46:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d+eg7uqjCa6du/ldCbFsLNyp02Tv8EC1M56HT37oYPrkMINMzDFay1o8klMdqd2KmCeChm01jbNZRWbgwmvInTfU67afK8vfx5qAm/QBL3Lz2sM8wf3F3CMZDL1nQNyF/ZIu4SrdA8BTNaEmgzBYXq2+WE8EAZte8gxJgeyVNtkbqmXrjKiFIZt7Rzt0UyGVYI/KMgi78UWGIN9zo+Bh3OPDooA8rsopGhytEBsUwyiqFIcepUqODPHR5tt5ajCIdfuy0zq3xL+691gRx960oP/qZ81Umy7KK0oQeac+mpnC8IZdjp880QmcmqYo1lbaX7HgD7kWc+W8EkPZHaf6rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pAYgRdkq7DDPUNsGJcfi+5SZAII+Q1WUQlvPDjLdpYs=;
 b=WZqY6xGlzIJMB9ScAQOwzJGKUD5w3MnsoJtP/UB50XyZgAXJb+inCeBsbEZd9+430rZwpBKevyGDbDh+BUObUVWcZQ5kpGmqaB1/kxTbDRhSxRESPN614SMci8uRqy9NQdgentXVX8pxHDA8SyE0+rL9NYUCzxg//7pZoZPPNQRigQmfWacl1kWJGASgrzd7ClIjkYo0SFKsDxJieGt5xFpZmA48ugCKGPxEd0moRqP3k3c8X+oSeRu8uPZfWQGlhQ5b1WfXfhC4jgRthUFLwq2fubcUv6/CmaMKfFDnTeC6vpiaK6RqQWdP7N6XrkY+dxF7RjbRrfy43yMRz4u3mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pAYgRdkq7DDPUNsGJcfi+5SZAII+Q1WUQlvPDjLdpYs=;
 b=wnQksmNvVWAMzxL4m8wD9xU3UDulh56pBNT3XYqTgag+/EWxNLXPX2Yb6KrXd3SodBMV27o+k2V/mVTOZdlltjYdIwGP1y4Pajh9X/FInrPeKEsq8nw7SkL9IsTOo/X+x39MmcSUc4KaG9o4k5c+eqP8hz4bON5bdazglVgwvVE=
Received: from BN9PR03CA0428.namprd03.prod.outlook.com (2603:10b6:408:113::13)
 by DM4PR12MB5279.namprd12.prod.outlook.com (2603:10b6:5:39f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Fri, 15 Oct
 2021 14:43:57 +0000
Received: from BN8NAM11FT041.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:113:cafe::cc) by BN9PR03CA0428.outlook.office365.com
 (2603:10b6:408:113::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16 via Frontend
 Transport; Fri, 15 Oct 2021 14:43:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT041.mail.protection.outlook.com (10.13.177.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Fri, 15 Oct 2021 14:43:57 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Fri, 15 Oct
 2021 09:43:56 -0500
From:   Mario Limonciello <mario.limonciello@amd.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
CC:     "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Nehal Shah <Nehal-bakulchandra.Shah@amd.com>,
        "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH] pinctrl: amd: Fix wakeups when IRQ is shared with SCI
Date:   Fri, 15 Oct 2021 09:43:32 -0500
Message-ID: <20211015144332.700-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 31eb1b28-8019-4eda-e6b1-08d98fea383e
X-MS-TrafficTypeDiagnostic: DM4PR12MB5279:
X-Microsoft-Antispam-PRVS: <DM4PR12MB52792D5B73C368CB14D789B6E2B99@DM4PR12MB5279.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hnqnR2QE7aqaO1N3+XSbd++UNQMOdKrBQYTmCQ9JV8/YHcubXJ3inYwNLjEct9tUKOT+fDOoaNqZ+MvE1dZ6Uub1YDcRxZvrzVdFse0hcQpP3147jkT96cfAd3pblWGPkdBNIjAi77smBofUxTurRBR6eNQphlTXB8FJQk4d8bpt/astUe1TVoNghu3+/5JtJupCfjZWtETkyl4kQSUL7C44ykl8C2Fv++Q0CDOK/uAPD8dfS75Nnh4om7EVAw5YnjyADit4C9CJIUfLX/Exj6Vo4c4BN+uduQQcKuKFQDE+mWtPpbEqGJIjiy7Y6z2FfMqwvX88TUuHrd7hbIz0+Lq5tN4PvwDRvKwqfllAE0rNCQ4wIr8hi3NIShafUvq6ns4l6XmCKtKC+EHj/UUE1cCpNkkVWi9B7j8vDK8EYIVZbGaRWDOGZ6tPgVY1Mznbj9aaDvunTkf454MVsQzQ8oZnEkta3ABsHs0bhOZQvTsrchc18Ug8qe25Uax+w2G3G6Lxc8M4GbQxyxXbB+kFwc1fUAB9LdQL066UyKW6wYMygVEvwItX89/Fk8Cg8+jk5z2veCqJDvyp9Ndgtb4xK3EQ1e6FAFDRsgjAV8CmVz+WpOOgl3VWKJuEX92lkfHgSTjx7iZANFiPkTvI9wWaR2z226GFswFT1M1Q2/HSf+ROs/9BeXuwsaadSOH9e8QsNLwjJZzHqNJe+RW8yC5M2CZLXbIWn222f17O17GptRg=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(86362001)(110136005)(2906002)(966005)(426003)(81166007)(8936002)(5660300002)(8676002)(1076003)(26005)(36756003)(36860700001)(336012)(16526019)(186003)(47076005)(356005)(508600001)(70586007)(44832011)(4326008)(70206006)(54906003)(6636002)(6666004)(7696005)(316002)(2616005)(82310400003)(83380400001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2021 14:43:57.7961
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 31eb1b28-8019-4eda-e6b1-08d98fea383e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT041.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5279
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On some Lenovo AMD Gen2 platforms the IRQ for the SCI and pinctrl drivers
are shared.  Due to how the s2idle loop handling works, this case needs
an extra explicit check whether the interrupt was caused by SCI or by
the GPIO controller.

To fix this rework the existing IRQ handler function to function as a
checker and an IRQ handler depending on the calling arguments.

BugLink: https://gitlab.freedesktop.org/drm/amd/-/issues/1738
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/pinctrl/Kconfig       |  2 +-
 drivers/pinctrl/pinctrl-amd.c | 27 ++++++++++++++++++++++++---
 2 files changed, 25 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index 31921108e456..bd67babe9e87 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -96,7 +96,7 @@ config PINCTRL_AT91PIO4
 config PINCTRL_AMD
 	tristate "AMD GPIO pin control"
 	depends on HAS_IOMEM
-	depends on ACPI || COMPILE_TEST
+	depends on ACPI
 	select GPIOLIB
 	select GPIOLIB_IRQCHIP
 	select PINMUX
diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index 8d0f88e9ca88..f228e1dadef9 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -598,16 +598,16 @@ static struct irq_chip amd_gpio_irqchip = {
 
 #define PIN_IRQ_PENDING	(BIT(INTERRUPT_STS_OFF) | BIT(WAKE_STS_OFF))
 
-static irqreturn_t amd_gpio_irq_handler(int irq, void *dev_id)
+static bool _amd_gpio_irq_handler(int irq, void *dev_id)
 {
 	struct amd_gpio *gpio_dev = dev_id;
 	struct gpio_chip *gc = &gpio_dev->gc;
-	irqreturn_t ret = IRQ_NONE;
 	unsigned int i, irqnr;
 	unsigned long flags;
 	u32 __iomem *regs;
 	u32  regval;
 	u64 status, mask;
+	bool ret = false;
 
 	/* Read the wake status */
 	raw_spin_lock_irqsave(&gpio_dev->lock, flags);
@@ -627,6 +627,12 @@ static irqreturn_t amd_gpio_irq_handler(int irq, void *dev_id)
 		/* Each status bit covers four pins */
 		for (i = 0; i < 4; i++) {
 			regval = readl(regs + i);
+			/* called from resume context on a shared IRQ, just
+			 * checking wake source.
+			 */
+			if (irq < 0 && !(regval & BIT(WAKE_STS_OFF)))
+				return true;
+
 			if (!(regval & PIN_IRQ_PENDING) ||
 			    !(regval & BIT(INTERRUPT_MASK_OFF)))
 				continue;
@@ -650,9 +656,12 @@ static irqreturn_t amd_gpio_irq_handler(int irq, void *dev_id)
 			}
 			writel(regval, regs + i);
 			raw_spin_unlock_irqrestore(&gpio_dev->lock, flags);
-			ret = IRQ_HANDLED;
+			ret = true;
 		}
 	}
+	/* called from resume context on shared IRQ but didn't cause wake */
+	if (irq < 0)
+		return ret;
 
 	/* Signal EOI to the GPIO unit */
 	raw_spin_lock_irqsave(&gpio_dev->lock, flags);
@@ -664,6 +673,16 @@ static irqreturn_t amd_gpio_irq_handler(int irq, void *dev_id)
 	return ret;
 }
 
+static irqreturn_t amd_gpio_irq_handler(int irq, void *dev_id)
+{
+	return _amd_gpio_irq_handler(irq, dev_id) ? IRQ_HANDLED : IRQ_NONE;
+}
+
+static bool amd_gpio_check_wake(void *dev_id)
+{
+	return _amd_gpio_irq_handler(-1, dev_id);
+}
+
 static int amd_get_groups_count(struct pinctrl_dev *pctldev)
 {
 	struct amd_gpio *gpio_dev = pinctrl_dev_get_drvdata(pctldev);
@@ -1002,6 +1021,7 @@ static int amd_gpio_probe(struct platform_device *pdev)
 		goto out2;
 
 	platform_set_drvdata(pdev, gpio_dev);
+	acpi_register_wakeup_handler(gpio_dev->irq, amd_gpio_check_wake, gpio_dev);
 
 	dev_dbg(&pdev->dev, "amd gpio driver loaded\n");
 	return ret;
@@ -1019,6 +1039,7 @@ static int amd_gpio_remove(struct platform_device *pdev)
 	gpio_dev = platform_get_drvdata(pdev);
 
 	gpiochip_remove(&gpio_dev->gc);
+	acpi_unregister_wakeup_handler(amd_gpio_check_wake, gpio_dev);
 
 	return 0;
 }
-- 
2.25.1

