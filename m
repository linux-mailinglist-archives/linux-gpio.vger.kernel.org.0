Return-Path: <linux-gpio+bounces-6636-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D6C8CFE73
	for <lists+linux-gpio@lfdr.de>; Mon, 27 May 2024 12:57:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BD4E31C2162C
	for <lists+linux-gpio@lfdr.de>; Mon, 27 May 2024 10:57:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF55D13B792;
	Mon, 27 May 2024 10:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="l9/UrnP5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2066.outbound.protection.outlook.com [40.107.100.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF4226AFA;
	Mon, 27 May 2024 10:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716807446; cv=fail; b=XHbTmYdH4qffEd/s3JxoY9oNzOBSVRNeo0Fi1MiYmtpKiF8XhO36f+ZbYRgB9JrHFURO7vdxCVSyWamMorSFV2Eq5TO/TltX3kHfGwr7g3FTLk/Dnuyklp8zV6wIVP0ZahkrFMZPF4ToR0NR6wPgLmMx0e60uE8HA+wU6HtHjL8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716807446; c=relaxed/simple;
	bh=za6MkDiMDsJ2aZWe5nl1pcpr0AQMTHa4zfjiDfjwvBo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=f5TVFZCBwkTyECCaMKAS4coVMs7YPECaMkhAqN4cRCzhMapw0F9HjPvIyLq8W5W/I0+G72OPstUqI3If756ZSJP3ivWOuiSH1K3vlQicvpTPritk1DAJTLuior1wpFxfWhtSDywzEMY5QbDWgNlAb2tuBXMGnouJhpmq+dbM1uk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=l9/UrnP5; arc=fail smtp.client-ip=40.107.100.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ev+eQBmUBdfCKriLM6WsXW0gBJmtQYKN2EwyWZg54qVXurEuPEmhPtqm1uNczszlkOlWaRTKkcnOBjVuqhDFFhI3rNMF+GzhYIj0RR4aQt8nt/BjHmhaT0XOlXgiHVXzhTG6XWyJKElINbx87/r4oKNKq/RuSlgkPngVs//fRWjiCB9KdRUyS1HouuInKGjAASOEzFtuhf+rqmuQ+uUP/11RiIk0Rc7qXAiHjx9D1hAF8h8S0AKp2ouW+J0szPbNocQGDHLcUikq5wtu+3Vf+/FbTEADu/WSYdgwYsHrvOkp/29KSoArE0eOIGV8lzqWSsasgXj53qeYfv1ZqdaNPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oG78tLhwINJ9iccBwkkdT1EljNSfYwDlgCdrVYo+q90=;
 b=kJOQog7wgJa73lPH7kBnGNLQFavWxzVTUyPwIrGmfYDKpsaqBNbN/JerCzv/akKzwy8mbOvt4IgmrvNLY+l8Oayg4c63miRh7O7CP944ttZRByNXXy5AO//p2z3B7uId2NMUN0KDqgGpPG28l6u58KwksBhbBj8R0JpIE5VRznZtkAeRpgFmUF9gZb76oFCCeN30ir8qkRFuKtsISaOqQ2YiSUpJ/hJpw6VpBNOoZCGhvv/fYiISn/0odWkfVV/q6h0kIaHSrLyp95K/odc9GZMlUlalC6elcCyNMzdgOWsnG1VM1l+DrJcG7/XIkIMU7M9YCfP1Im+BwgogfImdYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oG78tLhwINJ9iccBwkkdT1EljNSfYwDlgCdrVYo+q90=;
 b=l9/UrnP5z1fLPvR09i3jOon0tUBOZTpziuzDYbWgtjaC2i15KM9kgcX5tYoUUMT59kPmdhvZeTbAktmv9JBnRnRqh/4hSFgzlA4pfUk7ARH+y5L6KP+9nJCJ7ECyFM3l0gEQxQ7FAo8HC25GaxTDJuUyFq11LMdGv8OIpicT1FY=
