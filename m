Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8390D53A4A8
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Jun 2022 14:16:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351882AbiFAMQW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 1 Jun 2022 08:16:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348712AbiFAMQV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Jun 2022 08:16:21 -0400
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2052.outbound.protection.outlook.com [40.107.102.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8062E5C770
        for <linux-gpio@vger.kernel.org>; Wed,  1 Jun 2022 05:16:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HJ81aD8OhkpxTppIxqK9pXJ1dc6Zm5JNa+ou2b9oveF9msiLxc/9rI8/fTS/PIIBisRR54wY8jvtHlZQ1rs6yAcWGcr6NuzY04Z8mw0p858nss0vegPl+Uox+DnlBcBVqFKSGFRRht/a3j8b/k+e17YSbBGrCXqiHBJyUqYbg2XrLBiV7cniD4vQ1f3C5OqFHelSL01ehNWkfPahWcVeCbalGqj87iR9HXfmDq+WwtRYOslnwIZv/D19bzIiB1k5QBwOXt5YfCv5YgPfdkp/GTcoVCRpdZZ97JS7YN4UzsPchnXc0N1YjKCA1ZCd2NVse/ykqsONQGlszjYp36gzNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XQasHsaUZMhepkIEN3FTyhzYeHB5eaGu4F9xmHXf95k=;
 b=RO5MR4eteCfl1ASKe5jH8ZR5RcQ00F7VnXVhWV6hd82yF9e8I/CxdGmQfb4jNfYIsN33z6Jkc5R/NekHqMiCi8NKUpa1I3dE5+GaNOwC7LPvWSRcOi27VY7yO6niGvw8g3jWF+pVT0rAN8P1PhD6C60w4nByNwgRzQ4rW4sVo8w2FP5hMD3T6KtV7/ZpCDHYzD5350pT22LTq17WOyLDiE7tWcnBYxZgzJcNdoPnvZrQ7piw/EvNQvk/iSp6C9sORyBO7RsiNHDag+hukvt/zp5DdTsNsTATEP8Cv/CqYBuJQuW2lRfrRvYoVPmcx5iyU8qSrDB5BxbOwobtr6xjIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XQasHsaUZMhepkIEN3FTyhzYeHB5eaGu4F9xmHXf95k=;
 b=mJANJ3BClZfYx2gTglfGOZmbbKNu+4xZ/Zp7Tbot9au1da75ESLEIX6Bog5zipZXnNoZGc/0rKTZdLVrUNn/TqQAQBIHyF9zndoTVIOPE9AHOLjGYOtNINEPJR86HIf8gYN3pUh5ykYNTqjcDhSxqYFyiqeyu6scgIr44zjL2vk=
Received: from MW4PR03CA0210.namprd03.prod.outlook.com (2603:10b6:303:b8::35)
 by BN6PR12MB1827.namprd12.prod.outlook.com (2603:10b6:404:fd::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12; Wed, 1 Jun
 2022 12:16:17 +0000
Received: from CO1NAM11FT054.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b8:cafe::c9) by MW4PR03CA0210.outlook.office365.com
 (2603:10b6:303:b8::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13 via Frontend
 Transport; Wed, 1 Jun 2022 12:16:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT054.mail.protection.outlook.com (10.13.174.70) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5314.12 via Frontend Transport; Wed, 1 Jun 2022 12:16:16 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 1 Jun
 2022 07:16:10 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <Shyam-sundar.S-k@amd.com>, <linus.walleij@linaro.org>,
        <linux-gpio@vger.kernel.org>, <mika.westerberg@linux.intel.com>,
        <andriy.shevchenko@linux.intel.com>
CC:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH v5 5/6] pinctrl: amd: Add amd_get_iomux_res function
Date:   Wed, 1 Jun 2022 17:44:37 +0530
Message-ID: <20220601121438.999369-6-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220601121438.999369-1-Basavaraj.Natikar@amd.com>
References: <20220601121438.999369-1-Basavaraj.Natikar@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d1f64ba1-0f21-4477-d951-08da43c8876c
X-MS-TrafficTypeDiagnostic: BN6PR12MB1827:EE_
X-Microsoft-Antispam-PRVS: <BN6PR12MB18273275F8AF5F4B5EA6F941E6DF9@BN6PR12MB1827.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kFp9iJ9xGZ4H3L0O2IyL7b4LhxMr83KB9OToNnwZrpJu8Zv7n2MOZtkHi7ycqr8hoR729odO5CLdPBAlBOiip3had9eaUOLjfE8yXW+lhTQr9W4TV+zE+M+UjVdA51eENujoZ6pd8jsEOgb7muW000aQkds7c/en5OltLOIQ5sMurH+1vjBHhxOZ/1woxwOfWxHkz1fbfDDEOXSfhFrXs8Bvx5k+CuLUbq9X2zSzvdm17NI9bGovyqZR+OKaHgtXtFavz/qObPspoW934lxNm2xGq/JTGSAj3/FiD3lAAwJmP32QHXHmpWbuS//ZmdkXrhm4vGndf/NLU+JgY2mLEdHpsejRZ7rJ0nstWhm3n7pRrqv8ibSU07Q/DJEyQyIMFBEaAK8yzINQj+wHPsulaYljaTpfIUppu5rqp9xxIxe23RTY6OxgHamsXRZjQALMmwYGyFsEFfCn36mQWhqhzhEPatqU0HIlMyq6D3OYGMSjJukQRbBalnZz1HlNC4uLvXTbYti2JuveRkIP/OEmfq1sDCRp152Ot3ooXhsPkSM66dM8Ij1bcr454rw55+oR6g85MXcg/tWH4SnoX8lq83V5dq3j9uGAN8C2xqccpg9Fl0h5w9+oubgKcQ7xDwJ5LyN98svIOrebUj8Mb2LB2Vdv6fTA1Vo49S3lw8kkhvI9k4GjB1bgpG+Ny+xs2kWmaCYcbKDokJ5rVKNvU2AMvI0tWjuiBLjtHGD2MuC0w7w=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(47076005)(426003)(336012)(186003)(8936002)(508600001)(16526019)(86362001)(1076003)(81166007)(7696005)(26005)(2906002)(356005)(2616005)(5660300002)(6666004)(70586007)(70206006)(8676002)(36860700001)(4326008)(316002)(82310400005)(110136005)(36756003)(83380400001)(40460700003)(36900700001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2022 12:16:16.9049
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d1f64ba1-0f21-4477-d951-08da43c8876c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT054.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1827
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Presently there is no way to change pinmux configuration run time.
Hence add a function to get IOMUX resource which can be used to
configure IOMUX GPIO pins run time.

Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/pinctrl/pinctrl-amd.c | 20 ++++++++++++++++++++
 drivers/pinctrl/pinctrl-amd.h |  1 +
 2 files changed, 21 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index 0645c2c24f50..6bd85660287d 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -963,6 +963,25 @@ static struct pinctrl_desc amd_pinctrl_desc = {
 	.owner = THIS_MODULE,
 };
 
+static void amd_get_iomux_res(struct amd_gpio *gpio_dev)
+{
+	struct pinctrl_desc *desc = &amd_pinctrl_desc;
+	struct device *dev = &gpio_dev->pdev->dev;
+	int index;
+
+	index = device_property_match_string(dev, "pinctrl-resource-names",  "iomux");
+	if (index >= 0) {
+		gpio_dev->iomux_base = devm_platform_ioremap_resource(gpio_dev->pdev, index);
+		if (IS_ERR(gpio_dev->iomux_base)) {
+			desc->pmxops = NULL;
+			dev_warn(dev, "Failed to get iomux %d io resource\n", index);
+		}
+	} else {
+		desc->pmxops = NULL;
+		dev_warn(dev, "failed to get iomux index\n");
+	}
+}
+
 static int amd_gpio_probe(struct platform_device *pdev)
 {
 	int ret = 0;
@@ -1020,6 +1039,7 @@ static int amd_gpio_probe(struct platform_device *pdev)
 	gpio_dev->ngroups = ARRAY_SIZE(kerncz_groups);
 
 	amd_pinctrl_desc.name = dev_name(&pdev->dev);
+	amd_get_iomux_res(gpio_dev);
 	gpio_dev->pctrl = devm_pinctrl_register(&pdev->dev, &amd_pinctrl_desc,
 						gpio_dev);
 	if (IS_ERR(gpio_dev->pctrl)) {
diff --git a/drivers/pinctrl/pinctrl-amd.h b/drivers/pinctrl/pinctrl-amd.h
index e2523738fe51..76538792ac78 100644
--- a/drivers/pinctrl/pinctrl-amd.h
+++ b/drivers/pinctrl/pinctrl-amd.h
@@ -83,6 +83,7 @@ struct amd_function {
 struct amd_gpio {
 	raw_spinlock_t          lock;
 	void __iomem            *base;
+	void __iomem            *iomux_base;
 
 	const struct pingroup *groups;
 	u32 ngroups;
-- 
2.25.1

