Return-Path: <linux-gpio+bounces-8444-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 738779408FB
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jul 2024 08:57:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C384EB24F7F
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jul 2024 06:57:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26D90190462;
	Tue, 30 Jul 2024 06:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="B9wFfaYs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2088.outbound.protection.outlook.com [40.107.220.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D82319007B;
	Tue, 30 Jul 2024 06:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722322573; cv=fail; b=kodgrKswJLIazHrK4QtloLciArMoVkxoA5Hexr/oppfQ+HUd7GkWaHMCdz5r7eXJpnQgaRYqMdfzMkh7QjX2xPGK3hUpLkuhzb+avjZ+jSOVKlak7JSQ+BdYtgM8frZPtwui5CnphdmJhJmTXIKsPXpGx84mGBSx4ZggH0pKiKA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722322573; c=relaxed/simple;
	bh=0EBtVRHt4serazTpODaBBzbM1CQWFB581YXNockqjIo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Fbf5Bl44YY4WN404JNQsjYAcBWT70LhuKfw4N5IAW802jwx7H3pO+SWz2m1EYFdXyjiGbamkmWltdCKNYQRdVw8TQQNnMogL/7jVEBKm2LNpuenuHCsLnWuZ5UW5AHrc+70U+CBIohFoHkhNlCN0/FmEfUrLQZwdcN8Xqn3yVm0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=B9wFfaYs; arc=fail smtp.client-ip=40.107.220.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yNKnD5nO+4JSze0UwOtIXIEuDVf3//jnZqcvYcWHQpjbdFa3JC32GtWH+Bp/cI15x+SZOzqHpEmuJBOG7XhmPEaawGGxTqxD9F7nD2lOkFCaV/VaNWgyPZfywthVWAe/EB/T8/yq416A24COj177OWY/I/BYf3mUCZlctOdnxzD4C98cpqb00KipBy2WnBFSciUbfcUqzk2aq6NAW14RHSxrC9UbTzBTSGvUdYpNX6ZoVQ57vOlw53BFbTnB+srMxdpnumku6Ip4KO569P2g8xsvdD/OnTtTLBj4WKNTC0OmImEpvPg+qRyxxtiaqbkje+swU78oXE4K30wbjW3jlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/mgQnQujlDRhyvJfjgDxSZYbzQSOlQeubMM4Tmo472w=;
 b=LgDalygN4xW7bbL51i+xXIFgkXv1eLLIN93Iqkc2+8pkVesbr0dh5N+esutrzy0X/IsvL2iGT6ixyEg0JrED5pinMybI7112A5YaM63r2jGfIJ48K+9lZeg8H/cHxmoEN7JaVZUJRrc598UB95G2ODI9hZg2RNSHlZZTK6A+3x2SIJa9rQNB56ASBPJll3JgtpmDgVyIHC3aHIjcHwIS38yJtNb2bjkJGo5Vrtbk61ucvRU2VSAtO3xxnTGawRRV35QPRuX6SjYgS0XHYpc+hXaVehVw1ffCIMTtZQWvu0E9uDX1YJEh/qC51kcJU2tWrGTJxygKFgVzcRn+pAi4Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/mgQnQujlDRhyvJfjgDxSZYbzQSOlQeubMM4Tmo472w=;
 b=B9wFfaYs2q0xMQV3Rndh4TDFgaURy4MICmBcWrtscHZPo1vv8JWygmvoHxDFEju4XKMuignacm4ecDfjHXM5Z5dVrIPZpDT9g9FHHjJ10oLnDh22m+uuIfR6j7epbeqr0go12NFcMheEL7cZZevfPWNfDG/LCnqnaKmXqk3zQpQ=
