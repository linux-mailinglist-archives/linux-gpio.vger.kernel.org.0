Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 435D553AA1C
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Jun 2022 17:30:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354578AbiFAPaM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 1 Jun 2022 11:30:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352299AbiFAPaL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Jun 2022 11:30:11 -0400
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam07on2071.outbound.protection.outlook.com [40.107.212.71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95A6D57B27
        for <linux-gpio@vger.kernel.org>; Wed,  1 Jun 2022 08:30:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j0QJZ3Fosc0lAyLHnvCtpijmsMgipT2wKEuYjKnFoR+Uy8cjLhA4YqpPw3F/hzGXafbMQO+wH7R++TjLX27JIKkSTp+/ypFl1RJKd9Om/o21OblaknvZ1YQV7Obtsk2N/vcIdeepGw7tU+7QD71LsZLv1rx1GmZjNWOE5Lv7NT7i3ev93cvuqm+aMtBbKyJ4J8IFFS+Fo+EiuxzpgbNFRY4rdctM5vow5lanYrXfm+X6GsrbgtzuaWQ3uCKFBDdeyHL7Zq/uR8YwQEPLnqlw/BQtmT0gwwGD8pH+S0C69S+VNmY0bbnedfpR84kXeCA3Z77vTsJ/HPbxziQx1i9Ipw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mywe0Yb0ReZTO7mw6fJYig1qiTPT6V7kV7rE+o2wBOQ=;
 b=aIdzTpMg2pA5/CyTyv1A+iSo3i2CoOiGz9/Xjybq6BVwLcnaLCVdbJkTQ07yQfaBNkGe+qbbtZIuJ+41a2SQxie2+a/Plsn80dG6Nf0ksgFA8GOWiAaY3pX0/GJ4r0rc9uc8EevAkqdD5cpl0C/nsu7PpgRAzuIEVQlKjn+Dwjkk+W3A3EDhZVbxxSrRxDTgqV3dWTaj8ICealfLx9d+SlX8JktXeu8THF6Sm8WSJUkYmVQjo4kbRljivK/cn0gIVS7B0hda/2PCAFSmaO/KK6tfWtUO5NIytZaKbtwB4DjYjjN/c+ISKTnOhA1sCyLAsJUSe7Wd1WwWtXB0Ly+2kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mywe0Yb0ReZTO7mw6fJYig1qiTPT6V7kV7rE+o2wBOQ=;
 b=dyN5r9z+2/CRjLihtsRziTY4XEoiV0A7DR8M29fmG/7YfKb1NSGI9EXtUtGaC53PzX+oEjg6v5a8YiHojcFcWPtfqygDc+IBmKbtOp0PXt9gP4hxYedlHUMdGpsSaKAkPYAXKc8vWc0UlnEovBNC0VYoEaRmCODNJTgEruXoWYU=
Received: from MWHPR15CA0037.namprd15.prod.outlook.com (2603:10b6:300:ad::23)
 by MN2PR12MB4783.namprd12.prod.outlook.com (2603:10b6:208:3e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Wed, 1 Jun
 2022 15:30:08 +0000
Received: from CO1NAM11FT021.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:ad:cafe::73) by MWHPR15CA0037.outlook.office365.com
 (2603:10b6:300:ad::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13 via Frontend
 Transport; Wed, 1 Jun 2022 15:30:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT021.mail.protection.outlook.com (10.13.175.51) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5314.12 via Frontend Transport; Wed, 1 Jun 2022 15:30:07 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 1 Jun
 2022 10:29:39 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <Shyam-sundar.S-k@amd.com>, <linus.walleij@linaro.org>,
        <linux-gpio@vger.kernel.org>, <mika.westerberg@linux.intel.com>,
        <andriy.shevchenko@linux.intel.com>
CC:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH v6 5/6] pinctrl: amd: Add amd_get_iomux_res function
Date:   Wed, 1 Jun 2022 20:58:59 +0530
Message-ID: <20220601152900.1012813-6-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220601152900.1012813-1-Basavaraj.Natikar@amd.com>
References: <20220601152900.1012813-1-Basavaraj.Natikar@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: df6a05cb-5573-40d7-a205-08da43e39be0
X-MS-TrafficTypeDiagnostic: MN2PR12MB4783:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB4783EF785D66788FFC220E92E6DF9@MN2PR12MB4783.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NLzmyVQf9PztaMJDaY7dqy46Kz6rzvoph0T283VfOY/qijmtLIDGQiG112UglZgQJ5f4kHw6nvz/mFfp29nsXAPwFRlLYarg/xOPwUdxtEXQA1ma17asAYD45zzQANptQFzcMT3h17DIyAHSKRmxAI9ExnwMwiQPFXYWAChfX+1toPEz43qlN+dzCp7/N0bJg+hsY3k82yIY5gqv3fGTbLkrEeyKxxlDiAWKY0pr0Tjw7u/Ic/u8HFN3/8dXNFTxxyMzJXCxx3z8IJMER0HCKJ2m9azFc7D9UKNwTuuU6dNWaKDdSV6CWu9pevUiRKhMgWSs+wtdypfVfgCXaVGtnuByc29I3aZHS3tWgG442byFszcyvEmVhD2jeVVOCcCwjUrflyTwcl0m3znKlTFaVASkHd+E/AMZeo8nea7uwU4dmrLW+IWw0z5mQnGmDuUltidnEoDZwi61zEyiGpYruxigQlgZqGYnSjIrF2a1tAV3NV289MK2+gXPWA/rGJlg3nVsupkslNotWZJ3Nl9S3weZiM84sa59xlXW6gfyfotaWUqeGHKJnjQz7nBXbFSWXmTYBBQdRP87JZQmpSEGBFcY9Q9tOI/NzQSmGNUEQuEXiIYRUL7AQtjL9+ikKNt1vms5R67Gmd9+Ue2OIC+oh7RrGuSddopFc7QsXd0I1GVqdiVLK4+PZmBCGvMHnZ+AhWkaQdVo8A1gIJrlv2IygPmIWJkftsedy4lASkU3PMo=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(6666004)(2906002)(7696005)(26005)(2616005)(1076003)(16526019)(186003)(83380400001)(47076005)(82310400005)(5660300002)(336012)(426003)(8936002)(36756003)(8676002)(356005)(86362001)(70206006)(70586007)(4326008)(508600001)(110136005)(81166007)(36860700001)(316002)(40460700003)(36900700001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2022 15:30:07.6298
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df6a05cb-5573-40d7-a205-08da43e39be0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT021.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4783
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
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/pinctrl-amd.c | 25 +++++++++++++++++++++++++
 drivers/pinctrl/pinctrl-amd.h |  1 +
 2 files changed, 26 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index 0645c2c24f50..a1d21fb78028 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -963,6 +963,30 @@ static struct pinctrl_desc amd_pinctrl_desc = {
 	.owner = THIS_MODULE,
 };
 
+static void amd_get_iomux_res(struct amd_gpio *gpio_dev)
+{
+	struct pinctrl_desc *desc = &amd_pinctrl_desc;
+	struct device *dev = &gpio_dev->pdev->dev;
+	int index;
+
+	index = device_property_match_string(dev, "pinctrl-resource-names",  "iomux");
+	if (index < 0) {
+		dev_warn(dev, "failed to get iomux index\n");
+		goto out_no_pinmux;
+	}
+
+	gpio_dev->iomux_base = devm_platform_ioremap_resource(gpio_dev->pdev, index);
+	if (IS_ERR(gpio_dev->iomux_base)) {
+		dev_warn(dev, "Failed to get iomux %d io resource\n", index);
+		goto out_no_pinmux;
+	}
+
+	return;
+
+out_no_pinmux:
+	desc->pmxops = NULL;
+}
+
 static int amd_gpio_probe(struct platform_device *pdev)
 {
 	int ret = 0;
@@ -1020,6 +1044,7 @@ static int amd_gpio_probe(struct platform_device *pdev)
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

