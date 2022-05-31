Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB6D2538D17
	for <lists+linux-gpio@lfdr.de>; Tue, 31 May 2022 10:44:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244902AbiEaIoA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 31 May 2022 04:44:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238352AbiEaIoA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 31 May 2022 04:44:00 -0400
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1anam02on2040.outbound.protection.outlook.com [40.107.96.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1165C72E12
        for <linux-gpio@vger.kernel.org>; Tue, 31 May 2022 01:43:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZKKNw5cakh4ana+r+FkhS8UBc5C3DtJaLJpCyAEmUWdsOeWnTau1U1ZTNPoPSAMZ7HmHkcUdWJngZnVZKSZsKljXeBW56MSFq2ucXp5h734ZY6H4X06kQsdKbjpI9s3nyS1io1185KO2h9g78ke1P5hagNdIzqSW0YHo6nHGrIVSd8U748b4Rz9q6NO1OoKTu2FSNyeUKwOhSWA8Saa5w4s58XLphrUj5MD3KaFONgjbmXwZeZxpzMfcKSz/IO/XulVPj5qk+b9wFMtDlGYQtZTe0QWFejH8qGg+jzS7hUnrFuLltiPU72/pq7w+yLeuMQnuH9oihsFekT/M44VacQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I3bOxFd6p472SheBljo2xtAoikQ/JpWqZbz+aLX22x4=;
 b=PgbtgAV/BJGJvSL51PaCySLHp6pRXiRvckvm00WeYm/+MxI7UmMmGKJ01A01e90fpKRfrIKzbKZ3FIGZYYsXA0oK229qEfwkOtiWbC71WR7IdujaF5BzId8Laf8VNhigqTvIhTglRtE7ZD7fH47EBj5IFiZsup0qT94260H8uMnRGJZBynqWXL2Tyb3z6eJXsuc9gYpQ7TUAJ9dDWMqM2nr02SDuwlWvkP7rYmAaT8ESANJCY5J8ee3PXI3t17ZbtVYlSrFJoafdKG+ZKPdw5UdIsihbJAvSoL1yb0PTwkQe1FluR2ct0verFM7jZosd7//hYKy7Y0DpH0cist3rsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I3bOxFd6p472SheBljo2xtAoikQ/JpWqZbz+aLX22x4=;
 b=e59BaWrdIV3W+/c8yCTZh/rs1Xk86PVhC8h6NG76oeWW999lTal2inLznsiYa0lNdYnj/i7P7wzJ4AbCqOSJz4DhPpppMXniBdHSV4OtUU1nDQdFGtz+XEr2YNnMnTdrWARchmZVLMMD/dTCUvQMZEahu2KRpRRTzndzZeP2U+w=
Received: from DM5PR1401CA0016.namprd14.prod.outlook.com (2603:10b6:4:4a::26)
 by MN2PR12MB4287.namprd12.prod.outlook.com (2603:10b6:208:1dd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Tue, 31 May
 2022 08:43:56 +0000
Received: from DM6NAM11FT063.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:4a:cafe::92) by DM5PR1401CA0016.outlook.office365.com
 (2603:10b6:4:4a::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13 via Frontend
 Transport; Tue, 31 May 2022 08:43:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT063.mail.protection.outlook.com (10.13.172.219) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5293.13 via Frontend Transport; Tue, 31 May 2022 08:43:56 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 31 May
 2022 03:43:51 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <Shyam-sundar.S-k@amd.com>, <linus.walleij@linaro.org>,
        <linux-gpio@vger.kernel.org>, <mika.westerberg@linux.intel.com>,
        <andriy.shevchenko@linux.intel.com>
CC:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH v3 5/6] pinctrl: amd: Add amd_get_iomux_res function
Date:   Tue, 31 May 2022 14:13:21 +0530
Message-ID: <20220531084322.1310250-6-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220531084322.1310250-1-Basavaraj.Natikar@amd.com>
References: <20220531084322.1310250-1-Basavaraj.Natikar@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4dd8d44e-2f9c-4881-1bd2-08da42e1b2e8
X-MS-TrafficTypeDiagnostic: MN2PR12MB4287:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB4287B2EA08E7A5A8190E93FDE6DC9@MN2PR12MB4287.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a/4uX8gCjRBJu1LbULy6re28BcuQnI5ZWm67RCTELK55IpnGSunmaDyH4riYmRpbI8zyl/K7cv4Mr6/91HuVNU4UFfB5ITFwY+pp+MchEtsw+228Xq+QhZibxB4Qg2CAIt5ednStxYdvT/HYNQ+/3VP/34b5Snn102YUvCyI1LFlJVt1YIuymmIZZyylkTg06T6toW/4OYyhGr+ncYv9LrlK3rRlG2gW8zJ3qw+bbi3v6K8O4XfFIzgSYSwXUS5n15t3jXjyZ1jWFTv5L2+TnGN4ZJxUbq1POYK9eh7Wo6XwEm5GNX46EdXLYH2nJXYtyv5N2IIajdItsoDq2coUNNQit/whhhRJHhThUaN6ASWS/aiZd3bt3hBukOLR5eZJlrVD66uV5de+CuJkAqzoLBZLETXxnHdcbV9yO4QrJJCT2kCtNTk0QzdNreAea+2ATMeMYrs2Vw8jmFlSHGkTW7RZVKOHYEiSPMHSEg7xOE3v7IrmHImvvrk0i79blSFgDjaT60KUSJsTonEOdonYaGjSxDBPhuDTKuMPhu4CpGBghvUjpWYyS4J7R1V/d5N7Ns+DA7agAGUWcZFA8A5mcnx87GtQda3j9yp/3K0gnIf6KoHZr7mSAQr8jpi+zMDTknp03RUR0ZA+ESslubq/wBrMK17XYLtXZkg8ZuFAsu9rN54wfNZE5aDz43qAaLFIOnwtXgtOq4dyZjCI99Ui7VHZEFKJp4BFtM65RU9xFOg=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(5660300002)(8936002)(7696005)(508600001)(86362001)(40460700003)(6666004)(26005)(2906002)(36860700001)(81166007)(356005)(82310400005)(2616005)(47076005)(426003)(16526019)(336012)(1076003)(186003)(83380400001)(316002)(4326008)(110136005)(8676002)(36756003)(70586007)(70206006)(2101003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2022 08:43:56.2039
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dd8d44e-2f9c-4881-1bd2-08da42e1b2e8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT063.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4287
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
 drivers/pinctrl/pinctrl-amd.c | 33 +++++++++++++++++++++++++++++++++
 drivers/pinctrl/pinctrl-amd.h |  1 +
 2 files changed, 34 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index 0645c2c24f50..59927d4bf0d1 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -963,6 +963,38 @@ static struct pinctrl_desc amd_pinctrl_desc = {
 	.owner = THIS_MODULE,
 };
 
+static void amd_get_iomux_res(struct amd_gpio *gpio_dev)
+{
+	struct acpi_device *adev = ACPI_COMPANION(&gpio_dev->pdev->dev);
+	struct pinctrl_desc *desc = gpio_dev->pctrl->desc;
+	struct resource *res;
+	int index;
+
+	if (!adev)
+		return;
+
+	index = fwnode_property_match_string(acpi_fwnode_handle(adev),
+					     "pinctrl-resource-names",  "iomux");
+	if (index > 0) {
+		res = platform_get_resource(gpio_dev->pdev, IORESOURCE_MEM, index);
+		if (!res) {
+			dev_warn(&gpio_dev->pdev->dev, "Failed to get iomux %d io resource\n",
+				 index);
+			return;
+		}
+
+		gpio_dev->iomux_base = devm_ioremap(&gpio_dev->pdev->dev, res->start,
+						    resource_size(res));
+		if (!gpio_dev->iomux_base) {
+			desc->pmxops = NULL;
+			dev_warn(&gpio_dev->pdev->dev, "failed to devm_ioremap() iomux_base\n");
+		}
+	} else {
+		desc->pmxops = NULL;
+		dev_warn(&gpio_dev->pdev->dev, "failed to get iomux index\n");
+	}
+}
+
 static int amd_gpio_probe(struct platform_device *pdev)
 {
 	int ret = 0;
@@ -1057,6 +1089,7 @@ static int amd_gpio_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, gpio_dev);
 	acpi_register_wakeup_handler(gpio_dev->irq, amd_gpio_check_wake, gpio_dev);
+	amd_get_iomux_res(gpio_dev);
 
 	dev_dbg(&pdev->dev, "amd gpio driver loaded\n");
 	return ret;
diff --git a/drivers/pinctrl/pinctrl-amd.h b/drivers/pinctrl/pinctrl-amd.h
index 5443a4a38eec..0f9fbae6d2f4 100644
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

