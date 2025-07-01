Return-Path: <linux-gpio+bounces-22488-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EFA4AEF8EB
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Jul 2025 14:41:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9DE3A48378A
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Jul 2025 12:40:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AEF62749EC;
	Tue,  1 Jul 2025 12:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="RfVUWE9Q"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2071.outbound.protection.outlook.com [40.107.223.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C422749C5;
	Tue,  1 Jul 2025 12:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751373600; cv=fail; b=ouf3QnuOdF3YEaZnM1NL8Q8jWkBoyIWwXJPlADdsIKPalmVUG2uHZ7fN+mAbZdgEq+BPxCVcCcy7K13SbvXVX1dRqWWGIF2NJv2HB9ILCN0iBp9XnBeXGmSqqrrDCYKNs2mPhAy3UmW0uIjeKqGjDslOJATzKGEdYscBxd22G4Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751373600; c=relaxed/simple;
	bh=/3UH7IAI6govNjy+N/5L4ozr/+OdBEQDTROh8DjjhnU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kIpk9DURYHex4YzrnV/uF2VhQ5BHBzu6cHnDXJ28UaXHsat2HZj820hlbWL2ytoDhUXU/dD4QDLBZZrv1JMjBdsnCG2ozsYXOEqAWwi7+DOmxFqmR7xWtr7aL2y2V0yDt08RwRfULOKk5rR0fopje8/VXb5oo3JGQzHVvgEaRzA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=RfVUWE9Q; arc=fail smtp.client-ip=40.107.223.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SMxbSDG0DWXu6YRxm3O7rI8Iy2CcMofrp8kZ8cUdwJ7pEmO3fb4CR8Y9Fi2EmCseAk0GKb9O+ClELPuYU9TjMrS9ytq4mowE4V1uFZGawA8ajQxmwCq1ULgEtpc3w/caUectgmhlgqQNjIxmmfUnoX8qo57CEYUItFXMU7663oVXtLVnjoWBSmPDCIHNoeRxAcOKY0cKNr6kYG1WIVO6Vd56WlbyIgTZzJqe619Htraic/YWFqRgm4CUwcAlvqjCUyr1FXhFnZdYVWzxLqi650tXFCO1hKUy92N3bjcnfDkgqTsn/IfKUia703NsehwXtOXc4SNs20tH0CBiZjsKRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5bUodoDEB9M6C/kNFoF7PwuLtrAZCuStWYe8oa8hRCM=;
 b=gnKl02D61ih0iXxHZMzhvowe33R8hHTDs8iTigBMSeKDWiZCFi0Y98PkWepOaQF/2/zUamx101c7IFxZyK/lt1VubWx5UbcjAN7hJV30EUN2MainXmUVtcSG0J86R56BGiTbXZ4JvyY100lQjOwX0Id8qJIPj4bR2z4I3MpT5rkURMi4zj1CHILCcgQqwSUrFUXZVdRM3icrUuVmLO/GUNztVUlOzbxMg+etaK6tV02cH18JOqZrt/1dF+ZClx9pNHwrIsJ6w1Xcs5i490B+MshG+R4pf0bWqK0CinMLHRNXYwRkTDnPvVJzjtfqNVrQ7qYnyi4CNxoFG7U4dfXgpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5bUodoDEB9M6C/kNFoF7PwuLtrAZCuStWYe8oa8hRCM=;
 b=RfVUWE9Q4rdJGGd5RNsysUw7yuKJR5FH+O0bphvJlecJ4JqiW3+X0oXz6WNrdn+V1zyvJox6+rzSqZUX7ywJDywRkBLw/1TfRnaHrE19JzWLERkgipyZ6L/7T6L0P/8JPsjs/5BHiojFSCKRYrM3EwhAGSN1bZ2U1dQE5bbOc2c=
Received: from MW4PR04CA0099.namprd04.prod.outlook.com (2603:10b6:303:83::14)
 by CYYPR12MB8870.namprd12.prod.outlook.com (2603:10b6:930:bb::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.26; Tue, 1 Jul
 2025 12:39:56 +0000
Received: from SJ1PEPF00001CE4.namprd03.prod.outlook.com
 (2603:10b6:303:83:cafe::16) by MW4PR04CA0099.outlook.office365.com
 (2603:10b6:303:83::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.19 via Frontend Transport; Tue,
 1 Jul 2025 12:39:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CE4.mail.protection.outlook.com (10.167.242.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Tue, 1 Jul 2025 12:39:56 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 1 Jul
 2025 07:39:55 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 1 Jul
 2025 07:39:54 -0500
Received: from xsjarunbala50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 1 Jul 2025 07:39:53 -0500
From: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
To: <michal.simek@amd.com>, <linus.walleij@linaro.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <git@amd.com>
CC: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
Subject: [PATCH 3/3] drivers: firmware: xilinx: Switch to new family code in zynqmp_pm_get_family_info()
Date: Tue, 1 Jul 2025 05:38:51 -0700
Message-ID: <20250701123851.1314531-4-jay.buddhabhatti@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250701123851.1314531-1-jay.buddhabhatti@amd.com>
References: <20250701123851.1314531-1-jay.buddhabhatti@amd.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE4:EE_|CYYPR12MB8870:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ba55613-6cc7-45f5-f58d-08ddb89c6274
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NfhL4vjV6byAYEfqxkZf2DIqcUV5BUrLz3QRR7hoomOClEixCtDWFBoOtJrI?=
 =?us-ascii?Q?pjS7h+Cjw+L9VeEQw+GuczXdZ5+VL5I8SaR/PDRM/Z/bTwOC85+ABSjiOY5Q?=
 =?us-ascii?Q?o5wDxnrkcSefxErkHRcdl8253RNxeKFjZdrhsO+3fD6swLbiALg96UaR4LEn?=
 =?us-ascii?Q?zOG7OytGI+eHFB890EMToQSwAWtBkNn5gGZ5cKMTxc/tI3GUs0AD+pWy2AND?=
 =?us-ascii?Q?imDnH4u67fMjGYODgp1FwX8VI9+celzpUSlomTaZv+w9Q1PvQP6efQfhCNoU?=
 =?us-ascii?Q?E8OkRjZoku3mg2SpyiQoLFMaOTnWmNFvrM5qhipfS32qejrRAjJiDbgpxXQv?=
 =?us-ascii?Q?EYr+NJmDS/y8VSatqDU/La6P5NnUBvbb8Sfr5xY0+61S+lATDqx717Pei0jV?=
 =?us-ascii?Q?ANp2YZD+r8HYTr1INToiPydizXrPO8ZEhpE6MOyyUGSFng8uRBbR+BmNHMMt?=
 =?us-ascii?Q?hK2EK1qEOZP6IzW7Ke2uH+y2qvO1MqoLzGyEFn/3gdx48W5aL+yLhGFpgsS2?=
 =?us-ascii?Q?Yc5SQRGMpC9RSp22+8ym/AREPsH9xKz/x0TQiPZRWzS6UYKh7O72gpJMnouP?=
 =?us-ascii?Q?OdzR2EswB5q7wtkIgJ8br8Lmhv4ROuBF6hFC8VO8CySKEgJbCgUS/qCvXxd3?=
 =?us-ascii?Q?nXYcG1BYktkY3i7F+R1z2soZ7LKUzp+/yulyZh6oaUi9RpETnIjnn56mVek3?=
 =?us-ascii?Q?PSUG312vQlvecgXmX5zYhhgGX9QSsMU6qiFqbXnbHics0DnWpOMfagyu22nw?=
 =?us-ascii?Q?ShRGwxaZHqE+3Zt6ogqIfi1tEYea2oVnDs0nIHkM4y/GSrvmvAadPB0za6fW?=
 =?us-ascii?Q?OC1ZS1BMBIVLhzxUQOhOlug0O/Of9wBB3OKn7ihU9XJHDqXwnkCoX33+0o1Y?=
 =?us-ascii?Q?dmWcPoPK8dLt71OLn5Ff0neQ4g8tgzheTKEb/DjJhZFoc7L6xBWfxUncOs7x?=
 =?us-ascii?Q?T4CEKzowF0OPFAiGIKE7B8g8PAWYP9jGw2i7oqZdEQvQxkTFrofk+hBGVnUv?=
 =?us-ascii?Q?r2BEXzUCG5IVulskZ96CLuwlOMrEF8T59JV7shKHC7hPH08JrGFTkW3I4zyK?=
 =?us-ascii?Q?ipA6PDTmd3BiSWJH8rM8eA4Vlom4PQMChn2jmwit58WMEzHFEooBxO0DpXOY?=
 =?us-ascii?Q?RBpE3MGACNn03iyxnaBmatvNbXnlbdMwRdEburPplofnLnGT3XWhv1cDyVNk?=
 =?us-ascii?Q?lQ4BCstwWLhM8TYEW5QvRcLYRXwksfBb2f29Cx/Bi4pogYJHheX/uxPTafyX?=
 =?us-ascii?Q?yyFQUv86m08Kj4SmYzJWua5bE0g4EM6awMEoz8TA6nWAwY0rJCUliL/AL/Uq?=
 =?us-ascii?Q?iAnKKBJNgAKxzH6yUSj3mhsRX2RrQQHHE/UU8phVSHrxEtVL8ibPlyeujfku?=
 =?us-ascii?Q?HZ2PptoMpB+4nYQXhproHb6IGGRGz1F2KegX3SG4spqqBV4PlZCxJI2d3hFB?=
 =?us-ascii?Q?l5SVsF0jQY8TsPospAZoQvygRtZ21Ta5d7Gdxvhclr+AdIozqPOX0sTDjDB5?=
 =?us-ascii?Q?YHc6i6vGHs9Og49nH3euUSm4znRA4RWEUUEH?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 12:39:56.1376
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ba55613-6cc7-45f5-f58d-08ddb89c6274
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8870

Currently, the family code and subfamily code are derived from the
PMC_TAP_IDCODE register. Versal, Versal NET share the same family
code. Also some platforms share the same subfamily code, making it
difficult to distinguish between platforms. Update
zynqmp_pm_get_family_info() to use IDs derived from the compatible
string instead of silicon ID codes derived from PMC_TAP_IDCODE register.

Signed-off-by: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
---
 drivers/firmware/xilinx/zynqmp.c        | 42 ++++++++++---------------
 drivers/pinctrl/pinctrl-zynqmp.c        |  7 ++---
 drivers/soc/xilinx/xlnx_event_manager.c |  8 ++---
 drivers/soc/xilinx/zynqmp_power.c       | 10 +++---
 include/linux/firmware/xlnx-zynqmp.h    | 15 ++-------
 5 files changed, 31 insertions(+), 51 deletions(-)

diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp.c
index 2fb1c29314b7..17156eea78f2 100644
--- a/drivers/firmware/xilinx/zynqmp.c
+++ b/drivers/firmware/xilinx/zynqmp.c
@@ -472,8 +472,6 @@ int zynqmp_pm_invoke_fn(u32 pm_api_id, u32 *ret_payload, u32 num_args, ...)
 
 static u32 pm_api_version;
 static u32 pm_tz_version;
-static u32 pm_family_code;
-static u32 pm_sub_family_code;
 
 int zynqmp_pm_register_sgi(u32 sgi_num, u32 reset)
 {
@@ -540,32 +538,18 @@ EXPORT_SYMBOL_GPL(zynqmp_pm_get_chipid);
 /**
  * zynqmp_pm_get_family_info() - Get family info of platform
  * @family:	Returned family code value
- * @subfamily:	Returned sub-family code value
  *
  * Return: Returns status, either success or error+reason
  */
-int zynqmp_pm_get_family_info(u32 *family, u32 *subfamily)
+int zynqmp_pm_get_family_info(u32 *family)
 {
-	u32 ret_payload[PAYLOAD_ARG_CNT];
-	u32 idcode;
-	int ret;
-
-	/* Check is family or sub-family code already received */
-	if (pm_family_code && pm_sub_family_code) {
-		*family = pm_family_code;
-		*subfamily = pm_sub_family_code;
-		return 0;
-	}
+	if (!active_platform_fw_data)
+		return -ENODEV;
 
-	ret = zynqmp_pm_invoke_fn(PM_GET_CHIPID, ret_payload, 0);
-	if (ret < 0)
-		return ret;
+	if (!family)
+		return -EINVAL;
 
-	idcode = ret_payload[1];
-	pm_family_code = FIELD_GET(FAMILY_CODE_MASK, idcode);
-	pm_sub_family_code = FIELD_GET(SUB_FAMILY_CODE_MASK, idcode);
-	*family = pm_family_code;
-	*subfamily = pm_sub_family_code;
+	*family = active_platform_fw_data->family_code;
 
 	return 0;
 }
@@ -1246,8 +1230,13 @@ int zynqmp_pm_pinctrl_set_config(const u32 pin, const u32 param,
 				 u32 value)
 {
 	int ret;
+	u32 pm_family_code;
+
+	ret = zynqmp_pm_get_family_info(&pm_family_code);
+	if (ret)
+		return ret;
 
-	if (pm_family_code == ZYNQMP_FAMILY_CODE &&
+	if (pm_family_code == PM_ZYNQMP_FAMILY_CODE &&
 	    param == PM_PINCTRL_CONFIG_TRI_STATE) {
 		ret = zynqmp_pm_feature(PM_PINCTRL_CONFIG_PARAM_SET);
 		if (ret < PM_PINCTRL_PARAM_SET_VERSION) {
@@ -2016,6 +2005,7 @@ static int zynqmp_firmware_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct zynqmp_devinfo *devinfo;
+	u32 pm_family_code;
 	int ret;
 
 	ret = get_set_conduit_method(dev->of_node);
@@ -2059,8 +2049,8 @@ static int zynqmp_firmware_probe(struct platform_device *pdev)
 	pr_info("%s Platform Management API v%d.%d\n", __func__,
 		pm_api_version >> 16, pm_api_version & 0xFFFF);
 
-	/* Get the Family code and sub family code of platform */
-	ret = zynqmp_pm_get_family_info(&pm_family_code, &pm_sub_family_code);
+	/* Get the Family code of platform */
+	ret = zynqmp_pm_get_family_info(&pm_family_code);
 	if (ret < 0)
 		return ret;
 
@@ -2087,7 +2077,7 @@ static int zynqmp_firmware_probe(struct platform_device *pdev)
 
 	zynqmp_pm_api_debugfs_init();
 
-	if (pm_family_code == VERSAL_FAMILY_CODE) {
+	if (pm_family_code != PM_ZYNQMP_FAMILY_CODE) {
 		em_dev = platform_device_register_data(&pdev->dev, "xlnx_event_manager",
 						       -1, NULL, 0);
 		if (IS_ERR(em_dev))
diff --git a/drivers/pinctrl/pinctrl-zynqmp.c b/drivers/pinctrl/pinctrl-zynqmp.c
index fddf0fef4b13..71eaac81deb1 100644
--- a/drivers/pinctrl/pinctrl-zynqmp.c
+++ b/drivers/pinctrl/pinctrl-zynqmp.c
@@ -100,7 +100,6 @@ struct zynqmp_pctrl_group {
 
 static struct pinctrl_desc zynqmp_desc;
 static u32 family_code;
-static u32 sub_family_code;
 
 static int zynqmp_pctrl_get_groups_count(struct pinctrl_dev *pctldev)
 {
@@ -605,7 +604,7 @@ static int zynqmp_pinctrl_prepare_func_groups(struct device *dev, u32 fid,
 				return -ENOMEM;
 
 			for (pin = 0; pin < groups[resp[i]].npins; pin++) {
-				if (family_code == ZYNQMP_FAMILY_CODE)
+				if (family_code == PM_ZYNQMP_FAMILY_CODE)
 					__set_bit(groups[resp[i]].pins[pin], used_pins);
 				else
 					__set_bit((u8)groups[resp[i]].pins[pin] - 1, used_pins);
@@ -958,11 +957,11 @@ static int zynqmp_pinctrl_probe(struct platform_device *pdev)
 	if (!pctrl)
 		return -ENOMEM;
 
-	ret = zynqmp_pm_get_family_info(&family_code, &sub_family_code);
+	ret = zynqmp_pm_get_family_info(&family_code);
 	if (ret < 0)
 		return ret;
 
-	if (family_code == ZYNQMP_FAMILY_CODE) {
+	if (family_code == PM_ZYNQMP_FAMILY_CODE) {
 		ret = zynqmp_pinctrl_prepare_pin_desc(&pdev->dev, &zynqmp_desc.pins,
 						      &zynqmp_desc.npins);
 	} else {
diff --git a/drivers/soc/xilinx/xlnx_event_manager.c b/drivers/soc/xilinx/xlnx_event_manager.c
index a572d15f6161..6fdf4d14b7e7 100644
--- a/drivers/soc/xilinx/xlnx_event_manager.c
+++ b/drivers/soc/xilinx/xlnx_event_manager.c
@@ -77,17 +77,17 @@ struct registered_event_data {
 
 static bool xlnx_is_error_event(const u32 node_id)
 {
-	u32 pm_family_code, pm_sub_family_code;
+	u32 pm_family_code;
 
-	zynqmp_pm_get_family_info(&pm_family_code, &pm_sub_family_code);
+	zynqmp_pm_get_family_info(&pm_family_code);
 
-	if (pm_sub_family_code == VERSAL_SUB_FAMILY_CODE) {
+	if (pm_family_code == PM_VERSAL_FAMILY_CODE) {
 		if (node_id == VERSAL_EVENT_ERROR_PMC_ERR1 ||
 		    node_id == VERSAL_EVENT_ERROR_PMC_ERR2 ||
 		    node_id == VERSAL_EVENT_ERROR_PSM_ERR1 ||
 		    node_id == VERSAL_EVENT_ERROR_PSM_ERR2)
 			return true;
-	} else {
+	} else if (pm_family_code == PM_VERSAL_NET_FAMILY_CODE) {
 		if (node_id == VERSAL_NET_EVENT_ERROR_PMC_ERR1 ||
 		    node_id == VERSAL_NET_EVENT_ERROR_PMC_ERR2 ||
 		    node_id == VERSAL_NET_EVENT_ERROR_PMC_ERR3 ||
diff --git a/drivers/soc/xilinx/zynqmp_power.c b/drivers/soc/xilinx/zynqmp_power.c
index ae59bf16659a..9b7b2858b22a 100644
--- a/drivers/soc/xilinx/zynqmp_power.c
+++ b/drivers/soc/xilinx/zynqmp_power.c
@@ -285,7 +285,7 @@ static int register_event(struct device *dev, const enum pm_api_cb_id cb_type, c
 static int zynqmp_pm_probe(struct platform_device *pdev)
 {
 	int ret, irq;
-	u32 pm_api_version, pm_family_code, pm_sub_family_code, node_id;
+	u32 pm_api_version, pm_family_code, node_id;
 	struct mbox_client *client;
 
 	ret = zynqmp_pm_get_api_version(&pm_api_version);
@@ -315,14 +315,16 @@ static int zynqmp_pm_probe(struct platform_device *pdev)
 		INIT_WORK(&zynqmp_pm_init_suspend_work->callback_work,
 			  zynqmp_pm_init_suspend_work_fn);
 
-		ret = zynqmp_pm_get_family_info(&pm_family_code, &pm_sub_family_code);
+		ret = zynqmp_pm_get_family_info(&pm_family_code);
 		if (ret < 0)
 			return ret;
 
-		if (pm_sub_family_code == VERSALNET_SUB_FAMILY_CODE)
+		if (pm_family_code == PM_VERSAL_NET_FAMILY_CODE)
 			node_id = PM_DEV_ACPU_0_0;
-		else
+		else if (pm_family_code == PM_VERSAL_FAMILY_CODE)
 			node_id = PM_DEV_ACPU_0;
+		else
+			return -ENODEV;
 
 		ret = register_event(&pdev->dev, PM_NOTIFY_CB, node_id, EVENT_SUBSYSTEM_RESTART,
 				     false, subsystem_restart_event_callback);
diff --git a/include/linux/firmware/xlnx-zynqmp.h b/include/linux/firmware/xlnx-zynqmp.h
index f112cd211c5e..4bfe314e99ef 100644
--- a/include/linux/firmware/xlnx-zynqmp.h
+++ b/include/linux/firmware/xlnx-zynqmp.h
@@ -51,22 +51,11 @@
 
 #define PM_PINCTRL_PARAM_SET_VERSION	2
 
-#define ZYNQMP_FAMILY_CODE 0x23
-#define VERSAL_FAMILY_CODE 0x26
-
 /* Family codes */
 #define PM_ZYNQMP_FAMILY_CODE 0x1 /* ZynqMP family code */
 #define PM_VERSAL_FAMILY_CODE 0x2 /* Versal family code */
 #define PM_VERSAL_NET_FAMILY_CODE 0x3 /* Versal NET family code */
 
-/* When all subfamily of platform need to support */
-#define ALL_SUB_FAMILY_CODE		0x00
-#define VERSAL_SUB_FAMILY_CODE		0x01
-#define VERSALNET_SUB_FAMILY_CODE	0x03
-
-#define FAMILY_CODE_MASK	GENMASK(27, 21)
-#define SUB_FAMILY_CODE_MASK	GENMASK(20, 19)
-
 #define API_ID_MASK		GENMASK(7, 0)
 #define MODULE_ID_MASK		GENMASK(11, 8)
 #define PLM_MODULE_ID_MASK	GENMASK(15, 8)
@@ -569,7 +558,7 @@ int zynqmp_pm_invoke_fw_fn(u32 pm_api_id, u32 *ret_payload, u32 num_args, ...);
 #if IS_REACHABLE(CONFIG_ZYNQMP_FIRMWARE)
 int zynqmp_pm_get_api_version(u32 *version);
 int zynqmp_pm_get_chipid(u32 *idcode, u32 *version);
-int zynqmp_pm_get_family_info(u32 *family, u32 *subfamily);
+int zynqmp_pm_get_family_info(u32 *family);
 int zynqmp_pm_query_data(struct zynqmp_pm_query_data qdata, u32 *out);
 int zynqmp_pm_clock_enable(u32 clock_id);
 int zynqmp_pm_clock_disable(u32 clock_id);
@@ -649,7 +638,7 @@ static inline int zynqmp_pm_get_chipid(u32 *idcode, u32 *version)
 	return -ENODEV;
 }
 
-static inline int zynqmp_pm_get_family_info(u32 *family, u32 *subfamily)
+static inline int zynqmp_pm_get_family_info(u32 *family)
 {
 	return -ENODEV;
 }
-- 
2.34.1


