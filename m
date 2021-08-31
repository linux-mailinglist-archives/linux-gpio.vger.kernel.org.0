Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3267E3FC70D
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Aug 2021 14:29:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241662AbhHaMID (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 31 Aug 2021 08:08:03 -0400
Received: from mail-bn7nam10on2064.outbound.protection.outlook.com ([40.107.92.64]:24929
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S241705AbhHaMHk (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 31 Aug 2021 08:07:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ak0t07LA+zJk/wSTZdooHcYKkLkne9G+Vh+VrzRAV164K7jdnZk2W6oUjoLpRxUHugvM7gjzMWL3eO87v+emih0zDWQx2INhKvsjJgfbCmX1Ze+nrv2cJwt/elzPk4MD/nrXFokQ6BTT6zrycWKdODrvMNqc2ifobZPOOxSr04yDfwmjuISmLDPA/5KLyuS7/ZsfqpPx16fo1UNcy0y3XW5G8Y7z7xsUouqiARanEOPJhtTP1YWdIUWrRashnlAVFUiSIi3KasoUL43/7eBjHqOwOayAmetWgEdpcpLGTYR8mOi/VVtrM99TTFMpFjSO5tpgUYmCnCMGKHWIS9Bliw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vSA1z2MW4Xo+PXeQci9/NfTF7suOFtgWtBzWSNB1PDs=;
 b=DN6ftDWLKbW2sbKQ4+WxkPjamzLpae6VSQhuUcsoIdwLKnT8yCNRlktPt6w7NCXrbnYad/VzMhtu9JqvGW4rLhdZGvlMHoe/urxFhNHhJSNVfsaEyRIce0hDG9kpNd9Juw541VnXhC1/SMoBIK65gNVKLN+GfJnQ0lMPVzu1AhTmQWqmscTsveGHxAAemZ/aHeEcH+2Al3kWhUmkYbVjBxm0fZmZiOMUrYBxvVWRR1OKvJiIpmLks+jBZ5n0k76gRLmngIZVe9d3g3R4CMqg6CYieuVx4STavAGQSE38aoVS2+S3WWdPt9pcIICzbIuf+ETpEBrm0Dbxtpap4B/Rjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vSA1z2MW4Xo+PXeQci9/NfTF7suOFtgWtBzWSNB1PDs=;
 b=lKCmF9xSaJK6poRLZ5p9ZiaqalD6y4RnNCKSzMWjdQmom13HrM9AsTHYpyHaAiMFnYTmxqxwbAy+u6fn5v2RHPRNL0brdwaq4QZnFD3r9pagC+jg/EPAGxOdwSKP/jGy+sNP1F9GAZaA63BjDzAaxu3wA8vpFkvz8e0oWOSf938=
Received: from BN9PR03CA0637.namprd03.prod.outlook.com (2603:10b6:408:13b::12)
 by BYAPR12MB3207.namprd12.prod.outlook.com (2603:10b6:a03:135::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.24; Tue, 31 Aug
 2021 12:06:42 +0000
Received: from BN8NAM11FT024.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:13b:cafe::bf) by BN9PR03CA0637.outlook.office365.com
 (2603:10b6:408:13b::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20 via Frontend
 Transport; Tue, 31 Aug 2021 12:06:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT024.mail.protection.outlook.com (10.13.177.38) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4457.17 via Frontend Transport; Tue, 31 Aug 2021 12:06:41 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Tue, 31 Aug
 2021 07:06:33 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <linus.walleij@linaro.org>, <linux-gpio@vger.kernel.org>,
        <Shyam-sundar.S-k@amd.com>
CC:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH 1/2] pinctrl: amd: Add irq field data
Date:   Tue, 31 Aug 2021 17:36:12 +0530
Message-ID: <20210831120613.1514899-2-Basavaraj.Natikar@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: edbf6498-b404-49fc-d5ce-08d96c77cb63
X-MS-TrafficTypeDiagnostic: BYAPR12MB3207:
X-Microsoft-Antispam-PRVS: <BYAPR12MB32070E2B248922D22DD90E06E6CC9@BYAPR12MB3207.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2089;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 14veuVXFWX7ihghG5NJg7ZXqejBg/yfwLf/2syQt/dEp/lgMCN6d5Of3l3gEfNz1NbCSe/mrzwsY+f+EUweWmKMXvDmCJ2eQvyyfaK8sSD1HMBVBolCira4O2pTCQVX8sHyy7BALSG2lVt/C3qLQBYCnpvnqH/m1qMcptNRjM36gvyuxsXGWoC9dLhmmD5oI3jBI5nx/BebdwQP5wS/wlMqHU7d8oL191p7Gcq9oqEBb7FMKSZbocZyJVXfXD1UyZ0J4sxiXGJlfBV+DEMKvUEr0XoBIf6UgOgkvSjfUzD0F4uQfBAVyHHxP5U0C3LLatbJ/qo8gWeoOnyL79b5Ygw3Wtl4cZiHooNk2L7yrY38cWN/9rjiAfbvOekCYNhl5H7aDwLSOpIc7zK9n1LMNTIHvq82RxHMfXwLLHycaVuFGMrvY1WagN8ZG5EXIiu0FUYH+2sMVcE45+j7a3PA+pfqd5MjrYl1XvDGpIOm94OgY7MN+aKROmQtnY432Pt6DTsFpeMVFwbw4qs/va91N3DmgBtf0RGAhBcccXnOwlCuTAFaawHaT46gfOPMZ5kad1sq0ZEBDJNMRxZbSvEY6PmLSNwO4SzbRUczUfUT15pmc3XmX5U8daUwnrCnJXbi4+kmXHpKVnv/gyAc+Z1UIgwb2qyn3SozgJVOGajvbf8mlYhGbbI5OeDWoJX/wY/sXt9YOqRHHzhLzsgFnpB1FumcGRYOq3c1U2BBQkoFq0nmCgR2Lm9xL/bg4Jzq4UcFj
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(136003)(376002)(396003)(346002)(39860400002)(36840700001)(46966006)(6666004)(8676002)(478600001)(1076003)(82740400003)(16526019)(82310400003)(186003)(47076005)(83380400001)(336012)(4326008)(81166007)(426003)(36860700001)(110136005)(7696005)(316002)(36756003)(6636002)(5660300002)(70206006)(2616005)(8936002)(356005)(26005)(86362001)(70586007)(2906002)(2101003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2021 12:06:41.8051
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: edbf6498-b404-49fc-d5ce-08d96c77cb63
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT024.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3207
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pinctrl_amd use gpiochip_get_data() to get their local state containers
back from the gpiochip passed as amd_gpio chip data.

Hence added irq field data to get directly using amd_gpio chip data.

Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/pinctrl/pinctrl-amd.c | 9 ++++-----
 drivers/pinctrl/pinctrl-amd.h | 1 +
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index 5b764740b829..79b8b7f91996 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -904,7 +904,6 @@ static struct pinctrl_desc amd_pinctrl_desc = {
 static int amd_gpio_probe(struct platform_device *pdev)
 {
 	int ret = 0;
-	int irq_base;
 	struct resource *res;
 	struct amd_gpio *gpio_dev;
 	struct gpio_irq_chip *girq;
@@ -927,9 +926,9 @@ static int amd_gpio_probe(struct platform_device *pdev)
 	if (!gpio_dev->base)
 		return -ENOMEM;
 
-	irq_base = platform_get_irq(pdev, 0);
-	if (irq_base < 0)
-		return irq_base;
+	gpio_dev->irq = platform_get_irq(pdev, 0);
+	if (gpio_dev->irq < 0)
+		return gpio_dev->irq;
 
 #ifdef CONFIG_PM_SLEEP
 	gpio_dev->saved_regs = devm_kcalloc(&pdev->dev, amd_pinctrl_desc.npins,
@@ -989,7 +988,7 @@ static int amd_gpio_probe(struct platform_device *pdev)
 		goto out2;
 	}
 
-	ret = devm_request_irq(&pdev->dev, irq_base, amd_gpio_irq_handler,
+	ret = devm_request_irq(&pdev->dev, gpio_dev->irq, amd_gpio_irq_handler,
 			       IRQF_SHARED, KBUILD_MODNAME, gpio_dev);
 	if (ret)
 		goto out2;
diff --git a/drivers/pinctrl/pinctrl-amd.h b/drivers/pinctrl/pinctrl-amd.h
index 95e763424042..1d4317073654 100644
--- a/drivers/pinctrl/pinctrl-amd.h
+++ b/drivers/pinctrl/pinctrl-amd.h
@@ -98,6 +98,7 @@ struct amd_gpio {
 	struct resource         *res;
 	struct platform_device  *pdev;
 	u32			*saved_regs;
+	int			irq;
 };
 
 /*  KERNCZ configuration*/
-- 
2.25.1

