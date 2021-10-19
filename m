Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1131D433B99
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Oct 2021 18:04:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230168AbhJSQGh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Oct 2021 12:06:37 -0400
Received: from mail-bn8nam11on2071.outbound.protection.outlook.com ([40.107.236.71]:25697
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232144AbhJSQGg (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 19 Oct 2021 12:06:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nEVYqR5RdAoto9rATDzkW5YPy5TIvoXBjlD8iiEcO2g3CLwNgT4t361QaNN9qPzMtiRk77mn8AkoJ2I6xy8Wxu2e9okQ0I5j/mqN5MbjAs0VHJ/6OTTfoOdCedXrdGfEpOjyDQVLBIxMz7T43AC3P+Bi8xilCMIoHaavksBb0041CyPW857NQkNHqA6dzmXoj2V85RaB2lzjkJ0qWSOjsgwKluOv0nsWcdkbEPvgGCLkhLtjp7rKH6ye6bL1sy/PsGl5ghrLa/m11e91P6BmiVPchPVLH1NBb5idAwYC7X4OHp7OZvRJG3Qj2KMp84PLN7Bm4ajg18TcTGZdpHYY6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Vdyt6RZ3ESmgarHk2T8Z7XDrLbsnx4n0voM5VkJOlo=;
 b=oDMXrcT9B9vEzVxFpucVnwcRtBUml53Lh3UWvTFH+e//8RbfREkvYEZnKWOa7WfU8OnqsaR38Qvm6bilZzUgI9hyJ5SlOEsJGq4Q5yx9Jn3HOPRHRlZYJNw6FcrkYNhVpVm/fWf8GpuuEkEFmNP/q6TkDoTwTvEYQ7BHI/yC8Wduz6RVtskBboKDxnTTerY5W5Kgj6yPwKWE7zmAJHA5zqxzywqqGMFDqOY5V/2BtKFcqK7AO+d4uEf3cla5qOKeKWdC9YLq4IrmcdUm9P67VCDI15q7G8MXX1iBpHJEvn7bgk+4JrgbvDWfBQ0HfYzYNG9MdmQR9J/QmHEU90rqaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Vdyt6RZ3ESmgarHk2T8Z7XDrLbsnx4n0voM5VkJOlo=;
 b=u9xhcielQsauwuNhzJRfwSArZES7sHuHqLbahlGpslWzLMcAgoEWXwm8Qdr4REqzbomVda6Th/iLC/mCJIHI0lvIBCqJ4Ou07WgYgkbB3IU/4PDtZG92CZBj18A5vrIZp3R1r+kcNzakZKUEVfS2IpIVHlHiS1izg81pcXkqREM=
Received: from MW4PR04CA0048.namprd04.prod.outlook.com (2603:10b6:303:6a::23)
 by MWHPR12MB1710.namprd12.prod.outlook.com (2603:10b6:300:114::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Tue, 19 Oct
 2021 16:04:20 +0000
Received: from CO1NAM11FT007.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:6a:cafe::5c) by MW4PR04CA0048.outlook.office365.com
 (2603:10b6:303:6a::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18 via Frontend
 Transport; Tue, 19 Oct 2021 16:04:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT007.mail.protection.outlook.com (10.13.174.131) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Tue, 19 Oct 2021 16:04:19 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Tue, 19 Oct
 2021 11:04:14 -0500
From:   Mario Limonciello <mario.limonciello@amd.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
CC:     "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Nehal Shah <Nehal-bakulchandra.Shah@amd.com>,
        "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Joerie de Gram <j.de.gram@gmail.com>
Subject: [PATCH v3 2/2] pinctrl: amd: Fix wakeups when IRQ is shared with SCI
Date:   Tue, 19 Oct 2021 11:04:01 -0500
Message-ID: <20211019160401.8296-2-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211019160401.8296-1-mario.limonciello@amd.com>
References: <20211019160401.8296-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4eccdfb3-22b7-42ac-16a6-08d9931a1c07
X-MS-TrafficTypeDiagnostic: MWHPR12MB1710:
X-Microsoft-Antispam-PRVS: <MWHPR12MB17107E2AB6E1F7D0AE4D4BA0E2BD9@MWHPR12MB1710.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ay9XKx541qV7dnjIlo/Rs88b0kXyRrq+lKwLaTVAYb9KPdR8OPoXywRBCWP0v30s6MFOJBlgAJ71OsJIugkj+EVlncWFnjFXdRj8QB0bTKA3OWCJc//3vT2wLX/Ddz64Mj9JESHwOQFzlZB1r6QgFhHkwldutt3lwhcueS9ebkqYckt7FkpiE1bHTIdFptJWw0YZQW68mot5hBMszXjOkKg2oppVcOMPgQcqEbU21CcktA04ZO9Q0T6fGJQc3qql0l+VGkxTRdl2jnBx94d6kFOzMB0UeVV+5vrIlyuQ0aV+MYjnDap7KH8+OEVwS9QzRBV3BPcV6bKlcthWmofTntZ72eQcVwqU+NgdMvkUdHW4XLMl7kGv/GaF/sl+OUDfhrT+mMErOxT+GzwIGGSAGYnC7MbBpgmDKHxkKobQ4PCQvb5mz9wOH+/2seEjoJ2L60MCpwUUcs2p8M5XrOaeUDJarvqqQhlKXuQe78JbYrmb3mKzZenWtHoD/gnbeAgm/wKeEbp48gNl88bmPXQSzagFP3g6nxw3nAKQ/eLMzidQy3+VtgRVeYOi7GDf65aMBk2GBsxOgVJqLNdbUBhqDL6vPYeqi970gNMDwNxpYZ5lR8EEagO0jK19k0jpPDcStL+r3x7G8bmGOAx8S+JhQl0ov5fVGNdGu0lkBbAupNFAvLVHfPzWdmeDVXoUkMtjqg65l8nkPI+SRZ6feN1v077Oh0b4Z9hI29f/N3gLk6o=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(70586007)(336012)(2616005)(508600001)(426003)(1076003)(186003)(86362001)(81166007)(8936002)(8676002)(47076005)(6636002)(36756003)(36860700001)(110136005)(26005)(16526019)(356005)(7696005)(2906002)(5660300002)(44832011)(70206006)(83380400001)(4326008)(54906003)(6666004)(966005)(316002)(82310400003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 16:04:19.6876
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4eccdfb3-22b7-42ac-16a6-08d9931a1c07
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT007.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1710
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
Reported-by: Joerie de Gram <j.de.gram@gmail.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
Note:
 This is *possibly* a fix from fdde0ff8590b, 56b991849009 or other
 changes in the acpi_s2idle_wake handling, but AMD didn't support
 s2idle across the kernel widely until 5.14 or later. This is the
 reason for lack of a fixes tag.
Changes from v2->v3:
 * Add new precursor patch for fixing missing ACPI function stubs
 * Add __maybe_unused for unused function when set with COMPILE_TEST
Changes from v1->v2:
 * drop Kconfig changes to drop COMPILE_TEST, instead #ifdef CONFIG_ACPI
 * fix a logic error during wakeup
 * Use IRQ_RETVAL()
 drivers/pinctrl/pinctrl-amd.c | 27 ++++++++++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index d19974aceb2e..1272ecd8791f 100644
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
+			if (irq < 0 && (regval & BIT(WAKE_STS_OFF)))
+				return true;
+
 			if (!(regval & PIN_IRQ_PENDING) ||
 			    !(regval & BIT(INTERRUPT_MASK_OFF)))
 				continue;
@@ -652,9 +658,12 @@ static irqreturn_t amd_gpio_irq_handler(int irq, void *dev_id)
 			}
 			writel(regval, regs + i);
 			raw_spin_unlock_irqrestore(&gpio_dev->lock, flags);
-			ret = IRQ_HANDLED;
+			ret = true;
 		}
 	}
