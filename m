Return-Path: <linux-gpio+bounces-8519-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 70953944ABF
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Aug 2024 14:01:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D094F286763
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Aug 2024 12:01:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E6371A01DD;
	Thu,  1 Aug 2024 12:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="mvRorhY5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2044.outbound.protection.outlook.com [40.107.243.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D18A19E81F;
	Thu,  1 Aug 2024 12:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722513654; cv=fail; b=l7MApF5akf8mn5Ge7YuqwoJnGAsRYHxjNHcx8CDv/xLoiGROExlC25ILbcGtkX27VolXvRn8aDyxABrzQXnMUXaWHA4JRHHVzyIxbBk5zov1hezNu7rljxqFHIOFNgdZ3ZvYKGS62nfZRxO57G3NTSjseZQmWNcAI524+jxsDKI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722513654; c=relaxed/simple;
	bh=0EBtVRHt4serazTpODaBBzbM1CQWFB581YXNockqjIo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=izplJABrc1BNcSAaHRiqsYMeAcXHldtBqdvBmPDdFjKExmbwt0hLtJa4gTGn8XuQtk4xDPDj2yObq6LTiChJoLCQoUavRMfziQfOAtrK445fGiviSEs6kSdczjY9xodAGSyJ5W1JYjfvkys/86KH58fCepv/K3FkITXuaD/sjwA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=mvRorhY5; arc=fail smtp.client-ip=40.107.243.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rWhp5MKLty5tdG0I4TUEzio5OOeyUozBVRnfFD5ag4pfkFm2Rs+bLsYSRXIduHhywHYEVm8wtumbKBtdjC5MJx8CraEeuM439Qa1qbWT34MLrFRzJt7SF4zhIg4XHzijjIyJdA5TOnC5ykqszrtLUQ+nbtxallqXlh804M5r3bJ4MowD/sZ9c2OsbgLg80nTRWbQNIMiCxLzESwUdKwZcVrQfv5s55iXTivTFG8huI/TWlA7Kk9UGQQ+2lxI4sBzOJhQ925p68G2yuRJ3w5v5vCiwyzyQW6ggMgRYviLjso0IqLQKAjNgCKbGGEsO8pa/LwG90UWJBrVbneRAZjN9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/mgQnQujlDRhyvJfjgDxSZYbzQSOlQeubMM4Tmo472w=;
 b=QDcepiJkYSHvopIpiuoYNHcT7aAgqlie2tlV1PyA8BeGdqoiKHHRP/rJibAvQs1+YqrCVvGWaLpcmmbaty619IORMoIWEbWYWf5gmjCz/+qbBQMwZviw7dJo311GpOBpfJP4KSRUvvypSCNX9O2wK59okqoZwBekJGT0IK9aW7y6pMrpwwIf6kVGLeS0i0bOWzl/42ry9Bx4/U+1q4iOmS6NiReEr+GGf727LT2++cbCYxZ+qwWFgnhqrxYIYUQ084tk9MVone8+DjiUQSX/RhOpzeCReq9kagSzfYgPADVL5ieJNnjFTw4XzC1pfKnRjIF4gV/ifWqm3YlLnxNCtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/mgQnQujlDRhyvJfjgDxSZYbzQSOlQeubMM4Tmo472w=;
 b=mvRorhY5AuuzyLVT0iUkZbuEnUUitoRj2jHUfYt6tn15i8pf47v8M24SIyHpSsZ5xm95BmGdrrx41nSIG3UDwoqEJ3gVmciHK1stoJd0VXnvZvHV+8BykqeE3X/1IhIS6ldvfcMVlIMtjGr5mHFFAb2A+jTVseViOOkkpvyglQI=
