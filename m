Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D907053A1E7
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Jun 2022 12:06:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351460AbiFAKFg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 1 Jun 2022 06:05:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351733AbiFAKD4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Jun 2022 06:03:56 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2081.outbound.protection.outlook.com [40.107.94.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E555C16580
        for <linux-gpio@vger.kernel.org>; Wed,  1 Jun 2022 03:03:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k0QT9HuvoTtcH65FbuG6hccOtVr/FR9HfInSuhnUvnLMdcQWIIpGwEjlpTI1YclE1Ds8lqVmfpf367StjI1C6GjU9A2JYYqn9aF12k9EmmmHwEyzTrSiOz8gIMRelvmvqijzSJX+7SuGYTOyFHN9hOU7f9vC7i673gg50yGt9XrV6yOPNj639UVRmF1OzfmiY3oQk3WaHWR1bw3MkL142UZvBJR1ekH8M9HvI0B16HjmutZo49p9Sk6I9SnVfAv5wXxdbgXHIcz58bXKYEcdZjwJDkqWdrGL4XtaGyPdFKrEgfDbti34bgmDOMWpkd9AftWpTc/d+jlqBtI53ivsvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0sEM3qM9STYlbSuAOgxz3tQvDeiRODNmnT2/mT7obTY=;
 b=UXz7/OCQ8R+r8/jQoeHrMTtvZIb3pUU32tNPUZtDYMzQqeLmYagijyIycNvoIlcTaf1SORusYXKTquPT0+YQhcg2sjLJkNI0zyVAId5vbd9y/lZxs897sL7mWfxk47W3ILkbnRdArB0kIrb/Syuz8eZLuv13VFI76fsqXyaNs5ww5t2+fmkUFl9YOHlAoj+iPYuY6vd9Ld4quyoANE72pVrVU1JcDVwgtuEPoD7vKc8FRHMX+6nzdnAGS79xRhOWjMpRpYspP/n90JrawNSb5fp1RrTlOPSLzCq7b/BpO8AXGKHk3qPqGoFEBLs28myI9ZXIGQhmszYIhFU6hwvaJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0sEM3qM9STYlbSuAOgxz3tQvDeiRODNmnT2/mT7obTY=;
 b=CDj6C91KqA2kAbnNCd03k75YQL9CLjoIY0MLqTAONU3UVfC1H0nY/B0m/lRQYDN7fud2dUdtAR8a3wu9nYwDCuBU4KV6Ie9054PwQBrlOSUS6yKpqKsm3wquMSGBspCLs37ZMlBicoY00CXyLKr8WySdQN6DzcPmomfJ0Yj5rdI=
Received: from MW4PR03CA0245.namprd03.prod.outlook.com (2603:10b6:303:b4::10)
 by MN2PR12MB3454.namprd12.prod.outlook.com (2603:10b6:208:c8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Wed, 1 Jun
 2022 10:03:09 +0000
Received: from CO1NAM11FT034.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b4:cafe::78) by MW4PR03CA0245.outlook.office365.com
 (2603:10b6:303:b4::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12 via Frontend
 Transport; Wed, 1 Jun 2022 10:03:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT034.mail.protection.outlook.com (10.13.174.248) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5314.12 via Frontend Transport; Wed, 1 Jun 2022 10:03:09 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 1 Jun
 2022 05:03:06 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <Shyam-sundar.S-k@amd.com>, <linus.walleij@linaro.org>,
        <linux-gpio@vger.kernel.org>, <mika.westerberg@linux.intel.com>,
        <andriy.shevchenko@linux.intel.com>
CC:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH v4 5/6] pinctrl: amd: Add amd_get_iomux_res function
Date:   Wed, 1 Jun 2022 15:32:13 +0530
Message-ID: <20220601100214.828595-6-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220601100214.828595-1-Basavaraj.Natikar@amd.com>
References: <20220601100214.828595-1-Basavaraj.Natikar@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2278e27e-b63c-4f8b-a98b-08da43b5ee45
X-MS-TrafficTypeDiagnostic: MN2PR12MB3454:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB34549C5335442ABCE567B73DE6DF9@MN2PR12MB3454.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Isu1m+M0dZbrr2LtzTeOlLkL4n1Q/duI1NpWokgHONO/lEnQwUtfuRdDwX1G7klN0RnxzV/hdVl5ZQDy4kBNvEm/1PkgUCSbuSDAnXKDiZvKIS1y5NxzdJuv7wqOS6dYeHu+wT/Vq5cpIENMjhDRf5eXfQ2gRZMJLkMabjLJIO7JDBky2gJIwrbwOk/UGlZ5ZaHgoi2n4qCDJ3YlzfUQ1c3s2GbetVIzshYJjq79om18KhAEHn00Ahrhsj6kxyWn9cG7+UTW88L7HqW65UuMc6IJ3uE0a5EtDFGVcnZ8/NWmB+05PxJCWqGuzi9VHG0ChNGQll4vd16l+t1y+lRr3RPpleP6tuqjx0wCrZ3MU2R8pX1LCnjBw+rclMMGMSxgiZzlKX3V2Sj5lq9CHye/WpXZj2cAiTPmeh51VDAG0/F3C3gzSGJUKAy5CDOCc5dH3B2DhcK4MMhygXTcFdDBzAmYlGr1tACHZ926P73ZawcGyBbG1ZuVtWqrdUYhWBufb09UECjQZ802Vjf6XcNQjoVHXrSVO09ZRZ/WDsEnmI+f6W/GnIgci5bzxipH3xwlBbqHeNMzZhSDJrS+UDlvjVPk4CjAjiSspdU+bbdMG8Jof7ctIqvqcW6fnxSuHJQviI3oxREi17cNw7djJGw5I/hWezYXTzxlX9aFRqIOblx92KM8Lwy+64zVrtt/Sr945bXZHAYq5c1xgx2ciKSCr7b/RoRzWi1fAOHL/oNxELg=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(86362001)(16526019)(186003)(8936002)(356005)(1076003)(81166007)(26005)(336012)(426003)(47076005)(4326008)(7696005)(83380400001)(508600001)(2906002)(36756003)(40460700003)(8676002)(5660300002)(2616005)(36860700001)(82310400005)(316002)(110136005)(70586007)(6666004)(70206006)(36900700001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2022 10:03:09.0312
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2278e27e-b63c-4f8b-a98b-08da43b5ee45
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT034.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3454
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
 drivers/pinctrl/pinctrl-amd.c | 27 +++++++++++++++++++++++++++
 drivers/pinctrl/pinctrl-amd.h |  1 +
 2 files changed, 28 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index 0645c2c24f50..c037e932d37d 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -963,6 +963,32 @@ static struct pinctrl_desc amd_pinctrl_desc = {
 	.owner = THIS_MODULE,
 };
 
+static void amd_get_iomux_res(struct amd_gpio *gpio_dev)
+{
+	struct pinctrl_desc *desc = &amd_pinctrl_desc;
+	struct device *dev = &gpio_dev->pdev->dev;
+	struct resource *res;
+	int index;
+
+	index = device_property_match_string(dev, "pinctrl-resource-names",  "iomux");
+	if (index > 0) {
+		res = platform_get_resource(gpio_dev->pdev, IORESOURCE_MEM, index);
+		if (!res) {
+			dev_warn(dev, "Failed to get iomux %d io resource\n", index);
+			return;
+		}
+
+		gpio_dev->iomux_base = devm_ioremap(dev, res->start, resource_size(res));
+		if (!gpio_dev->iomux_base) {
+			desc->pmxops = NULL;
+			dev_warn(dev, "failed to devm_ioremap() iomux_base\n");
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
@@ -1020,6 +1046,7 @@ static int amd_gpio_probe(struct platform_device *pdev)
 	gpio_dev->ngroups = ARRAY_SIZE(kerncz_groups);
 
 	amd_pinctrl_desc.name = dev_name(&pdev->dev);
+	amd_get_iomux_res(gpio_dev);
 	gpio_dev->pctrl = devm_pinctrl_register(&pdev->dev, &amd_pinctrl_desc,
 						gpio_dev);
 	if (IS_ERR(gpio_dev->pctrl)) {
diff --git a/drivers/pinctrl/pinctrl-amd.h b/drivers/pinctrl/pinctrl-amd.h
index be74fb106fa7..8ab4bf422ddf 100644
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

