Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F642547FA7
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jun 2022 08:44:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236953AbiFMGnj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Jun 2022 02:43:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237916AbiFMGnY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Jun 2022 02:43:24 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2054.outbound.protection.outlook.com [40.107.236.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4328EFD3F
        for <linux-gpio@vger.kernel.org>; Sun, 12 Jun 2022 23:43:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DfrGu8b0++10fMW5LizjGWpsLllJ5MlPGumU3VEOdvT+nESlrMEa3zvpp1es5ydKYojMj6zpdcFL7fPvegeLyTHX9P2iXNdXVDbD6jzGF6DXGZHNNfoUoyUFdL5IRjJ+UuRC7SbYfOccaWtP0fweua69Li0NVciDnnINsagd2zBkufAHfCQ4aEKcorDTzRXwpv9Xbo3XRI2p0GYDQRUliG5k/DeFqpohfzem8tijv2vpJ/7Uhzm63stWRwoEpQZjir5N+HvgDlBuWxcNieGs0+RipQ6VKfJvHq8TFpWWDuH8m7xzKqogEGzlIXqKXtpgSW8raLT6N0PGcvfTUVGsQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NGsvuWCZztjIEIO95dvDnSLHwopX3ifrfwg9Z2NmaWo=;
 b=ZiPI8qFIQsSBxYeREUxcTwDnpZ8x9kaOkimEWel71DMA02a67JI77Bs0HSYgP9hYtI3zToJJf3PMBsz7BpD1a3HHENDpHVJOUxEViEEGrVjNBj0ZLAoAlwQqm6e/sRDQvvzMwq7fa9mJnYUCaFZtLiTD5y9yvUUX6H0vxvLwiDGv2G3d76DnLf6PpQJVEyZJSuwFbrjKRL8PB7gpAvfUQH+CxkMPJEh1Y/rAoUwleyEXjLfMXN5JLYfpQvVHcL7dg/0J70JDET6NtFu1ii2gAjl60855kxZKSsFqxMIY4Hww3abG/7XPWPemmuPeen5WrcCHJmtib80hDo/Ptjyakg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NGsvuWCZztjIEIO95dvDnSLHwopX3ifrfwg9Z2NmaWo=;
 b=zugFWRinDOpy8Y3tfotmkJ4QsE8MJswNUW56wf0Q5AXgRHJT40xUY+HzQq6wfvBEzLzd/zbrFghClAbwJ5sg1zaH20/okZv+wt0EaNoPVX5vTQ/5pkqpcEx48pqxdBYNq4pld9P0ZoqnkCLdIRynKuUiEpwBg5V0EHwkcKTqLG8=
Received: from BN9PR03CA0390.namprd03.prod.outlook.com (2603:10b6:408:f7::35)
 by BN6PR1201MB0084.namprd12.prod.outlook.com (2603:10b6:405:57::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Mon, 13 Jun
 2022 06:43:21 +0000
Received: from BN8NAM11FT004.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f7:cafe::5c) by BN9PR03CA0390.outlook.office365.com
 (2603:10b6:408:f7::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.14 via Frontend
 Transport; Mon, 13 Jun 2022 06:43:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT004.mail.protection.outlook.com (10.13.176.164) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5332.12 via Frontend Transport; Mon, 13 Jun 2022 06:43:20 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 13 Jun
 2022 01:43:17 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <linus.walleij@linaro.org>, <linux-gpio@vger.kernel.org>,
        <Shyam-sundar.S-k@amd.com>
CC:     <mario.limonciello@amd.com>,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH 2/3] pinctrl: amd: Don't save/restore interrupt status and wake status bits
Date:   Mon, 13 Jun 2022 12:11:26 +0530
Message-ID: <20220613064127.220416-3-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220613064127.220416-1-Basavaraj.Natikar@amd.com>
References: <20220613064127.220416-1-Basavaraj.Natikar@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 33faf188-266b-4212-fd94-08da4d0801b1
X-MS-TrafficTypeDiagnostic: BN6PR1201MB0084:EE_
X-Microsoft-Antispam-PRVS: <BN6PR1201MB0084BECEF219FEB4964004C3E6AB9@BN6PR1201MB0084.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QOin2KBpf4NAOaK+pDetqbms0xS9/pWs5oHwke0vhnJSeMZPxENfqKDPDgKl+nP3sEONAF5HaweNa0jEwXSDqi3gk6PkzOFZtKbxBlnCElmKrdIIwZAZ4m7m+9OYa551X+6rElE2zgW/iTa/ePOFgybaBIHKhVQE5ZBd3tDaxlWDdoZ/EI2skjw7YppSPX++1MZmtrAAhOYj6PuBdOn+LQIcrZzu64SewqwAmOHS83i/3VZT2cCuN1DgFGZV7biEZcmNdZDxpMuRnfv/MF5UCLLgOEslIwioaLZxkO+3wZ4FAUpMwp2ayryHSSXRBGhNcLAPBGO5LPpyaP7TO/mwyP8Ls4IijkQDH31d6wt+j0jxNfxJWx0As5x8cK5L2H+9PZis/grCDNbz+ddrNDf15lJDvcVAEHVBFFgVEcgg3hEhumCJMAZGnr7ESL3HFykI2U4MtBCudfl0WqUsWi0oDDiw5gDUrjc7xRkB/Y98BS/9szcOMvHkMIOVL9gSoJC2omYP6t/q5s+hdC6B4R6Kh74PbmMJTaqhKFWLrVQ1MCAV1rX8ixFF5f8dGIblCTEaAGCzHmQF4A5eiDM6eQb19alSi0tEC0x8RhfoECaz74m+Uw1CNi92d/GYxGwB/v0BIc97teeZ0UqN/8bnSS7aY837sndDna//3y1PdL13jwVKJrHzr2qeDmCjvq1bOzALcCDC3EUx9FhgTEQrWF5zi2DbjVppj2IEuJfFHsWM1TM=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(36840700001)(40470700004)(46966006)(5660300002)(2616005)(8936002)(6666004)(508600001)(7696005)(2906002)(82310400005)(26005)(356005)(40460700003)(81166007)(83380400001)(36860700001)(186003)(47076005)(86362001)(1076003)(426003)(336012)(16526019)(110136005)(316002)(70206006)(6636002)(54906003)(36756003)(70586007)(4326008)(8676002)(2101003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2022 06:43:20.9084
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 33faf188-266b-4212-fd94-08da4d0801b1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT004.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0084
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Saving/restoring interrupt and wake status bits across suspend can
cause the suspend to fail if an IRQ is serviced across the
suspend cycle.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/pinctrl/pinctrl-amd.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index ff3d0edbea48..40e23b5795b0 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -917,6 +917,7 @@ static int amd_gpio_suspend(struct device *dev)
 {
 	struct amd_gpio *gpio_dev = dev_get_drvdata(dev);
 	struct pinctrl_desc *desc = gpio_dev->pctrl->desc;
+	unsigned long flags;
 	int i;
 
 	for (i = 0; i < desc->npins; i++) {
@@ -925,7 +926,9 @@ static int amd_gpio_suspend(struct device *dev)
 		if (!amd_gpio_should_save(gpio_dev, pin))
 			continue;
 
-		gpio_dev->saved_regs[i] = readl(gpio_dev->base + pin*4);
+		raw_spin_lock_irqsave(&gpio_dev->lock, flags);
+		gpio_dev->saved_regs[i] = readl(gpio_dev->base + pin * 4) & ~PIN_IRQ_PENDING;
+		raw_spin_unlock_irqrestore(&gpio_dev->lock, flags);
 	}
 
 	return 0;
@@ -935,6 +938,7 @@ static int amd_gpio_resume(struct device *dev)
 {
 	struct amd_gpio *gpio_dev = dev_get_drvdata(dev);
 	struct pinctrl_desc *desc = gpio_dev->pctrl->desc;
+	unsigned long flags;
 	int i;
 
 	for (i = 0; i < desc->npins; i++) {
@@ -943,7 +947,10 @@ static int amd_gpio_resume(struct device *dev)
 		if (!amd_gpio_should_save(gpio_dev, pin))
 			continue;
 
-		writel(gpio_dev->saved_regs[i], gpio_dev->base + pin*4);
+		raw_spin_lock_irqsave(&gpio_dev->lock, flags);
+		gpio_dev->saved_regs[i] |= readl(gpio_dev->base + pin * 4) & PIN_IRQ_PENDING;
+		writel(gpio_dev->saved_regs[i], gpio_dev->base + pin * 4);
+		raw_spin_unlock_irqrestore(&gpio_dev->lock, flags);
 	}
 
 	return 0;
-- 
2.25.1

