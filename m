Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8213B33EB6E
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Mar 2021 09:27:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229769AbhCQI0b (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 17 Mar 2021 04:26:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229613AbhCQI0X (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 17 Mar 2021 04:26:23 -0400
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (mail-co1nam04on0619.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe4d::619])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC70FC06174A;
        Wed, 17 Mar 2021 01:26:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UgHKdUFYnNmqX2FLgnKtBe56c35iGy6c+JzRfjaYGvUIonFGkoviXl+Y094E4wBS2OffzU2f20zNwZSQpDONYhBH9FpMbk3OVQdScq+qLNMY862hIZkrJhenqErdKvJl8DyNIpSFvsw8Bii4G07AaCqDZW+yVOTReSa1iCgs737bRF321PDegdR/DqD1+vKQJsr5m75tasZSIj11xa8dLjMhsIM+bvhdruXelpq9TzUS5YFQPp0tyMcw/Khepzc1fE20JZ/ZB8/CDYlAyuf7vV1P1qiOBrElY+Fnnp8Avq7BoOe8d8seMgVesJZMGigxi1uVyJ7ikwuiw3NNxj/GSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f50BTM0po02Zs+hP3jWeg3yro1qD6JWctTwDwdhsO60=;
 b=S3OszF00k+PrmgWifHtmq20xsGamGP/DQNZrHRih+uryZrjZKsh/8ENPB7d4gVDF1jMQq6qmOpKlg+6xGRlg+sabV9qpYPXiJYfsPR0wshglE6KDCNSLzw1QnpXrS7PTEEnRHdVtO6cvN2N4o/ODoNN6sVsqDqJeM5+kMzBc++tSZlWOjWdoHE3lIIJD99GxVqs20YfM8Fnv60ww3g02ImVPywZUZmk60dyr99eu00QE9XN5M2BUbXOsE7YKVGGQZCpAtFK7WNjhDsEFSk477+GnxfEn4xRrYmzFEr+35/cn4Vkmd2IHbtmsM+/LHc212HY74bN1GAsXA1ekN4Jphg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=gmail.com smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f50BTM0po02Zs+hP3jWeg3yro1qD6JWctTwDwdhsO60=;
 b=OTu6X+BrVcU85PQgxI0DNf/MLMWFtprgp6oHjxEmlLbl5v9MiDrJPyjN7zUUA7N9wZaQPxS6+uK3DS001QwUitr6RDwQhDtFA7SkPv1TAAK2nIj5hEuTKToJ0TJIYY9RS1rKILhlO3icLGGlKgKMVGI5vJ5lEfBy2rb788jAVYA=
Received: from CY4PR07CA0020.namprd07.prod.outlook.com (2603:10b6:903:165::30)
 by MWHPR0201MB3450.namprd02.prod.outlook.com (2603:10b6:301:76::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Wed, 17 Mar
 2021 08:26:20 +0000
Received: from CY1NAM02FT030.eop-nam02.prod.protection.outlook.com
 (2603:10b6:903:165:cafe::46) by CY4PR07CA0020.outlook.office365.com
 (2603:10b6:903:165::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend
 Transport; Wed, 17 Mar 2021 08:26:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT030.mail.protection.outlook.com (10.152.75.163) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3933.32 via Frontend Transport; Wed, 17 Mar 2021 08:26:20 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 17 Mar 2021 01:26:08 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Wed, 17 Mar 2021 01:26:08 -0700
Envelope-to: git@xilinx.com,
 saikrishna12468@gmail.com,
 robh+dt@kernel.org,
 linus.walleij@linaro.org,
 gregkh@linuxfoundation.org,
 linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
Received: from [172.23.64.106] (port=50142 helo=xhdvnc125.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <lakshmi.sai.krishna.potthuri@xilinx.com>)
        id 1lMRVF-0002Y3-DE; Wed, 17 Mar 2021 01:26:06 -0700
Received: by xhdvnc125.xilinx.com (Postfix, from userid 14964)
        id CC4E7121463; Wed, 17 Mar 2021 13:55:24 +0530 (IST)
From:   Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <git@xilinx.com>,
        <saikrishna12468@gmail.com>,
        Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>
Subject: [PATCH v4 3/3] pinctrl: Add Xilinx ZynqMP pinctrl driver support
Date:   Wed, 17 Mar 2021 13:55:16 +0530
Message-ID: <1615969516-87663-4-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1615969516-87663-1-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
References: <1615969516-87663-1-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cdae5a3f-5dff-4a20-6e93-08d8e91e57a4
X-MS-TrafficTypeDiagnostic: MWHPR0201MB3450:
X-Microsoft-Antispam-PRVS: <MWHPR0201MB3450CB0FA3A28CE6699A693ABD6A9@MWHPR0201MB3450.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:222;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EDUxHpgoXy2D+nVjQppyocEAz+jta/DrUJc9hlONoZUR3ay60hzJRoSfaRHOC1UV2/bJSdaMH+7kkcLP+qAhc0L0A7VAHw1bQS/cpTUIPdSLLbnjqngXI7IvxZwLwl87Mx+M5HTG0kA3DUyIRQkwrlsxqPY2OlMJ3CyLpXrv4HgjCqwWrL6rwRwNAKdnJWjp4lb8oGqe2JMjj+K5Utsj3janzGiFlOGhlOm0tRkua7Dk30beDImMv+CT1mvlFAuJw9BcfRxgTWCHWuN+9wTbnx5EBOG6XHqY+mxPwP+u+XGax1Q2ESUJddo/sRPFCSQaiSTkluaIoqm8ojYTaPSo4V/imxQys1VwTpk5q90XpMdozeKS9QUc6HgXdBtBNvnz7SqabgimRhWnWFX2iDiVIhJaOTngmQU1q5NJgpqZTVws81UKKc5iEV8Rth/h4sqf0EMIbeAlVzBC/nj3CD6ydRnfrjLnzxwTEECpbLIDjW3KbrFiui34Ie7uqBOQK+xO3pSubw9ElaO6aImUn0AlNtOA+rg61CzwLQs+G5AL2MXG+RENkMjI71/LG/tu87jGSGitOhxhbC1CfqIS81TEWG9LlWYHdkGs7Vhg/R7JzWvzK7Yzbk+XutlRLovkFBdoMZnu0G42slvCstaoayuL0pRbC8YZscIab92vjbopt7oHmFCHqYJuL1zkZc6Beain
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(39860400002)(346002)(376002)(396003)(136003)(36840700001)(46966006)(82740400003)(6666004)(36756003)(70586007)(4326008)(83380400001)(47076005)(316002)(36860700001)(107886003)(82310400003)(426003)(2616005)(8676002)(7636003)(8936002)(70206006)(26005)(42186006)(54906003)(6266002)(36906005)(336012)(186003)(478600001)(5660300002)(356005)(30864003)(110136005)(2906002)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 08:26:20.0970
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cdae5a3f-5dff-4a20-6e93-08d8e91e57a4
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT030.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR0201MB3450
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Adding pinctrl driver for Xilinx ZynqMP platform.
This driver queries pin information from firmware and registers
pin control accordingly.

Signed-off-by: Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>
---
 drivers/pinctrl/Kconfig          |   13 +
 drivers/pinctrl/Makefile         |    1 +
 drivers/pinctrl/pinctrl-zynqmp.c | 1030 ++++++++++++++++++++++++++++++
 3 files changed, 1044 insertions(+)
 create mode 100644 drivers/pinctrl/pinctrl-zynqmp.c

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index 815095326e2d..25d3c7208975 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -341,6 +341,19 @@ config PINCTRL_ZYNQ
 	help
 	  This selects the pinctrl driver for Xilinx Zynq.
 
+config PINCTRL_ZYNQMP
+	bool "Pinctrl driver for Xilinx ZynqMP"
+	depends on ARCH_ZYNQMP
+	select PINMUX
+	select GENERIC_PINCONF
+	help
+	  This selects the pinctrl driver for Xilinx ZynqMP platform.
+	  This driver will query the pin information from the firmware
+	  and allow configuring the pins.
+	  Configuration can include the mux function to select on those
+	  pin(s)/group(s), and various pin configuration parameters
+	  such as pull-up, slew rate, etc.
+
 config PINCTRL_INGENIC
 	bool "Pinctrl driver for the Ingenic JZ47xx SoCs"
 	default MACH_INGENIC
diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
index f53933b2ff02..7e058739f0d5 100644
--- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@ -43,6 +43,7 @@ obj-$(CONFIG_PINCTRL_TB10X)	+= pinctrl-tb10x.o
 obj-$(CONFIG_PINCTRL_ST) 	+= pinctrl-st.o
 obj-$(CONFIG_PINCTRL_STMFX) 	+= pinctrl-stmfx.o
 obj-$(CONFIG_PINCTRL_ZYNQ)	+= pinctrl-zynq.o
+obj-$(CONFIG_PINCTRL_ZYNQMP)    += pinctrl-zynqmp.o
 obj-$(CONFIG_PINCTRL_INGENIC)	+= pinctrl-ingenic.o
 obj-$(CONFIG_PINCTRL_RK805)	+= pinctrl-rk805.o
 obj-$(CONFIG_PINCTRL_OCELOT)	+= pinctrl-ocelot.o
diff --git a/drivers/pinctrl/pinctrl-zynqmp.c b/drivers/pinctrl/pinctrl-zynqmp.c
new file mode 100644
index 000000000000..63edde400e85
--- /dev/null
+++ b/drivers/pinctrl/pinctrl-zynqmp.c
@@ -0,0 +1,1030 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * ZynqMP pin controller
+ *
+ *  Copyright (C) 2020 Xilinx, Inc.
+ *
+ *  Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>
+ *  Rajan Vaja <rajanv@xilinx.com>
+ */
+
+#include <linux/init.h>
+#include <linux/of_address.h>
+#include <linux/pinctrl/pinmux.h>
+#include <linux/pinctrl/pinconf-generic.h>
+#include <dt-bindings/pinctrl/pinctrl-zynqmp.h>
+#include <linux/platform_device.h>
+#include <linux/firmware/xlnx-zynqmp.h>
+#include "core.h"
+#include "pinctrl-utils.h"
+
+#define ZYNQMP_PIN_PREFIX			"MIO"
+#define PINCTRL_GET_FUNC_NAME_RESP_LEN		16
+#define MAX_FUNC_NAME_LEN			16
+#define MAX_GROUP_PIN				50
+#define END_OF_FUNCTIONS			"END_OF_FUNCTIONS"
+#define NUM_GROUPS_PER_RESP			6
+
+#define PINCTRL_GET_FUNC_GROUPS_RESP_LEN	12
+#define PINCTRL_GET_PIN_GROUPS_RESP_LEN		12
+#define NA_GROUP				-1
+#define RESERVED_GROUP				-2
+
+#define DRIVE_STRENGTH_2MA	2
+#define DRIVE_STRENGTH_4MA	4
+#define DRIVE_STRENGTH_8MA	8
+#define DRIVE_STRENGTH_12MA	12
+
+/**
+ * struct zynqmp_pmux_function - a pinmux function
+ * @name:	Name of the pinmux function
+ * @groups:	List of pingroups for this function
+ * @ngroups:	Number of entries in @groups
+ * @node:`	Firmware node matching with for function
+ *
+ * This structure holds information about pin control function
+ * and function group names supporting that function.
+ */
+struct zynqmp_pmux_function {
+	char name[MAX_FUNC_NAME_LEN];
+	const char * const *groups;
+	unsigned int ngroups;
+};
+
+/**
+ * struct zynqmp_pinctrl - driver data
+ * @pctrl:	Pinctrl device
+ * @groups:	Pingroups
+ * @ngroups:	Number of @groups
+ * @funcs:	Pinmux functions
+ * @nfuncs:	Number of @funcs
+ *
+ * This struct is stored as driver data and used to retrieve
+ * information regarding pin control functions, groups and
+ * group pins.
+ */
+struct zynqmp_pinctrl {
+	struct pinctrl_dev *pctrl;
+	const struct zynqmp_pctrl_group *groups;
+	unsigned int ngroups;
+	const struct zynqmp_pmux_function *funcs;
+	unsigned int nfuncs;
+};
+
+/**
+ * struct zynqmp_pctrl_group - Pin control group info
+ * @name:	Group name
+ * @pins:	Group pin numbers
+ * @npins:	Number of pins in group
+ */
+struct zynqmp_pctrl_group {
+	const char *name;
+	unsigned int pins[MAX_GROUP_PIN];
+	unsigned int npins;
+};
+
+/**
+ * enum zynqmp_pin_config_param - possible pin configuration parameters
+ * @PIN_CONFIG_IOSTANDARD:	if the pin can select an IO standard,
+ *				the argument to this parameter (on a
+ *				custom format) tells the driver which
+ *				alternative IO standard to use
+ */
+enum zynqmp_pin_config_param {
+	PIN_CONFIG_IOSTANDARD = PIN_CONFIG_END + 1,
+};
+
+static const struct pinconf_generic_params zynqmp_dt_params[] = {
+	{"io-standard", PIN_CONFIG_IOSTANDARD, IO_STANDARD_LVCMOS18},
+};
+
+#ifdef CONFIG_DEBUG_FS
+static const struct
+pin_config_item zynqmp_conf_items[ARRAY_SIZE(zynqmp_dt_params)] = {
+	PCONFDUMP(PIN_CONFIG_IOSTANDARD, "io-standard", NULL, true),
+};
+#endif
+
+static struct pinctrl_desc zynqmp_desc;
+
+/**
+ * zynqmp_pctrl_get_groups_count() - get group count
+ * @pctldev:	Pincontrol device pointer.
+ *
+ * Get total groups count.
+ *
+ * Return: group count.
+ */
+static int zynqmp_pctrl_get_groups_count(struct pinctrl_dev *pctldev)
+{
+	struct zynqmp_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
+
+	return pctrl->ngroups;
+}
+
+/**
+ * zynqmp_pctrl_get_group_name() - get group name
+ * @pctldev:	Pincontrol device pointer.
+ * @selector:	Group ID.
+ *
+ * Get gorup's name.
+ *
+ * Return: group name.
+ */
+static const char *zynqmp_pctrl_get_group_name(struct pinctrl_dev *pctldev,
+					       unsigned int selector)
+{
+	struct zynqmp_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
+
+	return pctrl->groups[selector].name;
+}
+
+/**
+ * zynqmp_pctrl_get_group_pins() - get group pins
+ * @pctldev:	Pincontrol device pointer.
+ * @selector:	Group ID.
+ * @pins:	Pin numbers.
+ * @npins:	Number of pins in group.
+ *
+ * Get gorup's pin count and pin number.
+ *
+ * Return: Success.
+ */
+static int zynqmp_pctrl_get_group_pins(struct pinctrl_dev *pctldev,
+				       unsigned int selector,
+				       const unsigned int **pins,
+				       unsigned int *npins)
+{
+	struct zynqmp_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
+
+	*pins = pctrl->groups[selector].pins;
+	*npins = pctrl->groups[selector].npins;
+
+	return 0;
+}
+
+static const struct pinctrl_ops zynqmp_pctrl_ops = {
+	.get_groups_count = zynqmp_pctrl_get_groups_count,
+	.get_group_name = zynqmp_pctrl_get_group_name,
+	.get_group_pins = zynqmp_pctrl_get_group_pins,
+	.dt_node_to_map = pinconf_generic_dt_node_to_map_all,
+	.dt_free_map = pinctrl_utils_free_map,
+};
+
+/**
+ * zynqmp_pinmux_request_pin() - Request a pin for muxing
+ * @pctldev:	Pincontrol device pointer.
+ * @pin:	Pin number.
+ *
+ * Request a pin from firmware for muxing.
+ *
+ * Return: 0 on success else error code.
+ */
+static int zynqmp_pinmux_request_pin(struct pinctrl_dev *pctldev,
+				     unsigned int pin)
+{
+	int ret;
+
+	ret = zynqmp_pm_pinctrl_request(pin);
+	if (ret) {
+		dev_err(pctldev->dev, "request failed for pin %u\n", pin);
+		return -EIO;
+	}
+
+	return 0;
+}
+
+/**
+ * zynqmp_pmux_get_functions_count() - get number of functions
+ * @pctldev:	Pincontrol device pointer.
+ *
+ * Get total function count.
+ *
+ * Return: function count.
+ */
+static int zynqmp_pmux_get_functions_count(struct pinctrl_dev *pctldev)
+{
+	struct zynqmp_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
+
+	return pctrl->nfuncs;
+}
+
+/**
+ * zynqmp_pmux_get_function_name() - get function name
+ * @pctldev:	Pincontrol device pointer.
+ * @selector:	Function ID.
+ *
+ * Get function's name.
+ *
+ * Return: function name.
+ */
+static const char *zynqmp_pmux_get_function_name(struct pinctrl_dev *pctldev,
+						 unsigned int selector)
+{
+	struct zynqmp_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
+
+	return pctrl->funcs[selector].name;
+}
+
+/**
+ * zynqmp_pmux_get_function_groups() - Get groups for the function
+ * @pctldev:	Pincontrol device pointer.
+ * @selector:	Function ID
+ * @groups:	Group names.
+ * @num_groups:	Number of function groups.
+ *
+ * Get function's group count and group names.
+ *
+ * Return: Success.
+ */
+static int zynqmp_pmux_get_function_groups(struct pinctrl_dev *pctldev,
+					   unsigned int selector,
+					   const char * const **groups,
+					   unsigned * const num_groups)
+{
+	struct zynqmp_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
+
+	*groups = pctrl->funcs[selector].groups;
+	*num_groups = pctrl->funcs[selector].ngroups;
+
+	return 0;
+}
+
+/**
+ * zynqmp_pinmux_set_mux() - Set requested function for the group
+ * @pctldev:	Pincontrol device pointer.
+ * @function:	Function ID.
+ * @group:	Group ID.
+ *
+ * Loop though all pins of group and call firmware API
+ * to set requested function for all pins in group.
+ *
+ * Return: 0 on success else error code.
+ */
+static int zynqmp_pinmux_set_mux(struct pinctrl_dev *pctldev,
+				 unsigned int function,
+				 unsigned int group)
+{
+	struct zynqmp_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
+	const struct zynqmp_pctrl_group *pgrp = &pctrl->groups[group];
+	int ret, i;
+
+	for (i = 0; i < pgrp->npins; i++) {
+		unsigned int pin = pgrp->pins[i];
+
+		ret = zynqmp_pm_pinctrl_set_function(pin, function);
+		if (ret) {
+			dev_err(pctldev->dev, "set mux failed for pin %u\n",
+				pin);
+			return -EIO;
+		}
+	}
+
+	return 0;
+}
+
+/**
+ * zynqmp_pinmux_release_pin() - Release a pin
+ * @pctldev:	Pincontrol device pointer.
+ * @pin:	Pin number.
+ *
+ * Release a pin from firmware.
+ *
+ * Return: 0 on success else error code.
+ */
+static int zynqmp_pinmux_release_pin(struct pinctrl_dev *pctldev,
+				     unsigned int pin)
+{
+	int ret;
+
+	ret = zynqmp_pm_pinctrl_release(pin);
+	if (ret) {
+		dev_err(pctldev->dev, "free pin failed for pin %u\n",
+			pin);
+		return -EIO;
+	}
+
+	return 0;
+}
+
+static const struct pinmux_ops zynqmp_pinmux_ops = {
+	.request = zynqmp_pinmux_request_pin,
+	.get_functions_count = zynqmp_pmux_get_functions_count,
+	.get_function_name = zynqmp_pmux_get_function_name,
+	.get_function_groups = zynqmp_pmux_get_function_groups,
+	.set_mux = zynqmp_pinmux_set_mux,
+	.free = zynqmp_pinmux_release_pin,
+};
+
+/**
+ * zynqmp_pinconf_cfg_get() - get config value for the pin
+ * @pctldev:	Pin control device pointer.
+ * @pin:	Pin number.
+ * @config:	Value of config param.
+ *
+ * Get value of the requested configuration parameter for the
+ * given pin.
+ *
+ * Return: 0 on success else error code.
+ */
+static int zynqmp_pinconf_cfg_get(struct pinctrl_dev *pctldev,
+				  unsigned int pin,
+				  unsigned long *config)
+{
+	int ret;
+	unsigned int arg = 0, param = pinconf_to_config_param(*config);
+
+	if (pin >= zynqmp_desc.npins)
+		return -EOPNOTSUPP;
+
+	switch (param) {
+	case PIN_CONFIG_SLEW_RATE:
+		param = PM_PINCTRL_CONFIG_SLEW_RATE;
+		ret = zynqmp_pm_pinctrl_get_config(pin, param, &arg);
+		break;
+	case PIN_CONFIG_BIAS_PULL_UP:
+		param = PM_PINCTRL_CONFIG_PULL_CTRL;
+		ret = zynqmp_pm_pinctrl_get_config(pin, param, &arg);
+		if (arg != PM_PINCTRL_BIAS_PULL_UP)
+			return -EINVAL;
+
+		arg = 1;
+		break;
+	case PIN_CONFIG_BIAS_PULL_DOWN:
+		param = PM_PINCTRL_CONFIG_PULL_CTRL;
+		ret = zynqmp_pm_pinctrl_get_config(pin, param, &arg);
+		if (arg != PM_PINCTRL_BIAS_PULL_DOWN)
+			return -EINVAL;
+
+		arg = 1;
+		break;
+	case PIN_CONFIG_BIAS_DISABLE:
+		param = PM_PINCTRL_CONFIG_BIAS_STATUS;
+		ret = zynqmp_pm_pinctrl_get_config(pin, param, &arg);
+		if (arg != PM_PINCTRL_BIAS_DISABLE)
+			return -EINVAL;
+
+		arg = 1;
+		break;
+	case PIN_CONFIG_IOSTANDARD:
+		param = PM_PINCTRL_CONFIG_VOLTAGE_STATUS;
+		ret = zynqmp_pm_pinctrl_get_config(pin, param, &arg);
+		break;
+	case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
+		param = PM_PINCTRL_CONFIG_SCHMITT_CMOS;
+		ret = zynqmp_pm_pinctrl_get_config(pin, param, &arg);
+		break;
+	case PIN_CONFIG_DRIVE_STRENGTH:
+		param = PM_PINCTRL_CONFIG_DRIVE_STRENGTH;
+		ret = zynqmp_pm_pinctrl_get_config(pin, param, &arg);
+		switch (arg) {
+		case PM_PINCTRL_DRIVE_STRENGTH_2MA:
+			arg = DRIVE_STRENGTH_2MA;
+			break;
+		case PM_PINCTRL_DRIVE_STRENGTH_4MA:
+			arg = DRIVE_STRENGTH_4MA;
+			break;
+		case PM_PINCTRL_DRIVE_STRENGTH_8MA:
+			arg = DRIVE_STRENGTH_8MA;
+			break;
+		case PM_PINCTRL_DRIVE_STRENGTH_12MA:
+			arg = DRIVE_STRENGTH_12MA;
+			break;
+		default:
+			/* Invalid drive strength */
+			dev_warn(pctldev->dev,
+				 "Invalid drive strength for pin %d\n",
+				 pin);
+			return -EINVAL;
+		}
+		break;
+	default:
+		ret = -EOPNOTSUPP;
+		break;
+	}
+
+	param = pinconf_to_config_param(*config);
+	*config = pinconf_to_config_packed(param, arg);
+
+	return ret;
+}
+
+/**
+ * zynqmp_pinconf_cfg_set() - Set requested config for the pin
+ * @pctldev:		Pincontrol device pointer.
+ * @pin:		Pin number.
+ * @configs:		Configuration to set.
+ * @num_configs:	Number of configurations.
+ *
+ * Loop though all configurations and call firmware API
+ * to set requested configurations for the pin.
+ *
+ * Return: 0 on success else error code.
+ */
+static int zynqmp_pinconf_cfg_set(struct pinctrl_dev *pctldev,
+				  unsigned int pin, unsigned long *configs,
+				  unsigned int num_configs)
+{
+	int i, ret;
+
+	if (pin >= zynqmp_desc.npins)
+		return -EOPNOTSUPP;
+
+	for (i = 0; i < num_configs; i++) {
+		unsigned int param = pinconf_to_config_param(configs[i]);
+		unsigned int arg = pinconf_to_config_argument(configs[i]);
+		unsigned int value;
+
+		switch (param) {
+		case PIN_CONFIG_SLEW_RATE:
+			param = PM_PINCTRL_CONFIG_SLEW_RATE;
+			ret = zynqmp_pm_pinctrl_set_config(pin, param, arg);
+			break;
+		case PIN_CONFIG_BIAS_PULL_UP:
+			param = PM_PINCTRL_CONFIG_PULL_CTRL;
+			arg = PM_PINCTRL_BIAS_PULL_UP;
+			ret = zynqmp_pm_pinctrl_set_config(pin, param, arg);
+			break;
+		case PIN_CONFIG_BIAS_PULL_DOWN:
+			param = PM_PINCTRL_CONFIG_PULL_CTRL;
+			arg = PM_PINCTRL_BIAS_PULL_DOWN;
+			ret = zynqmp_pm_pinctrl_set_config(pin, param, arg);
+			break;
+		case PIN_CONFIG_BIAS_DISABLE:
+			param = PM_PINCTRL_CONFIG_BIAS_STATUS;
+			arg = PM_PINCTRL_BIAS_DISABLE;
+			ret = zynqmp_pm_pinctrl_set_config(pin, param, arg);
+			break;
+		case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
+			param = PM_PINCTRL_CONFIG_SCHMITT_CMOS;
+			ret = zynqmp_pm_pinctrl_set_config(pin, param, arg);
+			break;
+		case PIN_CONFIG_DRIVE_STRENGTH:
+			switch (arg) {
+			case DRIVE_STRENGTH_2MA:
+				value = PM_PINCTRL_DRIVE_STRENGTH_2MA;
+				break;
+			case DRIVE_STRENGTH_4MA:
+				value = PM_PINCTRL_DRIVE_STRENGTH_4MA;
+				break;
+			case DRIVE_STRENGTH_8MA:
+				value = PM_PINCTRL_DRIVE_STRENGTH_8MA;
+				break;
+			case DRIVE_STRENGTH_12MA:
+				value = PM_PINCTRL_DRIVE_STRENGTH_12MA;
+				break;
+			default:
+				/* Invalid drive strength */
+				dev_warn(pctldev->dev,
+					 "Invalid drive strength for pin %d\n",
+					 pin);
+				return -EINVAL;
+			}
+
+			param = PM_PINCTRL_CONFIG_DRIVE_STRENGTH;
+			ret = zynqmp_pm_pinctrl_set_config(pin, param, value);
+			break;
+		case PIN_CONFIG_IOSTANDARD:
+			param = PM_PINCTRL_CONFIG_VOLTAGE_STATUS;
+			ret = zynqmp_pm_pinctrl_get_config(pin, param, &value);
+
+			if (arg != value)
+				dev_warn(pctldev->dev,
+					 "Invalid IO Standard requested for pin %d\n",
+					 pin);
+
+			break;
+		case PIN_CONFIG_BIAS_HIGH_IMPEDANCE:
+		case PIN_CONFIG_LOW_POWER_MODE:
+			/*
+			 * These cases are mentioned in dts but configurable
+			 * registers are unknown. So falling through to ignore
+			 * boot time warnings as of now.
+			 */
+			ret = 0;
+			break;
+		default:
+			dev_warn(pctldev->dev,
+				 "unsupported configuration parameter '%u'\n",
+				 param);
+			ret = -EOPNOTSUPP;
+			break;
+		}
+
+		param = pinconf_to_config_param(configs[i]);
+		arg = pinconf_to_config_argument(configs[i]);
+		if (ret)
+			dev_warn(pctldev->dev,
+				 "%s failed: pin %u param %u value %u\n",
+				 __func__, pin, param, arg);
+	}
+
+	return 0;
+}
+
+/**
+ * zynqmp_pinconf_group_set() - Set requested config for the group
+ * @pctldev:		Pincontrol device pointer.
+ * @selector:		Group ID.
+ * @configs:		Configuration to set.
+ * @num_configs:	Number of configurations.
+ *
+ * Call function to set configs for each pin in group.
+ *
+ * Return: 0 on success else error code.
+ */
+static int zynqmp_pinconf_group_set(struct pinctrl_dev *pctldev,
+				    unsigned int selector,
+				    unsigned long *configs,
+				    unsigned int num_configs)
+{
+	int i, ret;
+	struct zynqmp_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
+	const struct zynqmp_pctrl_group *pgrp = &pctrl->groups[selector];
+
+	for (i = 0; i < pgrp->npins; i++) {
+		ret = zynqmp_pinconf_cfg_set(pctldev, pgrp->pins[i], configs,
+					     num_configs);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static const struct pinconf_ops zynqmp_pinconf_ops = {
+	.is_generic = true,
+	.pin_config_get = zynqmp_pinconf_cfg_get,
+	.pin_config_set = zynqmp_pinconf_cfg_set,
+	.pin_config_group_set = zynqmp_pinconf_group_set,
+};
+
+static struct pinctrl_desc zynqmp_desc = {
+	.name = "zynqmp_pinctrl",
+	.owner = THIS_MODULE,
+	.pctlops = &zynqmp_pctrl_ops,
+	.pmxops = &zynqmp_pinmux_ops,
+	.confops = &zynqmp_pinconf_ops,
+#ifdef CONFIG_DEBUG_FS
+	.custom_conf_items = zynqmp_conf_items,
+#endif
+};
+
+/**
+ * zynqmp_pinctrl_get_function_groups() - get groups for the function
+ * @fid:	Function ID.
+ * @index:	Group index.
+ * @groups:	Groups data.
+ *
+ * Call firmware API to get groups for the given function.
+ *
+ * Return: 0 on success else error code.
+ */
+static int zynqmp_pinctrl_get_function_groups(u32 fid, u32 index, u16 *groups)
+{
+	struct zynqmp_pm_query_data qdata = {0};
+	u32 ret_payload[PAYLOAD_ARG_CNT];
+	int ret;
+
+	qdata.qid = PM_QID_PINCTRL_GET_FUNCTION_GROUPS;
+	qdata.arg1 = fid;
+	qdata.arg2 = index;
+
+	ret = zynqmp_pm_query_data(qdata, ret_payload);
+	if (ret)
+		return ret;
+
+	memcpy(groups, &ret_payload[1], PINCTRL_GET_FUNC_GROUPS_RESP_LEN);
+
+	return ret;
+}
+
+/**
+ * zynqmp_pinctrl_get_func_num_groups() - get number of groups in function
+ * @fid:	Function ID.
+ * @ngroups:	Number of groups in function.
+ *
+ * Call firmware API to get number of group in function.
+ *
+ * Return: 0 on success else error code.
+ */
+static int zynqmp_pinctrl_get_func_num_groups(u32 fid, unsigned int *ngroups)
+{
+	struct zynqmp_pm_query_data qdata = {0};
+	u32 ret_payload[PAYLOAD_ARG_CNT];
+	int ret;
+
+	qdata.qid = PM_QID_PINCTRL_GET_NUM_FUNCTION_GROUPS;
+	qdata.arg1 = fid;
+
+	ret = zynqmp_pm_query_data(qdata, ret_payload);
+	if (ret)
+		return ret;
+
+	*ngroups = ret_payload[1];
+
+	return ret;
+}
+
+/**
+ * zynqmp_pinctrl_prepare_func_groups() - prepare function and groups data
+ * @dev:	Device pointer.
+ * @fid:	Function ID.
+ * @func:	Function data.
+ * @groups:	Groups data.
+ *
+ * Query firmware to get group IDs for each function. Firmware returns
+ * group IDs. Based on gorup index for the function, group names in
+ * function are stored. For example, first gorup in "eth0" function
+ * is named as "eth0_0", second as "eth0_1" and so on.
+ *
+ * Based on group ID received from firmware, function stores name of
+ * group for that group ID. For an example, if "eth0" first group ID
+ * is x, groups[x] name will be stored as "eth0_0".
+ *
+ * Once done for each function, each function would have its group names,
+ * and each groups would also have their names.
+ *
+ * Return: 0 on success else error code.
+ */
+static int zynqmp_pinctrl_prepare_func_groups(struct device *dev, u32 fid,
+					      struct zynqmp_pmux_function *func,
+					      struct zynqmp_pctrl_group *groups)
+{
+	u16 resp[NUM_GROUPS_PER_RESP] = {0};
+	const char **fgroups;
+	int ret = 0, index, i;
+
+	fgroups = devm_kzalloc(dev, sizeof(*fgroups) * func->ngroups,
+			       GFP_KERNEL);
+	if (!fgroups)
+		return -ENOMEM;
+
+	for (index = 0; index < func->ngroups; index += NUM_GROUPS_PER_RESP) {
+		ret = zynqmp_pinctrl_get_function_groups(fid, index, resp);
+		if (ret)
+			return ret;
+
+		for (i = 0; i < NUM_GROUPS_PER_RESP; i++) {
+			if (resp[i] == (u16)NA_GROUP)
+				goto done;
+
+			if (resp[i] == (u16)RESERVED_GROUP)
+				continue;
+
+			fgroups[index + i] = devm_kasprintf(dev, GFP_KERNEL,
+							    "%s_%d_grp",
+							    func->name,
+							    index + i);
+			groups[resp[i]].name = devm_kasprintf(dev, GFP_KERNEL,
+							      "%s_%d_grp",
+							      func->name,
+							      index + i);
+		}
+	}
+done:
+	func->groups = fgroups;
+
+	return ret;
+}
+
+/**
+ * zynqmp_pinctrl_get_function_name() - get function name
+ * @fid:	Function ID.
+ * @name:	Function name
+ *
+ * Call firmware API to get name of given function.
+ */
+static void zynqmp_pinctrl_get_function_name(u32 fid, char *name)
+{
+	struct zynqmp_pm_query_data qdata = {0};
+	u32 ret_payload[PAYLOAD_ARG_CNT];
+
+	qdata.qid = PM_QID_PINCTRL_GET_FUNCTION_NAME;
+	qdata.arg1 = fid;
+
+	/*
+	 * Name of the function is maximum 16 bytes and cannot
+	 * accommodate the return value in SMC buffers, hence ignoring
+	 * the return value for this specific qid.
+	 */
+	zynqmp_pm_query_data(qdata, ret_payload);
+	memcpy(name, ret_payload, PINCTRL_GET_FUNC_NAME_RESP_LEN);
+}
+
+/**
+ * zynqmp_pinctrl_get_num_functions() - get number of supported functions
+ * @nfuncs:	Number of functions.
+ *
+ * Call firmware API to get number of functions supported by system/board.
+ *
+ * Return: 0 on success else error code.
+ */
+static int zynqmp_pinctrl_get_num_functions(unsigned int *nfuncs)
+{
+	struct zynqmp_pm_query_data qdata = {0};
+	u32 ret_payload[PAYLOAD_ARG_CNT];
+	int ret;
+
+	qdata.qid = PM_QID_PINCTRL_GET_NUM_FUNCTIONS;
+
+	ret = zynqmp_pm_query_data(qdata, ret_payload);
+	if (ret)
+		return ret;
+
+	*nfuncs = ret_payload[1];
+
+	return ret;
+}
+
+/**
+ * zynqmp_pinctrl_get_pin_groups() - get groups for the pin
+ * @pin:	Pin number.
+ * @index:	Group index.
+ * @groups:	Groups data.
+ *
+ * Call firmware API to get groups for the given pin.
+ *
+ * Return: 0 on success else error code.
+ */
+static int zynqmp_pinctrl_get_pin_groups(u32 pin, u32 index, u16 *groups)
+{
+	struct zynqmp_pm_query_data qdata = {0};
+	u32 ret_payload[PAYLOAD_ARG_CNT];
+	int ret;
+
+	qdata.qid = PM_QID_PINCTRL_GET_PIN_GROUPS;
+	qdata.arg1 = pin;
+	qdata.arg2 = index;
+
+	ret = zynqmp_pm_query_data(qdata, ret_payload);
+	if (ret)
+		return ret;
+
+	memcpy(groups, &ret_payload[1], PINCTRL_GET_PIN_GROUPS_RESP_LEN);
+
+	return ret;
+}
+
+/**
+ * zynqmp_pinctrl_group_add_pin() - add pin to given group
+ * @group:	Group data.
+ * @pin:	Pin number.
+ *
+ * Add pin number to respective group's pin array at end and
+ * increment pin count for the group.
+ */
+static void zynqmp_pinctrl_group_add_pin(struct zynqmp_pctrl_group *group,
+					 unsigned int pin)
+{
+	group->pins[group->npins++] = pin;
+}
+
+/**
+ * zynqmp_pinctrl_create_pin_groups() - assign pins to respective groups
+ * @dev:	Device pointer.
+ * @groups:	Groups data.
+ * @pin:	Pin number.
+ *
+ * Query firmware to get groups available for the given pin.
+ * Based on firmware response(group IDs for the pin), add
+ * pin number to respective group's pin array.
+ *
+ * Once all pins are queries, each groups would have its number
+ * of pins and pin numbers data.
+ *
+ * Return: 0 on success else error code.
+ */
+static int zynqmp_pinctrl_create_pin_groups(struct device *dev,
+					    struct zynqmp_pctrl_group *groups,
+					    unsigned int pin)
+{
+	int ret, i, index = 0;
+	u16 resp[NUM_GROUPS_PER_RESP] = {0};
+
+	do {
+		ret = zynqmp_pinctrl_get_pin_groups(pin, index, resp);
+		if (ret)
+			return ret;
+
+		for (i = 0; i < NUM_GROUPS_PER_RESP; i++) {
+			if (resp[i] == (u16)NA_GROUP)
+				return ret;
+
+			if (resp[i] == (u16)RESERVED_GROUP)
+				continue;
+
+			zynqmp_pinctrl_group_add_pin(&groups[resp[i]], pin);
+		}
+		index += NUM_GROUPS_PER_RESP;
+	} while (1);
+
+	return ret;
+}
+
+/**
+ * zynqmp_pinctrl_prepare_group_pins() - prepare each group's pin data
+ * @dev:	Device pointer.
+ * @groups:	Groups data.
+ * @ngroups:	Number of groups.
+ *
+ * Prepare pin number and number of pins data for each pins.
+ *
+ * Return: 0 on success else error code.
+ */
+static int zynqmp_pinctrl_prepare_group_pins(struct device *dev,
+					     struct zynqmp_pctrl_group *groups,
+					     unsigned int ngroups)
+{
+	unsigned int pin;
+	int ret = 0;
+
+	for (pin = 0; pin < zynqmp_desc.npins; pin++) {
+		ret = zynqmp_pinctrl_create_pin_groups(dev, groups, pin);
+		if (ret)
+			return ret;
+	}
+
+	return ret;
+}
+
+/**
+ * zynqmp_pinctrl_prepare_function_info() - prepare function info
+ * @dev:	Device pointer.
+ * @pctrl:	Pin control driver data.
+ *
+ * Query firmware for functions, groups and pin information and
+ * prepare pin control driver data.
+ *
+ * Query number of functions and number of function groups (number
+ * of groups in given function) to allocate required memory buffers
+ * for functions and groups. Once buffers are allocated to store
+ * functions and groups data, query and store required information
+ * (numbe of groups and group names for each function, number of
+ * pins and pin numbers for each group).
+ *
+ * Return: 0 on success else error code.
+ */
+static int zynqmp_pinctrl_prepare_function_info(struct device *dev,
+						struct zynqmp_pinctrl *pctrl)
+{
+	struct zynqmp_pmux_function *funcs;
+	struct zynqmp_pctrl_group *groups;
+	int ret, i;
+
+	ret = zynqmp_pinctrl_get_num_functions(&pctrl->nfuncs);
+	if (ret)
+		return ret;
+
+	funcs = devm_kzalloc(dev, sizeof(*funcs) * pctrl->nfuncs, GFP_KERNEL);
+	if (!funcs)
+		return -ENOMEM;
+
+	for (i = 0; i < pctrl->nfuncs; i++) {
+		zynqmp_pinctrl_get_function_name(i, funcs[i].name);
+
+		ret = zynqmp_pinctrl_get_func_num_groups(i, &funcs[i].ngroups);
+		if (ret)
+			return ret;
+
+		pctrl->ngroups += funcs[i].ngroups;
+	}
+
+	groups = devm_kzalloc(dev, sizeof(*groups) * pctrl->ngroups,
+			      GFP_KERNEL);
+	if (!groups)
+		return -ENOMEM;
+
+	for (i = 0; i < pctrl->nfuncs; i++) {
+		ret = zynqmp_pinctrl_prepare_func_groups(dev, i, &funcs[i],
+							 groups);
+		if (ret)
+			return ret;
+	}
+
+	ret = zynqmp_pinctrl_prepare_group_pins(dev, groups, pctrl->ngroups);
+	if (ret)
+		return ret;
+
+	pctrl->funcs = funcs;
+	pctrl->groups = groups;
+
+	return ret;
+}
+
+/**
+ * zynqmp_pinctrl_get_num_pins() - get number of pins in system
+ * @npins:	Number of pins in system/board.
+ *
+ * Call firmware API to get number of pins.
+ *
+ * Return: 0 on success else error code.
+ */
+static int zynqmp_pinctrl_get_num_pins(unsigned int *npins)
+{
+	struct zynqmp_pm_query_data qdata = {0};
+	u32 ret_payload[PAYLOAD_ARG_CNT];
+	int ret;
+
+	qdata.qid = PM_QID_PINCTRL_GET_NUM_PINS;
+
+	ret = zynqmp_pm_query_data(qdata, ret_payload);
+	if (ret)
+		return ret;
+
+	*npins = ret_payload[1];
+
+	return ret;
+}
+
+/**
+ * zynqmp_pinctrl_prepare_pin_desc() - prepare pin description info
+ * @dev:		Device pointer.
+ * @zynqmp_pins:	Pin information.
+ * @npins:		Number of pins.
+ *
+ * Query number of pins information from firmware and prepare pin
+ * description containing pin number and pin name.
+ *
+ * Return: 0 on success else error code.
+ */
+static int zynqmp_pinctrl_prepare_pin_desc(struct device *dev,
+					   const struct pinctrl_pin_desc
+					   **zynqmp_pins,
+					   unsigned int *npins)
+{
+	struct pinctrl_pin_desc *pins, *pin;
+	int ret;
+	int i;
+
+	ret = zynqmp_pinctrl_get_num_pins(npins);
+	if (ret)
+		return ret;
+
+	pins = devm_kzalloc(dev, sizeof(*pins) * *npins, GFP_KERNEL);
+	if (!pins)
+		return -ENOMEM;
+
+	for (i = 0; i < *npins; i++) {
+		pin = &pins[i];
+		pin->number = i;
+		pin->name = devm_kasprintf(dev, GFP_KERNEL, "%s%d",
+					   ZYNQMP_PIN_PREFIX, i);
+	}
+
+	*zynqmp_pins = pins;
+
+	return 0;
+}
+
+static int zynqmp_pinctrl_probe(struct platform_device *pdev)
+{
+	struct zynqmp_pinctrl *pctrl;
+	int ret;
+
+	pctrl = devm_kzalloc(&pdev->dev, sizeof(*pctrl), GFP_KERNEL);
+	if (!pctrl)
+		return -ENOMEM;
+
+	ret = zynqmp_pinctrl_prepare_pin_desc(&pdev->dev,
+					      &zynqmp_desc.pins,
+					      &zynqmp_desc.npins);
+	if (ret) {
+		dev_err(&pdev->dev, "%s() pin desc prepare fail with %d\n",
+			__func__, ret);
+		return ret;
+	}
+
+	ret = zynqmp_pinctrl_prepare_function_info(&pdev->dev, pctrl);
+	if (ret) {
+		dev_err(&pdev->dev, "%s() function info prepare fail with %d\n",
+			__func__, ret);
+		return ret;
+	}
+
+	pctrl->pctrl = pinctrl_register(&zynqmp_desc, &pdev->dev, pctrl);
+	if (IS_ERR(pctrl->pctrl)) {
+		ret = PTR_ERR(pctrl->pctrl);
+		return ret;
+	}
+
+	platform_set_drvdata(pdev, pctrl);
+
+	dev_info(&pdev->dev, "zynqmp pinctrl initialized\n");
+
+	return ret;
+}
+
+static const struct of_device_id zynqmp_pinctrl_of_match[] = {
+	{ .compatible = "xlnx,zynqmp-pinctrl" },
+	{ }
+};
+
+static struct platform_driver zynqmp_pinctrl_driver = {
+	.driver = {
+		.name = "zynqmp-pinctrl",
+		.of_match_table = zynqmp_pinctrl_of_match,
+	},
+	.probe = zynqmp_pinctrl_probe,
+};
+builtin_platform_driver(zynqmp_pinctrl_driver);
-- 
2.17.1

