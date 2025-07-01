Return-Path: <linux-gpio+bounces-22489-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBFCCAEF8E7
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Jul 2025 14:41:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B75AF4A456B
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Jul 2025 12:40:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A286E274B28;
	Tue,  1 Jul 2025 12:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="HVw5phXl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2089.outbound.protection.outlook.com [40.107.243.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B35692749E6;
	Tue,  1 Jul 2025 12:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751373602; cv=fail; b=SwKVNX3bhbK7Fh3roZTgredTA8lBGVJjAiBcotD2S25BCk3iZf7i1tQvLYX3h7FXIXFLAucHxVWTf1Q6JL4d5nrMTjCTJbIiltcHQYuR8C29gouf3Pz9OpHlTPC4ZiurPskPgGz1G6iaa4cQK7iqcB1ReWX9zW9HFTGlX0vlxY0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751373602; c=relaxed/simple;
	bh=pUBHphU30GqL08aBPvFeKHrrvtL+qnt2Ot8vuafflB8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nkLk0Ffsm77DjiaNc5zcYi+2gUJbwmyX4OlmR3JmsDLVGVN1fsntnNd8nSyqcTlWnfdNhR2OmA3Wi1Q+iRYdoHOoPsbaOWGOcO5jCFGcVUApbnkUhn+evphx2QyWMY6uR/bb5jJXajotJi4WGICSI/qKE8uBS4CMWc0gCOerGrg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=HVw5phXl; arc=fail smtp.client-ip=40.107.243.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PUnH/4jCHkrAsazSWZ6pDOn3TjSRaG35XTDOKglNdEQopS68EZAnkY2lnqT6Bn6xvrNH2+efzU0j2+tYX1spiK5kiiS0ev3CDW/sER3gtBQOGmqVqHcY62m/rR3vUaSblUfVA0cW7A3kMcGcEtfl6vKqB229BQt+id/XAIviWfNkc23WgBbCIudFag1bkUAIVpZWxc6Rt3wV+UmWgeiR0sKa68+z7EDtJSQzgUD1Xyjx08BGhjqeTjmgWRjzzsFb+w0t59iuM8PiibbtfUUeCYdEEeRhdNN0b3xzIZAj4syZ98bdeRiaOa7f5/c+ZTJZ5eXCrGEjtkd3c0mEfloN4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=walO4ieAjnSlQmIbG0kq1CD94eH2uL4Fpm9aeKyzreI=;
 b=bGzX+Wv3J1gKpJ6qCqKizazfw8zqBrjR6vY+oV8YxICuCGvV7k2RdLvtdj3Xa3WQjMfk5HH+ap43j6NxUiWtpNw1JG39pDneUOGQga0Gjq1aa/iz593cN8Wekiji+V6O+dxJArY9HRy4KSMD74t4Fq+9rwv0s8Z1HJlHZT/zhW+7VaVjYBMXqIgpHmnx3q9W+H4w9+zWadSTGm4fsXc5XsHKansV4InoHbPaijqPRMUyfZmRiajfY1LyMOPh35lSJOr8DAE5IHQ+VjEAZ3MNrcp70/u2n1ZSYmGdMqBnNIl/+VnsJQfUjnPFc/7iuqGh1bGXGHwifelujvKiT8F6Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=walO4ieAjnSlQmIbG0kq1CD94eH2uL4Fpm9aeKyzreI=;
 b=HVw5phXlvaNhjA2/wMRg4I22Sq57NyXeL2aTHKYhAvAvjOXCyuuIBYNsNt6Djv1O4YaAlhhFkZpCZTAgSImUwp9s0GdPuW/uBn6dlbdMbebvEGSHy+3yoU6Jx9Ux3rp1tR8QjbvkvN7U07ZkstWX2+hsyU42OonMxYfszuXKTNM=