Received: from DM5PR08CA0054.namprd08.prod.outlook.com (2603:10b6:4:60::43) by
 BL1PR12MB5827.namprd12.prod.outlook.com (2603:10b6:208:396::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.23; Thu, 1 Aug
 2024 12:00:48 +0000
Received: from DS2PEPF00003440.namprd02.prod.outlook.com
 (2603:10b6:4:60:cafe::be) by DM5PR08CA0054.outlook.office365.com
 (2603:10b6:4:60::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.23 via Frontend
 Transport; Thu, 1 Aug 2024 12:00:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF00003440.mail.protection.outlook.com (10.167.18.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Thu, 1 Aug 2024 12:00:47 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 1 Aug
 2024 07:00:46 -0500
Received: from xhdlakshmis40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 1 Aug 2024 07:00:43 -0500
From: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
To: Linus Walleij <linus.walleij@linaro.org>, Michal Simek
	<michal.simek@amd.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, "Jay
 Buddhabhatti" <jay.buddhabhatti@amd.com>, Praveen Teja Kundanala
	<praveen.teja.kundanala@amd.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<saikrishna12468@gmail.com>, <git@amd.com>, Sai Krishna Potthuri
	<sai.krishna.potthuri@amd.com>
Subject: [PATCH v3 3/3] pinctrl: pinctrl-zynqmp: Add support for Versal platform
Date: Thu, 1 Aug 2024 17:30:29 +0530
Message-ID: <20240801120029.1807180-4-sai.krishna.potthuri@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240801120029.1807180-1-sai.krishna.potthuri@amd.com>
References: <20240801120029.1807180-1-sai.krishna.potthuri@amd.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: sai.krishna.potthuri@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003440:EE_|BL1PR12MB5827:EE_
X-MS-Office365-Filtering-Correlation-Id: f83ba7c8-3c2c-4c67-9be3-08dcb22194db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5wQ4OLRrbiVV+Gn/ew3oYWQRzid7DO35l2dKYISsL5HkbpWodrgE8MtTY73X?=
 =?us-ascii?Q?lKi9xLHenEO/FePp/d7IBIe5scJ+//nl569qi+0j/5huw/wjXJ5OYEiCc4J8?=
 =?us-ascii?Q?ekBLgxDWk2k4GMgyyRHVWcH+tHU1ZkIB7438OOY0LLA+DLdKhje7SQsAdGvo?=
 =?us-ascii?Q?JDvU8fbVKZF+us9g5g+w4gQe5nUsxtSA6taC2MNgiK16f1oUkdUBZajcUE3U?=
 =?us-ascii?Q?pSVHTDwcZo05oX66IrobEA3LTUMe31F15l6g09Kse/2tnDORAB8ZRCLlkKts?=
 =?us-ascii?Q?+QoBtouYPXoHbd+/FiCQUol2Li1PU3CUImXmnq77I/WMlaq894am2Hemb9rD?=
 =?us-ascii?Q?CVqsjTtGcr7OiIYSxECkxv0nFFn6HYhZMOy2mUnyAey/aUBcVwTr0xiFs8ez?=
 =?us-ascii?Q?bw9sN7eB0QkeBheb3Ml7FCs5zgTJ66zAkTV3iutmx9uc1Qo/5xkTlUyv4lNk?=
 =?us-ascii?Q?KM1f4DwneQ5CPxNWsaZOUscMmggazf26iJBRZhCS+ub/Yh5kXpousXMS0Y6q?=
 =?us-ascii?Q?7HUNin3rQEaKQ0Qh/A+02MiSgyDZP+BWp+MEVCUvRBQVWlaLz44PbaBAlbmM?=
 =?us-ascii?Q?ztbGJHh68PJGdmLW9MulbvuLo2b6rbHaNk/yndA4k3UK9Qtn1TJ7gjwarh0k?=
 =?us-ascii?Q?ES+UxGwKQmdGcmHAB1FIDBArebUtx42L9QNKG+LEvBsV6sY8CA/yOSDMlXxE?=
 =?us-ascii?Q?gnj+IFPL86WZ4PO4HE29vztFlja8TaqNTYpQ6n6rEnnuKEB4widhO/6Em1Pd?=
 =?us-ascii?Q?LSDSEU/W1lSfniVupDGgn2F6yCZb1+ySpFPEPgqlY+YWor3LGPzzTxYZQ4yd?=
 =?us-ascii?Q?D9O6r7x8xedrwQEBd+7sfYvap9+xoJDzimhMFJPGOTbE5tT8AV2rPpx04ltx?=
 =?us-ascii?Q?R5/BD4F4tj0e1vP6Uli/mYgwZWSYgOR7qd0njyNg2zF1ikm0ITLu8epT+gMX?=
 =?us-ascii?Q?kah79zlgjtGa3iB3Fg2APuZdp3pFkBPXPFICVy/0KrdXXpfhzqXkcRyxWjo5?=
 =?us-ascii?Q?nHwstHS3OfH5oImxSZVdwp/FIX+2gG73ZhrLi0onD2piV7U41KhnStMlZkzK?=
 =?us-ascii?Q?LofXQGwX4z++iVjW6bZ6qQlF1x8kA7TlyGPIzHR9YBhWSyC/8w6LbM8Icz70?=
 =?us-ascii?Q?4UsJM/mOrzugGgRLGqgaKq5fJ44nKME0l1EaLsIfwwgiYbh82tMDqVmydZjC?=
 =?us-ascii?Q?f6eHiIElEnMUecW7i9hiVe1EMHf7bTRqbJiE02caz47w3TAI63mH+uORHAdF?=
 =?us-ascii?Q?84/xknmXw+0pqo03otTlJprF2ktNgA6F/MSaxiYYYVe82rVcyIeEwditxY28?=
 =?us-ascii?Q?TUCEopZOVJV5OXiZxA2K/A9rQOje/T3frBgAvvKV21ZYKl5mdNZQmVxnBihk?=
 =?us-ascii?Q?RFYVIfZLG29gkzNcgYsmtxXce1QlsOZGaFHqlbalaFUSGYXvCQZXeRjXaJZe?=
 =?us-ascii?Q?dWlVYH30bdvYa0SB/ggOzBqbVSU0V85N?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 12:00:47.9915
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f83ba7c8-3c2c-4c67-9be3-08dcb22194db
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003440.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5827

Add Pinctrl support for Xilinx Versal platform.
Driver checks for firmware support to retrieve the Pin information, if it
is supported then proceed further otherwise it returns error saying
operation not supported. Latest Xilinx Platform Management Firmware must
be used to make use of the Pinctrl driver for Versal platform.

Signed-off-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
---
 drivers/pinctrl/pinctrl-zynqmp.c | 97 ++++++++++++++++++++++++++++++--
 1 file changed, 92 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-zynqmp.c b/drivers/pinctrl/pinctrl-zynqmp.c
index 3c6d56fdb8c9..2b9f8db49a15 100644
--- a/drivers/pinctrl/pinctrl-zynqmp.c
+++ b/drivers/pinctrl/pinctrl-zynqmp.c
@@ -10,6 +10,7 @@
 
 #include <dt-bindings/pinctrl/pinctrl-zynqmp.h>
 
+#include <linux/bitfield.h>
 #include <linux/bitmap.h>
 #include <linux/init.h>
 #include <linux/module.h>
@@ -44,6 +45,12 @@
 #define DRIVE_STRENGTH_8MA	8
 #define DRIVE_STRENGTH_12MA	12
 
+#define VERSAL_LPD_PIN_PREFIX		"LPD_MIO"
+#define VERSAL_PMC_PIN_PREFIX		"PMC_MIO"
+
+#define VERSAL_PINCTRL_ATTR_NODETYPE_MASK	GENMASK(19, 14)
+#define VERSAL_PINCTRL_NODETYPE_LPD_MIO		BIT(0)
+
 /**
  * struct zynqmp_pmux_function - a pinmux function
  * @name:	Name of the pin mux function
@@ -93,6 +100,8 @@ struct zynqmp_pctrl_group {
 };
 
 static struct pinctrl_desc zynqmp_desc;
+static u32 family_code;
+static u32 sub_family_code;
 
 static int zynqmp_pctrl_get_groups_count(struct pinctrl_dev *pctldev)
 {
@@ -596,8 +605,12 @@ static int zynqmp_pinctrl_prepare_func_groups(struct device *dev, u32 fid,
 			if (!groups[resp[i]].name)
 				return -ENOMEM;
 
-			for (pin = 0; pin < groups[resp[i]].npins; pin++)
-				__set_bit(groups[resp[i]].pins[pin], used_pins);
+			for (pin = 0; pin < groups[resp[i]].npins; pin++) {
+				if (family_code == ZYNQMP_FAMILY_CODE)
+					__set_bit(groups[resp[i]].pins[pin], used_pins);
+				else
+					__set_bit((u8)groups[resp[i]].pins[pin] - 1, used_pins);
+			}
 		}
 	}
 done:
@@ -873,6 +886,70 @@ static int zynqmp_pinctrl_prepare_pin_desc(struct device *dev,
 	return 0;
 }
 
+static int versal_pinctrl_get_attributes(u32 pin_idx, u32 *response)
+{
+	struct zynqmp_pm_query_data qdata = {0};
+	u32 payload[PAYLOAD_ARG_CNT];
+	int ret;
+
+	qdata.qid = PM_QID_PINCTRL_GET_ATTRIBUTES;
+	qdata.arg1 = pin_idx;
+
+	ret = zynqmp_pm_query_data(qdata, payload);
+	if (ret)
+		return ret;
+
+	memcpy(response, &payload[1], sizeof(*response));
+
+	return 0;
+}
+
+static int versal_pinctrl_prepare_pin_desc(struct device *dev,
+					   const struct pinctrl_pin_desc **zynqmp_pins,
+					   unsigned int *npins)
+{
+	u32 lpd_mio_pins = 0, attr, nodetype;
+	struct pinctrl_pin_desc *pins, *pin;
+	int ret, i;
+
+	ret = zynqmp_pm_is_function_supported(PM_QUERY_DATA, PM_QID_PINCTRL_GET_ATTRIBUTES);
+	if (ret)
+		return ret;
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
+		ret = versal_pinctrl_get_attributes(i, &attr);
+		if (ret)
+			return ret;
+
+		pin = &pins[i];
+		pin->number = attr;
+		nodetype = FIELD_GET(VERSAL_PINCTRL_ATTR_NODETYPE_MASK, attr);
+		if (nodetype == VERSAL_PINCTRL_NODETYPE_LPD_MIO) {
+			pin->name = devm_kasprintf(dev, GFP_KERNEL, "%s%d",
+						   VERSAL_LPD_PIN_PREFIX, i);
+			lpd_mio_pins++;
+		} else {
+			pin->name = devm_kasprintf(dev, GFP_KERNEL, "%s%d",
+						   VERSAL_PMC_PIN_PREFIX, i - lpd_mio_pins);
+		}
+
+		if (!pin->name)
+			return -ENOMEM;
+	}
+
+	*zynqmp_pins = pins;
+
+	return 0;
+}
+
 static int zynqmp_pinctrl_probe(struct platform_device *pdev)
 {
 	struct zynqmp_pinctrl *pctrl;
@@ -882,9 +959,18 @@ static int zynqmp_pinctrl_probe(struct platform_device *pdev)
 	if (!pctrl)
 		return -ENOMEM;
 
-	ret = zynqmp_pinctrl_prepare_pin_desc(&pdev->dev,
-					      &zynqmp_desc.pins,
-					      &zynqmp_desc.npins);
+	ret = zynqmp_pm_get_family_info(&family_code, &sub_family_code);
+	if (ret < 0)
+		return ret;
+
+	if (family_code == ZYNQMP_FAMILY_CODE) {
+		ret = zynqmp_pinctrl_prepare_pin_desc(&pdev->dev, &zynqmp_desc.pins,
+						      &zynqmp_desc.npins);
+	} else {
+		ret = versal_pinctrl_prepare_pin_desc(&pdev->dev, &zynqmp_desc.pins,
+						      &zynqmp_desc.npins);
+	}
+
 	if (ret) {
 		dev_err(&pdev->dev, "pin desc prepare fail with %d\n", ret);
 		return ret;
@@ -907,6 +993,7 @@ static int zynqmp_pinctrl_probe(struct platform_device *pdev)
 
 static const struct of_device_id zynqmp_pinctrl_of_match[] = {
 	{ .compatible = "xlnx,zynqmp-pinctrl" },
+	{ .compatible = "xlnx,versal-pinctrl" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, zynqmp_pinctrl_of_match);
-- 
2.25.1


