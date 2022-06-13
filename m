Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A1A9547FAC
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jun 2022 08:44:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237225AbiFMGni (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Jun 2022 02:43:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237714AbiFMGnW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Jun 2022 02:43:22 -0400
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2063.outbound.protection.outlook.com [40.107.237.63])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C15E5FD00
        for <linux-gpio@vger.kernel.org>; Sun, 12 Jun 2022 23:43:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lZLlusWnWadQ8pETVhNC1XGyVn//R/S3py3AuxmlFavKtMoIhkVWWjFpDqJ27eaM1aa2KPBJxCviCJsdIEtfBbEco5fq1+dJXTftb+hDciXyr9+v0iMIZONBRVo6rMYa80fvU0Tqe9ADohKqtLNogXEEdC0GXjA7slNtE3pXxsQCD/+Xft3lXhkJjTJdmMqN+qkJKp4SPxPLIAT1tIVYJvrZR977PIm2hv8ZWxI93ZWNAUVk/LPpvDkMYv8ghdTB5JREMEL8lDI9z7n9gCHOA3BM2/qRBZEb3DhwZkLZoNgIAHdecyRa89jUAeotB445Xgi+3b+TsD2snUuFIPPBwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=059H5p8B6u2D0G9FuWoBPJRtFVaRjM70A/JxDXLVv/E=;
 b=Qbpg0ZSYHAFa8k3RTFaARPoYAPz5PryNHlAXU0tsRFGYnnkzlmPhkuOLdHS/DaghRYRmHoTfKbarEMtkTDk7D0tdkodSaVxYKpjMCX1zToZd1/kMxMeSxYyz4Dgtl9UYvxa89DLi1t3MZWkjgeOcSl0eBRJSN2Nn0bgyInxIn/mh27pS9TkfTwla1IRyuATuRpWFBS7LYUOpjycF1sVTqbWA/aNNVCn1VFf4DbnOp622wKspDm8onDSY7LHk5Yg/aawejLXVnsVWt8aT1wHTygQL7mDVLmV72xlArp22Vq2BRRubEklP053RgiDaky+unRkPysOZXQf4Jf+vtUUZrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=059H5p8B6u2D0G9FuWoBPJRtFVaRjM70A/JxDXLVv/E=;
 b=uxSL7WQduRO8X5psWVAJyg+as/6U/jOlMHTM5dUsBIW0p4lyzTCEcZWCbGsnpgQGZzoJGFwt/hNZyI8ecsuhLCQpTE9R+ZQueSsCAPQXLr4lWRnZnikJar7WHj1t+SOfm7gV/QlAh6Rvvcz8ieFHHK0tn5lB3J724smUUWaeBcQ=
Received: from BN6PR20CA0053.namprd20.prod.outlook.com (2603:10b6:404:151::15)
 by CH2PR12MB3847.namprd12.prod.outlook.com (2603:10b6:610:2f::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.15; Mon, 13 Jun
 2022 06:43:17 +0000
Received: from BN8NAM11FT009.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:151:cafe::f5) by BN6PR20CA0053.outlook.office365.com
 (2603:10b6:404:151::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.16 via Frontend
 Transport; Mon, 13 Jun 2022 06:43:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT009.mail.protection.outlook.com (10.13.176.65) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5332.12 via Frontend Transport; Mon, 13 Jun 2022 06:43:17 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 13 Jun
 2022 01:43:15 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <linus.walleij@linaro.org>, <linux-gpio@vger.kernel.org>,
        <Shyam-sundar.S-k@amd.com>
CC:     <mario.limonciello@amd.com>,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH 1/3] pinctrl: amd: Use devm_platform_get_and_ioremap_resource
Date:   Mon, 13 Jun 2022 12:11:25 +0530
Message-ID: <20220613064127.220416-2-Basavaraj.Natikar@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 0526eb8c-ddb8-4f47-2d62-08da4d07ff90
X-MS-TrafficTypeDiagnostic: CH2PR12MB3847:EE_
X-Microsoft-Antispam-PRVS: <CH2PR12MB3847A7AC3F0F35BC31E6FA43E6AB9@CH2PR12MB3847.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8ox0krEmPHNEwQkb7ch4HfkzNu9pCYB1SX0WTDTMXM8b4QK3j+zvotpgg1nXUfcrSEHzE/lA5ilKpCbusQLSZSo/l6pqfToneMHhrGwQgXd4fcykeWkEpG/ujkS9PAC3WbIGVRqq8/oygn/BS4/iArpXq1M9bTW3Nars1y7n8srUj/CxVbJtjzuSCKwkojnU8nBy1GxfLkaqtmNfiwFKSSV7Q4fa6k/rWm2IZhvnWhxs+oQQDcbIcy0JI8Uob763EFt5hc0b4/4gYrKUg5ey/AZ0/v61NbL2M21JpSTkq0BbySjVJ9k+Q/sSlUJ6Q4PdHuEjjkDiYAUq7Iit5kpU3liOTJSWTmjDGWohnnn7IuoQDm1gadx3XUzRC4J5+7TrfCLMQolI8Bf9opz2TE23tXN7tSeIobPMhlOjJ2+PqmOBYrbt2ejWJG/Tx4FFF80wBQMNZ77GaM2EkWqcrq0T/M11SSVz3sxHAgQ3ImphcrYlXOid+BQO/IHZu6Wh794ubO3re6n4fecmM5/B0MhAJ5Rq1FXjENCptJ6/lfEuMcQOZPhFHzZdguLOZQF34RlFqO4gVE4EDqjkCvcHUyvuL40oH5/GMSGguNJTNqgtMK0giYG6QYeUt3Iw3tZmHG+BZ5eEZe9ULOjjTLf9RXf9s+s9XW/zd18FaJU+rMQr459uldUpiGUohzP847pTnOlm1c0bNnu2xUb1WeLEaO/6UJHcXb4faMVP5vTY58LyLyA=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(36840700001)(46966006)(40470700004)(26005)(1076003)(2616005)(186003)(16526019)(83380400001)(426003)(336012)(47076005)(82310400005)(7696005)(36860700001)(6636002)(356005)(81166007)(36756003)(508600001)(5660300002)(8936002)(6666004)(40460700003)(70206006)(4326008)(2906002)(8676002)(70586007)(110136005)(86362001)(316002)(54906003)(2101003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2022 06:43:17.3314
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0526eb8c-ddb8-4f47-2d62-08da4d07ff90
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT009.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3847
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Use devm_platform_get_and_ioremap_resource() to simplify code.

Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/pinctrl/pinctrl-amd.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index 0645c2c24f50..ff3d0edbea48 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -977,17 +977,12 @@ static int amd_gpio_probe(struct platform_device *pdev)
 
 	raw_spin_lock_init(&gpio_dev->lock);
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res) {
+	gpio_dev->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
+	if (IS_ERR(gpio_dev->base)) {
 		dev_err(&pdev->dev, "Failed to get gpio io resource.\n");
-		return -EINVAL;
+		return PTR_ERR(gpio_dev->base);
 	}
 
-	gpio_dev->base = devm_ioremap(&pdev->dev, res->start,
-						resource_size(res));
-	if (!gpio_dev->base)
-		return -ENOMEM;
-
 	gpio_dev->irq = platform_get_irq(pdev, 0);
 	if (gpio_dev->irq < 0)
 		return gpio_dev->irq;
-- 
2.25.1