Received: from DS7PR03CA0102.namprd03.prod.outlook.com (2603:10b6:5:3b7::17)
 by MW4PR12MB7165.namprd12.prod.outlook.com (2603:10b6:303:21b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Tue, 30 Jul
 2024 06:56:09 +0000
Received: from DS2PEPF00003440.namprd02.prod.outlook.com
 (2603:10b6:5:3b7:cafe::fc) by DS7PR03CA0102.outlook.office365.com
 (2603:10b6:5:3b7::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.34 via Frontend
 Transport; Tue, 30 Jul 2024 06:56:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS2PEPF00003440.mail.protection.outlook.com (10.167.18.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Tue, 30 Jul 2024 06:56:09 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 30 Jul
 2024 01:56:07 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 30 Jul
 2024 01:56:06 -0500
Received: from xhdlakshmis40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 30 Jul 2024 01:56:02 -0500
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
Subject: [PATCH v2 3/3] pinctrl: pinctrl-zynqmp: Add support for Versal platform
Date: Tue, 30 Jul 2024 12:25:48 +0530
Message-ID: <20240730065548.1371518-4-sai.krishna.potthuri@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240730065548.1371518-1-sai.krishna.potthuri@amd.com>
References: <20240730065548.1371518-1-sai.krishna.potthuri@amd.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: sai.krishna.potthuri@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003440:EE_|MW4PR12MB7165:EE_
X-MS-Office365-Filtering-Correlation-Id: 55170644-7674-4eb5-6679-08dcb064b0fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UH6CjGAA4h+GFMJL0tBQQKLBIvOxddR5GOGWGA98GMt8R0SSvsJ643dJa4u9?=
 =?us-ascii?Q?+00woDzf5kkTmK6sCmHITZopA+TqdUX20/pqL/HwwaRiSjJBX69zpFO7iZxX?=
 =?us-ascii?Q?52BFoaikEV6c9TcZOvkweN+5I9Fgm7eb3uqQ7xJEn+lAWNIsfSb/PiHE/EHI?=
 =?us-ascii?Q?2LaSlot5XmOKvJGk6LCXEsE+2Aq52xWObEDetlRqxemVFdUUnZafGnCISS1l?=
 =?us-ascii?Q?dCgZOtBHcfLkiF5baUjUqEODqtWAnqFJY6w7HO7Z/p+DzUTd44Y9iG2XZiIK?=
 =?us-ascii?Q?fXpSIq2NpMOjhYpA99i0aJuBLgER3oUUvDRJaYTzz7/BJCBAyiaJjw/1I8k2?=
 =?us-ascii?Q?AINNd+4gUVjw7cNLRMhyM4yy/hpDAyxtYp4kAqu1FqDJRqHxHOIOOxOea2zw?=
 =?us-ascii?Q?lEwS4ewHsq0Qh5mpOz6VUCvleVIY3JPRU9kgMTt1grtQSvT2gPx9JQmZRO4k?=
 =?us-ascii?Q?wnuo5I3NvgnxiZkbzwxxUWlpXJLHjN2FluKQaeU6u5E4Y5J+4WGO5qG2Fp/t?=
 =?us-ascii?Q?5n47xQzWHCCEiWMRKEBq71RrW8xAepo1ojbieg6v7ZhPzpeDcIOxI4PQCmtF?=
 =?us-ascii?Q?C/WbnUEPlqkEi8FrA7gnZ5ZX7sc8MJVzo9AoPwyHQdvbhU9YBdEkdqKMacKg?=
 =?us-ascii?Q?7xo7mj+66mFv2r71pXzzJPz0QL3TQv5f6sgun658OSnYbaLXchPlRyvCtq1g?=
 =?us-ascii?Q?n0pWEMr2JiNbKJgwfvNfrMeg1NBPSXJdvuo8lcfxmAvQk1TlrAM2mjUpjBZt?=
 =?us-ascii?Q?8O1BcyOPx9N15Q9AAnwIMrnQW652AHXhO44Z0r6V/NxL4ARxM1B1DpxFiqB6?=
 =?us-ascii?Q?CpkdOZOG4MqYRnUXjxfxEEp4hrswmLcojl6RfnJwFEdhlQlyz8vPP+YK+tFX?=
 =?us-ascii?Q?sPVjqE0H/YN9iGBGYZF5NXqfFYYjwmQm5JMP/GGGHWEBdYyvNvUpvfh9/IgK?=
 =?us-ascii?Q?ZDmFEnpe02qRkhz3i9M4R2yBhUhZDBnVyClDVtxnG1Xu1V5N5hWgSEU+0cSy?=
 =?us-ascii?Q?CWpkYXmJjn9AsDKr8+ARGzhbMaqGnjC/qGLdOGicQrP8VnC2jv1OLwA0J+0j?=
 =?us-ascii?Q?SAYNdY0ID2nrD36HZy2DijWVe9bf113KhyvxUMzBuu3GwnChKOkFUfdJAhc2?=
 =?us-ascii?Q?jRmiR9csITwZjJxgYGiAcmkNwi9rZBORLrAhBBS4Rz5PJv1/5LOHbQyiR6dt?=
 =?us-ascii?Q?mqcjfUy2sbpi+EwrHAg2ExnHqld8oMnHp2Zv9pXXRxV8ntH/Y28s2n6txLtd?=
 =?us-ascii?Q?G+BzoH0K+HYc3X4ckKvSE51yOMFR64LIIy0xRZiF5K4wfNpYU5XqhSXCPgoC?=
 =?us-ascii?Q?Zurrf0YosrdKnW9TgksJKcoq4nz8aziOIXMs+JDyWW26VRrvtxk+uGykCsqF?=
 =?us-ascii?Q?qkQEYGFwXNZ2stHTvuYmN/jwMg3Igox+RMROv94TiGy4wy0+sQheVPJvRtCi?=
 =?us-ascii?Q?iF7TMwV4fD3MP16Ek6s8Kt5eKutdgIrB?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2024 06:56:09.0689
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55170644-7674-4eb5-6679-08dcb064b0fb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003440.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7165

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


