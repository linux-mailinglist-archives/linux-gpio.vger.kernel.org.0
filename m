Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 28CF35310A6
	for <lists+linux-gpio@lfdr.de>; Mon, 23 May 2022 15:20:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235916AbiEWNKP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 May 2022 09:10:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235927AbiEWNKO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 23 May 2022 09:10:14 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2072.outbound.protection.outlook.com [40.107.243.72])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 210EA54039
        for <linux-gpio@vger.kernel.org>; Mon, 23 May 2022 06:10:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nesE2zj2AyEE0LUO0A+6+DTIqKLgbhE41CxKKG1ziz6FMmEFe3VA/h1X6XwH8nzqh7rZH8oQP0Owb20XNZlDXSfoiSCu0GbMJVMltxF+WlicWvecEfuA4jIs5nv+es1dWfDjW0jpdn8dasNaFLXUJwBxRyQittANGKu0B8+tpilKfXCQSTU0OmuGgPbD2NtXLAvX5DKTS9gmeaePtaU5YbZ4/VEzQ9ZefbQQ2x6XPtW6zzFVWbpKZ40Ghwjy6aMNmqV4rTZDyCS4Rb1TuUpqOMPXcHNup9rpn9Rx/c4+O1gG1Pyr1vwvNZaw10fSzxqxYnj2z6sQFwMYtLYMiNklUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IWxDuNKP5WSg36/pM+6DIVx7RPTpxiMykrn21I6wkLE=;
 b=CdhkScVAt1PoclCIz0QYDis8wU3bEjq5rTQmTu6SdB7tLxbiNRqScqITgV7jELp7uQbgooGHeL3AvUoUX534M9z+E3tcKRXbUmQubqTT+WjL/BkJipHo1q6xYsW+uPRvZtWdwpwmj1mGHqo5OvOry7jYAtCtx7sCO6ZJ3kfCnbldrd9fBVHTxaE1iliEi7adfTIbkSXXIHrDJi9u3LUwUvZZrldLy3J6JdsFIWLDYhOYSNXzaQyY5MHXyjiWlNp+T8xYWzxLFuFfGQ1kfTJV2bRuVBc3MCW0TfxFygwBOBVTE1v6afQmrxK9XaDRxD8HuWI24+P/gAUraCyV1wrShA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IWxDuNKP5WSg36/pM+6DIVx7RPTpxiMykrn21I6wkLE=;
 b=cZVnojuayM+1rADhDeJ/HaeGaomAJVW5hCwo7IAVEHj29oZTUwqzGapf3cGomj/WXjJm7ygAm4QPvH/YJjDNvggbDmQekjqeSn4KX76IaTV3wOlJZ/5fypY+AeYH2hdeA4rxEVwxwaceaqeNLDCav4YGEgETDmMi8KmJXNlY/YA=
Received: from MWHPR13CA0034.namprd13.prod.outlook.com (2603:10b6:300:95::20)
 by DM5PR12MB1707.namprd12.prod.outlook.com (2603:10b6:3:108::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.13; Mon, 23 May
 2022 13:10:10 +0000
Received: from CO1NAM11FT032.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:95:cafe::fd) by MWHPR13CA0034.outlook.office365.com
 (2603:10b6:300:95::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.7 via Frontend
 Transport; Mon, 23 May 2022 13:10:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT032.mail.protection.outlook.com (10.13.174.218) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5273.14 via Frontend Transport; Mon, 23 May 2022 13:10:10 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 23 May
 2022 08:10:07 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <Shyam-sundar.S-k@amd.com>, <linus.walleij@linaro.org>,
        <linux-gpio@vger.kernel.org>
CC:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH 2/3] pinctrl: amd: Get and update IOMUX details
Date:   Mon, 23 May 2022 18:39:43 +0530
Message-ID: <20220523130944.473416-3-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220523130944.473416-1-Basavaraj.Natikar@amd.com>
References: <20220523130944.473416-1-Basavaraj.Natikar@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5444c041-6656-464a-f6df-08da3cbd90ea
X-MS-TrafficTypeDiagnostic: DM5PR12MB1707:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB170712D4188D8C97519B948DE6D49@DM5PR12MB1707.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KMDpBVSDySwL/bmx3JR4O7+0s8C6Ow5Ao4rQDfrQjMh8DGy0Tq85oFV/7YClkqPvfdOpd4sRDGmiksryq6ZfiPI9/lPi+Da5TsV1bo9FmtoPppjPav+kKCqwcxzAmX2rW4xRBUGMz8rp4pKEbg+5pOe0nOgMLZV0QxUYsWneF+KJru8x//EBIuDfVH4vlQ9V8eWGTpDfEhMhbfmMQG3l27lP304ANmNUEVS5AnxNLNWY/qvmMV3qWLBcpV3jhHLUDgD3EvzmYds8Vliiad2rFshgMxDyFeHxy29bWBUOePgPa0H6nadCcIzeeRfNIduSOG8AVynPvgsBz6rUFX//jk3kEYar/IemtAfE0qTGtbEkhTuTDPD7YmYrPhWb2LPf50qr5ZO/YpBOW76nBLHeIMWSpYNoFIruN9KG5BHb7TJa5zj8oY7W1l455asZ04ohFBzopEl0vjB4pnYOKSkrUm/v5r8YVvjWyu4bAvPK9rrHE6+TeXUzT8b1ZtKn9O/MuLs7ENLVA/BPtiW1DS8AlgBlRPbHwRnRg/egC7UU+ZPpJqIlKpNykp5M8sVOdOlkEmr1Vlz+ACsIjcDKbDgqpUaspa2G85md8U5LbkmCeinmJ1yFQntMyOqXQJCfbb2+bmFetXBhTFzUEM5T+XLpIUePjv6k8dygAWeo+OqNhi9yOXgl2H/CO15JwsQSMYfru6zTMPsxzK0Tonlq8DQUzxiAn6qz7WS01cVnxlHCKk8=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(186003)(82310400005)(70586007)(426003)(336012)(16526019)(2616005)(8676002)(83380400001)(110136005)(8936002)(47076005)(40460700003)(7696005)(26005)(81166007)(5660300002)(316002)(356005)(86362001)(1076003)(70206006)(2906002)(508600001)(36756003)(36860700001)(4326008)(6666004)(36900700001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2022 13:10:10.2118
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5444c041-6656-464a-f6df-08da3cbd90ea
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT032.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1707
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