+	/* called from resume context on shared IRQ but didn't cause wake */
+	if (irq < 0)
+		return false;
 
 	/* Signal EOI to the GPIO unit */
 	raw_spin_lock_irqsave(&gpio_dev->lock, flags);
@@ -666,6 +675,16 @@ static irqreturn_t amd_gpio_irq_handler(int irq, void *dev_id)
 	return ret;
 }
 
+static irqreturn_t amd_gpio_irq_handler(int irq, void *dev_id)
+{
+	return IRQ_RETVAL(_amd_gpio_irq_handler(irq, dev_id));
+}
+
+static bool __maybe_unused amd_gpio_check_wake(void *dev_id)
+{
+	return _amd_gpio_irq_handler(-1, dev_id);
+}
+
 static int amd_get_groups_count(struct pinctrl_dev *pctldev)
 {
 	struct amd_gpio *gpio_dev = pinctrl_dev_get_drvdata(pctldev);
@@ -1004,6 +1023,7 @@ static int amd_gpio_probe(struct platform_device *pdev)
 		goto out2;
 
 	platform_set_drvdata(pdev, gpio_dev);
+	acpi_register_wakeup_handler(gpio_dev->irq, amd_gpio_check_wake, gpio_dev);
 
 	dev_dbg(&pdev->dev, "amd gpio driver loaded\n");
 	return ret;
@@ -1021,6 +1041,7 @@ static int amd_gpio_remove(struct platform_device *pdev)
 	gpio_dev = platform_get_drvdata(pdev);
 
 	gpiochip_remove(&gpio_dev->gc);
+	acpi_unregister_wakeup_handler(amd_gpio_check_wake, gpio_dev);
 
 	return 0;
 }
-- 
2.25.1

