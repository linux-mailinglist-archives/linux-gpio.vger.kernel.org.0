Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F09CE532443
	for <lists+linux-gpio@lfdr.de>; Tue, 24 May 2022 09:40:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234031AbiEXHko (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 May 2022 03:40:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231756AbiEXHkn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 24 May 2022 03:40:43 -0400
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2075.outbound.protection.outlook.com [40.107.237.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 093FA7354E
        for <linux-gpio@vger.kernel.org>; Tue, 24 May 2022 00:40:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gn2snXWNP9OEJrwms4xFHL2yGP+3tTAvR5n6KwhY5h3LOWIkyKrd6/r2L4Hfla8EXeODbDxNrgSgcgywo2OYxMrQfq9Trfvl7bXdEWdcS/wKr30DyWsZsA1M0eE3K7MdikE/CutgeqJx2p+jxa25L0pxb2ZOrIouMXEzGZqT0bXu9hNRYubS8LQNMkff4bSTOPWPhZSUwt5FiuUrO1bPjOkxgxHtqupz8vKD/YsbOLa0FwinX++b/zgWa0yh86xunV0OpTwC36t2E5GrjsP0faDV4DS98s3uDqIWL9CIG3iUMYfE98wKvckAqXWxDlaLRsxvYOWTAaYmwNzIexmItA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IWxDuNKP5WSg36/pM+6DIVx7RPTpxiMykrn21I6wkLE=;
 b=UWU5jBDQvCE+NyvwCITQohhCvWHWAzo1ZsNuoOUyYLxoeGaEligvOqyfB9fVVN3T9Tlos4EJWXR0nK7rb+CvFgutgSzYMvZec+I/DWZ60eGo6pbrblxWJzscCrlEHuSEamaYOtGgpPb3c63GnnkR1V4rrYN63OnRSjh8N8NOrF9OybfjUQ61PXlTyBBegdNrCGUYyTURdFwrOwy92YjmulBAlOFphAz7pyIKS5mQMJ6mGQOIiV9nd6OQNRFHsRhxAt703Dn+om3BLiij1Qfj9JmP3jtkz5UHQsx6VkiYskBBNQlN1yrs+RXmnYPxzWodqRF+2Q5alyMzC6YDXgqggw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IWxDuNKP5WSg36/pM+6DIVx7RPTpxiMykrn21I6wkLE=;
 b=dhCEJOzz0jh2Q+JBq0/wgMZFvl57a1KJMNpyBF+8NKB9+qG87y6i4yWNp+vjzJxYwiwWZXG1nADHGZFmriw1VRk7oYoVX0Hv4bq7bQV8cpWGompe3/6db1NAH1tQA5290IKSQcKaPrdz4zKTsFuG00wHqPgi+q1O3LQhFe7AYc0=
Received: from MWHPR04CA0055.namprd04.prod.outlook.com (2603:10b6:300:6c::17)
 by CY5PR12MB6621.namprd12.prod.outlook.com (2603:10b6:930:43::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.23; Tue, 24 May
 2022 07:40:39 +0000
Received: from CO1NAM11FT066.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:6c:cafe::7) by MWHPR04CA0055.outlook.office365.com
 (2603:10b6:300:6c::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.21 via Frontend
 Transport; Tue, 24 May 2022 07:40:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT066.mail.protection.outlook.com (10.13.175.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5273.14 via Frontend Transport; Tue, 24 May 2022 07:40:38 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Tue, 24 May
 2022 02:40:34 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <Shyam-sundar.S-k@amd.com>, <linus.walleij@linaro.org>,
        <linux-gpio@vger.kernel.org>
CC:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH v2 2/3] pinctrl: amd: Get and update IOMUX details
Date:   Tue, 24 May 2022 13:10:06 +0530
Message-ID: <20220524074007.2792445-3-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220524074007.2792445-1-Basavaraj.Natikar@amd.com>
References: <20220524074007.2792445-1-Basavaraj.Natikar@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d96fa79d-3e9e-4a34-a89d-08da3d58b2af
X-MS-TrafficTypeDiagnostic: CY5PR12MB6621:EE_
X-Microsoft-Antispam-PRVS: <CY5PR12MB66214D1C71C0BBEF001A1727E6D79@CY5PR12MB6621.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zAOJfmpVinTvsg4VL7bPvSZVs8wAfROe6cIdY3nuat3opswFXyza+2xrwSvr4+yBIhYk6aOyrdcpdLbE6bC3ybrctnEyxWySyrZS5yROw+wBU8k+91kVNeHaIXioJCUlZMmHehR+nZZNSmhTCHAzsUNkHjjtN8N9M2/55Pol0CJSF0m7rsI1gEoXd+KMJEcRBxttkbPe+5RMmAr/F8MX6IVDYT/zuQ91bRUPV8dC4xVfTYkaXi2YeV4cIFJ1SieSYiD2ArnK9Dl6pXsCU7FCqAeI0LtlUoTSUYFHvM9YkfDSJLfw1+dn5LAHSnUtj71clxYc9k1XVbdfW/qBMwkeDBfuRL9yBqj0VmnhTICF3TotBtdK16/QGsqLrYBhHbgyjK9jlpAESxNHYXMx89+v4iKiuc79u9Y+iQ7lVbRkLOT1Ca6I30pHM3v2Uv3naA8Jjy/rXzq2jDlEtGuaqOr+dhEDJ5KDEylTS5KVvIg1OWpA6RHp/r6jFN2heKCtr/GY1ALe5OVyadaGowpM7AgetMelv5U71ye8nDL3HzOUi9ax4E4xWGCKLt76R6K7mj5GQUDRup89sh5maUJ7V2vmRgwKId187ZtSJ+PILaZS0IAQ4wF34JkKrzw2iVl4X6QhrvQjp4tPaFZsC8VnQ4WJhB7D1dHz69FEvM8Jf8XG3bexqPUf7Iqc6xbgRfk8BaZLtka7g6z/jml8aqq2+LcqOvNG3aBhl2iuiqubVG4I26I=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(186003)(16526019)(83380400001)(336012)(82310400005)(47076005)(81166007)(356005)(36860700001)(426003)(86362001)(40460700003)(1076003)(7696005)(6666004)(508600001)(110136005)(316002)(70206006)(70586007)(2906002)(2616005)(26005)(4326008)(8676002)(5660300002)(8936002)(36756003)(36900700001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2022 07:40:38.8744
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d96fa79d-3e9e-4a34-a89d-08da3d58b2af
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT066.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6621
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Presently there is no way to change pinmux configuration runtime.
Hence add IOMUX details which can be used to configure IOMUX
gpio pins runtime to different functionalities.

Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/pinctrl/pinctrl-amd.c | 65 +++++++++++++++++++++++++++++++++++
 drivers/pinctrl/pinctrl-amd.h |  1 +
 2 files changed, 66 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index 1a7d686494ff..3058b6d35e47 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -32,6 +32,8 @@
 #include <linux/pinctrl/pinconf.h>
 #include <linux/pinctrl/pinconf-generic.h>
 
+#include "../acpi/acpica/accommon.h"
+
 #include "core.h"
 #include "pinctrl-utils.h"
 #include "pinctrl-amd.h"
@@ -958,6 +960,68 @@ static struct pinctrl_desc amd_pinctrl_desc = {
 	.owner = THIS_MODULE,
 };
 
+static acpi_status acpi_get_iomux_region(acpi_handle handle, u32 level,
+					 void *ctx, void **return_value)
+{
+	struct acpi_namespace_node *node = handle;
+	union acpi_operand_object *region_obj;
+	struct amd_gpio *gpio_dev = ctx;
+
+	/* Already mapped the IOMUX base */
+	if (gpio_dev->iomux_base)
+		return AE_OK;
+
+	/* Valid object */
+	if (!node || !node->object)
+		return AE_OK;
+
+	/* Valid operand or namespace node*/
+	if ((ACPI_GET_DESCRIPTOR_TYPE(node->object) != ACPI_DESC_TYPE_OPERAND) &&
+	    (ACPI_GET_DESCRIPTOR_TYPE(node->object) != ACPI_DESC_TYPE_NAMED))
+		return AE_OK;
+
+	/* Valid object type*/
+	if (node->object->common.type == ACPI_TYPE_LOCAL_DATA)
+		return AE_OK;
+
+	region_obj = node->object;
+	if (!region_obj->region.handler)
+		return AE_OK;
+
+	if (region_obj->region.space_id != ACPI_ADR_SPACE_SYSTEM_MEMORY)
+		return AE_OK;
+
+	if (strncmp("IOMX", region_obj->region.node->name.ascii, strlen("IOMX")))
+		return AE_OK;
+
+	gpio_dev->iomux_base = devm_ioremap(&gpio_dev->pdev->dev,
+					    region_obj->region.address,
+					    region_obj->region.length);
+	if (!gpio_dev->iomux_base)
+		dev_err(&gpio_dev->pdev->dev, "failed to devm_ioremap() iomux_base\n");
+
+	return AE_OK;
+}
+
+static void amd_update_iomux_info(struct amd_gpio *gpio_dev)
+{
+	acpi_handle sys_bus_handle;
+	int status = acpi_get_handle(NULL, "\\_SB", &sys_bus_handle);
+
+	if (ACPI_FAILURE(status)) {
+		dev_err(&gpio_dev->pdev->dev, "Failed to get SB handle\n");
+		return;
+	}
+
+	status = acpi_walk_namespace(ACPI_TYPE_REGION, sys_bus_handle, ACPI_UINT32_MAX,
+				     acpi_get_iomux_region, NULL, gpio_dev, NULL);
+
+	if (ACPI_FAILURE(status)) {
+		dev_err(&gpio_dev->pdev->dev, "Failed to get acpi_get_iomux_region\n");
+		return;
+	}
+}
+
 static int amd_gpio_probe(struct platform_device *pdev)
 {
 	int ret = 0;
@@ -1052,6 +1116,7 @@ static int amd_gpio_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, gpio_dev);
 	acpi_register_wakeup_handler(gpio_dev->irq, amd_gpio_check_wake, gpio_dev);
+	amd_update_iomux_info(gpio_dev);
 
 	dev_dbg(&pdev->dev, "amd gpio driver loaded\n");
 	return ret;
diff --git a/drivers/pinctrl/pinctrl-amd.h b/drivers/pinctrl/pinctrl-amd.h
index de2bc9dddc9c..8296426f4c81 100644
--- a/drivers/pinctrl/pinctrl-amd.h
+++ b/drivers/pinctrl/pinctrl-amd.h
@@ -89,6 +89,7 @@ struct amd_function {
 struct amd_gpio {
 	raw_spinlock_t          lock;
 	void __iomem            *base;
+	void __iomem            *iomux_base;
 
 	const struct amd_pingroup *groups;
 	u32 ngroups;
-- 
2.25.1