Received: from SA1P222CA0184.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c4::29)
 by CY8PR12MB7436.namprd12.prod.outlook.com (2603:10b6:930:50::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.29; Mon, 27 May
 2024 10:57:20 +0000
Received: from SN1PEPF0002636D.namprd02.prod.outlook.com
 (2603:10b6:806:3c4:cafe::19) by SA1P222CA0184.outlook.office365.com
 (2603:10b6:806:3c4::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.29 via Frontend
 Transport; Mon, 27 May 2024 10:57:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002636D.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7633.15 via Frontend Transport; Mon, 27 May 2024 10:57:19 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 27 May
 2024 05:57:18 -0500
From: Michal Simek <michal.simek@amd.com>
To: <linux-kernel@vger.kernel.org>, <monstr@monstr.eu>,
	<michal.simek@xilinx.com>, <git@xilinx.com>
CC: Swati Agarwal <swati.agarwal@amd.com>, Linus Walleij
	<linus.walleij@linaro.org>, "moderated list:ARM/ZYNQ ARCHITECTURE"
	<linux-arm-kernel@lists.infradead.org>, "open list:PIN CONTROL SUBSYSTEM"
	<linux-gpio@vger.kernel.org>
Subject: [PATCH] pinctrl: pinctrl-zynqmp: Use pin numbers stored in pin descriptor
Date: Mon, 27 May 2024 12:57:15 +0200
Message-ID: <2413a1f99278d70313960f13daecda9ef54172d8.1716807432.git.michal.simek@amd.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1017; i=michal.simek@amd.com; h=from:subject:message-id; bh=2RyMbQH9rHyZK8vkODIFbxZ5e9EqcMpW3/eY8Ivo3jg=; b=owGbwMvMwCR4yjP1tKYXjyLjabUkhrSQdM7zVz/OUzrZwiFxI1vwzMVVfKuEDe8cOPxUhfOZi FhAS79ZRywLgyATg6yYIou0zZUzeytnTBG+eFgOZg4rE8gQBi5OAZiIyH2G+RkMcnFHHk1lZu1S DbC9Pk8yJHGOBsN8/9g9s+ObE+1r3TY6/tqw+WGNovdcAA==
X-Developer-Key: i=michal.simek@amd.com; a=openpgp; fpr=67350C9BF5CCEE9B5364356A377C7F21FE3D1F91
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636D:EE_|CY8PR12MB7436:EE_
X-MS-Office365-Filtering-Correlation-Id: 78d2e4c7-7588-4339-80c4-08dc7e3bc7c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|36860700004|376005|1800799015|82310400017;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ywgv/tqwC8caDeRmpcM8AhT2TSYwWitEGDoIpNqIyGlFo77LdllBnF/WsCqc?=
 =?us-ascii?Q?eMazWx4X67Bxr7LezEdpKPWc95Zp6/CpGbaMjxvgNif2bTbKXbWVZhrqnv1l?=
 =?us-ascii?Q?xFU1G+kNlUN30aKeRNqxy83UKYIBx8cjskA5V9yq80o+9FVaoBD77tKu8Omk?=
 =?us-ascii?Q?wc3LNFmvkECcYd21YRdGs1jEdLMHCHckb4iC7qHOvY/zDuKxZXxXRxGoFlpO?=
 =?us-ascii?Q?MqL1qVjYUh29uf27RFmXCBYDE0aj4eD8JorMsW2ZJpWXWVsG59O49j3cVS9Q?=
 =?us-ascii?Q?D0FuF3jvDh1UyWLNDuUF92BQ9d3OeN/K/jNEshtZ7MIuATrnI3ZwDs6+uH2a?=
 =?us-ascii?Q?0dQPsDtczwn0agQavS/go2oeuolMkVl21lhXrzaRIoSUeihkFUzv9xwzfoaz?=
 =?us-ascii?Q?si9gcWMCuHTFTg4xjuX4zNiACupN4U61hhIaj4Gjq9fURix6jDF0111buPBB?=
 =?us-ascii?Q?eCWPaIsOdVmnNxaXMMiTMgDp7pAU9F/LRPTj2htM4p5yihHv5R/wkr6ut2dl?=
 =?us-ascii?Q?+Q6BbJxgUYtmDgplcGYMTgPFRc1AZV7hF2m3XzMPGUfXCv6YLImXlCGsRq9k?=
 =?us-ascii?Q?uqaboLLACz5ztbiz4598J3tap9+nZHnQzq9CsMnM0G8Pht+RaexVDEYzqpU9?=
 =?us-ascii?Q?BdvX95EZCm41Gsu67nQDO945ZO2h+YOhdCqMWb8lR41OcNtG2Kr9LeIxUM6a?=
 =?us-ascii?Q?Cn0D4nccF7Oa6zAKaFG2SuMVfJXwIy7PXUBHfEIYwlA9Pmd+EaSxAshFtXTw?=
 =?us-ascii?Q?5z53KGWY5WpmuavB6RJ9wbCOwPEyshxHxmu+V/+Eeol6O8MmCT68SbQRgzoH?=
 =?us-ascii?Q?8lkrR/+OvskRFDDWeS/ZifRAG7m+DNpL0kUi32nCuZwUdb8PIlrgyfLNnyxl?=
 =?us-ascii?Q?9IPUiIFv6+UrvcZ2BqKfdVu71fdkerFlbreVtPoPg5n13QyPklhST2ixsauo?=
 =?us-ascii?Q?wQkEFO1W3Bn/XxbqT7jokgtSTGGZFPCtcPkX4asjVNKp6om7B8A7qPllvHVg?=
 =?us-ascii?Q?woV7q4VkT4VId2t1G30cyXs1cOMSsAKzmtgXdGjWuiM5ZJTGE/H6tNwrtK2i?=
 =?us-ascii?Q?gvUWjsKaJyELDukPHhX/3aM1noYrc6/ZNI0H1kfo61JGO7cFB6rRnjTtKAi4?=
 =?us-ascii?Q?LHlPVBOnQ7WfkH2L+ecJwHG4d3ACaW/tXuN+XvW7laD5CcLtHLhZI/Sx7BQS?=
 =?us-ascii?Q?2blu8R31KfQ3IS/TGS0lKe7695gG10IN1C3BCybRvc4QCX7wZYAxhevM5rJh?=
 =?us-ascii?Q?WYCFYiiU5iFikIHj4CqMWeyxTELuW/kjrLb2l93lWO/J26Lnk1ohSv8TIMim?=
 =?us-ascii?Q?L+34Dvvw7aCOjSx/a2CZgfQlH3q2fep7+oVuCn3a8O2CzV+p332VbfRjh1df?=
 =?us-ascii?Q?JnphHeApY/ULz1SuG0Igi9O0pJL1?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(376005)(1800799015)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2024 10:57:19.9053
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 78d2e4c7-7588-4339-80c4-08dc7e3bc7c7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002636D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7436

From: Swati Agarwal <swati.agarwal@amd.com>

Use pin numbers stored in the pin descriptors instead of index value while
creating the pin groups. Pin Id's are not same as Index values for Xilinx
Versal platform, so use the pin values from descriptor which works for both
ZynqMP and Versal platforms.

Signed-off-by: Swati Agarwal <swati.agarwal@amd.com>
Signed-off-by: Michal Simek <michal.simek@amd.com>
---

 drivers/pinctrl/pinctrl-zynqmp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-zynqmp.c b/drivers/pinctrl/pinctrl-zynqmp.c
index 5c46b7d7ebcb..1ea0353767b7 100644
--- a/drivers/pinctrl/pinctrl-zynqmp.c
+++ b/drivers/pinctrl/pinctrl-zynqmp.c
@@ -718,7 +718,7 @@ static int zynqmp_pinctrl_prepare_group_pins(struct device *dev,
 	int ret;
 
 	for (pin = 0; pin < zynqmp_desc.npins; pin++) {
-		ret = zynqmp_pinctrl_create_pin_groups(dev, groups, pin);
+		ret = zynqmp_pinctrl_create_pin_groups(dev, groups, zynqmp_desc.pins[pin].number);
 		if (ret)
 			return ret;
 	}
-- 
2.40.1


