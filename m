Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F9883AE7D3
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jun 2021 13:01:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229747AbhFULDT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Jun 2021 07:03:19 -0400
Received: from mail-bn8nam11on2041.outbound.protection.outlook.com ([40.107.236.41]:61760
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229651AbhFULDS (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 21 Jun 2021 07:03:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DQgZayEyPTA5vuoZ1cJNRhfbgzR+k5iOZAjXcgDlNOLaDn2mF/XtLn9DwfWQVXhrjePPpVRMDmW/OiZqB5BsSQtJ1Q0Ps7HvX4Y4FS8RiZAoWN6OiSRc/P6sq4/veYs0JOBiLWk0LkLqutWJfhKESWMBjxDmldLG0pHj9S3BazqzqDHh1p2ICEuOwvpSrXGbGP5dGprIFLGZmw3QlImpO7HIvhIdSXbzpuUCOjw6D1NnTXl24NGaTKtCA4GjAxas31yPij2yeVD7pKiQpO4G0LS5hWmywY06/m6/OQGqUnavU3uLWQOQVcKVd5Jf9XxuzqjbFyOxbzTKgSBO6XEJSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/EwTGqy+/gfkJQK/ASb00yYR/DSQzN7U5bTMTw0alsk=;
 b=N/Xrr9NNapgyFZV1jq6IuzWTwucpM/3Q9J4mSLyEnvq6nGYJafV1XFhrCqTw8UPYWOVgdpGbOmKrr55H2c141GMjo1GJD30hfLy6cf/1jilHckabxoOpXhXCtxfC8nsp4piFjQeyOm7Bf6DwQEpgBj3CeXhdSuEd/93USRmydg2VG0kRYC1WD2QhETdEr4ZispTdZmHxSahuD90WW0Ygq6CVVx0ErVNmagW5J4pnTLU5Xk5oGhQXcO9DupkaV2/63ClWK0errpfi5FrKGzcEbQCLZkuWagTdI/Fc+O4w434jvwD5NvU+z48Wai0iyWIuQQoW39UMdv/kT97PMRGGYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=gmail.com smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/EwTGqy+/gfkJQK/ASb00yYR/DSQzN7U5bTMTw0alsk=;
 b=i5Ynx8bve/W3O13RT8zvIAuI1U6/nB4wI6ePtEr3inNvrxc5ofKFQJcE+yKixnhKdUIuy2khOPwKBN7F5rOazTETJVoZcSSzheFcpMSaplYXhC1wMHMO40LHFNkREYIeB8J6gR4zZ0IXDybLpnKhrJBcEdb4bWCFQ7DosHLf6xQ=
Received: from SN7PR04CA0176.namprd04.prod.outlook.com (2603:10b6:806:125::31)
 by CH0PR02MB8257.namprd02.prod.outlook.com (2603:10b6:610:fe::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21; Mon, 21 Jun
 2021 11:01:01 +0000
Received: from SN1NAM02FT0007.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:125:cafe::17) by SN7PR04CA0176.outlook.office365.com
 (2603:10b6:806:125::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21 via Frontend
 Transport; Mon, 21 Jun 2021 11:01:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0007.mail.protection.outlook.com (10.97.5.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4242.16 via Frontend Transport; Mon, 21 Jun 2021 11:01:01 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 21 Jun 2021 04:01:00 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Mon, 21 Jun 2021 04:01:00 -0700
Envelope-to: git@xilinx.com,
 saikrishna12468@gmail.com,
 linus.walleij@linaro.org,
 linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
Received: from [172.23.64.106] (port=43925 helo=xhdvnc125.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <lakshmi.sai.krishna.potthuri@xilinx.com>)
        id 1lvHfn-0006WE-9q; Mon, 21 Jun 2021 04:00:59 -0700
Received: by xhdvnc125.xilinx.com (Postfix, from userid 14964)
        id 7DCA31211AF; Mon, 21 Jun 2021 16:30:58 +0530 (IST)
From:   Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Michal Simek <michal.simek@xilinx.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <git@xilinx.com>, <saikrishna12468@gmail.com>,
        Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>
Subject: [PATCH] pinctrl: zynqmp: some code cleanups
Date:   Mon, 21 Jun 2021 16:30:14 +0530
Message-ID: <1624273214-66849-1-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
X-Mailer: git-send-email 2.1.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1977939d-d456-4a04-42cf-08d934a3db6b
X-MS-TrafficTypeDiagnostic: CH0PR02MB8257:
X-Microsoft-Antispam-PRVS: <CH0PR02MB8257135D052A46899D3CC3B4BD0A9@CH0PR02MB8257.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:357;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v3vOhN/4Bns7L06fBqQPA4QsiYYMzhupMpJVyLsB7/PUPk4UJsjps+/cvw88Bs2zKdMCGhHhvPrOoszd1U3T8JshHK4okf/bCch8dbkcZgr7dmxYpvURRkGIUELpFisbpeppnkn7Ufho6PRSJj1CqoWs5ZGyF+Y+eUKCitDSXiUQWHO1deWGyRGSVYPO8JnVBcpoEu7FX+iBsNAgLe6k7eG4hx/jTlMPofIm7jwYLJ/AW3iEsjrD9JuOjszoJoPkHgwIIFnnQJ/6RjugbRzWyuEwrbJYMJ5VNygc1gWQOJ4By/FVuGH6AE0PLkvTIIZTReBbROc4ipu9NuyRH6fpxDLbwhj+aWqN4/yCEOw/mDjo63FDTiOgbiaavVbohrL0PW0pm5Tw2wAqI6k3V4RFxvPXjdtAa74LhsCfuubszm6dzPdC2ZcVyq9C0mHwcaoFDYZFlIfYQ8pXHU+6pVLbMdH7qnyZlSnKZ3l/w42t/a/++BRTN8Mh6jmIqo9eXBjrp+qRCKrzO/vwO0TxMYZoTfj+GcbVaOSZyAm7gl1OdUJgjxtW8sLA+h84g3H9auunxAY0T6FeFzWTY3s8RV7ffqF5UPxqEvozF1HHTBtH6H3AicK7jfyPNQtEywMq45HdRAhtbjMrSEp1C7RQD22vuo6KuieyPUMxZPleEyfcL4zJCk8YYW2az+NcWVyk2ewN
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(376002)(396003)(346002)(39860400002)(136003)(46966006)(36840700001)(82740400003)(426003)(26005)(82310400003)(47076005)(7636003)(8936002)(83380400001)(186003)(6666004)(36860700001)(4326008)(6266002)(36756003)(107886003)(356005)(336012)(2616005)(54906003)(110136005)(2906002)(478600001)(6636002)(36906005)(70206006)(70586007)(316002)(5660300002)(8676002)(42186006)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2021 11:01:01.4379
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1977939d-d456-4a04-42cf-08d934a3db6b
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0007.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR02MB8257
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Some minor code cleanups and updates which includes
- Mention module name under help in Kconfig.
- Remove extra lines and duplicate Pin range checks.
- Replace 'return ret' with 'return 0' in success path.
- Copyright year update.
- use devm_pinctrl_register() instead pinctrl_register() in probe.

Signed-off-by: Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>
---
 drivers/pinctrl/Kconfig          |  2 ++
 drivers/pinctrl/pinctrl-zynqmp.c | 50 +++++++++++++-------------------
 2 files changed, 22 insertions(+), 30 deletions(-)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index c2c7e7963ed0..f38f12801f18 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -336,6 +336,8 @@ config PINCTRL_ZYNQMP
 	  Configuration can include the mux function to select on those
 	  pin(s)/group(s), and various pin configuration parameters
 	  such as pull-up, slew rate, etc.
+	  This driver can also be built as a module. If so, the module
+	  will be called pinctrl-zynqmp.
 
 config PINCTRL_INGENIC
 	bool "Pinctrl driver for the Ingenic JZ47xx SoCs"
diff --git a/drivers/pinctrl/pinctrl-zynqmp.c b/drivers/pinctrl/pinctrl-zynqmp.c
index d5497003ce71..bbde676b7313 100644
--- a/drivers/pinctrl/pinctrl-zynqmp.c
+++ b/drivers/pinctrl/pinctrl-zynqmp.c
@@ -2,7 +2,7 @@
 /*
  * ZynqMP pin controller
  *
- * Copyright (C) 2020 Xilinx, Inc.
+ * Copyright (C) 2020, 2021 Xilinx, Inc.
  *
  * Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>
  * Rajan Vaja <rajan.vaja@xilinx.com>
@@ -252,9 +252,6 @@ static int zynqmp_pinconf_cfg_get(struct pinctrl_dev *pctldev,
 	unsigned int arg, param = pinconf_to_config_param(*config);
 	int ret;
 
-	if (pin >= zynqmp_desc.npins)
-		return -EOPNOTSUPP;
-
 	switch (param) {
 	case PIN_CONFIG_SLEW_RATE:
 		param = PM_PINCTRL_CONFIG_SLEW_RATE;
@@ -317,7 +314,7 @@ static int zynqmp_pinconf_cfg_get(struct pinctrl_dev *pctldev,
 		}
 		break;
 	default:
-		ret = -EOPNOTSUPP;
+		ret = -ENOTSUPP;
 		break;
 	}
 
@@ -348,9 +345,6 @@ static int zynqmp_pinconf_cfg_set(struct pinctrl_dev *pctldev,
 {
 	int i, ret;
 
-	if (pin >= zynqmp_desc.npins)
-		return -EOPNOTSUPP;
-
 	for (i = 0; i < num_configs; i++) {
 		unsigned int param = pinconf_to_config_param(configs[i]);
 		unsigned int arg = pinconf_to_config_argument(configs[i]);
@@ -428,7 +422,7 @@ static int zynqmp_pinconf_cfg_set(struct pinctrl_dev *pctldev,
 			dev_warn(pctldev->dev,
 				 "unsupported configuration parameter '%u'\n",
 				 param);
-			ret = -EOPNOTSUPP;
+			ret = -ENOTSUPP;
 			break;
 		}
 
@@ -504,7 +498,7 @@ static int zynqmp_pinctrl_get_function_groups(u32 fid, u32 index, u16 *groups)
 
 	memcpy(groups, &payload[1], PINCTRL_GET_FUNC_GROUPS_RESP_LEN);
 
-	return ret;
+	return 0;
 }
 
 static int zynqmp_pinctrl_get_func_num_groups(u32 fid, unsigned int *ngroups)
@@ -522,7 +516,7 @@ static int zynqmp_pinctrl_get_func_num_groups(u32 fid, unsigned int *ngroups)
 
 	*ngroups = payload[1];
 
-	return ret;
+	return 0;
 }
 
 /**
@@ -533,16 +527,16 @@ static int zynqmp_pinctrl_get_func_num_groups(u32 fid, unsigned int *ngroups)
  * @groups:	Groups data.
  *
  * Query firmware to get group IDs for each function. Firmware returns
- * group IDs. Based on group index for the function, group names in
+ * group IDs. Based on the group index for the function, group names in
  * the function are stored. For example, the first group in "eth0" function
- * is named as "eth0_0" and second group as "eth0_1" and so on.
+ * is named as "eth0_0" and the second group as "eth0_1" and so on.
  *
  * Based on the group ID received from the firmware, function stores name of
  * the group for that group ID. For example, if "eth0" first group ID
  * is x, groups[x] name will be stored as "eth0_0".
  *
  * Once done for each function, each function would have its group names
- * and each groups would also have their names.
+ * and each group would also have their names.
  *
  * Return: 0 on success else error code.
  */
@@ -552,7 +546,7 @@ static int zynqmp_pinctrl_prepare_func_groups(struct device *dev, u32 fid,
 {
 	u16 resp[NUM_GROUPS_PER_RESP] = {0};
 	const char **fgroups;
-	int ret = 0, index, i;
+	int ret, index, i;
 
 	fgroups = devm_kzalloc(dev, sizeof(*fgroups) * func->ngroups, GFP_KERNEL);
 	if (!fgroups)
@@ -588,7 +582,7 @@ static int zynqmp_pinctrl_prepare_func_groups(struct device *dev, u32 fid,
 done:
 	func->groups = fgroups;
 
-	return ret;
+	return 0;
 }
 
 static void zynqmp_pinctrl_get_function_name(u32 fid, char *name)
@@ -622,7 +616,7 @@ static int zynqmp_pinctrl_get_num_functions(unsigned int *nfuncs)
 
 	*nfuncs = payload[1];
 
-	return ret;
+	return 0;
 }
 
 static int zynqmp_pinctrl_get_pin_groups(u32 pin, u32 index, u16 *groups)
@@ -641,7 +635,7 @@ static int zynqmp_pinctrl_get_pin_groups(u32 pin, u32 index, u16 *groups)
 
 	memcpy(groups, &payload[1], PINCTRL_GET_PIN_GROUPS_RESP_LEN);
 
-	return ret;
+	return 0;
 }
 
 static void zynqmp_pinctrl_group_add_pin(struct zynqmp_pctrl_group *group,
@@ -660,7 +654,7 @@ static void zynqmp_pinctrl_group_add_pin(struct zynqmp_pctrl_group *group,
  * Based on the firmware response(group IDs for the pin), add
  * pin number to the respective group's pin array.
  *
- * Once all pins are queries, each groups would have its number
+ * Once all pins are queries, each group would have its number
  * of pins and pin numbers data.
  *
  * Return: 0 on success else error code.
@@ -689,7 +683,7 @@ static int zynqmp_pinctrl_create_pin_groups(struct device *dev,
 		index += NUM_GROUPS_PER_RESP;
 	} while (index <= MAX_PIN_GROUPS);
 
-	return ret;
+	return 0;
 }
 
 /**
@@ -727,7 +721,7 @@ static int zynqmp_pinctrl_prepare_group_pins(struct device *dev,
  * prepare pin control driver data.
  *
  * Query number of functions and number of function groups (number
- * of groups in given function) to allocate required memory buffers
+ * of groups in the given function) to allocate required memory buffers
  * for functions and groups. Once buffers are allocated to store
  * functions and groups data, query and store required information
  * (number of groups and group names for each function, number of
@@ -778,7 +772,7 @@ static int zynqmp_pinctrl_prepare_function_info(struct device *dev,
 	pctrl->funcs = funcs;
 	pctrl->groups = groups;
 
-	return ret;
+	return 0;
 }
 
 static int zynqmp_pinctrl_get_num_pins(unsigned int *npins)
@@ -795,7 +789,7 @@ static int zynqmp_pinctrl_get_num_pins(unsigned int *npins)
 
 	*npins = payload[1];
 
-	return ret;
+	return 0;
 }
 
 /**
@@ -853,19 +847,17 @@ static int zynqmp_pinctrl_probe(struct platform_device *pdev)
 					      &zynqmp_desc.pins,
 					      &zynqmp_desc.npins);
 	if (ret) {
-		dev_err(&pdev->dev, "pin desc prepare fail with %d\n",
-			ret);
+		dev_err(&pdev->dev, "pin desc prepare fail with %d\n", ret);
 		return ret;
 	}
 
 	ret = zynqmp_pinctrl_prepare_function_info(&pdev->dev, pctrl);
 	if (ret) {
-		dev_err(&pdev->dev, "function info prepare fail with %d\n",
-			ret);
+		dev_err(&pdev->dev, "function info prepare fail with %d\n", ret);
 		return ret;
 	}
 
-	pctrl->pctrl = pinctrl_register(&zynqmp_desc, &pdev->dev, pctrl);
+	pctrl->pctrl = devm_pinctrl_register(&pdev->dev, &zynqmp_desc, pctrl);
 	if (IS_ERR(pctrl->pctrl))
 		return PTR_ERR(pctrl->pctrl);
 
@@ -887,7 +879,6 @@ static const struct of_device_id zynqmp_pinctrl_of_match[] = {
 	{ .compatible = "xlnx,zynqmp-pinctrl" },
 	{ }
 };
-
 MODULE_DEVICE_TABLE(of, zynqmp_pinctrl_of_match);
 
 static struct platform_driver zynqmp_pinctrl_driver = {
@@ -898,7 +889,6 @@ static struct platform_driver zynqmp_pinctrl_driver = {
 	.probe = zynqmp_pinctrl_probe,
 	.remove = zynqmp_pinctrl_remove,
 };
-
 module_platform_driver(zynqmp_pinctrl_driver);
 
 MODULE_AUTHOR("Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>");
-- 
2.17.1

