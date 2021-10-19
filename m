Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E867432C44
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Oct 2021 05:27:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229774AbhJSD3h (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Oct 2021 23:29:37 -0400
Received: from mail-bn8nam11on2081.outbound.protection.outlook.com ([40.107.236.81]:40736
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229692AbhJSD3h (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 18 Oct 2021 23:29:37 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OKhgo0dOosqiY1lC5j0u7bJFnXjqA5UytvUy9hhMhuICGS7uqkeeZ94r+aOR5FtyMlBxqsusWcnsN7/Ywk+n9nBoHq/FjAb0+8RmUPDsx9AJNm8jDFgJtz2d9SxGGXGXElQemse21Bt75OUlN0Qv4Jb9QoWMg8C37P4oFkXfiZ/CU+K6td6y/U0cbphWEIcJ3aoIvwAJIW2HgdNJFMpMxgOwC2B55hKiFC0P3iIgtUEcOHte7V0BTy8k57Txv9RS5Su9QX1cC94D/OM2oPZfeOHRk4f5sSBXyNGaKwi97qU1FkbFqulJo5D1T7zpF8JDvVSJUBrYsTaRFQ39z24UWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=23BA8Z9Bv7qyS9LsrmfiD5FycS367NHqPE30+6TvgHk=;
 b=Br7lsxd7OtDMbePNN0Ers8GAZB0KNI0TpVP9FrL3vB2b2SB3s11ft/QZvHQnhti52O062aOT359nF9+mCAAy7z/FK327eNsK9zUJwH9Q8Kk5VIm6yr+kDor4eO2QgHvcjqZtEBxby3Mnc20sPHYCNdZ9UdpDk5UDvPFchMLq5HL/LhOlg7zLx963gdUhb08/T+LBA0xbIUboyOrPSSh/VPyG6rH/Xz6BRnUUaG0z4z2GQ5Z+Oo6Wg6eZ5neQ5We0wdTEqvgsxH2iGJG8cZtp/PEFkRrbNHMjyjDqyU8jRUps0KyljHaoS1FNFKwM/geRKKjmRl5nsGYSlkw8VPSWSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=23BA8Z9Bv7qyS9LsrmfiD5FycS367NHqPE30+6TvgHk=;
 b=fzwdNoOTtoHUae6afLQj7SPX0ftsgf5y0kNYJTYYgX6AB07HI/S6AIsrCSXoM9s9JFkB3V9pSJqO3cQ6pGL8SuQDQsrV94w4/qQAjZjk4tSKTstIUWavad4lGyEl1tHuCl5eS5BEOglMHZ5FBctVrAAr92WP7FqqYhpYRcU6GsE=
Received: from MWHPR14CA0061.namprd14.prod.outlook.com (2603:10b6:300:81::23)
 by SA0PR12MB4398.namprd12.prod.outlook.com (2603:10b6:806:9f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Tue, 19 Oct
 2021 03:27:22 +0000
Received: from CO1NAM11FT051.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:81:cafe::3b) by MWHPR14CA0061.outlook.office365.com
 (2603:10b6:300:81::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.14 via Frontend
 Transport; Tue, 19 Oct 2021 03:27:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT051.mail.protection.outlook.com (10.13.174.114) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Tue, 19 Oct 2021 03:27:21 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Mon, 18 Oct
 2021 22:27:17 -0500
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
Subject: [PATCH v2] pinctrl: amd: Fix wakeups when IRQ is shared with SCI
Date:   Mon, 18 Oct 2021 22:26:48 -0500
Message-ID: <20211019032648.2208-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 84844421-9e5d-40f2-71ad-08d992b05c91
X-MS-TrafficTypeDiagnostic: SA0PR12MB4398:
X-Microsoft-Antispam-PRVS: <SA0PR12MB439805FCD836D4BAFAECF347E2BD9@SA0PR12MB4398.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bkGTNMPYeMc5RrxjxnoO0yAFaFrmDYC5aGyBc+fjuAJDRIIZt9YWyZJaMF8uNAkKpuAH6mWIIGnuVPFqxpLU7736PMet9if0TDx6EZsq3zU6Ayb8+/q54Y9hNdlmQH71+nD0GW2yhv8+ZHmflc8Pehmo45E/CR74vzLtPAzSof682kcrID6hFt7qjSV7DqQBYY/Ts4A7yWDKWUO+ckZWyC8txVmWK+QqgCXEl5hzSpaKozsgtrq52ZcE6AIE41hedvo/tgoosSoaWIYzHFJCazpxE9KtEpaQexebAnHGwN9jmQ6Zo+he8QwDb8bzngwlNR8ME+csAnjm7/jCCmVwocQ+gbtEmRW+wRLGke+t8UCroOG7MVjsPkXfLiWbujCgFSc/yONbfu738h857SxFQx2Je0Mam10OuzP3WHNkCCiKsoILCP3Fmm/g9lNjfAHZnqvYIez4/45NRyn7S3lT24OwjUy5Ql4dZsM/8jYeQEJD/X4E5Z3zyIDN4hKktSGWAodRH4ga+Ty3Wa/vUBz8zG0TyqWo6eEkZyoXnsWUhuY8lavAfNAoTWMdwBeZzCH61fK4QECdO33lKNZg0CL949kwTTykR0kFB68h/0N+wHutLiZPTQ3EwH8faQQ6xK4lMF+xfpTj4j+swgN9g5JT/wXIBMiS3s/f3NwVlEg86zNkqPQOHpz6JCkvtoUE5W4ojHdcwc4t/EHlGn+3HZ6KMoUMZDB60KO6j//IG+YgEQ4=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(8676002)(508600001)(336012)(316002)(36860700001)(186003)(44832011)(70586007)(54906003)(2906002)(47076005)(2616005)(26005)(81166007)(4326008)(110136005)(36756003)(8936002)(82310400003)(5660300002)(6636002)(83380400001)(1076003)(6666004)(70206006)(7696005)(356005)(16526019)(966005)(86362001)(426003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 03:27:21.3031
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 84844421-9e5d-40f2-71ad-08d992b05c91
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT051.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4398
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
Changes from v1->v2:
 * drop Kconfig changes to drop COMPILE_TEST, instead #ifdef CONFIG_ACPI
 * fix a logic error during wakeup
 * Use IRQ_RETVAL()
 drivers/pinctrl/pinctrl-amd.c | 35 ++++++++++++++++++++++++++++++-----
 1 file changed, 30 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index d19974aceb2e..f7b44ecbbb79 100644
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
@@ -666,6 +675,18 @@ static irqreturn_t amd_gpio_irq_handler(int irq, void *dev_id)
 	return ret;
 }
 
+static irqreturn_t amd_gpio_irq_handler(int irq, void *dev_id)
+{
+	return IRQ_RETVAL(_amd_gpio_irq_handler(irq, dev_id));
+}
+
+#ifdef CONFIG_ACPI
+static bool amd_gpio_check_wake(void *dev_id)
+{
+	return _amd_gpio_irq_handler(-1, dev_id);
+}
+#endif
+
 static int amd_get_groups_count(struct pinctrl_dev *pctldev)
 {
 	struct amd_gpio *gpio_dev = pinctrl_dev_get_drvdata(pctldev);
@@ -1004,7 +1025,9 @@ static int amd_gpio_probe(struct platform_device *pdev)
 		goto out2;
 
 	platform_set_drvdata(pdev, gpio_dev);
-
+#ifdef CONFIG_ACPI
+	acpi_register_wakeup_handler(gpio_dev->irq, amd_gpio_check_wake, gpio_dev);
+#endif
 	dev_dbg(&pdev->dev, "amd gpio driver loaded\n");
 	return ret;
 
@@ -1021,7 +1044,9 @@ static int amd_gpio_remove(struct platform_device *pdev)
 	gpio_dev = platform_get_drvdata(pdev);
 
 	gpiochip_remove(&gpio_dev->gc);
-
+#ifdef CONFIG_ACPI
+	acpi_unregister_wakeup_handler(amd_gpio_check_wake, gpio_dev);
+#endif
 	return 0;
 }
 
-- 
2.25.1