Received: from MW4PR04CA0119.namprd04.prod.outlook.com (2603:10b6:303:83::34)
 by MN0PR12MB6248.namprd12.prod.outlook.com (2603:10b6:208:3c0::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Tue, 1 Jul
 2025 12:39:54 +0000
Received: from SJ1PEPF00001CE4.namprd03.prod.outlook.com
 (2603:10b6:303:83:cafe::70) by MW4PR04CA0119.outlook.office365.com
 (2603:10b6:303:83::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.19 via Frontend Transport; Tue,
 1 Jul 2025 12:39:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CE4.mail.protection.outlook.com (10.167.242.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Tue, 1 Jul 2025 12:39:54 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 1 Jul
 2025 07:39:52 -0500
Received: from xsjarunbala50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 1 Jul 2025 07:39:52 -0500
From: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
To: <michal.simek@amd.com>, <linus.walleij@linaro.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <git@amd.com>
CC: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
Subject: [PATCH 1/3] firmware: xilinx: Add Versal NET platform compatible string
Date: Tue, 1 Jul 2025 05:38:49 -0700
Message-ID: <20250701123851.1314531-2-jay.buddhabhatti@amd.com>
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
Received-SPF: None (SATLEXMB04.amd.com: jay.buddhabhatti@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE4:EE_|MN0PR12MB6248:EE_
X-MS-Office365-Filtering-Correlation-Id: 7763bf50-fa69-48a0-079e-08ddb89c6168
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZAexiTncdfcK78SM+vvBJXXD4SkvsmNKPOnWOrmy4HmyJvRWB34LAXWHm/qQ?=
 =?us-ascii?Q?jkmJyJlOuBul0NF88xy2BFinrKX3P6MyWT1yc90dGDsy8SkpLXMnyW4mOrC5?=
 =?us-ascii?Q?UNERBj036X5BEwAVGLN1NCPPCYsFxadm48JxbnzoeyhF41nHRAPgXEfcx+0S?=
 =?us-ascii?Q?JfEjVclKdTg6mu49fadbF6YRjeXL7FHsdoaa4YvHvvRs60ZKRPwmpWFUDWUi?=
 =?us-ascii?Q?DYBomytOiFFmCtaHcyM5RRtGGxAnAamkN+JgVguSgg1n0kVUkKUP+FZsEUr9?=
 =?us-ascii?Q?OHb8fC9/CGLIzn5v3Pw7V5mXjP8J2KOMtSb8YHWgpeo/t4t3aN8AJZ6M1O1a?=
 =?us-ascii?Q?bjteiuKkuTb2jAGDpGgwRgiJ47toXppbfCR9cuIm30HxwPCtYslLkAsvRd5L?=
 =?us-ascii?Q?4CWPq0bIpTKvyyz5cD1+lxKEnO1T6v7n4yyxHwWYpvYEraCAqkGPiZjuaXFu?=
 =?us-ascii?Q?O1wmR9yDSGFBC4fh4f4bSmw5UKWQ4afCYb39cn//xW/del63zZCCqFCGIfa2?=
 =?us-ascii?Q?4Y6M+Sjm7mVRQJi1Me6hkgKwIaAMLN5EQlPOlWImBgR3hu0SDrS52w8Hs/DG?=
 =?us-ascii?Q?kjWwtvwShEFcrc1P3FWnQTQDDDEyJUJNBvYbovArfNPGYuDKGuxI7rjftHjo?=
 =?us-ascii?Q?fj+B9KJsIhQrbZPkIiVDqkt1KlPJgi8/ytCce835KVtXtQgsMT4Jh0mgj0uB?=
 =?us-ascii?Q?0tMkSJutgTELGHuPAZxagf3VQXd1j5I029T9kU88NA9qBbT7Unwk4HpyRAVK?=
 =?us-ascii?Q?jyaa/PMIY23raGMunpAINGsaVqFdNqTwQwUngEOtOqiegIBH3/RUvpZhg8AO?=
 =?us-ascii?Q?+z/PstME4KEDDueLlXcCvq7afPGIymaLfkpmH749U0pmxJ2Q6drRZGxSCU1z?=
 =?us-ascii?Q?7Hzcmk2NcCu3s9X4vyT4kcVcTBjM2sW6SE+0ivyf/MwhZlkjfI4bwEOoPGSD?=
 =?us-ascii?Q?Ou3KnQIG7tBC6hxxg33dH9C1syLLkOxNeGjP8nJmw07DBqm9PkBeRbVInTbN?=
 =?us-ascii?Q?6pkPGFTVFbik0sQOdE1LmPe+YCHiZLRgTZvQFHJId5EoVvkJlhDBfIbuUAax?=
 =?us-ascii?Q?8I/dSkG1Mn+5OnHeILCpEsaZ8KqkOmCA+WSJ4VGYhnJJ5UdDM9x2g7R7R5NT?=
 =?us-ascii?Q?yMDuwdFTRKifoH4BAyO+Y6o7ZTJulLn+NMLB/W/SFVrc6M7oHo67yYhfMNeL?=
 =?us-ascii?Q?d1YL75aableBcR/8Ae8U+N5ob4AdTUOXhb7pF32Ul5H0FkKMe9rLC8yN9CoK?=
 =?us-ascii?Q?/wf/ISvlPJqCaddePHeM6Nqn+oD7Jeg9izCoAgm1YGgQ9DX+WwFRMlT93xEV?=
 =?us-ascii?Q?tiQJ7STWCVlAaXBVkWdr54ngi9Mm5rhk9skCf04qaXQPw42cpxyLyKLVg5QK?=
 =?us-ascii?Q?Yc3NVy0nbCWC5cWcUfslUC/lALBs56hoo2TmozJSVAK68KduVlHrmI91XNeg?=
 =?us-ascii?Q?kRqbGffSqdzrC9p4PTKyUq+QQYykkS2j/tQdKm0+ndso9TkOaH2LwEf1m8QK?=
 =?us-ascii?Q?EDBBtSQbkytz+CMEf928gcUrD86CGSPDY/Wd?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 12:39:54.3158
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7763bf50-fa69-48a0-079e-08ddb89c6168
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6248

Introduce a compatible string for the Versal NET platform which enables
platform identification based on the compatible property for platform
specific configurations.

Signed-off-by: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
---
 drivers/firmware/xilinx/zynqmp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp.c
index 7356e860e65c..89e0eef219ff 100644
--- a/drivers/firmware/xilinx/zynqmp.c
+++ b/drivers/firmware/xilinx/zynqmp.c
@@ -2103,6 +2103,7 @@ static void zynqmp_firmware_remove(struct platform_device *pdev)
 static const struct of_device_id zynqmp_firmware_of_match[] = {
 	{.compatible = "xlnx,zynqmp-firmware"},
 	{.compatible = "xlnx,versal-firmware"},
+	{.compatible = "xlnx,versal-net-firmware"},
 	{},
 };
 MODULE_DEVICE_TABLE(of, zynqmp_firmware_of_match);
-- 
2.34.1


